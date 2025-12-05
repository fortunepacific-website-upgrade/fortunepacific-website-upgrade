#!/bin/bash
# 核心操作铁律检查脚本

echo "=== 核心操作铁律检查 ==="

# 检查是否存在项目执行铁律文件
if [ -f "/c/Users/华为/FORTUNE网站升级/配置文档/项目执行铁律.json" ]; then
    echo "✅ 项目执行铁律文件存在"
    echo "文件位置: /c/Users/华为/FORTUNE网站升级/配置文档/项目执行铁律.json"
else
    echo "⚠️ 项目执行铁律文件不存在"
    echo "建议恢复该文件以确保操作规范"
fi

echo "=== 检查完成 ==="
