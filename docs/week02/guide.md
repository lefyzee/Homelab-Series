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
    ```bash
    **whoami**
    **hostname**
    **pwd**

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
    **command [options] [arguments]

Example:
    `ls -l /etc`

*This command will show the user all the contents of the /etc file*