![GitHub Actions Test Workflow Status](https://img.shields.io/github/actions/workflow/status/joshooaj/PSubsonic/Test.yaml?label=build%2Ftest)
![GitHub Actions Docs Workflow Status](https://img.shields.io/github/actions/workflow/status/joshooaj/PSubsonic/Docs.yaml?label=docs)
![GitHub Actions Publish Workflow Status](https://img.shields.io/github/actions/workflow/status/joshooaj/PSubsonic/Publish.yaml?label=publish)
![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/PSubsonic)
![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/PSubsonic)
![GitHub License](https://img.shields.io/github/license/joshooaj/PSubsonic)
[![Built with Material for MkDocs](https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)

# PSubsonic

PSubsonic is an experimental PowerShell module for interacting with a Subsonic
server. It was initially created as a part of a personal music library
re-organization project where I simply needed a way to automate triggering a
library scan in [Navidrome](https://github.com/navidrome/navidrome).

_**Note:** PSubsonic is pronounced "subsonic"_

## Installation

```powershell
Install-Module PSubsonic
```

## Examples

### Connect to your Subsonic server

```powershell
$address = Read-Host -Prompt 'Subsonic server address'
$credential = Get-Credential
Connect-PSubsonic -Address $address -Credential $credential
```

### Start a music library scan

```powershell
# This will trigger a "quick scan" in Navidrome
Start-PSubScan

# This will trigger a "full scan" in Navidrome and may not have any effect on other apps.
Start-PSubScan -Full
```

### Get a list of artists

```powershell
Get-PSubIndex
```

### Get a list of tracks that are currently being played

```powershell
Get-PSubNowPlaying
```

### TODO

- Write documentation
- Write integration tests to run against a live Navidrome instance
- Add support for more Subsonic API methods
- Explore alternative output formatting for better support for piping or chaining commands together.
