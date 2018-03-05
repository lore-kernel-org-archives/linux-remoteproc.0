Return-Path: <sibis@codeaurora.org>
From: sibis <sibis@codeaurora.org>
Subject: [PATCH 0/6] Add support for remoteproc modem-pil on SDM845 SoCs
Date: Mon,  5 Mar 2018 15:23:27 +0530
Message-Id: <1520243613-30393-1-git-send-email-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, p.zabel@pengutronix.de, ohad@wizery.com, mark.rutland@arm.com, robh+dt@kernel.org, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series add support for remoteproc Q6v5 modem-pil on Qualcomm
SDM845 SoC. The first patch adds AOSS (Always on subsystem) reset driver
to provide for mss reset line. The third patch adds the APCS offset for
SDM845. The last couple of patches add the resets sequence for Q6 on
SDM845 and adds helper functions for arbitrary reset assert/deassert
sequences

V2:
   Addressed reset-qcom-aoss review suggestions and reworked
   re-ordering of the active clk and reset sequence in
   qcom_q6v5_pil

sibis (6):
  reset: qcom: AOSS (Always on subsystem) reset controller
  dt-bindings: mailbox: Add APCS global binding for SDM845 SoCs
  mailbox: Add support for Qualcomm SDM845 SoCs
  dt-bindings: remoteproc: Add Q6v5 Modem PIL binding for SDM845
  remoteproc: qcom: Add support for mss remoteproc on SDM845
  remoteproc: qcom: Always assert and deassert reset signals in SDM845

 .../bindings/mailbox/qcom,apcs-kpss-global.txt     |   3 +-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   5 +-
 .../devicetree/bindings/reset/qcom,aoss-reset.txt  |  54 +++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 163 ++++++++++++++++++++-
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-qcom-aoss.c                    | 151 +++++++++++++++++++
 include/dt-bindings/reset/qcom,aoss-sdm845.h       |  17 +++
 9 files changed, 396 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
 create mode 100644 drivers/reset/reset-qcom-aoss.c
 create mode 100644 include/dt-bindings/reset/qcom,aoss-sdm845.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
