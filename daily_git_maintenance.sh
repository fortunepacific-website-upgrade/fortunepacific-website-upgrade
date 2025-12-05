#!/bin/bash
# 日常Git维护脚本

echo "=== 开始日常Git维护 ==="
cd /home/FORTUNE网站升级

# 1. 获取远程更新
echo "1. 获取远程更新..."
git fetch

# 2. 检查状态
echo "2. 检查Git状态..."
git status

# 3. 如果有未提交的更改，提示用户
if [ "$(git status --porcelain)" != "" ]; then
    echo "⚠️  检测到未提交的更改，请及时提交"
else
    echo "✅ 工作目录干净"
fi

# 4. 检查本地与远程是否同步
if [ "$(git status | grep 'Your branch is ahead')" != "" ]; then
    echo "⚠️  本地分支领先于远程分支，请及时推送"
elif [ "$(git status | grep 'Your branch is behind')" != "" ]; then
    echo "⚠️  本地分支落后于远程分支，请及时拉取"
elif [ "$(git status | grep 'have diverged')" != "" ]; then
    echo "⚠️  本地与远程分支已分化，请及时处理"
else
    echo "✅ 本地与远程分支已同步"
fi

echo "=== 日常Git维护完成 ==="
