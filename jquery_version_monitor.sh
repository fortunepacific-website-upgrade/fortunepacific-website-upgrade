#!/bin/bash
# jQuery版本监控脚本

echo "=== 开始jQuery版本监控 ==="

# 检查当前jQuery版本
echo "检查当前jQuery版本..."
if [ -f "/www/wwwroot/fortunepacific.net/static/js/jquery-3.7.1.min.js" ]; then
    echo "✅ jQuery文件存在"
    ls -la /www/wwwroot/fortunepacific.net/static/js/jquery-3.7.1.min.js
else
    echo "❌ jQuery文件不存在"
fi

# 检查jQuery插件
echo "检查jQuery插件..."
ls -la /www/wwwroot/fortunepacific.net/static/js/plugin/

echo "=== jQuery版本监控完成 ==="
