Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: Stop subdevices in reverse order
Date: Sun, 27 Aug 2017 22:31:42 -0700
Message-Id: <20170828053142.26152-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Subdevices might depend on earlier registered subdevices for
communication purposes, as such they should be stopped in reverse order
so that said communication channel is removed after the dependent
subdevice is stopped.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e82f60182027..5aaa4c21d14d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -794,7 +794,7 @@ static void rproc_remove_subdevices(struct rproc *rproc)
 {
 	struct rproc_subdev *subdev;
 
-	list_for_each_entry(subdev, &rproc->subdevs, node)
+	list_for_each_entry_reverse(subdev, &rproc->subdevs, node)
 		subdev->remove(subdev);
 }
 
-- 
2.12.0
