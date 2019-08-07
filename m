Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/9] remoteproc: qcom: post mortem debug support
Date: Tue,  6 Aug 2019 22:39:33 -0700
Message-Id: <20190807053942.9836-1-bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The following series introduces two components that aids in post mortem
debugging of Qualcomm systems. The first part is used to store information
about loaded images in IMEM, for post mortem tools to know where the kernel
loaded the remoteproc firmware. The second part invokes a stop operation on the
remoteprocs during a kernel panic, in order to trigger them to flush caches
etc.

Bjorn Andersson (9):
  remoteproc: qcom: Introduce driver to store pil info in IMEM
  remoteproc: qcom: mss: Update IMEM PIL info on load
  remoteproc: qcom: pas: Update IMEM PIL info on load
  remoteproc: qcom: wcnss: Update IMEM PIL info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region
  remoteproc: Introduce "panic" callback in ops
  remoteproc: qcom: q6v5: Add common panic handler
  remoteproc: qcom: Introduce panic handler for PAS and ADSP

 arch/arm64/boot/dts/qcom/qcs404.dtsi |  10 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi |  10 ++
 drivers/remoteproc/Kconfig           |   6 ++
 drivers/remoteproc/Makefile          |   1 +
 drivers/remoteproc/qcom_pil_info.c   | 139 +++++++++++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h   |   6 ++
 drivers/remoteproc/qcom_q6v5.c       |  19 ++++
 drivers/remoteproc/qcom_q6v5.h       |   1 +
 drivers/remoteproc/qcom_q6v5_adsp.c  |   8 ++
 drivers/remoteproc/qcom_q6v5_mss.c   |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c   |  23 ++++-
 drivers/remoteproc/qcom_wcnss.c      |  14 ++-
 drivers/remoteproc/remoteproc_core.c |  16 +++
 include/linux/remoteproc.h           |   3 +
 14 files changed, 253 insertions(+), 6 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.18.0
