Return-Path: <rohitkr@codeaurora.org>
From: Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v3 0/2] Add ADSP PIL driver for SDM845
Date: Mon,  3 Sep 2018 17:22:38 +0530
Message-Id: <1535975560-8200-1-git-send-email-rohitkr@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org
Cc: Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This provides initial patchset for ADSP PIL driver for SDM845.

Changes since v2:
	Separated dt-bindings documentation into separate patch.
	Used clk_bulk APIs for adsp clocks.
	Used power domain API and use reference to rpmhd resource.
	Renamed qcom_nonpas_adsp_pil.c to qcom_adsp_pil.c
	Removed smd as sdm845 does not support smd.
	Removed px_supply and aggre2_clk for sdm845 as they are not required.
	Removed reg-names as there is only one register.

This patch is dependent on the rpmh powerdomain driver https://lkml.org/lkml/2018/6/27/7
and renaming of Hexagon v5 PAS driver https://lkml.org/lkml/2018/8/28/129 .

Rohit kumar (2):
  dt-binding: remoteproc: Add QTI ADSP PIL bindings
  remoteproc: qcom: Introduce Non-PAS ADSP PIL driver

 .../bindings/remoteproc/qcom,adsp-pil.txt          | 123 +++++
 drivers/remoteproc/Kconfig                         |  14 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_adsp_pil.c                 | 500 +++++++++++++++++++++
 4 files changed, 638 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
 create mode 100644 drivers/remoteproc/qcom_adsp_pil.c

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
