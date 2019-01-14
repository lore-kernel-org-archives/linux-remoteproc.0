Return-Path: <rohitkr@codeaurora.org>
Subject: Re: [PATCH 2/2] remoteproc: q6v5_adsp: Remove voting for lpass_aon
 clock
References: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
 <1543562950-23997-3-git-send-email-rohitkr@codeaurora.org>
 <f6f9b4a2-6205-0ba5-9a3a-b34bd814d303@codeaurora.org>
 <20190107071359.GK31596@builder>
From: Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <214831ef-2139-7b48-1654-537634f898f4@codeaurora.org>
Date: Mon, 14 Jan 2019 16:14:37 +0530
MIME-Version: 1.0
In-Reply-To: <20190107071359.GK31596@builder>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 1/7/2019 12:43 PM, Bjorn Andersson wrote:
> On Thu 03 Jan 20:36 PST 2019, Rohit Kumar wrote:
>
>> Hello Bjorn,
>>
>> Can you please review this patch series too.
>>
>> LPASS_AON clock support is already removed from lpass clock driver.
>>
> Applied the two patches.

Hello Bjorn,


Can you please point me to the tree where this is applied.


Thanks,

Rohit

> Thanks,
> Bjorn
>
>> Thanks,
>>
>> Rohit
>>
>> On 11/30/2018 12:59 PM, Rohit kumar wrote:
>>> Lpass_aon clock is on by default. Remove it from lpass
>>> clock list to avoid voting for it.
>>>
>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>> ---
>>>    drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
>>> index 79374d1..4829173 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>>> @@ -48,7 +48,7 @@
>>>    /* list of clocks required by ADSP PIL */
>>>    static const char * const adsp_clk_id[] = {
>>> -	"sway_cbcr", "lpass_aon", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
>>> +	"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
>>>    	"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core",
>>>    };
>> -- 
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the Linux Foundation.
>>
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.
