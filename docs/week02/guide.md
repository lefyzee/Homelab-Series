# Debian Fundamentals and First Service (SSH) (Lab 2)
Students will build a strong foundation in Debian Linux by learning core system concepts, user management, package management, and services. This lab introduces SSH as the first real services and prepares the system for hosting services in future labs.

# Environment
    VMware Workstation Pro (Windows/Linux)
        We do not have support for M chip based Macs at the moment

    DePaul SecLabs Virtual Desktops
        These virtual desktops act as a basic Debian Desktop environment. All of the labs can be done in the virtual lab but we encourage to do it on your device.

# Target Audience
    Beginner-friendly, step-by-step, assumes no prior knowledge of Linux system administration.
    Students are expected to have completed Lab 1 or already have a working Debian 13.2 VM.

# Learning Objectives
- Understand the Debian Linux operating system
- Navigate and use the Linux terminal confidently
- Understand users, groups, and the sudo privilege model
- Perform system updates and install packages
- Understand what services (daemons) are and how they work
- Install and manage the OpenSSH service
- Remotely access a Linux system using SSH

---


## Required Software
- **Debian 13.2 Virtual Machine**
- **VMware Workstation Pro** or **DePaul SecLabs VM**
- Internet connectivity inside the VM

**-------------------------------------------**


## Part 1 - Understanding Debian Linux
Debian is a **stable, security-focused Linux distribution** widely used in servers, enterprise environments, and cybersecurity labs.

Key Points:
- Debian prioritizes stability over cutting-edge features
- Security patches are backported without breaking the system
- Many popular distributions (such as Ubuntu) are based on Debian

Debian provides a predictable and professional foundation for all future labs.

--

## Part 2 - Terminal
Like in the previous lab, we ran some commands. Some of these were:
   * `whoami`
   * `hostname`
   * `pwd`

These commands tell you:
   * Which user you are logged in as
   * The system hostname
   * Your current working directory

Basic navigation commands:
   * ls (list)
   * cd / (change directory to root directory)
   * cd ~ (change directory to home directory)
   * clear (clear the screen)

Command Structure:
   * command [options] [arguments]

Example:
   * `ls -l /etc`

+ *This command will show the user all the contents of the /etc file*

--

## Part 3 - Users, Groups, and Privileges
Linux is a multi-user operating system. Even on a single VM, this security model is important. This is a cybersecurity club after all.

### Root vs Normal Users:
   * root has unrestricted access to the system
   * Normal users have limited permissions
   * sudo allows temporary privilege escalation

Now lets check your group membership:
`groups`

Check user identity information:
`id`

System user data is stored in:
   * /etc/passwd
   * /etc/shadow (restricted if not root user)

Pro tip: **You should never use the root account for daily tasks.**

--

## Part 4 - Package Management and System Updates
Keeping your system updated is one of the most important security practices.

update package list:
`sudo apt update`

Upgrade installed packages:
`sudo apt upgrade`

Install a few useful tools:
`sudo apt install -y curl htop`
Now lets test it:
`htop`

Htop allows the user to check resources and proccesses on the Debian server.
You can also check for PIDs here and kill proccesses if you need to.

--

## Part 5 - Networking Basics
Now lets get into some of the networing of Debian

Check your IP address:
`ip a`

Check your default route:
`ip route`

Test internet connectivity:
`ping -c 3 8.8.8.8`
`ping -c 3 google.com`

If both of these tests succeed, your system is ready for remote access.

--

## Part 6 - Understanding Services and systemd
A service (daemon) is a background process that runs continously to provide functionality such as SSH or web hosting.

Debian uses systemd to manage services.

Common Commands:
`systemctl status`
`systemctl start`
`systemctl stop`
`systemctl enable`
service config files are typically stored in `/etc`.

To check what Daemons are running in the background (we won't be able to see them in htop) we need to run a specific command:
`sudo systemctl list-units --type=service --state=running`

--

## Part 7 - Installing OpenSSH
SSH allows secure remote access to your Linux system.

Install the OpenSSH server (if you did not install it during the initial install):
`sudo apt install openssh-server`

Check if SSH is running:
`systemctl status ssh`

Lets check what port SSH is running on:
`ss -tulpn | grep ssh`

--

## Part 8 - Connecting to the VM
We will need another VM for this. This can be created with a Debian Desktop environment using the same debian ISO to create another VM with a desktop. If you are in the NetLabs then log into the other Linux Machine.

Options:
- A second Debian VM with a desktop environment
- Another Linux machine in NetLabs
- Your host system (if it supports SSH)

First, find the IP address of your Debian server:

`ip a`

Take note of the IP address assigned to your network interface.

From the second machine, connect using SSH:

`ssh username@IP_ADDRESS`

Example:
`ssh student@192.168.233.128`

The first time you connect, you may see a host key warning. This is normal and is used to prevent man-in-the-middle attacks.

Enter your password when prompted.

If successful, you are now logged into your Debian VM **remotely**.

--

## Part 9 - Confirming a Remote SSH Session
Now that you are logged in via SSH, let’s confirm that this is truly a remote session.

Run:
`who`

This shows all users currently logged into the system.

Next, run:
`w`

This command shows:
- Who is logged in
- Where they are logged in from (IP address)
- How long they have been connected

This is how system administrators track active sessions on a server.

--

## Part 10 - Hostname and Server Identity
Servers are identified by hostnames, not just IP addresses.

Check the current hostname:
`hostname`

View detailed system identity information:
`hostnamectl`

(Optional – Advanced / Instructor Approved)
You may set a clearer hostname for this lab:

`sudo hostnamectl set-hostname debian-lab2`

Log out and log back in via SSH to see the updated hostname in your terminal prompt.

--

## Part 11 - Viewing SSH Logs (Security Awareness)
Every SSH login attempt is logged by the system.

View recent SSH log entries:
`sudo journalctl -u ssh -n 20`

You should see entries showing:
- Successful logins
- The username used
- The source IP address

This is one of the primary places administrators look when investigating unauthorized access.

--

## Part 12 - Network Visibility: What Services Are Listening?
Servers expose services through network ports. Knowing what is listening is critical for security.

List listening TCP and UDP ports:
`ss -tuln`

Now filter for SSH specifically:
`ss -tuln | grep ssh`

You should see SSH listening on port **22**.

This command helps administrators understand a system’s attack surface.

--

## Part 13 - Mini Challenge (Optional but Recommended)
This challenge is designed for students who want to go a bit deeper.

Your goal:
- Confirm you are logged in via SSH
- Identify the IP address you connected from
- Find your most recent SSH login time
- Confirm SSH is the only remote-access service listening

Helpful commands:
`who`
`w`
`last`
`journalctl -u ssh`
`ss -tuln`

You do not need to complete every part to move on, but try as much as you can.

--

### Lab 2 Completion Checklist

✔ Debian 13.2 VM running correctly  
✔ Comfortable navigating the Linux terminal  
✔ Understand users, groups, and sudo  
✔ System fully updated  
✔ Able to install packages using `apt`  
✔ Understand what a service (daemon) is  
✔ OpenSSH installed and running  
✔ Successfully connected to the VM via SSH  
✔ Able to view SSH logs  
✔ Understand which services are listening on the system  

If all boxes are checked, you have successfully completed Lab 2.
