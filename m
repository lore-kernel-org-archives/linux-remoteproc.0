Date: Wed, 1 Apr 2020 18:08:16 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v5.7
Message-ID: <20200402010812.GA751391@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Clement Leger <cleger@kalray.eu>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alex Elder <elder@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Nathan Chancellor <natechancellor@gmail.com>, Nikita Shubin <NShubin@topcon.com>, Sibi Sankar <sibis@codeaurora.org>, Tero Kristo <t-kristo@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.7

for you to fetch changes up to a7084c3d47c4aaedcca217ce87b7b5b5fe3cfa35:

  remoteproc/omap: Switch to SPDX license identifiers (2020-03-25 22:29:51 -0700)

----------------------------------------------------------------
remoteproc updates for v5.7

This introduces a range of improvements to the OMAP remoeteproc driver;
among other things adding devicetree, suspend/resume and watchdog
support, and adds support the remoteprocs in the DRA7xx SoC.

It introduces support for 64-bit firmware, extends the ELF loader to
support this and fixes for a number of race conditions in the recovery
handling.

It introduces a generic mechanism to allow remoteproc drivers to sync
state with remote processors during a panic, and uses this to prepare
Qualcomm remote processors for post mortem analysis.

Finally it introduces fixes to cleanly recover from crashes in the modem
firmware on production Qualcomm devices.

----------------------------------------------------------------
Ahmad Fatoum (1):
      remoteproc: stm32: demote warning about optional property absence

Alex Elder (3):
      remoteproc: re-check state in rproc_trigger_recovery()
      remoteproc: remoteproc debugfs file fixes
      remoteproc: return error for bad "recovery" debugfs input

Arnaud Pouliquen (1):
      remoteproc: fix kernel-doc warnings

Bjorn Andersson (6):
      remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
      remoteproc: qcom_q6v5_mss: Validate each segment during loading
      remoteproc: Traverse rproc_list under RCU read lock
      remoteproc: Introduce "panic" callback in ops
      remoteproc: qcom: q6v5: Add common panic handler
      remoteproc: qcom: Introduce panic handler for PAS and ADSP

Clement Leger (8):
      remoteproc: Use size_t type for len in da_to_va
      remoteproc: Use size_t instead of int for rproc_mem_entry len
      remoteproc: Use u64 type for boot_addr
      remoteproc: Add elf helpers to access elf64 and elf32 fields
      remoteproc: Rename rproc_elf_sanity_check for elf32
      remoteproc: Add elf64 support in elf loader
      remoteproc: Allow overriding only sanity_check
      remoteproc: Adapt coredump to generate correct elf type

Nathan Chancellor (1):
      remoteproc/mediatek: Use size_t type for len in scp_da_to_va

Nikita Shubin (1):
      remoteproc: Fix NULL pointer dereference in rproc_virtio_notify

Sibi Sankar (1):
      remoteproc: qcom_q6v5_mss: Reload the mba region on coredump

Suman Anna (14):
      dt-bindings: remoteproc: Add OMAP remoteproc bindings
      remoteproc/omap: Add device tree support
      remoteproc/omap: Add a sanity check for DSP boot address alignment
      remoteproc/omap: Add support to parse internal memories from DT
      remoteproc/omap: Add the rproc ops .da_to_va() implementation
      remoteproc/omap: Initialize and assign reserved memory node
      remoteproc/omap: Add support for DRA7xx remote processors
      remoteproc/omap: Check for undefined mailbox messages
      remoteproc/omap: Request a timer(s) for remoteproc usage
      remoteproc/omap: Add support for system suspend/resume
      remoteproc/omap: Add support for runtime auto-suspend/resume
      remoteproc/omap: Report device exceptions and trigger recovery
      remoteproc/omap: Add watchdog functionality for remote processors
      remoteproc/omap: Switch to SPDX license identifiers

Tero Kristo (1):
      remoteproc/omap: Remove the platform_data header

 .../bindings/remoteproc/ti,omap-remoteproc.yaml    |  324 ++++++
 Documentation/remoteproc.txt                       |    2 +-
 drivers/remoteproc/Kconfig                         |   14 +-
 drivers/remoteproc/imx_rproc.c                     |   11 +-
 drivers/remoteproc/keystone_remoteproc.c           |    4 +-
 drivers/remoteproc/mtk_scp.c                       |    2 +-
 drivers/remoteproc/omap_remoteproc.c               | 1200 +++++++++++++++++++-
 drivers/remoteproc/omap_remoteproc.h               |   50 +-
 drivers/remoteproc/qcom_q6v5.c                     |   20 +
 drivers/remoteproc/qcom_q6v5.h                     |    1 +
 drivers/remoteproc/qcom_q6v5_adsp.c                |   10 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  133 ++-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   10 +-
 drivers/remoteproc/qcom_q6v5_wcss.c                |    2 +-
 drivers/remoteproc/qcom_wcnss.c                    |    2 +-
 drivers/remoteproc/remoteproc_core.c               |  161 ++-
 drivers/remoteproc/remoteproc_debugfs.c            |   16 +-
 drivers/remoteproc/remoteproc_elf_helpers.h        |   96 ++
 drivers/remoteproc/remoteproc_elf_loader.c         |  189 ++-
 drivers/remoteproc/remoteproc_internal.h           |   16 +-
 drivers/remoteproc/remoteproc_virtio.c             |    8 +
 drivers/remoteproc/st_remoteproc.c                 |    4 +-
 drivers/remoteproc/st_slim_rproc.c                 |    6 +-
 drivers/remoteproc/stm32_rproc.c                   |    4 +-
 drivers/remoteproc/wkup_m3_rproc.c                 |    4 +-
 include/linux/platform_data/remoteproc-omap.h      |   51 -
 include/linux/remoteproc.h                         |   16 +-
 27 files changed, 2080 insertions(+), 276 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
 create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h
 delete mode 100644 include/linux/platform_data/remoteproc-omap.h
