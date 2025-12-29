## Introduction to Virtualization and VM Setup (Lab 1)##
Students will install VMware Workstation Pro, create their first Linux VM, configure resources, and learn core virtualization concepts.

# Environment
    VMware Workstation Pro (Windows/Linux) 
        We do not have support for M chip based Apple Macs at the momment

    DePaul SecLabs Virtual Desktop
        These virtual desktops act as a basic Debain Desktop environment. All of the labs can be performed from the virtual labs.

# Target Audience
    Beginner-friendly, step-by-step, assumes no prior knowlege of virtualization or Linux.

# Learning Objectives
- Install and configure virtualization software
- Create and manage a virtual machine
- Understand CPU, RAM, and storage allocation
- Perform basic Linux system configuration
- Navigate the Linux command line
- Create snapshots and backups of a VM

---

## Required Software
- **VMware Workstation Pro**
    Free for person use
- **Debian 13.2 ISO**


**-------------------------------------------**


## Part 1 - What is Virtualization?
Virtualization allows one phtsical computer to run multiple isolated operating systems at the same time. Each virtual machine (VM) behaves like a real computer with its own CPU, memory, disk, and network interface.

Key Benefits:
- Safe testing environment
- Easy backups and snapshots
- Efficient use of hardware
- Industry-standard skill

--

## Part 2 - Installing VMware Workstation Pro
### Here is a great YouTube video explaining how to download VMware if you get lost: https://www.youtube.com/watch?v=LWfaeLEhsXA
1. Login to the Broadcom Support Portal - https://support.broadcom.com
2. After successful login, access the VMware Workstation Pro downloads using the link, Download VMware Workstation Pro.
    Note: For the free versions of VMware Workstation Pro, use this link, Download VMware Workstation Pro (Free)
3. Expand "VMware Workstation Pro <version> for Windows"
4. Select the version you want to download under the release column.


## Part 3 - Downloading Debian 13.2
1. Download the Debain 13.2 ISO file at https://www.debian.org
2. Save the ISO somewhere easy to find


## Part 4 - Creating a New Virtual Machine
1. Open **VMware Workstation Pro**
2. Click **Create a New Virtual Machine**
3. Choose **Typical**
4. Select **Installer disc image file (ISO)**
5. Browse to your Debian 13.2 ISO


## Part 5 - Resource Allocation
When Prompted, configure the VM resources:

- **CPU:** 2 cores
- **Memory:** 2–4 GB RAM
- **Disk:** 20–40 GB (single file recommended)
- **Networking:** NAT (default)

**Note:** These settings can be changed later and these are just reccomended settings.


## Part 6 - Installing Debian (Headless)

During installation:


- Choose **Graphical Install** or **Install**
- Select your language, location, and keyboard
- Set hostname (example: `debian-lab1`)
- Create a user account and password
- Partition disk using **Guided – use entire disk**
- When prompted for software selection:
  - **Uncheck all Desktop Environments**
  - Keep **SSH server** and **standard system utilities**


## Part 7 – First Boot & Login

Once installation completes:

1. Log in using the username you created
2. You should see a terminal prompt (no GUI)

### Congrats! You have downloaded Debian 13.2


## Part 8 - Basic Linux Commands 
Here are some commands to try:

whoami
pwd
ls
ip a
df -h
free -h

These commands help you understand:
Who you are logged in as

Your current directory

Network interfaces

Disk and memory usage


## Part 9 - Updating the System
Always update after installation:
sudo apt update
sudo apt upgrade -y


## Part 10 - Snapshot & Backups
Creating a Snapshot

1. Shutdown the VM
2. Right-click the VM --> Snapshot --> Take Snapshot
3. Name it: Clean Debian Install

We need this in case we make any mistakes and need to rollback to previous snapshots.




### Lab 1 Completion Checklist

✔ VMware Workstation Pro installed
✔ Debian 13.2 VM created
✔ Resources configured correctly
✔ Debian installed without GUI
✔ Able to log in via terminal
✔ Ran basic Linux commands
✔ System updated
✔ Snapshot created

If all boxes are checked, you have successfully completed Lab 1.

We will use this for DNS and Pi-hole and all the other labs in the future.