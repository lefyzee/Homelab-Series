# Lab 1 - Instructor Notes

## Estimated Time
- 60-90 Minutes

## Setup Requirements
- Host System with:
    - Virtualization enabled in BIOS/UEFI
    - Minimum 8 GB RAM
- VMware Workstation Pro installed
- Debian 13.2 ISO available

---



## Common Problems


### 1. Virtualization Disabled
- If VMware does not launch it may be that virtualization is not enabled in BIOS

Fix:
- Enable Intel VT-x / AMD-V in BIOS

---


### 2. Students Install a Desktop Environment
Not a failure.
- Allow them to procceed
- Emohasize terminal usage
- SSH still works
- If they want they can reinstall Debian

---


### 3. Not understanding NAT vs Bridged.
- Stick with **NAT only**
- Explain later in networking lab

---


### 4. Disk Space Errors
Often caused by:
- Host system low on storage
- VM disk set too small (20 GB min.)

Fix:
- Expand VM disk if needed
Recommend minimum 20 GB

---


## Alternate Configurations

### DePaul SecLabs Virtual Desktops
- VMware may already be installed
- BIOS access may be restricted
- Headless install still works

---


## Troubleshooting Tips

- VM won’t boot → check ISO attachment
- No internet → confirm NAT network
- Login fails → verify keyboard layout
- SSH not available → ensure SSH server was selected

---


## Teaching Notes
- Emphasize snapshots early
- Reinforce that breaking things is safe
- Encourage curiosity, not perfection
- This VM is foundational for future labs

---


## Instructor Reminder
This lab is **self-guided** by design.  
Avoid over-correcting — let students explore.