Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 10 Oct 2018 13:03:10 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH 2/6] clk: qcom: Add WCSS gcc clock control for QCS404
In-Reply-To: <36e54245-090c-0756-0d40-0f8aa944a49c@codeaurora.org>
References: <1539090357-20853-1-git-send-email-govinds@codeaurora.org>
 <1539090357-20853-3-git-send-email-govinds@codeaurora.org>
 <36e54245-090c-0756-0d40-0f8aa944a49c@codeaurora.org>
Message-ID: <0b581a3fa5b4b3087648d945350f8c1b@codeaurora.org>
To: Taniya Das <tdas@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Thanks Taniya for the review.

On 2018-10-09 23:25, Taniya Das wrote:
> On 10/9/2018 6:35 PM, Govind Singh wrote:
>> Add support for the WCSS QDSP gcc clock control used on qcs404 based 
>> devices.
>> This would allow wcss remoteproc driver to control the required gcc 
>> clocks to
>> bring the subsystem out of reset.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>   drivers/clk/qcom/gcc-qcs404.c | 39 
>> ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 38 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/clk/qcom/gcc-qcs404.c 
>> b/drivers/clk/qcom/gcc-qcs404.c
>> index 6d1387e..bcbfe19 100644
>> --- a/drivers/clk/qcom/gcc-qcs404.c
>> +++ b/drivers/clk/qcom/gcc-qcs404.c
>> @@ -2505,6 +2505,34 @@ enum {
>>   	},
>>   };
>>   +static struct clk_branch gcc_ahbs_cbcr_clk = {
> 
> There is no such clock, the clock names should match exactly as they
> are represented in hardware plans.
> 

I will change the names in next patch-set. Below are the names in hw 
plans.
gcc_wdsp_q6ss_axim_clk
gcc_wdsp_q6ss_ahbs_clk

>> +	.halt_reg = 0x1e004,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x1e004,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "gcc_ahb_cbcr_clk",
>> +			.ops = &clk_branch2_ops,
>> +			.flags = CLK_IGNORE_UNUSED,
> 
> Do we need this flag?

This is not required in gcc controls, i will clean up this in next 
patch-set.

>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch gcc_axim_cbcr_clk = {
>> +	.halt_reg = 0x1e008,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x1e008,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "gcc_axim_cbcr_clk",
>> +			.ops = &clk_branch2_ops,
>> +			.flags = CLK_IGNORE_UNUSED,
>> +		},
>> +	},
>> +};
>> +
>>   static struct clk_regmap *gcc_qcs404_clocks[] = {
>>   	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
>>   	[BLSP1_QUP0_I2C_APPS_CLK_SRC] = &blsp1_qup0_i2c_apps_clk_src.clkr,
>> @@ -2642,6 +2670,9 @@ enum {
>>   	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
>>   	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
>>   	[GCC_DCC_XO_CLK] = &gcc_dcc_xo_clk.clkr,
>> +	[GCC_WCSS_Q6_AHB_CBCR_CLK] = NULL,
>> +	[GCC_WCSS_Q6_AXIM_CBCR_CLK] =  NULL,
>> +
>>   };
>>     static const struct qcom_reset_map gcc_qcs404_resets[] = {
>> @@ -2659,6 +2690,7 @@ enum {
>>   	[GCC_PCIE_0_LINK_DOWN_BCR] = {0x3E038},
>>   	[GCC_PCIEPHY_0_PHY_BCR] = {0x3E03C},
>>   	[GCC_EMAC_BCR] = {0x4E000},
>> +	[GCC_WDSP_RESTART] = {0x19000},
> 
> s/RESTART/BCR
> 

This reset control is listed as WDSP_RESTART in register spec.

>>   };
>>     static const struct regmap_config gcc_qcs404_regmap_config = {
>> @@ -2669,7 +2701,7 @@ enum {
>>   	.fast_io	= true,
>>   };
>>   -static const struct qcom_cc_desc gcc_qcs404_desc = {
>> +static struct qcom_cc_desc gcc_qcs404_desc = {
>>   	.config = &gcc_qcs404_regmap_config,
>>   	.clks = gcc_qcs404_clocks,
>>   	.num_clks = ARRAY_SIZE(gcc_qcs404_clocks),
>> @@ -2702,6 +2734,11 @@ static int gcc_qcs404_probe(struct 
>> platform_device *pdev)
>>   	clk_prepare_enable(apss_ahb_clk_src.clkr.hw.clk);
>>   	clk_prepare_enable(gpll0_ao_out_main.clkr.hw.clk);
>>   +	if (of_property_read_bool(pdev->dev.of_node, 
>> "qcom,wcss-protected")) {
>> +		gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] = 
>> &gcc_ahbs_cbcr_clk.clkr;
>> +		gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] = 
>> &gcc_axim_cbcr_clk.clkr;
>> +	}
>> +
>>   	return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
>>   }
>> 

BR,
Govind
