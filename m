Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/5] Add coredump support for Q6v5 Modem remoteproc
Date: Tue,  9 Oct 2018 21:53:34 +0530
Message-Id: <20181009162339.30522-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, kyan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series add coredump support for modem on SDM845, MSM8996
and MSM8916 SoCs. Modem requires the mba to be loaded before a
coredump can be performed and this is achieved using a custom per
segment dump function.

V4:
  Addressed Bjorn's comments.

V3:
  [bjorn]:replace prepare/unprepare ops with a more generalised per segment
  dump function

V2:
  Introduce prepare/unprepare ops for rproc coredump
Sibi Sankar (5):
  remoteproc: Introduce custom dump function for each remoteproc segment
  remoteproc: Add mechanism for custom dump function assignment
  remoteproc: qcom: q6v5-mss: Refactor mba load/unload sequence
  remoteproc: qcom: q6v5-mss: Add custom dump function for modem
  remoteproc: qcom: q6v5-mss: Register segments/dumpfn for coredump

 drivers/remoteproc/qcom_q6v5_mss.c   | 307 ++++++++++++++++++---------
 drivers/remoteproc/remoteproc_core.c |  55 ++++-
 include/linux/remoteproc.h           |  11 +
 3 files changed, 268 insertions(+), 105 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
