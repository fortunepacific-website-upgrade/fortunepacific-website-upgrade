#!/bin/bash
# 自动推送脚本

echo "=== 开始自动推送 ==="
cd /home/FORTUNE网站升级

# 获取远程更新
echo "获取远程更新..."
git fetch

# 检查状态
echo "检查Git状态..."
git status

# 推送到远程仓库
echo "推送到GitHub远程仓库..."
git push origin master

if [ $? -eq 0 ]; then
    echo "✅ Git推送成功完成"
else
    echo "❌ Git推送失败，请检查网络连接和认证信息"
fi

echo "=== 自动推送完成 ==="
