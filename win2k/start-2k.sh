cd /workspaces/${GITHUB_REPOSITORY#*/}/win2k
f=win2k-wu.qcow2 # github codespace keeps files, so not use git-lfs nor qcow2-inc-snapshot
#qemu-img create -b $PWD/win2k-wu.qcow2 -F qcow2 -f qcow2 -o compression_type=zstd /tmp/win2k.qcow2
sudo qemu-system-x86_64 -smp 2 -m 512M -vnc :0 -drive file=$f \
 -machine pc,accel=kvm -usbdevice tablet -vga cirrus -nic model=rtl8139 \
 "$@"
