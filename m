Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v8 0/4] Add memory ownership switch support and enable mss rproc on msm8996
Date: Tue, 24 Oct 2017 21:22:23 +0530
Message-Id: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Changes w.r.t. last patchset
	1- Modify qcom_scm_assign_mem() to take pointer of source vmid's 
	   and use it to save next set of owner vmid's.
	2- Adds 32 bit of padding in struct qcom_scm_current_perm_info
	3- Fixes other minor comments like removing blank line, using "true" in place of "1",
	   renaming certain local variables for better clarity and modifying code to look more
	   uniform as per comment on last patch etc.

Avaneesh Kumar Dwivedi (4):
  firmware: scm: Add new SCM call API for switching memory ownership
  remoteproc: qcom: refactor mss fw image loading sequence
  remoteproc: qcom: Make secure world call for mem ownership switch
  remoteproc: qcom: Add support for mss remoteproc on msm8996

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/firmware/qcom_scm-32.c                     |   7 +
 drivers/firmware/qcom_scm-64.c                     |  27 ++
 drivers/firmware/qcom_scm.c                        |  98 ++++++++
 drivers/firmware/qcom_scm.h                        |   5 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 274 ++++++++++++++++++---
 include/linux/qcom_scm.h                           |  16 ++
 7 files changed, 390 insertions(+), 38 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
