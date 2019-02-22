Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 22 Feb 2019 08:43:16 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: Add a binding for Mediatek SCP
Message-ID: <20190222144316.GA19284@bogus>
References: <20190221084729.101784-1-pihsun@chromium.org>
 <20190221084729.101784-2-pihsun@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190221084729.101784-2-pihsun@chromium.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Erin Lo <erin.lo@mediatek.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Feb 21, 2019 at 04:47:24PM +0800, Pi-Hsun Shih wrote:
> From: Erin Lo <erin.lo@mediatek.com>
> 
> Add a DT binding documentation of SCP for the
> MT8183 SoC from Mediatek.
> 
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> ---
> Changes from v4:
>  - Add detail of more properties.
>  - Document the usage of mtk,rpmsg-name in subnode from the new design.
> 
> Changes from v3:
>  - No change.
> 
> Changes from v2:
>  - No change. I realized that for this patch series, there's no need to
>    add anything under the mt8183-scp node (neither the mt8183-rpmsg or
>    the cros-ec-rpmsg) for them to work, since mt8183-rpmsg is added
>    directly as a rproc_subdev by code, and cros-ec-rpmsg is dynamically
>    created by SCP name service.
> 
> Changes from v1:
>  - No change.
> ---
>  .../bindings/remoteproc/mtk,scp.txt           | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> new file mode 100644
> index 00000000000000..8cf8b0e0d98a4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> @@ -0,0 +1,37 @@
> +Mediatek SCP Bindings
> +----------------------------------------
> +
> +This binding provides support for ARM Cortex M4 Co-processor found on some
> +Mediatek SoCs.
> +
> +Required properties:
> +- compatible		Should be "mediatek,mt8183-scp"
> +- reg			Should contain the address ranges for the two memory
> +			regions, SRAM and CFG.
> +- reg-names		Contains the corresponding names for the two memory
> +			regions. These should be named "sram" & "cfg".
> +- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
> +- clock-names		Contains the corresponding name for the clock. This
> +			should be named "main".
> +
> +Subnodes
> +--------
> +
> +When CONFIG_RPMSG_MTK_SCP is enabled, subnodes of the SCP represent rpmsg

Bindings can't depend on kernel config options.

> +devices. The names of the devices are not important. The properties of these
> +nodes are defined by the individual bindings for the rpmsg devices - but must
> +contain the following property:
> +
> +- mtk,rpmsg-name	Contains the name for the rpmsg device. Used to match
> +			the subnode to rpmsg device announced by SCP.

I don't think this belongs in DT, but without some examples I'm not 
really sure.

> +
> +Example:
> +
> +	scp: scp@10500000 {
> +		compatible = "mediatek,mt8183-scp";
> +		reg = <0 0x10500000 0 0x80000>,
> +		      <0 0x105c0000 0 0x5000>;
> +		reg-names = "sram", "cfg";
> +		clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +		clock-names = "main";
> +	};
> -- 
> 2.21.0.rc0.258.g878e2cd30e-goog
> 
