Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 05/19] remoteproc: core: Add function to over-ride current resource table
Date: Wed, 31 Aug 2016 22:50:08 +0200
Message-ID: <1472676622-32533-6-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

From: Lee Jones <lee.jones@linaro.org>

Most of the new resource table handling function are now in place, so
it's time to put it all together.  Once new resource table information
has been requested, the structures will be held in a holding pen until
boot-time.  During boot-time rproc_apply_resource_overrides() will be
invoked which in turn will pull the new information out of the holding
pen and edit the table accordingly.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c2887be..96bc8c644 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1033,6 +1033,63 @@ rproc_add_resource_table_entry(struct rproc *rproc,
 	return table;
 }
 
+static struct resource_table*
+rproc_apply_resource_overrides(struct rproc *rproc,
+			       struct resource_table **orig_table,
+			       int *tablesz)
+{
+	struct rproc_request_resource *resource;
+	struct resource_table *table = *orig_table;
+	int size = *tablesz;
+
+	if (!table && size != 0) {
+		dev_err(&rproc->dev, "No table present but table size is set\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+
+	rproc_dump_resource_table(rproc, table, size);
+
+	if (!table) {
+		size = sizeof(*table);
+		table = devm_kzalloc(&rproc->dev, size, GFP_KERNEL);
+		if (!table) {
+			table = ERR_PTR(-ENOMEM);
+			goto out;
+		}
+		table->ver = 1;
+	}
+
+	list_for_each_entry(resource, &rproc->override_resources, node) {
+		int updated = 0;
+
+		/* If we already have a table, update it with the new values. */
+		updated = rproc_update_resource_table_entry(rproc, resource,
+							    table, size);
+		if (updated < 0) {
+			table = ERR_PTR(updated);
+			goto out;
+		}
+		if (updated)
+			continue;
+
+		/* Didn't find matching resource entry -- creating a new one. */
+		table = rproc_add_resource_table_entry(rproc, resource,
+						       table, &size);
+		if (IS_ERR(table))
+			goto out;
+
+		*orig_table = table;
+	}
+
+	rproc_dump_resource_table(rproc, table, size);
+
+	*tablesz = size;
+
+ out:
+	return table;
+}
+
 /*
  * take a firmware and boot a remote processor with it.
  */
@@ -1069,6 +1126,12 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up;
 	}
 
+	if (!list_empty(&rproc->override_resources)) {
+		table = rproc_apply_resource_overrides(rproc, &table, &tablesz);
+		if (IS_ERR(table))
+			goto clean_up;
+	}
+
 	/*
 	 * Create a copy of the resource table. When a virtio device starts
 	 * and calls vring_new_virtqueue() the address of the allocated vring
-- 
1.9.1
