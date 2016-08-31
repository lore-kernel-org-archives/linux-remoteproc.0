Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 11/19] remoteproc: core: Add function to get resource table spare bytes information
Date: Wed, 31 Aug 2016 22:50:14 +0200
Message-ID: <1472676622-32533-12-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Remoteproc needs to know if a resource table has spare resource
allowing resoure table extension.
This function parse resource table to detect spare resource.
If any, it returns available spare bytes and index of spare resource.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ffb56c0..30e9c70 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -951,6 +951,35 @@ int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *reso
 }
 EXPORT_SYMBOL(rproc_request_resource);
 
+static int __get_rsc_tbl_spare_size(struct rproc *rproc,
+					  struct resource_table *table_ptr, int len,
+					  int *spare_index)
+{
+	struct device *dev = &rproc->dev;
+	int i;
+
+	for (i = 0; i < table_ptr->num; i++) {
+		int offset = table_ptr->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table_ptr + offset;
+		struct fw_rsc_spare *spare = (void *)hdr + sizeof(*hdr);
+
+		dev_dbg(dev, "rsc: type %d\n", hdr->type);
+
+		if (hdr->type >= RSC_LAST) {
+			dev_warn(dev, "unsupported resource %d\n", hdr->type);
+			continue;
+		}
+
+		if (hdr->type != RSC_SPARE)
+			continue;
+
+		*spare_index = i;
+		return spare->len;
+	}
+
+	return 0;
+}
+
 static int __verify_rsc_tbl_entry(struct rproc *rproc,
 				struct rproc_request_resource *request,
 				struct resource_table *table, int size)
-- 
1.9.1
