Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FBAC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Sep 2021 22:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A2A161440
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Sep 2021 22:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347293AbhI2Wm3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 29 Sep 2021 18:42:29 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:46925 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245276AbhI2Wm2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Sep 2021 18:42:28 -0400
Received: by mail-oi1-f172.google.com with SMTP id s69so4824991oie.13;
        Wed, 29 Sep 2021 15:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0k8QEGDkWOEZomdc31cmFkj67+dTtY4xDrRsR7/J3H4=;
        b=Ey6zTCCMfvzeluMpe2umKCcuIq96uHgiY1lsKBkXDyPEBdFsHNnA1Dc5/FUOAW1giW
         5VHkSqCfd0w7FaNzWmQIGCMYgLXYVAYyBD5xaQx7VZ5ltofM4Gopt/VoU8N4bIBP0Wd+
         rV841Ajq4oRT/9YvcowvoETgeZ+xKBktqkpm1OAIOkl+LOf8D5bEsSCyw22e/snozr8l
         DEp9a0q5RDnjynfYXvHLfuXxnRC5H8rY0HsbKy5565mxXgNjgXzJEfenlAqYmUOKlQRo
         +UtYV1DZtIUsL4TCZNc27E/sz5FKRsaxZin3dANE6Ro3mNgeyxvk0nEsbd4LcdPxRw/m
         gHWQ==
X-Gm-Message-State: AOAM5314jsCyGtP7YCw2uVzVwGj+/tuned2nbTY4oge3DdDscckAwhcf
        vMqBgeoC1LtYQsgLkuO+w4iavL98dA==
X-Google-Smtp-Source: ABdhPJw8P4gHBGbTTp4HBgqGLki+VVFSC9EKFwccIS1oy4vwK8s9Ozm4KLc85vBzLDXc+qDVpPvKpw==
X-Received: by 2002:aca:4285:: with SMTP id p127mr38975oia.117.1632955246173;
        Wed, 29 Sep 2021 15:40:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h91sm214240otb.38.2021.09.29.15.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 15:40:45 -0700 (PDT)
Received: (nullmailer pid 359085 invoked by uid 1000);
        Wed, 29 Sep 2021 22:40:44 -0000
Date:   Wed, 29 Sep 2021 17:40:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v5 4/4] dt-bindings: dsp: fsl: update binding document
 for remote proc driver
Message-ID: <YVTrbPC4/ir974xs@robh.at.kernel.org>
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Sep 26, 2021 at 11:07:10AM +0800, Shengjiu Wang wrote:
> As there are two drivers for DSP on i.MX, one is for sound open
> firmware, another is for remote processor framework. In order to
> distinguish two kinds of driver, defining different compatible strings.
> 
> For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> are needed and the mailbox channel is different with SOF.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
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

Don't need maxItems.

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

ditto

>  
>    power-domains:
>      description:
>        List of phandle and PM domain specifier as documented in
>        Documentation/devicetree/bindings/power/power_domain.txt
> +    minItems: 1

This is curious. The h/w sometimes has fewer power domains?

>      maxItems: 4
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
