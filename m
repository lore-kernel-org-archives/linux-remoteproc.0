Return-Path: <0101016e7ee9a02d-b6d3cc6c-c005-4451-aa52-8646d2a0af01-000000@us-west-2.amazonses.com>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/3] Introduce Protection Domain Restart (PDR) Helpers
Date: Mon, 18 Nov 2019 14:27:50 +0000
Message-ID: <0101016e7ee9a02d-b6d3cc6c-c005-4451-aa52-8646d2a0af01-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, robh+dt@kernel.org, tsoni@codeaurora.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. This patch series introduces pdr helper library and adds PD
tracking functionality for "avs/audio" allowing apr services to register
themselves asynchronously once the dependent PDs are up.

Sibi Sankar (3):
  soc: qcom: Introduce Protection Domain Restart helpers
  dt-bindings: soc: qcom: apr: Add protection domain bindings
  soc: qcom: apr: Add avs/audio tracking functionality

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  59 ++
 drivers/soc/qcom/Kconfig                      |   6 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/apr.c                        | 100 ++-
 drivers/soc/qcom/pdr_interface.c              | 685 ++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h               | 375 ++++++++++
 include/linux/soc/qcom/apr.h                  |   1 +
 include/linux/soc/qcom/pdr.h                  | 102 +++
 include/linux/soc/qcom/qmi.h                  |   1 +
 9 files changed, 1319 insertions(+), 11 deletions(-)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
