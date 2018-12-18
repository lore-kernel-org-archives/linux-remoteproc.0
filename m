Return-Path: <linux-arm-msm-owner@vger.kernel.org>
MIME-Version: 1.0
References: <20181217100724.4593-1-sibis@codeaurora.org> <20181217100724.4593-2-sibis@codeaurora.org>
 <CAD=FV=Ui6ys4R3nenix3USeRPAd_vVdrArXxdf-iEc=4QRhE+A@mail.gmail.com> <8decd38d8e28c6657949f3c140947977@codeaurora.org>
In-Reply-To: <8decd38d8e28c6657949f3c140947977@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Dec 2018 08:07:59 -0800
Message-ID: <CAD=FV=Xuh0pUTcKOGPANmgfeGxQfHwN5RWg+E9srzuGq2_AmAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: remoteproc: qcom: Add clock bindings
 for Q6V5
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Mon, Dec 17, 2018 at 9:52 PM Sibi Sankar <sibis@codeaurora.org> wrote:
> >> @@ -39,13 +39,17 @@ on the Qualcomm Hexagon core.
> >>  - clocks:
> >>         Usage: required
> >>         Value type: <phandle>
> >> -       Definition: reference to the iface, bus and mem clocks to be
> >> held on
> >> -                   behalf of the booting of the Hexagon core
> >> +       Definition: reference to the list of 4 clocks for the modem
> >> sub-system
> >> +                   reference to the list of 8 clocks for the modem
> >> sub-system
> >> +                   on SDM845 SoCs
> >
> > The above is confusing because you don't list the SoCs that are
> > supposed to use the 4 clocks.  How about instead:
> >
> > Definition: reference to the clocks that match clock-names
> >
>
> AFAIK, only the exceptions are captured. I am fine
> with both, I'll wait for Bjorn/Rob's preference.

Sure, waiting for Bjron / Rob to chime in sounds good.  If you are
going to document just the exception, though, IMO at least reword it.
AKA:

reference to the list of 8 clocks for the modem sub-system on SDM845
SoCs; reference to the list of 4 clocks for the modem sub-system on
all other SoCs.

...the key being the "on all other" to make it clear.  ...but I still
like my original suggestion of using less prose and more lists, so
hopefully Bjorn / Rob are OK with that.


-Doug
