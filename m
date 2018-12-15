Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 15 Dec 2018 23:20:56 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v2 4/6] clk: qcom: Add WCSS Q6DSP clock controller for
 QCS404
In-Reply-To: <153965164912.5275.9375525898482582960@swboyd.mtv.corp.google.com>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
 <1539337244-9505-5-git-send-email-govinds@codeaurora.org>
 <153965164912.5275.9375525898482582960@swboyd.mtv.corp.google.com>
Message-ID: <18e19e9696c4ef250b87837d126d9dcb@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Thanks Stephen for the review.

On 2018-10-16 06:30, Stephen Boyd wrote:
> Quoting Govind Singh (2018-10-12 02:40:42)
>> Add support for the WCSS QDSP clock control used on qcs404
>> based devices. This would allow wcss remoteproc driver to
>> control the required WCSS QDSP clock/reset controls to
>> bring the subsystem out of reset and shutdown the WCSS QDSP.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
> 
> This needs to be sent to the clk mailing list and maintainers.
> 

sure.

>> diff --git a/drivers/clk/qcom/wcsscc-qcs404.c 
>> b/drivers/clk/qcom/wcsscc-qcs404.c
>> new file mode 100644
>> index 0000000..9a0c864
>> --- /dev/null
>> +++ b/drivers/clk/qcom/wcsscc-qcs404.c
>> @@ -0,0 +1,290 @@
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
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#include <dt-bindings/clock/qcom,wcss-qcs404.h>
>> +#include <linux/reset-controller.h>
>> +
>> +#include "clk-regmap.h"
>> +#include "clk-branch.h"
>> +#include "common.h"
>> +#include "reset.h"
>> +
>> +/* Q6SSTOP clocks */
>> +static struct clk_branch lcc_ahbfabric_cbc_clk = {
>> +       .halt_reg = 0x1b004,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x1b004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lcc_ahbfabric_cbc_clk",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch lcc_q6ss_ahbs_cbc_clk = {
>> +       .halt_reg = 0x22000,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x22000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lcc_q6ss_ahbs_cbc_clk",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch lcc_q6ss_tcm_slave_cbc_clk = {
>> +       .halt_reg = 0x1c000,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x1c000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lcc_q6ss_tcm_slave_cbc_clk",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch lcc_q6ss_ahbm_cbc_clk = {
>> +       .halt_reg = 0x22004,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x22004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lcc_q6ss_ahbm_cbc_clk",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch lcc_q6ss_axim_cbc_clk = {
>> +       .halt_reg = 0x1c004,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x1c004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lcc_q6ss_axim_cbc_clk",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch lcc_q6ss_bcr_sleep_clk = {
>> +       .halt_reg = 0x6004,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x6004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lcc_q6ss_bcr_sleep_clk",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
>> +               },
>> +       },
>> +};
>> +
>> +/* TCSR clock */
>> +static struct clk_branch wcss_lcc_csr_cbcr_clk = {
>> +       .halt_reg = 0x8008,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x8008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "wcss_lcc_csr_cbcr_clk",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
>> +               },
>> +       },
>> +};
>> +
>> +/* Q6SSTOP_QDSP6SS clock */
>> +static struct clk_branch q6ss_xo_clk = {
>> +       .halt_reg = 0x38,
>> +       .halt_check = BRANCH_HALT_SKIP,
> 
> Why?
> 
CLK_OFF would not toggle until WCSS is out of reset.


>> +static struct clk_branch q6sstop_q6ss_gfmux_clk_src = {
>> +       .halt_reg = 0x20,
>> +       .halt_check = BRANCH_HALT_SKIP,
>> +       .clkr = {
>> +               .enable_reg = 0x20,
>> +               .enable_mask = (BIT(1) | BIT(3) | BIT(8)),
> 
> Drop useless parenthesis please. And this is actually three clks in 
> one?
> 

Addressed in v3.
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "q6sstop_q6ss_gfmux_clk_src",
>> +                       .ops = &clk_branch2_ops,
>> +                       .flags = CLK_IGNORE_UNUSED,
> 
> Why? Please explain with comment, etc.
> 

Added comment in the v3 version for CLK_IGNORE_UNUSED flag.

>> +               },
>> +       },
>> +};
>> +
>> +static struct regmap_config wcss_regmap_config = {
>> +       .reg_bits       = 32,
>> +       .reg_stride     = 4,
>> +       .val_bits       = 32,
>> +       .fast_io        = true,
> 
> max register? Or that gets set later on somewhere?
> 

Addressed in v3.

>> +};
>> +
>> +static struct clk_regmap *wcss_q6sstop_qcs405_clocks[] = {
>> +       [WCSS_AHBFABRIC_CBCR_CLK] = &lcc_ahbfabric_cbc_clk.clkr,
>> +       [WCSS_AHBS_CBCR_CLK] = &lcc_q6ss_ahbs_cbc_clk.clkr,
>> +       [WCSS_TCM_CBCR_CLK] = &lcc_q6ss_tcm_slave_cbc_clk.clkr,
>> +       [WCSS_AHBM_CBCR_CLK] = &lcc_q6ss_ahbm_cbc_clk.clkr,
>> +       [WCSS_AXIM_CBCR_CLK] = &lcc_q6ss_axim_cbc_clk.clkr,
>> +       [WCSS_BCR_CBCR_CLK] = &lcc_q6ss_bcr_sleep_clk.clkr,
>> +};
>> +
>> +static const struct qcom_reset_map qdsp6ss_qcs405_resets[] = {
>> +       [Q6SSTOP_QDSP6SS_RESET] = {0x14, 0},
>> +       [Q6SSTOP_QDSP6SS_CORE_RESET] = {0x14, 1},
>> +       [Q6SSTOP_QDSP6SS_BUS_RESET] = {0x14, 2},
>> +};
>> +
>> +static const struct qcom_reset_map q6sstop_qcs405_resets[] = {
>> +       [Q6SSTOP_BCR_RESET] = {0x6000},
>> +};
>> +
>> +static const struct qcom_cc_desc wcss_q6sstop_qcs405_desc = {
>> +       .config = &wcss_regmap_config,
>> +       .clks = wcss_q6sstop_qcs405_clocks,
>> +       .num_clks = ARRAY_SIZE(wcss_q6sstop_qcs405_clocks),
>> +       .resets = q6sstop_qcs405_resets,
>> +       .num_resets = ARRAY_SIZE(q6sstop_qcs405_resets),
>> +};
>> +
>> +static struct clk_regmap *wcnss_tcsr_qcs405_clocks[] = {
>> +       [WCSS_LCC_CBCR_CLK] = &wcss_lcc_csr_cbcr_clk.clkr,
>> +};
>> +
>> +static const struct qcom_cc_desc wcnss_tcsr_qcs405_desc = {
>> +       .config = &wcss_regmap_config,
>> +       .clks = wcnss_tcsr_qcs405_clocks,
>> +       .num_clks = ARRAY_SIZE(wcnss_tcsr_qcs405_clocks),
>> +};
>> +
>> +static struct clk_regmap *wcnss_qdsp6ss_qcs405_clocks[] = {
>> +       [WCSS_QDSP6SS_XO_CBCR_CLK] = &q6ss_xo_clk.clkr,
>> +       [WCSS_QDSP6SS_SLEEP_CBCR_CLK] = &q6ss_slp_clk.clkr,
>> +       [WCSS_QDSP6SS_GFMMUX_CLK] = &q6sstop_q6ss_gfmux_clk_src.clkr,
>> +};
>> +
>> +static const struct qcom_cc_desc wcnss_qdsp6ss_qcs405_desc = {
>> +       .config = &wcss_regmap_config,
>> +       .clks = wcnss_qdsp6ss_qcs405_clocks,
>> +       .num_clks = ARRAY_SIZE(wcnss_qdsp6ss_qcs405_clocks),
>> +       .resets = qdsp6ss_qcs405_resets,
>> +       .num_resets = ARRAY_SIZE(qdsp6ss_qcs405_resets),
>> +};
>> +
>> +static int wcss_clocks_qcs405_probe(struct platform_device *pdev, int 
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
>> +
>> +/* WCSS CC clock controller */
> 
> Please drop the obvious comment!
> 
Addressed in v3.

>> +static const struct of_device_id wcss_cc_qcs405_match_table[] = {
>> +       { .compatible = "qcom,qcs405-wcsscc" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, wcss_cc_qcs405_match_table);
>> +
>> +static int wcss_cc_qcs405_probe(struct platform_device *pdev)
>> +{
>> +       const struct qcom_cc_desc *desc;
>> +       int ret;
>> +
>> +       wcss_regmap_config.name = "wcss_q6sstop";
>> +       desc = &wcss_q6sstop_qcs405_desc;
>> +
>> +       ret = wcss_clocks_qcs405_probe(pdev, 0, desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       wcss_regmap_config.name = "wcnss_tcsr";
>> +       desc = &wcnss_tcsr_qcs405_desc;
>> +
>> +       ret = wcss_clocks_qcs405_probe(pdev, 1, desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       wcss_regmap_config.name = "wcss_qdsp6ss";
>> +       desc = &wcnss_qdsp6ss_qcs405_desc;
>> +
>> +       return wcss_clocks_qcs405_probe(pdev, 2, desc);
>> +}
> 
> And this is the second clk driver in qcom land to do this, so we need 
> to
> add this to style of clk driver to clk/qcom/common.c

Seems LPASS clk driver is still under review, can i address this comment 
as separate patch.

BR,
Govind
