# 复制rk3568-6.x-uboot.img文件到编译目录
# cp -f $GITHUB_WORKSPACE/configfiles/rk3568-6.x-uboot.img rk3568-6.x-uboot.img
# mnt/workdir/openwrt/bin/targets/rockchip/armv8/


# 农商云g68 plus
gzip -d openwrt-rockchip-armv8-nsy_g68-plus-squashfs-sysupgrade.img.gz
ls

dd if=$GITHUB_WORKSPACE/configfiles/rk3568-6.x-uboot.img of=openwrt-rockchip-armv8-nsy_g68-plus-squashfs-sysupgrade.img bs=512 seek=64 conv=notrunc

gzip openwrt-rockchip-armv8-nsy_g68-plus-squashfs-sysupgrade.img


# 农商云g16 plus
gzip -d openwrt-rockchip-armv8-nsy_g16-plus-squashfs-sysupgrade.img.gz
ls

dd if=$GITHUB_WORKSPACE/configfiles/rk3568-6.x-uboot.img of=openwrt-rockchip-armv8-nsy_g16-plus-squashfs-sysupgrade.img bs=512 seek=64 conv=notrunc

gzip openwrt-rockchip-armv8-nsy_g16-plus-squashfs-sysupgrade.img


# 彼度云g18 pro
gzip -d openwrt-rockchip-armv8-bdy_g18-pro-squashfs-sysupgrade.img.gz
ls

dd if=$GITHUB_WORKSPACE/configfiles/rk3568-6.x-uboot.img of=openwrt-rockchip-armv8-bdy_g18-pro-squashfs-sysupgrade.img bs=512 seek=64 conv=notrunc

gzip openwrt-rockchip-armv8-bdy_g18-pro-squashfs-sysupgrade.img


rm -f sha256sums
# find * -maxdepth 1 -type f -print0 | xargs -0 sha256sum > sha256sums
find * -maxdepth 1 -type f -exec sha256sum {} + > sha256sums

echo "修改镜像成功"

# 上传到alist
#################################
file=openwrt-rockchip-armv8-bdy_g18-pro-squashfs-sysupgrade.img.gz
#curl -s -S  -T $file http://${{ env.ALIST_URL }}/dav/actions/lede/nsy-bdy/$(date +%Y%m%d)/ -u ${{ env.ALIST_TOKEN }}:${{ env.ALIST_TOKEN }}

file=openwrt-rockchip-armv8-nsy_g68-plus-squashfs-sysupgrade.img
#curl -s -S  -T $file http://${{ env.ALIST_URL }}/dav/actions/lede/nsy-bdy/$(date +%Y%m%d)/ -u ${{ env.ALIST_TOKEN }}:${{ env.ALIST_TOKEN }}

file=openwrt-rockchip-armv8-nsy_g16-plus-squashfs-sysupgrade.img.gz
#curl -s -S  -T $file http://${{ env.ALIST_URL }}/dav/actions/lede/nsy-bdy/$(date +%Y%m%d)/ -u ${{ env.ALIST_TOKEN }}:${{ env.ALIST_TOKEN }}

file="/tmp/ActionLogs.txt"
#echo "固件上传完毕:$(date +'%Y-%m-%d %H:%M:%S')" >> $file
#curl -s -S -T $file http://${{ env.ALIST_URL }}/dav/actions/lede/nsy-bdy/$(date +%Y%m%d)/ -u ${{ env.ALIST_TOKEN }}:${{ env.ALIST_TOKEN }}
###################################
 
ls
