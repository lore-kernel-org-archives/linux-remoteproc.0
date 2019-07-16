Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: qcom: Move glink_ssr notification after stop
Date: Mon, 15 Jul 2019 22:03:27 -0700
Message-Id: <20190716050327.8866-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

glink_ssr is used to signal a remote processor "A" about the stopping of
another remote processor "B", so that in the event that remote processor
B is ever booted again the fifos of the glink channel between A and B is
in a known state.

But if remote processor A receives this notification before B is
actually stopped the newly reset fifo indices will be interpreted as
there being "data" on the channel and either side of the channel will
enter a fatal error handler.

Move the glink_ssr notification to the "unprepare" state of the
rproc_subdev to avoid this issue.

This has the side effect of us not notifying the dying remote processor
itself about its fate, which has been seen to block in certain resource
constraint scenarios.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6a448429f223..60650bcc8c67 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -200,7 +200,7 @@ void qcom_unregister_ssr_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
 
-static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 
@@ -220,7 +220,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
 			 const char *ssr_name)
 {
 	ssr->name = ssr_name;
-	ssr->subdev.stop = ssr_notify_stop;
+	ssr->subdev.unprepare = ssr_notify_unprepare;
 
 	rproc_add_subdev(rproc, &ssr->subdev);
 }
-- 
2.18.0
