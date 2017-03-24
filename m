Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 07/19] remoteproc: Add firmware checksum resource entry
Date: Fri, 24 Mar 2017 12:22:23 -0700
Message-ID: <1490383355-23176-8-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add a firmware checksum resource entry type to store the checksum
of the firmware in the resource table.

In the remoteproc driver firmware booting process, it can check
if the remote already runs the expected firmware so that it can
decide if it needs to restart the remote if the remote already
runs.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 include/linux/remoteproc.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b740b93..303210b 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -116,7 +116,8 @@ enum fw_resource_type {
 	RSC_TRACE	= 2,
 	RSC_VDEV	= 3,
 	RSC_RPROC_MEM	= 4,
-	RSC_LAST	= 5,
+	RSC_FW_CHKSUM   = 5,
+	RSC_LAST	= 6,
 };
 
 #define FW_RSC_ADDR_ANY (-1)
@@ -327,6 +328,20 @@ struct fw_rsc_rproc_mem {
 } __packed;
 
 /**
+ * struct fw_rsc_fw_chksum - firmware checksum
+ * @algo: algorithm to generate the cheksum
+ * @chksum: checksum of the firmware loadable sections.
+ *
+ * This resource entry provides checksum for the firmware loadable sections.
+ * It is used to check if the remote already runs with the expected firmware to
+ * decide if it needs to start the remote if the remote is already running.
+ */
+struct fw_rsc_fw_chksum {
+	u8 algo[16];
+	u8 chksum[64];
+} __packed;
+
+/**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
  * @dma: dma address
-- 
1.9.1
