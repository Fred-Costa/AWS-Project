### Update, Upgrade and Install a software (mdadm) used to manage and monitor software RAID devices, gdisk is useful as a diagnostic tool, (raidutils) is framework to manipulate RAID devices and cryptsetup is a utility used to conveniently set up disk encryption
 
-> `apt update && apt upgrade -y && apt install mdadm gdisk raidutils cryptsetup -y`


->  `gdisk /dev/xvdf`

Click: O, Y

Click: N, ENTER(3x), fd00, W, Y


-> `gdisk /dev/xvdg`

#Click: O, Y

#Click: N, ENTER(3x), fd00, W, Y


-> `gdisk /dev/xvdh`

#Click: O, Y

#Click: N, ENTER(3x), fd00, W, Y



* Explicacao

-> `mdadm --create /dev/md0 --level 5 --raid-devices 3 /dev/xvdj1 /dev/xvdk1 /dev/xvdl1`

* Explicacao

-> `mdadm --detail /dev/md0` (Wait until its 100%)


* Explicacao

-> `cryptsetup luksFormat --hash=sha512 --key-size=512 --cipher=aes-xts-plain64 --verify-passphrase /dev/md0`

### Pass: Passw0rd1


-> `cryptsetup luksOpen /dev/md0 md0_crypt`
#Pass: Passw0rd1


-> `pvcreate /dev/mapper/md0_crypt`


-> `vgcreate vg0 /dev/mapper/md0_crypt`


-> `lvcreate -n lv0 -l +75%FREE vg0`

-> `lvcreate -n lv1 -l +25%FREE vg0`


-> `mkfs.xfs /dev/vg0/lv0`

-> `mkfs.ext4 /dev/vg0/lv1`


-> `mkdir /mnt/raid5_homes`

-> `mkdir /mnt/userinfo`


-> `mount /dev/vg0/lv0 /mnt/raid5_homes/ && mount /dev/vg0/lv1 /mnt/userinfo/`


-> `cat /etc/mtab `
##### Copy last line.

-> `nano /etc/fstab`
##### Paste line and add "nofail"
