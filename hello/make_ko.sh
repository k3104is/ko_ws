#!/bin/bash


cat <<EOF > test.c
#include <linux/module.h>

static int __init test_init(void)
{
  printk(KERN_INFO "Hello World\n");
  return 0;
}

static void __exit test_exit(void)
{
  printk(KERN_INFO "Bye!\n");
}

module_init(test_init);
module_exit(test_exit);

MODULE_AUTHOR("hana_shin");
MODULE_LICENSE("GPL v2");
EOF

make

sudo insmod test.ko

lsmod | grep test

sudo dmesg | tail -f

sudo rmmod test.ko

lsmod | grep test

rm *.symvers *.order *.ko *.mod *.o *.c 
