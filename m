Return-Path: <robh@kernel.org>
MIME-Version: 1.0
References: <20190813130946.16448-1-govinds@codeaurora.org> <20190813130946.16448-2-govinds@codeaurora.org>
In-Reply-To: <20190813130946.16448-2-govinds@codeaurora.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Aug 2019 07:43:00 -0600
Message-ID: <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
Content-Type: text/plain; charset="UTF-8"
To: Govind Singh <govinds@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> wrote:
>
> Add devicetree binding for the Q6SSTOP clock controller found in QCS404.

You need to test this with 'make dt_binding_check' and fix the errors.

>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> new file mode 100644
> index 000000000000..861e9ba97ca3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: BSD-2-Clause

GPL-2.0-only OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#

needs updating

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Q6SSTOP clock Controller
> +
> +maintainers:
> +  - Govind Singh <govinds@codeaurora.org>
> +
> +description:
> +   Q6SSTOP clock controller is used by WCSS remoteproc driver
> +   to bring WDSP out of reset.
> +
> +properties:
> +  compatible:
> +    const: "qcom,qcs404-q6sstopcc"
> +
> +  reg:
> +    maxItems: 2
> +    description: Q6SSTOP clocks register region
> +    description: Q6SSTOP_TCSR register region

Not valid json-schema

> +
> +  clocks:
> +    items:
> +      - description: ahb clock for the q6sstopCC

Single item just needs 'maxItems: 1'

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'

Should have an 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    q6sstopcc: clock-controller@7500000 {
> +      compatible = "qcom,qcs404-q6sstopcc";
> +      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
> +      clocks = <&gcc GCC_WCSS_Q6_AHB_CLK>;
> +      #clock-cells = <1>;
> +    };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
