/*
   Copyright (c) 2016, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm.h"

#define RAW_ID_PATH "/sys/devices/system/soc/soc0/raw_id"
#define BUF_SIZE 64
static char tmp[BUF_SIZE];

static int read_file2(const char *fname, char *data, int max_size) {
    int fd, rc;

    if (max_size < 1)
        return 0;

    fd = open(fname, O_RDONLY);
    if (fd < 0) {
        ERROR("failed to open '%s'\n", fname);
        return 0;
    }

    rc = read(fd, data, max_size - 1);
    if ((rc > 0) && (rc < max_size))
        data[rc] = '\0';
    else
        data[0] = '\0';
    close(fd);

    return 1;
}

void init_msm_properties(unsigned long msm_id, unsigned long msm_ver, char *board_type) {
    int rc;
    unsigned long raw_id = -1;

    UNUSED(msm_id);
    UNUSED(msm_ver);
    UNUSED(board_type);

    /* set product device & name */
    property_set("ro.product.device", "cancro");
    property_set("ro.product.name", "cancro");

    /* get raw ID */
    rc = read_file2(RAW_ID_PATH, tmp, sizeof(tmp));
    if (rc) {
        raw_id = strtoul(tmp, NULL, 0);
    }

    switch (raw_id) {
        case 1978:
            /* product model */
            property_set("ro.product.model", "MI 3W");

            /* dalvik heap & hwiu */
            property_set("dalvik.vm.heapstartsize", "16m");
            property_set("dalvik.vm.heapgrowthlimit", "192m");
            property_set("dalvik.vm.heapsize", "512m");
            property_set("dalvik.vm.heaptargetutilization", "0.75");
            property_set("dalvik.vm.heapminfree", "2m");
            property_set("dalvik.vm.heapmaxfree", "8m");
            property_set("ro.hwui.texture_cache_size", "72");
            property_set("ro.hwui.layer_cache_size", "48");
            property_set("ro.hwui.r_buffer_cache_size", "8");
            property_set("ro.hwui.path_cache_size", "32");
            property_set("ro.hwui.gradient_cache_size", "1");
            property_set("ro.hwui.drop_shadow_cache_size", "6");
            property_set("ro.hwui.texture_cache_flushrate", "0.4");
            property_set("ro.hwui.text_small_cache_width", "1024");
            property_set("ro.hwui.text_small_cache_height", "1024");
            property_set("ro.hwui.text_large_cache_width", "2048");
            property_set("ro.hwui.text_large_cache_height", "1024");
            break;
        case 1974:
            /* product model */
            property_set("ro.product.model", "MI 4W");

            /* dalvik heap & hwiu */
            property_set("dalvik.vm.heapstartsize", "8m");
            property_set("dalvik.vm.heapgrowthlimit", "256m");
            property_set("dalvik.vm.heapsize", "512m");
            property_set("dalvik.vm.heaptargetutilization", "0.75");
            property_set("dalvik.vm.heapminfree", "2m");
            property_set("dalvik.vm.heapmaxfree", "8m");
            property_set("ro.hwui.texture_cache_size", "88");
            property_set("ro.hwui.layer_cache_size", "58");
            property_set("ro.hwui.path_cache_size", "32");
            property_set("ro.hwui.shape_cache_size", "4");
            property_set("ro.hwui.gradient_cache_size", "2");
            property_set("ro.hwui.drop_shadow_cache_size", "8");
            property_set("ro.hwui.r_buffer_cache_size", "8");
            property_set("ro.hwui.text_small_cache_width", "2048");
            property_set("ro.hwui.text_small_cache_height", "2048");
            property_set("ro.hwui.text_large_cache_width", "4096");
            property_set("ro.hwui.text_large_cache_height", "4096");
            break;
        case 1973:
            /* product model */
            property_set("ro.product.model", "MI 4CDMA");

            /* dalvik heap & hwiu */
            property_set("dalvik.vm.heapstartsize", "8m");
            property_set("dalvik.vm.heapgrowthlimit", "256m");
            property_set("dalvik.vm.heapsize", "512m");
            property_set("dalvik.vm.heaptargetutilization", "0.75");
            property_set("dalvik.vm.heapminfree", "2m");
            property_set("dalvik.vm.heapmaxfree", "8m");
            property_set("ro.hwui.texture_cache_size", "88");
            property_set("ro.hwui.layer_cache_size", "58");
            property_set("ro.hwui.path_cache_size", "32");
            property_set("ro.hwui.shape_cache_size", "4");
            property_set("ro.hwui.gradient_cache_size", "2");
            property_set("ro.hwui.drop_shadow_cache_size", "8");
            property_set("ro.hwui.r_buffer_cache_size", "8");
            property_set("ro.hwui.text_small_cache_width", "2048");
            property_set("ro.hwui.text_small_cache_height", "2048");
            property_set("ro.hwui.text_large_cache_width", "4096");
            property_set("ro.hwui.text_large_cache_height", "4096");
            break;
        case 1972:
            /* product model */
            property_set("ro.product.model", "MI 4LTE");

            /* product name */
            property_set("ro.product.name", "cancro_wc_lte");

            /* dalvik heap & hwiu */
            property_set("dalvik.vm.heapstartsize", "8m");
            property_set("dalvik.vm.heapgrowthlimit", "256m");
            property_set("dalvik.vm.heapsize", "512m");
            property_set("dalvik.vm.heaptargetutilization", "0.75");
            property_set("dalvik.vm.heapminfree", "2m");
            property_set("dalvik.vm.heapmaxfree", "8m");
            property_set("ro.hwui.texture_cache_size", "88");
            property_set("ro.hwui.layer_cache_size", "58");
            property_set("ro.hwui.path_cache_size", "32");
            property_set("ro.hwui.shape_cache_size", "4");
            property_set("ro.hwui.gradient_cache_size", "2");
            property_set("ro.hwui.drop_shadow_cache_size", "8");
            property_set("ro.hwui.r_buffer_cache_size", "8");
            property_set("ro.hwui.text_small_cache_width", "2048");
            property_set("ro.hwui.text_small_cache_height", "2048");
            property_set("ro.hwui.text_large_cache_width", "4096");
            property_set("ro.hwui.text_large_cache_height", "4096");
            break;
        default:
            /* product model */
            property_set("ro.product.model", "MI Cancro");

            /* dalvik heap & hwiu */
            property_set("dalvik.vm.heapstartsize", "16m");
            property_set("dalvik.vm.heapgrowthlimit", "192m");
            property_set("dalvik.vm.heapsize", "512m");
            property_set("dalvik.vm.heaptargetutilization", "0.75");
            property_set("dalvik.vm.heapminfree", "2m");
            property_set("dalvik.vm.heapmaxfree", "8m");
            property_set("ro.hwui.texture_cache_size", "72");
            property_set("ro.hwui.layer_cache_size", "48");
            property_set("ro.hwui.r_buffer_cache_size", "8");
            property_set("ro.hwui.path_cache_size", "32");
            property_set("ro.hwui.gradient_cache_size", "1");
            property_set("ro.hwui.drop_shadow_cache_size", "6");
            property_set("ro.hwui.texture_cache_flushrate", "0.4");
            property_set("ro.hwui.text_small_cache_width", "1024");
            property_set("ro.hwui.text_small_cache_height", "1024");
            property_set("ro.hwui.text_large_cache_width", "2048");
            property_set("ro.hwui.text_large_cache_height", "1024");
    }
}
