#cd /workspaces/${GITHUB_REPOSITORY#*/}/win7
#cd /workspaces/win/win7
#bk=/tmp/wark/base_image/win7.qcow2
#bk=/tmp/sura/disk/windows7-starter.qcow2
#bk=/tmp/gres/opt/src/github_100/win7.qcow2
#bk=/tmp/ph/hdd.img
#bk=/tmp/ll/base_image/windows7-starter.qcow2
f=/tmp/win7.qcow2
#[ -f $f ] && echo "warn: $f exist, backed up." && mv $f $f.bk
#[ -f $f ] || cp win10-bk.qcow2 $f # github codespace keeps files, so not use git-lfs nor qcow2-inc-snapshot
#qemu-img create -b $bk -F qcow2 -f qcow2 $f
sudo qemu-system-x86_64 -smp 2 -m 2G -vnc :0 \
 -machine q35 -nic user,model=rtl8139 -usbdevice tablet \
 -drive file=$f,if=virtio \
 -monitor stdio \
 #-enable-kvm \
 #-cpu host,kvm=off,level=11,-hypervisor \
 #-drive file=$f,if=none,id=disk0 \
 #-device ich9-ahci,id=ahci \
 #-device ide-hd,drive=disk0,bus=ahci.0

 #-net none \
 #-drive file=windows_secure.rom,if=pflash,format=raw,unit=0 \
 #-drive file=windows_secure.vars,if=pflash,format=raw,unit=1

