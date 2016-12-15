Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 0/7] remoteproc: qcom: Add support of mss rproc for msm8996.
Date: Thu, 15 Dec 2016 17:35:39 +0530
Message-Id: <1481803546-31592-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This is patchset v5 having modifications as per comment on patchset v4.
Major changes w.r.t. patchset v4 are as below.	
	1- Compatible string and private struct naming according to platform.
	2- Separation of regulator and clock init.
	3- Regulator Init implementation change.
	4- Regulator and clock disable interface and implementation change.
	5- Reorganization of reset sequence.
	6- Other Minor comments related changes.

Avaneesh Kumar Dwivedi (7):
  remoteproc: qcom: Add private resource struct and new compatible.
  remoteproc: qcom: Add and initialize proxy and active clocks.
  remoteproc: qcom: Add and initialize proxy and active regulators.
  remoteproc: qcom: Modify regulator enable and disable interface.
  remoteproc: qcom: Modify clock enable and disable interface.
  remoteproc: qcom: Implement Hexagon core specific changes.
  clk: qcom: Add GCC_MSS_RESET support

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   5 +-
 drivers/clk/qcom/gcc-msm8996.c                     |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 562 ++++++++++++++++-----
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |   1 +
 4 files changed, 452 insertions(+), 117 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
