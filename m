Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 06/20] remoteproc: core: Associate action to resource request
Date: Wed, 12 Oct 2016 18:00:24 +0200
Message-ID: <1476288038-24909-7-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

With new rproc_request_resource API, rproc driver has now the
capability to provide resources to remoteproc in order to modify
firmware resource table.
But in some cases, other operations are needed like compatibility
check between resources defined at firmware level and those handled
by rproc driver, or remoteproc local resource management when firmware
has no resource table.

This patch associates action to each resource request to:
- verify a resource
- update/amend a resource in firmware resource table

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c |  6 +++++-
 include/linux/remoteproc.h           | 23 ++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9bf48ba..4c6314e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -870,7 +870,7 @@ static void rproc_dump_resource_table(struct rproc *rproc,
 	}
 }
 
-int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
+int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *resource)
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_request_resource *request;
@@ -880,6 +880,9 @@ int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
 	if (!request)
 		return -ENOMEM;
 
+	if (action >= RSC_ACT_LAST)
+		return -EINVAL;
+
 	switch (type) {
 	case RSC_CARVEOUT:
 		size = sizeof(struct fw_rsc_carveout);
@@ -902,6 +905,7 @@ int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
 	memcpy(request->resource, resource, size);
 	request->type = type;
 	request->size = size;
+	request->action = action;
 
 	list_add_tail(&request->node, &rproc->override_resources);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index dd29776..760f29b 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -324,11 +324,31 @@ struct rproc_mem_entry {
 };
 
 /**
+ * enum rproc_request_action - types of actions associated to a resource
+ * request
+ *
+ * @RSC_ACT_CHECK:	  request to verify this resource with firmware one
+ * @RSC_ACT_UPDATE:	  request to update firmware resource table with associated
+ *			  resource if possible
+ * @RSC_ACT_FORCE_UPDATE: force firmware resource table update with associated
+ *		          resource
+ * @RSC_ACT_LAST:         just keep this one at the end
+ *
+ */
+enum rproc_request_action {
+	RSC_ACT_VERIFY		= 0,
+	RSC_ACT_UPDATE		= 1,
+	RSC_ACT_FORCE_UPDATE	= 2,
+	RSC_ACT_LAST		= 3,
+};
+
+/**
  * struct rproc_requested_resources - add a resource to the resource table
  *
  * @resource:	pointer to a 'struct fw_rsc_*' resource
  * @type:	'fw_resource_type' resource type
  * @size:	size of resource
+ * @action:	action associated the resource
  * @node:	list node
  *
  * Resources can be added by platform-specific rproc drivers calling
@@ -339,6 +359,7 @@ struct rproc_request_resource {
 	void *resource;
 	u32 type;
 	u32 size;
+	u32 action;
 	struct list_head node;
 };
 
@@ -506,7 +527,7 @@ struct rproc_vdev {
 	u32 rsc_offset;
 };
 
-int rproc_request_resource(struct rproc *rproc, u32 type, void *res);
+int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *res);
 struct rproc *rproc_get_by_phandle(phandle phandle);
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
-- 
1.9.1
