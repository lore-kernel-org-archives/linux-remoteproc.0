Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Aug 2018 12:41:20 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/6] reset: qcom: PDC Global (Power Domain Controller)
 reset controller
In-Reply-To: <20180828030253.GF2523@minitux>
References: <20180824131900.5353-1-sibis@codeaurora.org>
 <20180824131900.5353-3-sibis@codeaurora.org>
 <20180828002236.GX160295@google.com> <20180828030253.GF2523@minitux>
Message-ID: <e9de1c7b6ba51f825389c3fad81f633d@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn/Matthias,
Thanks for the review, will fix them in the next-respin.

On 2018-08-28 08:32, Bjorn Andersson wrote:
> On Mon 27 Aug 17:22 PDT 2018, Matthias Kaehlcke wrote:
>> On Fri, Aug 24, 2018 at 06:48:56PM +0530, Sibi Sankar wrote:
>> > diff --git a/drivers/reset/reset-qcom-pdc.c b/drivers/reset/reset-qcom-pdc.c
> [..]
>> > +struct qcom_pdc_desc {
>> > +	const struct regmap_config *config;
>> > +	const struct qcom_pdc_reset_map *resets;
>> > +	size_t num_resets;
>> > +};
>> 
>> Not sure if this structure adds much value or just a layer of
>> indirection:
>> 
>> - .config is only accessed in _probe(), sdm845_pdc_regmap_config could
>>   be used directly
>> - .resets is used in _(de)assert(), sdm845_pdc_resets could be used
>>   directly
>> - .num_resets is only accessed in _probe(),
>>   ARRAY_SIZE(sdm845_pdc_resets) could be used instead
>> 
>> It probably makes sense if it is planned to support reset controllers
>> of other SoCs with this driver.
>> 
> 
> I like this suggestion, once we need the configurability we can add the
> type for it. It also shows that only .resets would need to be 
> referenced
> by qcom_pdc_reset_data.
> 

Will change it accordingly

>> > +struct qcom_pdc_reset_data {
>> > +	struct reset_controller_dev rcdev;
>> > +	struct regmap *regmap;
>> > +	const struct qcom_pdc_desc *desc;
>> > +};
> [..]
>> > +static int qcom_pdc_reset_probe(struct platform_device *pdev)
>> > +{
> [..]
>> > +	data->regmap = devm_regmap_init_mmio(dev, base, desc->config);
>> > +	if (IS_ERR(data->regmap)) {
>> > +		dev_err(dev, "Unable to get pdc-global regmap");
>> 
>> Add missing '\n'
>> 
>> Say 'pdc-reset' instead of 'pdc-global'? (see also my other comment
>> below).
>> 
> 
> This regmap is created out of the single anonymous "reg", so I think 
> the
> error should be reduced to "Unable to initialize regmap\n".
> 

Sure will add it but aren't we trying to regmap the entire pdc-global
register space though?

> [..]
>> > +static const struct of_device_id qcom_pdc_reset_of_match[] = {
>> > +	{ .compatible = "qcom,sdm845-pdc-global", .data = &sdm845_pdc_desc },
>> 
>> Should this be 'qcom,sdm845-pdc-reset' which is more specific than
>> 'global' and in line with the name and purpose of the driver?
>> Obviously this would require to adjust the bindings doc too.
>> 
> 
> No, the binding describes the hardware block named "PDC Global",
> currently implemented as a reset controller. The reason for doing this
> is so that we one day can expose additional interfaces in a backwards
> compatible fashion.
> 
> Regards,
> Bjorn

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
