#!/bin/bash
disk_path=/var/lib/libvirt/images
xml_path=/etc/libvirt/qemu
newvm=0
vm=0

read -p "clone machine numbers:" number
if [[ ! "$number" =~ ^[0-9]+$ ]];then
	echo "you must input a number."
fi

if [ $number -le 0 -o $number -gt 20 ];then
	echo your number out of range.
fi

while [ $vm -lt $number ]
do 
  let newvm++
  if [ -f ${disk_path}/node${newvm}.img ]; then
	continue
  fi
  qemu-img create -f qcow2 -b ${disk_path}/centos.cow2 ${disk_path}/node${newvm}.img 20G &>/dev/null
  
  cp  ${xml_path}/.centos.xml ${xml_path}/node${newvm}.xml
  sed -i "9,40s/centos/node${newvm}/" ${xml_path}/node${newvm}.xml

  virsh define ${xml_path}/node${newvm}.xml &> /dev/null
  echo -e "created node${newvm} done.\t\t\t\033[32;1m[Done]\033[0m"
  let vm++
done
