#!/bin/bash

echo "=== Fortunepacific 网站jQuery版本详细分析 ==="
echo "分析时间: $(date)"
echo "==================================="

# 1. 查找所有jQuery相关文件
echo "1. 查找所有jQuery相关文件:"
find /www/wwwroot/fortunepacific.net -name "*jquery*" -type f | sort

echo -e "\n2. 分析每个jQuery文件的版本信息:"
find /www/wwwroot/fortunepacific.net -name "*jquery*" -type f | while read file; do
    echo "文件: $file"
    head -3 "$file" 2>/dev/null | grep -i "jquery\|version" || echo "无法读取版本信息"
    echo "---"
done

echo -e "\n3. 检查管理后台页面引用的jQuery:"
curl -s "https://www.fortunepacific.net/manage/" | grep -i jquery

echo -e "\n4. 检查前端页面引用的jQuery:"
curl -s "https://www.fortunepacific.net/" | grep -i jquery

echo -e "\n5. 统计不同版本的jQuery文件:"
echo "jQuery文件总数: $(find /www/wwwroot/fortunepacific.net -name "*jquery*.js" | wc -l)"

echo -e "\n=== jQuery版本分析完成 ==="
