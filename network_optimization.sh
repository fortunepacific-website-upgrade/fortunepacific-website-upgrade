#!/bin/bash
# 网络连接优化脚本

echo "=== 开始网络连接检查和优化 ==="

# 1. 检查网络连通性
echo "1. 检查网络连通性..."
ping -c 3 github.com && echo "✅ GitHub 连接正常" || echo "❌ GitHub 连接异常"
ping -c 3 tongyi.aliyun.com && echo "✅ 通义实验室连接正常" || echo "❌ 通义实验室连接异常"

# 2. 检查 DNS 解析
echo "2. 检查 DNS 解析..."
nslookup tongyi.aliyun.com && echo "✅ DNS 解析正常" || echo "❌ DNS 解析异常"

# 3. 检查网络延迟
echo "3. 检查网络延迟..."
curl -w "连接时间: %{time_connect}s\n总时间: %{time_total}s\n" -o /dev/null -s https://tongyi.aliyun.com

echo "=== 网络检查完成 ==="
