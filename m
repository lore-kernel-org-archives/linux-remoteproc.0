Return-Path: <rohitkr@codeaurora.org>
Subject: Re: [PATCH v2] remoteproc: qcom: Introduce Non-PAS ADSP PIL driver
References: <1530264053-8394-1-git-send-email-rohitkr@codeaurora.org>
 <20180706203236.GA24729@rob-hp-laptop>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <43dcb60b-720f-27ab-3696-dbf0fe0b65fc@codeaurora.org>
Date: Mon, 9 Jul 2018 11:29:51 +0530
MIME-Version: 1.0
In-Reply-To: <20180706203236.GA24729@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bgoswami@codeaurora.org, sbpata@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Thanks Rob for reviewing.


On 7/7/2018 2:02 AM, Rob Herring wrote:
> On Fri, Jun 29, 2018 at 02:50:53PM +0530, Rohit kumar wrote:
>> This adds APSS based ADSP PIL driver for QCOM SoCs.
>> Added initial support for SDM845 with ADSP bootup and
>> shutdown operation handled from Application Processor
>> SubSystem(APSS).
>>
>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>> ---
>> Changes since v1:
>> - Used APIs from qcom_q6v5.c
>> - Use clock, reset and regmap driver APIs instead of
>>    directly writing into the LPASS registers.
>> - Created new file for non PAS ADSP PIL instead of extending
>>    existing ADSP PIL driver.
>> - cleanups as suggested by Bjorn and Rob.
>>
>>   .../bindings/remoteproc/qcom,non-pas-adsp.txt      | 138 +++++
> This should be a separate patch.

Ok. Will separate it in next spin.
>>   drivers/remoteproc/Kconfig                         |  18 +
>>   drivers/remoteproc/Makefile                        |   1 +
>>   drivers/remoteproc/qcom_nonpas_adsp_pil.c          | 667 +++++++++++++++++++++
>>   4 files changed, 824 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt
>>   create mode 100644 drivers/remoteproc/qcom_nonpas_adsp_pil.c
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt
>> new file mode 100644
>> index 0000000..0581aaa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt
>> @@ -0,0 +1,138 @@
>> +Qualcomm Technology Inc. Non PAS ADSP Peripheral Image Loader
>> +
>> +This document defines the binding for a component that loads and boots firmware
>> +on the Qualcomm Technology Inc. ADSP Hexagon core.
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: must be one of:
>> +		    "qcom,sdm845-apss-adsp-pil"
> Didn't Bjorn say to drop the 'apss' part?

Yes, he had asked to rename compatible string for  existing PIL driver 
as "qcom,platform-subsystem-pas"
and non-pas pil driver as "qcom,platform-subsystem-pil". I wanted to get 
confirmation from Bjorn whether
we should rename the filename too.
@Bjorn, can you please suggest filename and compatible strings for the 
two drivers.
>> +
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: must specify the base address and size of the qdsp6ss
>> +
>> +- reg-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "qdsp6ss"
>> +
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks,
Rohit

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
