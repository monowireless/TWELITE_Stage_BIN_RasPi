#!/bin/bash

echo "### copy udev rule file 51-ftdi.rules."
cp -fv 51-ftdi.rules /etc/udev/rules.d

echo "### reload udev rules."
udevadm control --reload-rules
udevadm trigger

