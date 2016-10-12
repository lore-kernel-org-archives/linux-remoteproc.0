Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 15/20] remoteproc: core: Append resource only if .resource_table section is large enough
Date: Wed, 12 Oct 2016 18:00:33 +0200
Message-ID: <1476288038-24909-16-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

To guarantee remoteproc won't overwrite firmware data when copying
back modified resource table, rproc_add_resource_table_entry verifies
first that .resource_table elf section is large enough to support new
resource appending.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 81 +++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3847fd4..f4a02f0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1057,39 +1057,73 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
 	return !updated;
 }
 
-static struct resource_table*
-rproc_add_resource_table_entry(struct rproc *rproc,
+static int rproc_add_resource_table_entry(struct rproc *rproc,
 			       struct rproc_request_resource *request,
-			       struct resource_table *old_table, int *tablesz)
+			       struct resource_table *table, int tablesz)
 {
-	struct resource_table *table;
-	struct fw_rsc_hdr h;
+	struct fw_rsc_hdr *hdr, h;
 	void *new_rsc_loc;
 	void *fw_header_loc;
 	void *start_of_rscs;
 	int new_rsc_offset;
-	int size = *tablesz;
-	int i;
+	struct fw_rsc_vdev *v;
+	int i, spare_len = 0, size;
+	unsigned int min_offset, max_offset = 0;
+
 
 	h.type = request->type;
 
-	new_rsc_offset = size;
+	/* Check available spare size to integrate new resource */
+	for (i = 0; i < table->num; i++)
+		max_offset = max(max_offset, table->offset[i]);
+
+	hdr = (void *)table + max_offset;
+
+	switch (hdr->type) {
+	case RSC_CARVEOUT:
+		size = sizeof(struct fw_rsc_carveout);
+		break;
+	case RSC_DEVMEM:
+		size = sizeof(struct fw_rsc_devmem);
+		break;
+	case RSC_TRACE:
+		size = sizeof(struct fw_rsc_trace);
+		break;
+	case RSC_VDEV:
+		v = (void *)hdr + sizeof(*hdr);
+		size = sizeof(*v);
+		size += v->num_of_vrings * sizeof(struct fw_rsc_vdev_vring);
+		size += v->config_len;
+		break;
+	default:
+		dev_err(&rproc->dev, "Unsupported resource type: %d\n",
+			hdr->type);
+		return -EINVAL;
+	}
+
+	new_rsc_offset = max_offset + size;
+	spare_len = tablesz - new_rsc_offset;
 
 	/*
-	 * Allocate another contiguous chunk of memory, large enough to
-	 * contain the new, expanded resource table.
-	 *
-	 * The +4 is for the extra offset[] element in the top level header
+	 * Available space must be greater or equal to :
+	 * new offset entry size (4Bytes)
+	 * + resource header size
+	 * + new resource size
 	 */
-	size += sizeof(struct fw_rsc_hdr) + request->size + 4;
-	table = devm_kmemdup(&rproc->dev, old_table, size, GFP_KERNEL);
-	if (!table)
-		return ERR_PTR(-ENOMEM);
+	if (spare_len < (4 + sizeof(h) + request->size))
+		return -ENOSPC;
+
+	/* Find the lowest resource table entry */
+	min_offset = table->offset[0];
+	for (i = 1; i < table->num; i++)
+		min_offset = min(min_offset, table->offset[i]);
+
 
 	/* Shunt table by 4 Bytes to account for the extra offset[] element */
-	start_of_rscs = (void *)table + table->offset[0];
+	start_of_rscs = (void *)table + min_offset;
 	memmove(start_of_rscs + 4,
-		start_of_rscs, new_rsc_offset - table->offset[0]);
+		start_of_rscs, new_rsc_offset - min_offset);
+
 	new_rsc_offset += 4;
 
 	/* Update existing resource entry's offsets */
@@ -1108,8 +1142,7 @@ rproc_add_resource_table_entry(struct rproc *rproc,
 	new_rsc_loc = (void *)fw_header_loc + sizeof(h);
 	memcpy(new_rsc_loc, request->resource, request->size);
 
-	*tablesz = size;
-	return table;
+	return 0;
 }
 
 static struct resource_table*
@@ -1154,12 +1187,10 @@ rproc_apply_resource_overrides(struct rproc *rproc,
 			continue;
 
 		/* Didn't find matching resource entry -- creating a new one. */
-		table = rproc_add_resource_table_entry(rproc, resource,
-						       table, &size);
-		if (IS_ERR(table))
+		updated = rproc_add_resource_table_entry(rproc, resource,
+							 table, size);
+		if (updated)
 			goto out;
-
-		*orig_table = table;
 	}
 
 	if (IS_ENABLED(DEBUG) || IS_ENABLED(CONFIG_DYNAMIC_DEBUG))
-- 
1.9.1
