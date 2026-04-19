# File Sharing with Samba (Lab 8)
In this lab we will configure a basic **Network Attached Storage (NAS)** using **Samba**, allowing both Windows and Linux systems to share files over a network. Samba implements the SMB protocol, which is the same protocol used by Windows file sharing and many commercial NAS systems such as Synology.

By the end of this lab students will build a simple file sharing server that can accessed by multiple machines on the network.

# Environment
Debian 13.2 Server VM
VMware Workstation Pro
Local virtual network created in previous labs

# Target Audience
This labs is beginner friendly and is designed for students who are new to Linux systems administration and network services.

# Learning Objectives
- Understand what a NAS (Network Attached Storage) is
- Install and configure Samba on Linux
- Create and configure a shared network directory
- Connect to a Linux file share on Windows
- Understand basic Linux file permissions
- Understand how file sharing works in mixed OS environments
- Configure authenticated Samaba users
- Map persistent network drives in Windows

## Required Software
* VMware Workstation Pro
* Debian 13.2
* Windows VM or Windows host machine
* Terminal access to the Debian VM

## Part 1 - Prep the Server
Before configuring Samba, we must ensure the Debian system is updated and ready.

Update the system:
`sudo apt update`
`sudo apt upgrade`

Install Samba:
`sudo apt install samba`

Verify Samba installed correctly:
`smbd --version`

*You should now have the Samba service installed on the system.*

## Part 2 - Creating a Shared Directory
Next we will create the directory that will be shared across the network.

Create a directory for the shared storage:
`sudo mkdir -p /srv/shared`

Set basic permission for the folder:
`sudo chmod 777 /srv/shared`

*Note:*
*These permissions are intentionally permissive for the purpose of this lab. In real environments, permission should be restricted.

Lets double check to make sure the folder exists:
`ls -ld /srv/shared`

## Part 3 - Configure Samba
Now we will configure Samba to share the directory across the network.

Open the Samba configuration file:
`sudo nano /etc/samba/smb.conf`

Scroll or arrow down to the bottom of the file and add the following configs:

    [Shared]
    path = /srv/shared
    browseable = yes
    read only = no
    guest ok = yes

Explanation:
* **path** - directory being shared
* **browseable** - allows the share to be visable on the network
* **read only** - allows writing to the share
* **guest ok** - allow access without authentication (this is for lab simplicity but in a real environment there would be some sort of authentication)

Save and exit the file.
Ctrl + O then Ctrl + X

Restart the Samba service:
`sudo systemctl restart smbd`

Verify systemctl status smbd:
`sudo systemctl status smbd`

## Part 4 - Accessing the Share from Windows
Lets connect to the Samba share from a Windows machine.

First determine the Debian server IP address:
`ip a`

Locate the IP address of your network interface.

On a Windows machine (This can either be another VM or from your host computer) open File Explorer and enter the following in the address bar:
`\\Server_IP\Shared`

Example:
`\\192.168.1.130\Shared`

If configured correctly, the shared folder should now appear.
Try creating a test file inside the share.

## Part 5 - Testing File Sharing
To verify the system works correctly:

1. Create a file form the Windows machine.
2. Verify the file appears on the Debian Server.

On Debian we will check if the file was written:
`ls /srv/shared`

You should see the file created from Windows.

You can also test creating a file from Debian (It may take a few minutes to propagate):
`touch /srv/shared/test_from_linux.txt`

Refresh the Windows share to verify the file appears.

## Part 6 - Creating a Samba User
In real environments, file shares are typically protected with user authentication instead of guest access.

First create a local user that will access the share.
`sudo adduser sambauser`
Follow the prompts to set a password.

Add the User to Samba
We need to add the user to the Samaba password database:
`sudo smbpasswd -a sambauser`

Enable the User:
`sudo smbpasswd -e sambauser`

Restart Samba:
`sudo systemctl restart smbd`

Connect Using Creds
From Windows, open File Explorer and connect again:
`\\SERVER_ip\Shared`

Windows may prompt for credentials.

Enter:
Username:
`sambauser`
Password:
`(password you created for this user earlier)`

## Part 7 - Mapping a Network Drive
Mapping a network drive makes the share appear as a normal driver letter on the system.
1. Open **File Explorer**
2. Click **This PC**
3. Select **Map network drive**

Choose a drive letter (example: Z:)
Folder path:
`\\SERVER_IP\Shared`

Enable:
`Reconnect at sign-in`
Click **Finish.**
The share will now appear as a permanent drive on the Windows system as long as the server is operational.

## Part 8 - Securing the Share with Groups and Permissions
In production environments, we do not use chmod 777 since it allows anyone access to it. Instead, access is controlled using groups and ownership.

Create a Shared Group
Create a group that will control access to the shared directory:
`sudo groupadd sambashare`

Add Users to the Group
Add your Samba user to the group:
`sudo usermod -aG sambashare sambauser`

Verify group membership:
`groups sambauser`

Update Directory Ownership
Assign the shared folder to the group:
`sudo chown -R root:sambashare /srv/shared`

Set Secure Permissions
Lets set the proper perms for only that group to be able to modify the share.
`sudo chmod -R 2770 /srv/shared`

        Explanation:
        2 -> SetGID bit (new files inherit group)
        7 -> Owner (full access)
        7 -> Groups (full access)
        0 -> Others (no access)
    
    This ensure:
        Only authorized users can access the share
        All new files stay within the same group

Update Samba Configuration
Edit the Samab Config Again
`sudo nano /etc/samba/smb.conf`

Update your share:

    [Shared]
    path = /srv/shared
    browseable = yes
    read only = no
    valid users = @sambashare
    create mask = 0660
    directory mask = 2770

Explanation:

    valid users -> restricts access to group members
    create mask -> file perms
    directory mask -> directory perms

Restart Samba
`sudo systemctl restart smbd`

Test Access Again
Reconnect from Windows using:
`\\SERVER_IP\Shared`
*Only users in the sambashare group should now have access.*

## Part 9 - Script to Automate Backups of the Shared Directory
A NAS is only useful if the data is protected. In this section, we will create a **simple automated backup system.**

Create a Backup Directory
`sudo mkdir -p /srv/backups`

Create a Backup Script
Create a backup script: `nano backup.sh`

        #!/bin/bash

        TIMESTAMP=$(date +%F_%H-%M)
        BACKUP_DIR="/srv/backups"
        SOURCE_DIR="/srv/shared"

        tar -czf $BACKUP_DIR/shared_backup_$TIMESTAMP.tar.gz $SOURCE_DIR

Save and exit using:
`Ctrl + O` and `Ctrl + X`

Make the Script Executable
`chmod +x backup.sh`

Test the Backup Script
Run:
`./backup.sh`

Verify backup files:
`ls /srv/backups`

## Part 10 - Automate with Cron (optional)
Edit cron jobs:
`crontab -e`

Add this line to run the backup daily at midnight:
`0 0 * * * /home/youruser/backup.sh`
*Make sure to update the script path if needed to the actual backup.sh file path. the youruser part will be the user you logged into the machine on or where the script is located*

Verify Cron Job
`crontab -l`

### Lab number Completion Checklist
* Installed Samba on the Debian Server
* Created a shared directory (/srv/shared)
* Configured a Samba share in smb.conf
* Connected to the share from Windows
* Successfully transfered files between systems
* Created a Samba user
* Connected using authenticated credentials
* Mapped the share a Windows network drive
* Created a script to automate backups from the share
* Created a cron job to do daily backups at midnight of the share