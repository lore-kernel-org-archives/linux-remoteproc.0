Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 22 Jun 2018 17:46:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 2/8] reset: qcom: AOSS (always on subsystem) reset
 controller
Message-ID: <20180623004626.GR3402@tuxbook-pro>
References: <20180521172714.8551-1-sibis@codeaurora.org>
 <20180521172714.8551-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521172714.8551-3-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 21 May 10:27 PDT 2018, Sibi Sankar wrote:

> Add reset controller driver for Qualcomm SDM845 SoC to
> control reset signals provided by AOSS for Modem, Venus
> ADSP, GPU, Camera, Wireless, Display subsystem
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

With the adaptions discussed in the DT binding patch (compatible and
register offsets) you have my:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/reset/Kconfig           |   9 +++
>  drivers/reset/Makefile          |   1 +
>  drivers/reset/reset-qcom-aoss.c | 133 ++++++++++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 drivers/reset/reset-qcom-aoss.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index c0b292be1b72..756ad2b27d0f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -82,6 +82,15 @@ config RESET_PISTACHIO
>  	help
>  	  This enables the reset driver for ImgTec Pistachio SoCs.
>  
> +config RESET_QCOM_AOSS
> +	bool "Qcom AOSS Reset Driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	help
> +	  This enables the AOSS (always on subsystem) reset driver
> +	  for Qualcomm SDM845 SoCs. Say Y if you want to control
> +	  reset signals provided by AOSS for Modem, Venus, ADSP,
> +	  GPU, Camera, Wireless, Display subsystem. Otherwise, say N.
> +
>  config RESET_SIMPLE
>  	bool "Simple Reset Controller Driver" if COMPILE_TEST
>  	default ARCH_SOCFPGA || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARCH_ASPEED
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index c1261dcfe9ad..6881e4d287f0 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>  obj-$(CONFIG_RESET_MESON) += reset-meson.o
>  obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
>  obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
> +obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>  obj-$(CONFIG_RESET_STM32MP157) += reset-stm32mp1.o
>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
> diff --git a/drivers/reset/reset-qcom-aoss.c b/drivers/reset/reset-qcom-aoss.c
> new file mode 100644
> index 000000000000..d9ca7339c434
> --- /dev/null
> +++ b/drivers/reset/reset-qcom-aoss.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2018 The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <dt-bindings/reset/qcom,sdm845-aoss.h>
> +
> +struct qcom_aoss_reset_map {
> +	unsigned int reg;
> +};
> +
> +struct qcom_aoss_desc {
> +	const struct qcom_aoss_reset_map *resets;
> +	size_t num_resets;
> +};
> +
> +struct qcom_aoss_reset_data {
> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +	const struct qcom_aoss_desc *desc;
> +};
> +
> +static const struct qcom_aoss_reset_map sdm845_aoss_resets[] = {
> +	[AOSS_CC_MSS_RESTART] = {0x0},
> +	[AOSS_CC_CAMSS_RESTART] = {0x1000},
> +	[AOSS_CC_VENUS_RESTART] = {0x2000},
> +	[AOSS_CC_GPU_RESTART] = {0x3000},
> +	[AOSS_CC_DISPSS_RESTART] = {0x4000},
> +	[AOSS_CC_WCSS_RESTART] = {0x10000},
> +	[AOSS_CC_LPASS_RESTART] = {0x20000},
> +};
> +
> +static const struct qcom_aoss_desc sdm845_aoss_desc = {
> +	.resets = sdm845_aoss_resets,
> +	.num_resets = ARRAY_SIZE(sdm845_aoss_resets),
> +};
> +
> +static inline struct qcom_aoss_reset_data *to_qcom_aoss_reset_data(
> +				struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct qcom_aoss_reset_data, rcdev);
> +}
> +
> +static int qcom_aoss_control_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long idx)
> +{
> +	struct qcom_aoss_reset_data *data = to_qcom_aoss_reset_data(rcdev);
> +	const struct qcom_aoss_reset_map *map = &data->desc->resets[idx];
> +
> +	writel(1, data->base + map->reg);
> +	/* Wait 6 32kHz sleep cycles for reset */
> +	usleep_range(200, 300);
> +	return 0;
> +}
> +
> +static int qcom_aoss_control_deassert(struct reset_controller_dev *rcdev,
> +				      unsigned long idx)
> +{
> +	struct qcom_aoss_reset_data *data = to_qcom_aoss_reset_data(rcdev);
> +	const struct qcom_aoss_reset_map *map = &data->desc->resets[idx];
> +
> +	writel(0, data->base + map->reg);
> +	/* Wait 6 32kHz sleep cycles for reset */
> +	usleep_range(200, 300);
> +	return 0;
> +}
> +
> +static int qcom_aoss_control_reset(struct reset_controller_dev *rcdev,
> +					unsigned long idx)
> +{
> +	qcom_aoss_control_assert(rcdev, idx);
> +
> +	return qcom_aoss_control_deassert(rcdev, idx);
> +}
> +
> +static const struct reset_control_ops qcom_aoss_reset_ops = {
> +	.reset = qcom_aoss_control_reset,
> +	.assert = qcom_aoss_control_assert,
> +	.deassert = qcom_aoss_control_deassert,
> +};
> +
> +static int qcom_aoss_reset_probe(struct platform_device *pdev)
> +{
> +	struct qcom_aoss_reset_data *data;
> +	struct device *dev = &pdev->dev;
> +	const struct qcom_aoss_desc *desc;
> +	struct resource *res;
> +
> +	desc = of_device_get_match_data(dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->desc = desc;
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	data->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(data->base))
> +		return PTR_ERR(data->base);
> +
> +	data->rcdev.owner = THIS_MODULE;
> +	data->rcdev.ops = &qcom_aoss_reset_ops;
> +	data->rcdev.nr_resets = desc->num_resets;
> +	data->rcdev.of_node = dev->of_node;
> +
> +	return devm_reset_controller_register(dev, &data->rcdev);
> +}
> +
> +static const struct of_device_id qcom_aoss_reset_of_match[] = {
> +	{ .compatible = "qcom,sdm845-aoss-reset", .data = &sdm845_aoss_desc },
> +	{}
> +};
> +
> +static struct platform_driver qcom_aoss_reset_driver = {
> +	.probe = qcom_aoss_reset_probe,
> +	.driver  = {
> +		.name = "qcom_aoss_reset",
> +		.of_match_table = qcom_aoss_reset_of_match,
> +	},
> +};
> +
> +builtin_platform_driver(qcom_aoss_reset_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm AOSS Reset Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
