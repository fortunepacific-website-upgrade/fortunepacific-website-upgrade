#!/bin/bash
# 系统健康检查脚本

echo "=== 开始系统健康检查 ==="

# 1. 检查系统资源使用情况
echo "1. 系统资源使用情况："
echo "CPU使用率："
top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1
echo "内存使用率："
free | grep Mem | awk '{printf("%.2f%%", $3/$2 * 100.0)}'
echo "磁盘使用率："
df -h / | awk 'NR==2 {print $5}'

# 2. 检查Web服务状态
echo "2. Web服务状态："
curl -s -o /dev/null -w "网站状态码: %{http_code}\n" "https://www.fortunepacific.net/"

# 3. 检查进程数
echo "3. 系统进程数："
ps aux | wc -l

echo "=== 系统健康检查完成 ==="
