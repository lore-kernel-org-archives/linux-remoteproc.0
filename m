Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 13 May 2019 11:28:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: qcs404: Define APPS IOMMU
Message-ID: <20190513182853.GI2085@tuxbook-pro>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
 <20190510043421.31393-8-bjorn.andersson@linaro.org>
 <20190513045402.GA2707@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513045402.GA2707@vkoul-mobl>
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 12 May 21:54 PDT 2019, Vinod Koul wrote:

> On 09-05-19, 21:34, Bjorn Andersson wrote:
> > The APPS IOMMU provides contexts for FastRPC, MDP and WLAN, among other
> > things.  Define these. We use the qcom_iommu binding because the
>         ^^^
> Double spaces crept in..
> 

That's to give you some breathing room while reading it - but not as
much as a new paragraph :)

> > firmware restrictions in incompatible with the arm-smmu.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 85 ++++++++++++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index b213f6acad76..fcde4f0334c2 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -378,6 +378,91 @@
> >  			reg = <0x01937000 0x25000>;
> >  		};
> >  
> > +		apps_iommu: iommu@1e20000 {
> > +			compatible = "qcom,qcs404-iommu", "qcom,msm-iommu-v1";
> 
> Did we define qcom,qcs404-iommu in bindings, It does not seem to be
> there in this patch, next or integration one
> 

No, this was entirely intended to fall back on the generic compatible.

That said, further testing of this series indicates that we have a
cache issue related to the SMMU. In working out this I came up with a
series of patches to the arm-smmu driver that allow us to use this with
the standard Qualcomm bootloader.

So let's ignore patch 7 and 8 in this series until we know how to deal
with the SMMU.

Regards,
Bjorn
