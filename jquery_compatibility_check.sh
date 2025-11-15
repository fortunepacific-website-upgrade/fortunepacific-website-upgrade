#!/bin/bash

echo "=== jQuery兼容性详细检查 ==="
echo "检查时间: $(date)"
echo "=========================="

# 1. 检查网站主要功能页面
echo "1. 检查首页jQuery加载:"
curl -s "https://www.fortunepacific.net/" | grep -i jquery

echo -e "\n2. 检查管理后台jQuery加载:"
curl -s "https://www.fortunepacific.net/manage/" | grep -i jquery

# 3. 检查是否存在已废弃的.size()方法调用
echo -e "\n3. 检查.size()方法使用情况:"
find /www/wwwroot/fortunepacific.net -name "*.js" -exec grep -l "\.size()" {} \;

# 4. 检查.bind()和.unbind()方法使用情况
echo -e "\n4. 检查.bind()方法使用情况:"
find /www/wwwroot/fortunepacific.net -name "*.js" -exec grep -l "\.bind(" {} \;

# 5. 检查.live()方法使用情况
echo -e "\n5. 检查.live()方法使用情况:"
find /www/wwwroot/fortunepacific.net -name "*.js" -exec grep -l "\.live(" {} \;

echo -e "\n=== 兼容性检查完成 ==="
