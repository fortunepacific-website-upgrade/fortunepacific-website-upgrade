#!/bin/bash

echo "=== jQuery核心文件安全升级 ==="
echo "执行时间: $(date)"
echo "=========================="

WEB_ROOT="/www/wwwroot/fortunepacific.net"
BACKUP_DIR="/home/FORTUNE网站升级/备份/jquery_$(date +%Y%m%d_%H%M%S)"
WORK_DIR="/home/FORTUNE网站升级"

# 1. 创建新的备份
echo "1. 创建新的备份目录..."
mkdir -p "$BACKUP_DIR"

echo "2. 备份当前jQuery核心文件..."
CORE_FILES=(
    "static/js/jquery-3.7.1.min.js"
    "static/js/jquery-migrate-3.4.1.min.js"
    "static/js/jquery-compatibility-fix.js"
)

for file in "${CORE_FILES[@]}"; do
    if [ -f "$WEB_ROOT/$file" ]; then
        echo "备份: $file"
        cp "$WEB_ROOT/$file" "$BACKUP_DIR"
    else
        echo "警告: 文件不存在 $WEB_ROOT/$file"
    fi
done

# 2. 创建升级前的功能测试基线
echo "3. 创建升级前功能测试基线..."
/home/FORTUNE网站升级/jquery_function_test.sh > "$WORK_DIR/升级前功能测试基线.txt" 2>&1

echo "4. 升级准备完成"
echo "备份目录: $BACKUP_DIR"
echo "请检查以下事项："
echo "1. 已创建ECS快照"
echo "2. 已记录当前网站功能状态"
echo "3. 确认可以开始升级"

echo "=== 准备完成 ==="
