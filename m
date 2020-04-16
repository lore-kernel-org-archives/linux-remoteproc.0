Return-Path: <BLEVINSK@xilinx.com>
Return-Path: ben.levinsky@xilinx.com
From: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH v2 3/5] firmware: xilinx: Add zynqmp_get_node_status API
Date: Thu, 16 Apr 2020 14:54:40 -0700
Message-Id: <1587074082-14836-4-git-send-email-ben.levinsky@xilinx.com>
In-Reply-To: <1587074082-14836-1-git-send-email-ben.levinsky@xilinx.com>
References: <1587074082-14836-1-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds a new API to provide access to the
current power state of a sub-system on Zynqmp sub-system.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 42 ++++++++++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 0a545a2..be7e460 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -727,6 +727,47 @@ static int zynqmp_pm_request_wakeup(const u32 node,
 }
 
 /**
+ * zynqmp_pm_get_node_status - PM call to request a node's current power state
+ * @node:		ID of the component or sub-system in question
+ * @status:		Current operating state of the requested node
+ * @requirements:	Current requirements asserted on the node,
+ *			used for slave nodes only.
+ * @usage:		Usage information, used for slave nodes only:
+ *			PM_USAGE_NO_MASTER	- No master is currently using
+ *						  the node
+ *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
+ *						  currently using the node
+ *			PM_USAGE_OTHER_MASTER	- Only other masters are
+ *						  currently using the node
+ *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
+ *						  one other master is currently
+ *						  using the node
+ *
+ * Return:		Returns status, either success or error+reason
+ */
+static int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
+				     u32 *const requirements, u32 *const usage)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!status)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_GET_NODE_STATUS, node, 0, 0,
+				  0, ret_payload);
+	if (ret_payload[0] == XST_PM_SUCCESS) {
+		*status = ret_payload[1];
+		if (requirements)
+			*requirements = ret_payload[2];
+		if (usage)
+			*usage = ret_payload[3];
+	}
+
+	return ret;
+}
+
+/**
  * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
  * @node:		Node ID of the slave
  * @capabilities:	Requested capabilities of the slave
@@ -773,6 +814,7 @@ static int zynqmp_pm_aes_engine(const u64 address, u32 *out)
 static const struct zynqmp_eemi_ops eemi_ops = {
 	.get_api_version = zynqmp_pm_get_api_version,
 	.get_chipid = zynqmp_pm_get_chipid,
+	.get_node_status = zynqmp_pm_get_node_status,
 	.query_data = zynqmp_pm_query_data,
 	.clock_enable = zynqmp_pm_clock_enable,
 	.clock_disable = zynqmp_pm_clock_disable,
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 899febc..0ed7e9e 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -62,6 +62,7 @@
 
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_GET_NODE_STATUS = 3,
 	PM_FORCE_POWERDOWN = 8,
 	PM_REQUEST_WAKEUP = 10,
 	PM_REQUEST_NODE = 13,
@@ -317,6 +318,8 @@ struct zynqmp_pm_query_data {
 struct zynqmp_eemi_ops {
 	int (*get_api_version)(u32 *version);
 	int (*get_chipid)(u32 *idcode, u32 *version);
+	int (*get_node_status)(const u32 node, u32 *const status,
+			       u32 *const requirements, u32 *const usage);
 	int (*fpga_load)(const u64 address, const u32 size, const u32 flags);
 	int (*fpga_get_status)(u32 *value);
 	int (*query_data)(struct zynqmp_pm_query_data qdata, u32 *out);
-- 
2.7.4
