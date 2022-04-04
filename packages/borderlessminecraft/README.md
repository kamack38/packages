﻿# Borderless Minecraft

This application allows Minecraft to run as a borderless window. The default fullscreen mode does not allow other windows to be placed above it and does not allow users to mouse away from Minecraft without it minimizing.

## Usage

Basic usage is simple. If minecraft is already running, it will appear in the list of Minecraft sessions. Selecting one and clicking "Go Borderless" will remove all window decoration and set its size to match that of your computer's main monitor.

Clicking "Restore Window" will return it to a normal size and show the menu bar.

Clicking "Set Title" is for usage with multiple accounts, and will append "(Second Account)" to the existing title. Optionally, a custom text can be used instead and will be appended to the current game title. This is primarily useful when using OBS to record multiple Minecraft accounts by locking each game capture to a specific window title.

Alteratively, you can click "Advanced" and enter a size and position manually.

## Installation

```powershell
choco install borderlessminecraft
```
