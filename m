Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH 3/4] remoteproc: qcom: q6v5-pil: Explicitly get
 mss_restart line
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <20180727152811.15258-3-sibis@codeaurora.org>
 <1533027423.3444.11.camel@pengutronix.de>
From: Sibi S <sibis@codeaurora.org>
Message-ID: <2d3ba00f-7379-dda3-fb7a-3112b7b0ef99@codeaurora.org>
Date: Tue, 31 Jul 2018 18:41:46 +0530
MIME-Version: 1.0
In-Reply-To: <1533027423.3444.11.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Philipp,
Thanks for the review!

On 07/31/2018 02:27 PM, Philipp Zabel wrote:
> On Fri, 2018-07-27 at 20:58 +0530, Sibi Sankar wrote:
>> Explicitly get mss_restart to facilitate adding PDC
>> restart line for modem on SDM845 SoCs
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pil.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index b1296d614b8b..d57fdb34e3dd 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -1176,8 +1176,7 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
>>   
>>   static int q6v5_init_reset(struct q6v5 *qproc)
>>   {
>> -	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
>> -							      NULL);
>> +	qproc->mss_restart = devm_reset_control_get(qproc->dev, "mss_restart");
> 
> Please keep using devm_reset_control_get_exclusive.
> 

got misled when I saw it being used in a recent driver :), will revert
it back.

> regards
> Philipp
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
