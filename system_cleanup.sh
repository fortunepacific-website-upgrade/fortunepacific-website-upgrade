#!/bin/bash

# 系统定期清理脚本
echo "=== 系统定期清理 ==="
echo "执行时间: $(date)"

# 清理系统缓存
echo "1. 清理系统缓存..."
sync
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches

# 清理宝塔日志
echo "2. 清理宝塔日志..."
> /www/wwwlogs/bt_default.log 2>/dev/null || true
> /www/wwwlogs/error.log 2>/dev/null || true

# 清理大型日志文件
echo "3. 清理大型日志文件..."
cd /www/wwwlogs/
for logfile in *.log; do
    if [ -f "$logfile" ]; then
        lines=$(wc -l < "$logfile")
        if [ "$lines" -gt 5000 ]; then
            tail -2000 "$logfile" > "/tmp/${logfile}" && mv "/tmp/${logfile}" "$logfile"
            echo "已清理 $logfile，保留最近2000行"
        fi
    fi
done

# 清理临时文件
echo "4. 清理临时文件..."
rm -rf /tmp/* 2>/dev/null || true
rm -rf /var/tmp/* 2>/dev/null || true

# 清理项目临时文件
echo "5. 清理项目临时文件..."
rm -rf /home/FORTUNE网站升级/分析报告/jQuery分析/* 2>/dev/null || true
rm -rf /home/FORTUNE网站升级/测试报告/* 2>/dev/null || true

echo "6. 系统状态检查:"
echo "内存使用情况: $(free -m | grep "buffers/cache" | awk '{print $3 "MB used, " $4 "MB free"}')"
echo "磁盘使用情况: $(df -h / | tail -1 | awk '{print $5 " used"}')"
echo "系统负载: $(uptime | awk -F'load average:' '{print $2}')"

echo "=== 清理完成 ==="
