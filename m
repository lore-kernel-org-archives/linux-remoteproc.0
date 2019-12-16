Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: apr: Add protection domain
 bindings
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9c591-d04928e8-6440-488c-a956-3b5c9b8988bf-000000@us-west-2.amazonses.com>
 <20191203215248.GA1688@bogus>
From: Sibi Sankar <sibis@codeaurora.org>
Message-ID: <a19623d4-ab33-d87e-5925-d0411d7479dd@codeaurora.org>
Date: Mon, 16 Dec 2019 23:16:10 +0530
MIME-Version: 1.0
In-Reply-To: <20191203215248.GA1688@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Rob,
Thanks for the review :)

On 12/4/19 3:22 AM, Rob Herring wrote:
> On Mon, Nov 18, 2019 at 02:28:00PM +0000, Sibi Sankar wrote:
>> Add optional "qcom,protection-domain" bindings for APR services. This
>> helps to capture the dependencies between APR services and the PD on
>> which each apr service run.
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,apr.txt | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> index db501269f47b8..f87c0b2a48de4 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> @@ -45,6 +45,12 @@ by the individual bindings for the specific service
>>   			12 - Ultrasound stream manager.
>>   			13 - Listen stream manager.
>>   
>> +- qcom,protection-domain
>> +	Usage: optional
>> +	Value type: <stringlist>
>> +	Definition: Must list the protection domain service name and path
>> +		    that the particular apr service has a dependency on.
> 
> Is name and path 2 values? Length is always 2?

Yes the length is always 2 values i.e service name and the path where
the service is hosted.

> 
> You've got the same values for every case in the example. Is there a
> defined list of possible values?

apr bus is expected to track just the "avs/audio" running on
msm/adsp/audio_pd on msm8998 and sdm845 SoCs. So shouldn't
make much sense to list all possible service names:paths here.

However the qcom,protection-domain is expected to be used
on fastrpc compute bank nodes as well, where they track other
services:paths. I'll make sure to include all the possible
values that fastrpc cb nodes depend on.

> 
>> +
>>   = EXAMPLE
>>   The following example represents a QDSP based sound card on a MSM8996 device
>>   which uses apr as communication between Apps and QDSP.
>> @@ -82,3 +88,56 @@ which uses apr as communication between Apps and QDSP.
>>   			...
>>   		};
>>   	};
>> +
>> += EXAMPLE 2
>> +The following example represents a QDSP based sound card on SDM845 device.
>> +Here the apr services are dependent on "avs/audio" service running on AUDIO
>> +Protection Domain hosted on ADSP remote processor.
>> +
>> +	apr {
>> +		compatible = "qcom,apr-v2";
>> +		qcom,glink-channels = "apr_audio_svc";
>> +		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>> +
>> +		q6core {
>> +			compatible = "qcom,q6core";
>> +			reg = <APR_SVC_ADSP_CORE>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +		};
>> +
>> +		q6afe: q6afe {
>> +			compatible = "qcom,q6afe";
>> +			reg = <APR_SVC_AFE>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +			q6afedai: dais {
>> +				compatible = "qcom,q6afe-dais";
>> +				#sound-dai-cells = <1>;
>> +
>> +				qi2s@22 {
>> +					reg = <22>;
>> +					qcom,sd-lines = <3>;
>> +				};
>> +			};
>> +		};
>> +
>> +		q6asm: q6asm {
>> +			compatible = "qcom,q6asm";
>> +			reg = <APR_SVC_ASM>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +			q6asmdai: dais {
>> +				compatible = "qcom,q6asm-dais";
>> +				#sound-dai-cells = <1>;
>> +				iommus = <&apps_smmu 0x1821 0x0>;
>> +			};
>> +		};
>> +
>> +		q6adm: q6adm {
>> +			compatible = "qcom,q6adm";
>> +			reg = <APR_SVC_ADM>;
>> +			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +			q6routing: routing {
>> +				compatible = "qcom,q6adm-routing";
>> +				#sound-dai-cells = <0>;
>> +			};
>> +		};
>> +	};
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
