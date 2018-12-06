Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 06 Dec 2018 23:14:37 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: Add power-domain bindings
 for Q6V5
In-Reply-To: <20181206165810.GC31596@builder>
References: <20181120210828.12590-1-sibis@codeaurora.org>
 <20181206165810.GC31596@builder>
Message-ID: <a162ed66f2017b42c3d30e9279e363a3@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,
Thanks for the review!

On 2018-12-06 22:28, Bjorn Andersson wrote:
> On Tue 20 Nov 13:08 PST 2018, Sibi Sankar wrote:
> 
>> Add power-domain bindings for Q6V5 MSS on SDM845 SoCs.
>> 
> 
> Thanks Sibi,
> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> Add dt-binding corresponding to 
>> https://patchwork.kernel.org/patch/10586893/
>> (remoteproc: q6v5: Add support to vote for rpmh power domains)
>> 
>>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt      | 11 
>> +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 14947562bc67..bd9f4882fcf0 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -75,6 +75,17 @@ on the Qualcomm Hexagon core.
>>  	Definition: reference to the regulators to be held on behalf of the
>>  		    booting of the Hexagon core
>> 
>> +- power-domains:
>> +	Usage: required
>> +	Value type: <phandle>
>> +	Definition: reference to the cx, mx and mss power-domains to be held 
>> on
>> +		    behalf of the booting the Hexagon core
> 
> This should mention that these are the domains for SDM845, as the list
> seems to differ somewhat between platforms. Please also define the
> requirements for MSM8996 (cx & mx) here, while you're at it.
> 
> Let's also make sure it includes the "load_state", for SDM845.
> 

I'll list the power domains per SoC in the next respin

> Regards,
> Bjorn
> 
>> +
>> +- power-domain-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "cx", "mx", "mss"
>> +
>>  - qcom,smem-states:
>>  	Usage: required
>>  	Value type: <phandle>
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
