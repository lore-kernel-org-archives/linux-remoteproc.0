Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 4/9] remoteproc: imx_rproc: surport early booted remote processor
Date: Wed, 19 Feb 2020 15:27:40 +0800
Message-Id: <1582097265-20170-5-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

When remote processor is booted by bootloader, Linux need to
ignore firmware loading, and ignore remote processor start/stop
related hardware operations. what should do is to need to handle
memory-regions and resource table.

Add a src_started entry to check whether Cortex-M4 is started for i.MX7D
and i.MX6SX.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 240 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 220 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3e72b6f38d4b..b9fabe269fd2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -74,6 +74,7 @@ struct imx_rproc_dcfg {
 	u32				src_mask;
 	u32				src_start;
 	u32				src_stop;
+	u32				src_started;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
 };
@@ -85,6 +86,7 @@ struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
 	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
 	struct clk			*clk;
+	bool				early_boot;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
@@ -142,6 +144,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_mask	= IMX7D_M4_RST_MASK,
 	.src_start	= IMX7D_M4_START,
 	.src_stop	= IMX7D_M4_STOP,
+	.src_started	= IMX7D_ENABLE_M4,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
 };
@@ -151,6 +154,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_mask	= IMX6SX_M4_RST_MASK,
 	.src_start	= IMX6SX_M4_START,
 	.src_stop	= IMX6SX_M4_STOP,
+	.src_started	= IMX6SX_ENABLE_M4,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 };
@@ -162,6 +166,9 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
+	if (priv->early_boot)
+		return 0;
+
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_start);
 	if (ret)
@@ -177,6 +184,9 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
+	if (priv->early_boot)
+		return 0;
+
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_stop);
 	if (ret)
@@ -240,10 +250,167 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 	return va;
 }
 
+static int imx_rproc_elf_load_segments(struct rproc *rproc,
+				       const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	if (!priv->early_boot)
+		return rproc_elf_load_segments(rproc, fw);
+
+	return 0;
+}
+
+static int imx_rproc_mem_alloc(struct rproc *rproc,
+			       struct rproc_mem_entry *mem)
+{
+	struct device *dev = rproc->dev.parent;
+	void *va;
+
+	dev_dbg(dev, "map memory: %p+%x\n", &mem->dma, mem->len);
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va)) {
+		dev_err(dev, "Unable to map memory region: %p+%x\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+
+static int imx_rproc_mem_release(struct rproc *rproc,
+				 struct rproc_mem_entry *mem)
+{
+	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
+	iounmap(mem->va);
+
+	return 0;
+}
+
+static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct resource_table *resource_table;
+	struct device_node *np = priv->dev->of_node;
+	struct of_phandle_iterator it;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+	int index = 0;
+	int elems;
+	int ret;
+	u64 da;
+
+	if (!priv->early_boot)
+		return rproc_elf_load_rsc_table(rproc, fw);
+
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			dev_err(priv->dev, "unable to acquire memory-region\n");
+			return -EINVAL;
+		}
+
+		/* No need to translate pa to da */
+		da = rmem->base;
+
+		if (strcmp(it.node->name, "vdev0buffer")) {
+			/* Register memory region */
+			mem = rproc_mem_entry_init(priv->dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, da,
+						   imx_rproc_mem_alloc,
+						   imx_rproc_mem_release,
+						   it.node->name);
+
+			if (mem)
+				rproc_coredump_add_segment(rproc, da,
+							   rmem->size);
+		} else {
+			/* Register reserved memory for vdev buffer alloc */
+			mem = rproc_of_resm_mem_entry_init(priv->dev, index,
+							   rmem->size,
+							   rmem->base,
+							   it.node->name);
+		}
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+		index++;
+	}
+
+	/*Parse device tree to get resource table */
+	elems = of_property_count_u32_elems(np, "rsrc-table");
+	if (elems < 0) {
+		dev_err(&rproc->dev, "no rsrc-table\n");
+		return elems;
+	}
+
+	resource_table = kzalloc(elems * sizeof(u32), GFP_KERNEL);
+	if (!resource_table)
+		return PTR_ERR(resource_table);
+
+	ret = of_property_read_u32_array(np, "rsrc-table",
+					 (u32 *)resource_table, elems);
+	if (ret)
+		return ret;
+
+	rproc->cached_table = resource_table;
+	rproc->table_ptr = resource_table;
+	rproc->table_sz = elems * sizeof(u32);
+
+	return 0;
+}
+
+static struct resource_table *
+imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
+				    const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	if (!priv->early_boot)
+		return rproc_elf_find_loaded_rsc_table(rproc, fw);
+
+	return NULL;
+}
+
+static int imx_rproc_elf_sanity_check(struct rproc *rproc,
+				      const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	if (!priv->early_boot)
+		return rproc_elf_sanity_check(rproc, fw);
+
+	return 0;
+}
+
+static u32 imx_rproc_elf_get_boot_addr(struct rproc *rproc,
+				       const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	if (!priv->early_boot)
+		return rproc_elf_get_boot_addr(rproc, fw);
+
+	return 0;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
 	.da_to_va       = imx_rproc_da_to_va,
+	.load		= imx_rproc_elf_load_segments,
+	.parse_fw	= imx_rproc_parse_fw,
+	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
+	.sanity_check	= imx_rproc_elf_sanity_check,
+	.get_boot_addr	= imx_rproc_elf_get_boot_addr,
 };
 
 static int imx_rproc_addr_init(struct imx_rproc *priv,
@@ -309,6 +476,31 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	return 0;
 }
 
