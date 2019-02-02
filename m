Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 0/8] Add non PAS wcss Q6 support for QCS404
Date: Sat,  2 Feb 2019 20:56:18 +0530
Message-Id: <20190202152626.1006-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add non PAS(Peripheral Authentication System) WCSS remoteproc
driver support and wcss clock/reset controls for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).


Changes since v3:
 dt binding cleanup.
 Fixed remoteproc recovery.
 Added remoteproc dump support.
 wcsscc cleanup/refactoring.

Changes since v2:
 Removed unused properties.
 Refactored code to have common logic b/w ipq8074 and QCS404, wherever possible.
 Added compatible example.
 Removed wcss-protected bool.

Changes since v1:
  Corrected clock names as per comments in v1 patch.


Govind Singh (8):
  dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
  clk: qcom: Add WCSS gcc clock control for QCS404
  dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
  clk: qcom: Add WCSS Q6DSP clock controller for QCS404
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  dt-binding: remoteproc: Add QTI WCSS PIL bindings
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../devicetree/bindings/clock/qcom,wcsscc.txt |  26 +
 .../bindings/remoteproc/qcom,q6v5.txt         |  61 ++
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/common.c                     |  20 +
 drivers/clk/qcom/common.h                     |   3 +-
 drivers/clk/qcom/gcc-qcs404.c                 |  37 +-
 drivers/clk/qcom/lpasscc-sdm845.c             |  23 +-
 drivers/clk/qcom/wcsscc-qcs404.c              | 282 +++++++++
 drivers/remoteproc/qcom_q6v5_wcss.c           | 587 ++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   3 +
 include/dt-bindings/clock/qcom,wcss-qcs404.h  |  25 +
 12 files changed, 1013 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
