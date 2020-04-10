Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH 0/2] remoteproc: add rproc_coredump_set_elf_info
Date: Fri, 10 Apr 2020 12:24:31 +0200
Message-Id: <20200410102433.2672-1-cleger@kalray.eu>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds a way to set the elf informations that will be used to
generate the coredump. Second patch fixes drivers to use this function.

Clement Leger (2):
  remoteproc: add rproc_coredump_set_elf_info
  remoteproc: use rproc_coredump_set_elf_info in drivers

 drivers/remoteproc/qcom_q6v5_adsp.c        |  1 +
 drivers/remoteproc/qcom_q6v5_mss.c         |  3 ++
 drivers/remoteproc/qcom_q6v5_pas.c         |  1 +
 drivers/remoteproc/qcom_wcnss.c            |  1 +
 drivers/remoteproc/remoteproc_core.c       | 32 ++++++++++++++++++++--
 drivers/remoteproc/remoteproc_elf_loader.c |  3 --
 drivers/remoteproc/stm32_rproc.c           |  1 +
 include/linux/remoteproc.h                 |  2 ++
 8 files changed, 39 insertions(+), 5 deletions(-)

-- 
2.17.1
