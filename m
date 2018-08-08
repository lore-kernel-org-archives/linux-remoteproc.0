Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH 4/4] remoteproc: qcom: q6v5-pil: Add PDC restart for modem
 on SDM845 SoCs
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <20180727152811.15258-4-sibis@codeaurora.org>
 <20180807181835.GA28960@rob-hp-laptop>
From: Sibi Sankar <sibis@codeaurora.org>
Message-ID: <a76d80f2-ac97-1c84-06a3-f86dbe2f35dd@codeaurora.org>
Date: Wed, 8 Aug 2018 21:15:03 +0530
MIME-Version: 1.0
In-Reply-To: <20180807181835.GA28960@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 08/07/2018 11:48 PM, Rob Herring wrote:
> On Fri, Jul 27, 2018 at 08:58:11PM +0530, Sibi Sankar wrote:
>> In the presence of a PDC block working with subsystem RSC,
>> assert/deassert PDC restart in modem start/stop path.
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   .../bindings/remoteproc/qcom,q6v5.txt         |  4 +++
> 
> Please split bindings to separate patch.
>

Okay will split them.

>>   drivers/remoteproc/qcom_q6v5_pil.c            | 27 ++++++++++++++++---
>>   2 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 601dd9f389aa..124fb1dc6fb8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -51,6 +51,8 @@ on the Qualcomm Hexagon core.
>>   	Usage: required
>>   	Value type: <phandle>
>>   	Definition: reference to the reset-controller for the modem sub-system
>> +		    reference to the list of 2 reset-controllers for the modem
>> +		    sub-system on SDM845 SoCs
>>   		    reference to the list of 3 reset-controllers for the
>>   		    wcss sub-system
>>   
>> @@ -58,6 +60,8 @@ on the Qualcomm Hexagon core.
>>   	Usage: required
>>   	Value type: <stringlist>
>>   	Definition: must be "mss_restart" for the modem sub-system
>> +	Definition: must be "mss_restart", "pdc_restart" for the modem
>> +		    sub-system on SDM845 SoCs
>>   	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
>>   		    for the wcss syb-system
>>   

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
