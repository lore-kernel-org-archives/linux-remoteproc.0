Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Oct 2016 15:18:07 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.9
Message-ID: <20161005221807.GN7509@tuxbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.9

for you to fetch changes up to fbb6aacb078285f88e4a4a20399c6af8d61e0000:

  remoteproc: Refactor rproc module locking (2016-10-02 22:50:22 -0700)

----------------------------------------------------------------
remoteproc updates for v4.9

In addition to a slew of minor fixes and cleanups these patches refactors how
we deal with remoteprocs that will be auto-booting themselves, this in itself
do clean up the remote resource handling but opens for additional work to
clarify responsibilities and life cycles of resources. We also revise how
module locking of remoteproc drivers work, so that they are locked as we hand
out references to them to third parties, rather than only when booted by
anyone.

In addition to this we also introduce the Qualcomm Wireless Subsystem
remoteproc driver.

----------------------------------------------------------------
Anna, Suman (8):
      remoteproc: use proper format-specifier for printing dma_addr_t
      remoteproc: fix couple of minor typos
      remoteproc: use variable names for sizeof() operator
      remoteproc: fix bare unsigned type usage
      remoteproc: align code with open parenthesis
      remoteproc: print hex numbers with a leading 0x format
      remoteproc/omap: fix various code formatting issues
      remoteproc/omap: revise a minor error trace message

Bjorn Andersson (11):
      remoteproc: Introduce auto-boot flag
      remoteproc: Calculate max_notifyid during load
      remoteproc: Move vdev handling to boot/shutdown
      remoteproc: Move handling of cached table to boot/shutdown
      remoteproc: Only update table_ptr if we have a loaded table
      dt-binding: remoteproc: Introduce Qualcomm WCNSS loader binding
      remoteproc: qcom: Introduce WCNSS peripheral image loader
      remoteproc: Drop unnecessary NULL check
      remoteproc: Correct resource handling upon boot failure
      remoteproc: Split driver and consumer dereferencing
      remoteproc: Refactor rproc module locking

Lee Jones (3):
      remoteproc: core: Ensure error message is clear
      remoteproc: core: Trivial: Improve error checking, spelling and debug prints
      remoteproc: core: Remove pointless OOM print

Loic PALLARDY (2):
      remoteproc: Modify FW_RSC_ADDR_ANY definition
      remoteproc: core: transform struct fw_rsc_vdev_vring reserved field in pa

Wei Yongjun (2):
      remoteproc: qcom: hexagon: Fix error return code in q6v5_probe()
      remoteproc: qcom: wcnss: Fix return value check in wcnss_probe()

 .../bindings/remoteproc/qcom,wcnss-pil.txt         | 132 +++++
 Documentation/remoteproc.txt                       |   6 +-
 drivers/remoteproc/Kconfig                         |  16 +
 drivers/remoteproc/Makefile                        |   2 +
 drivers/remoteproc/da8xx_remoteproc.c              |   6 +-
 drivers/remoteproc/omap_remoteproc.c               |   9 +-
 drivers/remoteproc/qcom_q6v5_pil.c                 |   8 +-
 drivers/remoteproc/qcom_wcnss.c                    | 624 +++++++++++++++++++++
 drivers/remoteproc/qcom_wcnss.h                    |  22 +
 drivers/remoteproc/qcom_wcnss_iris.c               | 188 +++++++
 drivers/remoteproc/remoteproc_core.c               | 248 ++++----
 drivers/remoteproc/remoteproc_debugfs.c            |  20 +-
 drivers/remoteproc/remoteproc_elf_loader.c         |   6 +-
 drivers/remoteproc/remoteproc_internal.h           |  15 +-
 drivers/remoteproc/remoteproc_virtio.c             |  35 +-
 drivers/remoteproc/st_remoteproc.c                 |   4 +-
 drivers/remoteproc/ste_modem_rproc.c               |   4 +-
 drivers/remoteproc/wkup_m3_rproc.c                 |   6 +-
 include/linux/platform_data/remoteproc-omap.h      |   6 +-
 include/linux/remoteproc.h                         |  16 +-
 20 files changed, 1168 insertions(+), 205 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
 create mode 100644 drivers/remoteproc/qcom_wcnss.c
 create mode 100644 drivers/remoteproc/qcom_wcnss.h
 create mode 100644 drivers/remoteproc/qcom_wcnss_iris.c
