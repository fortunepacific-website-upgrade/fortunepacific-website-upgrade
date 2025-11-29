#!/bin/bash
# Git同步修复脚本

echo "=== 开始Git同步修复 ==="
cd /home/FORTUNE网站升级

# 1. 获取远程更新
echo "1. 获取远程更新..."
git fetch

# 2. 检查当前状态
echo "2. 检查当前状态..."
git status

# 3. 尝试合并
echo "3. 尝试合并远程更改..."
git merge origin/master

# 4. 如果合并成功，推送更改
if [ $? -eq 0 ]; then
    echo "合并成功，尝试推送..."
    git push origin master
    if [ $? -eq 0 ]; then
        echo "✅ Git同步修复成功完成"
    else
        echo "❌ 推送失败，请检查网络和认证"
    fi
else
    echo "❌ 合并失败，可能存在冲突"
    echo "请手动解决冲突后再推送"
fi

echo "=== Git同步修复脚本执行完成 ==="
