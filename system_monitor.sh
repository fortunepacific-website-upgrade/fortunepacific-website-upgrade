#!/bin/bash
# 系统性能监控脚本

echo "=== 系统性能监控报告 ($(date)) ==="
echo "CPU使用率："
top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1
echo "内存使用率："
free | grep Mem | awk '{printf("%.2f%%", $3/$2 * 100.0)}'
echo "磁盘使用率："
df -h / | awk 'NR==2 {print $5}'
echo "系统负载："
uptime | awk -F'load average:' '{print $2}'
echo "活跃连接数："
netstat -an | grep :80 | wc -l
echo "=== 监控报告结束 ==="
