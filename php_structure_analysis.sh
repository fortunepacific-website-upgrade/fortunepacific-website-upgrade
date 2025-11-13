#!/bin/bash

echo "=== Fortunepacific 网站PHP框架结构分析 ==="
echo "分析时间: $(date)"
echo "=================================="

# 1. 分析主要目录结构
echo "1. 主要目录结构:"
ls -la /www/wwwroot/fortunepacific.net/ | grep "^d"

echo -e "\n2. 管理后台目录结构:"
ls -la /www/wwwroot/fortunepacific.net/manage/ | head -20

echo -e "\n3. 静态资源目录结构:"
ls -la /www/wwwroot/fortunepacific.net/static/ | head -10

echo -e "\n4. 核心类文件分析:"
echo "ly200.class.php文件位置:"
find /www/wwwroot/fortunepacific.net -name "ly200.class.php"

echo -e "\n5. 配置文件分析:"
find /www/wwwroot/fortunepacific.net -name "*.config*" -o -name "*config*" | head -10

echo -e "\n6. 数据库连接文件:"
find /www/wwwroot/fortunepacific.net -name "*db*" -o -name "*database*" | head -10

echo -e "\n=== PHP框架结构分析完成 ==="
