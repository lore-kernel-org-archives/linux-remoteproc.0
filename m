Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v4 0/4] Add new SCM call for stage two mem translation and enable mss rproc on msm8996
Date: Mon, 15 May 2017 22:55:40 +0530
Message-Id: <1494869144-4174-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch does following
	1- Adds new scm call which helps in stage two translation of a memory region
	   so that multi proc mem access sharing can be achieved on armv8 and later.
	2- Enable mss remoteproc on msm8996

This patchset is based on tip of linux-next.

Avaneesh Kumar Dwivedi (4):
  firmware: scm: Add support for shared access of a memory
  remoteproc: qcom: refactor mss fw image loading sequence
  remoteproc: qcom: Add new secure monitor call for access
  remoteproc: qcom: Add support for mss boot on msm8996

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   4 +-
 drivers/firmware/qcom_scm-64.c                     |  27 ++
 drivers/firmware/qcom_scm.c                        |  75 ++++++
 drivers/firmware/qcom_scm.h                        |   4 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 280 ++++++++++++++++++---
 include/linux/qcom_scm.h                           |  14 ++
 6 files changed, 364 insertions(+), 40 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
