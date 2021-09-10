Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF47FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 21:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBF7D6120A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 21:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbhIJVpF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 17:45:05 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:37519 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234660AbhIJVpE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 17:45:04 -0400
Received: by mail-oi1-f177.google.com with SMTP id y128so4896704oie.4;
        Fri, 10 Sep 2021 14:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wN8Y2wY394DQtoDB0ZKstnKrvfl0KfDm4sPTZE7KEbI=;
        b=QKG+1TtVLawGrrgCCRwri3d3F0ADcMgsVLNyq2F8h+5dA4yWnbzyqdyji2ltr6t7f2
         tDFsclk1wxwDnqcGp+lnyDlLFuYSfkBuUKsbRR7z8N5ggtXQ97iksqYm4Z2dlulA+wM7
         4cf+lOdMzYjOGR99ImnopG0Ho7bS/I0lN5hGKYogp93z4H99/4nRW+81nIM2l/d1V9hY
         WJAAijkX4UHJpT0yhrhc7m3FDvH19Igq4u57Rfx7jl48rFJgmm2rnopsRG5GC3uwKkRP
         xkaQInz5s1VXtrVToEOUkc2P9FIZedjwNKBZfanf2fXX/R2TdVzikXlSmuR+h0ZhO/kh
         Klwg==
X-Gm-Message-State: AOAM532JyvmGl2BZyWwtkP5C1lMeyuejXbfnpLtneifXmWmx5S+tM/Ur
        1Fs1utVqZO0Lqz8lUOrmkg==
X-Google-Smtp-Source: ABdhPJzI5jZ1We8L4wQ3ky0Qn8k47NIXcaY1it3c6cBzK5okGJJz8CdOgksLylAhdG6yIILzd4GFvg==
X-Received: by 2002:aca:b6d5:: with SMTP id g204mr5941193oif.29.1631310232763;
        Fri, 10 Sep 2021 14:43:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y138sm1581590oie.22.2021.09.10.14.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 14:43:51 -0700 (PDT)
Received: (nullmailer pid 3430328 invoked by uid 1000);
        Fri, 10 Sep 2021 21:43:50 -0000
Date:   Fri, 10 Sep 2021 16:43:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        daniel.baluta@nxp.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v4 4/4] dt-bindings: dsp: fsl: update binding document
 for remote proc driver
Message-ID: <YTvRlmIedfBiXSCg@robh.at.kernel.org>
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631092255-25150-5-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 08, 2021 at 05:10:55PM +0800, Shengjiu Wang wrote:
> As there are two drivers for DSP on i.MX, one is for sound open
> firmware, another is for remote processor framework. In order to
> distinguish two kinds of driver, defining different compatible strings.

What determines which firmware is used? Is it tied to the board? Or for 
a given board, users could want different firmware? In the latter case, 
this configuration should not be in DT.

> For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> are needed and the mailbox channel is different with SOF.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
>  1 file changed, 75 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> index 7afc9f2be13a..51ea657f6d42 100644
> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
>  
>  maintainers:
>    - Daniel Baluta <daniel.baluta@nxp.com>
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
>  
>  description: |
>    Some boards from i.MX8 family contain a DSP core used for
> @@ -19,6 +20,10 @@ properties:
>        - fsl,imx8qxp-dsp
>        - fsl,imx8qm-dsp
>        - fsl,imx8mp-dsp
> +      - fsl,imx8qxp-hifi4
> +      - fsl,imx8qm-hifi4
> +      - fsl,imx8mp-hifi4
> +      - fsl,imx8ulp-hifi4
>  
>    reg:
>      maxItems: 1
> @@ -28,37 +33,63 @@ properties:
>        - description: ipg clock
>        - description: ocram clock
>        - description: core clock
> +      - description: debug interface clock
> +      - description: message unit clock
> +    minItems: 3
> +    maxItems: 5
>  
>    clock-names:
>      items:
>        - const: ipg
>        - const: ocram
>        - const: core
> +      - const: debug
> +      - const: mu
> +    minItems: 3
> +    maxItems: 5
>  
>    power-domains:
>      description:
>        List of phandle and PM domain specifier as documented in
>        Documentation/devicetree/bindings/power/power_domain.txt
> +    minItems: 1
>      maxItems: 4

How does the same h/w have different number of power domains?

>  
>    mboxes:
>      description:
>        List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
> +      or - 1 channel for TX, 1 channel for RX, 1 channel for RXDB
>        (see mailbox/fsl,mu.txt)
> +    minItems: 3
>      maxItems: 4
>  
>    mbox-names:
> -    items:
> -      - const: txdb0
> -      - const: txdb1
> -      - const: rxdb0
> -      - const: rxdb1
> +    oneOf:
> +      - items:
> +          - const: txdb0
> +          - const: txdb1
> +          - const: rxdb0
> +          - const: rxdb1
> +      - items:
> +          - const: tx
> +          - const: rx
> +          - const: rxdb

These are completely different mailboxes?

>  
>    memory-region:
>      description:
>        phandle to a node describing reserved memory (System RAM memory)
>        used by DSP (see bindings/reserved-memory/reserved-memory.txt)
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
> +
> +  firmware-name:
> +    description: |
> +      Default name of the firmware to load to the remote processor.
> +
> +  fsl,dsp-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to syscon block which provide access for processor enablement

Curious, how is this done with the open sound f/w?

>  
>  required:
>    - compatible
> @@ -91,3 +122,41 @@ examples:
>          mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
>          memory-region = <&dsp_reserved>;
>      };
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    dsp_reserved: dsp@92400000 {
> +      reg = <0x92400000 0x1000000>;
> +      no-map;
> +    };
> +    dsp_vdev0vring0: vdev0vring0@942f0000 {
> +      reg = <0x942f0000 0x8000>;
> +      no-map;
> +    };
> +    dsp_vdev0vring1: vdev0vring1@942f8000 {
> +      reg = <0x942f8000 0x8000>;
> +      no-map;
> +    };
> +    dsp_vdev0buffer: vdev0buffer@94300000 {
> +      compatible = "shared-dma-pool";
> +      reg = <0x94300000 0x100000>;
> +      no-map;
> +    };
> +
> +    dsp: dsp@3b6e8000 {
> +      compatible = "fsl,imx8mp-hifi4";
> +      reg = <0x3B6E8000 0x88000>;
> +      clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
> +      clock-names = "ipg", "ocram", "core", "debug";
> +      firmware-name = "imx/dsp/hifi4.bin";
> +      power-domains = <&audiomix_pd>;
> +      mbox-names = "tx", "rx", "rxdb";
> +      mboxes = <&mu2 0 0>,
> +               <&mu2 1 0>,
> +               <&mu2 3 0>;
> +      memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> +                      <&dsp_vdev0vring1>, <&dsp_reserved>;
> +      fsl,dsp-ctrl = <&audio_blk_ctrl>;
> +    };
> -- 
> 2.17.1
> 
> 
