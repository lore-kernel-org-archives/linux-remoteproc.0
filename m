Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 14/20] remoteproc: core: Add force mode to resource amending function
Date: Wed, 12 Oct 2016 18:00:32 +0200
Message-ID: <1476288038-24909-15-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds force mode to rproc_update_resource_table_entry function.
When force is unset, resource will be updated only if no specific
addresses are requested by firmware.
When force is set, resource is directly overwritten.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 26fc647..3847fd4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -980,7 +980,8 @@ static int rproc_verify_resource_table_entry(struct rproc *rproc,
 
 static int rproc_update_resource_table_entry(struct rproc *rproc,
 				struct rproc_request_resource *request,
-				struct resource_table *table, int size)
+				struct resource_table *table, int size,
+				bool force)
 {
 	struct fw_rsc_carveout *tblc, *newc;
 	struct fw_rsc_devmem *tbld, *newd;
@@ -1005,7 +1006,8 @@ static int rproc_update_resource_table_entry(struct rproc *rproc,
 			if (strncmp(newc->name, tblc->name, 32))
 				break;
 
-			memcpy(tblc, newc, request->size);
+			if (tblc->pa == FW_RSC_ADDR_ANY || force)
+				memcpy(tblc, newc, request->size);
 
 			return updated;
 		case RSC_DEVMEM:
@@ -1143,7 +1145,7 @@ rproc_apply_resource_overrides(struct rproc *rproc,
 
 		/* If we already have a table, update it with the new values. */
 		updated = rproc_update_resource_table_entry(rproc, resource,
-							    table, size);
+						table, size, false);
 		if (updated < 0) {
 			table = ERR_PTR(updated);
 			goto out;
-- 
1.9.1
