Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 5/9] remoteproc: imx_rproc: parse early-booted property
Date: Wed, 19 Feb 2020 15:27:41 +0800
Message-Id: <1582097265-20170-6-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

If early-property exists, there is no need to check syscon.
Just mark early_boot as true.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b9fabe269fd2..e31ea1090cf3 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -483,7 +483,9 @@ static int imx_rproc_configure_mode(struct imx_rproc *priv)
 	int ret;
 	u32 val;
 
-	if (of_get_property(dev->of_node, "early-booted", NULL)) {
+	if (dcfg->variants == IMX7ULP) {
+		priv->early_boot = true;
+	} else if (of_get_property(dev->of_node, "early-booted", NULL)) {
 		priv->early_boot = true;
 	} else {
 		ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
@@ -509,15 +511,17 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg;
-	struct regmap *regmap;
+	struct regmap *regmap = NULL;
 	int ret;
 
-	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
+	if (!of_get_property(np, "early-booted", NULL)) {
+		regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
+		if (IS_ERR(regmap)) {
+			dev_err(dev, "failed to find syscon\n");
+			return PTR_ERR(regmap);
+		}
+		regmap_attach_dev(dev, regmap, &config);
 	}
-	regmap_attach_dev(dev, regmap, &config);
 
 	/* set some other name then imx */
 	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
-- 
2.16.4
