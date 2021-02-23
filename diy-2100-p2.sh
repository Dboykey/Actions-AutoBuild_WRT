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
#ln -s feeds/diy1/naiveproxy feeds/helloworld/naiveproxy
#ln -s feeds/diy1/tcping feeds/helloworld/tcping
#ln -s feeds/diy1/xray-core feeds/helloworld/xray-core
rm -rf package/lean/dns2socks
rm -rf package/lean/ipt2socks
rm -rf package/lean/kcptun
rm -rf package/lean/microsocks
rm -rf package/lean/pdnsd-alt
rm -rf package/lean/shadowsocksr-libev
rm -rf package/lean/simple-obfs
rm -rf package/lean/trojan
rm -rf package/lean/v2ray-plugin
rm -rf package/lean/xray-plugin

# 补完ipmitool
rm -rf feeds/packages/admin/ipmitool
mv package/CKdiy/ipmitool feeds/packages/admin/

# 补完golang
rm -rf feeds/packages/lang/golang
mv package/CKdiy/golang feeds/packages/lang/

# 补完packr
mv package/CKdiy/packr feeds/packages/devel/

# 添加一些方便在ssh使用的alias
alias cls='clear'
alias df='df -h'
alias duu='du -sh'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias fname='func() { find -name *$1*;}; func'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias lh='ls -lh'
alias lha='lh -a'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias md='mkdir -p'
alias psg='ps ax | grep'
alias rm='rm -rf'
alias upcls='./scripts/feeds clean'
alias upfeed='./scripts/feeds update -a && ./scripts/feeds install -a'
alias upins='./scripts/feeds install -a'
alias upup='source ~/.bashrc'
ln -s package/lean/default-settings/files/zzz-default-settings
