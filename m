Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 10/19] remoteproc: Add rproc resource with id struct
Date: Fri, 24 Mar 2017 12:22:26 -0700
Message-ID: <1490383355-23176-11-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add a struct to keep the rproc resources which have been
assinged with ids.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_internal.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index f03e07a..7e25621 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -23,6 +23,28 @@
 #include <linux/irqreturn.h>
 #include <linux/firmware.h>
 
+
+/**
+ * enum rproc_id_rsc_type -  types of data which needs idr
+ *
+ * @RPROC_IDR_VDEV: rproc vdev data type
+ * @RPROC_IDR_VRING: rpring vring data type
+ */
+enum rproc_id_rsc_type {
+	RPROC_IDR_VDEV  = 0,
+	RPROC_IDR_VRING = 1,
+};
+
+/**
+ * struct rproc_id_rsc - rproc resource with assigned id
+ * @rsc_type: type of resource
+ * @rsc_ptr: pointer to the resource data;
+ */
+struct rproc_id_rsc {
+	unsigned int rsc_type;
+	void *rsc_ptr;
+};
+
 struct rproc;
 
 /**
-- 
1.9.1
