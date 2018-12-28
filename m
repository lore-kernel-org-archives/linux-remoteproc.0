Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Add firmware bindings for Q6V5 MSS/PAS
Date: Fri, 28 Dec 2018 10:18:17 +0530
Message-Id: <20181228044819.5697-1-sibis@codeaurora.org>
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
locations. This is achieved by using "firmware-name" binding to store
the relative path of mba/modem/pas firmware images.

remoteproc@4080000 { 
	...
	firmware-name = "qcom/sdm845/mss/mba.mbn",
			"qcom/sdm845/mss/modem.mdt";
	...
}

remoteproc@17300000 {
	...
	firmware-name = "qcom/sdm845/lpass/adsp.mdt";
	...
}

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

v2:
  * Replace "qcom,firmware" with "firmware-name" as suggested
    by Rob
  * Include dt-bindings/parsing logic for PAS based remoteprocs 

Sibi Sankar (2):
  dt-bindings: remoteproc: qcom: Add firmware bindings for Q6V5
  remoteproc: qcom: Add support for parsing fw dt bindings

 .../bindings/remoteproc/qcom,adsp.txt         |  6 +++
 .../bindings/remoteproc/qcom,q6v5.txt         |  7 +++
 drivers/remoteproc/qcom_q6v5_mss.c            | 46 +++++++++++++++----
 drivers/remoteproc/qcom_q6v5_pas.c            | 11 ++++-
 4 files changed, 59 insertions(+), 11 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
