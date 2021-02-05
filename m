Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF09FC433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Feb 2021 20:30:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B53E64E02
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Feb 2021 20:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhBESre (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 Feb 2021 13:47:34 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:46634 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhBESqF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 Feb 2021 13:46:05 -0500
Received: by mail-oi1-f170.google.com with SMTP id k25so8815270oik.13;
        Fri, 05 Feb 2021 12:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jX/IDqbyvll8w6wyZZ4Cj2yRz+uUuRNKbkr2Ni7Gh1A=;
        b=sPWDBDOboVtgz7L6+2wMX3yxMcRic20z0HxEh4rheyWS5nREb2wU2RCrnD2AiNrPJP
         JUgt/lDRG61cjiBk4K5NE3lL729DAdt4tvt4gzFpwpzHghQFPTagMGUBv5Nr6FshP4Y1
         7eHeKCDvU6M9E33S1QUt1zMrRvRuOeeHoKk82wWzox+Wx9cqIQ+oUnyIxMOnUNFdKvOS
         LepKMesD1qzyRlVMtdlSK7YaCHH7CdWBs3Rr6/m+zmO22RcWoqk/uMXeT8Jzr2ncW9pv
         /US6TM+OALEuw5TJDvXiwBWGcuAscw24nGgPCNgzh7N779/fokCIBxkEBGgIyzhcBfbs
         kUsw==
X-Gm-Message-State: AOAM53008rG7fixeVIrgMN7Lu6TgLXHGM+p0YbThnMeZIahk9Z/Nhuby
        q73R3astt1iF4y8ZheMRzQ==
X-Google-Smtp-Source: ABdhPJz8CUi5+i96guoIgJKUCUhhGLrPNUElr8USXuQmVUt0ogKvxivHEPBFlzbi0C4QhUI2PZOt5g==
X-Received: by 2002:a05:6808:918:: with SMTP id w24mr4326260oih.20.1612556869753;
        Fri, 05 Feb 2021 12:27:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l12sm1995301oov.37.2021.02.05.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 12:27:48 -0800 (PST)
Received: (nullmailer pid 3669209 invoked by uid 1000);
        Fri, 05 Feb 2021 20:27:47 -0000
Date:   Fri, 5 Feb 2021 14:27:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V9 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Message-ID: <20210205202747.GA3664957@robh.at.kernel.org>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
 <1611191015-22584-2-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611191015-22584-2-git-send-email-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 21, 2021 at 09:03:26AM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert the imx rproc binding to DT schema format using json-schema.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 59 +++++++++++++++++++
>  .../bindings/remoteproc/imx-rproc.txt         | 33 -----------
>  2 files changed, 59 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> new file mode 100644
> index 000000000000..bce6ccfe1538
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: NXP iMX6SX/iMX7D Co-Processor Bindings
> +
> +description:
> +  This binding provides support for ARM Cortex M4 Co-processor found on some NXP iMX SoCs.
> +
> +maintainers:
> +  - Peng Fan <peng.fan@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx7d-cm4
> +      - fsl,imx6sx-cm4
> +
> +  clocks:
> +    description:
> +      Clock for co-processor (See ../clock/clock-bindings.txt)

Drop description. You need to define how many clocks (maxItems: 1)

> +
> +  syscon:
> +    description:
> +      Phandle to syscon block which provide access to System Reset Controller

type ref

> +
> +  memory-region:
> +    description:
> +      list of phandels to the reserved memory regions.
> +      (see ../reserved-memory/reserved-memory.txt)

Don't need a generic description for a common property.

How many and what is each one.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx7d-clock.h>
> +    m4_reserved_sysmem1: cm4@80000000 {
> +      reg = <0x80000000 0x80000>;
> +    };
> +
> +    m4_reserved_sysmem2: cm4@81000000 {
> +      reg = <0x81000000 0x80000>;
> +    };
> +
> +    imx7d-cm4 {
> +      compatible	= "fsl,imx7d-cm4";
> +      memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
> +      syscon		= <&src>;
> +      clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> deleted file mode 100644
> index fbcefd965dc4..000000000000
> --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -NXP iMX6SX/iMX7D Co-Processor Bindings
> -----------------------------------------
> -
> -This binding provides support for ARM Cortex M4 Co-processor found on some
> -NXP iMX SoCs.
> -
> -Required properties:
> -- compatible		Should be one of:
> -				"fsl,imx7d-cm4"
> -				"fsl,imx6sx-cm4"
> -- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
> -- syscon		Phandle to syscon block which provide access to
> -			System Reset Controller
> -
> -Optional properties:
> -- memory-region		list of phandels to the reserved memory regions.
> -			(See: ../reserved-memory/reserved-memory.txt)
> -
> -Example:
> -	m4_reserved_sysmem1: cm4@80000000 {
> -		reg = <0x80000000 0x80000>;
> -	};
> -
> -	m4_reserved_sysmem2: cm4@81000000 {
> -		reg = <0x81000000 0x80000>;
> -	};
> -
> -	imx7d-cm4 {
> -		compatible	= "fsl,imx7d-cm4";
> -		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
> -		syscon		= <&src>;
> -		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
> -	};
> -- 
> 2.28.0
> 
