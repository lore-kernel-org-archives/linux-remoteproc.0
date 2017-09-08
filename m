Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 8 Sep 2017 14:39:04 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.14
Message-ID: <20170908213904.GJ20643@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>, Bhumika Goyal <bhumirks@gmail.com>, Himanshu Jha <himanshujha199640@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Linus,

This pull request touches drivers/soc/qcom/Kconfig and the pull request
from arm-soc includes a change that wraps all entries in this same file
in a "menu".

The arising conflict is very trivial; both changes should be included in
full and the "menu" should encapsulate QCOM_GLINK_SSR. Can you resolve
this as you're applying the later of the two pull requests?

Regards,
Bjorn

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.14

for you to fetch changes up to 7c89717f82bd305e3102963485f3da160d11bcf6:

  remoteproc: Introduce rproc handle accessor for children (2017-09-01 15:49:13 -0700)

----------------------------------------------------------------
remoteproc updates for v4.14

This adds and improves remoteproc support for TI DA8xx/OMAP-L13x DSP, TI
Keystone 66AK2G DSP and iMX6SX/7D Cortex M4 coprocessors. It introduces the
Qualcomm restart notifier and a few fixes.

----------------------------------------------------------------
Bhumika Goyal (1):
      remoteproc: make device_type const

Bjorn Andersson (5):
      remoteproc: qcom: Add support for SSR notifications
      soc: qcom: GLINK SSR notifier
      remoteproc: Stop subdevices in reverse order
      remoteproc: qcom: Make ssr_notifiers local
      remoteproc: Introduce rproc handle accessor for children

Himanshu Jha (1):
      remoteproc: qcom: Use PTR_ERR_OR_ZERO

Oleksij Rempel (2):
      remoteproc: dt: Provide bindings for iMX6SX/7D Remote Processor Controller driver
      remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver

Philipp Zabel (3):
      remoteproc/keystone: explicitly request exclusive reset control
      remoteproc: qcom: explicitly request exclusive reset control
      remoteproc: st: explicitly request exclusive reset control

Suman Anna (6):
      remoteproc: Merge __rproc_boot() with rproc_boot()
      remoteproc/davinci: Switch to platform_get_resource_byname()
      remoteproc/davinci: Add support to parse internal memories
      dt-bindings: remoteproc: Add bindings for Davinci DSP processors
      remoteproc/davinci: Add device tree support for OMAP-L138 DSP
      remoteproc/keystone: Add support for Keystone 66AK2G SOCs

 .../devicetree/bindings/remoteproc/imx-rproc.txt   |  33 ++
 .../bindings/remoteproc/ti,davinci-rproc.txt       |  86 +++++
 .../bindings/remoteproc/ti,keystone-rproc.txt      |  73 +++-
 drivers/remoteproc/Kconfig                         |   9 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/da8xx_remoteproc.c              |  98 ++++-
 drivers/remoteproc/imx_rproc.c                     | 426 +++++++++++++++++++++
 drivers/remoteproc/keystone_remoteproc.c           |   3 +-
 drivers/remoteproc/qcom_adsp_pil.c                 |  11 +-
 drivers/remoteproc/qcom_common.c                   |  73 +++-
 drivers/remoteproc/qcom_common.h                   |  10 +
 drivers/remoteproc/qcom_q6v5_pil.c                 |   6 +-
 drivers/remoteproc/remoteproc_core.c               |  35 +-
 drivers/remoteproc/remoteproc_internal.h           |   1 -
 drivers/remoteproc/st_remoteproc.c                 |   6 +-
 drivers/soc/qcom/Kconfig                           |   9 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/glink_ssr.c                       | 164 ++++++++
 include/linux/remoteproc.h                         |   2 +
 include/linux/remoteproc/qcom_rproc.h              |  22 ++
 20 files changed, 1032 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt
 create mode 100644 drivers/remoteproc/imx_rproc.c
 create mode 100644 drivers/soc/qcom/glink_ssr.c
 create mode 100644 include/linux/remoteproc/qcom_rproc.h
