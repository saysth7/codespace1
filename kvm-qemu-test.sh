# apt install cpu-checker
sudo kvm-ok

# sudo apt install --no-install-recommends libvirt-clients
sudo virt-host-validate qemu

qemu-system-x86_64 -enable-kvm -cpu host -machine type=q35,accel=kvm -nographic -daemonize -pidfile /tmp/qemu-test.pid
echo $?
sleep 2
cat /tmp/qemu-test.pid 2>/dev/null && kill $(cat /tmp/qemu-test.pid) 2>/dev/null

