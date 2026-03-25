#!/system/bin/sh

# Manual trigger for the AOD/Screen cycle workaround
# This script bypasses the 100% brightness bug on demand

# Disable Always-On Display
settings put secure doze_always_on 0
sleep 0.1

# Turn off the screen
input keyevent 26
sleep 0.1

# Wake up the screen
input keyevent 224
sleep 0.1

# Re-enable Always-On Display
settings put secure doze_always_on 1

echo "Workaround executed successfully."
