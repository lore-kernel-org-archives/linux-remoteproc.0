Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH 4/4] remoteproc: qcom: q6v5-pil: Add PDC restart for modem
 on SDM845 SoCs
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <20180727152811.15258-4-sibis@codeaurora.org>
 <1533027272.3444.9.camel@pengutronix.de>
From: Sibi S <sibis@codeaurora.org>
Message-ID: <1040c360-3fdf-0657-95ee-0ee669e7b252@codeaurora.org>
Date: Tue, 31 Jul 2018 18:43:33 +0530
MIME-Version: 1.0
In-Reply-To: <1533027272.3444.9.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Philipp,
Thanks for the review!

On 07/31/2018 02:24 PM, Philipp Zabel wrote:
> On Fri, 2018-07-27 at 20:58 +0530, Sibi Sankar wrote:
>> In the presence of a PDC block working with subsystem RSC,
>> assert/deassert PDC restart in modem start/stop path.
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   .../bindings/remoteproc/qcom,q6v5.txt         |  4 +++
>>   drivers/remoteproc/qcom_q6v5_pil.c            | 27 ++++++++++++++++---
>>   2 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 601dd9f389aa..124fb1dc6fb8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> [...]
>> @@ -1182,6 +1192,15 @@ static int q6v5_init_reset(struct q6v5 *qproc)
>>   		return PTR_ERR(qproc->mss_restart);
>>   	}
>>   
>> +	if (qproc->has_alt_reset) {
>> +		qproc->pdc_restart = devm_reset_control_get(qproc->dev,
>> +							    "pdc_restart");
> 
> Please use devm_reset_control_get_exclusive() instead.
> 

will replace it in the next re-spin.

>> +		if (IS_ERR(qproc->pdc_restart)) {
>> +			dev_err(qproc->dev, "failed to acquire pdc restart\n");
>> +			return PTR_ERR(qproc->pdc_restart);
>> +		}
>> +	}
>> +
>>   	return 0;
>>   }
> 
> regards
> Philipp
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
