Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 12/20] remoteproc: core: Add function to verify an existing resource in rsc table
Date: Wed, 12 Oct 2016 18:00:30 +0200
Message-ID: <1476288038-24909-13-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

When a firmware is build, it can be loaded with a resource
usually detailing shared; memory, virtual device, trace log
information etc.
However, some SoCs or platforms require some hard-coded information.
Information may be fixed on both sides: firmware and rproc.
Until now, no method exists which allows to compare resource table
fixed resources and rproc driver configuration.
This new function changes that performing comparison between resources.
Only carveout resource supported for the moment.

It is rproc driver responsibility to provide list of resources to
verify during boot.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 96692c2..4297ee7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -933,6 +933,51 @@ int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *reso
 }
 EXPORT_SYMBOL(rproc_request_resource);
 
+static int rproc_verify_resource_table_entry(struct rproc *rproc,
+				struct rproc_request_resource *request,
+				struct resource_table *table, int size)
+{
+	struct fw_rsc_carveout *tblc, *newc;
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
+			if (strncmp(newc->name, tblc->name, 32))
+				break;
+
+			/* Verify firmware resource is part of rproc one. */
+			if (tblc->pa != FW_RSC_ADDR_ANY) {
+				int pa_offset = tblc->pa - newc->pa;
+
+				if (pa_offset < 0)
+					return -EINVAL;
+
+				if (pa_offset + tblc->len > newc->len)
+					return -EINVAL;
+			}
+			return 0;
+		default:
+			dev_err(&rproc->dev,
+				"Unsupported resource type: %d\n",
+				hdr->type);
+			return -EINVAL;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int rproc_update_resource_table_entry(struct rproc *rproc,
 				struct rproc_request_resource *request,
 				struct resource_table *table, int size)
-- 
1.9.1
