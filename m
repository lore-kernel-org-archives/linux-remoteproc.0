Return-Path: <BLEVINSK@xilinx.com>
Return-Path: ben.levinsky@xilinx.com
From: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH v3 3/5] firmware: xilinx: Add RPU configuration APIs
Date: Mon, 20 Apr 2020 15:27:07 -0700
Message-Id: <1587421629-914-4-git-send-email-ben.levinsky@xilinx.com>
In-Reply-To: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
References: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds APIs to provide access and a configuration interface
to the current power state of a sub-system on Zynqmp sub-system.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
changes since v2:
- add xilinx-related platform mgmt fn's instead of wrapping around
	function pointer in xilinx eemi ops struct
---
 drivers/firmware/xilinx/zynqmp.c     | 101 +++++++++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  30 +++++++++++
 2 files changed, 131 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index b0d140f..e0a906e 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -845,6 +845,63 @@ int zynqmp_pm_release_node(const u32 node)
 EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);
 
 /**
+ * zynqmp_pm_get_rpu_mode() - Get RPU mode
+ * @node_id:	Node ID of the device
+ * @arg1:	Argument 1 to requested IOCTL call
+ * @arg2:	Argument 2 to requested IOCTL call
+ * @out:	Returned output value
+ *
+ * Return: Returns RPU mode
+ */
+int zynqmp_pm_get_rpu_mode(u32 node_id,
+			u32 arg1, u32 arg2, u32 *out)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				IOCTL_GET_RPU_OPER_MODE, 0, 0, out);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_mode);
+
+/**
+ * zynqmp_pm_set_rpu_mode() - Set RPU mode
+ * @node_id:	Node ID of the device
+ * @ioctl_id:	ID of the requested IOCTL
+ * @arg2:	Argument 2 to requested IOCTL call
+ * @out:	Returned output value
+ *
+ * This function is used to set RPU mode.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_set_rpu_mode(u32 node_id,
+			u32 arg1, u32 arg2, u32 *out)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				IOCTL_SET_RPU_OPER_MODE, 0, 0, out);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_rpu_mode);
+
+/**
+ * zynqmp_pm_tcm_comb_config - configure TCM
+ * @node_id:	Node ID of the device
+ * @arg1:	Argument 1 to requested IOCTL call
+ * @arg2:	Argument 2 to requested IOCTL call
+ * @out:	Returned output value
+ *
+ * This function is used to set RPU mode.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_set_tcm_config(u32 node_id,
+			u32 arg1, u32 arg2, u32 *out)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				IOCTL_TCM_COMB_CONFIG, 0, 0, out);
+
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
+
+
+/**
  * zynqmp_pm_force_powerdown - PM call to request for another PU or subsystem to
  *             be powered down forcefully
  * @target:    Node ID of the targeted PU or subsystem
@@ -880,6 +937,50 @@ int zynqmp_pm_request_wakeup(const u32 node,
 EXPORT_SYMBOL_GPL(zynqmp_pm_request_wakeup);
 
 /**
+ * zynqmp_pm_get_node_status - PM call to request a node's current power state
+ * @node:      ID of the component or sub-system in question
+ * @status:        Current operating state of the requested node
+ * @requirements:  Current requirements asserted on the node,
+ *         used for slave nodes only.
+ * @usage:     Usage information, used for slave nodes only:
+ *         PM_USAGE_NO_MASTER  - No master is currently using
+ *                       the node
+ *         PM_USAGE_CURRENT_MASTER - Only requesting master is
+ *                       currently using the node
+ *         PM_USAGE_OTHER_MASTER   - Only other masters are
+ *                       currently using the node
+ *         PM_USAGE_BOTH_MASTERS   - Both the current and at least
+ *                       one other master is currently
+ *                       using the node
+ *
+ * Return:     Returns status, either success or error+reason
+ */
+int zynqmp_pm_get_node_status(const u32 node,
+			u32 *status, u32 *requirements,
+			u32 *usage)
+
+{
+   u32 ret_payload[PAYLOAD_ARG_CNT];
+   int ret;
+
+   if (!status)
+       return -EINVAL;
+
+   ret = zynqmp_pm_invoke_fn(PM_GET_NODE_STATUS, node, 0, 0,
+                 0, ret_payload);
+   if (ret_payload[0] == XST_PM_SUCCESS) {
+       *status = ret_payload[1];
+       if (requirements)
+           *requirements = ret_payload[2];
+       if (usage)
+           *usage = ret_payload[3];
+   }
+
+   return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
+
+/**
  * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
  * @node:		Node ID of the slave
  * @capabilities:	Requested capabilities of the slave
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 1235923..c123d1b 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -64,6 +64,7 @@
 
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_GET_NODE_STATUS = 3,
 	PM_FORCE_POWERDOWN = 8,
 	PM_REQUEST_WAKEUP = 10,
 	PM_SYSTEM_SHUTDOWN = 12,
@@ -384,6 +385,14 @@ int zynqmp_pm_request_wakeup(const u32 node,
 			const bool set_addr,
 			const u64 address,
 			const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_get_node_status(const u32 node, u32 *status,
+			u32 *requirements, u32 *usage);
+int zynqmp_pm_get_rpu_mode(u32 node_id,
+            u32 arg1, u32 arg2, u32 *out);
+int zynqmp_pm_set_rpu_mode(u32 node_id,
+            u32 arg1, u32 arg2, u32 *out);
+int zynqmp_pm_set_tcm_config(u32 node_id,
+            u32 arg1, u32 arg2, u32 *out);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -546,6 +555,27 @@ static inline int zynqmp_pm_request_wakeup(const u32 node,
 {
 	return -ENODEV;
 }
+static inline int zynqmp_pm_get_node_status(const u32 node,
+			u32 *status, u32 *requirements,
+			u32 *usage)
+{
+	return -ENODEV;
+}
+static inline int zynqmp_pm_get_rpu_mode(u32 node_id,
+            u32 arg1, u32 arg2, u32 *out)
+{
+	return -ENODEV;
+}
+static inline int zynqmp_pm_set_rpu_mode(u32 node_id,
+            u32 arg1, u32 arg2, u32 *out)
+{
+	return -ENODEV;
+}
+static inline int zynqmp_pm_set_tcm_config(u32 node_id,
+            u32 arg1, u32 arg2, u32 *out)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.7.4
