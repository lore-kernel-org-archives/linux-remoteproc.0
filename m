Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39883C001B0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 24 Jul 2023 15:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjGXP7f (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 24 Jul 2023 11:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjGXP7e (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Jul 2023 11:59:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F5B19A;
        Mon, 24 Jul 2023 08:59:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B76B1611EC;
        Mon, 24 Jul 2023 15:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01685C433C8;
        Mon, 24 Jul 2023 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690214373;
        bh=UQw9N6ePBKFI8Sse/AmiqNhETIeIuaipUKydlV16gXw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bY6O6oYhpQu3GQE8O/WHheD7jj6yH3aZF1isrP36+WJYHg9J6s4EgxtrClgIcDIuc
         LBGpdgYNiAdryY4yDQkLnJZqKR0cet7DuVs8v4R18PQOBlGeyOhwkv5c1Gm2Khf4S6
         NkSxdkX5DTlWwItFme4QKjEdgeTKEkhqcf2cWsJXXIjBdtLAIdk9B7CRu9nnip/Zoi
         QYuenFeUGxpbRKb/LAZePeJCJaxViT5/p0Qy+VIJh48hq0xk61SCwj/SiseQfMU0Cl
         xugLTDUzq2l05Vu6ssWk4cce2ptAFQbgMGugTJp80H2GHRVkkBa6KTqQzKeUct+DBJ
         zjHagysnU52WQ==
Received: (nullmailer pid 3617994 invoked by uid 1000);
        Mon, 24 Jul 2023 15:59:30 -0000
Date:   Mon, 24 Jul 2023 09:59:30 -0600
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
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: imx_rproc: Support
 i.MX8MN/P MMIO
Message-ID: <20230724155930.GA3616168-robh@kernel.org>
References: <20230720125549.72929-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720125549.72929-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jul 20, 2023 at 02:55:48PM +0200, Marek Vasut wrote:
> The MX8M CM7 boot via SMC call is problematic, since not all versions
> of ATF support this interface. Document MMIO support used to boot the
> CM7 on MX8MN/MP instead and discern MMIO interface using DT compatible
> string. Document GPR register syscon phandle which is required by the
> MMIO interface too.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
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
> V2: Rename 'gpr' to 'fsl,iomuxc-gpr'
> ---
> Note that the MMIO being discerned using compatible string is similar
> approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 0c3910f152d1d..cd352fd38e891 100644
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
> @@ -70,6 +72,11 @@ properties:
>      description:
>        Specify CPU entry address for SCU enabled processor.
>  
> +  fsl,iomuxc-gpr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bit.
> +
>    fsl,resource-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -79,6 +86,19 @@ properties:
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

Not the right property name.

> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.40.1
> 
