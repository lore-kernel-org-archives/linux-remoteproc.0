Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/3] remoteproc/k3-dsp: Add support for L2RAM loading on C66x DSPs
Date: Wed, 25 Mar 2020 15:18:39 -0500
Message-ID: <20200325201839.15896-4-s-anna@ti.com>
In-Reply-To: <20200325201839.15896-1-s-anna@ti.com>
References: <20200325201839.15896-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The resets for the DSP processors on K3 SoCs are managed through the
Power and Sleep Controller (PSC) module. Each DSP typically has two
resets - a global module reset for powering on the device, and a local
reset that affects only the CPU while allowing access to the other
sub-modules within the DSP processor sub-systems.

The C66x DSPs have two levels of internal RAMs that can be used to
boot from, and the firmware loading into these RAMs require the
local reset to be asserted with the device powered on/enabled using
the module reset. Enhance the K3 DSP remoteproc driver to add support
for loading into the internal RAMs. The local reset is deasserted on
SoC power-on-reset, so logic has to be added in probe in remoteproc
mode to balance the remoteproc state-machine.

Note that the local resets are a no-op on C71x cores, and the hardware
does not supporting loading into its internal RAMs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 82 +++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index fd0d84f46f90..7b712ef74611 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -175,6 +175,9 @@ static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
 		return ret;
 	}
 
+	if (kproc->data->uses_lreset)
+		return ret;
+
 	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret) {
@@ -192,6 +195,9 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
+	if (kproc->data->uses_lreset)
+		goto lreset;
+
 	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
 						   kproc->ti_sci_id);
 	if (ret) {
@@ -199,6 +205,7 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
 		return ret;
 	}
 
+lreset:
 	ret = reset_control_deassert(kproc->reset);
 	if (ret) {
 		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
@@ -210,6 +217,63 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
 	return ret;
 }
 
+/*
+ * The C66x DSP cores have a local reset that affects only the CPU, and a
+ * generic module reset that powers on the device and allows the DSP internal
+ * memories to be accessed while the local reset is asserted. This function is
+ * used to release the global reset on C66x DSPs to allow loading into the DSP
+ * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
+ * firmware loading, and is followed by the .start() ops after loading to
+ * actually let the C66x DSP cores run. The local reset on C71x cores is a
+ * no-op and the global reset cannot be released on C71x cores until after
+ * the firmware images are loaded, so this function does nothing for C71x cores.
+ */
+static int k3_dsp_rproc_prepare(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	/* local reset is no-op on C71x processors */
+	if (!kproc->data->uses_lreset)
+		return 0;
+
+	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret)
+		dev_err(dev, "module-reset deassert failed, cannot enable internal RAM loading, ret = %d\n",
+			ret);
+
+	return ret;
+}
+
+/*
+ * This function implements the .unprepare() ops and performs the complimentary
+ * operations to that of the .prepare() ops. The function is used to assert the
+ * global reset on applicable C66x cores. This completes the second portion of
+ * powering down the C66x DSP cores. The cores themselves are only halted in the
+ * .stop() callback through the local reset, and the .unprepare() ops is invoked
+ * by the remoteproc core after the remoteproc is stopped to balance the global
+ * reset.
+ */
+static int k3_dsp_rproc_unprepare(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	/* local reset is no-op on C71x processors */
+	if (!kproc->data->uses_lreset)
+		return 0;
+
+	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret)
+		dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
+
+	return ret;
+}
+
 /*
  * Power up the DSP remote processor.
  *
@@ -353,6 +417,8 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
 }
 
 static const struct rproc_ops k3_dsp_rproc_ops = {
+	.prepare	= k3_dsp_rproc_prepare,
+	.unprepare	= k3_dsp_rproc_unprepare,
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_dsp_rproc_stop,
 	.kick		= k3_dsp_rproc_kick,
@@ -644,6 +710,22 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
+	/*
+	 * ensure the DSP local reset is asserted to ensure the DSP doesn't
+	 * execute bogus code in .prepare() when the module reset is released.
+	 */
+	if (data->uses_lreset) {
+		ret = reset_control_status(kproc->reset);
+		if (ret < 0) {
+			dev_err(dev, "failed to get reset status, status = %d\n",
+				ret);
+			goto release_mem;
+		} else if (ret == 0) {
+			dev_warn(dev, "local reset is deasserted for device\n");
+			k3_dsp_rproc_reset(kproc);
+		}
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "failed to add register device with remoteproc core, status = %d\n",
-- 
2.23.0
