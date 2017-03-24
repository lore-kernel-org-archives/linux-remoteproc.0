Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 09/19] remoteproc: check firmware checksum in rproc_is_running_fw()
Date: Fri, 24 Mar 2017 12:22:25 -0700
Message-ID: <1490383355-23176-10-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

In rproc_is_running_fw() function, set the firmware checksum in resource
in the resource table and compared it with the one in the loaded resource
table.

If the firmware checksum in the loaded resource table matches the one
calculated with the firmware, the remote is running with the expected
firmware.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 447c28b..e4fb289 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -956,10 +956,33 @@ struct fw_rsc_fw_chksum *rproc_handle_fw_chksum(struct rproc *rproc,
  */
 static bool rproc_is_running_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	(void)rproc;
-	(void) fw;
+	struct resource_table *loaded_table;
+	struct fw_rsc_fw_chksum *rsc, *loaded_rsc;
+	int rsc_fw_chksum_offset;
 
-	return false;
+	rsc = rproc_handle_fw_chksum(rproc, fw, &rsc_fw_chksum_offset);
+	if (!rsc)
+		return false;
+
+	if (!rproc_is_running(rproc))
+		return false;
+
+	/* look for the loaded resource table */
+	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
+	if (!loaded_table)
+		return false;
+
+	loaded_rsc = (void *)loaded_table + rsc_fw_chksum_offset;
+	if (!loaded_rsc->algo || !loaded_rsc->chksum)
+		return false;
+
+	if (strncmp(rsc->algo, loaded_rsc->algo, strlen(rsc->algo)))
+		return false;
+
+	if (memcmp(rsc->chksum, loaded_rsc->chksum, sizeof(rsc->chksum)))
+		return false;
+
+	return true;
 }
 
 /*
-- 
1.9.1
