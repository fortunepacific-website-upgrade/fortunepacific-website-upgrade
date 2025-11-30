#!/bin/bash
# 日常自动检查脚本

echo "=== 开始日常自动检查 ==="
cd /home/FORTUNE网站升级

# 1. 检查网站状态
echo "1. 检查网站状态..."
curl -s -o /dev/null -w "网站首页状态码: %{http_code}\n" "https://www.fortunepacific.net/"
curl -s -o /dev/null -w "管理后台状态码: %{http_code}\n" "https://www.fortunepacific.net/manage/"

# 2. 检查关键服务
echo "2. 检查关键服务..."
ps aux | grep nginx | grep -v grep > /dev/null && echo "✅ Nginx运行中" || echo "❌ Nginx未运行"
ps aux | grep php-fpm | grep -v grep > /dev/null && echo "✅ PHP-FPM运行中" || echo "❌ PHP-FPM未运行"

# 3. 检查Git状态
echo "3. 检查Git状态..."
git status

echo "=== 日常自动检查完成 ==="
