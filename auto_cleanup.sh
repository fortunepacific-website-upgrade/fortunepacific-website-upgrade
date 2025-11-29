#!/bin/bash
# 定期清理脚本

echo "执行定期清理任务 ($(date))..."

# 清理系统缓存
sync
echo 3 > /proc/sys/vm/drop_caches 2>/dev/null

# 清理临时文件
rm -rf /tmp/* 2>/dev/null

# 清理宝塔日志（保留最近7天）
find /www/server/panel/logs -name "*.log" -mtime +7 -delete 2>/dev/null

# 清理网站日志（保留最近7天）
find /www/wwwlogs -name "*.log" -mtime +7 -delete 2>/dev/null

echo "定期清理任务完成 ($(date))"
