#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# package/lean/default-settings/i18n/more.zh-cn.po
# 把“双分区启动切换”替换为“关机”
#sed -i 's/双分区启动切换/关机/' package/lean/default-settings/i18n/more.zh-cn.po

# feeds/luci/applications/luci-app-advanced-reboot/po/zh-cn/advanced-reboot.po
# 把“高级重启”替换为“关机”
sed -i 's/高级重启/关机/' feeds/luci/applications/luci-app-advanced-reboot/po/zh-cn/advanced-reboot.po

# feeds/luci/applications/luci-app-diag-core/luasrc/controller/luci_diag.lua
# 删除不需要的部分
sed -i '9,12d' feeds/luci/applications/luci-app-diag-core/luasrc/controller/luci_diag.lua

#rm -rf feeds/helloworld/naiveproxy
#rm -rf feeds/helloworld/tcping
#rm -rf feeds/helloworld/xray-core
#rm -rf package/lean/dns2socks
#rm -rf package/lean/ipt2socks
#rm -rf package/lean/kcptun
#rm -rf package/lean/microsocks
#rm -rf package/lean/pdnsd-alt
#rm -rf package/lean/shadowsocksr-libev
#rm -rf package/lean/simple-obfs
#rm -rf package/lean/trojan
#rm -rf package/lean/v2ray-plugin
#rm -rf package/lean/xray-plugin
