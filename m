Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/5] Add the missing remoteprocs on MSM8998
Date: Wed, 18 Dec 2019 18:52:12 +0530
Message-Id: <20191218132217.28141-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org
Cc: ohad@wizery.com, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series adds support for booting the Audio, Modem and Sensor
DSPs found in Qualcomm's MSM8998 SoCs.

Patch 5: arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI
depends on RPM_SMD_XO_CLK_SRC

V2:
 * split the series according to SoC
 * gpu reserved memory size is now updated
 * addressed review comments from Jeff

Sibi Sankar (5):
  remoteproc: q6v5-mss: Remove mem clk from the active pool
  dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998
    SoC
  remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
  arm64: dts: qcom: msm8998: Update reserved memory map
  arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes

 .../bindings/remoteproc/qcom,adsp.txt         |   7 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |   8 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 194 +++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   1 -
 drivers/remoteproc/qcom_q6v5_pas.c            |  32 +++
 5 files changed, 230 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
