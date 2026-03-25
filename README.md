# 100% Brightness Bug Workaround Magisk & KSU Module

A Magisk / KernelSU module that automatically toggles the Always-On Display (AOD) and cycles the screen state upon boot to bypass the 100% brightness bug.

> ### ⚠️ DISCLAIMER ⚠️
> **I am not responsible** for *bricked devices*, *dead SD cards*, *thermonuclear war*, or *you getting fired because the alarm app failed*. Please do some research if you have any concerns about features included in this module before flashing it. YOU are choosing to make these modifications, and if you point the finger at me for messing up your device, I will laugh at you!

## What Does It Do?

Some devices experience a bug where the screen brightness gets stuck at 100% after booting if the Always-On Display (AOD) is enabled. Manually turning the screen off and on does not fix it unless AOD is disabled first. This module automates the workaround by temporarily disabling AOD, cycling the screen state, and re-enabling AOD shortly after the device finishes booting.

## How It Works

Once the boot process completes, the module executes a script that performs the following sequence:
1. Disables Always-On Display (`settings put secure doze_always_on 0`).
2. Waits briefly (0.2 seconds), then turns the screen off (`input keyevent 26`).
3. Waits briefly, then wakes the screen up (`input keyevent 224`).
4. Re-enables Always-On Display (`settings put secure doze_always_on 1`).

# Installation
1. [Download the latest release](https://github.com/bcrtvkcs/100BrightnessBugWorkaround-Magisk-KSUModule/releases/latest/download/100BrightnessBugWorkaround-Magisk-KSUModule-main.zip).
2. Flash it via **Magisk**, **KernelSU**, or **KernelSU Next**.
3. Reboot the device.
4. The screen will briefly cycle off and on after boot, bypassing the brightness bug.
5. You're all set!
6. If you experience any issues, please let me know through the [Issues](https://github.com/bcrtvkcs/100BrightnessBugWorkaround-Magisk-KSUModule/issues) panel.

# Compatibility
- Android 8.0+
- KernelSU or KernelSU Next or Magisk
