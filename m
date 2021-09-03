Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965F0C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 07:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7850C60295
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 07:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348147AbhICHzw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Sep 2021 03:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348135AbhICHzu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Sep 2021 03:55:50 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20046C061575;
        Fri,  3 Sep 2021 00:54:51 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id a66so4976851qkc.1;
        Fri, 03 Sep 2021 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5fuqcIdn5J86qWLEUURCKMJp4w9lu6BbCFdQDOMDsI=;
        b=RmjQtbWU5lPM3BeSZtYcerCT37CdwZTY0xgGphLc+tTVNbE6blDKMqxdVuQrj45CwL
         ZTDuQ3VBy9V2i5wS6mir8KQ6W4R2Sbl4AwVpaDaKbvwlASfq04XFnn7oJw3GXEhfUL8y
         FnFYfhzEtdqJt17JObZArLQc38R5n+4g5UNSPI8WP4yldQt9+V5rMBkZBHDoSYyG7fxk
         pUK97+FFF+HMObPJn+EDjixzMDkGmSQybmzwfSOQlOPFgHkEObJSWotw/JEw/WfeQoCE
         dlhwIS0wIiWhGjmFqhM2jsRJOd7I+aAGW2/4yBJMm37ZOmuxsUaUTo0uibFNRA0HzYtM
         r+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5fuqcIdn5J86qWLEUURCKMJp4w9lu6BbCFdQDOMDsI=;
        b=s4Aeb5KPQPki9BoaAzze2RkoYci2YEu58OVxHZQaZ33S/X07+dg4ZgqSZPbGGLHhXg
         loSGZMtQ3tbXp56kiwr/cAh1Uo/3qGyAr/wtlgal/hQxBpGfySQ5TzMkTAq2G1ds2M7m
         e5Xn9hNxvSTj/hYf2jxKgh3873A88v3/f20mTnZg/0ZuAHyK0rQgJ7guyBBqDNwG3KrS
         wPdFQ50B5KUZT6hQGM3BXwiKahd70bC+EHfSDs74Bw8gpih2imkhUkT2SI6nQ2+nWB8G
         yjMrgtKaOakoY+7Mpc/x2YARHgQdj0sKfavO8N+w+SxRqR9x67+fTc93Nnb+noRnBPpV
         VKrg==
X-Gm-Message-State: AOAM531HM8HbNlX6P9ol1Jcpm0qpN2f2A2qoMUtGrHdCdeRNrEgXltPT
        vhaSh3vZx1eEuZacNfArHUTfx5WnKPRgxJM+DE8=
X-Google-Smtp-Source: ABdhPJxcIUKvKHIhhX1gJAUzH8+mLGFCf1ojqji/a5xyTvbjMfQmQjw71WPSfBZsbgqDF8EPawH0kw25DCzu8zy1LFM=
X-Received: by 2002:a05:620a:1195:: with SMTP id b21mr2215857qkk.450.1630655690274;
 Fri, 03 Sep 2021 00:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <1629876516-16513-1-git-send-email-shengjiu.wang@nxp.com> <YTDq/kWFPLHUnHMN@robh.at.kernel.org>
In-Reply-To: <YTDq/kWFPLHUnHMN@robh.at.kernel.org>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Fri, 3 Sep 2021 15:54:39 +0800
Message-ID: <CAA+D8AOPRQRPtafZ2yryP8pn7=Foaj6ctehpZ9S_c1YQ3kUL9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
To:     Rob Herring <robh@kernel.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Ohad Ben Cohen <ohad@wizery.com>, bjorn.andersson@linaro.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob

On Thu, Sep 2, 2021 at 11:17 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Aug 25, 2021 at 03:28:35PM +0800, Shengjiu Wang wrote:
> > Define the compatible string and properties needed by imx_dsp_rproc
> > driver.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - add items for clock-names
> > - change syscon to fsl,dsp-ctrl
> >
> >  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 150 ++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> > new file mode 100644
> > index 000000000000..edf6e4b8d7bb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> > @@ -0,0 +1,150 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/fsl,imx-dsp-rproc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX DSP Remoteproc Devices
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description:
> > +  This binding provides support for DSP processors found on i.mX family of SoCs
>
> i.MX

I will update it.

