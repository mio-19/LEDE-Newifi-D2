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

rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config
sed -i '/^CONFIG_PACKAGE_luci-theme-bootstrap=y$/d' .config

#git clone --depth=1 -b master https://github.com/vernesong/OpenClash package/lean/OpenClash
#echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config

git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner package/lean/luci-app-onliner
#echo 'CONFIG_PACKAGE_luci-app-nlbwmon=y' >> .config # already in .config
echo 'CONFIG_PACKAGE_luci-app-onliner=y' >> .config

#git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome package/lean/luci-app-adguardhome
#echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config

echo 'CONFIG_PACKAGE_luci-app-aria2=y' >> .config

echo 'CONFIG_PACKAGE_luci-app-ttyd=y' >> .config

cat << 'EOF' >> .config
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Socks=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Simple_obfs=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_plugin=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_DNS2SOCKS=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Redsocks2=y
EOF

svn co https://github.com/openwrt/packages/trunk/net/https-dns-proxy package/lean/https-dns-proxy
svn co https://github.com/openwrt/luci/trunk/applications/luci-app-https-dns-proxy package/lean/luci-app-https-dns-proxy
cat << 'EOF' >> .config
CONFIG_PACKAGE_https-dns-proxy=y
CONFIG_PACKAGE_luci-app-https-dns-proxy=y
EOF
