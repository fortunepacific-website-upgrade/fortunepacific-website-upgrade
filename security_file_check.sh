#!/bin/bash

echo "=== Fortunepacific 网站安全文件检查 ==="
echo "检查时间: $(date)"
echo "=============================="

# 1. 检查最近修改的可疑文件
echo "1. 最近7天修改的PHP文件:"
find /www/wwwroot/fortunepacific.net -name "*.php" -mtime -7 -ls

echo -e "\n2. 检查可疑的上传文件:"
find /www/wwwroot/fortunepacific.net -name "*.php" -path "*/test/*" -ls

echo -e "\n3. 检查webshell特征:"
grep -r "eval\|base64_decode\|assert" /www/wwwroot/fortunepacific.net/ --include="*.php" | head -5

echo -e "\n4. 检查文件权限:"
echo "777权限文件:"
find /www/wwwroot/fortunepacific.net -type f -perm 777 | head -5

echo -e "\n5. 检查可写目录:"
echo "可写目录数量:"
find /www/wwwroot/fortunepacific.net -type d -perm -o+w | wc -l

echo -e "\n=== 安全文件检查完成 ==="
