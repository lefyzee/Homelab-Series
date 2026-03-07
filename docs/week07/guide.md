This is the general template for the labs

Useful commands:
- "-" "+" "*" creates bullet points
- "`code`" creates code
- "#" creates heading 1
- "##" creates heading 2
- "###" creates heading 3
- "**text**" bold the text
- "*text*" italicize the text



# File Sharing with Samba (Lab 7)
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

Set basic permission for the foler:
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

You can also test creating a file from Debian:
`touch /srv/shared/test_from_linux.txt`

Refresh the Windows share to verify the file appears.

## Part 6 - Creating a Samba User
## Part 7 - Mapping a Network Drive
## Part 8 - Automate Backups

### Lab number Completion Checklist
* What is the student expected to accomplish for this lab?
* (eg. created debian VM)
* (eg. created NAS)


**At the end feel free to add any extra notes for next week**