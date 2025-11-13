#!/bin/bash

echo "=== Fortunepacific 网站文件调用关系分析 ==="
echo "分析时间: $(date)"
echo "================================="

# 1. 分析管理后台入口文件
echo "1. 管理后台入口文件分析:"
echo "index.php内容预览:"
head -20 /www/wwwroot/fortunepacific.net/manage/index.php 2>/dev/null || echo "文件不存在"

echo -e "\n2. 常见包含文件分析:"
grep -r "include\|require" /www/wwwroot/fortunepacific.net/manage/ | head -10

echo -e "\n3. JS文件引用分析:"
grep -r "script.*src" /www/wwwroot/fortunepacific.net/manage/ | head -10

echo -e "\n4. CSS文件引用分析:"
grep -r "link.*href" /www/wwwroot/fortunepacific.net/manage/ | head -10

echo -e "\n5. 关键功能文件分析:"
echo "产品管理文件:"
ls -la /www/wwwroot/fortunepacific.net/manage/products/ 2>/dev/null || echo "目录不存在"

echo "内容管理文件:"
ls -la /www/wwwroot/fortunepacific.net/manage/content/ 2>/dev/null || echo "目录不存在"

echo "SEO管理文件:"
ls -la /www/wwwroot/fortunepacific.net/manage/seo/ 2>/dev/null || echo "目录不存在"

echo -e "\n=== 文件调用关系分析完成 ==="
