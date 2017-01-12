Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC 0/3] remoteproc: Introducing Qualcomm SLPI rproc driver
Date: Thu, 12 Jan 2017 19:23:34 +0530
Message-Id: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

SLPI is low pass sensor controller subsystem.
This patch has:
	1- slpi rproc driver source file.
	2- DT-Binding documentation
	3- slpi smp2p DT node 

This patch is tested on MSM8996 MTP platform with modification in regulator code.

Avaneesh Kumar Dwivedi (3):
  remoteproc: qcom: Introduce Qualcomm low pass sensor peripheral
    loader.
  dt-binding: remoteproc: Introduce DT binding for Qualcomm slpi
    subsystem.
  arm64: dts: msm8996: Add SMP2P node for Qualcomm SLPI rproc driver.

 .../devicetree/bindings/remoteproc/qcom,slpi.txt   |  88 ++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  24 ++
 drivers/remoteproc/Kconfig                         |  12 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_slpi_pil.c                 | 445 +++++++++++++++++++++
 5 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt
 create mode 100644 drivers/remoteproc/qcom_slpi_pil.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
