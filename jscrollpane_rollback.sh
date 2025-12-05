#!/bin/bash
# jScrollPanel紧急回滚脚本

echo "=== 开始jScrollPanel紧急回滚 ==="

# 查找最新的备份文件
BACKUP_FILE=$(ls -t /home/FORTUNE网站升级/plugin_backups/jscrollpane/jquery.jscrollpane.js.backup_* 2>/dev/null | head -1)

if [ -z "$BACKUP_FILE" ]; then
    echo "❌ 未找到jScrollPanel备份文件"
    exit 1
fi

echo "找到备份文件: $BACKUP_FILE"

# 备份当前有问题的文件（以防需要恢复）
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)
cp /www/wwwroot/fortunepacific.net/static/js/plugin/jscrollpane/jquery.jscrollpane.js \
   /www/wwwroot/fortunepacific.net/static/js/plugin/jscrollpane/jquery.jscrollpane.js.bad.$CURRENT_TIME

echo "已备份当前文件为: jquery.jscrollpane.js.bad.$CURRENT_TIME"

# 恢复备份文件
echo "恢复备份文件..."
cp "$BACKUP_FILE" /www/wwwroot/fortunepacific.net/static/js/plugin/jscrollpane/jquery.jscrollpane.js

# 设置正确的权限
chown www:www /www/wwwroot/fortunepacific.net/static/js/plugin/jscrollpane/jquery.jscrollpane.js
chmod 644 /www/wwwroot/fortunepacific.net/static/js/plugin/jscrollpane/jquery.jscrollpane.js

# 重启Web服务
echo "重启Web服务..."
nginx -t && /www/server/nginx/sbin/nginx -s reload
/etc/init.d/php-fpm-54 restart

echo "✅ jScrollPanel回滚完成"
echo "请刷新页面检查是否恢复正常"
echo "=== 回滚完成 ==="
