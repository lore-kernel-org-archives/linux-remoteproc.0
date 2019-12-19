Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Add Modem support on SC7180 SoCs
Date: Thu, 19 Dec 2019 11:15:04 +0530
Message-Id: <20191219054506.20565-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series adds support for booting the Modem Q6 DSP found in
Qualcomm's SC7180 SoCs.

V2:
 * split the series according to SoC
 * Duplicate code across q6v5proc_reset
 * add Rob's 'Reviewed-by' tag

Sibi Sankar (2):
  dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
  remoteproc: mss: q6v5-mss: Add modem support on SC7180

 .../bindings/remoteproc/qcom,q6v5.txt         |  23 +-
 drivers/remoteproc/qcom_q6v5_mss.c            | 199 +++++++++++++++++-
 2 files changed, 219 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
