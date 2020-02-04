Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH v3 0/2] remoteproc: Add elf64 support to elf loader
Date: Tue,  4 Feb 2020 18:44:10 +0100
Message-Id: <20200204174412.16814-1-cleger@kalray.eu>
In-Reply-To: <20200129163013.GA16538@xps15>
References: <20200129163013.GA16538@xps15>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

This serie add support for elf64 in remoteproc elf loader. 
First patch modifies the type of len argument (in da_to_va) in order
to allow loading elf64 segment with a u64 size.
Second patch is the actual modification in the elf loader to support
elf64 type by using a set of generic macros.

Changes from V2:
 - da_to_va len type changed from int to u64
 - Add check for elf64 header size
 - Add comments for name table parsing
 - Fix typo in "accommodate"

Clement Leger (2):
  remoteproc: Use u64 len for da_to_va
  remoteproc: Add elf64 support in elf loader

 Documentation/remoteproc.txt               |   2 +-
 drivers/remoteproc/imx_rproc.c             |   9 +-
 drivers/remoteproc/keystone_remoteproc.c   |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c        |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c        |   2 +-
 drivers/remoteproc/qcom_wcnss.c            |   2 +-
 drivers/remoteproc/remoteproc_core.c       |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 147 ++++++++++++++++++-----------
 drivers/remoteproc/remoteproc_elf_loader.h |  69 ++++++++++++++
 drivers/remoteproc/remoteproc_internal.h   |   4 +-
 drivers/remoteproc/st_remoteproc.c         |   2 +-
 drivers/remoteproc/st_slim_rproc.c         |   4 +-
 drivers/remoteproc/wkup_m3_rproc.c         |   2 +-
 include/linux/remoteproc.h                 |   6 +-
 16 files changed, 184 insertions(+), 75 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h

-- 
2.15.0.276.g89ea799
