Return-Path: <ore@pengutronix.de>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 2/2] remoteproc: imx_rproc: assign other DT nodes to rproc node
Date: Fri, 15 Jun 2018 13:57:31 +0200
Message-Id: <20180615115731.18424-2-o.rempel@pengutronix.de>
In-Reply-To: <20180615115731.18424-1-o.rempel@pengutronix.de>
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

At least on i.MX* most of devices are available to all CPUs.
In this case the master system should know early enough how system
should be split and preconfigured.

For example if we start Linux on other part of the system, we will need
properly configured clocks for some predefined rates. Pin, reset and
power state should be controlled by master system as well.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/remoteproc/imx_rproc.c | 160 +++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 45acc2ce930d..1999e50f5d4c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -47,6 +47,8 @@
 					 | IMX6SX_SW_M4C_RST)
 
 #define IMX7D_RPROC_MEM_MAX		8
+#define IMX7D_RPROC_RNODES_MAX		8
+#define IMX7D_RPROC_RNODE_CLKS_MAX	8
 
 /**
  * struct imx_rproc_mem - slim internal memory structure
@@ -81,6 +83,12 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 };
 
+struct imx_rproc_rnode {
+	struct device_node		*node;
+	struct clk			*clk[IMX7D_RPROC_RNODE_CLKS_MAX];
+	unsigned int			clks;
+};
+
 struct imx_rproc {
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -88,6 +96,8 @@ struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
 	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
 	struct clk			*clk;
+	struct imx_rproc_rnode		rnode[IMX7D_RPROC_RNODES_MAX];
+	unsigned int			rnodes;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
@@ -250,6 +260,142 @@ static const struct rproc_ops imx_rproc_ops = {
 	.da_to_va       = imx_rproc_da_to_va,
 };
 
+static int imx_rproc_set_clk_rates(struct device_node *node, bool clk_supplier)
+{
+	struct of_phandle_args clkspec;
+	struct property	*prop;
+	const __be32 *cur;
+	int rc, index = 0;
+	struct clk *clk;
+	u32 rate;
+
+	of_property_for_each_u32(node, "assigned-clock-rates", prop, cur, rate) {
+		if (rate) {
+			rc = of_parse_phandle_with_args(node, "clocks",
+					"#clock-cells",	index, &clkspec);
+			if (rc < 0) {
+				/* skip empty (null) phandles */
+				if (rc == -ENOENT)
+					continue;
+				else
+					return rc;
+			}
+			if (clkspec.np == node && !clk_supplier)
+				return 0;
+
+			clk = of_clk_get_from_provider(&clkspec);
+			if (IS_ERR(clk)) {
+				if (PTR_ERR(clk) != -EPROBE_DEFER)
+					pr_warn("clk: couldn't get clock %d for %s\n",
+						index, node->full_name);
+				return PTR_ERR(clk);
+			}
+
+			rc = clk_set_rate(clk, rate);
+			if (rc < 0)
+				pr_err("clk: couldn't set  clk rate to %u (%d), current rate: %lu\n",
+					rate, rc,
+				       clk_get_rate(clk));
+			clk_put(clk);
+		}
+		index++;
+	}
+	return 0;
+}
+
+static int imx_rproc_set_rclks(struct imx_rproc *priv, struct imx_rproc_rnode *rn)
+{
+	struct device_node *node = rn->node;
+	struct device *dev = priv->dev;
+	struct of_phandle_args clkspec;
+	int index, rc, ret, num_parents;
+	struct clk *clk;
+
+	imx_rproc_set_clk_rates(node, 0);
+	num_parents = of_count_phandle_with_args(node, "clocks", "#clock-cells");
+	if (num_parents == -EINVAL) {
+		dev_err(dev, "clk: invalid value of clocks property at %s\n",
+		       node->full_name);
+		return -EINVAL;
+	}
+
+	if (IMX7D_RPROC_RNODE_CLKS_MAX < num_parents) {
+		dev_err(dev, "unsupported count of remote clocks: %i, max: %i\n",
+			 num_parents, IMX7D_RPROC_RNODE_CLKS_MAX);
+		return -EINVAL;
+	}
+
+	for (index = 0; index < num_parents; index++) {
+		rc = of_parse_phandle_with_args(node, "clocks",
+					"#clock-cells", index, &clkspec);
+		if (rc < 0)
+			goto err;
+
+		if (clkspec.np == node) {
+			rc = 0;
+			goto err;
+		}
+
+		clk = of_clk_get_from_provider(&clkspec);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				dev_warn(dev, "clk: couldn't get assigned clock %d for %s\n",
+					index, node->full_name);
+			rc = PTR_ERR(clk);
+			goto err;
+		}
+
+		rn->clk[index] = clk;
+		rn->clks++;
+		/*
+		 * clk for M4 block including memory. Should be
+		 * enabled before .start for FW transfer.
+		 */
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			dev_err(dev, "Failed to enable clock\n");
+			return ret;
+		}
+	}
+	return 0;
+err:
+	return rc;
+}
+
+static int imx_rproc_rnodes_init(struct imx_rproc *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *node = dev->of_node;
+	int a, err, num_parents;
+
+	num_parents = of_count_phandle_with_args(node, "remote-nodes", NULL);
+	if (num_parents == -EINVAL) {
+		dev_err(dev, "rnote: invalid value of remote-node property at %s\n",
+		       node->full_name);
+		return -EINVAL;
+	}
+
+	if (IMX7D_RPROC_RNODES_MAX < num_parents) {
+		dev_err(dev, "unsupported count of remote node: %i, max: %i\n",
+			 num_parents, IMX7D_RPROC_RNODES_MAX);
+		return -EINVAL;
+	}
+
+	/* remap optional addresses */
+	for (a = 0; a < num_parents; a++) {
+		struct device_node *rn;
+
+		rn = of_parse_phandle(node, "remote-nodes", a);
+		priv->rnode[a].node = rn;
+		priv->rnodes++;
+		err = imx_rproc_set_rclks(priv, &priv->rnode[a]);
+		if (err)
+			break;
+	}
+
+	return err;
+}
+
 static int imx_rproc_addr_init(struct imx_rproc *priv,
 			       struct platform_device *pdev)
 {
@@ -374,6 +520,12 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
+	ret = imx_rproc_rnodes_init(priv);
+	if (ret) {
+		dev_err(dev, "filed on imx_rproc_rnodes_init\n");
+		goto err_put_rproc;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
@@ -394,6 +546,14 @@ static int imx_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
+	int a, b;
+
+	for (a = 0; a < priv->rnodes; a++) {
+		struct imx_rproc_rnode *rn = &priv->rnode[a];
+
+		for (b = 0; b < rn->clks; b++)
+			clk_disable_unprepare(rn->clk[b]);
+	}
 
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
-- 
2.17.1
