Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-7-govinds@codeaurora.org>
Subject: Re: [PATCH v3 6/7] remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-7-govinds@codeaurora.org>
Message-ID: <154507322089.19322.12841229714940268825@swboyd.mtv.corp.google.com>
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 17 Dec 2018 11:00:20 -0800
To: Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2018-12-15 02:35:56)
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qco=
m_q6v5_wcss.c
> index 129f82404656..3f66bd8fa407 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -83,12 +105,32 @@ struct q6v5_wcss {
> =20
>         void __iomem *reg_base;
>         void __iomem *rmb_base;
> +       void __iomem *q6stop_base;
> =20
>         struct regmap *halt_map;
>         u32 halt_q6;
>         u32 halt_wcss;
>         u32 halt_nc;
> =20
> +       struct clk *xo;
> +       struct clk *ahbfabric_cbcr_clk;
> +       struct clk *gcc_abhs_cbcr;
> +       struct clk *gcc_axim_cbcr;
> +       struct clk *lcc_csr_cbcr;
> +       struct clk *ahbs_cbcr;
> +       struct clk *tcm_slave_cbcr;
> +       struct clk *qdsp6ss_abhm_cbcr;
> +       struct clk *qdsp6ss_sleep_cbcr;
> +       struct clk *qdsp6ss_axim_cbcr;
> +       struct clk *qdsp6ss_xo_cbcr;
> +       struct clk *qdsp6ss_core_gfmux;
> +       struct clk *wcss_bcr_cbcr;

You should look into clk_bulk_prepare_enable() or just
clk_bulk_get_all() to greatly simplify this patch.

> +       struct regulator *cx_supply;
> +
> +       struct qcom_rproc_glink glink_subdev;
> +       struct qcom_rproc_ssr ssr_subdev;
> +       struct qcom_sysmon *sysmon;
> +
>         struct reset_control *wcss_aon_reset;
>         struct reset_control *wcss_reset;
>         struct reset_control *wcss_q6_reset;
> @@ -99,9 +141,7 @@ struct q6v5_wcss {
>         phys_addr_t mem_reloc;
>         void *mem_region;
>         size_t mem_size;
> -
>         int crash_reason_smem;
> -       int pas_id;
>         int version;
>  };
> =20
> @@ -245,6 +285,197 @@ static int q6v5_wcss_start(struct rproc *rproc)
>         return ret;
>  }
> =20
[...]
> +
> +       /* Assert resets, stop core */
> +       val =3D readl(wcss->reg_base + Q6SS_RESET_REG);
> +       val |=3D Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
> +       writel(val, wcss->reg_base + Q6SS_RESET_REG);
> +
> +       /* Program the QDSP6SS PWR_CTL register */
> +       writel(0x01700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       writel(0x03700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       writel(0x03300000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       writel(0x033C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       /*
> +        * Enable memories by turning on the QDSP6 memory foot/head switc=
h, one
> +        * bank at a time to avoid in-rush current
> +        */
> +       for (idx =3D 28; idx >=3D 0; idx--) {
> +               writel((readl(wcss->reg_base + Q6SS_MEM_PWR_CTL) |
> +                       (1 << idx)), wcss->reg_base + Q6SS_MEM_PWR_CTL);
> +       }

Smells like it should be in a power domain driver, but I guess it gets a
little hard because clks have to be powered on first and in some order.

> +
> +       writel(0x031C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +       writel(0x030C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       val =3D readl(wcss->reg_base + Q6SS_RESET_REG);
> +       val &=3D ~Q6SS_CORE_ARES;
> +       writel(val, wcss->reg_base + Q6SS_RESET_REG);
> +
> +       /* Enable the Q6 core clock at the GFM, Q6SSTOP_QDSP6SS_GFMUX_CTL=
 */
> +       ret =3D clk_prepare_enable(wcss->qdsp6ss_core_gfmux);
> +       if (ret)
> +               goto disable_gcc_axim_cbcr_clk;
> +
> +       /* Enable sleep clock branch needed for BCR circuit */
> +       ret =3D clk_prepare_enable(wcss->wcss_bcr_cbcr);
> +       if (ret)
> +               goto disable_core_gfmux_clk;
> +
> +       return 0;
> @@ -475,35 +781,60 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *w=
css)
>  static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
>                                struct platform_device *pdev)
>  {
> -       struct of_phandle_args args;
> +       unsigned int halt_reg[MAX_HALT_REG] =3D {0};
> +       struct device_node *syscon;
>         struct resource *res;
>         int ret;
> =20
>         res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6=
");
> -       wcss->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +       wcss->reg_base =3D devm_ioremap(&pdev->dev, res->start,
> +                                     resource_size(res));
>         if (IS_ERR(wcss->reg_base))
>                 return PTR_ERR(wcss->reg_base);
> =20
> -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
> -       wcss->rmb_base =3D devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(wcss->rmb_base))
> -               return PTR_ERR(wcss->rmb_base);
> +       if (wcss->version =3D=3D WCSS_QCS404) {
> +               res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                                                  "q6stop");
> +               if (!res) {
> +                       dev_err(&pdev->dev, "invalid q6stop_base resource=
\n");
> +                       return -EINVAL;
> +               }
> +
> +               wcss->q6stop_base =3D devm_ioremap(&pdev->dev, res->start,
> +                                                resource_size(res));

Why can't devm_ioremap_resource() be used here?

> +               if (IS_ERR(wcss->q6stop_base))
> +                       return PTR_ERR(wcss->q6stop_base);
> +       } else {
> +               res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM=
, "rmb");
> +               wcss->rmb_base =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(wcss->rmb_base))
> +                       return PTR_ERR(wcss->rmb_base);
> +       }
> =20
> -       ret =3D of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> -                                              "qcom,halt-regs", 3, 0, &a=
rgs);
> -       if (ret < 0) {
> +       syscon =3D of_parse_phandle(pdev->dev.of_node,
> +                                 "qcom,halt-regs", 0);
> +       if (!syscon) {
>                 dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
>                 return -EINVAL;
>         }
