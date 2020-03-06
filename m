Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 0/2] Introduce PAS based Secure Subsystem rproc driver
Date: Fri,  6 Mar 2020 11:21:05 -0800
Message-Id: <1583522467-3499-1-git-send-email-rishabhb@codeaurora.org>
To: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Cc: tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Qualcomm SOCs have a secure remote processor that provides secure
execution environment for processing sensitive data and also performs
cryptographic operations using protected keys stored in its secure
storage. This patch series introduces a Peripheral Authentication
based remoteproc driver that handles booting, shutdown and crash
scenarios for SPSS. Also this driver can handle late attach usecase
where remote  processor is already booted even before linux. This
patchset builds up on the skip firmware load patch
"remoteproc: add support to skip firmware load when recovery" which is
in review.

Rishabh Bhatnagar (2):
  remoteproc: qcom: Add PAS based SPSS PIL driver
  dt-bindings: remoteproc: Add documentation for SPSS remoteproc

 .../devicetree/bindings/remoteproc/qcom,spss.txt   | 114 +++++
 drivers/remoteproc/Kconfig                         |  17 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_spss.c                     | 500 +++++++++++++++++++++
 4 files changed, 632 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,spss.txt
 create mode 100644 drivers/remoteproc/qcom_spss.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
