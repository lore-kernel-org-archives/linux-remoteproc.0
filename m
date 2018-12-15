Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 0/7] Add non PAS wcss Q6 support for QCS404
Date: Sat, 15 Dec 2018 16:05:50 +0530
Message-Id: <20181215103557.2748-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add non PAS(Peripheral Authentication System) WCSS remoteproc
driver support and wcss clock/reset controls for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).

Changes since v2:
 Removed unused properties.
 Refactored code to have common logic b/w ipq8074 and QCS404, wherever possible.
 Added compatible example.
 Removed wcss-protected bool.

Changes since v1:
  Corrected clock names as per comments in v1 patch.


Govind Singh (7):
  dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
  clk: qcom: Add WCSS Q6DSP clock controller for QCS404
  dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
  clk: qcom: Add WCSS gcc clock control for QCS404
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../devicetree/bindings/clock/qcom,wcsscc.txt |  26 +
 .../bindings/remoteproc/qcom,q6v5.txt         |  61 ++
 drivers/clk/qcom/Kconfig                      |   9 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gcc-qcs404.c                 |  51 +-
 drivers/clk/qcom/wcsscc-qcs404.c              | 297 +++++++++
 drivers/remoteproc/qcom_q6v5_wcss.c           | 574 +++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   3 +
 include/dt-bindings/clock/qcom,wcss-qcs404.h  |  24 +
 9 files changed, 1016 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
