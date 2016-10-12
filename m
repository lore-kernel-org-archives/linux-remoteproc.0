Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 01/20] remoteproc: core: New API to add new resources to the resource table
Date: Wed, 12 Oct 2016 18:00:19 +0200
Message-ID: <1476288038-24909-2-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

From: Lee Jones <lee.jones@linaro.org>

In order to amend or add a new resource table entry we need a method
for a platform-specific to submit them. rproc_request_resource() is a
new public API which provides this functionality.

It is to be called between rproc_alloc() and rproc_add().

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           | 21 +++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c6bfb349..67633ee 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -785,6 +785,45 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 		rproc_remove_virtio_dev(rvdev);
 }
 
+int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
+{
+	struct device *dev = &rproc->dev;
+	struct rproc_request_resource *request;
+	int size;
+
+	request = devm_kzalloc(dev, sizeof(*request), GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+
+	switch (type) {
+	case RSC_CARVEOUT:
+		size = sizeof(struct fw_rsc_carveout);
+		break;
+	case RSC_DEVMEM:
+		size = sizeof(struct fw_rsc_devmem);
+		break;
+	case RSC_TRACE:
+		size = sizeof(struct fw_rsc_trace);
+		break;
+	default:
+		dev_err(dev, "Unsupported resource type: %d\n", type);
+		return -EINVAL;
+	}
+
+	request->resource = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!request->resource)
+		return -ENOMEM;
+
+	memcpy(request->resource, resource, size);
+	request->type = type;
+	request->size = size;
+
+	list_add_tail(&request->node, &rproc->override_resources);
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_request_resource);
+
 /*
  * take a firmware and boot a remote processor with it.
  */
@@ -1370,6 +1409,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->mappings);
 	INIT_LIST_HEAD(&rproc->traces);
 	INIT_LIST_HEAD(&rproc->rvdevs);
+	INIT_LIST_HEAD(&rproc->override_resources);
 
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
 	init_completion(&rproc->crash_comp);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 930023b..dd29776 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -323,6 +323,25 @@ struct rproc_mem_entry {
 	struct list_head node;
 };
 
+/**
+ * struct rproc_requested_resources - add a resource to the resource table
+ *
+ * @resource:	pointer to a 'struct fw_rsc_*' resource
+ * @type:	'fw_resource_type' resource type
+ * @size:	size of resource
+ * @node:	list node
+ *
+ * Resources can be added by platform-specific rproc drivers calling
+ * rproc_request_resource()
+ *
+ */
+struct rproc_request_resource {
+	void *resource;
+	u32 type;
+	u32 size;
+	struct list_head node;
+};
+
 struct rproc;
 
 /**
@@ -428,6 +447,7 @@ struct rproc {
 	int num_traces;
 	struct list_head carveouts;
 	struct list_head mappings;
+	struct list_head override_resources;
 	struct completion firmware_loading_complete;
 	u32 bootaddr;
 	struct list_head rvdevs;
@@ -486,6 +506,7 @@ struct rproc_vdev {
 	u32 rsc_offset;
 };
 
+int rproc_request_resource(struct rproc *rproc, u32 type, void *res);
 struct rproc *rproc_get_by_phandle(phandle phandle);
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
-- 
1.9.1
