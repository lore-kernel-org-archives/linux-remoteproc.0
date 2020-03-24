Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 4/7] remoteproc/k3-r5: Add TI-SCI processor control helper functions
Date: Tue, 24 Mar 2020 15:18:16 -0500
Message-ID: <20200324201819.23095-5-s-anna@ti.com>
In-Reply-To: <20200324201819.23095-1-s-anna@ti.com>
References: <20200324201819.23095-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Texas Instruments' K3 generation SoCs have specific modules/register
spaces used for configuring the various aspects of a remote processor.
These include power, reset, boot vector and other configuration features
specific to each compute processor present on the SoC. These registers
are managed by the System Controller such as DMSC on K3 AM65x SoCs.

The Texas Instrument's System Control Interface (TI-SCI) Message Protocol
is used to communicate to the System Controller from various compute
processors to invoke specific services provided by the firmware running
on the System Controller.

Add a common processor control interface header file that can be used by
multiple remoteproc drivers. The helper functions within this header file
abstract the various TI SCI protocol ops for the remoteproc drivers, and
allow them to request the System Controller to be able to program and
manage various remote processors on the SoC. The remoteproc drivers are
expected to manage the life-cycle of their ti_sci_proc_dev local
structures.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/ti_sci_proc.h | 102 +++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 drivers/remoteproc/ti_sci_proc.h

diff --git a/drivers/remoteproc/ti_sci_proc.h b/drivers/remoteproc/ti_sci_proc.h
new file mode 100644
index 000000000000..e42d8015b8e7
--- /dev/null
+++ b/drivers/remoteproc/ti_sci_proc.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Texas Instruments TI-SCI Processor Controller Helper Functions
+ *
+ * Copyright (C) 2018-2020 Texas Instruments Incorporated - http://www.ti.com/
+ *	Suman Anna
+ */
+
+#ifndef REMOTEPROC_TI_SCI_PROC_H
+#define REMOTEPROC_TI_SCI_PROC_H
+
+/**
+ * struct ti_sci_proc - structure representing a processor control client
+ * @sci: cached TI-SCI protocol handle
+ * @ops: cached TI-SCI proc ops
+ * @dev: cached client device pointer
+ * @proc_id: processor id for the consumer remoteproc device
+ * @host_id: host id to pass the control over for this consumer remoteproc
+ *	     device
+ */
+struct ti_sci_proc {
+	const struct ti_sci_handle *sci;
+	const struct ti_sci_proc_ops *ops;
+	struct device *dev;
+	u8 proc_id;
+	u8 host_id;
+};
+
+static inline int ti_sci_proc_request(struct ti_sci_proc *tsp)
+{
+	int ret;
+
+	ret = tsp->ops->request(tsp->sci, tsp->proc_id);
+	if (ret)
+		dev_err(tsp->dev, "ti-sci processor request failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_proc_release(struct ti_sci_proc *tsp)
+{
+	int ret;
+
+	ret = tsp->ops->release(tsp->sci, tsp->proc_id);
+	if (ret)
+		dev_err(tsp->dev, "ti-sci processor release failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_proc_handover(struct ti_sci_proc *tsp)
+{
+	int ret;
+
+	ret = tsp->ops->handover(tsp->sci, tsp->proc_id, tsp->host_id);
+	if (ret)
+		dev_err(tsp->dev, "ti-sci processor handover of %d to %d failed: %d\n",
+			tsp->proc_id, tsp->host_id, ret);
+	return ret;
+}
+
+static inline int ti_sci_proc_set_config(struct ti_sci_proc *tsp,
+					 u64 boot_vector,
+					 u32 cfg_set, u32 cfg_clr)
+{
+	int ret;
+
+	ret = tsp->ops->set_config(tsp->sci, tsp->proc_id, boot_vector,
+				   cfg_set, cfg_clr);
+	if (ret)
+		dev_err(tsp->dev, "ti-sci processor set_config failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_proc_set_control(struct ti_sci_proc *tsp,
+					  u32 ctrl_set, u32 ctrl_clr)
+{
+	int ret;
+
+	ret = tsp->ops->set_control(tsp->sci, tsp->proc_id, ctrl_set, ctrl_clr);
+	if (ret)
+		dev_err(tsp->dev, "ti-sci processor set_control failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_proc_get_status(struct ti_sci_proc *tsp,
+					 u64 *boot_vector, u32 *cfg_flags,
+					 u32 *ctrl_flags, u32 *status_flags)
+{
+	int ret;
+
+	ret = tsp->ops->get_status(tsp->sci, tsp->proc_id, boot_vector,
+				   cfg_flags, ctrl_flags, status_flags);
+	if (ret)
+		dev_err(tsp->dev, "ti-sci processor get_status failed: %d\n",
+			ret);
+	return ret;
+}
+
+#endif /* REMOTEPROC_TI_SCI_PROC_H */
-- 
2.23.0
