Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
From: Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH v2 3/6] remoteproc: sysmon: Inform current rproc about all active rprocs
Date: Wed,  8 Apr 2020 16:36:40 -0700
Message-Id: <1586389003-26675-4-git-send-email-sidgup@codeaurora.org>
In-Reply-To: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: Siddharth Gupta <sidgup@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Clients/services running on a remoteproc that booted up might need to be
aware of the state of already running remoteprocs. When a remoteproc boots
up (fresh or after recovery) it is not aware of the remoteprocs that booted
before it, i.e., the system state is incomplete. So to keep track of it we
send sysmon on behalf of all 'ONLINE' remoteprocs.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_sysmon.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 851664e..8d8996d 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -453,10 +453,20 @@ static int sysmon_prepare(struct rproc_subdev *subdev)
 	return 0;
 }
 
+/**
+ * sysmon_start() - start callback for the sysmon remoteproc subdevice
+ * @subdev:	instance of the sysmon subdevice
+ *
+ * Inform all the listners of sysmon notifications that the rproc associated
+ * to @subdev has booted up. The rproc that booted up also needs to know
+ * which rprocs are already up and running, so send start notifications
+ * on behalf of all the online rprocs.
+ */
 static int sysmon_start(struct rproc_subdev *subdev)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
 						  subdev);
+	struct qcom_sysmon *target;
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
 		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
@@ -464,6 +474,21 @@ static int sysmon_start(struct rproc_subdev *subdev)
 
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
 
+	mutex_lock(&sysmon_lock);
+	list_for_each_entry(target, &sysmon_list, node) {
+		if (target == sysmon ||
+		    target->rproc->state != RPROC_RUNNING)
+			continue;
+
+		event.subsys_name = target->name;
+
+		if (sysmon->ssctl_version == 2)
+			ssctl_send_event(sysmon, &event);
+		else if (sysmon->ept)
+			sysmon_send_event(sysmon, &event);
+	}
+	mutex_unlock(&sysmon_lock);
+
 	return 0;
 }
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
