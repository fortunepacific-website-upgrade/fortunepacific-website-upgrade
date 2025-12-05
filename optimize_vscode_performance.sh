#!/bin/bash
# VS Code 和通义灵码性能优化脚本

echo "=== 开始优化 VS Code 和灵码性能 ==="

# 1. 检查系统资源
echo "1. 检查系统资源使用情况..."
free -h
df -h /

# 2. 清理系统缓存
echo "2. 清理系统缓存..."
sync
if [ -f "/proc/sys/vm/drop_caches" ]; then
    echo 3 > /proc/sys/vm/drop_caches
    echo "✅ 系统缓存清理完成"
else
    echo "⚠️ 无法清理系统缓存"
fi

# 3. 重启相关服务
echo "3. 检查相关服务状态..."
systemctl --type=service | grep -E "(code|lingma|tongyi)" || echo "未找到相关服务"

echo "=== 性能优化完成 ==="
