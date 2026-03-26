#!/system/bin/sh

# Dynamic module directory path
MODDIR="${0%/*}"

# Function to update module description status
update_status() {
    local status_text="$1"
    local status_emoji="$2"
    local new_description="description=Status: $status_text $status_emoji\\\\nAutomatically toggles the Always-On Display (AOD) and cycles the screen state upon boot to bypass the 100% brightness bug."
    
    sed -i "s|^description=.*|$new_description|" "$MODDIR/module.prop"
}

# Function to execute the brightness bug workaround sequence
apply_workaround() {
    settings put secure doze_always_on 0
    sleep 0.1
    input keyevent 26
    sleep 0.1
    input keyevent 224
    sleep 0.1
    settings put secure doze_always_on 1
}

update_status "Waiting for boot" "⏳"

# Phase 1: Wait for system boot completion
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 10
done

# Run the first fix attempt immediately after boot (Pre-Unlock)
update_status "Running Pre-Unlock Fix" "⚙️"
apply_workaround

update_status "Waiting for user unlock" "🔒"

# Phase 2: Wait for user data to be decrypted (First manual unlock)
until [ "$(getprop sys.user.0.ce_available)" = "true" ]; do
    sleep 15
done

# Wait for the system UI to stabilize after unlock
sleep 5

# Run the second fix attempt (Post-Unlock)
update_status "Running Post-Unlock Fix" "⚙️"
apply_workaround

update_status "Completed" "✅"
