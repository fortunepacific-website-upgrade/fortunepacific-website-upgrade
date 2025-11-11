#!/bin/bash

echo "=== Fortunepacific 系统检查报告 ==="
echo "检查时间: $(date)"
echo "================================"

echo -e "\n1. 软件版本信息:"
echo "PHP版本: $(php -v | head -n 1)"
echo "MySQL版本: $(mysql -V)"
echo "Nginx版本: $(nginx -v 2>&1)"

echo -e "\n2. 网站目录结构:"
ls -la /www/wwwroot/fortunepacific.net/

echo -e "\n3. 查找可能的上传目录:"
find /www/wwwroot/fortunepacific.net/ -name "*upload*" -type d
find /www/wwwroot/fortunepacific.net/ -name "*photo*" -type d

echo -e "\n4. 检查最近修改的PHP文件:"
find /www/wwwroot/fortunepacific.net/ -name "*.php" -mtime -7 -ls

echo -e "\n5. 检查Web服务器进程:"
ps aux | grep nginx
ps aux | grep php

echo -e "\n6. 检查磁盘使用情况:"
df -h

echo -e "\n=== 检查完成 ==="
