Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 7 Nov 2018 22:49:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: hwlock: Document STM32 hwspinlock
 bindings
Message-ID: <20181108064959.GC12063@builder>
References: <20181031093032.20386-1-benjamin.gaignard@st.com>
 <20181031093032.20386-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181031093032.20386-2-benjamin.gaignard@st.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 31 Oct 02:30 PDT 2018, Benjamin Gaignard wrote:

> Add bindings for STM32 hardware spinlock device
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
> new file mode 100644
> index 000000000000..7a999479d802
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
> @@ -0,0 +1,23 @@
> +STM32 Hardware Spinlock Device Binding
> +-------------------------------------
> +
> +Required properties :
> +- compatible : should be "st,stm32-hwspinlock".
> +- reg : the register address of hwspinlock.
> +- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
> +	hwlock, so the number of cells should be <1> here.
> +- clock-names : Must contain "hwspinlock".

This is supposed to be the name of the clock signal of this hardware
block, is it really named "hwspinlock"? Note that you can probably omit
the clock-names property, as you only have a single clock...

Apart from that, I think the binding looks good.

Regards,
Bjorn

> +- clocks : Must contain a phandle entry for the clock in clock-names, see the
> +	common clock bindings.
> +
> +Please look at the generic hwlock binding for usage information for consumers,
> +"Documentation/devicetree/bindings/hwlock/hwlock.txt"
> +
> +Example of hwlock provider:
> +	hwspinlock@4c000000 {
> +		compatible = "st,stm32-hwspinlock";
> +		#hwlock-cells = <1>;
> +		reg = <0x4c000000 0x400>;
> +		clocks = <&rcc HSEM>;
> +		clock-names = "hwspinlock";
> +	};
> -- 
> 2.15.0
> 
