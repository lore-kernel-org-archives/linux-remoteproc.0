Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 11 Oct 2017 11:00:27 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc fixes for v4.14
Message-ID: <20171011180027.GM20643@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Wei Yongjun <weiyongjun1@huawei.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.14-fixes

for you to fetch changes up to 68a39a3e9fe1d6f0dfe59e3f4d6bc6765e01c903:

  remoteproc: imx_rproc: fix return value check in imx_rproc_addr_init() (2017-10-11 10:47:47 -0700)

----------------------------------------------------------------
remoteproc fixes for v4.14

This fixes a couple of issues in the imx_rproc driver and corrects the Kconfig
dependencies of the Qualcomm remoteproc drivers.

----------------------------------------------------------------
Arnd Bergmann (1):
      remoteproc: qcom: fix RPMSG_QCOM_GLINK_SMEM dependencies

Dan Carpenter (1):
      remoteproc: imx_rproc: fix a couple off by one bugs

Wei Yongjun (1):
      remoteproc: imx_rproc: fix return value check in imx_rproc_addr_init()

 drivers/remoteproc/Kconfig     | 2 ++
 drivers/remoteproc/imx_rproc.c | 9 ++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)
