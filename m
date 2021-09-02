Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0189C432BE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Sep 2021 15:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C49EC6023F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Sep 2021 15:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345723AbhIBPST (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Sep 2021 11:18:19 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:33528 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345637AbhIBPST (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Sep 2021 11:18:19 -0400
Received: by mail-oo1-f43.google.com with SMTP id v20-20020a4a2554000000b0028f8cc17378so647859ooe.0;
        Thu, 02 Sep 2021 08:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wb8GAkVFI8Sl87zRPGOegu+hAFVLLxzYkVhxsVOueuQ=;
        b=Vv9njS9fL7fz/8eYVG3kqVGV4ZQecwHTdU2gCfxrzVE0JlazpUTBeaEKct4gYMKWVa
         PAjXHiW3GUWWat+C8oFMpcqw/efk8VpIqTVv4jI3+YW5wlis4ivbnSaiQj8lnWUwW+RF
         w/bbXp93OTIfmRJtimMehK7GiMKOMzfoSKJiDAmhW3DdfznSdYYNbi2x509AipUHJKCi
         SMUhwglcJW35DixDzygQINyRgmZyyAfQfIwfwcgabdM0TU76KhKg3FFbphiwMjab6smI
         1f4y3VaKg9R/9qWZAyP5PKeXjHYl8Mj2hz7wK9S2fvjcOlxc9zMA/PVAs+6z36wbzs0G
         4swQ==
X-Gm-Message-State: AOAM532w8YL4ZJpD3LwC92h0Pp0vyEjGTpzkqkakw6VrqlrkRiUNL0Em
        Ad/1x5+sUt3o1OXQDDvJmA==
X-Google-Smtp-Source: ABdhPJyHT2iskMmpIirm793k/KgiFwRfX7emNwuGQj8LONOKcauHnPKJaq88rx2wFJQuHLCYfFFShw==
X-Received: by 2002:a4a:ba0f:: with SMTP id b15mr3027879oop.31.1630595840199;
        Thu, 02 Sep 2021 08:17:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z78sm419358ooa.29.2021.09.02.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:17:19 -0700 (PDT)
Received: (nullmailer pid 936408 invoked by uid 1000);
        Thu, 02 Sep 2021 15:17:18 -0000
Date:   Thu, 2 Sep 2021 10:17:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
Message-ID: <YTDq/kWFPLHUnHMN@robh.at.kernel.org>
References: <1629876516-16513-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629876516-16513-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Aug 25, 2021 at 03:28:35PM +0800, Shengjiu Wang wrote:
> Define the compatible string and properties needed by imx_dsp_rproc
> driver.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - add items for clock-names
> - change syscon to fsl,dsp-ctrl 
> 
>  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> new file mode 100644
> index 000000000000..edf6e4b8d7bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> @@ -0,0 +1,150 @@
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

i.MX

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
> +    description:
> +      Main functional clock for the remote processor
> +    minItems: 1
> +    maxItems: 32
> +
> +  clock-names:
> +    description: |
> +      List of clock names for the remote processor.
> +      dsp_clkx for clocks of dsp itself.
> +      per_clkx for clocks of peripherals used by dsp.

I still don't like your random collection of clocks. What if you have 
other resources besides clocks to manage? Pin mux, resets, power 
domains, etc. It would be better if you describe the peripherals in DT 
and then link to them here. But maybe the devices themselves aren't 
visible?

> +    minItems: 1
> +    maxItems: 26
> +    items:
> +      - const: dsp_clk1
> +      - const: dsp_clk2
> +      - const: dsp_clk3
> +      - const: dsp_clk4
> +      - const: dsp_clk5
> +      - const: dsp_clk6
> +      - const: dsp_clk7
> +      - const: dsp_clk8

Surely you can name these by function? e.g. core, bus, axi, etc.

> +      - const: per_clk1
> +      - const: per_clk2
> +      - const: per_clk3
> +      - const: per_clk4
> +      - const: per_clk5
> +      - const: per_clk6
> +      - const: per_clk7
> +      - const: per_clk8
> +      - const: per_clk9
> +      - const: per_clk10
> +      - const: per_clk11
> +      - const: per_clk12
> +      - const: per_clk13
> +      - const: per_clk14
> +      - const: per_clk15
> +      - const: per_clk16
> +      - const: per_clk17
> +      - const: per_clk18
> +
> +  fsl,dsp-ctrl:
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
> +      fsl,dsp-ctrl = <&audio_blk_ctrl>;
> +    };
> -- 
> 2.17.1
> 
> 
