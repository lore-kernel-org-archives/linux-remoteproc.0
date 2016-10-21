Return-Path: <spjoshi@codeaurora.org>
Subject: Re: [PATCH] remoteproc: Add support for xo clock
References: <1476989724-7464-1-git-send-email-spjoshi@codeaurora.org>
 <20161020235401.GG26139@codeaurora.org>
From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Message-ID: <24769e8c-d935-6386-5204-fe50dc1fe8ea@codeaurora.org>
Date: Fri, 21 Oct 2016 16:15:35 -0700
MIME-Version: 1.0
In-Reply-To: <20161020235401.GG26139@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/20/2016 04:54 PM, Stephen Boyd wrote:
> On 10/20, Sarangdhar Joshi wrote:
>> Add xo clock support required for Qualcomm ADSP
>> Peripheral Image Loader.
>
> Yes but why is xo needed?

It is required to boot up the ADSP processor. The remoteproc driver 
keeps the xo clock enabled until the driver receives an "handover" 
interrupt in order to allow remote processor to vote for xo clock with rpm.

I will update the commit text.

>
>> @@ -223,6 +232,17 @@ static irqreturn_t adsp_stop_ack_interrupt(int irq, void *dev)
>>  	return IRQ_HANDLED;
>>  }
>>
>> +static int adsp_init_clock(struct qcom_adsp *adsp)
>> +{
>> +	adsp->xo = devm_clk_get(adsp->dev, "xo");
>> +	if (IS_ERR(adsp->xo)) {
>> +		dev_err(adsp->dev, "failed to get xo clock");
>
> What if it's a probe defer error? Probably best to just be
> silent/debug level, or we need a specific test for EPROBE_DEFER
> and then silence in that case.

Sure, I will add a check for EPROBE_DEFER. Prefer driver to return
meaningful error message in case of failure.

>
>> +		return PTR_ERR(adsp->xo);
>> +	}
>

Thanks for reviewing the patch.

Regards,
Sarang

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
