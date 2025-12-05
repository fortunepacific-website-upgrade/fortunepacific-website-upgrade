#!/bin/bash
# VS Code 和通义灵码缓存清理脚本

echo "=== 开始清理 VS Code 和灵码缓存 ==="

# 1. 清理 VS Code 工作区存储
echo "1. 清理 VS Code 工作区存储..."
if [ -d "/c/Users/华为/AppData/Roaming/Code/User/workspaceStorage" ]; then
    rm -rf "/c/Users/华为/AppData/Roaming/Code/User/workspaceStorage/*"
    echo "✅ 工作区存储清理完成"
else
    echo "⚠️ 工作区存储目录不存在"
fi

# 2. 清理 VS Code 缓存
echo "2. 清理 VS Code 缓存..."
if [ -d "/c/Users/华为/AppData/Roaming/Code/Cache" ]; then
    rm -rf "/c/Users/华为/AppData/Roaming/Code/Cache/*"
    echo "✅ VS Code 缓存清理完成"
else
    echo "⚠️ VS Code 缓存目录不存在"
fi

# 3. 清理 VS Code 用户数据缓存
echo "3. 清理 VS Code 用户数据缓存..."
if [ -d "/c/Users/华为/AppData/Roaming/Code/User/globalStorage" ]; then
    # 只清理通义灵码的相关数据
    if [ -d "/c/Users/华为/AppData/Roaming/Code/User/globalStorage/tongyi.tongyi-lingma" ]; then
        rm -rf "/c/Users/华为/AppData/Roaming/Code/User/globalStorage/tongyi.tongyi-lingma/cache"
        rm -rf "/c/Users/华为/AppData/Roaming/Code/User/globalStorage/tongyi.tongyi-lingma/history"
        echo "✅ 通义灵码缓存和历史记录清理完成"
    fi
else
    echo "⚠️ VS Code 全局存储目录不存在"
fi

echo "=== 缓存清理完成 ==="
