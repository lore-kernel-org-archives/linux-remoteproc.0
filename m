Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 14/19] remoteproc: core: Add resource request action support
Date: Wed, 31 Aug 2016 22:50:17 +0200
Message-ID: <1472676622-32533-15-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Handle resource requests according to associated action.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 96 ++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 43 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 25a429b..67b83d0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1171,58 +1171,64 @@ static int __add_rsc_tbl_entry(struct rproc *rproc,
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
-	rproc_dump_resource_table(rproc, table, size);
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
+	rproc_dump_resource_table(rproc, table, tablesz);
 
 	list_for_each_entry(resource, &rproc->override_resources, node) {
-		int updated = 0;
+		switch (resource->action) {
+		case RSC_ACT_VERIFY:
+			if (__verify_rsc_tbl_entry(rproc, resource, table, size)) {
+				ret = -EINVAL;
+				goto out;
+			}
+			break;
+		case RSC_ACT_UPDATE:
+			/* If we already have a table, update it with the new values. */
+			ret = __update_rsc_tbl_entry(rproc, resource, table, size, false);
+			if (ret < 0)
+				goto out;
+			break;
+		case RSC_ACT_FORCE_UPDATE:
+			/* If we already have a table, update it with the new values. */
+			ret = __update_rsc_tbl_entry(rproc, resource, table, size, true);
+			if (ret < 0)
+				goto out;
 
-		/* If we already have a table, update it with the new values. */
-		updated = __update_rsc_tbl_entry(rproc, resource, table, size,
-						 false);
-		if (updated < 0) {
-			table = ERR_PTR(updated);
-			goto out;
-		}
-		if (updated)
-			continue;
+			if (ret)
+				break;
 
-		/* Didn't find matching resource entry -- creating a new one. */
-		updated = __add_rsc_tbl_entry(rproc, resource, table, size);
-		if (updated)
+			/* Didn't find matching resource entry -- creating a new one. */
+			ret = __add_rsc_tbl_entry(rproc, resource, table, size);
+			if (ret)
+				goto out;
+
+			break;
+		case RSC_ACT_LOCAL:
+			/* nothing to do */
+			break;
+		default:
+			dev_err(&rproc->dev, "Unsupported resource action: %d\n",
+				resource->action);
+			ret = -EINVAL;
 			goto out;
+		};
 	}
 
-	rproc_dump_resource_table(rproc, table, size);
-
-	*tablesz = size;
-
  out:
-	return table;
+	rproc_dump_resource_table(rproc, table, tablesz);
+	return ret;
 }
 
 /*
@@ -1261,12 +1267,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
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
@@ -1281,6 +1281,16 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 
 	rproc->table_ptr = rproc->cached_table;
 
+	if (!list_empty(&rproc->override_resources)) {
+		ret = rproc_apply_resource_overrides(rproc, rproc->cached_table,
+						     tablesz);
+		if (ret) {
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
