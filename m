Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH v5 0/8] remoteproc: Add elf64 support
Date: Mon,  2 Mar 2020 10:38:54 +0100
Message-Id: <20200302093902.27849-1-cleger@kalray.eu>
In-Reply-To: <20200210162209.23149-1-cleger@kalray.eu>
References: <20200210162209.23149-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

This serie add support for elf64 in remoteproc (elf loader, coredump). 
First three patches modifies the type of len argument (in da_to_va),
boot_addr and rproc_mem_entry len field in order to allow loading elf64
segment with a u64 size and a u64 entry point.
Next patches introduce a set of macros to access elf64 and elf32
transparently.
Last patches are the actual modifications in the elf loader and
remoteproc coredump support to add elf64 support.

Changes v4 -> v5:
 - Add rproc_elf_sanity_check renaming to rproc_elf32_sanity_check
 - Fix checkpatch warning on > 80 column line
 - Change u64 len type for size_t in da_to_va and add checks in loader
 - Modify rproc_mem_entry size field type from int to size_t
 - Add a patch to override sanity_check function

Changes v3 -> v4:
 - Adapt coredump to elf64 file format
 - Rename remoteproc_elf_loader.h to remoteproc_elf_helpers.h
 - Update copyright year in remoteproc_elf_helpers.h
 - Rename macros elf_hdr_* to elf_get_hdr_* for coherency with elf_hdr_set_*
 - Split elf64 loader patch in 3:
   - boot_addr u64 change
   - remoteproc_elf_helpers.h creation
   - elf64 loading

Changes v2 -> v3:
 - da_to_va len type changed from int to u64
 - Add check for elf64 header size
 - Add comments for name table parsing
 - Fix typo in "accommodate
 - Add ELF64 support in documentation

Clement Leger (8):
  remoteproc: Use size_t type for len in da_to_va
  remoteproc: Use size_t instead of int for rproc_mem_entry len
  remoteproc: Use u64 type for boot_addr
  remoteproc: Add elf helpers to access elf64 and elf32 fields
  remoteproc: Rename rproc_elf_sanity_check for elf32
  remoteproc: Add elf64 support in elf loader
  remoteproc: Allow overriding only sanity_check
  remoteproc: Adapt coredump to generate correct elf type

 Documentation/remoteproc.txt                |   2 +-
 drivers/remoteproc/imx_rproc.c              |  11 +-
 drivers/remoteproc/keystone_remoteproc.c    |   4 +-
 drivers/remoteproc/qcom_q6v5_adsp.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c          |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c          |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c         |   2 +-
 drivers/remoteproc/qcom_wcnss.c             |   2 +-
 drivers/remoteproc/remoteproc_core.c        |  86 +++++++------
 drivers/remoteproc/remoteproc_debugfs.c     |   2 +-
 drivers/remoteproc/remoteproc_elf_helpers.h |  96 ++++++++++++++
 drivers/remoteproc/remoteproc_elf_loader.c  | 189 +++++++++++++++++++---------
 drivers/remoteproc/remoteproc_internal.h    |  14 ++-
 drivers/remoteproc/st_remoteproc.c          |   4 +-
 drivers/remoteproc/st_slim_rproc.c          |   6 +-
 drivers/remoteproc/stm32_rproc.c            |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c          |   4 +-
 include/linux/remoteproc.h                  |  13 +-
 18 files changed, 317 insertions(+), 126 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h

-- 
2.15.0.276.g89ea799
