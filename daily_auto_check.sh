#!/bin/bash

echo "=== Fortunepacific 网站每日自动检查 ==="
echo "执行时间: $(date)"
echo "================================"

# 1. 系统健康检查
echo "1. 执行系统健康检查..."
/home/FORTUNE网站升级/system_health_check.sh > "/home/FORTUNE网站升级/项目文档/$(date +%Y%m%d)-系统健康检查报告.txt"

# 2. jQuery兼容性检查
echo "2. 执行jQuery兼容性检查..."
/home/FORTUNE网站升级/jquery_version_monitor.sh > "/home/FORTUNE网站升级/项目文档/$(date +%Y%m%d)-jQuery检查报告.txt"

# 3. 自动提交和推送
echo "3. 自动提交和推送..."
cd /home/FORTUNE网站升级
git add .
git commit -m "$(date +%Y-%m-%d) 自动每日检查"
git push origin master

echo "4. 检查结果:"
echo "最新提交: $(git log --oneline -1)"
echo "当前状态: $(git status --porcelain | wc -l) 个未提交文件"

echo "=== 每日自动检查完成 ==="
