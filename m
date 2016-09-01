Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160823173259.GA13327@rob-hp-laptop>
 <fbf25a9e-348b-9047-37ef-1b96808dea31@mm-sol.com>
 <20160825000521.GH15161@tuxbot>
 <3429173a-d55a-51e1-0973-7e5bd31be297@linaro.org>
 <20160826222345.GK15161@tuxbot>
 <5afd7f2f-ec1b-d2ce-b833-81df010e24de@linaro.org>
 <20160830171742.GN15161@tuxbot>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b7314a89-2215-4961-6e8a-be5ef536624a@linaro.org>
Date: Thu, 1 Sep 2016 17:58:17 +0300
MIME-Version: 1.0
In-Reply-To: <20160830171742.GN15161@tuxbot>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

Cc: Marek

On 08/30/2016 08:17 PM, Bjorn Andersson wrote:
> On Mon 29 Aug 04:48 PDT 2016, Stanimir Varbanov wrote:
> 
> [..]
>>> Trying to wrap my head around how the iommu part works here. The
>>> downstream code seems to indicate that this is a "generic" secure iommu
>>> interface - used by venus, camera and kgsl; likely for dealing with DRM
>>> protected buffers.
>>
>> The secure iommu interface is for content protected buffers. But these
>> secure iommu contexts aren't used by msm DRM nor Venus in mainline. In
>> Venus case I use non-secure iommu context for data buffers.
>>
> 
> We must consider the case when DRM, VFE and Venus handles protected
> buffers.

That would be interesting topic.

> 
>>>
>>> As such the iommu tables are not part of the venus rproc; I believe they
>>> should either be tied into the msm-iommu driver or perhaps exposed as
>>> its own iommu(?).
>>
>> The page tables are in msm-iommu driver.
>>
> 
> So, just to verify your answer, the msm-iommu driver will handle both
> protected and unprotected?

yes, at least for Venus case, the secured buffers are tied to different
iommu contexts (and stream IDs). But this needs to be verified more
carefully.

> 
>>>
>>>
>>> But I presume from your inclusion that you've concluded that the venus
>>> firmware we have refuses to execute without these tables at least
>>> initialized, is this correct?
>>
>> Yes, the SMC call for PAS memory-setup will fail if this page table is
>> not initialized.
>>
> 
> If the msm-iommu driver will handle the protected buffers (or if there
> will be a separate iommu driver for protected buffers) it should issue
> these calls, to not be dependant on the rproc-venus driver.

For msm8916 we don't have iommu driver in mainline, I don't know what is
the status with msm8996.

> 
> With that I think we should make the rproc-venus driver depend on this
> being setup (even if this means creating a "dummy" driver for the
> protected iommu handling for now).

This sounds scary :)

> 
>>>
>>>>>
>>>>>> The address is not really fixed, cause the firmware could support
>>>>>> relocation. In this example I just picked up the next free memory region
>>>>>> in memory-reserved from msm8916.dtsi.
>>>>>>
>>>>>
>>>>> In 8974 we do have a physical region where it's expected to be loaded.
>>>>>
>>>>> So in line with upcoming remoteproc work we should support referencing a
>>>>> reserved-memory node with either reg or size.
>>>>>
>>>>> In the case of spotting a "reg" we're currently better off using
>>>>> ioremap. We're looking at getting the remoteproc core to deal with this
>>>>> mess.
>>>>
>>>> You mean that remoteproc core will parse memory-region property?
>>>>
>>>
>>> It has to, because it's a quite common scenario for remoteproc drivers
>>> to either get its backing memory from a static region or be restricted
>>> to part of system ram - properties that reserved-memory and
>>> memory-region captures already.
>>
>> OK, I have no issues with that. My concern is the manual parsing of
>> 'memory-region' and 'reg' properties in remoteproc core.
>>
>> So that idea is to have generic binding for rproc, that would be good.
>>
> 
> I do share your concerns here. But it's a recurring issue with
> remoteproc drivers.
> 
> [..]
>>> But I presume we have the implementation issue of dma_alloc_coherent()
>>> failing in either case with the 5MB size. I think we need to look into
>>
>> I'd be good to include Marek Szyprowski? At least he will know what
>> design restrictions there are.
>>
> 
> Please do. The more I look at this the more I think we must use the
> existing infrastructure for allocating "dma memory". Getting
> dma_alloc_coherent() supporting non-power-of-2 memory regions would

Just to be precise it should be dma_alloc_from_coherent().

Marek, what is your opinion on that, can we make dma_alloc_from_coherent
able to allocate memory for sizes with bigger granularity.

For your convenience here [1] is the mail thread.

> allow us to use the existing infrastructure, for both fixed and
> dynamically placed memory carveouts in remoteproc.

[1] https://lkml.org/lkml/2016/8/19/570

-- 
regards,
Stan
