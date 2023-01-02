#!/system/bin/sh
insmod /vendor/lib/modules/focaltech-FT5x46.ko
insmod /vendor/lib/modules/incrementalfs.ko
insmod /vendor/lib/modules/kheaders.ko
insmod /vendor/lib/modules/trace_irqsoff_bytedancy.ko
insmod /vendor/lib/modules/trace_noschedule_bytedancy.ko
insmod /vendor/lib/modules/trace_runqlat_bytedancy.ko
insmod /vendor/firmware/focaltech-FT5x46.bin