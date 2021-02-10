Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788FDC433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Feb 2021 17:39:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FB9F64ED4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Feb 2021 17:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhBJRjS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Feb 2021 12:39:18 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:43948 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhBJRi1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Feb 2021 12:38:27 -0500
Received: by mail-oi1-f176.google.com with SMTP id d20so2893451oiw.10;
        Wed, 10 Feb 2021 09:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c4tGoeSje1FtQW22/bbQZImu7Ov7f7EbyEaomifyUrs=;
        b=k6ew1uHERz+7Ww3BOovBwn7Tda6ttoXXek0R0SmmOvWL33cxNrR8bphtgb19tXyocm
         TguIlHwSBASSAhk55RbBmTc4fLLRTjZtcbauD9xOrPhEhfCaZbe9UZFEbucQLHU9AELE
         qMjScPeBeDrpMLwYGG6s20iUNp6i084xaAUbJcNZ0mzezu6ZDT08qG9+AUOjM3o66exM
         Kd4/TjOCbkMNw9AaSEGPSZvUVDcR6rpc9pJDEg4saKtflni5CK05kZUQy5a/Yjr4JQ3r
         1uF5HE/YBeje+gEKTUqawWBYoSl3654l2ubeAySqY6os0A7eeFLiBZndc9uZO/drhfJD
         7i0A==
X-Gm-Message-State: AOAM5323IHA1RmP9ofIfYpGbU3GK9mGdj7PpVagNxVtTqDFUL9UTNRyE
        E0szt8e7uJ3WlJiYevYuQA==
X-Google-Smtp-Source: ABdhPJzG5D8rmY8Fs9oCnBNgJ8fWU+eJIXdu9Ees0oagTus8bwF5UCVgqLBnaV8QHAQK8kR4sKOZZA==
X-Received: by 2002:aca:1903:: with SMTP id l3mr2965163oii.133.1612978663815;
        Wed, 10 Feb 2021 09:37:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r4sm580938oig.52.2021.02.10.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 09:37:43 -0800 (PST)
Received: (nullmailer pid 2401604 invoked by uid 1000);
        Wed, 10 Feb 2021 17:37:41 -0000
Date:   Wed, 10 Feb 2021 11:37:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V10 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Message-ID: <20210210173741.GA2378005@robh.at.kernel.org>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
 <1612774571-6134-2-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612774571-6134-2-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Feb 08, 2021 at 04:56:02PM +0800, peng.fan@oss.nxp.com wrote:
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
> index 000000000000..5e906fa6a39d
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
> +    maxItems: 1
> +
> +  syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to syscon block which provide access to System Reset Controller
> +
> +  memory-region:
> +    description:
> +      If present, a phandle for a reserved memory area that used for vdev buffer,
> +      resource table, vring region and others used by remote processor.

You need to define what each one is as a schema. How does the driver 
know which one is the vring region for example? Minimally, it's:

items:
  - description: ...
  - description: ...
  - description: ...

But if what's present is variable, then it gets more complicated. If the 
OS side doesn't need to know what each region is, then you can do just:

minItems: N
maxItems: M

Rob



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
> 2.30.0
> 
