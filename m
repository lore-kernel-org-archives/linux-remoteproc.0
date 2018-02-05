Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 5 Feb 2018 09:36:02 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] rpmsg updates for v4.16
Message-ID: <20180205173602.GZ17344@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, Pravin Shedge <pravin.shedge4linux@gmail.com>, Vasyl Gomonovych <gomonovych@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rpmsg-v4.16

for you to fetch changes up to c3388a075c8ac568f892c40bec919ba8ac4077f0:

  rpmsg: smd: Fix double unlock in __qcom_smd_send() (2018-01-19 07:04:33 -0800)

----------------------------------------------------------------
rpmsg updates for v4.16

This fixes a few issues found in the SMD and GLINK drivers and corrects the
handling of SMD channels that are found in an (previously) unexpected state.

----------------------------------------------------------------
Bjorn Andersson (6):
      rpmsg: glink: smem: Ensure ordering during tx
      rpmsg: smd: Perform handshake during open
      rpmsg: smd: Create device for all channels
      rpmsg: smd: Wake up all waiters
      rpmsg: smd: Fail send on a closed channel
      rpmsg: smd: Don't hold the tx lock during wait

Dan Carpenter (1):
      rpmsg: smd: Fix double unlock in __qcom_smd_send()

Pravin Shedge (1):
      drivers: rpmsg: remove duplicate includes

Vasyl Gomonovych (1):
      remoteproc: qcom: Use PTR_ERR_OR_ZERO() in glink prob

Wei Yongjun (1):
      rpmsg: glink: Fix missing mutex_init() in qcom_glink_alloc_channel()

 drivers/remoteproc/qcom_common.c  |  2 +-
 drivers/rpmsg/qcom_glink_native.c |  1 +
 drivers/rpmsg/qcom_glink_smem.c   |  5 +--
 drivers/rpmsg/qcom_smd.c          | 66 +++++++++++++++++++++++++++++----------
 4 files changed, 55 insertions(+), 19 deletions(-)
