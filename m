Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5887C4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Aug 2021 20:28:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5DC461057
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Aug 2021 20:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238717AbhHTU3c (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Aug 2021 16:29:32 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46982 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhHTU3b (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Aug 2021 16:29:31 -0400
Received: by mail-ot1-f43.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso16632472ott.13;
        Fri, 20 Aug 2021 13:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BajwmxU1V8pkjUWonRrsIAMOFsGaR6mLSmY4ByEUjYI=;
        b=o9iOgbIpEJQiQV2EgNKzqQteCd3THbYCGKvMTapJIyxFHOpThx9b9F54TT7VJ8UXvK
         u6sBdVFooLnJQ3PC40ojEqfPp2M1KKJClJA4FOwJtpFjgPWXNK2Zz7AAzjMKsug462jJ
         DI6clX2bS4KSpW7OBZ702rmWpCcaDk858GIssk4pAvhtV7JZCf+14WIu93hnjjjKZVvL
         p03oiu9VYW7UWS67jdbBN4Nkk1WhpdTqUQZOU1Y9kJi420sRDx2epU5E1pblqBO1Fv4L
         kwHZgUEeO8PawnEJvmsv6MuT6ah60HOqcw2zYt0HE64FerE4O4EcZtk91zjYshk5jfla
         EBcQ==
X-Gm-Message-State: AOAM530X4zGfh4UfqfzlsY8dI/4i352a653VCAp7jYeOCJQ7q5/d9ar0
        iFYt7CBdhu6wLlwF10xz8Q==
X-Google-Smtp-Source: ABdhPJxw0h4DX2bhJS1tsfKR7zijocVjk6btTA4wg2q7MU6wI4gi7zemdOVp7PY1mCg/3Hj4a+dQig==
X-Received: by 2002:aca:4b49:: with SMTP id y70mr4331372oia.16.1629491333365;
        Fri, 20 Aug 2021 13:28:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c14sm1714641otd.62.2021.08.20.13.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 13:28:52 -0700 (PDT)
Received: (nullmailer pid 4134728 invoked by uid 1000);
        Fri, 20 Aug 2021 20:28:51 -0000
Date:   Fri, 20 Aug 2021 15:28:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
Message-ID: <YSAQgywy8UW540h9@robh.at.kernel.org>
References: <1629453791-10580-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629453791-10580-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Aug 20, 2021 at 06:03:10PM +0800, Shengjiu Wang wrote:
> Define the compatible string and properties needed by imx_dsp_rproc
> driver.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> new file mode 100644
> index 000000000000..7eba49aa959e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/fsl,imx-dsp-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX DSP Remoteproc Devices
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  This binding provides support for DSP processors found on i.mX family of SoCs
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-hifi4
> +      - fsl,imx8qm-hifi4
> +      - fsl,imx8mp-hifi4
> +      - fsl,imx8ulp-hifi4
> +
> +  clocks:
> +    description: |
> +      Main functional clock for the remote processor

Don't need '|' if no formatting. 

> +    minItems: 1
> +    maxItems: 32
> +
> +  clock-names:
> +    description:
> +      List of clock names for the remote processor.
> +      dsp_clkx for clocks of dsp itself.
> +      per_clkx for clocks of peripherals used by dsp.

Sounds like constraints that should be a schema. But this looks like 
some random collection of clocks, not clocks for the DSP h/w.

> +    minItems: 1
> +    maxItems: 32
> +
> +  syscon:

Vendor prefix and name it based on what it points to or is used for.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to syscon block which provide access for processor enablement
> +
> +  mbox-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +      - const: rxdb
> +
> +  mboxes:
> +    description:
> +      This property is required only if the rpmsg/virtio functionality is used.
> +      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
> +      (see mailbox/fsl,mu.yaml)
> +    minItems: 1
> +    maxItems: 3
> +
> +  firmware-name:
> +    description: |
> +      Default name of the firmware to load to the remote processor.
> +
> +  memory-region:
> +    description:
> +      If present, a phandle for a reserved memory area that used for vdev buffer,
> +      resource table, vring region and others used by remote processor.
> +    minItems: 1
> +    maxItems: 32
> +
> +  reg:
> +    description: |
> +      Address space for any remoteproc memories present on the SoC.
> +
> +  power-domains:
> +    minItems: 1
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - reg
> +  - mboxes
> +  - mbox-names
> +  - clocks
> +  - clock-names
> +  - firmware-name
> +
> +additionalProperties: false
> +
> +examples:
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
> +      clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
> +      clock-names = "dsp_clk1", "dsp_clk2", "dsp_clk3";
> +      firmware-name = "imx/dsp/hifi4.bin";
> +      power-domains = <&audiomix_pd>;
> +      mbox-names = "tx", "rx", "rxdb";
> +      mboxes = <&mu2 0 0>,
> +               <&mu2 1 0>,
> +               <&mu2 3 0>;
> +      memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> +                      <&dsp_vdev0vring1>, <&dsp_reserved>;
> +      syscon = <&audio_blk_ctrl>;
> +    };
> -- 
> 2.17.1
> 
> 
