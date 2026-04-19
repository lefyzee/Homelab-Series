This is the general template for the labs

Useful commands:
- "-" "+" "*" creates bullet points
- "`code`" creates code
- "#" creates heading 1
- "##" creates heading 2
- "###" creates heading 3
- "**text**" bold the text
- "*text*" italicize the text

**THIS LAB HAS NOT BEEN TESTED YET**

# Self-Hosted Web Server Basics with Apache2 (Lab 4)
This lab introduces studebnts to hosting their first website using **Apache2** on Debian. Students will learn how web servers work, how to serve a basic HTML page, how DNS and public exposure work, and most importantly, how to do it safely.

A major focus on this lab is understanding why exposing services directly from your home network can be dangerous and what safer alternatives exist. This lab will have safer methods, suchs as reverse proxies, Cloudflare protection, or cloud hosting providers like AWS.

# Environment
- Debian 13.2 VM
- VMware Workstation Pro
- Optional: DePaul Sec Labs Virtual Environment
- Optimal: Home network with router access for advanced testing

# Target Audience
Beginner to intermediate

This lab is beginner-friendly but introduces important real world concepts in networking, web hosting, and security.

# Learning Objectives
- Understand what Apache2 does as a web server
- Install and manage Apache2 on Debian
- Host a basic HTML website locally
- Understand ports 80 and 443
- Lean basic Linux web directory structure
- Understand risks of public web hosting from a home IP
- Learn safer alternatives like Cloudflare proxying and cloud hosting
- Understand the basics of DNS and reverse proxy concepts

## Required Software
- VMware Workstation Pro
- Debian 13.2
- Web browser
- Terminal access
- Optional: Cloudflare account
- Optional: AWS Free Tier account
- Optional: Bluehost account




## Part 1 - Understanding Web Hosting Basics
Before installing anything, students should understand what they are building.

A web server:

+ Listens for HTTP/HTTPS requests
+ Servers files like HTML, CSS, JavaScript
+ Can later support PHP, databases, and applications

Common ports:
+ 80 = HTTP
+ 443 = HTTPS

Important folders:
+ /var/www/html/ -> default website files
+ /etc/apache2/ -> Apache configuration files
+ /var/log/apache2/ -> Apache logs

Now lets run a quick update on the Debian:
+ `sudo apt update`
+ `sudo apt upgrade`


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