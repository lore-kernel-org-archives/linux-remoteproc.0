Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 28 Mar 2019 10:26:12 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] ARM: dts: stm32: Add hwspinlock node for stm32mp157
 SoC
Message-ID: <20190328152612.GA464@bogus>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
 <1552492237-28810-5-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552492237-28810-5-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Mar 13, 2019 at 04:50:35PM +0100, Fabien Dessenne wrote:
> Declare hwspinlock device for stm32mp157 SoC
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 105e21f..18baaea 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -886,6 +886,15 @@
>  			status = "disabled";
>  		};
>  
> +		hsem: hwspinlock@4c000000 {
> +			compatible = "st,stm32-hwspinlock";
> +			#hwlock-cells = <2>;
> +			reg = <0x4c000000 0x400>;
> +			clocks = <&rcc HSEM>;
> +			clock-names = "hsem";
> +			status = "okay";

okay is the default, so you can remove it.

> +		};
> +
>  		ipcc: mailbox@4c001000 {
>  			compatible = "st,stm32mp1-ipcc";
>  			#mbox-cells = <1>;
> -- 
> 2.7.4
> 
