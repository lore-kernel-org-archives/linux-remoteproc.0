Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 04/18] remoteproc: Add rproc_get_by_node helper
Date: Thu, 16 Apr 2020 18:13:17 +0200
Message-ID: <20200416161331.7606-5-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Allow to retrieve the rproc structure from a rproc platform
child declared in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 14 ++++++--------
 include/linux/remoteproc.h           |  7 ++++++-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4fcd685cbfd8..32056449bb72 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1739,10 +1739,10 @@ void rproc_shutdown(struct rproc *rproc)
 EXPORT_SYMBOL(rproc_shutdown);
 
 /**
- * rproc_get_by_phandle() - find a remote processor by phandle
- * @phandle: phandle to the rproc
+ * rproc_get_by_node() - find a remote processor by device node
+ * @np: device tree node
  *
- * Finds an rproc handle using the remote processor's phandle, and then
+ * Finds an rproc handle using the remote processor's node, and then
  * return a handle to the rproc.
  *
  * This function increments the remote processor's refcount, so always
@@ -1751,12 +1751,10 @@ EXPORT_SYMBOL(rproc_shutdown);
  * Returns the rproc handle on success, and NULL on failure.
  */
 #ifdef CONFIG_OF
-struct rproc *rproc_get_by_phandle(phandle phandle)
+struct rproc *rproc_get_by_node(struct device_node *np)
 {
 	struct rproc *rproc = NULL, *r;
-	struct device_node *np;
 
-	np = of_find_node_by_phandle(phandle);
 	if (!np)
 		return NULL;
 
@@ -1781,12 +1779,12 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 	return rproc;
 }
 #else
-struct rproc *rproc_get_by_phandle(phandle phandle)
+struct rproc *rproc_get_by_node(struct device_node *np)
 {
 	return NULL;
 }
 #endif
-EXPORT_SYMBOL(rproc_get_by_phandle);
+EXPORT_SYMBOL(rproc_get_by_node);
 
 /**
  * rproc_add() - register a remote processor
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a78e28bda962..ab9762563ae0 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -586,9 +586,14 @@ struct rproc_vdev {
 	u32 index;
 };
 
-struct rproc *rproc_get_by_phandle(phandle phandle);
+struct rproc *rproc_get_by_node(struct device_node *np);
 struct rproc *rproc_get_by_child(struct device *dev);
 
+static inline struct rproc *rproc_get_by_phandle(phandle phandle)
+{
+	return rproc_get_by_node(of_find_node_by_phandle(phandle));
+}
+
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
 			  const char *firmware, int len);
-- 
2.17.1
