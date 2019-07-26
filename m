Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 0/7] Add non PAS wcss Q6 support for QCS404
Date: Fri, 26 Jul 2019 14:53:25 +0530
Message-Id: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add non PAS(Peripheral Authentication System) WCSS remoteproc
driver support and wcss clock/reset controls for QCS404 SOC.
Add WCSS q6 bootup and shutdown sequence handled from
Application Processor SubSystem(APSS).


Changes since v4:
 removed QDSP6SS clock controls and moved to wcss rproc.
 renamed wcsccc to q6sstopcc.
 cleanup/refactoring.

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

Govind Singh (7):
  clk: qcom: Add WCSS gcc clock control for QCS404
  dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
  clk: qcom: define probe by index API as common API
  clk: qcom: Add Q6SSTOP clock controller for QCS404
  remoteproc: qcom: wcss: populate hardcoded param using driver data
  remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
  remoteproc: qcom: wcss: explicitly request exclusive reset control

 .../bindings/clock/qcom,q6sstopcc.txt         |  26 +
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/common.c                     |  20 +
 drivers/clk/qcom/common.h                     |   2 +
 drivers/clk/qcom/gcc-qcs404.c                 |  30 +
 drivers/clk/qcom/lpasscc-sdm845.c             |  23 +-
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 +++++++
 drivers/remoteproc/qcom_q6v5_wcss.c           | 599 ++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   3 +
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 +
 11 files changed, 890 insertions(+), 63 deletions(-)
 create mode 100755 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
