Return-Path: <d-gerlach@ti.com>
From: Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH] remoteproc: Fix potential race condition in rproc_add
Date: Wed, 25 May 2016 15:41:28 -0500
Message-ID: <9fb3ac21209aaa791882a5121f4c48153f0335b4.1464206136.git.d-gerlach@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

rproc_add adds the newly created remoteproc to a list for use by
rproc_get_by_phandle and then does some additional processing to finish
adding the remoteproc. This leaves a small window of time in which the
rproc is available in the list but not yet fully initialized, so if
another driver comes along and gets a handle to the rproc, it will be
invalid. Rearrange the code in rproc_add to make sure the rproc is added
to the list only after it has been successfuly initialized.

Fixes: fec47d863587 ("remoteproc: introduce rproc_get_by_phandle API")
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index db3958b3f094..fe0539ed9cb5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1264,11 +1264,6 @@ int rproc_add(struct rproc *rproc)
 	if (ret < 0)
 		return ret;
 
-	/* expose to rproc_get_by_phandle users */
-	mutex_lock(&rproc_list_mutex);
-	list_add(&rproc->node, &rproc_list);
-	mutex_unlock(&rproc_list_mutex);
-
 	dev_info(dev, "%s is available\n", rproc->name);
 
 	dev_info(dev, "Note: remoteproc is still under development and considered experimental.\n");
@@ -1276,8 +1271,16 @@ int rproc_add(struct rproc *rproc)
 
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
+	ret = rproc_add_virtio_devices(rproc);
+	if (ret < 0)
+		return ret;
 
-	return rproc_add_virtio_devices(rproc);
+	/* expose to rproc_get_by_phandle users */
+	mutex_lock(&rproc_list_mutex);
+	list_add(&rproc->node, &rproc_list);
+	mutex_unlock(&rproc_list_mutex);
+
+	return 0;
 }
 EXPORT_SYMBOL(rproc_add);
 
-- 
2.8.3
