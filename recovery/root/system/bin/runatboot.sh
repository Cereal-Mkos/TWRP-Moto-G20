#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=
touch_path=
firmware_path=/vendor/firmware
firmware_file=

# Fix TouchScreen 

path=/vendor/firmware
mount /vendor
cp -r /vendor/lib/modules $path
cp -r /vendor/firmware $path

# Load TouchScreen Modules
insmod $module_path/himax_v3_mmi_hx83102d.ko
insmod $module_path/himax_v3_mmi.ko
insmod $module_path/ili9882_mmi.ko
insmod $module_path/chipone_tddi_mmi.ko
insmod $module_path/nova_0flash_mmi.ko
insmod $module_path/NVT_Touch.ko
insmod $module_path/himax_v3_mmi.ko
insmod $module_path/focaltech_touch.ko
insmod $module_path/fpc1020_mmi.ko
insmod $module_path/himax_v3_mmi_hx83102d.ko
insmod $module_path/ilitek_v3_mmi.ko
insmod $module_path/ssd20xx_ts.ko

# Load Needed Modules
insmod $module_path/sensors_class.ko
insmod $module_path/utags.ko
insmod $module_path/exfat.ko
insmod $module_path/mmi_annotate.ko
insmod $module_path/mmi_info.ko
insmod $module_path/mmi_sys_temp.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/qpnp-power-on-mmi.ko
insmod $module_path/qpnp_adaptive_charge.ko
insmod $module_path/chipone_fp.ko
insmod $module_path/flash_ic_aw3641.ko
insmod $module_path/flash_ic_ocp8137.ko
insmod $module_path/flash_ic_sc2703.ko
insmod $module_path/fpc_fp.ko
insmod $module_path/himax_v3_mmi.ko
insmod $module_path/mali_gondul.ko
insmod $module_path/microarray_fp.ko
insmod $module_path/mmdvfs.ko
insmod $module_path/oreo_ili9882n.ko
insmod $module_path/sprd_camera.ko
insmod $module_path/sprd_cpp.ko
insmod $module_path/sprd_fd.ko
insmod $module_path/sprd_flash_drv.ko
insmod $module_path/sprd_fm.ko
insmod $module_path/sprd_sensor.ko
insmod $module_path/sprd_vdsp.ko
insmod $module_path/sprdbt_tty.ko
insmod $module_path/sprdwl_ng.ko
insmod $module_path/ssd20xx_ts.ko
insmod $module_path/stmvl53l0.ko
insmod $module_path/synaptics_dsx_td4310.ko
insmod $module_path/tcs3430.ko
insmod $module_path/vdsp_sipc.ko
insmod $module_path/vdsp_spipe.ko
umount /vendor

# Fix up chipone
if [[ -d /sys/class/touchscreen/ICNL9911S ]]; then
        echo "chipone"
        chipone_fw_path=/vendor/firmware/ICNL9911.bin
        flash_path=/sys/chipone-tddi/cts_firmware

        sleep 2

        echo $chipone_fw_path > $flash_path/update_from_file
fi

exit 0
