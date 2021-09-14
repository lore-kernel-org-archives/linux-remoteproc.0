Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74812C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 11:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5439660E52
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 11:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbhINLqe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Sep 2021 07:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbhINLqe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Sep 2021 07:46:34 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C884DC061574;
        Tue, 14 Sep 2021 04:45:16 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso1815730wms.3;
        Tue, 14 Sep 2021 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=srJ1nnPayRwL7lbGpY/83XlR5+6EDwIUs1YgAf5CvAc=;
        b=Fc2tb5a+i6mPu1zN/Zy2JxO7WoxNmnQnZOv5gD83Goc9DsKmVsK/NYu2wuxtigRIX7
         bvZCSnkatlKzFeuM8WHmywGr9Qm+Ot2AODaqLkfJAD0ujLhriqYZaDEVa4+odZxbeMYs
         pmkCU3EUHQEVf7IaIkdPCfDJYulUV2iFDaw6+J6AvySE3oo87QbA7gikr2SUB9mG8pFM
         iYzcB+AQP5SOR5K4w4iOZxQKw3OlSoNGDUMzhA2XLDzto1Pck1BbA2hcjswv5nLz2B+1
         uKwoZyb271RHCRcPk/BbPiPGllvj8U9fq+819qFS0+H+VGy1dVZvq3L9l48SjL7a5dHg
         7MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=srJ1nnPayRwL7lbGpY/83XlR5+6EDwIUs1YgAf5CvAc=;
        b=1fVjJbSvPkidiouSx5qKQtfbXdEuV/C0p0PVKEttkH3Ctb4nFrDVMGyWTYKoCfOuT5
         hRshZojzlAdQQKDs9MQmARjLItEBKC+DDpm2rCJic8WtjdHmIskCTUMWQejmAySVbQ7F
         54Z0XaNMehc65GeAQA27eEtfoxOvwOYcJ4cyHZqJj0ITMeX1uebm4hfUGv/kgjiy9Wy9
         l/9zyuY9K30zD/tPUtmHxykj06ndVDb3W4P8klHAGJmfI1Veicnr6kcC3SkpNO47Fj0d
         K4sJJjYCRSePgHn0zxDWGFho3XnLiGsD+TlCFM5NTRhH1elnT7+yDN9mfbISVawaiYYk
         Qu1w==
X-Gm-Message-State: AOAM533MC6Fh2IqJMWiraFlnUUzLpNT+UE2KxMV8Isuapncdyu3W/hig
        9BpY90T6kc783+t+XNDAdLVWVX4FNVXDlQfx9qM=
X-Google-Smtp-Source: ABdhPJx6ROBbB/L3d3MCNwPfBiaV7A37myc/PvlyZsasGnqr7pvETJ6x8p8mEb6FpotSotV0OiSP+CebEkJvY9YeNxQ=
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr1703232wmb.188.1631619915376;
 Tue, 14 Sep 2021 04:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-5-git-send-email-shengjiu.wang@nxp.com> <YTvRlmIedfBiXSCg@robh.at.kernel.org>
In-Reply-To: <YTvRlmIedfBiXSCg@robh.at.kernel.org>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Tue, 14 Sep 2021 14:45:02 +0300
Message-ID: <CAEnQRZBQ4HqfNJq-tYE5+6eVz=WSHPHfnY7_qLYOttKD2pgtvg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: dsp: fsl: update binding document for
 remote proc driver
To:     Rob Herring <robh@kernel.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Ohad Ben Cohen <ohad@wizery.com>, bjorn.andersson@linaro.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Sep 11, 2021 at 12:45 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 08, 2021 at 05:10:55PM +0800, Shengjiu Wang wrote:
> > As there are two drivers for DSP on i.MX, one is for sound open
> > firmware, another is for remote processor framework. In order to
> > distinguish two kinds of driver, defining different compatible strings.
>
> What determines which firmware is used? Is it tied to the board? Or for
> a given board, users could want different firmware? In the latter case,
> this configuration should not be in DT.
>
> > For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> > are needed and the mailbox channel is different with SOF.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
> >  1 file changed, 75 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > index 7afc9f2be13a..51ea657f6d42 100644
> > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > @@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
> >
> >  maintainers:
> >    - Daniel Baluta <daniel.baluta@nxp.com>
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> >  description: |
> >    Some boards from i.MX8 family contain a DSP core used for
> > @@ -19,6 +20,10 @@ properties:
> >        - fsl,imx8qxp-dsp
> >        - fsl,imx8qm-dsp
> >        - fsl,imx8mp-dsp
> > +      - fsl,imx8qxp-hifi4
> > +      - fsl,imx8qm-hifi4
> > +      - fsl,imx8mp-hifi4
> > +      - fsl,imx8ulp-hifi4
> >
> >    reg:
> >      maxItems: 1
> > @@ -28,37 +33,63 @@ properties:
> >        - description: ipg clock
> >        - description: ocram clock
> >        - description: core clock
> > +      - description: debug interface clock
> > +      - description: message unit clock
> > +    minItems: 3
> > +    maxItems: 5
> >
> >    clock-names:
> >      items:
> >        - const: ipg
> >        - const: ocram
> >        - const: core
> > +      - const: debug
> > +      - const: mu
> > +    minItems: 3
> > +    maxItems: 5
> >
> >    power-domains:
> >      description:
> >        List of phandle and PM domain specifier as documented in
> >        Documentation/devicetree/bindings/power/power_domain.txt
> > +    minItems: 1
> >      maxItems: 4
>
> How does the same h/w have different number of power domains?
>
> >
> >    mboxes:
> >      description:
> >        List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
> > +      or - 1 channel for TX, 1 channel for RX, 1 channel for RXDB
> >        (see mailbox/fsl,mu.txt)
> > +    minItems: 3
> >      maxItems: 4
> >
> >    mbox-names:
> > -    items:
> > -      - const: txdb0
> > -      - const: txdb1
> > -      - const: rxdb0
> > -      - const: rxdb1
> > +    oneOf:
> > +      - items:
> > +          - const: txdb0
> > +          - const: txdb1
> > +          - const: rxdb0
> > +          - const: rxdb1
> > +      - items:
> > +          - const: tx
> > +          - const: rx
> > +          - const: rxdb
>
> These are completely different mailboxes?
>
> >
> >    memory-region:
> >      description:
> >        phandle to a node describing reserved memory (System RAM memory)
> >        used by DSP (see bindings/reserved-memory/reserved-memory.txt)
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  firmware-name:
> > +    description: |
> > +      Default name of the firmware to load to the remote processor.
> > +
> > +  fsl,dsp-ctrl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to syscon block which provide access for processor enablement
>
> Curious, how is this done with the open sound f/w?

Hi Rob,

Should be the same story. Here is the PR sent for review with Sound
Open Firmware (SOF):

https://github.com/thesofproject/linux/pull/3156

The only difference is that SOF uses:
syscon_regmap_lookup_by_compatible while remoteproc driver uses
syscon_regmap_lookup_by_phandle.

thanks,
Daniel.
