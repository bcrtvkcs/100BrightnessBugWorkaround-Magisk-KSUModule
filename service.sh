#!/system/bin/sh

# Dynamic module directory path
MODDIR="${0%/*}"

# Update module status
update_status() {
    local status_text="$1"
    local status_emoji="$2"
    local new_description="description=Status: $status_text $status_emoji\nAutomatically toggles the Always-On Display (AOD) and cycles the screen state upon boot to bypass the 100% brightness bug."
    
    sed -i "s|^description=.*|$new_description|" "$MODDIR/module.prop"
}

update_status "Waiting for boot" "⏳"

# Wait for boot completion
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

# Wait 5 seconds for the system to settle before cycling the screen
sleep 5

update_status "Running script" "⚙️"

# Disable Always-On Display
settings put secure doze_always_on 0
sleep 0.2

# Turn off the screen
input keyevent 26
sleep 0.2

# Wake up the screen
input keyevent 224
sleep 0.2

# Re-enable Always-On Display
settings put secure doze_always_on 1

update_status "Completed" "✅"
