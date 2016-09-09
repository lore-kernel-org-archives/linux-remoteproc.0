Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 8 Sep 2016 20:36:13 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-binding: remoteproc: Document generic properties
Message-ID: <20160909033613.GB405@tuxbot>
References: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
 <20160812183448.GA32059@rob-hp-laptop>
 <20160812224223.GJ26240@tuxbot>
 <46d4d351-336c-6d4f-b1b0-243cf3c5d68b@ti.com>
 <20160908165032.GA9526@rob-hp-laptop>
 <dfa838cf-15f6-c178-f69a-1b5488f74a7a@ti.com>
 <CAL_JsqKF5pqWY2fSoReUrAZ6yqfMTkWLLYrJqCz4ciA8J0a2-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKF5pqWY2fSoReUrAZ6yqfMTkWLLYrJqCz4ciA8J0a2-g@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Suman Anna <s-anna@ti.com>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 08 Sep 19:33 PDT 2016, Rob Herring wrote:

> On Thu, Sep 8, 2016 at 1:32 PM, Suman Anna <s-anna@ti.com> wrote:
> > Hi Rob,
> >
> > On 09/08/2016 11:50 AM, Rob Herring wrote:
> >> On Fri, Sep 02, 2016 at 04:45:45PM -0500, Suman Anna wrote:
> >>> On 08/12/2016 05:42 PM, Bjorn Andersson wrote:
> >>>> On Fri 12 Aug 11:34 PDT 2016, Rob Herring wrote:
> >>>>
> >>>>> On Wed, Aug 10, 2016 at 10:37:02AM -0700, Bjorn Andersson wrote:
> >>>>>> This documents the generic properties "rprocs" and "rproc-names", used
> >>>>>> for consumer drivers to reference a remoteproc node.
> >>>>>
> >>>>> How do you intend to use this? I wonder if it would not be better to
> >>>>> expose a remote proc with existing bindings for a particular purpose
> >>>>> (e.g. clocks, resets, etc.) rather than a generic connection. The client
> >>>>> side would have to have specific knowledge as to what functions the
> >>>>> remote proc provides.
> >>>>>
> >>>>
> >>>> The remoteproc node represents the mechanism and resources needed to
> >>>> control the life cycle a co-processor, e.g. loading, booting, shutting
> >>>> gown a video encoder/decoder.
> >>>>
> >>>> The proposed reference allows a separate thingie to assert control of
> >>>> the life cycle of that co-processor.
> >>>>
> >>>>
> >>>> I acknowledge that in some cases there is a fine line between what is
> >>>> the life cycle management and what is the actual functionality
> >>>> implemented by that remote processor. But as the remoteproc mechanism is
> >>>> reusable between various use cases I think it makes sense to not describe
> >>>> them as one unit.
> >>>
> >>> What's the current state of this patch, not officially acked yet right?
> >>
> >> Bjorn and I have discussed some, but probably needs more discussion.
> >> This binding alone is simple enough, but I want to understand better how
> >> it will be used and digesting all the QCom h/w is not simple.
> >
> > OK, thanks. The binding has no bearing on Qcom h/w though.
> 
> Doesn't have to be QCom, I just want to see some user and understand the use.
> 

For other's reference, we discussed two different cases:
1) The Qualcomm video accelerator; a single-use-case co-processor that
when booted provides a video encoder & decoder.

2) The Qualcomm (A)DSP, a multipurpose generic DSP used for audio
effects, audio control/routing, sensor offloading and general
computational workloads.


In #1 Rob's point is that there's only a single piece of hardware, so it
should be described in a single node.
I think it would be beneficial to represent this as two different nodes,
one for the co-processor management and one for the video-related
resources, but I need to investigate this a little bit more.

In #2 we have the resources related to controlling the DSP and when
booted the firmware presents the additional services in a probable
manner; some of these services interacts with resources or provides
resources and must as such be represented in DT.

In either case there's no reason for me to reference a remoteproc
instance - so far at least.


There is a third case, which I have not researched fully yet, where we
need to represent dependencies between remoteprocs; e.g. we must boot
the audio DSP before booting the modem and if the DSP crashes we must
restart the modem.

Regards,
Bjorn
