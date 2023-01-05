#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=

# Load TouchScreen Modules
insmod $module_path/chipone_fp.ko
insmod $module_path/focaltech_touch.ko
insmod $module_path/incrementalfs.ko
insmod $module_path/kheaders.ko
insmod $module_path/NVT_Touch.ko
insmod $module_path/trace_irqsoff_bytedancy.ko
insmod $module_path/trace_noschedule_bytedancy.ko
insmod $module_path/trace_runqlat_bytedancy.ko

cd $firmware_path
touch_product_string=$(ls $touch_class_path)
echo "focaltech"
firmware_file="focaltech-FT5x46.bin
touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
wait_for_poweron
echo $firmware_file > $touch_path/doreflash
echo 1 > $touch_path/forcereflash
sleep 5
echo 1 > $touch_path/reset

exit 0