+static int imx_rproc_configure_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+	u32 val;
+
+	if (of_get_property(dev->of_node, "early-booted", NULL)) {
+		priv->early_boot = true;
+	} else {
+		ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+		if (ret) {
+			dev_err(dev, "Failed to read src\n");
+			return ret;
+		}
+
+		priv->early_boot = !!(val & dcfg->src_started);
+	}
+
+	if (priv->early_boot)
+		priv->rproc->skip_fw_load = true;
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -347,27 +539,33 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, rproc);
 
-	ret = imx_rproc_addr_init(priv, pdev);
-	if (ret) {
-		dev_err(dev, "failed on imx_rproc_addr_init\n");
+	ret = imx_rproc_configure_mode(priv);
+	if (ret)
 		goto err_put_rproc;
-	}
 
-	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		ret = PTR_ERR(priv->clk);
-		goto err_put_rproc;
-	}
+	if (!priv->early_boot) {
+		ret = imx_rproc_addr_init(priv, pdev);
+		if (ret) {
+			dev_err(dev, "failed on imx_rproc_addr_init\n");
+			goto err_put_rproc;
+		}
 
-	/*
-	 * clk for M4 block including memory. Should be
-	 * enabled before .start for FW transfer.
-	 */
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(&rproc->dev, "Failed to enable clock\n");
-		goto err_put_rproc;
+		priv->clk = devm_clk_get(dev, NULL);
+		if (IS_ERR(priv->clk)) {
+			dev_err(dev, "Failed to get clock\n");
+			ret = PTR_ERR(priv->clk);
+			goto err_put_rproc;
+		}
+
+		/*
+		 * clk for M4 block including memory. Should be
+		 * enabled before .start for FW transfer.
+		 */
+		ret = clk_prepare_enable(priv->clk);
+		if (ret) {
+			dev_err(&rproc->dev, "Failed to enable clock\n");
+			goto err_put_rproc;
+		}
 	}
 
 	ret = rproc_add(rproc);
@@ -379,7 +577,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	return 0;
 
 err_put_clk:
-	clk_disable_unprepare(priv->clk);
+	if (!priv->early_boot)
+		clk_disable_unprepare(priv->clk);
 err_put_rproc:
 	rproc_free(rproc);
 
@@ -391,7 +590,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
-	clk_disable_unprepare(priv->clk);
+	if (!priv->early_boot)
+		clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	rproc_free(rproc);
 
-- 
2.16.4
