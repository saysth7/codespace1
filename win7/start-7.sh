#cd /workspaces/${GITHUB_REPOSITORY#*/}/win7
cd /workspaces/win/win7
bk=/tmp/sura/disk/windows7-starter.qcow2
f=/tmp/win7.qcow2
#[ -f $f ] || cp win10-bk.qcow2 $f # github codespace keeps files, so not use git-lfs nor qcow2-inc-snapshot
qemu-img create -b $bk -F qcow2 -f qcow2 $f
sudo qemu-system-x86_64 -smp 2 -m 4G -vnc :0 \
 -machine q35 -enable-kvm -usbdevice tablet \
 -drive file=$f,if=virtio \
 -monitor stdio
 #-net none \
 #-drive file=windows_secure.rom,if=pflash,format=raw,unit=0 \
 #-drive file=windows_secure.vars,if=pflash,format=raw,unit=1

