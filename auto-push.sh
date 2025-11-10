#!/bin/bash

# 自动推送脚本
cd /home/FORTUNE网站升级

# 添加所有更改
git add .

# 获取当前日期作为提交信息
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# 提交更改
git commit -m "自动更新: $current_date"

# 推送到GitHub
git push origin master

echo "代码已成功推送到GitHub"
