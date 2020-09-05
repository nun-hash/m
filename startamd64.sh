#!/bin/sh
CHROOT=$@
unset LD_PRELOAD
proot --link2symlink --kill-on-exit \
 -0 -q qemu-x86_64 \
 -r $CHROOT \
 -b /data \
 -b /system \
 -b /storage \
 -b /dev \
 -b /proc \
 -b /sys \
 -b $CHROOT/root:/dev/shm \
 -b $CHROOT/proc/version:/proc/version \
 -w /root \
 /usr/bin/env -i \
 TERM=xterm-256color \
 HOME=/root \
 PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/games:/usr/local/games \
 USER=root \
 /bin/bash -l
