Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FD5C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 09:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BA1261186
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 09:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhHWJqP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 05:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhHWJqO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 05:46:14 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494E0C061575;
        Mon, 23 Aug 2021 02:45:32 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id ay33so7013929qkb.10;
        Mon, 23 Aug 2021 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7puqGkfeq2gGVbcmofYcE+ip9S4w+Znt/a7BmCuaiA=;
        b=OSftcU2iVhgfPFOaPErRQTCll/bJZOKkUusefGZa8BYEUnQ75P+vSwxeYWSsJqoinv
         dfWGRCWPGME0eQxGzjQtLWfNQPy4pUDYRRHpQ50KUXHvWQzM3+fRgldsmeli/KlOusHY
         28kyryvy0/lNuO/bhpUqo7iy5IQnUl6uz8uTWhl1RozNAOErgFb2Y+9VR9qf5Oz3oygB
         bxq2L8q8gOxhwbq4FlgOQZhIY9KSz+7Qxjw8vGNtbx+qXdCZeJ+8Oe5pGJHkqzPysYZN
         CTQWSLTKpAf45wGqwzoLEPymWk12XbstYh/8yV4HO8IdrqJbgwVr0uud9Nkt4lA1Hy/Z
         OMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7puqGkfeq2gGVbcmofYcE+ip9S4w+Znt/a7BmCuaiA=;
        b=UY9FLyU3KwhOI8Z30sQxfWuN1MKcYAqm+D/72ShQRZb9VN9uXWrPonf4hD7y4l60OK
         5HOCUYe4q6BOrPkxWf7Kn1LJs8Wp3cw9Lgo8wF+izlRsM5C5ODCHyZWVs6vxrOy7TjOo
         5I340uuSfPT9fq5kd0LzD9T2aWpONbPyaptWy7hgxZMyfpM/bpgV9EiYQJ9f2U0u2d6D
         uZlzgsg8ntMpm8S0dBeWrSKWCxSZT98BIt+KKTC6TqyQ5HFgds+LiVCc4hAKp65LGwU0
         UUH5umuwKP0GA7o5EEIV4iu0dugjvXEPufw2UI9mKuSwHJaHSeiqYYjositJXkXSWmTE
         Qxcw==
X-Gm-Message-State: AOAM532VVkxQfzXHtV0JTaO2ZidFtSaQRmuulJCkvbJPBIh1mnHOs7Ay
        4zGt7+zEu9fUylHnUgNCOtisEjMU5LzLqQP7aD4=
X-Google-Smtp-Source: ABdhPJyFmowjR5zIGMC0Vgvyna9Kic4jnFTLMo+xE44ALt5B0HuBVM2mxtoSwJRz/bmkw+T0BqVkugQmPeZyRIbYTjA=
X-Received: by 2002:a05:620a:14b1:: with SMTP id x17mr19679850qkj.37.1629711931478;
 Mon, 23 Aug 2021 02:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <1629453791-10580-1-git-send-email-shengjiu.wang@nxp.com> <YSAQgywy8UW540h9@robh.at.kernel.org>
In-Reply-To: <YSAQgywy8UW540h9@robh.at.kernel.org>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Mon, 23 Aug 2021 17:45:20 +0800
Message-ID: <CAA+D8AM1Ti5+LAwx+b5ZEy7Xi8Tx4n2Dh0ZW9faFDB04pLECRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
To:     Rob Herring <robh@kernel.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
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

On Sat, Aug 21, 2021 at 4:28 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Aug 20, 2021 at 06:03:10PM +0800, Shengjiu Wang wrote:
> > Define the compatible string and properties needed by imx_dsp_rproc
> > driver.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> > new file mode 100644
> > index 000000000000..7eba49aa959e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> > @@ -0,0 +1,123 @@
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
> > +    description: |
> > +      Main functional clock for the remote processor
>
> Don't need '|' if no formatting.

Ok,  will update it.

>
> > +    minItems: 1
> > +    maxItems: 32
> > +
> > +  clock-names:
> > +    description:
> > +      List of clock names for the remote processor.
> > +      dsp_clkx for clocks of dsp itself.
> > +      per_clkx for clocks of peripherals used by dsp.
>
> Sounds like constraints that should be a schema. But this looks like
> some random collection of clocks, not clocks for the DSP h/w.

The DSP may use some peripheral devices, then we need to
enable the clock in this driver. Using which peripherals
depends on the DSP firmware, so we didn't specify the clock
name here.

I will add below items for this.
    items:
      - const: dsp_clk1
      - const: dsp_clk2
      - const: dsp_clk3
      - const: dsp_clk4
      - const: dsp_clk5
      - const: dsp_clk6
      - const: dsp_clk7
      - const: dsp_clk8
      - const: per_clk1
      - const: per_clk2
      - const: per_clk3
      - const: per_clk4
      - const: per_clk5
      - const: per_clk6
      - const: per_clk7
      - const: per_clk8
      - const: per_clk9
      - const: per_clk10
      - const: per_clk11
      - const: per_clk12
      - const: per_clk13
      - const: per_clk14
      - const: per_clk15
      - const: per_clk16
      - const: per_clk17
      - const: per_clk18

>
> > +    minItems: 1
> > +    maxItems: 32
> > +
> > +  syscon:
>
> Vendor prefix and name it based on what it points to or is used for.

Ok, will update it.

best regards
Wang shengjiu
