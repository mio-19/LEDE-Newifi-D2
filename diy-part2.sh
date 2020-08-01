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
echo 'CONFIG_PACKAGE_luci-theme-material=y' >> .config

git clone --depth=1 -b master https://github.com/vernesong/OpenClash package/lean/
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >> .config

git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner package/lean/
echo 'CONFIG_PACKAGE_luci-app-nlbwmon=y' >> .config
echo 'CONFIG_PACKAGE_luci-app-onliner=y' >> .config

git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome package/lean/
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config

echo 'CONFIG_PACKAGE_luci-app-aria2=y' >> .config

echo 'CONFIG_PACKAGE_luci-app-ttyd=y' >> .config
