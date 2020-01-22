Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Jan 2020 11:48:28 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 1/4] remoteproc: qcom: q6v5-mss: Use
 regmap_read_poll_timeout
In-Reply-To: <20200120192432.GJ1511@yoga>
References: <20200117135130.3605-1-sibis@codeaurora.org>
 <20200117135130.3605-2-sibis@codeaurora.org> <20200120192432.GJ1511@yoga>
Message-ID: <ff6e50e7ab706dcab05d579df8201864@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: evgreen@chromium.org, p.zabel@pengutronix.de, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, linux-arm-msm-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Bjorn,

Thanks for the review!

On 2020-01-21 00:54, Bjorn Andersson wrote:
> On Fri 17 Jan 05:51 PST 2020, Sibi Sankar wrote:
> 
>> Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.

sry missed it, will include it
in the next re-spin

>> 
> 
> Nice, but we should be able to do the same in q6v5proc_halt_axi_port()?
> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 51f451311f5fc..f20b39c6ff0ed 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -73,6 +73,7 @@
>>  #define NAV_AXI_IDLE_BIT		BIT(2)
>> 
>>  #define HALT_ACK_TIMEOUT_MS		100
>> +#define NAV_HALT_ACK_TIMEOUT_US		200
>> 
>>  /* QDSP6SS_RESET */
>>  #define Q6SS_STOP_CORE			BIT(0)
>> @@ -746,7 +747,6 @@ static void q6v5proc_halt_nav_axi_port(struct q6v5 
>> *qproc,
>>  				       struct regmap *halt_map,
>>  				       u32 offset)
>>  {
>> -	unsigned long timeout;
>>  	unsigned int val;
>>  	int ret;
>> 
>> @@ -760,15 +760,11 @@ static void q6v5proc_halt_nav_axi_port(struct 
>> q6v5 *qproc,
>>  			   NAV_AXI_HALTREQ_BIT);
>> 
>>  	/* Wait for halt ack*/
>> -	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
>> -	for (;;) {
>> -		ret = regmap_read(halt_map, offset, &val);
>> -		if (ret || (val & NAV_AXI_HALTACK_BIT) ||
>> -		    time_after(jiffies, timeout))
>> -			break;
>> -
>> -		udelay(5);
>> -	}
>> +	ret = regmap_read_poll_timeout(halt_map, offset, val,
>> +				       (val & NAV_AXI_HALTACK_BIT),
>> +				       5, NAV_HALT_ACK_TIMEOUT_US);
>> +	if (ret)
>> +		dev_err(qproc->dev, "nav halt ack timeout\n");
> 
> Is there a case where this new print adds value beyond the printout we
> already have for the case of IDLE_BIT not going high? Can we simply
> ignore the return value and skip the print?

yes we can skip the print

> 
> Regards,
> Bjorn
> 
>> 
>>  	ret = regmap_read(halt_map, offset, &val);
>>  	if (ret || !(val & NAV_AXI_IDLE_BIT))
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
