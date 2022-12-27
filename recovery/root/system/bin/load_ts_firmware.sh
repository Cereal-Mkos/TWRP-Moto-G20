#!/system/bin/sh

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=
device=$(getprop ro.boot.device)

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}
cd $firmware_path
touch_product_string=$(ls $touch_class_path)
if [[ -d /sys/touchscreen/driver/spi2.2/of_node ]]; then
       echo "compatible"
       firmware_file="focaltech-FT5x46.bin"
       touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
       wait_for_poweron
       echo $firmware_file > $touch_path/doreflash
       echo 1 > $touch_path/forcereflash
       sleep 5
       echo 1 > $touch_path/reset
elif [[ -d /sys/touchscreen/driver/spi2.2/of_node ]]; then
        echo "focaltech"
        chipone_fw_path=/vendor/firmware/focaltech-FT5x46.bin
        flash_path=/sys/touchscreen/driver/spi2.2/of_node
        sleep 2
        echo $chipone_fw_path > $flash_path/update_from_file
fi

return 0
