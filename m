Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 7/9] remoteproc: imx_rproc: add i.MX8QM/QXP
Date: Wed, 19 Feb 2020 15:27:43 +0800
Message-Id: <1582097265-20170-8-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

i.MX8QM and i.MX8QXP support hardware partition feature, the M4
could be controlled by System Control Unit(SCU). The M4 is out
of control of Linux with hardware partition used which is the normal
case for production in automotive space.

When M4 reboot, SCU will issue interrupt to Linux side, and Linux side
will recovery the connection. To use related functions, guard code
with CONFIG_IMX_SCU which is enabled for all i.MX SoCs with SCU inside.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 84 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 36dec1ce4f50..003f9e5c2b0c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1,10 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+ * Copyright 2020 NXP, Peng Fan <peng.fan@nxp.com>
  */
 
 #include <linux/clk.h>
 #include <linux/err.h>
+#ifdef CONFIG_IMX_SCU
+#include <linux/firmware/imx/sci.h>
+#endif
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -49,6 +53,13 @@
 
 #define IMX7D_RPROC_MEM_MAX		8
 
+enum imx_rproc_variants {
+	IMX8QM,
+	IMX8QXP,
+	IMX7D,
+	IMX6SX,
+};
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -81,6 +92,7 @@ struct imx_rproc_dcfg {
 	u32				src_started;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
+	enum imx_rproc_variants		variant;
 };
 
 struct imx_rproc {
@@ -95,6 +107,8 @@ struct imx_rproc {
 	struct mbox_chan		*tx_ch;
 	struct mbox_chan		*rx_ch;
 	struct delayed_work		rproc_work;
+	u32				mub_partition;
+	struct notifier_block		proc_nb;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
@@ -167,6 +181,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
+	.variant	= IMX8QXP,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
+	.variant	= IMX8QM,
+};
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -507,9 +529,7 @@ static int imx_rproc_configure_mode(struct imx_rproc *priv)
 	int ret;
 	u32 val;
 
-	if (dcfg->variants == IMX7ULP) {
-		priv->early_boot = true;
-	} else if (of_get_property(dev->of_node, "early-booted", NULL)) {
+	if (of_get_property(dev->of_node, "early-booted", NULL)) {
 		priv->early_boot = true;
 	} else {
 		ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
@@ -588,6 +608,25 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
 	return ret;
 }
 
+#ifdef CONFIG_IMX_SCU
+static int imx_rproc_partition_notify(struct notifier_block *nb,
+				      unsigned long event, void *group)
+{
+	struct imx_rproc *priv = container_of(nb, struct imx_rproc, proc_nb);
+
+	/* Ignore other irqs */
+	if (!((event & BIT(priv->mub_partition)) &&
+	    (*(u8 *)group == 5)))
+		return 0;
+
+	rproc_report_crash(priv->rproc, RPROC_WATCHDOG);
+
+	pr_info("Patition%d reset!\n", priv->mub_partition);
+
+	return 0;
+}
+#endif
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -665,15 +704,50 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&(priv->rproc_work), imx_rproc_vq_work);
 
+#ifdef CONFIG_IMX_SCU
+	priv->proc_nb.notifier_call = imx_rproc_partition_notify;
+
+	if (dcfg->variant == IMX8QXP || dcfg->variant == IMX8QM) {
+		/*
+		 * Get muB partition id and enable irq in SCFW
+		 * default partition 3
+		 */
+		if (of_property_read_u32(np, "mub-partition",
+					 &priv->mub_partition))
+			priv->mub_partition = 3;
+
+		ret = imx_scu_irq_group_enable(5, BIT(priv->mub_partition),
+					       true);
+		if (ret) {
+			dev_warn(dev, "Enable irq failed.\n");
+			goto err_put_clk;
+		}
+
+		ret = imx_scu_irq_register_notifier(&priv->proc_nb);
+		if (ret) {
+			imx_scu_irq_group_enable(5, BIT(priv->mub_partition),
+						 false);
+			dev_warn(dev, "reqister scu notifier failed.\n");
+			goto err_put_clk;
+		}
+
+		priv->rproc->skip_fw_load_recovery = true;
+	}
+#endif
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-		goto err_put_clk;
+		goto err_put_scu;
 	}
 
 	return 0;
 
+err_put_scu:
+#ifdef CONFIG_IMX_SCU
+	imx_scu_irq_group_enable(5, BIT(priv->mub_partition), false);
 err_put_clk:
+#endif
 	if (!priv->early_boot)
 		clk_disable_unprepare(priv->clk);
 err_put_mbox:
@@ -703,6 +777,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
+	{ .compatible = "fsl,imx8qxp-cm4", .data = &imx_rproc_cfg_imx8qxp },
+	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.16.4
