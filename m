Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RESEND: PATCH v4 0/4] Add memory ownership switch support and enable mss rproc on msm8996
Date: Tue, 16 May 2017 23:31:58 +0530
Message-Id: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch does following
	1- Adds new scm call which helps in stage two translation of a memory region
	   so that memory ownership sharing and switching can be achieved on armv8 and later.
	2- Enable mss remoteproc on msm8996

Major changes since last patch:
	1- Refactored SCM API
	2- Changed SCM API Signature 
	3- Added cpu_to_le32() as and where required
	4- Elaborated documentation of new API added
	5- Refactored MSS rproc code which make the scm api call
	6- Refactored mss rproc code to first load all segments and then transfer ownership of
	   memory region to MSS for authentication and boot etc.
	7- Other Minor changes
	8- kbuild robot gave error so added dummy definition of __qcom_scm_assign_mem() in qcom_scm-32.c as well
Avaneesh Kumar Dwivedi (4):
  firmware: scm: Add new SCM call for switching memory ownership
  remoteproc: qcom: refactor mss fw image loading sequence
  remoteproc: qcom: Make secure world call for mem ownership switch
  remoteproc: qcom: Add support for mss boot on msm8996

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   4 +-
 drivers/firmware/qcom_scm-32.c                     |   6 +
 drivers/firmware/qcom_scm-64.c                     |  27 ++
 drivers/firmware/qcom_scm.c                        |  75 ++++++
 drivers/firmware/qcom_scm.h                        |   4 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 280 ++++++++++++++++++---
 include/linux/qcom_scm.h                           |  14 ++
 7 files changed, 370 insertions(+), 40 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
