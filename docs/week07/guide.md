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

## Part 2 - Next step for the process
Add as many steps as you need. Just keep them consistent with the previous formating

## Part 3 -
## Part 4 -
## Part 5 -

### Lab number Completion Checklist
* What is the student expected to accomplish for this lab?
* (eg. created debian VM)
* (eg. created NAS)


**At the end feel free to add any extra notes for next week**