#cd /workspaces/${GITHUB_REPOSITORY#*/}/win7
#cd /workspaces/win/win7
bk=/tmp/win10-sura-my-bk.qcow2
f=/tmp/win10.qcow2
[ -f $f ] && echo "warn: $f exist, backed up." && mv $f $f.bk
#[ -f $f ] || cp win10-bk.qcow2 $f # github codespace keeps files, so not use git-lfs nor qcow2-inc-snapshot
qemu-img create -b $bk -F qcow2 -f qcow2 $f
sudo qemu-system-x86_64 -smp 2 -m 4G -vnc :0 \
 -machine q35 -nic user,model=virtio -usbdevice tablet \
 -monitor stdio \
 -enable-kvm \
 -drive file=$f,if=none,id=disk0 \
 -device ich9-ahci,id=ahci \
 -device ide-hd,drive=disk0,bus=ahci.0
 #-drive file=$f,if=ide\
 #-cpu host,kvm=off,level=11,-hypervisor \

 #-net none \
 #-drive file=windows_secure.rom,if=pflash,format=raw,unit=0 \
 #-drive file=windows_secure.vars,if=pflash,format=raw,unit=1

