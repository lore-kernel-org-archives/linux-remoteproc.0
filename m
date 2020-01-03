Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Jan 2020 16:59:47 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/2] remoteproc: mss: q6v5-mss: Add modem support on
 SC7180
In-Reply-To: <4a3c80a0b616d54c5d4b465688034e19694c18c0.camel@pengutronix.de>
References: <20191219054506.20565-1-sibis@codeaurora.org>
 <20191219054506.20565-3-sibis@codeaurora.org>
 <4a3c80a0b616d54c5d4b465688034e19694c18c0.camel@pengutronix.de>
Message-ID: <39b3af3e6cefde9b7998fada9c311db9@codeaurora.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Philipp,

Thanks for taking time to review the
patch series.

On 2020-01-02 18:56, Philipp Zabel wrote:
> On Thu, 2019-12-19 at 11:15 +0530, Sibi Sankar wrote:
>> Add the out of reset sequence support for modem sub-system on SC7180
>> SoCs. It requires access to an additional halt nav register to put
>> the modem back into reset.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 199 
>> ++++++++++++++++++++++++++++-
>>  1 file changed, 198 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 164fc2a53ef11..51f451311f5fc 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> [...]
>> @@ -396,6 +409,18 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>>  		reset_control_assert(qproc->pdc_reset);
>>  		ret = reset_control_reset(qproc->mss_restart);
>>  		reset_control_deassert(qproc->pdc_reset);
>> +	} else if (qproc->has_halt_nav) {
>> +		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
>> +		reset_control_assert(qproc->pdc_reset);
>> +		regmap_update_bits(qproc->conn_map, qproc->conn_box,
>> +				   BIT(0), BIT(0));
>> +		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
>> +				   NAV_AXI_HALTREQ_BIT, 0);
>> +		reset_control_assert(qproc->mss_restart);
>> +		reset_control_deassert(qproc->pdc_reset);
>> +		regmap_update_bits(qproc->conn_map, qproc->conn_box,
>> +				   BIT(0), 0);
>> +		ret = reset_control_deassert(qproc->mss_restart);
>>  	} else {
>>  		ret = reset_control_assert(qproc->mss_restart);
>>  	}
> 
> Without knowing anything about the hardware this does look a bit weird,
> but I assume there is a good reason for every step.
> 
> Is the function name still describing its behaviour correctly, or would
> it make sense to rename q6v5_reset_assert/deassert to something else?

In qualcomm terminology, Q6 remote
processor requires its reset deasserted
while bringing it out of reset and reset
asserted while putting it back into reset.
However over time deassert/assert has
morphed into a sequence which we still
collectively refer to reset assert/
deassert.

I'm prefer continuing with the same name
since it helps abstract the out of reset
sequence into a few simple steps
(enable supplies->clk->pds->reset_deassert)
(disable reset_assert->clk->pds->supplies)
I'll let Bjorn decide what to do on this.

> 
> [...]
>> @@ -667,6 +742,39 @@ static void q6v5proc_halt_axi_port(struct q6v5 
>> *qproc,
>>  	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
>>  }
>> 
>> +static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
>> +				       struct regmap *halt_map,
>> +				       u32 offset)
>> +{
> [...]
>> +	/* Wait for halt ack*/
>> +	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
>> +	for (;;) {
>> +		ret = regmap_read(halt_map, offset, &val);
>> +		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
>> +		    time_after(jiffies, timeout))
>> +			break;
>> +
>> +		udelay(5);
>> +	}
> 
> This does look like a candidate for using regmap_read_poll_timeout().

yes it does... will send a patch for
it since I think the series is already
in lnext.

> 
> regards
> Philipp

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
