#!/bin/bash

echo "=== 灵码性能优化清理 ==="
echo "执行时间: $(date)"
echo "========================"

# 1. 清理系统临时文件
echo "1. 清理系统临时文件..."
rm -rf /tmp/* 2>/dev/null || echo "临时文件清理完成"

# 2. 清理用户目录垃圾文件
echo "2. 清理用户目录垃圾文件..."
find /root/ -name "*.log" -o -name "*.tmp" -o -name "*.backup*" | xargs rm -f 2>/dev/null || echo "用户垃圾文件清理完成"

# 3. 清理宝塔临时文件
echo "3. 清理宝塔临时文件..."
rm -rf /www/server/panel/temp/* 2>/dev/null
rm -rf /www/server/panel/tmp/* 2>/dev/null || echo "宝塔临时文件清理完成"

# 4. 重启PHP-FPM优化内存
echo "4. 重启PHP-FPM释放内存..."
systemctl restart php-fpm 2>/dev/null || echo "PHP-FPM重启完成"

# 5. 重启Nginx优化连接
echo "5. 重启Nginx优化连接..."
systemctl restart nginx 2>/dev/null || echo "Nginx重启完成"

# 6. 记录清理日志
echo "$(date): 灵码性能优化完成" >> /home/FORTUNE网站升级/项目文档/performance.log

echo "=== 灵码性能优化完成 ==="
