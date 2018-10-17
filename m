Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 17 Oct 2018 15:05:54 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Introduce QCOM WCSS
 Q6DSP clock bindings
Message-ID: <20181017200554.GA17601@bogus>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
 <1539337244-9505-4-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539337244-9505-4-git-send-email-govinds@codeaurora.org>
To: Govind Singh <govinds@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Oct 12, 2018 at 03:10:41PM +0530, Govind Singh wrote:
> Add device tree bindings for WiFi QDSP subsystem clock controls
> found in OCS405 soc.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,wcsscc.txt      | 26 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,wcss-qcs404.h       | 24 ++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
> new file mode 100644
> index 0000000..2b19ef0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
> @@ -0,0 +1,26 @@
> +Qualcomm WCSS Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible		: shall contain "qcom,qcs404-wcsscc"
> +- #clock-cells		: from common clock binding, shall contain 1.
> +- reg			: shall contain base register address and size,
> +			  in the order
> +			Index-0 maps to WCSS_Q6SSTOP clocks register region
> +			Index-1 maps to WCSS_TCSR register region
> +			Index-2 maps to WCSS_QDSP6SS register region
> +
> +Optional properties :
> +- reg-names	: register names of WCSS domain
> +		 "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
> +
> +Example:
> +The below node has to be defined in the cases where the WCSS peripheral loader
> +would bring the subsystem out of reset.
> +
> +	clock_wcsscc: qcom,wcsscc@7000000 {

clock-controller@7500000

> +		compatible = "qcom,qcs404-wcsscc";
> +		reg = <0x07500000 0x4e000>, <0x07550000 0x8012>, <0x07400000 0x104>;
> +		reg-names = "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss";
> +		#clock-cells = <1>;
> +	};
> diff --git a/include/dt-bindings/clock/qcom,wcss-qcs404.h b/include/dt-bindings/clock/qcom,wcss-qcs404.h
> new file mode 100644
> index 0000000..45dd659
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,wcss-qcs404.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_WCSS_QCS404_H
> +#define _DT_BINDINGS_CLK_WCSS_QCS404_H
> +
> +#define WCSS_AHBFABRIC_CBCR_CLK			0
> +#define WCSS_AHBS_CBCR_CLK			1
> +#define WCSS_TCM_CBCR_CLK			2
> +#define WCSS_AHBM_CBCR_CLK			3
> +#define WCSS_AXIM_CBCR_CLK			4
> +#define WCSS_BCR_CBCR_CLK			5
> +#define WCSS_LCC_CBCR_CLK			6
> +#define WCSS_QDSP6SS_XO_CBCR_CLK		7
> +#define WCSS_QDSP6SS_SLEEP_CBCR_CLK		8
> +#define WCSS_QDSP6SS_GFMMUX_CLK			9
> +
> +#define Q6SSTOP_QDSP6SS_RESET			0
> +#define Q6SSTOP_QDSP6SS_CORE_RESET		1
> +#define Q6SSTOP_QDSP6SS_BUS_RESET		2
> +#define Q6SSTOP_BCR_RESET			3

Resets too? Then you need to define #reset-cells.

> +#endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
