Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/5] Add support for remoteproc modem-pil on SDM845 SoCs
Date: Wed, 25 Apr 2018 20:38:38 +0530
Message-Id: <20180425150843.26657-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series add support for remoteproc Q6v5 modem-pil on Qualcomm
SDM845 SoC. The first patch adds AOSS (Always on subsystem) reset driver
to provide for mss reset line. The last couple of patches add the resets
sequence for Q6 on SDM845 and adds helper functions for arbitrary reset
assert/deassert sequences.

V4:
   Removed regmap depencencies from aoss reset driver
   Separted apss shared mailbox into separate patch
   Corrected all nits and replaced with author full name

V3:
   Removed syscon dependency for the aoss reset driver
   Split dt-bindings and the aoss reset driver into separate patches
   Corrected few typos and replaced misconfigured author name

V2:
   Addressed reset-qcom-aoss review suggestions and reworked
   re-ordering of the active clk and reset sequence in
   qcom_q6v5_pil

Depends on:
https://patchwork.kernel.org/patch/10363397/

Sibi Sankar (5):
  dt-bindings: reset: Add AOSS reset bindings for SDM845 SoCs
  reset: qcom: AOSS (always on subsystem) reset controller
  dt-bindings: remoteproc: Add Q6v5 Modem PIL binding for SDM845
  remoteproc: qcom: Add support for mss remoteproc on SDM845
  remoteproc: qcom: Always assert and deassert reset signals in SDM845

 .../bindings/remoteproc/qcom,q6v5.txt         |   1 +
 .../bindings/reset/qcom,aoss-reset.txt        |  52 +++++++
 drivers/remoteproc/qcom_q6v5_pil.c            | 144 +++++++++++++++++-
 drivers/reset/Kconfig                         |   9 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-qcom-aoss.c               | 133 ++++++++++++++++
 include/dt-bindings/reset/qcom,sdm845-aoss.h  |  17 +++
 7 files changed, 352 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
 create mode 100644 drivers/reset/reset-qcom-aoss.c
 create mode 100644 include/dt-bindings/reset/qcom,sdm845-aoss.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
