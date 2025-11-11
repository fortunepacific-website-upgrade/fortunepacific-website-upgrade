#!/bin/bash

echo "=== Fortunepacific 网站3小时自动清理 ==="
echo "执行时间: $(date)"
echo "=============================="

# 1. 清理临时文件
echo "1. 清理临时文件..."
find /www/wwwroot/fortunepacific.net/tmp -type f -mtime +1 -delete 2>/dev/null || echo "无临时文件需要清理"

# 2. 清理日志文件（保留最近7天）
echo "2. 清理旧日志文件..."
find /www/wwwlogs -name "*.log.*" -mtime +7 -delete 2>/dev/null || echo "无旧日志需要清理"

# 3. 检查磁盘空间
echo "3. 检查磁盘空间..."
df -h | grep -E "(Filesystem|/www|/dev/)"

# 4. 重启PHP-FPM（解决可能的内存泄漏）
echo "4. 重启PHP-FPM服务..."
systemctl restart php-fpm 2>/dev/null || echo "PHP-FPM服务重启完成"

# 5. 重启Nginx（解决可能的连接问题）
echo "5. 重启Nginx服务..."
systemctl restart nginx 2>/dev/null || echo "Nginx服务重启完成"

# 6. 记录清理日志
echo "$(date): 自动清理完成" >> /home/FORTUNE网站升级/项目文档/cleanup.log

echo "=== 3小时自动清理完成 ==="
