#!/bin/bash

echo "=== jQuery回滚脚本 ==="
echo "执行时间: $(date)"
echo "===================="

BACKUP_DIR=""
WEB_ROOT="/www/wwwroot/fortunepacific.net"

echo "可用的备份目录："
ls -la /home/FORTUNE网站升级/备份/ | grep jquery

echo ""
echo "请输入要回滚到的备份目录名（例如：jquery_20251115）："
read BACKUP_DIR_NAME

BACKUP_DIR="/home/FORTUNE网站升级/备份/$BACKUP_DIR_NAME"

if [ ! -d "$BACKUP_DIR" ]; then
    echo "错误：备份目录不存在"
    exit 1
fi

echo "确认要从 $BACKUP_DIR 回滚吗？(yes/no)"
read CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo "回滚操作已取消"
    exit 0
fi

echo "开始回滚..."
# 使用rsync进行回滚，保持原有文件属性
rsync -av "$BACKUP_DIR/www/wwwroot/fortunepacific.net/" "$WEB_ROOT/"

echo "回滚完成，请检查网站功能是否恢复正常"
echo "=== 回滚完成 ==="
