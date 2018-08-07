Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 7 Aug 2018 12:16:59 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add PDC reset binding for SDM845
 SoCs
Message-ID: <20180807181659.GA20659@rob-hp-laptop>
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <1533026547.3444.4.camel@pengutronix.de>
 <28f34ddf-03b2-0baa-c04f-15e546ef3f75@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28f34ddf-03b2-0baa-c04f-15e546ef3f75@codeaurora.org>
To: Sibi S <sibis@codeaurora.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, ilina@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Jul 31, 2018 at 06:27:24PM +0530, Sibi S wrote:
> Hi Philipp,
> Thanks for the review!
> 
> On 07/31/2018 02:12 PM, Philipp Zabel wrote:
> > Hi Sibi,
> > 
> > On Fri, 2018-07-27 at 20:58 +0530, Sibi Sankar wrote:
> > > Add SDM845 PDC (Power Domain Controller) reset controller binding
> > > 
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > ---
> > >   .../bindings/reset/qcom,pdc-reset.txt         | 52 +++++++++++++++++++
> > >   include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
> > >   2 files changed, 72 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
> > >   create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
> > > new file mode 100644
> > > index 000000000000..85e159962e08
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
> > > @@ -0,0 +1,52 @@
> > > +PDC Reset Controller
> > > +======================================
> > > +
> > > +This binding describes a reset-controller found on PDC-Global(Power Domain
> > > +Controller) block for Qualcomm Technologies Inc SDM845 SoCs.
> > > +
> > > +Required properties:
> > > +- compatible:
> > > +	Usage: required
> > > +	Value type: <string>
> > > +	Definition: must be:
> > > +		    "qcom,sdm845-pdc-global"
> > > +
> > > +- reg:
> > > +	Usage: required
> > > +	Value type: <prop-encoded-array>
> > > +	Definition: must specify the base address and size of the register
> > > +	            space.
> > > +
> > > +- #reset-cells:
> > > +	Usage: required
> > > +	Value type: <uint>
> > > +	Definition: must be 1; cell entry represents the reset index.
> > > +
> > > +Example:
> > > +
> > > +pdc_reset: reset-controller@b2e0000 {
> > 
> > Is this really just a reset controller?
> > 
> > The name makes it sound like a driver binding to this should also
> > provide pm_genpd and the binding should probably call this a power-
> > controller: Documentation/devicetree/bindings/power/power_domain.txt.
> > 
> 
> The PDC-global reg space which is a part of PDC-wrapper reg space seems
> to be only used for the reset lines.
> 
> Couple of other drivers use other parts of the PDC-wrapper reg space:
> https://patchwork.kernel.org/patch/10223701/ (PDC-Interrupt controller)
> https://patchwork.kernel.org/patch/10255767/ (GMU-PDC incorrectly tries
> to occupy the entire pdc-wrapper reg space)
> 
> since it couldn't be logically mapped into pdc-interrupt driver, it had
> to be included as a separate reset driver.

You can't have overlapping regions in DT (well, you can because we have 
to work-around existing DTs that do, but you shouldn't).

A single node can be multiple providers such as interrupt controller and 
reset controller. It's an OS problem to split that into multiple 
drivers.
 
> > > +	compatible = "qcom,sdm845-pdc-global";
> > > +	reg = <0xb2e0000 0x20000>;
> > 
> > This looks like this is the register space of the complete PDC, not just
> > the reset register?
> > 
> 
> The entire register space was chosen because it is only used for its
> reset lines (had a good look at the downstream kernel and had a conversation
> with Lina) and to ensure break backward compatibility for
> the for the dt entry if the reg-space was used for other purposes in
> the future.

Why do you want to ensure breaking backwards compatibility?

Rob
