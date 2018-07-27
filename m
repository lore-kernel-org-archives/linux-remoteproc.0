Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/6] Add coredump support for Q6v5 Modem remoteproc
Date: Fri, 27 Jul 2018 20:49:57 +0530
Message-Id: <20180727152003.11663-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series add coredump support for modem on SDM845, MSM8996
and MSM8916 SoCs. Modem requires the mba to be loaded before a
coredump can be performed and this is achieved using a custom per
segment dump function.

V3:
  [bjorn]:replace prepare/unprepare ops with a more generalised per segment
  dump function

V2:
  Introduce prepare/unprepare ops for rproc coredump

Sibi Sankar (6):
  remoteproc: Introduce custom dump function for each remoteproc segment
  remoteproc: Add mechanism for custom dump function assignment
  remoteproc: qcom: q6v5-pil: Refactor mba load/unload sequence
  remoteproc: qcom: q6v5-pil: Add custom dump function for modem
  remoteproc: qcom: q6v5-pil: Register segments/dumpfn for coredump
  remoteproc: qcom: q6v5-pil: Assign the relocated address

 drivers/remoteproc/qcom_q6v5_pil.c   | 307 ++++++++++++++++++---------
 drivers/remoteproc/remoteproc_core.c |  52 ++++-
 include/linux/remoteproc.h           |   8 +
 3 files changed, 264 insertions(+), 103 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
