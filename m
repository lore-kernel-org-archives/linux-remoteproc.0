Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 11 Jun 2018 11:24:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.18
Message-ID: <20180611182424.GD3206@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 75bc37fefc4471e718ba8e651aa74673d4e0a9eb:

  Linux 4.17-rc4 (2018-05-06 16:57:38 -1000)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.18

for you to fetch changes up to 4725496e4872824fa6182d412c66c00cae978a62:

  remoteproc: q6v5: Allow defining GLINK edge for mss remoteproc (2018-05-29 20:10:34 -0700)

----------------------------------------------------------------
remoteproc updates for v4.18

This brings a few minor fixes to the Davinci driver, drops a orphan
include file from the StE cleanup done ealier and introduces support for
booting the modem on Qualcomm's SDM845 platform.

----------------------------------------------------------------
Andrzej Hajda (1):
      remoteproc/ste: remove abandoned include file

Bartosz Golaszewski (3):
      remoteproc/davinci: add the missing retval check for clk_enable()
      remoteproc/davinci: prepare and unprepare the clock where needed
      remoteproc/davinci: use octal permissions for module_param()

Bjorn Andersson (2):
      Merge tag 'v4.17-rc4' into rproc-next
      remoteproc: q6v5: Return irq from q6v5_request_irq()

Geert Uytterhoeven (1):
      remoteproc: Remove depends on HAS_DMA in case of platform dependency

Sibi Sankar (6):
      remoteproc: Prevent incorrect rproc state on xfer mem ownership failure
      remoteproc: q6v5: Move proxy unvote to handover irq handler
      dt-bindings: remoteproc: Add Q6v5 Modem PIL binding for SDM845
      remoteproc: q6v5: Introduce reset assert/deassert helper functions
      remoteproc: q6v5: Add support for mss remoteproc on SDM845
      remoteproc: q6v5: Allow defining GLINK edge for mss remoteproc

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/remoteproc/Kconfig                         |   1 -
 drivers/remoteproc/da8xx_remoteproc.c              |  12 +-
 drivers/remoteproc/qcom_q6v5_pil.c                 | 201 ++++++++++++++++++---
 include/linux/ste_modem_shm.h                      |  56 ------
 5 files changed, 188 insertions(+), 83 deletions(-)
 delete mode 100644 include/linux/ste_modem_shm.h
