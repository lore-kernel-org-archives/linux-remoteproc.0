Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 8/9] remoteproc: imx_rproc: support i.MX7ULP
Date: Wed, 19 Feb 2020 15:27:44 +0800
Message-Id: <1582097265-20170-9-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

To i.MX7ULP, M4 is booted before Linux and it's in charge of
the whole system. So M4 is surely have early_boot set.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 003f9e5c2b0c..fc2a504bc350 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -56,6 +56,7 @@
 enum imx_rproc_variants {
 	IMX8QM,
 	IMX8QXP,
+	IMX7ULP,
 	IMX7D,
 	IMX6SX,
 };
@@ -181,6 +182,10 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
+	.variant	= IMX7ULP,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
 	.variant	= IMX8QXP,
 };
@@ -529,7 +534,9 @@ static int imx_rproc_configure_mode(struct imx_rproc *priv)
 	int ret;
 	u32 val;
 
-	if (of_get_property(dev->of_node, "early-booted", NULL)) {
+	if (dcfg->variant == IMX7ULP) {
+		priv->early_boot = true;
+	} else if (of_get_property(dev->of_node, "early-booted", NULL)) {
 		priv->early_boot = true;
 	} else {
 		ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
@@ -638,7 +645,14 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	struct regmap *regmap = NULL;
 	int ret;
 
-	if (!of_get_property(np, "early-booted", NULL)) {
+	dcfg = of_device_get_match_data(dev);
+	if (!dcfg) {
+		ret = -EINVAL;
+		return ret;
+	}
+
+	if (!of_get_property(np, "early-booted", NULL) &&
+	    !(dcfg->variant == IMX7ULP)) {
 		regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "failed to find syscon\n");
@@ -653,12 +667,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (!rproc)
 		return -ENOMEM;
 
-	dcfg = of_device_get_match_data(dev);
-	if (!dcfg) {
-		ret = -EINVAL;
-		goto err_put_rproc;
-	}
-
 	priv = rproc->priv;
 	priv->rproc = rproc;
 	priv->regmap = regmap;
@@ -775,6 +783,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx_rproc_of_match[] = {
+	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8qxp-cm4", .data = &imx_rproc_cfg_imx8qxp },
-- 
2.16.4
