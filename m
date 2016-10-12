Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 04/20] remoteproc: core: Add function to append a new resource table entry
Date: Wed, 12 Oct 2016 18:00:22 +0200
Message-ID: <1476288038-24909-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

From: Lee Jones <lee.jones@linaro.org>

A new function now exists to pull in and amend and existing resource
table entry.  But what if we wish to provide a new resource?  This
function provides functionality to append a brand new resource entry
onto the resource table.  All complexity related to shuffling parts
of the table around, providing new offsets and incriminating number
of entries in the resource table's top-level header is taken care of
here.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c3830b4..3a26d4e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -972,6 +972,61 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
 	return !updated;
 }
 
+static struct resource_table*
+rproc_add_resource_table_entry(struct rproc *rproc,
+			       struct rproc_request_resource *request,
+			       struct resource_table *old_table, int *tablesz)
+{
+	struct resource_table *table;
+	struct fw_rsc_hdr h;
+	void *new_rsc_loc;
+	void *fw_header_loc;
+	void *start_of_rscs;
+	int new_rsc_offset;
+	int size = *tablesz;
+	int i;
+
+	h.type = request->type;
+
+	new_rsc_offset = size;
+
+	/*
+	 * Allocate another contiguous chunk of memory, large enough to
+	 * contain the new, expanded resource table.
+	 *
+	 * The +4 is for the extra offset[] element in the top level header
+	 */
+	size += sizeof(struct fw_rsc_hdr) + request->size + 4;
+	table = devm_kmemdup(&rproc->dev, old_table, size, GFP_KERNEL);
+	if (!table)
+		return ERR_PTR(-ENOMEM);
+
+	/* Shunt table by 4 Bytes to account for the extra offset[] element */
+	start_of_rscs = (void *)table + table->offset[0];
+	memmove(start_of_rscs + 4,
+		start_of_rscs, new_rsc_offset - table->offset[0]);
+	new_rsc_offset += 4;
+
+	/* Update existing resource entry's offsets */
+	for (i = 0; i < table->num; i++)
+		table->offset[i] += 4;
+
+	/* Update the top level 'resource table' header */
+	table->offset[table->num] = new_rsc_offset;
+	table->num++;
+
+	/* Copy new firmware header into table */
+	fw_header_loc = (void *)table + new_rsc_offset;
+	memcpy(fw_header_loc, &h, sizeof(h));
+
+	/* Copy new resource entry into table */
+	new_rsc_loc = (void *)fw_header_loc + sizeof(h);
+	memcpy(new_rsc_loc, request->resource, request->size);
+
+	*tablesz = size;
+	return table;
+}
+
 /*
  * take a firmware and boot a remote processor with it.
  */
-- 
1.9.1
