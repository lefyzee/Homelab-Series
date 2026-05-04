This is the general template for the labs

Useful commands:
- "-" "+" "*" creates bullet points
- "`code`" creates code
- "#" creates heading 1
- "##" creates heading 2
- "###" creates heading 3
- "**text**" bold the text
- "*text*" italicize the text



# Wazuh SIEM Deployment and Windows Agent Integration (Lab 9)
In this lab, you will deploy a centralized Wazuh SIEM on a Debian virtual machine and configure your Windows 11 host as an agent. You will validate connectivity and test real security detections such as failed logins and PowerShell activity.

# Environment
- Debian 13 (Wazuh Server)
- Windows 11 (Host Machine as Agent)
- VMware Workstation Pro (VMnet8 NAT recommended)

# Target Audience
Intermediate (Students should be comfortable using Linux terminal and basic Windows administration)

# Learning Objectives
- Deploy a Wazuh all-in-one SIEM server
- Install and configure a Windows endpoint agent
- Troubleshoot connectivity and configuration issues
- Validate log ingestion from Windows to Wazuh
- Perform basic detection testing (auth logs, PowerShell, etc.)

## Required Software
- VMware Workstation Pro
- Debian ISO
- Windows 11 host
- Web browser




## Part 1 - Setting up the Debian Wazuh Server
Step 1: Create the VM
- OS: Debian (64-bit)
- RAM: 4 GB minimum (8 GB recommended)
- CPU: 4 cores
- Disk: 40 GB
- Network: NAT (VMnet8)

## Part 2 - Always Update the Debian Server
`sudo apt update && sudo apt upgrade -y`

## Part 3 - Installing Wazuh
Be sure to change the "/4.x/" to the current version of Wazuh. As of making this homelab it is 4.14\
rm -f wazuh-install.sh\
curl -sSL -O https://packages.wazuh.com/4.x/wazuh-install.sh\

## Part 4 - Verify Script
`head wazuh-install.sh`\
We are looking for the start of it to say #!/bin/bash

## Part 5 - Install Wazuh
`sudo bash wazuh-install.sh -a`

## Part 6 - Get VM IP
`ip a`

## Part 7 - Access Web GUI from Windows Host
http://192.168.196.143 \
Login with the save creds in the Wazuh install on your Debian machine.

## Part 8 Install Wazuh Agent on Wazuh
Run PowerShell as Administrator:
    `Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.14.5-1.msi -OutFile $env:tmp\wazuh-agent; msiexec.exe /i $env:tmp\wazuh-agent /q WAZUH_MANAGER='192.168.192.43' WAZUH_AGENT_NAME='deb.1'`

### Lab number Completion Checklist
* What is the student expected to accomplish for this lab?
* (eg. created debian VM)
* (eg. created NAS)


**At the end feel free to add any extra notes for next week**