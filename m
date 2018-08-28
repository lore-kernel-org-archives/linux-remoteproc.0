Return-Path: <mka@chromium.org>
Return-Path: <mka@chromium.org>
Date: Tue, 28 Aug 2018 10:11:58 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: reset: Add PDC Global binding for
 SDM845 SoCs
Message-ID: <20180828171158.GB10879@google.com>
References: <20180824131900.5353-1-sibis@codeaurora.org>
 <20180824131900.5353-2-sibis@codeaurora.org>
 <20180828003823.GY160295@google.com>
 <c675b609fcd0d243e4db2e6637c70902@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c675b609fcd0d243e4db2e6637c70902@codeaurora.org>
To: sibis@codeaurora.org
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Aug 28, 2018 at 11:38:26AM +0530, sibis@codeaurora.org wrote:
> Hi Matthias,
> Thanks for the review
> 
> On 2018-08-28 06:08, Matthias Kaehlcke wrote:
> > Hi Sibi,
> > 
> > On Fri, Aug 24, 2018 at 06:48:55PM +0530, Sibi Sankar wrote:
> > > Add PDC Global(Power Domain Controller) binding for SDM845 SoCs.
> > 
> > nit: missing blank before the opening parenthesis.
> > 
> 
> Will fix it
> 
> > > 
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > ---
> > >  .../bindings/reset/qcom,pdc-global.txt        | 52
> > > +++++++++++++++++++
> > >  include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
> > >  2 files changed, 72 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
> > >  create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
> > > b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
> > > new file mode 100644
> > > index 000000000000..69f9edca9503
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
> > > @@ -0,0 +1,52 @@
> > > +PDC Global
> > > +======================================
> > > +
> > > +This binding describes a reset-controller found on PDC-Global(Power
> > > Domain
> > > +Controller) block for Qualcomm Technologies Inc SDM845 SoCs.
> > 
> > Are there other PDC reset controllers that aren't 'global'? Otherwise
> > I'd suggest to use 'pdc-reset' instead of 'pdc-global', which is more
> > specific and in line with the name of the driver added by this series.
> > Or something like 'pdc-reset-global/main' if there are other
> > controllers?
> > 
> 
> These are the only reset lines found in the pdc-global register space. But
> as
> explained by Bjorn, wouldn't it be better to leave it as such since
> pdc-global
> best describes the hardware without being limited by the current
> functionality
> it is being used for?

If I understand Bjorn's reply on
https://patchwork.kernel.org/patch/10575335/ correctly it is planned
to use the 'pdc-global' compatible string in the future in some sort
of MFD driver for the 'PDC Global' IP block, which then instantiates
other drivers like the reset controller. In this case I agree that
'pdc-global' seems a reasonable choice.
