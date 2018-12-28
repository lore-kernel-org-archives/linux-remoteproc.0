Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 Dec 2018 10:17:28 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add firmware bindings
 for Q6V5 MSS
In-Reply-To: <20181220201002.GA8831@bogus>
References: <20181212124456.3164-1-sibis@codeaurora.org>
 <20181212124456.3164-2-sibis@codeaurora.org> <20181220201002.GA8831@bogus>
Message-ID: <bbae159b2349b7681f922d46d02305db@codeaurora.org>
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, david.brown@linaro.org, mark.rutland@arm.com, andy.gross@linaro.org, briannorris@chromium.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,
Thanks for the review :)

On 2018-12-21 01:40, Rob Herring wrote:
> On Wed, Dec 12, 2018 at 06:14:55PM +0530, Sibi Sankar wrote:
>> Add optional firmware bindings for Q6V5 MSS. It lists the two relative
>> firmware paths which are used for booting and authenticating the 
>> Hexagon
>> core.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 7 
>> +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 9ff5b0309417..1f6988a60636 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -36,6 +36,13 @@ on the Qualcomm Hexagon core.
>>  	Value type: <stringlist>
>>  	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
>> 
>> +- qcom,firmware:
> 
> We already have a standard name 'firmware-name'. Use that. I'm fine 
> with
> allowing it to be more than 1 string.

sure will replace "qcom,firmware" with "firmware-name" in the next 
re-spin

> 
>> +	Usage: optional
>> +	Value type: <stringlist>
>> +	Definition: must list the 2 relative firmware paths (mba and modem
>> +		    metadata respectively) which are used for booting and
>> +		    authenticating the Hexagon core.
>> +
>>  - clocks:
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
