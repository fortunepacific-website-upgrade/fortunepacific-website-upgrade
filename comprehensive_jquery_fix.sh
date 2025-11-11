#!/bin/bash

echo "=== 全面jQuery兼容性修复 ==="
DATE=$(date +%Y%m%d_%H%M%S)

# 备份所有JS文件
echo "1. 备份所有相关JS文件"
find /www/wwwroot/fortunepacific.net/static/ -name "*.js" -exec cp {} {}.backup_$DATE \; 2>/dev/null

# 修复所有.size()问题
echo "2. 修复所有.size()问题"
find /www/wwwroot/fortunepacific.net/static/ -name "*.js" -exec sed -i 's/\.size()/\.length/g' {} \;

# 验证修复结果
echo "3. 验证修复结果"
SIZE_COUNT=$(find /www/wwwroot/fortunepacific.net/static/ -name "*.js" -exec grep -l "\.size()" {} \; | wc -l)
echo "仍包含.size()的文件数量: $SIZE_COUNT"

LENGTH_COUNT=$(find /www/wwwroot/fortunepacific.net/static/ -name "*.js" -exec grep -l "\.length" {} \; | wc -l)
echo "包含.length的文件数量: $LENGTH_COUNT"

echo "=== 修复完成 ==="
