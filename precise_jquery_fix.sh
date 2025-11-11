#!/bin/bash

echo "=== 精确jQuery兼容性修复 ==="
DATE=$(date +%Y%m%d_%H%M%S)

# 1. 备份关键文件
echo "1. 备份关键JS文件"
cp /www/wwwroot/fortunepacific.net/static/js/global.js /www/wwwroot/fortunepacific.net/static/js/global.js.backup_precise_$DATE
cp /www/wwwroot/fortunepacific.net/static/manage/js/frame.js /www/wwwroot/fortunepacific.net/static/manage/js/frame.js.backup_precise_$DATE
cp /www/wwwroot/fortunepacific.net/static/js/jquery-compatibility-fix.js /www/wwwroot/fortunepacific.net/static/js/jquery-compatibility-fix.js.backup_precise_$DATE

# 2. 为global.js添加兼容性处理（仅针对已知问题）
echo "2. 为global.js添加兼容性处理"
sed -i '2i\
// jQuery兼容性修复 - 仅针对特定问题\
if (typeof jQuery !== "undefined" && !jQuery.fn.size) {\
    jQuery.fn.size = function() {\
        return this.length;\
    };\
}' /www/wwwroot/fortunepacific.net/static/js/global.js

# 3. 为frame.js添加兼容性处理
echo "3. 为frame.js添加兼容性处理"
sed -i '2i\
// jQuery兼容性修复 - 仅针对特定问题\
if (typeof jQuery !== "undefined" && !jQuery.fn.size) {\
    jQuery.fn.size = function() {\
        return this.length;\
    };\
}' /www/wwwroot/fortunepacific.net/static/manage/js/frame.js

# 4. 增强jquery-compatibility-fix.js
echo "4. 增强jquery-compatibility-fix.js"
cat > /www/wwwroot/fortunepacific.net/static/js/jquery-compatibility-fix.js << 'INNEREOF'
/**
 * jQuery版本兼容性修复补丁
 * 确保不同版本jQuery共存时的兼容性
 */

// 检查并添加.size()方法兼容性
if (typeof jQuery !== "undefined") {
    // 为jQuery添加.size()方法（如果不存在）
    if (!jQuery.fn.size) {
        jQuery.fn.size = function() {
            return this.length;
        };
    }
    
    // 确保jQuery Migrate正常工作
    if (typeof jQuery.migrateMute === "undefined") {
        jQuery.migrateMute = true;
    }
}

// 输出兼容性补丁加载信息
console.log("jQuery 3.7.1 最终兼容性补丁已加载 - 所有.size()问题已修复");
INNEREOF

echo "=== 精确修复完成 ==="
