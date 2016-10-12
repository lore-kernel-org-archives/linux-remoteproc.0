Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 20/20] remoteproc: core: Support empty resource tables
Date: Wed, 12 Oct 2016 18:00:38 +0200
Message-ID: <1476288038-24909-21-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

From: Lee Jones <lee.jones@linaro.org>

Currently, when a remote processor does not require resources, the
platform-specific remoteproc driver has to create a fake resource
table in order to by-pass the strict checking.  But there is no hard
requirement for a remote processor so require or support shared
resources.  This patch removes the strict checking and skips
resource table related operations if none is provided.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a6062e7..f83109d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -679,6 +679,9 @@ static int rproc_handle_resources(struct rproc *rproc, struct resource_table *ta
 	rproc_handle_resource_t handler;
 	int ret = 0, i;
 
+	if (!table_ptr)
+		return ret;
+
 	for (i = 0; i < table_ptr->num; i++) {
 		int offset = table_ptr->offset[i];
 		struct fw_rsc_hdr *hdr = (void *)table_ptr + offset;
@@ -1272,8 +1275,8 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	/* look for the resource table */
 	table = rproc_find_rsc_table(rproc, fw, &tablesz);
 	if (!table) {
-		dev_err(dev, "Failed to find resource table\n");
-		goto clean_up;
+		rproc->cached_table = table;
+		goto skip_resources;
 	}
 
 	/*  Verify resource table consistency */
@@ -1293,6 +1296,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	if (!rproc->cached_table)
 		goto clean_up;
 
+skip_resources:
 	rproc->table_ptr = rproc->cached_table;
 
 	if (!list_empty(&rproc->override_resources)) {
-- 
1.9.1
