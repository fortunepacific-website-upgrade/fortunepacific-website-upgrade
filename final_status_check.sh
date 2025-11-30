#!/bin/bash
# 最终状态检查脚本

echo "=== 开始最终状态检查 ==="

# 1. 检查网站访问状态
echo "1. 检查网站访问状态..."
curl -s -o /dev/null -w "网站首页状态码: %{http_code}\n" "https://www.fortunepacific.net/"
curl -s -o /dev/null -w "管理后台状态码: %{http_code}\n" "https://www.fortunepacific.net/manage/"

# 2. 检查关键文件
echo "2. 检查关键文件..."
ls -la /www/wwwroot/fortunepacific.net/static/js/plugin/jscrollpane/jquery.jscrollpane.js

# 3. 检查Git状态
echo "3. 检查Git状态..."
cd /home/FORTUNE网站升级
git status

# 4. 检查系统资源
echo "4. 检查系统资源..."
free -h | grep Mem

echo "=== 最终状态检查完成 ==="
