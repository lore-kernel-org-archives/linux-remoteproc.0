Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 21:59:04 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 2/6] dt-bindings: remoteproc: add system resource manager
 (SRM)
Message-ID: <20171214055904.GQ17344@builder>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
 <1511534202-12995-3-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511534202-12995-3-git-send-email-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: linux-remoteproc@vger.kernel.org, Loic PALLARDY <loic.pallardy@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 24 Nov 06:36 PST 2017, Arnaud Pouliquen wrote:

> +Example:
> +	system_resources {
> +		compatible = "rproc-srm-core";
> +
> +		mmc0: sdhci@09060000 {
> +			compatible = "rproc-srm-dev";
> +			pinctrl-names = "default", "idle";
> +			pinctrl-0 = <&pinctrl_mmc0>;
> +			pinctrl-1 = <&pinctrl_mmc1>;
> +			clock-names = "mmc", "icn";
> +			clocks = <&clk_s_c0_flexgen CLK_MMC_0>,
> +				 <&clk_s_c0_flexgen CLK_RX_ICN_HVA>;
> +			vdda-supply = <&vdda>;
> +		};
> +	};

>From a DT perspective these properties are all on the remoteproc. This
has the additional benefit of making the dynamic case much saner to
implement. I.e. if you have:

acme_rproc {
	compatible = "acme,rproc";

	clock-names = "ddr", "mmc";
	clocks = <&clocker DDR>, <&clocker MMC>;
};

Then you can declare statically in the acme,rproc that the "ddr" clock
should be enabled between boot and shutdown, or we can do this based on
resource table information, and you can easily acquire a handle to this
clock from a rpmsg device acting as dynamic controller of resources.

Regards,
Bjorn
