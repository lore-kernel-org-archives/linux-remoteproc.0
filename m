Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
From: Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
Date: Wed, 19 Feb 2020 18:11:53 -0800
Message-Id: <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
In-Reply-To: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: Siddharth Gupta <sidgup@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Remoteproc recovery should be fast and any delay will have an impact on the
user-experience. Use power management APIs (pm_stay_awake and pm_relax) to
ensure that the system does not go to sleep.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 5ab65a4..52e318c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	if (!rproc->recovery_disabled)
 		rproc_trigger_recovery(rproc);
+
+	pm_relax(&rproc->dev);
 }
 
 /**
@@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 		return;
 	}
 
+	pm_stay_awake(&rproc->dev);
+
 	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
 		rproc->name, rproc_crash_to_string(type));
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
