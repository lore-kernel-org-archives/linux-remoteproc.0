Return-Path: <jcrouse@codeaurora.org>
Date: Wed, 8 Aug 2018 16:48:55 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add PDC reset binding for SDM845
 SoCs
Message-ID: <20180808224854.GB26960@jcrouse-lnx.qualcomm.com>
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <1533026547.3444.4.camel@pengutronix.de>
 <28f34ddf-03b2-0baa-c04f-15e546ef3f75@codeaurora.org>
 <20180807181659.GA20659@rob-hp-laptop>
 <ca959e6f-b1b0-8fdf-2c40-0b49a4cf06e6@codeaurora.org>
 <20180808213723.GA26960@jcrouse-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180808213723.GA26960@jcrouse-lnx.qualcomm.com>
To: Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, ilina@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Aug 08, 2018 at 03:37:24PM -0600, Jordan Crouse wrote:
> On Wed, Aug 08, 2018 at 09:14:05PM +0530, Sibi Sankar wrote:
> > Hi Rob,
> > Thanks for the review
> > 
> > On 08/07/2018 11:46 PM, Rob Herring wrote:
> > >On Tue, Jul 31, 2018 at 06:27:24PM +0530, Sibi S wrote:
> > >>Hi Philipp,
> > >>Thanks for the review!
> > >>
> > >>On 07/31/2018 02:12 PM, Philipp Zabel wrote:
> > >>>Hi Sibi,
> > >>>
> > >>>On Fri, 2018-07-27 at 20:58 +0530, Sibi Sankar wrote:
> > >>>>Add SDM845 PDC (Power Domain Controller) reset controller binding
> > >>>>
> > >>>>Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > >>>>---
> > >>>>   .../bindings/reset/qcom,pdc-reset.txt         | 52 +++++++++++++++++++
> > >>>>   include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
> > >>>>   2 files changed, 72 insertions(+)
> > >>>>   create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
> > >>>>   create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h
> > >>>>
> > >>>>diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
> > >>>>new file mode 100644
> > >>>>index 000000000000..85e159962e08
> > >>>>--- /dev/null
> > >>>>+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
> > >>>>@@ -0,0 +1,52 @@
> > >>>>+PDC Reset Controller
> > >>>>+======================================
> > >>>>+
> > >>>>+This binding describes a reset-controller found on PDC-Global(Power Domain
> > >>>>+Controller) block for Qualcomm Technologies Inc SDM845 SoCs.
> > >>>>+
> > >>>>+Required properties:
> > >>>>+- compatible:
> > >>>>+	Usage: required
> > >>>>+	Value type: <string>
> > >>>>+	Definition: must be:
> > >>>>+		    "qcom,sdm845-pdc-global"
> > >>>>+
> > >>>>+- reg:
> > >>>>+	Usage: required
> > >>>>+	Value type: <prop-encoded-array>
> > >>>>+	Definition: must specify the base address and size of the register
> > >>>>+	            space.
> > >>>>+
> > >>>>+- #reset-cells:
> > >>>>+	Usage: required
> > >>>>+	Value type: <uint>
> > >>>>+	Definition: must be 1; cell entry represents the reset index.
> > >>>>+
> > >>>>+Example:
> > >>>>+
> > >>>>+pdc_reset: reset-controller@b2e0000 {
> > >>>
> > >>>Is this really just a reset controller?
> > >>>
> > >>>The name makes it sound like a driver binding to this should also
> > >>>provide pm_genpd and the binding should probably call this a power-
> > >>>controller: Documentation/devicetree/bindings/power/power_domain.txt.
> > >>>
> > >>
> > >>The PDC-global reg space which is a part of PDC-wrapper reg space seems
> > >>to be only used for the reset lines.
> > >>
> > >>Couple of other drivers use other parts of the PDC-wrapper reg space:
> > >>https://patchwork.kernel.org/patch/10223701/ (PDC-Interrupt controller)
> > >>https://patchwork.kernel.org/patch/10255767/ (GMU-PDC incorrectly tries
> > >>to occupy the entire pdc-wrapper reg space)
> > >>
> > >>since it couldn't be logically mapped into pdc-interrupt driver, it had
> > >>to be included as a separate reset driver.
> > >
> > >You can't have overlapping regions in DT (well, you can because we have
> > >to work-around existing DTs that do, but you shouldn't).
> > >
> > >A single node can be multiple providers such as interrupt controller and
> > >reset controller. It's an OS problem to split that into multiple
> > >drivers.
> > 
> > There will be no overlaps. Jordan will be changing the dt binding of
> > gmu_pdc so that there is no overlap I guess. What I meant to say is that
> > pdc-global is a separate reg-space and currently has no other
> > functionality other than exposing the reset lines.
> 
> Correct - the updated GPU DT will be:
> 
>   reg = <0x506a000 0x30000>,
>      <0xb280000 0x10000>,
>      <0xb480000, 0x10000>;
>   reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> 
> Jordan

Code change:  https://patchwork.freedesktop.org/patch/243513/
DT change: https://patchwork.freedesktop.org/patch/243539/

Jordan
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
