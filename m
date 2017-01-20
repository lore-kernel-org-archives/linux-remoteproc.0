Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC PATCH v2 0/3] remoteproc: qcom: Introduce Qualcomm low pass sensor peripheral loader.
Date: Fri, 20 Jan 2017 21:40:33 +0530
Message-Id: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patchset has changed from last patchset in below respect
	1- Discard Independent SLPI driver.
	2- Add SLPI boot support in existing SLPI driver.
	3- Modify existing ADSP rproc driver to handle resource in generic manner based on compatible string.
	4- Address minor comments for Dt-binding documentation and smp2p support for slpi.

Avaneesh Kumar Dwivedi (3):
  remoteproc: qcom: make adsp resource handling generic.
  remoteproc: qcom: Add slpi boot support in adsp rproc driver.
  arm64: dts: msm8996: Add SLPI SMP2P dt node.

 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |  29 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  24 ++
 drivers/remoteproc/qcom_adsp_pil.c                 | 282 +++++++++++++++++----
 3 files changed, 284 insertions(+), 51 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
