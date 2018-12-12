Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/2] Add firmware bindings for Q6V5 MSS
Date: Wed, 12 Dec 2018 18:14:54 +0530
Message-Id: <20181212124456.3164-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org
Cc: briannorris@chromium.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Q6V5 MSS on certain SoCs like SDM845 are capable of operating under
completely different configuration (like Non-Modem WLAN configuration)
depending on the firmware loaded without any change in boot sequence
of the Hexagon core. The patch series is ultimately aimed to avoid
multiple compatibles per SoC to just specify different upstreamed firmware
locations. This is achieved by introducing "qcom,firmware" binding
to store the relative path of mba and modem metadata.

remoteproc@4080000 { 
	...
	qcom,firmware = "qcom/sdm845/mss/mba.mbn",
			"qcom/sdm845/mss/modem.mdt";
	...
}

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

SibiSankar (2):
  dt-bindings: remoteproc: qcom: Add firmware bindings for Q6V5 MSS
  remoteproc: qcom: q6v5-mss: Add support for parsing fw dt bindings

 .../bindings/remoteproc/qcom,q6v5.txt         |  7 +++
 drivers/remoteproc/qcom_q6v5_mss.c            | 49 ++++++++++++++++---
 2 files changed, 48 insertions(+), 8 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
