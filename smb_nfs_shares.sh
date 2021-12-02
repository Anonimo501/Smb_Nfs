#!/bin/bash

echo ""
echo -e "\e[31m Ingrese la IP Victima   \e[0m"
echo ""
read ip

# Enumerar Shares con SMBmap y SMBclient
echo ""
echo -e "\e[31m SmbMap y SmbClient      \e[0m"
echo ""

smbmap -H $ip

echo ""
echo -e "\e[33m-----------------------------------------------------\e[0m"
echo ""

smbclient \\\\$ip\\anonymous

echo ""
echo -e "\e[33m-----------------------------------------------------\e[0m"
echo ""

echo ""
echo -e "\e[31m NFS     \e[0m"
echo ""

# Enumerar Shares con Nmap - NFS (Network File Share)
nmap -p 111,2049 --script=nfs-ls, nfs-statfs, nfs-showmount $ip

echo ""
echo -e "\e[33m-----------------------------------------------------\e[0m"
echo ""

echo ""
echo -e "\e[31m Enum4Linux     \e[0m"
echo ""

enum4linux -a $ip

