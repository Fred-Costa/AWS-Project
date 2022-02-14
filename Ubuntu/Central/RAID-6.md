- `gdisk /dev/xvdf`
> Clicar: O, Y
> Clicar: N, ENTER(3x), fd00, W, Y



- `gdisk /dev/xvdg`
> Clicar: O, Y
> Clicar: N, ENTER(3x), fd00, W, Y



- `gdisk /dev/xvdh`
> Clicar: O, Y
> Clicar: N, ENTER(3x), fd00, W, Y



- `gdisk /dev/xvdi`
> Clicar: O, Y
> Clicar: N, ENTER(3x), fd00, W, Y



- `mdadm --create /dev/md1 --level 6 --raid-devices 4 /dev/xvdf1 /dev/xvdg1 /dev/xvdh1 /dev/xvdi1`



- `mdadm --detail /dev/md1`
> Esperar até tar 100%



- `pvcreate /dev/md1`



- `vgcreate vg1 /dev/md1`



- `lvcreate -n lv0 -l +50%FREE vg1`
- `lvcreate -n lv1 -l +50%FREE vg1`



- `cryptsetup luksFormat --hash=sha512 --key-size=512 --cipher=aes-xts-plain64 --verify-passphrase /dev/vg1/lv0`
> Pass: SuperPass



- `cryptsetup luksFormat --hash=sha512 --key-size=512 --cipher=aes-xts-plain64 --verify-passphrase /dev/vg1/lv1`
> Pass: SuperPass1


- `mkfs.xfs /dev/mapper/vg1lv0_crypt && mkfs.xfs /dev/mapper/vg1lv1_crypt`



- `mkdir /mnt/dados && mkdir /mnt/info`



- `mount /dev/mapper/vg1lv0_crypt /mnt/dados && mount /dev/mapper/vg1lv1_crypt /mnt/info`


> Copiar as ultimas 2 linhas
- `cat /etc/mtab`

> Colar as linhas e adicionar "nofail"
- `nano /etc/fstab`
