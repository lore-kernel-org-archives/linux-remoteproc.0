Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 0/4] Add memory ownership switch support and enable mss rproc on msm8996
Date: Fri,  2 Jun 2017 00:47:17 +0530
Message-Id: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch set does following
	1- Adds new scm call which helps in stage two translation of a memory region
	   so that memory ownership sharing and switching can be achieved on armv8 and later.
	2- Enable mss remoteproc on msm8996

Major changes since last patch:
	1- New SCM API now returns effective owner's set for the memory.
	2- Logic to call SCM API to switch ownership of mem region has been changed
           in MSS rproc driver.
	3- proxy and active supply initialization has been left out in case of msm 8996
	4- documentation of the SCM API has been changed as per comment.
	5- logging of fail cases during memory ownership swiitch has been readjusted.
	5- Other indentation and small errors.

Avaneesh Kumar Dwivedi (4):
  firmware: scm: Add new SCM call API for switching memory ownership
  remoteproc: qcom: refactor mss fw image loading sequence
  remoteproc: qcom: Make secure world call for mem ownership switch
  remoteproc: qcom: Add support for mss remoteproc on msm8996

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
 drivers/firmware/qcom_scm-32.c                     |   6 +
 drivers/firmware/qcom_scm-64.c                     |  27 +++
 drivers/firmware/qcom_scm.c                        |  92 +++++++
 drivers/firmware/qcom_scm.h                        |   5 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 263 ++++++++++++++++++---
 include/linux/qcom_scm.h                           |  16 ++
 7 files changed, 373 insertions(+), 37 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
