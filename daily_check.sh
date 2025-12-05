#!/bin/bash
echo "=== 每日检查 ==="
date
echo "系统负载："
uptime
echo "磁盘使用："
df -h /
echo "内存使用："
free -h
echo "网络连接测试："
ping -c 1 tongyi.aliyun.com >/dev/null 2>&1 && echo "✅ 网络正常" || echo "❌ 网络异常"
echo "=== 检查完成 ==="
