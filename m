Return-Path: <frowand.list@gmail.com>
Return-Path: <frowand.list@gmail.com>
Subject: Re: [PATCH v3] rpmsg: qcom_smd: Access APCS through mailbox framework
References: <20180420011757.22389-1-bjorn.andersson@linaro.org>
 <c6e2e87c-e2fd-c0ea-dbb9-5246b8694272@gmail.com>
 <20180831040701.GR2523@minitux>
 <e7af3589-dce5-2ea8-3ce0-258ced4a2302@gmail.com>
 <20180831205519.GS2523@minitux>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <d6bdaad6-05cb-6af8-b1d5-c454949628d3@gmail.com>
Date: Fri, 31 Aug 2018 14:34:22 -0700
MIME-Version: 1.0
In-Reply-To: <20180831205519.GS2523@minitux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 08/31/18 13:55, Bjorn Andersson wrote:
> On Fri 31 Aug 13:41 PDT 2018, Frank Rowand wrote:
> 
>> On 08/30/18 21:07, Bjorn Andersson wrote:
>>> On Thu 30 Aug 20:57 PDT 2018, Frank Rowand wrote:
>>>
>>>> Hi Bjorn,
>>>>
>>>>
>>>> On 04/19/18 18:17, Bjorn Andersson wrote:
>>>>> Attempt to acquire the APCS IPC through the mailbox framework and fall
>>>>> back to the old syscon based approach, to allow us to move away from
>>>>> using the syscon.
>>>>>
>>>>> Reviewed-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>> ---
>>>>>
>>>>> Changes since v2:
>>>>> - Added comment about mbox_send_message() return value.
>>>>>
>>>>>  .../devicetree/bindings/soc/qcom/qcom,smd.txt      |  8 ++-
>>>>>  drivers/rpmsg/Kconfig                              |  1 +
>>>>>  drivers/rpmsg/qcom_smd.c                           | 67 ++++++++++++++++------
>>>>>  3 files changed, 56 insertions(+), 20 deletions(-)
>>>>
>>>> This patch in the mainline Linux kernel as commit ab460a2e72dabecfdabd45eb7e3ee2d73fc876d4
>>>> causes a problem with the APQ8074 Dragonboard.  The mmc device is not set up
>>>> with the patch applied, thus I do not have the block device my root file system
>>>> is located on.
>>>>
>>>> Testing on v4.18, if I revert this commit the mmc device is available.
>>>>
>>>> I'll reply to this email with the console messages for 4.18 and for 4.18 with
>>>> this commit reverted.
>>>>
>>>
>>> The mmc device would fail to come up if the regulators didn't come up,
>>> which would be the result of smd not working. But it should fallback to
>>> the old mechanism if no mailbox is specified.
>>>
>>> Can you double check that CONFIG_RPMSG_QCOM_SMD is still set in your
>>> .config after applying and building with this commit included? And if
>>> not, try to enable CONFIG_MAILBOX.
>>
>> Thank you!
>>
>> That is indeed the cause.  ab460a2e72da added a "depends on MAILBOX" to
>> CONFIG_RPMSG_QCOM_SMD, so CONFIG_RPMSG_QCOM_SMD becomes unset since
>> CONFIG_MAILBOX is not enabled in qcom_defconfig and is not otherwise
>> selected for the dragonboard.
>>
> 
> Thanks for verifying this!
> 
>> Is there a config variable that should be selecting MAILBOX for a class
>> of systems that would include the APQ8074 Dragonboard?  For my testing
>> I added the "select MAILBOX" to CONFIG_ARCH_MSM8974, but I do not know
>> what systems that includes, and whether it is appropriate to do the
>> select for all of them.
>>
> 
> We typically don't use the CONFIG_ARCH_* to enable user selectable
> config options, even if they serve a critical role in the system.
> 
> So minimum change would be to add CONFIG_MAILBOX to the qcom_defconfig
> (and multi_v7_defconfig I presume). The fuller solution would be to add
> qcom,msm8974-apcs-kpss-global (.data is 8) to the qcom-apcs-ipc-mailbox
> list of compatibles and replace the syscon currently used, and then
> enable these in the defconfigs.

I would be happy with either solution.  Can I twist your arm to create
the patch?


> 
> Regards,
> Bjorn
> 
