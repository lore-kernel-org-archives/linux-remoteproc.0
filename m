Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
References: <20181228044819.5697-1-sibis@codeaurora.org> <20181228044819.5697-2-sibis@codeaurora.org>
 <20190103233014.GA181833@google.com> <20190103235043.GA195759@google.com>
 <20190104000145.GJ31596@builder> <20190104001158.GA200069@google.com> <20190105015430.GA67838@google.com>
In-Reply-To: <20190105015430.GA67838@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Jan 2019 09:22:30 -0600
Message-ID: <CAL_JsqLbMNB6EzYCzmq5PBc9EvVmYifsoJBwymV621h385Hv0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add firmware
 bindings for Q6V5
Content-Type: text/plain; charset="UTF-8"
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Chris Lew <clew@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm-owner@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jan 4, 2019 at 7:54 PM Brian Norris <briannorris@chromium.org> wrote:
>
> Hi again,
>
> On Thu, Jan 03, 2019 at 04:11:58PM -0800, Brian Norris wrote:
> > On Thu, Jan 03, 2019 at 04:01:45PM -0800, Bjorn Andersson wrote:
> > > I share your concern about this, but I came to suggest this as the
> > > driver cares about platforms but the firmware is (often?)
> > > device/product-specific.
> > >
> > > E.g. we will serve the MTP and Pixel 3 with the qcom,sdm845-adsp-pas
> > > compatible, but they are unlikely to run the same adsp firmware. This
> > > allows the individual dtb to specify which firmware the driver should
> > > use.
> >
> > I understand this, but that still doesn't mean we should be suggesting
> > each DTB to clutter the top-level firmware search path, especially since
> > lazy people will probably just use "modem.mdt" and similar. That means
> > you no longer can ship the same rootfs that supports both QCOM and
> > <other> modems, if <other> modem also uses the same lazy format.
> >
> > It seems like a much better practice to at least enforce a particular
> > prefix to things. e.g., the driver could assume:
> >
> >   qcom/sdm845-adsp-pas/ (or if you must, just qcom/)
> >
> > and your DTB only gets to add .../<your-string-here> to that path.
> >
> > In case it isn't clear: I think it's also severely misguided that the
> > existing driver gets away with lines like
> >
> >       request_firmware(&fw, "modem.mdt", ...);
> >
> > today ;)
>
> To add to my thoughts, since I think maybe Sibi was a little unclear of
> my thoughts:
>
> One of my primary concerns with the existing approach is that it's
> basically a complete free-for-all. We should have some minimal standards
> (enforced in code) such that our DTB can never point us at something
> like /lib/firmware/<other-vendor>/foo.bin (or /lib/firmware/modem.mdt;
> or lots of other bad examples). This could probably be done simply by
> always prefixing 'qcom/' (I don't remember -- does request_firmware()
> follow '..'? e.g., 'firmware-name = "../bar/foo.bin"'.)

We can write a schema to enforce some of this:

firmware-name:
  pattern: "^\w.*"

And you can have a device specific schema to enforce a subdir and/or
filename(s).

I tend to think we should not put part of the path in drivers. No real
good reason other than we already allow that for other users of
'firmware-name'.

> As a bonus: it would be very nice if we can provide a little more
> structure by default, and avoid arbitrary hierarchy in the DTS. That's
> where I brought up ath10k's "variant" as an example; if we can use
> 'compatible' to capture most of this particular Hexagon core's
> properties, then we only leave a single level of variability to the DTS.

Some bindings use compatible to determine/construct the firmware name.
If you want to restrict things, then that's probably how you should do
it IMO.

Rob
