Return-Path: <BLEVINSK@xilinx.com>
Return-Path: ben.levinsky@xilinx.com
From: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH v2 2/5] firmware: xilinx: Add shutdown/wakeup APIs
Date: Thu, 16 Apr 2020 14:54:39 -0700
Message-Id: <1587074082-14836-3-git-send-email-ben.levinsky@xilinx.com>
In-Reply-To: <1587074082-14836-1-git-send-email-ben.levinsky@xilinx.com>
References: <1587074082-14836-1-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add shutdown/wakeup a resource eemi operations to shutdown
or bringup a resource.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 35 +++++++++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  8 ++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7978065..0a545a2 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -694,6 +694,39 @@ static int zynqmp_pm_release_node(const u32 node)
 }
 
 /**
+ * zynqmp_pm_force_powerdown - PM call to request for another PU or subsystem to
+ *             be powered down forcefully
+ * @target:    Node ID of the targeted PU or subsystem
+ * @ack:   Flag to specify whether acknowledge is requested
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_force_powerdown(const u32 target,
+				   const enum zynqmp_pm_request_ack ack)
+{
+	return zynqmp_pm_invoke_fn(PM_FORCE_POWERDOWN, target, ack, 0, 0, NULL);
+}
+
+/**
+ * zynqmp_pm_request_wakeup - PM call to wake up selected master or subsystem
+ * @node:  Node ID of the master or subsystem
+ * @set_addr:  Specifies whether the address argument is relevant
+ * @address:   Address from which to resume when woken up
+ * @ack:   Flag to specify whether acknowledge requested
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_request_wakeup(const u32 node,
+				   const bool set_addr,
+				   const u64 address,
+				   const enum zynqmp_pm_request_ack ack)
+{
+	/* set_addr flag is encoded into 1st bit of address */
+	return zynqmp_pm_invoke_fn(PM_REQUEST_WAKEUP, node, address | set_addr,
+					address >> 32, ack, NULL);
+}
+
+/**
  * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
  * @node:		Node ID of the slave
  * @capabilities:	Requested capabilities of the slave
@@ -750,9 +783,11 @@ static const struct zynqmp_eemi_ops eemi_ops = {
 	.clock_getrate = zynqmp_pm_clock_getrate,
 	.clock_setparent = zynqmp_pm_clock_setparent,
 	.clock_getparent = zynqmp_pm_clock_getparent,
+	.force_powerdown = zynqmp_pm_force_powerdown,
 	.ioctl = zynqmp_pm_ioctl,
 	.reset_assert = zynqmp_pm_reset_assert,
 	.reset_get_status = zynqmp_pm_reset_get_status,
+	.request_wakeup = zynqmp_pm_request_wakeup,
 	.init_finalize = zynqmp_pm_init_finalize,
 	.set_suspend_mode = zynqmp_pm_set_suspend_mode,
 	.request_node = zynqmp_pm_request_node,
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index ddc996de..899febc 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -62,6 +62,8 @@
 
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_FORCE_POWERDOWN = 8,
+	PM_REQUEST_WAKEUP = 10,
 	PM_REQUEST_NODE = 13,
 	PM_RELEASE_NODE,
 	PM_SET_REQUIREMENT,
@@ -338,6 +340,12 @@ struct zynqmp_eemi_ops {
 			    const u32 qos,
 			    const enum zynqmp_pm_request_ack ack);
 	int (*release_node)(const u32 node);
+	int (*force_powerdown)(const u32 target,
+				const enum zynqmp_pm_request_ack ack);
+	int (*request_wakeup)(const u32 node,
+				const bool set_addr,
+				const u64 address,
+				const enum zynqmp_pm_request_ack ack);
 	int (*set_requirement)(const u32 node,
 			       const u32 capabilities,
 			       const u32 qos,
-- 
2.7.4
