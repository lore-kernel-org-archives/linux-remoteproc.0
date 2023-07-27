Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE062C04A6A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 27 Jul 2023 16:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbjG0Q7J (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Jul 2023 12:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbjG0Q7H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Jul 2023 12:59:07 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B150273C
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jul 2023 09:59:06 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2680eee423aso705147a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jul 2023 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690477145; x=1691081945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+h5b9iSf68eT3e10rX6ZgnouDl7RDMsV+Kj+5zmd2qQ=;
        b=g2jGtsst0SlvCOD9xfUpQfNh+0s42T45Fnxqcaze8ENV3PSes8kD0NCLLFG4IytI39
         9d6vwjR7pmB5+qCCfj4hXSvE8qrjrpbnsEgOUZSdCpKnVoXF0Ts3v9R+YAdJ6PrbW5AO
         1SwYE1wozO8PNN9rmGxsmQrDQHl9QQkembBp6WyJcsOkQRMQ4j4A9CuRc2vvrWRsnvjk
         M/8Gjx3wO13A46gf+QvbMt/UzZ0mo2UEQrv2p+JrcK1qImSVKhOZBxMrWEQi2iEJH+vM
         80fADN92F7sGIaG4XLwErVf/rc1d5PGgvzi1xdch9YJvwFtxM1mWwIpsuWUjCJcWUdiJ
         ksLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690477145; x=1691081945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h5b9iSf68eT3e10rX6ZgnouDl7RDMsV+Kj+5zmd2qQ=;
        b=FDaixMmufHmJ8R0gRLJawE/ti4YnIKSKBs1PFCgX7XABTQXZUvGb4/ydC/ghmK8B2m
         ejz6x2DUkc2K/baPOT19hmnSpc0AI9S5RHJBG8wevYR8X1suI7I6dywsK2o2azn/CmFg
         t4QAS+mIlxudJepdeSDNajURMp7LxX6rSjg6Zp+3LVPuvq/r2p3dRHkJC7p4/yoomj8s
         4VNgpIDRqrwLMtuMJPxSasqV7wAeZkjOEx9xuJLre34u5uc7A/orvQudFsK4oQQtF035
         3tblFrGRbAZBpspBRaUgNa9Nqak6uiZr+SYGs1m9YiecK2NXP3c4JhZOCNl4C0/e1ZDG
         st8Q==
X-Gm-Message-State: ABy/qLYuoafdupgDU1Ku1lqTSLxDmdyNa+is6Pxrkezh/EdDIfGjfsq+
        dKDoAh3nHRcbXpSebvJlZmY4tg==
X-Google-Smtp-Source: APBJJlENijKfsxSssGg95/tJuzhiRfsI+T8WQ3e9RaVBEdUkdytKbkBXKnoBHRSOD8cBfUR1PwZptA==
X-Received: by 2002:a17:90b:4f8b:b0:268:1355:b03e with SMTP id qe11-20020a17090b4f8b00b002681355b03emr4502908pjb.38.1690477145456;
        Thu, 27 Jul 2023 09:59:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b3f9:2cf3:dfbd:a9b6])
        by smtp.gmail.com with ESMTPSA id t12-20020a17090b018c00b002639c4f81cesm3043086pjs.3.2023.07.27.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:59:05 -0700 (PDT)
Date:   Thu, 27 Jul 2023 10:59:02 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: imx_rproc: Support
 i.MX8MN/P MMIO
Message-ID: <ZMKiViF+RHhxQNa5@p14s>
References: <20230724222418.163220-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724222418.163220-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 25, 2023 at 12:24:17AM +0200, Marek Vasut wrote:
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
> V3: Rename 'gpr' to 'fsl,iomuxc-gpr' everywhere
> ---
> Note that the MMIO being discerned using compatible string is similar
> approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 0c3910f152d1d..30632efdad8bb 100644
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
> +        fsl,iomuxc-gpr: false
> +
>  additionalProperties: false
>  
>  examples:

I have applied this set.  Next time please add a cover letter.

Thanks,
Mathieu

> -- 
> 2.40.1
> 
