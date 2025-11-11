#!/bin/bash

echo "=== jQuery兼容性问题修复脚本 ==="
echo "执行时间: $(date)"
echo "================================"

echo "1. 备份原文件"
cp /www/wwwroot/fortunepacific.net/static/manage/js/frame.js /www/wwwroot/fortunepacific.net/static/manage/js/frame.js.backup_$(date +%Y%m%d)
cp /www/wwwroot/fortunepacific.net/static/js/global.js /www/wwwroot/fortunepacific.net/static/js/global.js.backup_$(date +%Y%m%d)

echo "2. 修复frame.js文件中的.size()问题"
sed -i 's/\.size()/\.length/g' /www/wwwroot/fortunepacific.net/static/manage/js/frame.js

echo "3. 修复global.js文件中的.size()问题"
sed -i 's/\.size()/\.length/g' /www/wwwroot/fortunepacific.net/static/js/global.js

echo "4. 验证修复"
echo "frame.js中的.length出现次数: $(grep -c "\.length" /www/wwwroot/fortunepacific.net/static/manage/js/frame.js)"
echo "global.js中的.length出现次数: $(grep -c "\.length" /www/wwwroot/fortunepacific.net/static/js/global.js)"

echo "修复完成！请刷新管理后台页面测试。"
