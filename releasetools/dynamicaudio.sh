#!/sbin/sh
#
# Copyright (C) 2016 CyanogenMod Project
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

RAW_ID=$(cat /sys/devices/system/soc/soc0/raw_id)

if [ $RAW_ID == 1974 ] || [ $RAW_ID == 1973 ] || [ $RAW_ID == 1972 ]; then
 mv -f /system/etc/acdbdata/MTP_tmp/4 /system/etc/acdbdata/MTP
 mv -f /system/etc/mixer_paths_4.xml /system/etc/mixer_paths.xml
 mv -f /system/vendor/etc/diracmobile_4.config /system/vendor/etc/diracmobile.config
 # cleanup
 rm -rf /system/etc/acdbdata/MTP_tmp
 rm -f /system/etc/mixer_paths_3.xml
 rm -f /system/vendor/etc/diracmobile_3.config
else
 mv -f /system/etc/acdbdata/MTP_tmp/3 /system/etc/acdbdata/MTP
 mv -f /system/etc/mixer_paths_3.xml /system/etc/mixer_paths.xml
 mv -f /system/vendor/etc/diracmobile_3.config /system/vendor/etc/diracmobile.config
 # cleanup
 rm -rf /system/etc/acdbdata/MTP_tmp
 rm -f /system/etc/mixer_paths_4.xml
 rm -f /system/vendor/etc/diracmobile_4.config
fi
