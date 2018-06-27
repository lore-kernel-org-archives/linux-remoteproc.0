Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH v5 1/8] dt-bindings: reset: Add AOSS reset bindings for
 SDM845 SoCs
References: <20180521172714.8551-1-sibis@codeaurora.org>
 <20180521172714.8551-2-sibis@codeaurora.org>
 <20180623004433.GQ3402@tuxbook-pro>
From: Sibi S <sibis@codeaurora.org>
Message-ID: <aa84c861-5e37-5576-cd6f-94a302750d19@codeaurora.org>
Date: Wed, 27 Jun 2018 19:54:18 +0530
MIME-Version: 1.0
In-Reply-To: <20180623004433.GQ3402@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,
Thanks for the review will address the comments in the next respin.

On 06/23/2018 06:14 AM, Bjorn Andersson wrote:
> On Mon 21 May 10:27 PDT 2018, Sibi Sankar wrote:
> 
>> Add SDM845 AOSS (always on subsystem) reset controller binding
>>
> 
> I think it would be better if you made the binding represent the entire
> clock controller, rather than only the reset-related portion of it.
> 
> As I can't find anything in the downstream kernel that references the
> clock part of the hardware block I think the driver can be kept as is
> (with updated compatible and adjust the offsets of the registers)
> 
> 
> This makes the DT better represents the hardware and it makes it
> possible to control the clocks in the future, without breaking backwards
> compatibility with existing DTBs.
> 

yup makes sense.

>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   .../bindings/reset/qcom,aoss-reset.txt        | 52 +++++++++++++++++++
>>   include/dt-bindings/reset/qcom,sdm845-aoss.h  | 17 ++++++
>>   2 files changed, 69 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>>   create mode 100644 include/dt-bindings/reset/qcom,sdm845-aoss.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> new file mode 100644
>> index 000000000000..cd5dcafb4ed7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> @@ -0,0 +1,52 @@
>> +Qualcomm AOSS Reset Controller
>> +======================================
>> +
>> +This binding describes a reset-controller found on AOSS (always on subsystem)
>> +for Qualcomm SDM845 SoCs.
>> +
>> +Required properties:
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: must be:
>> +		    "qcom,sdm845-aoss-reset"
> 
> qcom,sdm845-aoss-cc
> 
>> +
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: must specify the base address and size of the register
>> +	            space.
>> +
>> +- #reset-cells:
>> +	Usage: required
>> +	Value type: <uint>
>> +	Definition: must be 1; cell entry represents the reset index.
>> +
>> +Example:
>> +
>> +aoss_reset: reset-controller@c2b0000 {
>> +	compatible = "qcom,sdm845-aoss-reset";
>> +	reg = <0xc2b0000 0x21000>;
> 
> reg = <0xc2a0000 0x31000>;
> 
>> +	#reset-cells = <1>;
>> +};
>> +
> 
> Apart from this the binding looks good!
> 
> Regards,
> Bjorn
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