>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qxp-hifi4
> > +      - fsl,imx8qm-hifi4
> > +      - fsl,imx8mp-hifi4
> > +      - fsl,imx8ulp-hifi4
> > +
> > +  clocks:
> > +    description:
> > +      Main functional clock for the remote processor
> > +    minItems: 1
> > +    maxItems: 32
> > +
> > +  clock-names:
> > +    description: |
> > +      List of clock names for the remote processor.
> > +      dsp_clkx for clocks of dsp itself.
> > +      per_clkx for clocks of peripherals used by dsp.
>
> I still don't like your random collection of clocks. What if you have
> other resources besides clocks to manage? Pin mux, resets, power
> domains, etc. It would be better if you describe the peripherals in DT
> and then link to them here. But maybe the devices themselves aren't
> visible?

Ok,  I will remove these per_clks in next version.
Maybe it is better to handle them in firmware side.

>
> > +    minItems: 1
> > +    maxItems: 26
> > +    items:
> > +      - const: dsp_clk1
> > +      - const: dsp_clk2
> > +      - const: dsp_clk3
> > +      - const: dsp_clk4
> > +      - const: dsp_clk5
> > +      - const: dsp_clk6
> > +      - const: dsp_clk7
> > +      - const: dsp_clk8
>
> Surely you can name these by function? e.g. core, bus, axi, etc.

Ok, I will update them in next version.

Thanks for reviewing.

Best regards
Wang shengjiu

>
> > +      - const: per_clk1
> > +      - const: per_clk2
> > +      - const: per_clk3
> > +      - const: per_clk4
> > +      - const: per_clk5
> > +      - const: per_clk6
> > +      - const: per_clk7
> > +      - const: per_clk8
> > +      - const: per_clk9
> > +      - const: per_clk10
> > +      - const: per_clk11
> > +      - const: per_clk12
> > +      - const: per_clk13
> > +      - const: per_clk14
> > +      - const: per_clk15
> > +      - const: per_clk16
> > +      - const: per_clk17
> > +      - const: per_clk18
> > +
> > +  fsl,dsp-ctrl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to syscon block which provide access for processor enablement
> > +
> > +  mbox-names:
> > +    items:
> > +      - const: tx
> > +      - const: rx
> > +      - const: rxdb
> > +
> > +  mboxes:
> > +    description:
> > +      This property is required only if the rpmsg/virtio functionality is used.
> > +      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
> > +      (see mailbox/fsl,mu.yaml)
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  firmware-name:
> > +    description: |
> > +      Default name of the firmware to load to the remote processor.
> > +
> > +  memory-region:
> > +    description:
> > +      If present, a phandle for a reserved memory area that used for vdev buffer,
> > +      resource table, vring region and others used by remote processor.
> > +    minItems: 1
> > +    maxItems: 32
> > +
> > +  reg:
> > +    description: |
> > +      Address space for any remoteproc memories present on the SoC.
> > +
> > +  power-domains:
> > +    minItems: 1
> > +    maxItems: 32
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mboxes
> > +  - mbox-names
> > +  - clocks
> > +  - clock-names
> > +  - firmware-name
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > +    dsp_reserved: dsp@92400000 {
> > +      reg = <0x92400000 0x1000000>;
> > +      no-map;
> > +    };
> > +    dsp_vdev0vring0: vdev0vring0@942f0000 {
> > +      reg = <0x942f0000 0x8000>;
> > +      no-map;
> > +    };
> > +    dsp_vdev0vring1: vdev0vring1@942f8000 {
> > +      reg = <0x942f8000 0x8000>;
> > +      no-map;
> > +    };
> > +    dsp_vdev0buffer: vdev0buffer@94300000 {
> > +      compatible = "shared-dma-pool";
> > +      reg = <0x94300000 0x100000>;
> > +      no-map;
> > +    };
> > +
> > +    dsp: dsp@3b6e8000 {
> > +      compatible = "fsl,imx8mp-hifi4";
> > +      reg = <0x3B6E8000 0x88000>;
> > +      clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
> > +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
> > +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
> > +      clock-names = "dsp_clk1", "dsp_clk2", "dsp_clk3";
> > +      firmware-name = "imx/dsp/hifi4.bin";
> > +      power-domains = <&audiomix_pd>;
> > +      mbox-names = "tx", "rx", "rxdb";
> > +      mboxes = <&mu2 0 0>,
> > +               <&mu2 1 0>,
> > +               <&mu2 3 0>;
> > +      memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> > +                      <&dsp_vdev0vring1>, <&dsp_reserved>;
> > +      fsl,dsp-ctrl = <&audio_blk_ctrl>;
> > +    };
> > --
> > 2.17.1
> >
> >
