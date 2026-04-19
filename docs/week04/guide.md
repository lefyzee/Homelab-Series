This is the general template for the labs

Useful commands:
- "-" "+" "*" creates bullet points
- "`code`" creates code
- "#" creates heading 1
- "##" creates heading 2
- "###" creates heading 3
- "**text**" bold the text
- "*text*" italicize the text

**THIS LAB HAS NOT BEEN TESTED YET**\
**THIS LAB NEEDS PORT 80 AND 443 AVAILABLE. IF TAILSCALE WAS SET UP BEFORE THIS LAB THEN THOSE PORTS MAY ALREADY BE IN USE**

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

## Part 2 - Installing Apache2
`sudo apt install apache2 -y`

Check services status:
`sudo systemctl status apache2`

Enable Apache to start automatically:
`sudo systemctl enable apache2`

Verify Apache is listening:
`sudo ss -tulnp | grep apache`

Open your browser on your main host and visit: (This will be your VMs IP address. Check it using `ip a` on the VM)
`http://192.168.x.x`

You should see the default Apache page.

## Part 3 - Creating Your First Website
Navigate to the web root:\
`cd /var/www/html`

Remove the default page:\
`sudo rm index.html`

Create your own:\
`sudo nano index.html`

This lab will not go into HTML, CSS, or JavaScript in detail because this is cybersecurity club, not a UI/UX design club. All the web pages we will create are basic HTML web pages. If you want to learn more about front-end web design please visit **www.theodinproject.com**

Example HTML:
```<!DOCTYPE html>
<html>
<head>
    <title>My First Homelab Website</title>
</head>
<body>
    <h1>Hello Security Daemons!</h1>
    <p>This is my first Apache2 web server.</p>
</body>
</html>
```
Save the file using:\
`Ctrl + O` `Ctrl + X`

And then refresh the browser.

You should now see your own webpage hosted on your web server!

## Part 4 - Security Warning: Do NOT Publicly Expose This Yet
This is the most important part of the lab.

Many new people making a web server think that they can just port forward my router and host my website publicly. This is a bad idea.

Risk includes:
- exposing your home IP address
- automated bot scanning
- vulnerability exploitation
- brute force attempts
- data leaks
- router misconfigurations
- exposing your entire home network

Strong recommendation: **DO NOT** directly expose your home web server to the internet.

You can only do it safely after:
- proper firewall rules have been implemented
- an IDS/IPS system
- patch management
- reverse proxy protection
- logging and monitoring

This is how people accidentally get compromised.

Seriously - do not do this casually.

## Part 5 - Safer Alternatives
### Option A - Use Cloudflare Proxy (Recommended)
Cloudflare acts as a reverse proxy and WAF (Web Application Firewall).

Benefits:
- hides your real home IP
- block malicious traffic
- DDos protection
- SSL certificates
- traffic filtering
- bot protection

Basic idea:
- domain points to Cloudflare
- Cloudflare proxies traffic to your home server
- attackers see Cloudflare, not your home IP directly

This is much safer than port forwarding.

Students should research:\
www.cloudflare.com \
On how to set up a reverse proxy

More specifically:
- DNS Proxy (orange cloud)
- WAF
- Zero Trust options
- Tunnel options (even better than port forwarding)

There are YouTube videos for all of these. It would be too much information to go through all of it in one week for the Homelab Series.

### Option B - Host in the Cloud
## Part 6 - Basic Apache Administration
## Part 7 - Optional Challenge - Deploy a Real Web Application
Optional only.

Students who finish early can research:
- OpenCart (This is used for CCDC practice! I would recommend setting this up if you are interested in trying out for the CCDC team!)
- WordPress (There is a cloud hosted version and a locally hosted version. This is a great place to learn more about building websites on the front end and the backend if you host locally)
- Drupal
- Docker-based web applications (Very practical for homelabing)

**This introduces:**
- PHP
- MySQL/MariaDB
- application security
- web app permissions
- backups
- patching

This is much closer to what you will see in the real world. Most site are not just Apache2 basic html websites but there is a whole rabbit hole you can go down in web that could be its own series on its own! If you are interested on web dev please do research outside of this GitHub repo as we barely scratched the surface of web.



### Lab number Completion Checklist
* What is the student expected to accomplish for this lab?
* (eg. created debian VM)
* (eg. created NAS)


**At the end feel free to add any extra notes for next week**