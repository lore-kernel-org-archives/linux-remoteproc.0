Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 1/3] remoteproc: add rproc mem resource entry
Date: Fri, 24 Mar 2017 12:22:14 -0700
Message-ID: <1490383336-23117-2-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
References: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add a resource entry to the resource table to tells the host the remote
processor's memory which can be used as shared memory.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 include/linux/remoteproc.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 81da495..799f041 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -115,7 +115,8 @@ enum fw_resource_type {
 	RSC_DEVMEM	= 1,
 	RSC_TRACE	= 2,
 	RSC_VDEV	= 3,
-	RSC_LAST	= 4,
+	RSC_RPROC_MEM	= 4,
+	RSC_LAST	= 5,
 };
 
 #define FW_RSC_ADDR_ANY (-1)
@@ -306,6 +307,26 @@ struct fw_rsc_vdev {
 } __packed;
 
 /**
+ * struct fw_rsc_rproc_mem - remote processor memory
+ * @da: device address
+ * @pa: physical address
+ * @len: length (in bytes)
+ * @reserved: reserved (must be zero)
+ *
+ * This resource entry tells the host to the remote processor
+ * memory that the host can be used as shared memory.
+ *
+ * These request entries should precede other shared resource entries
+ * such as vdevs, vrings.
+ */
+struct fw_rsc_rproc_mem {
+	u32 da;
+	u32 pa;
+	u32 len;
+	u32 reserved;
+} __packed;
+
+/**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
  * @dma: dma address
-- 
1.9.1
