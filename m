Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181127085828.17908-1-sibis@codeaurora.org> <CAD=FV=U+LHa0QpPuZhd04=WkMrrM1kBUYhkS9RqSSR6uLijbBA@mail.gmail.com>
 <20181214045218.GJ1578@tuxbook-pro>
In-Reply-To: <20181214045218.GJ1578@tuxbook-pro>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Dec 2018 08:18:34 -0800
Message-ID: <CAD=FV=WrvRH6QpaQ67yw2MFz8RP59ozkSfQC4+OAM_8fAbGZuw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Thu, Dec 13, 2018 at 8:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 13 Dec 14:17 PST 2018, Doug Anderson wrote:
> > On Tue, Nov 27, 2018 at 12:58 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> [..]
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index 58870273dbc9..df16ee464872 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -1095,6 +1095,69 @@
> > >                         };
> > >                 };
> > >
> > > +               remoteproc@4080000 {
> > > +                       compatible = "qcom,sdm845-mss-pil";
> > > +                       reg = <0x04080000 0x408>, <0x04180000 0x48>;
> >
> > s/0x04080000/0x4080000 to appease the DT folks.
> >
>
> Andy requests this to be padded to 8 digits, and I've come to really
> appreciate this as it makes sorting much easier.
>
> But perhaps there's a verdict on this?

Hrm.  First I've heard of that.  ...and all of the other addresses in
this file aren't padded to 8 digits.  Ugh.  I could submit a patch to
fix them all (I actually like them padded too) but given the current
number of outstanding patches against sdm845.dtsi it's just going to
cause lots of merge conflicts?

I thought it was general DT practice to always omit leading zeros but
I just searched and it appears that policy only applies to unit
addresses.  Specifically I note that in
<https://lkml.kernel.org/r/20180111060004.9333-1-bjorn.andersson@linaro.org>
Rob H asked you to remove the leading zero from the unit address but
_not_ the "reg".  So I guess padding the reg to 8 digits is OK.

tl;dr: Sure, keep the padding the 8 digits here and eventually we can
fix-up the other nodes when there's not so much churn to sdm845.dtsi
(or maybe Andy can do it himself?)  Sound like a plan?


-Doug
