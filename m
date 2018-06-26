Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
From: Alex Elder <elder@linaro.org>
Subject: [PATCH resend 2/5] remoteproc: Make start and stop in subdev optional
Date: Mon, 25 Jun 2018 20:34:06 -0500
Message-Id: <20180626013409.5125-3-elder@linaro.org>
In-Reply-To: <20180626013409.5125-1-elder@linaro.org>
References: <20180626013409.5125-1-elder@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Some subdevices, such as glink ssr only care about the stop operation,
so make the operations optional to reduce client code.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Alex Elder <elder@linaro.org>
Tested-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 5dd58e6bea88..981ae6dff145 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -780,16 +780,20 @@ static int rproc_start_subdevices(struct rproc *rproc)
 	int ret;
 
 	list_for_each_entry(subdev, &rproc->subdevs, node) {
-		ret = subdev->start(subdev);
-		if (ret)
-			goto unroll_registration;
+		if (subdev->start) {
+			ret = subdev->start(subdev);
+			if (ret)
+				goto unroll_registration;
+		}
 	}
 
 	return 0;
 
 unroll_registration:
-	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
-		subdev->stop(subdev, true);
+	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
+		if (subdev->stop)
+			subdev->stop(subdev, true);
+	}
 
 	return ret;
 }
@@ -798,8 +802,10 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
 
-	list_for_each_entry_reverse(subdev, &rproc->subdevs, node)
-		subdev->stop(subdev, crashed);
+	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
+		if (subdev->stop)
+			subdev->stop(subdev, crashed);
+	}
 }
 
 /**
-- 
2.17.1
