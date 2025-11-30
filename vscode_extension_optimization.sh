#!/bin/bash
# VS Code 扩展优化脚本

echo "=== 开始 VS Code 扩展优化 ==="

# 1. 列出已安装的扩展
echo "1. 已安装的扩展："
code --list-extensions 2>/dev/null || echo "无法列出扩展，请在 Windows 中手动检查"

# 2. 推荐禁用的扩展（减少资源占用）
echo "2. 推荐禁用的扩展（减少资源占用）："
echo "   - ms-vscode.vscode-jsonrpc"
echo "   - ms-vscode.vscode-typescript-next"
echo "   - ms-vscode.vscode-markdown-notebook"
echo "   - ms-vscode.vscode-github-issue-notebooks"

# 3. 推荐保留的核心扩展
echo "3. 推荐保留的核心扩展："
echo "   - tongyi.tongyi-lingma"
echo "   - ms-ceintl.vscode-language-pack-zh-hans"
echo "   - bmewburn.vscode-intelephense-client"

echo "=== 扩展优化建议完成 ==="
