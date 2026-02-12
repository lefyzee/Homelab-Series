This is the general template for the labs

Useful commands:
- "-" "+" "*" creates bullet points
- "`code`" creates code
- "#" creates heading 1
- "##" creates heading 2
- "###" creates heading 3
- "**text**" bold the text
- "*text*" italicize the text



# Hosting a Local Minecraft Server (Lab 3)
This week we will deploy and manage a local Minecraft server on Debian. Students will learn how to install Java, configure a service, manage server processes, and host a multiplyer service inside a virtual machine.

This lab builds directly on Week 2's Linux fundamentals and takes it to the next step by actually running a service.

For extra guidance use: https://minecraft.wiki/w/Tutorial:Setting_up_a_Java_Edition_server

# Environment
- Debian 13.2 (Server)
- VMware Workstation Pro
- Local only networking
- Can use the NETlabs although VMware is encouraged

# Target Audience
Beginner friendly but introduces real service hosting concepts. Assumes students completed Lab 2. **If you did not complete lab 2 or do not have VMware installed please use the NetLabs**

# Learning Objectives
- Install and verify Java runtime
- Download and deploy a Minecraft Server
- Configure server
- Accept software licenses properly
- Monitor CPU and RAM usage
- Configure a firewall rule
- Connect to a locally hosted service
- Understand ports and service binding

## Required Software
+ **VMware Workstation Pro**
+ Debian 13.2 VM
+ Minecraft Java Edition (client on host machine)


## Part 1 - Preparing the Debian Server
It has been a week since we last updated the server so lets go ahead and update it
`sudo apt update && sudo apt upgrade -y`

Install Required Java Runtime:
For newer versions of Minecraft we need Java 21 or newer
`sudo apt install openjdk-21-jre -y`

Now make sure that it is installed:
`java -version`
You should see OpenJDK 21 listed.

## Part 2 - Creating the Minecraft Server Directory
Create a dedicated directory:
`mkdir ~/minecraft-server`
`cd ~/minecraft-server`

Download the latest Minecraft server .jar file from:

*https://www.minecraft.net/en-us/download/server*

Use wget to download it directly (replace the URL with the current version):
`wget https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar`

## Part 3 - First Launch and EULA Acceptance
Run the server for the first time:
`java -Xmx2G -Xms1G -jar server.jar nogui`

Explaination of what you just ran
- -Xmx2g -> Max RAM (2GB)
- -Xms1G -> Min RAM (1GB)
- nogui -> No graphical user interface we run

### *The server will fail and generate a eula.txt file*

`nano eula.txt`
    Change the eula=false to true

    `eula=false`

    `eula=true`

save and exit (Ctrt + 0, Ctrl + X)

Lets make sure the server runs this time
Run the server again:
`java -Xmx2G -Xms1G -jar server.jar nogui`

## Part 4 - Configure the Server
We should now no longer have the cli to run commands. We need to run commands directly on the server application.

Stop the server with
`stop`

Edit the configuration
`nano server.properties`

    Key setting to modify
    `motd=Security Daemons Lab Server`
    `difficulty=normal`
    `max-player=10`
    `online-mode=false`

For now, we set online-mode=false to simplify local testing
Save and restart the server

## Part 5 - Firewall Configuration

### Lab number Completion Checklist
* What is the student expected to accomplish for this lab?
* (eg. created debian VM)
* (eg. created NAS)


**At the end feel free to add any extra notes for next week**