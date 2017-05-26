Return-Path: <sricharan@codeaurora.org>
Subject: Re: [RESEND: PATCH v4 2/4] remoteproc: qcom: refactor mss fw image
 loading sequence
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-3-git-send-email-akdwived@codeaurora.org>
 <22b47349-9fe1-6d2d-d973-95bae7d5e5fb@codeaurora.org>
 <f80a71a3-843f-277b-8bd6-d7dd07fdaebc@codeaurora.org>
 <454a78d7-99e0-eddc-72c9-97c2aeba4015@codeaurora.org>
 <fa6eaf74-89c9-55ab-24f6-aba68d7e60c6@codeaurora.org>
 <20170525190317.GD12920@tuxbook>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <18401499-7617-189d-c144-82b753feb567@codeaurora.org>
Date: Fri, 26 May 2017 10:30:58 +0530
MIME-Version: 1.0
In-Reply-To: <20170525190317.GD12920@tuxbook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 5/26/2017 12:33 AM, Bjorn Andersson wrote:
> On Mon 22 May 06:26 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:
>> On 5/22/2017 4:07 PM, Sricharan R wrote:
>>> Hi,
>>>
>>> On 5/22/2017 3:03 PM, Dwivedi, Avaneesh Kumar (avani) wrote:
>>>>
>>>> On 5/20/2017 8:25 AM, Sricharan R wrote:
>>>>> Hi Bjorn/Avaneesh,
>>>>>
>>>>> On 5/16/2017 11:32 PM, Avaneesh Kumar Dwivedi wrote:
> [..]
>>>>>> -
>>>>>> -        size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>>>>>> -        if (!size) {
>>>>>> -            boot_addr = relocate ? qproc->mpss_phys : min_addr;
>>>>>> -            writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
>>>>>> -            writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>>>>>> -        }
>>>>>> -
>>>>>>            size += phdr->p_memsz;
>>>>>> -        writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>>>>>>        }
>>>>> So while moving this down, can we use qcom_mdt_load instead for
>>>>> the mpss image loading part above ?
>>>> qcom_mdt_load() can not be used to load segments for mpss, as MPSS
>>>> blobs are self authenticated.  while qcom_mdt_load() is used in
>>>> cases where authentication of loaded blobs is done by trustzone.
>>>> for that qcom_mdt_load() does extra steps to send pas_id to
>>>> trustzone and mem_setup() etc.
>>> Right, so my intention of asking this was if the code which does the
>>> calculation and loads the segments in qcom_mdt_load can somehow be
>>> abstracted out, so that future self authenticating rproc (even mpss
>>> in this case) can use them to load mdt ?
>> As i understand, you want to replace the piece of code which does
>> parse mdt and load individual firmware blobs in a separate routine.
>> So that it can be called by any one without again doing parsing and
>> loading for self authentication.?  Till now only MPSS does rely on
>> self authentication, all other subsystems use qcom_mdt_load().  I
>> think this is reason why the qcom_mdt_load() equivalent routine has
>> not been used.  Bjorn may further add in this.
> 
> I have not been able to come up with a clean way to provide a useful
> mdt-loader abstraction that works for the SCM PILs, the
> self-authenticated PILs and the non-PIL SCM users.
> 
> Further more with the upcoming ramdump support we will need to extract
> segment information from the mdt header, so we will have to revisit this
> topic.
> 
> 
> Regardless, I would prefer that we follow up with such refactoring after
> getting this series sorted out.
> 

ok, agree.  While trying to add Q6 support for ipq8074, which is again
a self-authenticating PIL with mdt, i can try this.

>>>
>>>>>> +    /* Transfer ownership of modem region with modem fw */
>>>>>> +    boot_addr = relocate ? qproc->mpss_phys : min_addr;
>>>>>> +    writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
>>>>>> +    writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>>>>>> +    writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>>>>> For ipq8074 [1], wcnss core has an Q6V5 version of the ip for
>>>>> which the initialization/boot sequence is pretty much the same
>>>>> as that has been added for msm8996 in this series. So wanted to
>>>>> understand if its better to use this remoteproc itself by
>>>>> keeping the Q6 and mpss parts separately (or) add a new
>>>>> remoteproc ?
>>>> Bjorn can better answer this query, but i believe this remoteproc
>>>> can be extended to load mpss part by adding private initialization
>>>> for the IP.
>>> ya, the mpss part can be separated out, so that this can be a Q6 +
>>> MPSS (or) Q6 + WCNSS remoteproc. Was asking this to get the right
>>> way for adding the Q6 + WCNSS remoteproc, as the Q6 part is same
>>> what you have added for msm8996.
>> Again, i believe yes but leave Bjorn to make final comment.
> 
> It definitely sounds like there's room for reuse here, how much of the
> initialization and authentication sequences are common between the two?

The initialization sequence is exactly the same as what was done for
msm8996(Q6) one added in this series. So for reusing this driver for Q6,
the Q6 + MPSS has to be decoupled and driver has to look common for
Q6 + any, (ie) Q6 + mpss (or) Q6 + wcnss. Incase if that's not neat,
atleast the Q6 initialization sequence can be reused.

Regards,
 Sricharan

> 
> Regards,
> Bjorn
> 

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
