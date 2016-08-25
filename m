Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 24 Aug 2016 17:05:21 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
Message-ID: <20160825000521.GH15161@tuxbot>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160823173259.GA13327@rob-hp-laptop>
 <fbf25a9e-348b-9047-37ef-1b96808dea31@mm-sol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbf25a9e-348b-9047-37ef-1b96808dea31@mm-sol.com>
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Rob Herring <robh@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 24 Aug 08:36 PDT 2016, Stanimir Varbanov wrote:

> Hi Rob,
> 
> On 08/23/2016 08:32 PM, Rob Herring wrote:
> > On Fri, Aug 19, 2016 at 06:53:19PM +0300, Stanimir Varbanov wrote:
> >> Add devicetree binding document for Venus remote processor.
> >>
> >> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >> ---
> >>  .../devicetree/bindings/remoteproc/qcom,venus.txt  | 33 ++++++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> >> new file mode 100644
> >> index 000000000000..06a2db60fa38
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> >> @@ -0,0 +1,33 @@
> >> +Qualcomm Venus Peripheral Image Loader
> >> +
> >> +This document defines the binding for a component that loads and boots firmware
> >> +on the Qualcomm Venus remote processor core.
> > 
> > This does not make sense to me. Venus is the video encoder/decoder h/w, 
> > right? Why is the firmware loader separate from the codec block? Why 
> > rproc is used? Are there multiple clients? Naming it rproc_venus implies 
> > there aren't. And why does the firmware loading need 8MB of memory at a 
> > fixed address?
> > 
> 
> The firmware for Venus case is 5MB. And here is 8MB because of
> dma_alloc_from_coherent size restriction.
> 

Then you should specify it 5MB large and we'll have to deal with this
implementation issue in the code. I've created a JIRA ticket for
the dma_alloc_from_coherent() behavior.

> The address is not really fixed, cause the firmware could support
> relocation. In this example I just picked up the next free memory region
> in memory-reserved from msm8916.dtsi.
> 

In 8974 we do have a physical region where it's expected to be loaded.

So in line with upcoming remoteproc work we should support referencing a
reserved-memory node with either reg or size.

In the case of spotting a "reg" we're currently better off using
ioremap. We're looking at getting the remoteproc core to deal with this
mess.


So, on 8916 I think you should use the form:

venus_mem: venus {
	size = <0x500000>;
};

And I don't think you should use the shared-dma-pool compatible, because
this is not a region for multiple devices to allocate dma memory out of.


Regards,
Bjorn
