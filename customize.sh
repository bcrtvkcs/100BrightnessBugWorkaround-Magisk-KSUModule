#!/system/bin/sh

# Check Android version
if [ "$API" -lt 26 ]; then
    abort "Android 8.0 or higher required!"
fi

ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print "100% Brightness Bug Workaround"
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print ""
ui_print "- Device: $(getprop ro.product.model)"
ui_print "- Android: $(getprop ro.build.version.release)"
ui_print "- Module path: $MODPATH"
ui_print ""

# Set permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/action.sh 0 0 0755

ui_print ""
ui_print "- Initialization completed!"
ui_print ""

# Update status
sed -i '/description/d' $MODPATH/module.prop
echo "description=Status: Installed ✅\\\\nAutomatically toggles the Always-On Display (AOD) and cycles the screen state upon boot to bypass the 100% brightness bug." >> $MODPATH/module.prop
