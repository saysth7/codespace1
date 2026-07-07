f=/tmp/win11.qcow2
sudo qemu-system-x86_64 -smp 2 -m 4G -vnc :0 \
 -machine q35,accel=kvm -nic user,model=virtio -usbdevice tablet \
 -monitor stdio \
 -enable-kvm \
 -drive file=$f,if=virtio \
 -rtc base=utc,clock=host,driftfix=slew \
 -no-hpet \ 
 -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_vpindex,hv_time,hv_synic,hv_stimer \
# last line good. hpet?
