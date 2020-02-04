Date: Mon, 3 Feb 2020 21:35:30 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v5.6
Message-ID: <20200204053527.GB130281@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Erin Lo <erin.lo@mediatek.com>, Brandon Maier <brandon.maier@rockwellcollins.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ma Feng <mafeng.ma@huawei.com>, Pi-Hsun Shih <pihsun@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.6

for you to fetch changes up to 600c39b34369e2a1bf78eb67afb99ce550f271cc:

  remoteproc: qcom: q6v5-mss: Improve readability of reset_assert (2020-01-24 09:34:07 -0800)

----------------------------------------------------------------
remoteproc updates for v5.6

This adds support for the Mediatek MT8183 SCP, modem remoteproc on
Qualcomm SC7180 platform, audio and sensor remoteprocs on Qualcomm
MSM8998 and audio, compute, modem and sensor remoteprocs on Qualcomm
SM8150.
It adds votes for necessary power-domains for all Qualcomm TrustZone
based remoteproc instances are held, fixes a bug related to remoteproc
drivers registering before the core has been initialized and does clean
up the Qualcomm modem remoteproc driver.

----------------------------------------------------------------
Brandon Maier (1):
      remoteproc: Initialize rproc_class before use

Erin Lo (2):
      dt-bindings: Add a binding for Mediatek SCP
      remoteproc/mediatek: add SCP support for mt8183

Gustavo A. R. Silva (1):
      remoteproc: use struct_size() helper

Ma Feng (1):
      remoteproc: qcom: Remove unneeded semicolon

Pi-Hsun Shih (1):
      rpmsg: add rpmsg support for mt8183 SCP.

Sibi Sankar (15):
      remoteproc: qcom: pas: Disable interrupt on clock enable failure
      dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5 PAS
      remoteproc: qcom: pas: Vote for active/proxy power domains
      dt-bindings: remoteproc: qcom: SM8150 Add ADSP, CDSP, MPSS and SLPI support
      remoteproc: qcom: pas: Add SM8150 ADSP, CDSP, Modem and SLPI support
      remoteproc: qcom: pas: Add auto_boot flag
      remoteproc: q6v5-mss: Remove mem clk from the active pool
      dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
      remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
      dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
      remoteproc: mss: q6v5-mss: Add modem support on SC7180
      remoteproc: qcom: q6v5-mss: Improve readability across clk handling
      remoteproc: qcom: q6v5-mss: Rename boot status timeout
      remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
      remoteproc: qcom: q6v5-mss: Improve readability of reset_assert

 .../devicetree/bindings/remoteproc/mtk,scp.txt     |  36 ++
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |  44 ++
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  23 +-
 drivers/remoteproc/Kconfig                         |  10 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/mtk_common.h                    |  94 +++
 drivers/remoteproc/mtk_scp.c                       | 663 +++++++++++++++++++++
 drivers/remoteproc/mtk_scp_ipi.c                   | 219 +++++++
 drivers/remoteproc/qcom_q6v5_mss.c                 | 236 +++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 260 +++++++-
 drivers/remoteproc/qcom_sysmon.c                   |   2 +-
 drivers/remoteproc/remoteproc_core.c               |   6 +-
 drivers/rpmsg/Kconfig                              |   9 +
 drivers/rpmsg/Makefile                             |   1 +
 drivers/rpmsg/mtk_rpmsg.c                          | 414 +++++++++++++
 include/linux/remoteproc/mtk_scp.h                 |  66 ++
 include/linux/rpmsg/mtk_rpmsg.h                    |  38 ++
 17 files changed, 2092 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/remoteproc/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h
