Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v7 4/4] remoteproc: qcom: Add support for mss remoteproc
 on msm8996
References: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
 <1500634173-24416-5-git-send-email-akdwived@codeaurora.org>
 <20171012182052.GG1165@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <a92e3adc-bcd9-fbe2-7a32-ae1752845740@codeaurora.org>
Date: Mon, 16 Oct 2017 18:49:43 +0530
MIME-Version: 1.0
In-Reply-To: <20171012182052.GG1165@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/12/2017 11:50 PM, Bjorn Andersson wrote:
> On Fri 21 Jul 03:49 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> This patch add support for mss boot on msm8996. Major changes
>> include initializing mss rproc for msm8996, making appropriate
>> change for executing mss reset sequence etc.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   1 +
>>   drivers/remoteproc/qcom_q6v5_pil.c                 | 164 ++++++++++++++++++---
>>   2 files changed, 141 insertions(+), 24 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 92347fe..87a8e51 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -11,6 +11,7 @@ on the Qualcomm Hexagon core.
>>   		    "qcom,msm8916-mss-pil",
>>   		    "qcom,msm8974-mss-pil"
>>   
>> +		    "qcom,msm8996-mss-pil"
> I like the empty line, but it should be after the list, not in the
> middle.
>
>>   - reg:
> Please fix this and add my Acked-by
Sure will do, just want to ask, when i am sending updated patches, 
should i sent all the 4 patches in series or should skip those which are 
acked by you.
>
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
