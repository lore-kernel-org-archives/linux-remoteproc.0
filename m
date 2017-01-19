Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RFC 1/3] remoteproc: qcom: Introduce Qualcomm low pass sensor
 peripheral loader.
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
 <1484229217-23364-2-git-send-email-akdwived@codeaurora.org>
 <3ca26853-af4b-16d7-2149-700960234a15@codeaurora.org>
 <56fc8273-3319-06e3-c474-cf6abdc7c12c@codeaurora.org>
 <20170118233450.GW10531@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <cf3cd7b4-7422-a6c1-eff0-528f2cb039ac@codeaurora.org>
Date: Thu, 19 Jan 2017 10:30:42 +0530
MIME-Version: 1.0
In-Reply-To: <20170118233450.GW10531@minitux>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 1/19/2017 5:04 AM, Bjorn Andersson wrote:
> On Sun 15 Jan 21:15 PST 2017, Dwivedi, Avaneesh Kumar (avani) wrote:
>
>>
>> On 1/13/2017 2:11 AM, Sarangdhar Joshi wrote:
>>> Hi Avaneesh,
>>>
>>> On 01/12/2017 05:53 AM, Avaneesh Kumar Dwivedi wrote:
>>>> This patch is to load and boot slpi core on Qualcomm plateforms. It is
>>>> used for loading the firmware images of the subsystems into memory
>>>> and preparing the subsystem's processor to execute code.
>>> Can't we modify qcom_adsp_pil.c to use SLPI as well?
>> clocks, regulators, PAS_ID, firmware name, crash reason smem id these are
>> few driver specific resource/variable, if it is ok to initialize these
>> variables  based on compatible string, i think we can have single driver for
>> adsp and slpi. let me know your further comment.
> I would prefer this too.
>
> The only thing that stands out is that you're not allowed to
> regulator_set_voltage(5), because that's not how we will do corners
> upstream - which tells us that we need to get corner voltages sorted
> out.
>
>
> I'm still undecided on aggre2_noc being handled in this driver or in a
> aggre2_noc bus surrounding the device, but that's a smaller issue than
> the corners.
>
> Regardless of these two issues we want a common adsp + slpi driver, so
> please submit a patch where you add the slpi support to the existing
> adsp driver.
OK, sure today i will try to submitt this.
but i need your comments on two things.
1- if we are going to have single driver, can we rename also this common 
driver so that it doesnt sound like only loading and booting adsp.
2- this was(using regulator API to enable supply) what even i was 
hesitant to submit slpi driver, so any comment on? how to go till time 
we dont have alternative?
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
