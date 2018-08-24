Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/6] Add support for PDC Global on SDM845 SoCs
Date: Fri, 24 Aug 2018 18:48:54 +0530
Message-Id: <20180824131900.5353-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series add support for PDC Global (Power Domain Controller)
on SDM845 SoCs and adds pdc reset lines assert/deassert to remoteproc
Q6v5 modem-pil. The first two patches adds PDC Global reset driver to
control reset signals of Modem, Compute, Display, GPU, Debug, AOP,
Sensors, Audio, SP and APPS. The last four patches (cleans up)/adds pdc
reset lines to q6v5 bindings and asserts/deasserts in modem start/stop
path.

v2:
  Incorporated Philipp/Bjorn/Rob suggestions
  Renamed reset binding to pdc-global.txt
  replaced offset with #define of register name
  replaced with devm_reset_control_get_exclusive()
  Separted dt binding from the drivers 

The last 4 remoteproc patches can be picked up after the pdc global
reset driver lands on linux-next.

Sibi Sankar (6):
  dt-bindings: reset: Add PDC Global binding for SDM845 SoCs
  reset: qcom: PDC Global (Power Domain Controller) reset controller
  dt-bindings: remoteproc: Remove additional definition tag
  dt-bindings: remoteproc: Add PDC reset binding for Q6V5 PIL
  remoteproc: qcom: q6v5-pil: Explicitly get mss_restart line
  remoteproc: qcom: q6v5-pil: Add PDC reset for modem on SDM845 SoCs

 .../bindings/remoteproc/qcom,q6v5.txt         |   6 +-
 .../bindings/reset/qcom,pdc-global.txt        |  52 +++++++
 drivers/remoteproc/qcom_q6v5_pil.c            |  31 +++-
 drivers/reset/Kconfig                         |   9 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-qcom-pdc.c                | 142 ++++++++++++++++++
 include/dt-bindings/reset/qcom,sdm845-pdc.h   |  20 +++
 7 files changed, 254 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
 create mode 100644 drivers/reset/reset-qcom-pdc.c
 create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
