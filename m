Return-Path: <linux-arm-msm-owner@vger.kernel.org>
From: Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 0/2] remoteproc: core: Add core functionality to the remoteproc framework
Date: Wed, 19 Feb 2020 18:11:51 -0800
Message-Id: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: Siddharth Gupta <sidgup@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series adds core functionality to the remoteproc framework.

Patch 1 adds a new API to the framework which allows kernel clients to update
        the firmware name for the specified remoteproc.
Patch 2 intends to improve the user experience by preventing the system from
        going to sleep while the remoteproc is recovering from a crash.

Siddharth Gupta (2):
  remoteproc: core: Add an API for booting with firmware name
  remoteproc: core: Prevent sleep when rproc crashes

 drivers/remoteproc/remoteproc_core.c | 38 ++++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 2 files changed, 39 insertions(+)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
