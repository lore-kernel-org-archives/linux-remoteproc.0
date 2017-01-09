Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC ADD HYPERVISOR CALL SUPPORT 0/2]: Add hypervisor call support to enable mss rproc on msm8996
Date: Mon,  9 Jan 2017 20:40:07 +0530
Message-Id: <1483974609-25522-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This Patch series consist two patches.
	1- Add hypervisor call support to enable stage two translation applicable for armv8 and above.
	2- Add and enable mss remoteproc support for msm8996

This patchseries is dependednt on https://patchwork.kernel.org/patch/9492177/

Avaneesh Kumar Dwivedi (2):
  soc: qcom: Add hypervisor stage two translation request support.
  remoteproc: qcom: Add mss rproc support for msm8996.

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   2 +-
 drivers/firmware/qcom_scm-64.c                     |  16 ++
 drivers/firmware/qcom_scm.c                        |  13 +
 drivers/firmware/qcom_scm.h                        |  10 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 275 ++++++++++++++++++---
 drivers/soc/qcom/Kconfig                           |   8 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/secure_buffer.c                   | 229 +++++++++++++++++
 include/linux/qcom_scm.h                           |   1 +
 include/soc/qcom/secure_buffer.h                   |  51 ++++
 10 files changed, 574 insertions(+), 32 deletions(-)
 create mode 100644 drivers/soc/qcom/secure_buffer.c
 create mode 100644 include/soc/qcom/secure_buffer.h

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
