Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Thu, 20 Feb 2020 10:59:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200220175911.GA19352@xps15>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211005059.1377279-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Feb 10, 2020 at 04:50:52PM -0800, Bjorn Andersson wrote:
> Add a devicetree binding for the Qualcomm periperal image loader

s/periperal/peripheral

> relocation info region found in the IMEM.

s/info/information

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Replaced offset with reg to describe the region of IMEM used for the entries
> 
>  .../bindings/remoteproc/qcom,pil-info.yaml    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> new file mode 100644
> index 000000000000..8386a4da6030
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm peripheral image loader relocation info binding
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for describing the Qualcomm peripheral
> +  image loader relocation memory region, in IMEM, which is used for post mortem
> +  debugging of remoteprocs.
> +
> +properties:
> +  compatible:
> +    const: qcom,pil-reloc-info
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    imem@146bf000 {
> +      compatible = "syscon", "simple-mfd";
> +      reg = <0 0x146bf000 0 0x1000>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      pil-reloc {
> +        compatible ="qcom,pil-reloc-info";

s/="/= "

> +        reg = <0x94c 200>;
> +      };
> +    };
> +...
> -- 
> 2.24.0
> 
