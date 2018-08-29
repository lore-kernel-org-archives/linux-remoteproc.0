Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 29 Aug 2018 22:08:52 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: remoteproc: Remove additional
 definition tag
In-Reply-To: <20180828004422.GZ160295@google.com>
References: <20180824131900.5353-1-sibis@codeaurora.org>
 <20180824131900.5353-4-sibis@codeaurora.org>
 <20180828004422.GZ160295@google.com>
Message-ID: <c3e417189c150114b67af9e5ded668b6@codeaurora.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Matthias,
Thanks for the review!

On 2018-08-28 06:14, Matthias Kaehlcke wrote:
> Hi Sibi,
> 
> Subject: dt-bindings: remoteproc: Remove additional definition tag
> 
> nit: the subject is a bit generic, you probably should at least add
> 'qcom: ' to the 'path'.
> 

Will add

> On Fri, Aug 24, 2018 at 06:48:57PM +0530, Sibi Sankar wrote:
>> Remove the additional definition tag declared for WCSS sub-system
>> under reset-names.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 601dd9f389aa..c45e4c131fa2 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -58,7 +58,7 @@ on the Qualcomm Hexagon core.
>>  	Usage: required
>>  	Value type: <stringlist>
>>  	Definition: must be "mss_restart" for the modem sub-system
>> -	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
>> +		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
>>  		    for the wcss syb-system
> 
> Since you are already at it you might also want to fix the typo in
> 'wcss syb-system'.
> 

nice catch, will correct it.

I missed your query in the other thread, APPS refers to the pdc_sync 
reset line for the Application processor.

> Other than the nits:
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
