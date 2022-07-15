#!/bin/bash

# Install
pacman -S acpid --noconfirm &> /dev/null

# Enable
systemctl enable acpid &> /dev/null

# Start
systemctl start acpid &> /dev/null

sed -i "s#^logger "'"LID opened"'"$/{$!{ N
		;;#logger "'"LID opened"'"
                DISPLAY=:0.0 su justin -c "'"etc/acpi/dm-multimonitor.sh"'"
		;;#g" /etc/acpi/handler.sh


        sed '/^a test$/{$!{N;s/^a test\nPlease do not$/not a test\nBe/;ty;P;D;:y}}' alpha.txt
