Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 3 Jan 2019 16:01:45 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add firmware
 bindings for Q6V5
Message-ID: <20190104000145.GJ31596@builder>
References: <20181228044819.5697-1-sibis@codeaurora.org>
 <20181228044819.5697-2-sibis@codeaurora.org>
 <20190103233014.GA181833@google.com>
 <20190103235043.GA195759@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190103235043.GA195759@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Sibi Sankar <sibis@codeaurora.org>, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 03 Jan 15:50 PST 2019, Brian Norris wrote:

> On Thu, Jan 03, 2019 at 03:30:14PM -0800, Brian Norris wrote:
> > On Fri, Dec 28, 2018 at 10:18:18AM +0530, Sibi Sankar wrote:
> > > +- firmware-name:
> > > +	Usage: optional
> > > +	Value type: <string>
> > > +	Definition: must list the relative firmware image path for the
> > > +		    Hexagon Core.
> > 
> > Relative to what? I still think it's a terrible idea that your driver
> > looks for files at the top-level /lib/firmware/ directory, but now
> > you're leaking this into the device tree. This should at a bare minimum
> > be namespaced to something like the qcom/ sub-directory. But ideally,
> > the driver would automatically be deriving a further sub-directory of
> > qcom/ based on the chipset or something, and then the only thing you'd
> > describe here is some kind of variant string -- something akin to
> > ath10k's qcom,ath10k-calibration-variant (see
> > Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt), which
> > doesn't require a full path-name or any hierarchy.
> 
> Oh, I see Rob actually recommended this binding in v1, and it's (sort
> of) in use by a few other drivers. Is it really expected that we put
> arbitrary pathnames in device tree? None of the binding documentation
> seems very specific to me, and their implementations *do* allow
> arbitrary text. As it stands today, this is a great recipe for name
> collision -- e.g., how the driver today suggests "modem.XYZ" names; is
> Qualcomm really the only one out there making modems? :D
> 
> So my natural instinct is to avoid this. But if that's what everybody
> wants...
> 

I share your concern about this, but I came to suggest this as the
driver cares about platforms but the firmware is (often?)
device/product-specific.

E.g. we will serve the MTP and Pixel 3 with the qcom,sdm845-adsp-pas
compatible, but they are unlikely to run the same adsp firmware. This
allows the individual dtb to specify which firmware the driver should
use.

Regards,
Bjorn
