Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom: Introduce Hexagon V5 based WCSS driver
References: <1528177361-8883-1-git-send-email-sricharan@codeaurora.org>
 <20180605061919.GQ16230@vkoul-mobl>
 <3a4c102b-7228-153a-c588-b1bf00291fa8@codeaurora.org>
 <20180606161733.GE510@tuxbook-pro> <20180607041134.GF16230@vkoul-mobl>
 <20180607042443.GK510@tuxbook-pro> <20180607084348.GG16230@vkoul-mobl>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <f5b05d4f-29d6-c698-3618-4ad6e42aef54@codeaurora.org>
Date: Thu, 7 Jun 2018 15:02:12 +0530
MIME-Version: 1.0
In-Reply-To: <20180607084348.GG16230@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Vinod <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Vinod,

On 6/7/2018 2:13 PM, Vinod wrote:
> On 06-06-18, 21:24, Bjorn Andersson wrote:
>> On Wed 06 Jun 21:11 PDT 2018, Vinod wrote:
>>
>>> So, wouldn't Kconfig syntax something like where we say:
>>>         M if RPMSG_QCOM_GLINK_SMEM=m
>>>         bool if RPMSG_QCOM_GLINK_SMEM=y
>>>
>>
>> If we ignore SMD for a while we have the following combinations:
>>
>> glink/wcss
>> y     y - valid
>> y     m - valid
>> y     n - valid
>> m     y - link failure (invalid)
>> m     m - valid
>> m     n - valid
>> n     y - valid (platform uses wcss, but not glink)
>> n     m - valid (-----"-----)
>> n     n - valid
>>
>> So to distill this we have the two valid cases:
>> module/no if RPMSG_QCOM_GLINK_SMEM=m
>> yes/module/no if RPMSG_QCOM_GLINK_SMEM=y
>>
>> and the way you express that in Kconfig is the somewhat awkward
>>
>>   depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> 
> Understood now :) Yes it is awkward..
> 
> Btw we seem to have issue with link fail here when glink is m and wcss
> is y. Why don't we see link fail for glink being n? Yes I understand that
> platform uses wcss but am curious how that works out :)
 
For glink being n, the stub functions gets linked, and not for glink=m.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
