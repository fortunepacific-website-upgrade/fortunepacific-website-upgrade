#!/bin/bash

echo "=== jQuery版本监控报告 ==="
echo "生成时间: $(date)"
echo "========================"

echo "1. 系统中存在的jQuery版本:"
find /www/wwwroot/fortunepacific.net/ -name "jquery*.js" -not -name "*.map" | while read file; do
    echo "文件: $file"
    head -1 "$file" 2>/dev/null || echo "无法读取文件头"
    echo "---"
done

echo "2. 页面中引用的jQuery:"
curl -s "https://www.fortunepacific.net/manage/" | grep -i jquery | grep -v "jquery-compatibility-fix\|jquery-migrate" | head -5

echo "3. 检查仍包含.size()的文件:"
find /www/wwwroot/fortunepacific.net/ -name "*.js" -exec grep -l "\.size()" {} \; 2>/dev/null || echo "未发现.size()调用"

echo "4. 检查jQuery相关错误日志:"
tail -20 /www/wwwlogs/fortunepacific.net.log | grep -i jquery || echo "近期无jQuery相关错误"

echo "=== 监控完成 ==="
