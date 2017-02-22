Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 22 Feb 2017 03:53:56 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.11
Message-ID: <20170222115356.GA22823@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Loic Pallardy <loic.pallardy@st.com>, Arnd Bergmann <arnd@arndb.de>, Bhumika Goyal <bhumirks@gmail.com>, Pavel Machek <pavel@ucw.cz>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 49def1853334396f948dcb4cedb9347abb318df5:

  Linux 4.10-rc4 (2017-01-15 16:21:59 -0800)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.11

for you to fetch changes up to 01625cc5e65f420dbea57f7de6b9552a0f807a84:

  remoteproc: qcom: mdt_loader: Use signed type for offset (2017-02-22 02:07:13 -0800)

----------------------------------------------------------------
remoteproc updates for v4.11

This introduces support for booting the dedicated sensor core in the
Qualcomm MSM8996, updates the Qualcomm ADSP and Hexagon drivers to
utilize SMD subdevice helpers for properly handle shutdowns and restarts
of the remoteproc, add virtio support to the ST remoteproc and refactor
the Qualcomm Hexagon driver to handle variations between platforms.

The support code for parsing, loading and authenticating Qualcomm
firmware files (MDT) is refactored and move to drivers/soc/qcom, to
allow for non-remoteproc drivers to utilize this.

Finally it brings some cleanups to the remoteproc core.

----------------------------------------------------------------
Arnd Bergmann (1):
      remoteproc: qcom: fix initializers for qcom_mss_reg_res array

Avaneesh Kumar Dwivedi (6):
      remoteproc: qcom: Compatible string based private resource initialization.
      remoteproc: qcom: Initialize and enable proxy and active clocks.
      remoteproc: qcom: Initialize and enable proxy and active regulators.
      remoteproc: qcom: Compatible string based resource initialization.
      remoteproc: qcom: Add additional agree2_clk and px regulator resource.
      remoteproc: qcom: Add SLPI rproc support to load and boot slpi proc.

Bhumika Goyal (1):
      drivers: remoteproc: constify rproc_ops structures

Bjorn Andersson (10):
      remoteproc: qcom: q6v5: Remove mss supply from 8916
      remoteproc: qcom: q6v5: Decouple driver from MDT loader
      remoteproc: qcom: Extract non-mdt related helper
      remoteproc: qcom: mdt_loader: Don't overwrite firmware object
      remoteproc: qcom: mdt_loader: Refactor MDT loader
      remoteproc: Move qcom_mdt_loader into drivers/soc/qcom
      remoteproc: qcom: wcnss: Make SMD handling common
      remoteproc: qcom: Use common SMD edge handler
      MAINTAINERS: Add missing rpmsg include path
      remoteproc: qcom: mdt_loader: Use signed type for offset

Loic Pallardy (2):
      remoteproc: st: correct probe error management
      remoteproc: st: add virtio communication support

Pavel Machek (1):
      remoteproc: add some kind of help

Sarangdhar Joshi (6):
      remoteproc: Move rproc_delete_debug_dir() to rproc_del()
      remoteproc: Add RPROC_DELETED state
      remoteproc: Drop firmware_loading_complete
      remoteproc: Drop qcom_scm_pas_supported() from adsp_probe()
      remoteproc: Reduce asynchronous request_firmware to auto-boot only
      remoteproc: Modify the function names

 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |  41 +-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/remoteproc/Kconfig                         |  18 +-
 drivers/remoteproc/Makefile                        |   2 +-
 drivers/remoteproc/da8xx_remoteproc.c              |   2 +-
 drivers/remoteproc/omap_remoteproc.c               |   2 +-
 drivers/remoteproc/qcom_adsp_pil.c                 | 134 ++++--
 drivers/remoteproc/qcom_common.c                   |  96 ++++
 drivers/remoteproc/qcom_common.h                   |  22 +
 drivers/remoteproc/qcom_mdt_loader.c               | 180 -------
 drivers/remoteproc/qcom_mdt_loader.h               |  13 -
 drivers/remoteproc/qcom_q6v5_pil.c                 | 531 +++++++++++++++------
 drivers/remoteproc/qcom_wcnss.c                    |  60 +--
 drivers/remoteproc/remoteproc_core.c               |  52 +-
 drivers/remoteproc/remoteproc_sysfs.c              |   1 +
 drivers/remoteproc/st_remoteproc.c                 | 119 ++++-
 drivers/remoteproc/st_slim_rproc.c                 |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c                 |   2 +-
 drivers/soc/qcom/Kconfig                           |   4 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/mdt_loader.c                      | 204 ++++++++
 include/linux/remoteproc.h                         |   6 +-
 include/linux/soc/qcom/mdt_loader.h                |  18 +
 24 files changed, 1029 insertions(+), 486 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_common.c
 create mode 100644 drivers/remoteproc/qcom_common.h
 delete mode 100644 drivers/remoteproc/qcom_mdt_loader.c
 delete mode 100644 drivers/remoteproc/qcom_mdt_loader.h
 create mode 100644 drivers/soc/qcom/mdt_loader.c
 create mode 100644 include/linux/soc/qcom/mdt_loader.h
