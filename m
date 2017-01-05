Return-Path: <spjoshi@codeaurora.org>
From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: [PATCH v3] soc: ti: wkup_m3_ipc: Drop wait from wkup_m3_rproc_boot_thread
Date: Thu,  5 Jan 2017 14:00:15 -0800
Message-Id: <1483653615-24378-1-git-send-email-spjoshi@codeaurora.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>, Dave Gerlach <d-gerlach@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The function wkup_m3_rproc_boot_thread waits for asynchronous
firmware loading to parse the resource table before calling
rproc_boot(). However, as the resource table parsing has been
moved to rproc_boot(), there's no need to wait for the
asynchronous firmware loading completion.  So, drop this.

CC: Dave Gerlach <d-gerlach@ti.com>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
---

This patch seems to be doing an independent clean up now. Hence
removing it from the series.

Changes from v2:

* Updated the subject line as per Suman's comment

 drivers/soc/ti/wkup_m3_ipc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 8823cc8..8bfa44b 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -370,8 +370,6 @@ static void wkup_m3_rproc_boot_thread(struct wkup_m3_ipc *m3_ipc)
 	struct device *dev = m3_ipc->dev;
 	int ret;
 
-	wait_for_completion(&m3_ipc->rproc->firmware_loading_complete);
-
 	init_completion(&m3_ipc->sync_complete);
 
 	ret = rproc_boot(m3_ipc->rproc);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
