Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 03/20] remoteproc: core: Add function to amend an existing resource table entry
Date: Wed, 12 Oct 2016 18:00:21 +0200
Message-ID: <1476288038-24909-4-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

From: Lee Jones <lee.jones@linaro.org>

Sometimes the firmware does not know best.

When a firmware is built, it can be loaded with a resource table, usually
detailing shared; memory, virtual device, trace log information etc.
However, some vendors require this hard-coded information to be amended
with new/improved information obtained from Device Tree for instance.

Until now, no method exists which allows the resource table to be amended.
The addition of this function changes that.  It is now possible to pull in
a resource table and amend it before it is finally shared with the remote
device.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c8395b..c3830b4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -909,6 +909,69 @@ int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
 }
 EXPORT_SYMBOL(rproc_request_resource);
 
+static int rproc_update_resource_table_entry(struct rproc *rproc,
+				struct rproc_request_resource *request,
+				struct resource_table *table, int size)
+{
+	struct fw_rsc_carveout *tblc, *newc;
+	struct fw_rsc_devmem *tbld, *newd;
+	struct fw_rsc_trace *tblt, *newt;
+	int updated = true;
+	int i;
+
+	for (i = 0; i < table->num; i++) {
+		int offset = table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table + offset;
+		void *rsc = (void *)hdr + sizeof(*hdr);
+
+		if (request->type != hdr->type)
+			continue;
+
+		switch (hdr->type) {
+		case RSC_CARVEOUT:
+			tblc = rsc;
+			newc = request->resource;
+
+			if (strncmp(newc->name, tblc->name,
+				    sizeof(*tblc->name)))
+				break;
+
+			memcpy(tblc, newc, request->size);
+
+			return updated;
+		case RSC_DEVMEM:
+			tbld = rsc;
+			newd = request->resource;
+
+			if (strncmp(newd->name, tbld->name,
+				    sizeof(*tbld->name)))
+				break;
+
+			memcpy(tbld, newd, request->size);
+
+			return updated;
+		case RSC_TRACE:
+			tblt = rsc;
+			newt = request->resource;
+
+			if (strncmp(newt->name, tblt->name,
+				    sizeof(*tblt->name)))
+				break;
+
+			memcpy(tblt, newt, request->size);
+
+			return updated;
+		default:
+			dev_err(&rproc->dev,
+				"Unsupported resource type: %d\n",
+				hdr->type);
+			return -EINVAL;
+		}
+	}
+
+	return !updated;
+}
+
 /*
  * take a firmware and boot a remote processor with it.
  */
-- 
1.9.1
