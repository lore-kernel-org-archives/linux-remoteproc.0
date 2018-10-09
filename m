Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 0/6] Add non PAS wcss Q6 support for QCS404
Date: Tue,  9 Oct 2018 18:35:51 +0530
Message-Id: <1539090357-20853-1-git-send-email-govinds@codeaurora.org>
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add non PAS(Peripheral Authentication System) WCSS remoteproc
driver support and wcss clock/reset controls for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).

Govind Singh (6):
  dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
  clk: qcom: Add WCSS gcc clock control for QCS404
  dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
  clk: qcom: Add WCSS Q6DSP clock controller for QCS404
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404

 .../devicetree/bindings/clock/qcom,wcsscc.txt      |  26 +
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-qcs404.c                      |  39 +-
 drivers/clk/qcom/wcsscc-qcs404.c                   | 290 +++++++++
 drivers/remoteproc/qcom_q6v5_wcss.c                | 666 +++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-qcs404.h        |   3 +
 include/dt-bindings/clock/qcom,wcss-qcs404.h       |  24 +
 9 files changed, 1020 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
