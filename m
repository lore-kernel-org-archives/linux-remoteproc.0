Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v6 0/3]remoteproc: qcom: Modification of  MSS rproc driver for future platform support.
Date: Fri, 30 Dec 2016 19:23:59 +0530
Message-Id: <1483106042-32118-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This is patchset v6 having modifications as per comment on patchset v5.
Major changes w.r.t. patchset v5 are as below.
	1- Squashing into one the two different patches to initialize and enable the regulators and clocks.
	2- Removal of certain unnecessary code and also cleaning of certain code piece, as per comment on last patchset.
	3- This Patch is ommiting addition of msm8996 mss loader support which will be submitted separately along with hyp 
	   assign support (to enable stage 2 translation support for modem which has to done by hypervisor)
	4- Skipping MSS RESET Support patch as that is merged on linux-next.

Avaneesh Kumar Dwivedi (3):
  remoteproc: qcom: Compatible string based private resource
    initialization.
  remoteproc: qcom: Initialize and enable proxy and active clocks.
  remoteproc: qcom: Initialize and enable proxy and active regulators.

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   4 +-
 drivers/remoteproc/qcom_q6v5_pil.c                 | 390 ++++++++++++++++-----
 2 files changed, 301 insertions(+), 93 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
