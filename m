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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E59C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Sep 2021 02:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3E776101E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Sep 2021 02:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236949AbhIMCvW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 12 Sep 2021 22:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236880AbhIMCvW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 12 Sep 2021 22:51:22 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3D1C061574;
        Sun, 12 Sep 2021 19:50:07 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id a12so5202402qvz.4;
        Sun, 12 Sep 2021 19:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JnZ+T81xxeMxYG/DyrFUoeTLNxItYvJm+vAp2jTLAZQ=;
        b=jza6yE/fm8WFHUhKeWJzT2WE+AruH9/IyzcQ9SRwxSdsX7cHFd608qvGhlqG5MY2oc
         adANEjGGi652gTiZR4H3fElz1JvvB44B13jjMWp9vOu1qJ2TUWCwMHoxYtBDtEBL/4mE
         gr10Urm6rF6o8yAdfXE4wbiy4D6wM0Hu/7CVlVwKwc/FzagHO0uyi28plkNXpXd5DImb
         kC6cXJjxNiTz+86DXcfBBgYgAntyClv5/rjD2f8flIvG4fm7QUICOAILaqD1zqktDHf0
         IXl3ExCe9DPvmahpIvM+u5SM/L/pCPoSsNYpbA1d3gq0j37IC+hnxUk527o+cDexZdHp
         ssgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JnZ+T81xxeMxYG/DyrFUoeTLNxItYvJm+vAp2jTLAZQ=;
        b=43SM4oZfe1iPqrw8Lqo8l86C1lzpPAGcuL2ytKnhtIvuaI7F7fSLeIqCN4dZJzfMhX
         d81RJcKw9bQq3khN0Q9YcHBqoygoGm9aFQHAULrcVKIMdC91Ox1lQYygzbu3d5JcgMdm
         jka57w7TqQRMfdH740e/hJjggfGtrZipP2loloUktPDyMsp+UEEC/IkmnhScpPxd9Jhl
         845GV9H706yE1pbajL9ROlVR2/QblGyQgutRLvZcszTglHwHthRv2BrLpKWb25I8iFoc
         EHt6jccFaPWrUmQILcrgZuquLodg7TtVJqJ2tiNJ0Mg6Hh5luWTyoCyRCUWxUs5F1yKF
         uTSQ==
X-Gm-Message-State: AOAM532OrcxDKOKI2pymvbIPpaXY3I8nxLrcTY+DE8+u0XluAWZqwVOw
        FrVcdq2oPg0aKklTzedGhuyjhkYbkqDEVqYuxlQ=
X-Google-Smtp-Source: ABdhPJz98VN8iXHnjlxns/6j/ePNeoUcGPRvxViJL2XieOkvUCfGYuL0FKZUmxs7193sLurQ6venBPdc00qWr9qv2XM=
X-Received: by 2002:ad4:470e:: with SMTP id k14mr8559532qvz.55.1631501406118;
 Sun, 12 Sep 2021 19:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-5-git-send-email-shengjiu.wang@nxp.com> <YTvRlmIedfBiXSCg@robh.at.kernel.org>
In-Reply-To: <YTvRlmIedfBiXSCg@robh.at.kernel.org>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Mon, 13 Sep 2021 10:49:55 +0800
Message-ID: <CAA+D8AM3RhN+=J1daZAV=DZJT52w4-KarBNMNHUzeg=GbtARvw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: dsp: fsl: update binding document for
 remote proc driver
To:     Rob Herring <robh@kernel.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, daniel.baluta@nxp.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob

On Sat, Sep 11, 2021 at 5:43 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 08, 2021 at 05:10:55PM +0800, Shengjiu Wang wrote:
> > As there are two drivers for DSP on i.MX, one is for sound open
> > firmware, another is for remote processor framework. In order to
> > distinguish two kinds of driver, defining different compatible strings.
>
> What determines which firmware is used? Is it tied to the board? Or for
> a given board, users could want different firmware? In the latter case,
> this configuration should not be in DT.

The compatible string determines which firmware is used.
For a given board, users could want different firmware, then need
to reboot the kernel and switch to another DTB.

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

For different SoC, the integration is different, on i.MX8QM/8QXP, there are
4 power-domains for DSP,  but on i.MX8MP, there are 1 power-domain.

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

It is the same mailbox, for this mailbox, there are 16 channels
(4 for tx,  4 for rx,  4 for txdb, 4 for rxdb).
For sound open firmware and remoteproc firmware, they
use different mailbox channels.

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

Currently the code for this in sound open firmware is not upsteamed,
I think this phandle is also applied for sound open firmware.

By the way, Should I separate the change of this file from this
patch series?  Does it belong to your linux tree?


Best Regards
Wang Shengjiu
