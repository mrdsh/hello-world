fdisk /dev/vdb  << EOF
n



+1G
t

8e
w
EOF
partprobe
pvcreate /dev/vdb1
vgcreate vgroup /dev/vdb1
lvcreate  -L 600M -n myvol vgroup
mkfs.ext4 /dev/vgroup/myvol
mkdir /mnt/mpoint
cat >> /etc/fstab <<  EOF
/dev/vgroup/myvol /mnt/mpoint ext4  defaults  0 0
EOF
rm -rf /etc/yum.repos.d/*.repo
init 6
