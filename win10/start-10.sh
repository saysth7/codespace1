cd /workspaces/${GITHUB_REPOSITORY#*/}/win10
f=win10-bk.qcow2 # github codespace keeps files, so not use git-lfs nor qcow2-inc-snapshot
#qemu-img create -b $PWD/win10-bk.qcow2 -F qcow2 -f qcow2 -o compression_type=zstd /tmp/win10.qcow2
sudo qemu-system-x86_64 -smp 2 -m 4G -vnc :0 \
 -machine q35 -enable-kvm -usbdevice tablet \
 -drive file=$f \
 -drive file=windows_secure.rom,if=pflash,format=raw,unit=0 \
 -drive file=windows_secure.vars,if=pflash,format=raw,unit=1
 #-monitor stdio -net none \

