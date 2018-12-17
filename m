Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-3-govinds@codeaurora.org>
Subject: Re: [PATCH v3 2/7] clk: qcom: Add WCSS Q6DSP clock controller for QCS404
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-3-govinds@codeaurora.org>
Message-ID: <154507272487.19322.760504004108754132@swboyd.mtv.corp.google.com>
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 17 Dec 2018 10:52:04 -0800
To: Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2018-12-15 02:35:52)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 9fe28b9ceba8..84acc7718691 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -222,6 +222,15 @@ config QCS_GCC_404
>           Say Y if you want to use multimedia devices or peripheral
>           devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
> =20
> +config QCS_WCSSCC_404
> +       tristate "QCS404 WCSS Clock Controller"
> +       depends on COMMON_CLK_QCOM

This is going away, so you can drop this depends on statement soon.

> +       select QCS_GCC_404
> +       help
> +         Support for the WCSS clock controller on QCS404 devices.
> +         Say Y if you want to use the WCSS branch clocks of the WCSS clo=
ck
> +         controller to reset the WCSS subsystem.
> +
>  config SDM_GCC_845
>         tristate "SDM845 Global Clock Controller"
>         select QCOM_GDSC
> diff --git a/drivers/clk/qcom/wcsscc-qcs404.c b/drivers/clk/qcom/wcsscc-q=
cs404.c
> new file mode 100644
> index 000000000000..bd694ef1b6ac
> --- /dev/null
> +++ b/drivers/clk/qcom/wcsscc-qcs404.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>

Is this used?

> +#include <linux/clk.h>

Is this used?

> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>

Is this used?

> +
> +#include <dt-bindings/clock/qcom,wcss-qcs404.h>
> +#include <linux/reset-controller.h>

Cool, but where are the resets? Also, please put <linux/*.h> before any
dt-bindings includes.

> +
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +/* Q6SSTOP clocks. These clocks are voted
> + * during by remoteproc client when loaded from

This sentence doesn't parse easily. "during by"?

> + * user space, soc hang is seen when CCF turns

SoC? Or just system hang?

> + * off unused clocks. As a temp solution use

Temporary?

> + * CLK_IGNORE_UNUSED flags which prevent these
> + * clocks from being gated during bootup.

Ok.. but userspace is after CLK_IGNORE_UNUSED would process these clks?
So we're keeping them on from the bootloader why? Something is using
these clks during that operation but after that point they need to be
turned off?

> + */
> +
> +static int wcss_clocks_qcs404_probe(struct platform_device *pdev, int in=
dex,
> +                                   const struct qcom_cc_desc *desc)
> +{
> +       struct regmap *regmap;
> +       struct resource *res;
> +       void __iomem *base;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, index);
> +       base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base))
> +               return -ENOMEM;
> +
> +       regmap =3D devm_regmap_init_mmio(&pdev->dev, base, desc->config);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return qcom_cc_really_probe(pdev, desc, regmap);
> +}

You're the second user of this "probe on reg region" logic. Please
extract it out of the lpasscc driver and put it into common.c so it can
be reused by the two drivers.

> +
> +static int wcss_cc_qcs404_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       int ret;
> +
> +       wcss_regmap_config.name =3D "wcss_q6sstop";
> +       desc =3D &wcss_q6sstop_qcs404_desc;
> +
> +       ret =3D wcss_clocks_qcs404_probe(pdev, 0, desc);
> +       if (ret)
> +               return ret;
> +
> +       wcss_regmap_config.name =3D "wcnss_tcsr";
> +       desc =3D &wcnss_tcsr_qcs404_desc;
> +
> +       ret =3D wcss_clocks_qcs404_probe(pdev, 1, desc);
> +       if (ret)
> +               return ret;
> +
> +       wcss_regmap_config.name =3D "wcss_qdsp6ss";
> +       desc =3D &wcnss_qdsp6ss_qcs404_desc;
> +
> +       return wcss_clocks_qcs404_probe(pdev, 2, desc);
> +}
> +
> +static struct platform_driver wcss_cc_qcs404_driver =3D {
> +       .probe          =3D wcss_cc_qcs404_probe,
> +       .driver         =3D {
> +               .name   =3D "qcs404-wcsscc",
> +               .of_match_table =3D wcss_cc_qcs404_match_table,
> +       },
> +};
> +
> +static int __init wcss_cc_qcs404_init(void)
> +{
> +       return platform_driver_register(&wcss_cc_qcs404_driver);
> +}
> +subsys_initcall(wcss_cc_qcs404_init);

Where is the driver removal exit function?

> +
> +MODULE_LICENSE("GPL v2");

MODULE_DESCRIPTION?
