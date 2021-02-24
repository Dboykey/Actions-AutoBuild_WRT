mv feeds.conf.default feeds.conf.default.bak
touch feeds.conf.default
echo "src-git packages https://github.com/coolsnowwolf/packages;openwrt-19.07" >>feeds.conf.default
echo "src-git luci https://github.com/coolsnowwolf/luci" >>feeds.conf.default
echo "src-git routing https://git.openwrt.org/feed/routing.git;openwrt-19.07" >>feeds.conf.default
echo "src-git helloworld https://github.com/fw876/helloworld" >>feeds.conf.default
echo "src-git diy1 https://github.com/xiaorouji/openwrt-passwall.git;main" >>feeds.conf.default
echo "src-git adockerman https://github.com/lisaac/luci-app-dockerman" >>feeds.conf.default
echo "src-git ldockerman https://github.com/lisaac/luci-lib-docker" >>feeds.conf.default

# 添加Rosy
git clone https://github.com/rosywrt/luci-theme-rosy.git package/lean/luci-theme-rosy

# 添加vssr
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# 添加 OpenCash
git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash

# 添加adguardhome、smartdns
git clone https://github.com/Dboykey/CKdiy.git package/CKdiy

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

# Openwrt固件的超频1100Mhz设置
#target/linux/ramips/patches-4.14/102-mt7621-fix-cpu-clk-add-clkdev.patch
#rm target/linux/ramips/patches-4.14/102-mt7621-fix-cpu-clk-add-clkdev.patch
#cp package/CKdiy/AC2100/102-mt7621-fix-cpu-clk-add-clkdev.patch target/linux/ramips/patches-4.14/
