Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 24 Sep 2018 17:32:21 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: Introduce Non-PAS ADSP PIL
 driver
In-Reply-To: <614ab0e7-b751-4bf9-72f9-33fdd57594ec@codeaurora.org>
References: <1535975560-8200-1-git-send-email-rohitkr@codeaurora.org>
 <1535975560-8200-3-git-send-email-rohitkr@codeaurora.org>
 <a93b3178a09584dc0b4bed55ca4816a3@codeaurora.org>
 <79bee282-e8a4-a1e6-56e3-6ea7e20c0233@codeaurora.org>
 <614ab0e7-b751-4bf9-72f9-33fdd57594ec@codeaurora.org>
Message-ID: <d1ae539b2d06d9c3185ec4a2b56d1e68@codeaurora.org>
To: Rohit Kumar <rohitkr@codeaurora.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2018-09-24 12:38, Rohit Kumar wrote:
> On 9/24/2018 12:19 PM, Rohit Kumar wrote:
>> Thanks Sibi for reviewing.
>> 
>> 
>> On 9/22/2018 1:11 AM, Sibi Sankar wrote:
>>> Hi Rohit,
>>> 
>>> On 2018-09-03 17:22, Rohit kumar wrote:
>>>> This adds Non PAS ADSP PIL driver for Qualcomm
>>>> Technologies Inc SoCs.
>>>> Added initial support for SDM845 with ADSP bootup and
>>>> shutdown operation handled from Application Processor
>>>> SubSystem(APSS).
>>>> 
>>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>>> ---
>>> ....
> ...
>>> ....
>>> Also I see the following warns on stopping the adsp remoteproc, 
>>> couldn't root cause it though:
>> 
>> It should be issue in Q6 drivers. I will check and update q6 drivers. 
>> Thanks for reporting.
>> 
> 
> Checked this warning. This is a core driver issue fixed with
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/base/core.c?h=next-20180924&id=2ec16150179888b81717d1d3ce84e634f4736af2
> 

Thanks for pointing this out.

>>>  device_del+0x84/0x29c
>>>  platform_device_del+0x2c/0x88
>>>  platform_device_unregister+0x1c/0x30
>>>  of_platform_device_destroy+0x98/0xa8
>>>  device_for_each_child+0x54/0xa4
>>>  of_platform_depopulate+0x38/0x54
>>>  q6asm_remove+0x1c/0x2c
>>>  apr_device_remove+0x38/0x70
>>>  device_release_driver_internal+0x124/0x1c8
>>>  device_release_driver+0x24/0x30
>>>  bus_remove_device+0xcc/0xe4
>>>  device_del+0x1f8/0x29c
>>>  device_unregister+0x1c/0x30
>>>  apr_remove_device+0x1c/0x2c
>>>  device_for_each_child+0x54/0xa4
>>>  apr_remove+0x28/0x34
>>>  rpmsg_dev_remove+0x48/0x70
>>>  device_release_driver_internal+0x124/0x1c8
>>>  device_release_driver+0x24/0x30
>>>  bus_remove_device+0xcc/0xe4
>>>  device_del+0x1f8/0x29c
>>>  device_unregister+0x1c/0x30
>>>  qcom_glink_remove_device+0x1c/0x2c
>>>  device_for_each_child+0x54/0xa4
>>>  qcom_glink_native_remove+0x54/0x15c
>>>  qcom_glink_smem_unregister+0x1c/0x30
>>>  glink_subdev_stop+0x1c/0x2c [qcom_common]
>>>  rproc_stop+0x40/0xc0
>>>  rproc_shutdown+0x6c/0xc0
>>>  rproc_del+0x28/0xa0
>>>  adsp_remove+0x20/0x5c [qcom_adsp_pil]
>>>  platform_drv_remove+0x28/0x50
>>>  device_release_driver_internal+0x124/0x1c8
>>>  driver_detach+0x44/0x80
>>>  bus_remove_driver+0x78/0x9c
>>>  driver_unregister+0x34/0x54
>>>  platform_driver_unregister+0x1c/0x28
>>>  cleanup_module+0x14/0x6bc [qcom_adsp_pil]
>>>  SyS_delete_module+0x1c4/0x214
>>> 
>> 
>> Thanks,
>> Rohit
> Thanks

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
