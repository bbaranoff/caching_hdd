read -p "Magnetic HDD partition path ?" $hdd
read -p "SSD Partition path ?" $ssd
pvcreate $ssd 
pvreate $hdd
vgcreate vg_data $hdd $ssd
lvcreate -L 100%VG -n lv_data vg_data $hdd
