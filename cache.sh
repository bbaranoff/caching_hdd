#!/bin/bash
read -p "SSD path ? Min +60Gb..." $ssd
lvcreate -n cachepool_meta -L 10G vg_data /dev/sdd1
lvcreate -n cachepool -L 50G vg_data /dev/sdd1
lvconvert --type cache-pool --poolmetadata cachepool_meta vg_data/cachepool
lvconvert --type cache --cache-pool cachepool --cachemode writeback vg_data/lv_data
