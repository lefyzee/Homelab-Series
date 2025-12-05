# ---------------------------
# Top-level folders
# ---------------------------
$topLevel = @(
    "docs",
    "slides",
    "vm-templates",
    "configs",
    "scripts"
)

$topLevel | ForEach-Object {
    New-Item -ItemType Directory -Force -Path $_ | Out-Null
}

# ---------------------------
# docs/week01–week10
# ---------------------------
1..10 | ForEach-Object {
    $week = "week{0:D2}" -f $_
    $weekPath = Join-Path "docs" $week

    # week folder
    New-Item -ItemType Directory -Force -Path $weekPath | Out-Null

    # screenshots and assets
    New-Item -ItemType Directory -Force -Path (Join-Path $weekPath "screenshots") | Out-Null
    New-Item -ItemType Directory -Force -Path (Join-Path $weekPath "assets") | Out-Null

    # guide.md and instructor-notes.md
    $guidePath = Join-Path $weekPath "guide.md"
    $notesPath = Join-Path $weekPath "instructor-notes.md"

    if (-not (Test-Path $guidePath)) {
        New-Item -ItemType File -Path $guidePath | Out-Null
    }
    if (-not (Test-Path $notesPath)) {
        New-Item -ItemType File -Path $notesPath | Out-Null
    }
}

# ---------------------------
# docs/templates
# ---------------------------
$docsTemplates = "docs\templates"
New-Item -ItemType Directory -Force -Path $docsTemplates | Out-Null

$labTemplatePath       = Join-Path $docsTemplates "lab-template.md"
$studentChecklistPath  = Join-Path $docsTemplates "student-checklist.md"
$slideTemplatePath     = Join-Path $docsTemplates "slide-template.pptx"

if (-not (Test-Path $labTemplatePath)) {
    New-Item -ItemType File -Path $labTemplatePath | Out-Null
}
if (-not (Test-Path $studentChecklistPath)) {
    New-Item -ItemType File -Path $studentChecklistPath | Out-Null
}
if (-not (Test-Path $slideTemplatePath)) {
    New-Item -ItemType File -Path $slideTemplatePath | Out-Null
}

# ---------------------------
# slides/week01–week10
# ---------------------------
1..10 | ForEach-Object {
    $week = "week{0:D2}" -f $_
    $slidesWeekPath = Join-Path "slides" $week

    New-Item -ItemType Directory -Force -Path $slidesWeekPath | Out-Null
}

# slides/template/master-template.pptx
$slidesTemplateDir = "slides\template"
New-Item -ItemType Directory -Force -Path $slidesTemplateDir | Out-Null

$masterTemplatePath = Join-Path $slidesTemplateDir "master-template.pptx"
if (-not (Test-Path $masterTemplatePath)) {
    New-Item -ItemType File -Path $masterTemplatePath | Out-Null
}

# ---------------------------
# vm-templates structure
# ---------------------------
$vmTemplates = @(
    "vm-templates\debian-template",
    "vm-templates\truenas-template",
    "vm-templates\wazuh-template"
)

$vmTemplates | ForEach-Object {
    New-Item -ItemType Directory -Force -Path $_ | Out-Null
}

# debian-template README and checksums
$debianReadmePath   = "vm-templates\debian-template\README.md"
$debianChecksumsPath = "vm-templates\debian-template\checksums.txt"

if (-not (Test-Path $debianReadmePath)) {
    New-Item -ItemType File -Path $debianReadmePath | Out-Null
}
if (-not (Test-Path $debianChecksumsPath)) {
    New-Item -ItemType File -Path $debianChecksumsPath | Out-Null
}

# ---------------------------
# configs subfolders
# ---------------------------
$configDirs = @(
    "configs\apache",
    "configs\minecraft",
    "configs\pi-hole",
    "configs\tailscale",
    "configs\grafana",
    "configs\wazuh",
    "configs\truenas"
)

$configDirs | ForEach-Object {
    New-Item -ItemType Directory -Force -Path $_ | Out-Null
}

# ---------------------------
# scripts folder (already created at top) – left empty intentionally
# ---------------------------

Write-Host "Homelab series folder structure created or updated successfully."
