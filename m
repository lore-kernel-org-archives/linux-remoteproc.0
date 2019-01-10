Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
References: <20181228044819.5697-1-sibis@codeaurora.org> <20181228044819.5697-2-sibis@codeaurora.org>
 <20190103233014.GA181833@google.com> <20190103235043.GA195759@google.com>
 <20190104000145.GJ31596@builder> <20190104001158.GA200069@google.com>
 <20190105015430.GA67838@google.com> <CAL_JsqLbMNB6EzYCzmq5PBc9EvVmYifsoJBwymV621h385Hv0w@mail.gmail.com>
 <20190109215532.GA178267@google.com>
In-Reply-To: <20190109215532.GA178267@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 10 Jan 2019 08:56:12 -0600
Message-ID: <CAL_JsqKF5i8HNT-ez+Q=Dv9OA-Lf1VaqpZbL2ouo0Bm+v5FxJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add firmware
 bindings for Q6V5
Content-Type: text/plain; charset="UTF-8"
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Chris Lew <clew@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm-owner@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Jan 9, 2019 at 3:55 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Jan 08, 2019 at 09:22:30AM -0600, Rob Herring wrote:
> > On Fri, Jan 4, 2019 at 7:54 PM Brian Norris <briannorris@chromium.org> wrote:
> > > To add to my thoughts, since I think maybe Sibi was a little unclear of
> > > my thoughts:
> > >
> > > One of my primary concerns with the existing approach is that it's
> > > basically a complete free-for-all. We should have some minimal standards
> > > (enforced in code) such that our DTB can never point us at something
> > > like /lib/firmware/<other-vendor>/foo.bin (or /lib/firmware/modem.mdt;
> > > or lots of other bad examples). This could probably be done simply by
> > > always prefixing 'qcom/' (I don't remember -- does request_firmware()
> > > follow '..'? e.g., 'firmware-name = "../bar/foo.bin"'.)
> >
> > We can write a schema to enforce some of this:
> >
> > firmware-name:
> >   pattern: "^\w.*"
>
> Are DT schemas ready to use/enforce? Or would this currently just be a
> suggestion? I'm out of the loop. But I guess that would be interesting.

Yes, please! Initial support is in 5.0-rc.

I'm not requiring new bindings to be written as schemas just yet
though. We need to ring out any issues with early adopters.

Rob
