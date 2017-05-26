Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RESEND: PATCH v4 4/4] remoteproc: qcom: Add support for mss boot
 on msm8996
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-5-git-send-email-akdwived@codeaurora.org>
 <20170526060928.GH12920@tuxbook>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <b0844c16-cabf-b84c-48a1-a119e53c8dac@codeaurora.org>
Date: Fri, 26 May 2017 18:50:27 +0530
MIME-Version: 1.0
In-Reply-To: <20170526060928.GH12920@tuxbook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 5/26/2017 11:39 AM, Bjorn Andersson wrote:
> On Tue 16 May 11:02 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 92347fe..f9dfb6c 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -9,8 +9,8 @@ on the Qualcomm Hexagon core.
>>   	Definition: must be one of:
>>   		    "qcom,q6v5-pil",
>>   		    "qcom,msm8916-mss-pil",
>> -		    "qcom,msm8974-mss-pil"
>> -
>> +		    "qcom,msm8974-mss-pil",
>> +		"qcom,msm8996-mss-pil"
> Indentation please.
OK.
>
>>   - reg:
>>   	Usage: required
>>   	Value type: <prop-encoded-array>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> [..]
>> +/* QDSP6v56 parameters */
>> +#define QDSP6v56_LDO_BYP		BIT(25)
>> +#define QDSP6v56_BHS_ON		BIT(24)
>> +#define QDSP6v56_CLAMP_WL		BIT(21)
>> +#define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
>> +#define HALT_CHECK_MAX_LOOPS		200
>> +#define QDSP6SS_XO_CBCR		0x0038
>> +#define QDSP6SS_ACC_OVERRIDE_VAL		0x20
> Please keep the blank line between the defines and the struct
> definition.
OK.
>
>>   struct reg_info {
>>   	struct regulator *reg;
>>   	int uV;
> [..]
>>   
>> +static const struct rproc_hexagon_res msm8996_mss = {
>> +	.hexagon_mba_image = "mba.mbn",
>> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
>> +			{}
>> +	},
>> +	.active_supply = (struct qcom_mss_reg_res[]) {
>> +			{},
>> +			{}
>> +	},
> It's possible to just leave .proxy_supply and .active_supply out (i.e.
> leaving them as NULL), as I made q6v5_regulator_init() handle this
> gracefully a while back.
OK.
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
