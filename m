Return-Path: <briannorris@chromium.org>
Return-Path: <briannorris@chromium.org>
Date: Wed, 9 Jan 2019 13:55:34 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add firmware
 bindings for Q6V5
Message-ID: <20190109215532.GA178267@google.com>
References: <20181228044819.5697-1-sibis@codeaurora.org>
 <20181228044819.5697-2-sibis@codeaurora.org>
 <20190103233014.GA181833@google.com>
 <20190103235043.GA195759@google.com>
 <20190104000145.GJ31596@builder>
 <20190104001158.GA200069@google.com>
 <20190105015430.GA67838@google.com>
 <CAL_JsqLbMNB6EzYCzmq5PBc9EvVmYifsoJBwymV621h385Hv0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLbMNB6EzYCzmq5PBc9EvVmYifsoJBwymV621h385Hv0w@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Chris Lew <clew@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm-owner@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Jan 08, 2019 at 09:22:30AM -0600, Rob Herring wrote:
> On Fri, Jan 4, 2019 at 7:54 PM Brian Norris <briannorris@chromium.org> wrote:
> > To add to my thoughts, since I think maybe Sibi was a little unclear of
> > my thoughts:
> >
> > One of my primary concerns with the existing approach is that it's
> > basically a complete free-for-all. We should have some minimal standards
> > (enforced in code) such that our DTB can never point us at something
> > like /lib/firmware/<other-vendor>/foo.bin (or /lib/firmware/modem.mdt;
> > or lots of other bad examples). This could probably be done simply by
> > always prefixing 'qcom/' (I don't remember -- does request_firmware()
> > follow '..'? e.g., 'firmware-name = "../bar/foo.bin"'.)
> 
> We can write a schema to enforce some of this:
> 
> firmware-name:
>   pattern: "^\w.*"

Are DT schemas ready to use/enforce? Or would this currently just be a
suggestion? I'm out of the loop. But I guess that would be interesting.

> And you can have a device specific schema to enforce a subdir and/or
> filename(s).
> 
> I tend to think we should not put part of the path in drivers. No real
> good reason other than we already allow that for other users of
> 'firmware-name'.

OK. (I was surprised you accepted paths at all. But if we're going down
that road... *shrug*)

> > As a bonus: it would be very nice if we can provide a little more
> > structure by default, and avoid arbitrary hierarchy in the DTS. That's
> > where I brought up ath10k's "variant" as an example; if we can use
> > 'compatible' to capture most of this particular Hexagon core's
> > properties, then we only leave a single level of variability to the DTS.
> 
> Some bindings use compatible to determine/construct the firmware name.
> If you want to restrict things, then that's probably how you should do
> it IMO.

We already have reasons up-thread for why we can't get this exclusively
from compatible.

But if we were to partially construct and/or validate paths using
compatible, then the time to do that is now. As soon as this is merged
without such validation, then we're stuck.

Given the above, it seems like maybe the best we can do is put a
recommendation into a DT schema pattern.

Brian
