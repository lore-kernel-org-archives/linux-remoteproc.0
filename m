Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 26 Aug 2016 15:23:45 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
Message-ID: <20160826222345.GK15161@tuxbot>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160823173259.GA13327@rob-hp-laptop>
 <fbf25a9e-348b-9047-37ef-1b96808dea31@mm-sol.com>
 <20160825000521.GH15161@tuxbot>
 <3429173a-d55a-51e1-0973-7e5bd31be297@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3429173a-d55a-51e1-0973-7e5bd31be297@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 25 Aug 04:10 PDT 2016, Stanimir Varbanov wrote:

> Hi Bjorn,
> 
> On 08/25/2016 03:05 AM, Bjorn Andersson wrote:
> > On Wed 24 Aug 08:36 PDT 2016, Stanimir Varbanov wrote:
> > 
> >> Hi Rob,
> >>
> >> On 08/23/2016 08:32 PM, Rob Herring wrote:
> >>> On Fri, Aug 19, 2016 at 06:53:19PM +0300, Stanimir Varbanov wrote:
> >>>> Add devicetree binding document for Venus remote processor.
> >>>>
> >>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>>> ---
> >>>>  .../devicetree/bindings/remoteproc/qcom,venus.txt  | 33 ++++++++++++++++++++++
> >>>>  1 file changed, 33 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> >>>> new file mode 100644
> >>>> index 000000000000..06a2db60fa38
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> >>>> @@ -0,0 +1,33 @@
> >>>> +Qualcomm Venus Peripheral Image Loader
> >>>> +
> >>>> +This document defines the binding for a component that loads and boots firmware
> >>>> +on the Qualcomm Venus remote processor core.
> >>>
> >>> This does not make sense to me. Venus is the video encoder/decoder h/w, 
> >>> right? Why is the firmware loader separate from the codec block? Why 
> >>> rproc is used? Are there multiple clients? Naming it rproc_venus implies 
> >>> there aren't. And why does the firmware loading need 8MB of memory at a 
> >>> fixed address?
> >>>
> >>
> >> The firmware for Venus case is 5MB. And here is 8MB because of
> >> dma_alloc_from_coherent size restriction.
> >>
> > 
> > Then you should specify it 5MB large and we'll have to deal with this
> > implementation issue in the code. I've created a JIRA ticket for
> > the dma_alloc_from_coherent() behavior.
> 
> Infact it should be 5MB + ~100KB for iommu page table.
> 

Trying to wrap my head around how the iommu part works here. The
downstream code seems to indicate that this is a "generic" secure iommu
interface - used by venus, camera and kgsl; likely for dealing with DRM
protected buffers.

As such the iommu tables are not part of the venus rproc; I believe they
should either be tied into the msm-iommu driver or perhaps exposed as
its own iommu(?).


But I presume from your inclusion that you've concluded that the venus
firmware we have refuses to execute without these tables at least
initialized, is this correct?

> > 
> >> The address is not really fixed, cause the firmware could support
> >> relocation. In this example I just picked up the next free memory region
> >> in memory-reserved from msm8916.dtsi.
> >>
> > 
> > In 8974 we do have a physical region where it's expected to be loaded.
> > 
> > So in line with upcoming remoteproc work we should support referencing a
> > reserved-memory node with either reg or size.
> > 
> > In the case of spotting a "reg" we're currently better off using
> > ioremap. We're looking at getting the remoteproc core to deal with this
> > mess.
> 
> You mean that remoteproc core will parse memory-region property?
> 

It has to, because it's a quite common scenario for remoteproc drivers
to either get its backing memory from a static region or be restricted
to part of system ram - properties that reserved-memory and
memory-region captures already.

> > 
> > 
> > So, on 8916 I think you should use the form:
> > 
> > venus_mem: venus {
> > 	size = <0x500000>;
> > };
> 
> Don't forget that the physical address where the firmware is stored has
> some range, the scm call will fail if it is out of the expected range,
> probably because of some security reasons. So maybe alloc-ranges should
> be specified here.
> 

Thanks for highlighting this.

> > 
> > And I don't think you should use the shared-dma-pool compatible, because
> > this is not a region for multiple devices to allocate dma memory out of.
> 
> Then I cannot reuse reserved-mem infrastructure.
> 

You're right. If I understand the code correctly we need to use the
compatible shared-dma-pool and mark it either "no-map" or "reusable", to
be able to use dma_alloc_coherent().


But I presume we have the implementation issue of dma_alloc_coherent()
failing in either case with the 5MB size. I think we need to look into
that - and have created a JIRA ticket for it.

Regards,
Bjorn
