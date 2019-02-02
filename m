Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 02 Feb 2019 21:15:43 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 2/7] clk: qcom: Add WCSS Q6DSP clock controller for
 QCS404
In-Reply-To: <154507272487.19322.760504004108754132@swboyd.mtv.corp.google.com>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-3-govinds@codeaurora.org>
 <154507272487.19322.760504004108754132@swboyd.mtv.corp.google.com>
Message-ID: <e7f94a34ff56cd008245fadf766d4c23@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 2018-12-18 00:22, Stephen Boyd wrote:
> Quoting Govind Singh (2018-12-15 02:35:52)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 9fe28b9ceba8..84acc7718691 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -222,6 +222,15 @@ config QCS_GCC_404
>>           Say Y if you want to use multimedia devices or peripheral
>>           devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
>> 
>> +config QCS_WCSSCC_404
>> +       tristate "QCS404 WCSS Clock Controller"
>> +       depends on COMMON_CLK_QCOM
> 
> This is going away, so you can drop this depends on statement soon.
> 

Removed in v4.

>> +       select QCS_GCC_404
>> +       help
>> +         Support for the WCSS clock controller on QCS404 devices.
>> +         Say Y if you want to use the WCSS branch clocks of the WCSS 
>> clock
>> +         controller to reset the WCSS subsystem.
>> +
>>  config SDM_GCC_845
>>         tristate "SDM845 Global Clock Controller"
>>         select QCOM_GDSC
>> diff --git a/drivers/clk/qcom/wcsscc-qcs404.c 
>> b/drivers/clk/qcom/wcsscc-qcs404.c
>> new file mode 100644
>> index 000000000000..bd694ef1b6ac
>> --- /dev/null
>> +++ b/drivers/clk/qcom/wcsscc-qcs404.c
>> @@ -0,0 +1,297 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/err.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
> 
> Is this used?
> 
>> +#include <linux/clk.h>
> 
> Is this used?
> 

Removed unnecessary includes and cleanup suggested by you in v4.

> 
>> + * CLK_IGNORE_UNUSED flags which prevent these
>> + * clocks from being gated during bootup.
> 
> Ok.. but userspace is after CLK_IGNORE_UNUSED would process these clks?
> So we're keeping them on from the bootloader why? Something is using
> these clks during that operation but after that point they need to be
> turned off?
> 

Yes remote proc will process this clock during rproc start. I discussed 
this issue with Bjorn.
I will seek his help.
Need to root cause why these clocks are voted from bootloader.

>> + */
>> +
>> +static int wcss_clocks_qcs404_probe(struct platform_device *pdev, int 
>> index,
>> +                                   const struct qcom_cc_desc *desc)
>> +{
>> +       struct regmap *regmap;
>> +       struct resource *res;
>> +       void __iomem *base;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, index);
>> +       base = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(base))
>> +               return -ENOMEM;
>> +
>> +       regmap = devm_regmap_init_mmio(&pdev->dev, base, 
>> desc->config);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       return qcom_cc_really_probe(pdev, desc, regmap);
>> +}
> 
> You're the second user of this "probe on reg region" logic. Please
> extract it out of the lpasscc driver and put it into common.c so it can
> be reused by the two drivers.
> 

I have addressed in v4.

>> +
>> +static int wcss_cc_qcs404_probe(struct platform_device *pdev)
>> +{
>> +       const struct qcom_cc_desc *desc;
>> +       int ret;
>> +
>> +       wcss_regmap_config.name = "wcss_q6sstop";
>> +       desc = &wcss_q6sstop_qcs404_desc;
>> +
>> +       ret = wcss_clocks_qcs404_probe(pdev, 0, desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       wcss_regmap_config.name = "wcnss_tcsr";
>> +       desc = &wcnss_tcsr_qcs404_desc;
>> +
>> +       ret = wcss_clocks_qcs404_probe(pdev, 1, desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       wcss_regmap_config.name = "wcss_qdsp6ss";
>> +       desc = &wcnss_qdsp6ss_qcs404_desc;
>> +
>> +       return wcss_clocks_qcs404_probe(pdev, 2, desc);
>> +}
>> +
>> +static struct platform_driver wcss_cc_qcs404_driver = {
>> +       .probe          = wcss_cc_qcs404_probe,
>> +       .driver         = {
>> +               .name   = "qcs404-wcsscc",
>> +               .of_match_table = wcss_cc_qcs404_match_table,
>> +       },
>> +};
>> +
>> +static int __init wcss_cc_qcs404_init(void)
>> +{
>> +       return platform_driver_register(&wcss_cc_qcs404_driver);
>> +}
>> +subsys_initcall(wcss_cc_qcs404_init);
> 
> Where is the driver removal exit function?
> 

My bad, added in v4.

>> +
>> +MODULE_LICENSE("GPL v2");
> 
> MODULE_DESCRIPTION?

BR,
Govind
