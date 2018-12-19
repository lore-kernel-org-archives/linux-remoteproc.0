Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Dec 2018 12:34:55 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: remoteproc: qcom: Add clock bindings
 for Q6V5
In-Reply-To: <20181218172709.GA19660@bogus>
References: <20181217100724.4593-1-sibis@codeaurora.org>
 <20181217100724.4593-2-sibis@codeaurora.org> <20181218172709.GA19660@bogus>
Message-ID: <365dfd8e7160c0c3e5a113dbaa88be68@codeaurora.org>
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,
Thanks for the review!

On 2018-12-18 22:57, Rob Herring wrote:
> On Mon, Dec 17, 2018 at 03:37:19PM +0530, Sibi Sankar wrote:
>> Add missing clock bindings for Q6V5 MSS on SDM845 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt       | 10 
>> +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 9ff5b0309417..780adc043b37 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -39,13 +39,17 @@ on the Qualcomm Hexagon core.
>>  - clocks:
>>  	Usage: required
>>  	Value type: <phandle>
>> -	Definition: reference to the iface, bus and mem clocks to be held on
>> -		    behalf of the booting of the Hexagon core
>> +	Definition: reference to the list of 4 clocks for the modem 
>> sub-system
>> +		    reference to the list of 8 clocks for the modem sub-system
>> +		    on SDM845 SoCs
>> 
>>  - clock-names:
>>  	Usage: required
>>  	Value type: <stringlist>
>> -	Definition: must be "iface", "bus", "mem"
>> +	Definition: must be "iface", "bus", "mem", "xo" for the modem 
>> sub-system
>> +		    must be "iface", "bus", "mem", "gpll0_mss", "snoc_axi",
>> +		    "mnoc_axi", "prng", "xo" for the modem sub-system on SDM845
>> +		    SoCs
> 
> This seems to me a list of all clocks you need enabled, not what clocks
> actually go to the modem. Specifically, shouldn't the *noc_axi clocks 
> be
> managed by the interconnect driver?

clocks = ...,
        <&gcc GCC_MSS_SNOC_AXI_CLK>,
        <&gcc GCC_MSS_MFAB_AXIS_CLK>,
          ...;
clock-names = ..., "snoc_axi", "mnoc_axi",...;

snoc_axi and mnoc_axi maps to above GCC clks and
both of them fall under the MSS functional group

> 
> Rob

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
