#!/bin/bash

echo "=== jQuery安全升级流程 ==="
echo "执行时间: $(date)"
echo "========================"

# 定义网站根目录
WEB_ROOT="/www/wwwroot/fortunepacific.net"
BACKUP_DIR="/home/FORTUNE网站升级/备份/jquery_$(date +%Y%m%d_%H%M%S)"
WORK_DIR="/home/FORTUNE网站升级"

echo "1. 创建备份目录: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "2. 备份所有jQuery相关文件"
find "$WEB_ROOT" -name "*jquery*.js" -exec cp --parents {} "$BACKUP_DIR" \;

echo "3. 创建ECS快照提醒"
echo "请手动创建ECS快照，快照名称: jQuery_upgrade_$(date +%Y%m%d_%H%M%S)" > "$WORK_DIR/请创建ECS快照.txt"
echo "重要：在继续之前，请手动创建ECS快照！"

echo "4. 生成升级检查清单"
cat > "$WORK_DIR/jQuery升级检查清单.md" << 'CHECKLIST'
# jQuery升级检查清单

## 升级前检查
- [ ] 已创建ECS快照
- [ ] 已备份所有jQuery文件
- [ ] 已记录当前网站功能状态

## 核心文件升级
### jquery-3.7.1.min.js
- [ ] 备份文件确认
- [ ] 新版本文件准备
- [ ] 文件替换
- [ ] 功能测试
- [ ] 确认无误后提交

### jquery-migrate-3.4.1.min.js
- [ ] 备份文件确认
- [ ] 评估是否需要升级
- [ ] 文件替换（如需要）
- [ ] 功能测试
- [ ] 确认无误后提交

## 插件文件升级
- [ ] bxSlider插件
- [ ] jScrollPanel插件
- [ ] 其他插件

## 升级后验证
- [ ] 首页功能测试
- [ ] 管理后台测试
- [ ] 图片上传功能测试
- [ ] 所有关键功能测试

## 回滚准备
- [ ] 确认备份文件完整性
- [ ] 准备回滚脚本
CHECKLIST

echo "升级准备完成，请查看以下文件："
echo "1. 备份目录: $BACKUP_DIR"
echo "2. 升级检查清单: $WORK_DIR/jQuery升级检查清单.md"
echo "3. 快照提醒: $WORK_DIR/请创建ECS快照.txt"

echo "=== 准备完成 ==="
