Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 16/20] remoteproc: core: Add resource request action support
Date: Wed, 12 Oct 2016 18:00:34 +0200
Message-ID: <1476288038-24909-17-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Handle resource requests according to associated action.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 98 ++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f4a02f0..559a63b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1145,61 +1145,69 @@ static int rproc_add_resource_table_entry(struct rproc *rproc,
 	return 0;
 }
 
-static struct resource_table*
-rproc_apply_resource_overrides(struct rproc *rproc,
-			       struct resource_table **orig_table,
-			       int *tablesz)
+static int rproc_apply_resource_overrides(struct rproc *rproc,
+			       struct resource_table *table,
+			       int tablesz)
 {
 	struct rproc_request_resource *resource;
-	struct resource_table *table = *orig_table;
-	int size = *tablesz;
+	int ret = 0, size = tablesz;
 
 	if (!table && size != 0) {
 		dev_err(&rproc->dev, "No table present but table size is set\n");
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto out;
 	}
 
-
 	if (IS_ENABLED(DEBUG) || IS_ENABLED(CONFIG_DYNAMIC_DEBUG))
-		rproc_dump_resource_table(rproc, table, size);
-
-	if (!table) {
-		size = sizeof(*table);
-		table = devm_kzalloc(&rproc->dev, size, GFP_KERNEL);
-		if (!table) {
-			table = ERR_PTR(-ENOMEM);
-			goto out;
-		}
-		table->ver = 1;
-	}
+		rproc_dump_resource_table(rproc, table, tablesz);
 
 	list_for_each_entry(resource, &rproc->override_resources, node) {
-		int updated = 0;
+		switch (resource->action) {
+		case RSC_ACT_VERIFY:
+			ret = rproc_verify_resource_table_entry(rproc, resource,
+								table, size);
+			if (ret) {
+				ret = -EINVAL;
+				goto out;
+			}
+			break;
+		case RSC_ACT_UPDATE:
+			/* If we already have a table, update it with the new values. */
+			ret = rproc_update_resource_table_entry(rproc, resource,
+							table, size, false);
+			if (ret < 0)
+				goto out;
+			break;
+		case RSC_ACT_FORCE_UPDATE:
+			/* If we already have a table, update it with the new values. */
+			ret = rproc_update_resource_table_entry(rproc, resource,
+							table, size, true);
+			if (ret < 0)
+				goto out;
+
+			if (ret)
+				break;
 
-		/* If we already have a table, update it with the new values. */
-		updated = rproc_update_resource_table_entry(rproc, resource,
-						table, size, false);
-		if (updated < 0) {
-			table = ERR_PTR(updated);
-			goto out;
-		}
-		if (updated)
-			continue;
+			/* Didn't find matching resource entry -- creating a new one. */
+			ret = rproc_add_resource_table_entry(rproc, resource,
+							     table, size);
+			if (ret)
+				goto out;
 
-		/* Didn't find matching resource entry -- creating a new one. */
-		updated = rproc_add_resource_table_entry(rproc, resource,
-							 table, size);
-		if (updated)
+			break;
+		default:
+			dev_err(&rproc->dev, "Unsupported resource action: %d\n",
+				resource->action);
+			ret = -EINVAL;
 			goto out;
+		};
 	}
 
 	if (IS_ENABLED(DEBUG) || IS_ENABLED(CONFIG_DYNAMIC_DEBUG))
-		rproc_dump_resource_table(rproc, table, size);
-
-	*tablesz = size;
+		rproc_dump_resource_table(rproc, table, tablesz);
 
  out:
-	return table;
+	return ret;
 }
 
 /*
@@ -1238,12 +1246,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up;
 	}
 
-	if (!list_empty(&rproc->override_resources)) {
-		table = rproc_apply_resource_overrides(rproc, &table, &tablesz);
-		if (IS_ERR(table))
-			goto clean_up;
-	}
-
 	/*
 	 * Create a copy of the resource table. When a virtio device starts
 	 * and calls vring_new_virtqueue() the address of the allocated vring
@@ -1256,6 +1258,16 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 
 	rproc->table_ptr = rproc->cached_table;
 
+	if (!list_empty(&rproc->override_resources)) {
+		ret = rproc_apply_resource_overrides(rproc, rproc->cached_table,
+						     tablesz);
+		if (ret < 0) {
+			dev_err(dev, "Failed to apply overrides resources\n");
+			goto clean_up;
+		}
+
+	}
+
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
 
-- 
1.9.1
