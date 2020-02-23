Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 4/9] remoteproc: imx_rproc: surport early booted remote
 processor
Date: Sun, 23 Feb 2020 00:05:37 +0000
Message-ID: 
 <AM0PR04MB4481F6CFED06D319E312622588EF0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-5-git-send-email-peng.fan@nxp.com>
 <20200221211646.GB10368@xps15>
In-Reply-To: <20200221211646.GB10368@xps15>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

> Subject: Re: [PATCH 4/9] remoteproc: imx_rproc: surport early booted remo=
te
> processor
>=20
> On Wed, Feb 19, 2020 at 03:27:40PM +0800, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > When remote processor is booted by bootloader, Linux need to ignore
> > firmware loading, and ignore remote processor start/stop related
> > hardware operations. what should do is to need to handle
> > memory-regions and resource table.
> >
> > Add a src_started entry to check whether Cortex-M4 is started for
> > i.MX7D and i.MX6SX.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 240
> > +++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 220 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index 3e72b6f38d4b..b9fabe269fd2
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -74,6 +74,7 @@ struct imx_rproc_dcfg {
> >  	u32				src_mask;
> >  	u32				src_start;
> >  	u32				src_stop;
> > +	u32				src_started;
> >  	const struct imx_rproc_att	*att;
> >  	size_t				att_size;
> >  };
> > @@ -85,6 +86,7 @@ struct imx_rproc {
> >  	const struct imx_rproc_dcfg	*dcfg;
> >  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
> >  	struct clk			*clk;
> > +	bool				early_boot;
> >  };
> >
> >  static const struct imx_rproc_att imx_rproc_att_imx7d[] =3D { @@ -142,=
6
> > +144,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d =3D {
> >  	.src_mask	=3D IMX7D_M4_RST_MASK,
> >  	.src_start	=3D IMX7D_M4_START,
> >  	.src_stop	=3D IMX7D_M4_STOP,
> > +	.src_started	=3D IMX7D_ENABLE_M4,
> >  	.att		=3D imx_rproc_att_imx7d,
> >  	.att_size	=3D ARRAY_SIZE(imx_rproc_att_imx7d),
> >  };
> > @@ -151,6 +154,7 @@ static const struct imx_rproc_dcfg
> imx_rproc_cfg_imx6sx =3D {
> >  	.src_mask	=3D IMX6SX_M4_RST_MASK,
> >  	.src_start	=3D IMX6SX_M4_START,
> >  	.src_stop	=3D IMX6SX_M4_STOP,
> > +	.src_started	=3D IMX6SX_ENABLE_M4,
> >  	.att		=3D imx_rproc_att_imx6sx,
> >  	.att_size	=3D ARRAY_SIZE(imx_rproc_att_imx6sx),
> >  };
> > @@ -162,6 +166,9 @@ static int imx_rproc_start(struct rproc *rproc)
> >  	struct device *dev =3D priv->dev;
> >  	int ret;
> >
> > +	if (priv->early_boot)
> > +		return 0;
> > +
> >  	ret =3D regmap_update_bits(priv->regmap, dcfg->src_reg,
> >  				 dcfg->src_mask, dcfg->src_start);
> >  	if (ret)
> > @@ -177,6 +184,9 @@ static int imx_rproc_stop(struct rproc *rproc)
> >  	struct device *dev =3D priv->dev;
> >  	int ret;
> >
> > +	if (priv->early_boot)
> > +		return 0;
> > +
> >  	ret =3D regmap_update_bits(priv->regmap, dcfg->src_reg,
> >  				 dcfg->src_mask, dcfg->src_stop);
> >  	if (ret)
> > @@ -240,10 +250,167 @@ static void *imx_rproc_da_to_va(struct rproc
> *rproc, u64 da, int len)
> >  	return va;
> >  }
> >
> > +static int imx_rproc_elf_load_segments(struct rproc *rproc,
> > +				       const struct firmware *fw) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +
> > +	if (!priv->early_boot)
> > +		return rproc_elf_load_segments(rproc, fw);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_rproc_mem_alloc(struct rproc *rproc,
> > +			       struct rproc_mem_entry *mem) {
> > +	struct device *dev =3D rproc->dev.parent;
> > +	void *va;
> > +
> > +	dev_dbg(dev, "map memory: %p+%x\n", &mem->dma, mem->len);
> > +	va =3D ioremap_wc(mem->dma, mem->len);
> > +	if (IS_ERR_OR_NULL(va)) {
> > +		dev_err(dev, "Unable to map memory region: %p+%x\n",
> > +			&mem->dma, mem->len);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* Update memory entry va */
> > +	mem->va =3D va;
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_rproc_mem_release(struct rproc *rproc,
> > +				 struct rproc_mem_entry *mem)
> > +{
> > +	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> > +	iounmap(mem->va);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_rproc_parse_fw(struct rproc *rproc, const struct
> > +firmware *fw) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +	struct resource_table *resource_table;
> > +	struct device_node *np =3D priv->dev->of_node;
> > +	struct of_phandle_iterator it;
> > +	struct rproc_mem_entry *mem;
> > +	struct reserved_mem *rmem;
> > +	int index =3D 0;
> > +	int elems;
> > +	int ret;
> > +	u64 da;
> > +
> > +	if (!priv->early_boot)
> > +		return rproc_elf_load_rsc_table(rproc, fw);
>=20
> Once again I will concentrate on the scenario rather than making comments
> on the code.
>=20
> If I understand correctly if the AP is responsible for loading the firmwa=
re and
> starting the MCU, the ELF image contains a resource table that describes =
all
> the memory areas and vdev needed.

This is just make sure the original code to support i.MX6SX/i.MX7D work
which added by Pengutronix.

>=20
> Otherwise the MCU firmware that is preloaded by the boot loader or the SC=
U

NXP released firmware will be preloaded and booted by bootloader or SCU
in different SoCs depends on hardware design.

> does _not_ have a resource table and as such specifics need to be coming
> from the DT.
>=20
> Is my assesment correct?

Yes. Correct.

Regards,
Peng.

>=20
> > +
> > +	/* Register associated reserved memory regions */
> > +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > +	while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > +		rmem =3D of_reserved_mem_lookup(it.node);
> > +		if (!rmem) {
> > +			dev_err(priv->dev, "unable to acquire memory-region\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		/* No need to translate pa to da */
> > +		da =3D rmem->base;
> > +
> > +		if (strcmp(it.node->name, "vdev0buffer")) {
> > +			/* Register memory region */
> > +			mem =3D rproc_mem_entry_init(priv->dev, NULL,
> > +						   (dma_addr_t)rmem->base,
> > +						   rmem->size, da,
> > +						   imx_rproc_mem_alloc,
> > +						   imx_rproc_mem_release,
> > +						   it.node->name);
> > +
> > +			if (mem)
> > +				rproc_coredump_add_segment(rproc, da,
> > +							   rmem->size);
> > +		} else {
> > +			/* Register reserved memory for vdev buffer alloc */
> > +			mem =3D rproc_of_resm_mem_entry_init(priv->dev, index,
> > +							   rmem->size,
> > +							   rmem->base,
> > +							   it.node->name);
> > +		}
> > +
> > +		if (!mem)
> > +			return -ENOMEM;
> > +
> > +		rproc_add_carveout(rproc, mem);
> > +		index++;
> > +	}
> > +
> > +	/*Parse device tree to get resource table */
> > +	elems =3D of_property_count_u32_elems(np, "rsrc-table");
> > +	if (elems < 0) {
> > +		dev_err(&rproc->dev, "no rsrc-table\n");
> > +		return elems;
> > +	}
> > +
> > +	resource_table =3D kzalloc(elems * sizeof(u32), GFP_KERNEL);
> > +	if (!resource_table)
> > +		return PTR_ERR(resource_table);
> > +
> > +	ret =3D of_property_read_u32_array(np, "rsrc-table",
> > +					 (u32 *)resource_table, elems);
> > +	if (ret)
> > +		return ret;
> > +
> > +	rproc->cached_table =3D resource_table;
> > +	rproc->table_ptr =3D resource_table;
> > +	rproc->table_sz =3D elems * sizeof(u32);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct resource_table *
> > +imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> > +				    const struct firmware *fw)
> > +{
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +
> > +	if (!priv->early_boot)
> > +		return rproc_elf_find_loaded_rsc_table(rproc, fw);
> > +
> > +	return NULL;
> > +}
> > +
> > +static int imx_rproc_elf_sanity_check(struct rproc *rproc,
> > +				      const struct firmware *fw)
> > +{
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +
> > +	if (!priv->early_boot)
> > +		return rproc_elf_sanity_check(rproc, fw);
> > +
> > +	return 0;
> > +}
> > +
> > +static u32 imx_rproc_elf_get_boot_addr(struct rproc *rproc,
> > +				       const struct firmware *fw) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +
> > +	if (!priv->early_boot)
> > +		return rproc_elf_get_boot_addr(rproc, fw);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct rproc_ops imx_rproc_ops =3D {
> >  	.start		=3D imx_rproc_start,
> >  	.stop		=3D imx_rproc_stop,
> >  	.da_to_va       =3D imx_rproc_da_to_va,
> > +	.load		=3D imx_rproc_elf_load_segments,
> > +	.parse_fw	=3D imx_rproc_parse_fw,
> > +	.find_loaded_rsc_table =3D imx_rproc_elf_find_loaded_rsc_table,
> > +	.sanity_check	=3D imx_rproc_elf_sanity_check,
> > +	.get_boot_addr	=3D imx_rproc_elf_get_boot_addr,
> >  };
> >
> >  static int imx_rproc_addr_init(struct imx_rproc *priv, @@ -309,6
> > +476,31 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
> >  	return 0;
> >  }
> >
> > +static int imx_rproc_configure_mode(struct imx_rproc *priv) {
> > +	const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> > +	struct device *dev =3D priv->dev;
> > +	int ret;
> > +	u32 val;
> > +
> > +	if (of_get_property(dev->of_node, "early-booted", NULL)) {
> > +		priv->early_boot =3D true;
> > +	} else {
> > +		ret =3D regmap_read(priv->regmap, dcfg->src_reg, &val);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to read src\n");
> > +			return ret;
> > +		}
> > +
> > +		priv->early_boot =3D !!(val & dcfg->src_started);
> > +	}
> > +
> > +	if (priv->early_boot)
> > +		priv->rproc->skip_fw_load =3D true;
> > +
> > +	return 0;
> > +}
> > +
> >  static int imx_rproc_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -347,27 +539,33 @@ static int imx_rproc_probe(struct
> > platform_device *pdev)
> >
> >  	dev_set_drvdata(dev, rproc);
> >
> > -	ret =3D imx_rproc_addr_init(priv, pdev);
> > -	if (ret) {
> > -		dev_err(dev, "failed on imx_rproc_addr_init\n");
> > +	ret =3D imx_rproc_configure_mode(priv);
> > +	if (ret)
> >  		goto err_put_rproc;
> > -	}
> >
> > -	priv->clk =3D devm_clk_get(dev, NULL);
> > -	if (IS_ERR(priv->clk)) {
> > -		dev_err(dev, "Failed to get clock\n");
> > -		ret =3D PTR_ERR(priv->clk);
> > -		goto err_put_rproc;
> > -	}
> > +	if (!priv->early_boot) {
> > +		ret =3D imx_rproc_addr_init(priv, pdev);
> > +		if (ret) {
> > +			dev_err(dev, "failed on imx_rproc_addr_init\n");
> > +			goto err_put_rproc;
> > +		}
> >
> > -	/*
> > -	 * clk for M4 block including memory. Should be
> > -	 * enabled before .start for FW transfer.
> > -	 */
> > -	ret =3D clk_prepare_enable(priv->clk);
> > -	if (ret) {
> > -		dev_err(&rproc->dev, "Failed to enable clock\n");
> > -		goto err_put_rproc;
> > +		priv->clk =3D devm_clk_get(dev, NULL);
> > +		if (IS_ERR(priv->clk)) {
> > +			dev_err(dev, "Failed to get clock\n");
> > +			ret =3D PTR_ERR(priv->clk);
> > +			goto err_put_rproc;
> > +		}
> > +
> > +		/*
> > +		 * clk for M4 block including memory. Should be
> > +		 * enabled before .start for FW transfer.
> > +		 */
> > +		ret =3D clk_prepare_enable(priv->clk);
> > +		if (ret) {
> > +			dev_err(&rproc->dev, "Failed to enable clock\n");
> > +			goto err_put_rproc;
> > +		}
> >  	}
> >
> >  	ret =3D rproc_add(rproc);
> > @@ -379,7 +577,8 @@ static int imx_rproc_probe(struct platform_device
> *pdev)
> >  	return 0;
> >
> >  err_put_clk:
> > -	clk_disable_unprepare(priv->clk);
> > +	if (!priv->early_boot)
> > +		clk_disable_unprepare(priv->clk);
> >  err_put_rproc:
> >  	rproc_free(rproc);
> >
> > @@ -391,7 +590,8 @@ static int imx_rproc_remove(struct platform_device
> *pdev)
> >  	struct rproc *rproc =3D platform_get_drvdata(pdev);
> >  	struct imx_rproc *priv =3D rproc->priv;
> >
> > -	clk_disable_unprepare(priv->clk);
> > +	if (!priv->early_boot)
> > +		clk_disable_unprepare(priv->clk);
> >  	rproc_del(rproc);
> >  	rproc_free(rproc);
> >
> > --
> > 2.16.4
> >
