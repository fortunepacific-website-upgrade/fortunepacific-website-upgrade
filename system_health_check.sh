#!/bin/bash

echo "=== Fortunepacific 系统健康检查 ==="
echo "检查时间: $(date)"
echo "================================"

echo -e "\n1. 服务状态检查:"
echo "Nginx状态: $(systemctl is-active nginx 2>/dev/null || echo '未使用systemctl管理')"
echo "PHP-FPM状态: $(systemctl is-active php-fpm 2>/dev/null || echo '未使用systemctl管理')"

echo -e "\n2. 进程检查:"
echo "Nginx进程数: $(ps aux | grep nginx | grep -v grep | wc -l)"
echo "PHP进程数: $(ps aux | grep php-fpm | grep -v grep | wc -l)"

echo -e "\n3. 磁盘空间检查:"
df -h | grep -E "(Filesystem|/www|/dev/)"

echo -e "\n4. 内存使用情况:"
free -h

echo -e "\n5. 网站可访问性检查:"
curl -s -o /dev/null -w "主站状态: %{http_code}\n" "https://www.fortunepacific.net/" 2>/dev/null || echo "主站状态: 无法访问"
curl -s -o /dev/null -w "管理后台状态: %{http_code}\n" "https://www.fortunepacific.net/manage/" 2>/dev/null || echo "管理后台状态: 无法访问"

echo -e "\n6. 上传目录检查:"
echo "上传目录文件数: $(find /www/wwwroot/fortunepacific.net/u_file/ -type f | wc -l)"
echo "最近修改的上传文件:"
find /www/wwwroot/fortunepacific.net/u_file/ -type f -mtime -7 | head -3

echo -e "\n=== 检查完成 ==="
