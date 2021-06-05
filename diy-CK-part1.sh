#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

mv feeds.conf.default feeds.conf.default.bak
touch feeds.conf.default
echo "src-git packages https://github.com/coolsnowwolf/packages" >>feeds.conf.default
echo "src-git luci https://github.com/coolsnowwolf/luci" >>feeds.conf.default
echo "src-git routing https://git.openwrt.org/feed/routing.git" >>feeds.conf.default
#echo "src-git helloworld https://github.com/fw876/helloworld" >>feeds.conf.default
echo "src-git OpenClash https://github.com/vernesong/OpenClash.git;master" >>feeds.conf.default
#echo src-git lienol https://github.com/Lienol/openwrt-package.git;main" >>feeds.conf.default
echo "src-git diy1 https://github.com/xiaorouji/openwrt-passwall.git;main" >>feeds.conf.default
echo "src-git adockerman https://github.com/lisaac/luci-app-dockerman" >>feeds.conf.default
echo "src-git ldockerman https://github.com/lisaac/luci-lib-docker" >>feeds.conf.default

# 添加Rosy
git clone https://github.com/rosywrt/luci-theme-rosy.git package/lean/luci-theme-rosy

# 添加ddnsto
git clone https://github.com/linkease/ddnsto-openwrt.git package/lean/ddnsto

# 添加vssr
#git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
#rm -rf package/lean/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# 添加bypass
git clone https://github.com/garypang13/luci-app-bypass.git package/lean/luci-app-bypass
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
git clone https://github.com/garypang13/smartdns-le.git package/lean/smartdns-le
git clone https://github.com/garypang13/luci-app-dnsfilter.git package/lean/luci-app-dnsfilter

# package/lean/default-settings/files/zzz-default-settings
##找到字符串“uci commit luci”后，在前面增加一行
#sed -i '/uci commit luci/i\\uci set luci.main.mediaurlbase=/luci-static/rosy' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/i\\uci set luci.main.mediaurlbase=/luci-static/argon' package/lean/default-settings/files/zzz-default-settings
##找到字符串“shadow”后，删除一行
sed -i -e '/shadow/d' package/lean/default-settings/files/zzz-default-settings
##找到字符串“uci commit luci”后，在后面增加一行，又一行
sed -i "/uci commit luci/a\\uci commit network" package/lean/default-settings/files/zzz-default-settings
sed -i "/uci commit luci/a\\uci set network.lan.netmask='255.255.255.0'" package/lean/default-settings/files/zzz-default-settings
sed -i "/uci commit luci/a\\uci set network.lan.ipaddr='192.168.2.1'" package/lean/default-settings/files/zzz-default-settings
sed -i "/uci commit luci/a\\ " package/lean/default-settings/files/zzz-default-settings
