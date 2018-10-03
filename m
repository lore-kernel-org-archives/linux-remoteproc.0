Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH 5/5] rpmsg: glink: Convert the native signals to TIOCM
Date: Wed,  3 Oct 2018 17:04:23 +0530
Message-Id: <1538566463-24627-6-git-send-email-aneela@codeaurora.org>
In-Reply-To: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
References: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Native signals over SMEM transport are different from Linux TIOCM signals.
Add a macro to convert signals when sent or received from clients.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index ff8751b..3054c86 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -18,6 +18,7 @@
 #include <linux/rpmsg.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/termios.h>
 #include <linux/workqueue.h>
 #include <linux/mailbox_client.h>
 
@@ -211,6 +212,11 @@ struct glink_channel {
 
 #define GLINK_FEATURE_INTENTLESS	BIT(1)
 
+#define NATIVE_DTR_SIG BIT(31)
+#define NATIVE_CTS_SIG BIT(30)
+#define NATIVE_CD_SIG BIT(29)
+#define NATIVE_RI_SIG BIT(28)
+
 static void qcom_glink_rx_done_work(struct work_struct *work);
 
 static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
@@ -998,6 +1004,18 @@ static int qcom_glink_handle_signals(struct qcom_glink *glink,
 	}
 
 	old = channel->rsigs;
+
+	/* convert signals from NATIVE to TIOCM */
+	if (signals & NATIVE_DTR_SIG)
+		signals |= TIOCM_DSR;
+	if (signals & NATIVE_CTS_SIG)
+		signals |= TIOCM_CTS;
+	if (signals & NATIVE_CD_SIG)
+		signals |= TIOCM_CD;
+	if (signals & NATIVE_RI_SIG)
+		signals |= TIOCM_RI;
+	signals &= 0x0fff;
+
 	channel->rsigs = signals;
 
 	if (channel->ept.sig_cb)
@@ -1387,6 +1405,17 @@ static int qcom_glink_set_sigs(struct rpmsg_endpoint *ept, u32 sigs)
 
 	channel->lsigs = sigs;
 
+	/* convert signals from TIOCM to NATIVE */
+	sigs &= 0x0fff;
+	if (sigs & TIOCM_DTR)
+		sigs |= NATIVE_DTR_SIG;
+	if (sigs & TIOCM_RTS)
+		sigs |= NATIVE_CTS_SIG;
+	if (sigs & TIOCM_CD)
+		sigs |= NATIVE_CD_SIG;
+	if (sigs & TIOCM_RI)
+		sigs |= NATIVE_RI_SIG;
+
 	return qcom_glink_send_signals(glink, channel, sigs);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
