Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 1/4] remoteproc: Traverse rproc_list under RCU read lock
Date: Mon, 23 Mar 2020 22:29:01 -0700
Message-Id: <20200324052904.738594-2-bjorn.andersson@linaro.org>
In-Reply-To: <20200324052904.738594-1-bjorn.andersson@linaro.org>
References: <20200324052904.738594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In order to be able to traverse the mostly read-only rproc_list without
locking during panic migrate traversal to be done under rcu_read_lock().

Mutual exclusion for modifications of the list continues to be handled
by the rproc_list_mutex and a synchronization point is added before
releasing objects that are popped from the list.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Added rculist include
- Picked up Mathieu's r-b

 drivers/remoteproc/remoteproc_core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a9ac1d01e09b..7ee976ee2044 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -26,6 +26,7 @@
 #include <linux/string.h>
 #include <linux/debugfs.h>
 #include <linux/devcoredump.h>
+#include <linux/rculist.h>
 #include <linux/remoteproc.h>
 #include <linux/iommu.h>
 #include <linux/idr.h>
@@ -1868,8 +1869,8 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 	if (!np)
 		return NULL;
 
-	mutex_lock(&rproc_list_mutex);
-	list_for_each_entry(r, &rproc_list, node) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(r, &rproc_list, node) {
 		if (r->dev.parent && r->dev.parent->of_node == np) {
 			/* prevent underlying implementation from being removed */
 			if (!try_module_get(r->dev.parent->driver->owner)) {
@@ -1882,7 +1883,7 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 			break;
 		}
 	}
-	mutex_unlock(&rproc_list_mutex);
+	rcu_read_unlock();
 
 	of_node_put(np);
 
@@ -1939,7 +1940,7 @@ int rproc_add(struct rproc *rproc)
 
 	/* expose to rproc_get_by_phandle users */
 	mutex_lock(&rproc_list_mutex);
-	list_add(&rproc->node, &rproc_list);
+	list_add_rcu(&rproc->node, &rproc_list);
 	mutex_unlock(&rproc_list_mutex);
 
 	return 0;
@@ -2156,9 +2157,12 @@ int rproc_del(struct rproc *rproc)
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
 	mutex_lock(&rproc_list_mutex);
-	list_del(&rproc->node);
+	list_del_rcu(&rproc->node);
 	mutex_unlock(&rproc_list_mutex);
 
+	/* Ensure that no readers of rproc_list are still active */
+	synchronize_rcu();
+
 	device_del(&rproc->dev);
 
 	return 0;
-- 
2.24.0
