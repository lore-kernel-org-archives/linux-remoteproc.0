Date: Wed, 22 Apr 2020 16:08:37 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc fixes for v5.7
Message-ID: <20200422230833.GA2112870@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.7-fixes

for you to fetch changes up to c2781e4d9bc6d925dfc1ff833dfdaf12b69679de:

  remoteproc: mtk_scp: use dma_addr_t for DMA API (2020-04-16 15:53:15 -0700)

----------------------------------------------------------------
remoteproc fixes for v5.7

This fixes a regression in the probe error path of the Qualcomm modem
remoteproc driver and a mix up of phy_addr_t and dma_addr_t in the
Mediatek SCP control driver.

----------------------------------------------------------------
Alex Elder (2):
      remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
      remoteproc: qcom_q6v5_mss: fix q6v5_probe() error paths

Arnd Bergmann (1):
      remoteproc: mtk_scp: use dma_addr_t for DMA API

 drivers/remoteproc/mtk_common.h    |  2 +-
 drivers/remoteproc/mtk_scp.c       |  6 +++---
 drivers/remoteproc/qcom_q6v5_mss.c | 33 ++++++++++++++++++++-------------
 3 files changed, 24 insertions(+), 17 deletions(-)
