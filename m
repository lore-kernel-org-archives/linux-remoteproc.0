Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2B4C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 02:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F037861439
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 02:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347777AbhI3Cgk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 29 Sep 2021 22:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347759AbhI3Cgj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Sep 2021 22:36:39 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDB8C06161C;
        Wed, 29 Sep 2021 19:34:57 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id m7so4383251qke.8;
        Wed, 29 Sep 2021 19:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5H3zl6oYi2k/pahNWHm1qYAiJEHuNXY47Unp3/acgsA=;
        b=ZWVqNdXJefB3MNBd7cVgBZxBZthq+q6h0PLTl/PWYzH0mbOaYjPeVKBTRPZDBb1Fnv
         KhfowHhhakCGH2Olp+bCfriV0pQuFhBg0VXvLjYEelptqSsjQc175ANwQjswGiw5VsT7
         0TbUdrVWoPVPcANFr+KEG1Go8FgaSvG4XJWGCcJ1fjh+TnaKKCtiodlsvVgImU92YmEl
         THg79NjpOBfgytWQolN5U2Bk1YRjqNyyPvnFIexpNjzclGsYfygrzJNpqhht1AMSSoUs
         LpeQRb7DfjTX/XYJ9CN2pAiFJmhm4xGL3+EafRK4+cizjxpX/q5BBZfhNUAORHzPvq3/
         7RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H3zl6oYi2k/pahNWHm1qYAiJEHuNXY47Unp3/acgsA=;
        b=y3AH1NUQK3NIZI77w4QZH7vbpogCybwjF7C0wSZ7MUbze6iCD9XKeXin8ZBwXmlqON
         ocIZiNqEJK7aQbkEO9+ConZmFOmw2GVGr+ylKr/lT8uppYnagcv/UZogwRk7wXKtqVV3
         nSykmlx79TpDf26dLBYcrYjuoEG6S8BFK8N5wUfuVxEUSQfzQJn6ZSnPpymxzAur4y74
         zAQEH+wgV6CRPyxmYIjDKnMiAtliQJP2d5DtzPnDV7jisePuTt6v5vIMxLYFXApZPpbW
         mkyUrBhXZa4aRwvd2Zms5y1/w+G5WExKdxQz9fecwsizr8xwiH7jCmxz2zWGmh6FUuCy
         YOzQ==
X-Gm-Message-State: AOAM533ydQd6NS4DphiGaIUQBqxAiLohpxZqPFWxFHjeTVuANl4ABS5A
        rjQ+ELiOVZWNKcp0zk3P92W9XbsGR8srf1UBmc0=
X-Google-Smtp-Source: ABdhPJwtPGdTpTNc5xgsgBlvtb/Wau0tzIHEBNiDnQI1DOjcDsVINKS3Mt8l/3BoBpDXW5kArtbRpujHlvw/FPwlBcA=
X-Received: by 2002:a37:b087:: with SMTP id z129mr2754043qke.392.1632969297030;
 Wed, 29 Sep 2021 19:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com> <YVTrbPC4/ir974xs@robh.at.kernel.org>
In-Reply-To: <YVTrbPC4/ir974xs@robh.at.kernel.org>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Thu, 30 Sep 2021 10:34:46 +0800
Message-ID: <CAA+D8ANdQQFuPh_F8DZka+Y6hVDGuT8BvRfWdUFJxHd5JTQPNA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] dt-bindings: dsp: fsl: update binding document for
 remote proc driver
To:     Rob Herring <robh@kernel.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
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

On Thu, Sep 30, 2021 at 6:40 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Sep 26, 2021 at 11:07:10AM +0800, Shengjiu Wang wrote:
> > As there are two drivers for DSP on i.MX, one is for sound open
> > firmware, another is for remote processor framework. In order to
> > distinguish two kinds of driver, defining different compatible strings.
> >
> > For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> > are needed and the mailbox channel is different with SOF.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
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
>
> Don't need maxItems.

Ok, I will update it.

>
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
>
> ditto

Ok, I will update it.

>
> >
> >    power-domains:
> >      description:
> >        List of phandle and PM domain specifier as documented in
> >        Documentation/devicetree/bindings/power/power_domain.txt
> > +    minItems: 1
>
> This is curious. The h/w sometimes has fewer power domains?

On i.MX8QM/8QXP,  there are independent power domains for DSP core,
DSP's RAM and DSP's MU.
But on i.MX8MP, all these DSP components are in same audio subsystem
There is only one power domain for whole audio subsystem,  when
power on audio subsystem, the DSP's components are powered on also.

So the number of power domain depends on how the DSP component
integrated in SoC.

Best regards
Wang Shengjiu
