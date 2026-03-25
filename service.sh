#!/system/bin/sh

MODDIR="${0%/*}"

update_status() {
    local status_text="$1"
    local status_emoji="$2"
    local new_description="description=Status: $status_text $status_emoji\\\\nAutomatically toggles the Always-On Display (AOD) and cycles the screen state upon boot to bypass the 100% brightness bug."
    
    sed -i "s|^description=.*|$new_description|" "$MODDIR/module.prop"
}

update_status "Waiting for boot" "⏳"

# Wait for system boot
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 10
done

update_status "Waiting for user unlock" "🔒"

# Wait for user data to be decrypted
until [ "$(getprop sys.user.0.ce_available)" = "true" ]; do
    sleep 5
done

# Wait 5 seconds after unlock to ensure the UI is fully responsive
sleep 5

update_status "Running script" "⚙️"

# Apply the fix sequence
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

update_status "Completed" "✅"
