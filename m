Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 13 Dec 2018 20:52:18 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Message-ID: <20181214045218.GJ1578@tuxbook-pro>
References: <20181127085828.17908-1-sibis@codeaurora.org>
 <CAD=FV=U+LHa0QpPuZhd04=WkMrrM1kBUYhkS9RqSSR6uLijbBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=U+LHa0QpPuZhd04=WkMrrM1kBUYhkS9RqSSR6uLijbBA@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 13 Dec 14:17 PST 2018, Doug Anderson wrote:
> On Tue, Nov 27, 2018 at 12:58 AM Sibi Sankar <sibis@codeaurora.org> wrote:
[..]
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 58870273dbc9..df16ee464872 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -1095,6 +1095,69 @@
> >                         };
> >                 };
> >
> > +               remoteproc@4080000 {
> > +                       compatible = "qcom,sdm845-mss-pil";
> > +                       reg = <0x04080000 0x408>, <0x04180000 0x48>;
> 
> s/0x04080000/0x4080000 to appease the DT folks.
> 

Andy requests this to be padded to 8 digits, and I've come to really
appreciate this as it makes sorting much easier.

But perhaps there's a verdict on this?

Regards,
Bjorn
