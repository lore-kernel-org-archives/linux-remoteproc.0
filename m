Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC42EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 15:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbjGJPLX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 11:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbjGJPLW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 11:11:22 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51793CE;
        Mon, 10 Jul 2023 08:11:15 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-785d738d3feso96794339f.0;
        Mon, 10 Jul 2023 08:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689001874; x=1691593874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEqrMLnjEUxCr6aEmxPCpimypFNMbrkfHOAE1F5JhwM=;
        b=KG4ZDJfdAZWfNAN7gMoc2gwBdMGsSvahSKkpcjtrz7XboddJnGZ9XPBTX7I98fYdP0
         gR2tzC5OwY/c0dR+RZtQH3MowFWHSFZPnZ2/0c1dmk9tMh6RPg+f33PjDBNMD8r0amoo
         hgZgL5g5qyTUTy3PxB5E2p7g8296p3X/bnEqdwP1ttZDoCutKSnu8A5ldxUkUIilQU+w
         2NAfFOxb1TSoIi9KYXdqrYZSoqxbSMgml8/SL0AQ+7+4gHh70X+PW3OSJ4LC5o4PXOWx
         tFLZ89YzMlaWehZiW94BgmEKTTQRm9lwdrcpuimNP4bYEBmTxNaNJAQbXjESMHTT85FO
         hWcg==
X-Gm-Message-State: ABy/qLZbnK5i2I3fIfU0dYx1tv9RcAiXFSFxFvwboIdISPTgyKplySLK
        apUifXQ9w+cCffeewhyEf3XrYbHOag==
X-Google-Smtp-Source: APBJJlEflcNVhS3FsY6mOFGzzSqsLoDIwCvCnTSXqdnUyhdjKz/lxfe/iEoKcSWmHbBsGhuN1rRmbQ==
X-Received: by 2002:a05:6602:59e:b0:786:cd20:8e1d with SMTP id v30-20020a056602059e00b00786cd208e1dmr8803834iox.4.1689001874518;
        Mon, 10 Jul 2023 08:11:14 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u16-20020a02cbd0000000b004165ac64e0asm3402846jaq.40.2023.07.10.08.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:11:13 -0700 (PDT)
Received: (nullmailer pid 1985030 invoked by uid 1000);
        Mon, 10 Jul 2023 15:11:12 -0000
Date:   Mon, 10 Jul 2023 09:11:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support
 i.MX8MN/P MMIO
Message-ID: <20230710151112.GA1983533-robh@kernel.org>
References: <20230707232626.374475-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707232626.374475-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Jul 08, 2023 at 01:26:25AM +0200, Marek Vasut wrote:
> The MX8M CM7 boot via SMC call is problematic, since not all versions
> of ATF support this interface. Document MMIO support used to boot the
> CM7 on MX8MN/MP instead and discern MMIO interface using DT compatible
> string. Document GPR register syscon phandle which is required by the
> MMIO interface too.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Note that the MMIO being discerned using compatible string is similar
> approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c940199ce89df..78bb976f738ee 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -20,7 +20,9 @@ properties:
>        - fsl,imx7ulp-cm4
>        - fsl,imx8mm-cm4
>        - fsl,imx8mn-cm7
> +      - fsl,imx8mn-cm7-mmio
>        - fsl,imx8mp-cm7
> +      - fsl,imx8mp-cm7-mmio
>        - fsl,imx8mq-cm4
>        - fsl,imx8qm-cm4
>        - fsl,imx8qxp-cm4
> @@ -30,6 +32,11 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  gpr:

fsl,gpr or fsl,iomuxc-gpr

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bit.
> +
>    syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -84,6 +91,19 @@ properties:
>  required:
>    - compatible
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - fsl,imx8mn-cm7-mmio
> +                - fsl,imx8mp-cm7-mmio
> +    then:
> +      properties:
> +        gpr: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.40.1
> 
