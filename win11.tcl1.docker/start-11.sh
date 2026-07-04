cd /workspaces/codespace1/win11.tcl1.docker
sudo qemu-system-x86_64 -smp 2 -m 4G -vnc :0 \
 -machine q35 -enable-kvm -usbdevice tablet \
 -drive if=pflash,format=raw,file=uefi.fd,readonly=on \
 -drive if=pflash,format=raw,file=uefi.vars \
 -net none -monitor stdio \
 -drive file=a.qcow2,if=none,format=qcow2,discard=unmap,id=disk0 \
-device ich9-ahci,id=ahci0 \
-device ide-hd,drive=disk0,bus=ahci0.0

# -drive file=a.qcow2,if=virtio,format=qcow2,discard=unmap \
 #-drive file=a.qcow2,if=none,id=nvme0,format=qcow2,discard=unmap \
 #-device nvme,drive=nvme0,serial=win11 \

# -drive file=a.qcow2,if=none,format=qcow2,id=disk0 \
# -device ahci,id=ahci0 \
# -drive file=a.qcow2,if=none,format=qcow2,id=disk0 \
#  -device ide-hd,drive=disk0,bus=0.0 \
# -drive file=windows_secure.rom,if=pflash,format=raw,unit=0 \
# -drive file=windows_secure.vars,if=pflash,format=raw,unit=1
 #-drive file=a.qcow2,if=virtio,format=qcow2,discard=unmap \

 #-device virtio-blk-pci,drive=disk0 \
