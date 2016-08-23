Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 23 Aug 2016 11:21:57 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
Message-ID: <20160823182157.GC15161@tuxbot>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160823173259.GA13327@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160823173259.GA13327@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 23 Aug 10:32 PDT 2016, Rob Herring wrote:

> On Fri, Aug 19, 2016 at 06:53:19PM +0300, Stanimir Varbanov wrote:
> > Add devicetree binding document for Venus remote processor.
> > 
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >  .../devicetree/bindings/remoteproc/qcom,venus.txt  | 33 ++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> > new file mode 100644
> > index 000000000000..06a2db60fa38
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> > @@ -0,0 +1,33 @@
> > +Qualcomm Venus Peripheral Image Loader
> > +
> > +This document defines the binding for a component that loads and boots firmware
> > +on the Qualcomm Venus remote processor core.
> 
> This does not make sense to me. Venus is the video encoder/decoder h/w, 
> right?

Yes, Venus is an ARM based thing doing video encoding and decoding.

> Why is the firmware loader separate from the codec block?
> Why rproc is used?

Implementation wise it shares structure and almost all the logic with
other remoteprocs in the Qualcomm platform; you load firmware into a
memory region, you grab a few resources (clocks, regulators,
power-domains), you jump into TrustZone for signature checks and you
release the resources as the remote is booted and have voted for these
with the RPM.

But there is also a second operation mode, where one of the Hexagon DSPs
"imitates" a Venus core; with slightly different transport mechanism for
transferring the command stream - so the Venus node might operate on a
non-Venus hardware.


That said, the Venus node (in Venus-hw mode) has a 1:1 life cycle with
the power-on-state of the remoteproc. So perhaps we should describe the
two parts in one DT node and have the rproc-venus implementation spawn
the v4l driver when the remote is running...

But that would mean that on a 8064 we would have 5-6 nodes describing
standalone remoteprocs and one describing the exact same thing but in a
completely different way.


If we keep it as two nodes, I think it would be better to describe the
video-part as a child of the venus-rproc; to show the link between the
two parts.

> Are there multiple clients?
> Naming it rproc_venus implies there aren't.

I'm still investigating this, but it looks like rproc part of the
8060/8960/8064 "vidc" is very similar.

> And why does the firmware loading need 8MB of memory at a fixed address?
> 

On msm8974 the Venus should be loaded into a 5MB region with a fixed
address, perhaps just because of some memory budgeting document. On 8916
it looks (downstream) like all we need is the size and it can be
positioned wherever.

But I would say this is not a property of the rproc-venus, but rather
about system configuration and the firmware. As such I think we should
omit the memory reserve from the example and make sure the
implementation can deal with either a fixed or only-sized reserved
memory region.

Regards,
Bjorn
