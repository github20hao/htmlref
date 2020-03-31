#!/bin/bash
# 提交更新至 git 仓库并更新文件至腾讯云存储桶
#
# 安装存储桶命令: pip install coscmd
# https://cloud.tencent.com/document/product/436/10976
#

cd $(dirname $0)

git add .
git commit -m "update $(date +'%F %T')"
git push origin master
git push -f gitee master

#GIT_SSH_COMMAND="ssh -i $(pwd)/sshkey/github2_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git push github2 master

coscmd upload config.js config.js
coscmd upload config.json config.json
