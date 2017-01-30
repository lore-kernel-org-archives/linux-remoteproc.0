Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 0/4]remoteproc: qcom: Add support for  Qualcomm low pass sensor peripheral loader.
Date: Mon, 30 Jan 2017 20:33:05 +0530
Message-Id: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patchset has changed from last patchset in below respect
	1- Generic regulator and clock resource handling is dropped.
	2- Introdused additional px supply and aggre2 clock initialization.
	3- Add SLPI boot support in existing ADSP driver.
	4- Address other minor comments on patchset 2.

Avaneesh Kumar Dwivedi (4):
  remoteproc: qcom: Compatible string based resource initialization.
  remoteproc: qcom: Add additional agree2_clk and px regulator resource.
  remoteproc: qcom: Add SLPI rproc support to load and boot slpi proc.
  arm64: dts: msm8996: Add SLPI SMP2P dt node.

 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |  28 ++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  24 +++++
 drivers/remoteproc/qcom_adsp_pil.c                 | 100 ++++++++++++++++-----
 3 files changed, 130 insertions(+), 22 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
