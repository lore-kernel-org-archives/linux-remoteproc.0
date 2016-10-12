Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 19/20] remotecore: core: Add resource table pointer argument to rproc_handle_resource
Date: Wed, 12 Oct 2016 18:00:37 +0200
Message-ID: <1476288038-24909-20-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

In current version, rproc_handle_resource use rproc->table_ptr
as default resource table, fixing table to handle.
This patch adds resource table as function argument to have more
flexibility and be able to handle resources from any table.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ee2dc8d..a6062e7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -672,16 +672,16 @@ static rproc_handle_resource_t rproc_vdev_handler[RSC_LAST] = {
 };
 
 /* handle firmware resource entries before booting the remote processor */
-static int rproc_handle_resources(struct rproc *rproc, int len,
-				  rproc_handle_resource_t handlers[RSC_LAST])
+static int rproc_handle_resources(struct rproc *rproc, struct resource_table *table_ptr,
+				  int len, rproc_handle_resource_t handlers[RSC_LAST])
 {
 	struct device *dev = &rproc->dev;
 	rproc_handle_resource_t handler;
 	int ret = 0, i;
 
-	for (i = 0; i < rproc->table_ptr->num; i++) {
-		int offset = rproc->table_ptr->offset[i];
-		struct fw_rsc_hdr *hdr = (void *)rproc->table_ptr + offset;
+	for (i = 0; i < table_ptr->num; i++) {
+		int offset = table_ptr->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)table_ptr + offset;
 		void *rsc = (void *)hdr + sizeof(*hdr);
 
 		dev_dbg(dev, "rsc: type %d\n", hdr->type);
@@ -1309,14 +1309,16 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	rproc->max_notifyid = -1;
 
 	/* look for virtio devices and register them */
-	ret = rproc_handle_resources(rproc, tablesz, rproc_vdev_handler);
+	ret = rproc_handle_resources(rproc, rproc->cached_table, tablesz,
+				     rproc_vdev_handler);
 	if (ret) {
 		dev_err(dev, "Failed to handle vdev resources: %d\n", ret);
 		goto clean_up;
 	}
 
 	/* handle fw resources which are required to boot rproc */
-	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
+	ret = rproc_handle_resources(rproc, rproc->cached_table, tablesz,
+				     rproc_loading_handlers);
 	if (ret) {
 		dev_err(dev, "Failed to process resources: %d\n", ret);
 		goto clean_up_resources;
-- 
1.9.1
