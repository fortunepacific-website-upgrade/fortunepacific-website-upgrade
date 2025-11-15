#!/bin/bash

echo "=== jQuery功能测试脚本 ==="
echo "测试时间: $(date)"
echo "========================"

WEB_ROOT="/www/wwwroot/fortunepacific.net"
TEST_DIR="/home/FORTUNE网站升级/测试报告"
mkdir -p "$TEST_DIR"

echo "1. 检查网站可访问性"
curl -s -o /dev/null -w "首页状态码: %{http_code}\n" "https://www.fortunepacific.net/"
curl -s -o /dev/null -w "管理后台状态码: %{http_code}\n" "https://www.fortunepacific.net/manage/"

echo "2. 检查jQuery加载"
echo "首页jQuery引用:" > "$TEST_DIR/jquery_loading_test.txt"
curl -s "https://www.fortunepacific.net/" | grep -i jquery >> "$TEST_DIR/jquery_loading_test.txt"
echo -e "\n管理后台jQuery引用:" >> "$TEST_DIR/jquery_loading_test.txt"
curl -s "https://www.fortunepacific.net/manage/" | grep -i jquery >> "$TEST_DIR/jquery_loading_test.txt"

echo "3. 检查控制台错误"
# 这里需要手动检查浏览器控制台，我们只能检查服务器端错误
echo "检查服务器错误日志:" > "$TEST_DIR/server_errors.txt"
tail -n 20 /www/wwwlogs/fortunepacific.net.log >> "$TEST_DIR/server_errors.txt"

echo "4. 检查关键功能文件是否存在"
echo "关键jQuery文件检查:" > "$TEST_DIR/file_check.txt"
find "$WEB_ROOT" -name "jquery*.min.js" -exec ls -la {} \; >> "$TEST_DIR/file_check.txt"

echo "功能测试完成，详细报告请查看 $TEST_DIR 目录"
echo "=== 测试完成 ==="
