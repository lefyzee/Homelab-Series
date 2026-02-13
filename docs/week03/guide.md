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

## Part 5 - Firewall Configuration (UWF Configuration)
Check firewall status
`sudo ufw status`
    If it is not installed or active follow these steps
        `sudo apt install ufw`
        `sudo ufw enable`

If the firewall is active, allow Minecraft's default port:
`sudo ufw allow 25565/tcp`

Make sure the rule works
`sudo ufw status`

## Part 6 - Finding the IP addess of the VM
We did this last week but just as a reminder run
`ip a`

You will find an IP address on interface ens33 like:
*192.168.196.134*

Remember this IP address as we will use it to connect to the server.

## Part 7 - Connecting to the Server
From your host machine:
1. Open Minecraft Java Edition
2. Click Multiplayer
3. Add Server
4. <VM_IP>:25565

Note: *If you are not able to connect then switch from NAT mode to Bridged Mode in VMware*

## Part 8 - Running the Server in the Background (Advanced)
Instead of keeping the terminal always open, we can use *screen* to make the Minecraft server run in the background.

Install screen
`sudo apt install screen`

Start a screen session:
`screen -S mcserver`
Now run the server inside it.

Detach the server with:
`Ctrl + A, then D`

Reattach:
`screen -r mcserver`

Like this we are able to manage what is on our terminal so we can work on other projects.

## Part 9 - Monitoring and Resource Usage
Lets apply the skills we gathered from last week and lets monitor the resources of the Minecraft server.

Open another terminal and run:
`htop` or `btop`

If it is not installed then run
`sudo apt install htop`

Observe
- Java process CPU usage
- RAM allocation
- System load

Some questions to think over
- Why does Minecraft use more RAM over time?
- What happens if we set -Xmx too high?

## Part 10 - Creating a Startup Script that is Executable
Instead of typing the full Java command every time, we will create an executable startup script.
This makes starting the server cleaner and easier to run.

Inside your **minecraft-server** directory:
`nano start.sh`

Add this in the contents:
   #!/bin.bash

   # Minecraft Server Startup Script
   # Adjust RAM allocation if needed

   RAM_MIN="1G"
   RAM_MAX="2G"
   JAR_FILE="server.jar"

   echo "Starting Minecraft Server..."
   echo "Minimum RAM: $RAM_MIN"
   echo "Maximum RAM: $RAM_MAX"

   java -Xms$RAM_MIN -Xmx$RAM_MAX -jar $JAR_FILE nogui

save and exit

### Make the Script Executable
Right now we just created a text file. We need to make it executable.
`chmod +x start.sh`

Verify permissions:
`ls -l`

You should see
-rwxr-xr-x start.sh

*Note: the `x` means it is executable*

### Start the Server Using the Script
`./start.sh`

Thats it! Now instead of running the whole command you just have to run `./start.sh`

## Part 11 - Allowing other Minecraft Users to Join your Server
If you are running VMware on a Windows 11 computer then you will need to port forward the VM to the host machine so other people can join.

Make sure your VM is NATed in VMware.

Now check the "public" IP address on your host machine by running
`ipconfig` on Windows

This is the IP address your friends will use to connect to your Minecraft server running on your Debian VM.

### Open up the Port on Windows Firewall
On Windows 11 type in
"Windows Defender Firewall with Advanced Security"

Add an inbound rule to allow connections (These will be written using the `commands` font but you will not need to write these commands into a terminal.)
Click on:
1. "New Rule"
2. "Port"
3. "TCP"
4. "25565"
5. "Allow the connection"
6. The rule applies to every profile
7. Name it `@MC` you can add a description if you need more clarification
8. Click finish

### Have your Friends Connect to your Minecraft Server
Now that the port is open on your host computer, give your host PC IP address to your friends and start the Minecraft server.
*75.102.196.137*

From there launch Minecraft Java edition
- Click on "Multiplayer"
- "Add Server"
- Type in the IP address of the server
- Click on "connect" and you should be able to join the server

Congrats! You now have a fully functional Minecraft server running in a virtual machine that you can connect to on your LAN.
If you want to play with your friends remotely then you would need to connect your Minecraft Server to a Tailscale VPN or any other VPN.
We will not be going over that in this series but it will make an interesting project to do on your own!

## Lab 3 Completion Checklist
* Installed Java 21
* Created Minecraft server directory
* Downloaded server.jar
* Accepted EULA
* Configured server.properties
* Open firewall port 25565
* Connected successfully from host machine
* Ran server inside a screen session
* Allowed other players to connect on the LAN
* Observed resource usage with htop