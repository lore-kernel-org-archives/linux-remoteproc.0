Date: Thu, 13 Feb 2020 20:40:46 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: qcs404: Add IMEM and PIL info
 region
Message-ID: <20200214044043.GS3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-5-bjorn.andersson@linaro.org>
 <158164782444.184098.15673002519472990390@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164782444.184098.15673002519472990390@swboyd.mtv.corp.google.com>
To: Stephen Boyd <sboyd@chromium.org>
Cc: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 13 Feb 18:37 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-02-10 16:50:55)
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index 4ee1e3d5f123..f539293b875c 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -997,6 +997,19 @@ blsp2_spi0: spi@7af5000 {
> >                         status = "disabled";
> >                 };
> >  
> > +               imem@8600000 {
> > +                       compatible = "syscon", "simple-mfd";
> > +                       reg = <0x08600000 0x1000>;
> > +
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +
> > +                       pil-reloc@94c {
> > +                               compatible ="qcom,pil-reloc-info";
> > +                               reg = <0x94c 200>;
> 
> Is it 200 in decimal? It looks weird that this is basically the only
> thing that isn't in hexadecimal.
> 

Yes it is and the size was documented as such... But you're probably not
the last one who will spend cycles wondering if I forgot the 0x.

Regards,
Bjorn

> > +                       };
> > +               };
> > +
