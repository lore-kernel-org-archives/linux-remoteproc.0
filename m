Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
Subject: Re: [PATCH v3 2/3] dt-bindings: soc: qcom: apr: Add protection domain
 bindings
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-3-sibis@codeaurora.org> <20200131143436.GA14822@bogus>
From: Sibi Sankar <sibis@codeaurora.org>
Message-ID: <d94fa6ad-c5f9-fa5a-6a23-0bf773f105da@codeaurora.org>
Date: Sat, 1 Feb 2020 19:14:37 +0530
MIME-Version: 1.0
In-Reply-To: <20200131143436.GA14822@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Rob,
Thanks for the review!

On 1/31/20 8:04 PM, Rob Herring wrote:
> On Mon, Dec 30, 2019 at 10:30:07AM +0530, Sibi Sankar wrote:
>> Add optional "qcom,protection-domain" bindings for APR services. This
>> helps to capture the dependencies between APR services and the PD on
>> which each apr service run.
> 
> This is meaningless to me...

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. Add "qcom,protection-domain" bindings to capture the dependencies
between the APR service and the PD on which the apr service runs.

Is ^^ better?

> 
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
> How many strings can there be and can you enumerate the possible
> strings?

https://lore.kernel.org/lkml/a19623d4-ab33-d87e-5925-d0411d7479dd@codeaurora.org/

Like I explained in ^^ avs/audio is the only service
that the apr device depends on and is known to run only
in "msm/adsp/audio_pd" service path.

However there are other service:service_path pairs
which will get documented when I add support for more
clients like fastrpc and ath10k.

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
> 
> Perhaps an example where not everything is the same. The example shows
> me this isn't needed in DT.

yes will update the example.

> 
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
