Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 30 Jan 2017 22:05:10 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/4] remoteproc: qcom: Add additional agree2_clk and
 px regulator resource.
Message-ID: <20170131060510.GF10531@minitux>
References: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
 <1485788589-21968-3-git-send-email-akdwived@codeaurora.org>
 <20170130214657.GB31134@builder>
 <8e0d5e13-3d91-0f00-ee1d-dae70370b30d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e0d5e13-3d91-0f00-ee1d-dae70370b30d@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 30 Jan 21:58 PST 2017, Dwivedi, Avaneesh Kumar (avani) wrote:

> 
> 
> On 1/31/2017 3:16 AM, Bjorn Andersson wrote:
> > On Mon 30 Jan 07:03 PST 2017, Avaneesh Kumar Dwivedi wrote:
> > 
> > > This patch add additional clock and regulator resource which are
> > > initialized based on compatible and has no impact on existing driver
> > > working. This resourse addition enable the existing driver to handle.
> > > low pass sensor processor device also.
> > > 
> > > Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> > Applied, with below modification.
> Thanks Bjorn, but please look below inline comment.
> > > ---
> > >   drivers/remoteproc/qcom_adsp_pil.c | 43 +++++++++++++++++++++++++++++++-------
> > >   1 file changed, 36 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
> > [..]
> > >   static int adsp_init_regulator(struct qcom_adsp *adsp)
> > >   {
> > > -	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
> > > +	adsp->cx_supply = devm_regulator_get(adsp->dev, "vdd_cx");
> > We should not change the name of devicetree properties, so I dropped
> > "vdd_" on both of these.
> I observed that giving "cx" or "px" string to devm_regulator_get() was
> returning with dummy regulator, and if i gave "vdd_cx" and "vdd_px" it did
> not print dummy regulator warning.
> in device tree these regulators node were defined as "vdd_cx-supply" and
> "vdd_px-supply"

They are named "vdd_cx" and "vdd_px" in the downstream dts, I didn't
notice this originally and as we have a few other discrepancies to the
downstream binding I rather stay compatible with the existing upstream
DT binding than the downstream.

So please update your dts.


Btw, forgot to mention that aggre2 definitely is a "bus" and I think it
should be represented separately, but I figured its better to merge the
driver as is and then remove aggre2 once we have figured out how to
represent/reference it properly.

Regards,
Bjorn
