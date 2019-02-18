Return-Path: <rohitkr@codeaurora.org>
Subject: Re: [PATCH 2/2] remoteproc: q6v5_adsp: Remove voting for lpass_aon
 clock
From: Rohit Kumar <rohitkr@codeaurora.org>
References: <1543562950-23997-1-git-send-email-rohitkr@codeaurora.org>
 <1543562950-23997-3-git-send-email-rohitkr@codeaurora.org>
 <f6f9b4a2-6205-0ba5-9a3a-b34bd814d303@codeaurora.org>
 <20190107071359.GK31596@builder>
 <214831ef-2139-7b48-1654-537634f898f4@codeaurora.org>
 <d90f7817-294e-a96e-0eb0-293a06e9190a@codeaurora.org>
Message-ID: <bca57260-6e1e-f808-afd4-2d6264e5c3f2@codeaurora.org>
Date: Mon, 18 Feb 2019 10:24:46 +0530
MIME-Version: 1.0
In-Reply-To: <d90f7817-294e-a96e-0eb0-293a06e9190a@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Bjorn,


On 1/30/2019 10:38 AM, Rohit Kumar wrote:
> Hello Bjorn,
>
> On 1/14/2019 4:14 PM, Rohit Kumar wrote:
>>
>> On 1/7/2019 12:43 PM, Bjorn Andersson wrote:
>>> On Thu 03 Jan 20:36 PST 2019, Rohit Kumar wrote:
>>>
>>>> Hello Bjorn,
>>>>
>>>> Can you please review this patch series too.
>>>>
>>>> LPASS_AON clock support is already removed from lpass clock driver.
>>>>
>>> Applied the two patches.
>>
Can you please apply these patches. I don't see them in next.
>>
> I did not see this in next yet. Can you please pick this up.
>
> Thanks,
>
> Rohit
>
>> Hello Bjorn,
>>
>>
>> Can you please point me to the tree where this is applied.
>>
>>
>> Thanks,
>>
>> Rohit
>>
>>> Thanks,
>>> Bjorn
>>>
>>>> Thanks,
>>>>
>>>> Rohit
>>>>
>>>> On 11/30/2018 12:59 PM, Rohit kumar wrote:
>>>>> Lpass_aon clock is on by default. Remove it from lpass
>>>>> clock list to avoid voting for it.
>>>>>
>>>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>>>> ---
>>>>>    drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c 
>>>>> b/drivers/remoteproc/qcom_q6v5_adsp.c
>>>>> index 79374d1..4829173 100644
>>>>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>>>>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>>>>> @@ -48,7 +48,7 @@
>>>>>    /* list of clocks required by ADSP PIL */
>>>>>    static const char * const adsp_clk_id[] = {
>>>>> -    "sway_cbcr", "lpass_aon", "lpass_ahbs_aon_cbcr", 
>>>>> "lpass_ahbm_aon_cbcr",
>>>>> +    "sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
>>>>>        "qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core",
>>>>>    };
>>>> -- 
>>>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a 
>>>> member
>>>> of the Code Aurora Forum, hosted by the Linux Foundation.
>>>>
Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.
