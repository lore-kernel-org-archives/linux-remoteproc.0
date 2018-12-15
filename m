Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 15 Dec 2018 23:13:19 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v2 2/6] clk: qcom: Add WCSS gcc clock control for QCS404
In-Reply-To: <153965169170.5275.12866721145155274552@swboyd.mtv.corp.google.com>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
 <1539337244-9505-3-git-send-email-govinds@codeaurora.org>
 <153965169170.5275.12866721145155274552@swboyd.mtv.corp.google.com>
Message-ID: <95fd78776f20701d82f1ed84bf476149@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Thanks Stephen for the review.

On 2018-10-16 06:31, Stephen Boyd wrote:
> Quoting Govind Singh (2018-10-12 02:40:40)
>>  static const struct regmap_config gcc_qcs404_regmap_config = {
>> @@ -2669,7 +2699,7 @@ enum {
>>         .fast_io        = true,
>>  };
>> 
>> -static const struct qcom_cc_desc gcc_qcs404_desc = {
>> +static struct qcom_cc_desc gcc_qcs404_desc = {
>>         .config = &gcc_qcs404_regmap_config,
>>         .clks = gcc_qcs404_clocks,
>>         .num_clks = ARRAY_SIZE(gcc_qcs404_clocks),
>> @@ -2702,6 +2732,11 @@ static int gcc_qcs404_probe(struct 
>> platform_device *pdev)
>>         clk_prepare_enable(apss_ahb_clk_src.clkr.hw.clk);
>>         clk_prepare_enable(gpll0_ao_out_main.clkr.hw.clk);
>> 
>> +       if (of_property_read_bool(pdev->dev.of_node, 
>> "qcom,wcss-protected")) {
> 
> Is this documented? And shouldn't it be inverted? If it isn't protected
> then we do this?
> 

I have moved this to #ifdef CONFIG_QCS_WCSSCC_404 similar to lpass clk 
driver for sdm845 in v3.

>> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] = 
>> &gcc_wdsp_q6ss_ahbs_clk.clkr;
>> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] = 
>> &gcc_wdsp_q6ss_axim_clk.clkr;
>> +       }
>> +
>>         return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
>>  }
>> 

BR,
Govind
