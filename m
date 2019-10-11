Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
References: <20191002151907.15986-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002151907.15986-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Oct 2019 07:41:10 -0500
Message-ID: <CAL_Jsq+p6rYun-zOwK49=QSfuJGMpiXj5UfASdXhjmOX1cudWQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: hwlock: Convert stm32 hwspinlock bindings to json-schema
Content-Type: text/plain; charset="UTF-8"
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Oct 2, 2019 at 10:19 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 hwspinlock binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 -----------
>  .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 48 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
>
> diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
> deleted file mode 100644
> index adf4f000ea3d..000000000000
> --- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -STM32 Hardware Spinlock Device Binding
> --------------------------------------
> -
> -Required properties :
> -- compatible : should be "st,stm32-hwspinlock".
> -- reg : the register address of hwspinlock.
> -- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
> -       hwlock, so the number of cells should be <1> here.
> -- clock-names : Must contain "hsem".
> -- clocks : Must contain a phandle entry for the clock in clock-names, see the
> -       common clock bindings.
> -
> -Please look at the generic hwlock binding for usage information for consumers,
> -"Documentation/devicetree/bindings/hwlock/hwlock.txt"
> -
> -Example of hwlock provider:
> -       hwspinlock@4c000000 {
> -               compatible = "st,stm32-hwspinlock";
> -               #hwlock-cells = <1>;
> -               reg = <0x4c000000 0x400>;
> -               clocks = <&rcc HSEM>;
> -               clock-names = "hsem";
> -       };
> diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> new file mode 100644
> index 000000000000..64e169702515
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/st,stm32-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Hardware Spinlock bindings
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +  - Fabien Dessenne <fabien.dessenne@st.com>
> +
> +properties:
> +  "#hwlock-cells": true

const: 1

> +
> +  compatible:
> +    const: st,stm32-hwspinlock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock

Don't need a description for a single item.

maxItems: 1

> +
> +  clock-names:
> +    items:
> +      - const: hsem
> +
> +required:
> +  - "#hwlock-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Add a:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    hwspinlock@4c000000 {
> +        compatible = "st,stm32-hwspinlock";
> +        #hwlock-cells = <1>;
> +        reg = <0x4c000000 0x400>;
> +        clocks = <&rcc HSEM>;
> +        clock-names = "hsem";
> +    };
> +
> +...
> --
> 2.15.0
>
