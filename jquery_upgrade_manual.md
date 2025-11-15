# jQuery安全升级操作手册

## 升级前必须执行的操作

### 1. 创建ECS快照
- 登录阿里云控制台
- 找到当前ECS实例
- 创建快照，命名为：jQuery_upgrade_YYYYMMDD_HHMM

### 2. 验证备份完整性
```bash
# 检查备份目录
ls -la /home/FORTUNE网站升级/备份/jquery_*





