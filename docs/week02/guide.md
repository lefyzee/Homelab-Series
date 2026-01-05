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