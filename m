Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51646C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 07:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CF8A61042
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 07:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhJHHVZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 03:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhJHHVY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 03:21:24 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CE9C061570;
        Fri,  8 Oct 2021 00:19:29 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id k3so5791457qve.10;
        Fri, 08 Oct 2021 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m627aGpZ3pV6DF7d/2VcBMeyO/BjmgBo2G15kO5Evmw=;
        b=SqX/2uubjCFLmuqctax8utkPi7w2uSseCYW+Fv9D5SGUNCneEelgbYbKtVYanxF2mo
         tAuLvT4PcaTN1HvbYYYfCjD74uCA4Rpsx9qN7b4I7kVkClE+6mVl0OdaAtcHNqOS0BKY
         HSiFSAHmk3ok8M10zAZoZWut/+LNf2+3fZ4l28jKPW6TapH40lAW2znNKIp/0tsmWsth
         Tw8RY9JboI+MX/0APfwU4NMzFUqy9h+7ESKbcL7FmS68hZAWakAY/Y4Q3UCpDvPPXdmg
         ECw2ZUggMa8s/Q3OqIIqaKNAsAfXB0/exZnEmVWkmydpjXO9LXEXGHDdE/goEd7CTG3O
         1crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m627aGpZ3pV6DF7d/2VcBMeyO/BjmgBo2G15kO5Evmw=;
        b=gM7yJRGSYSc/e57Qw0vlYV9xdn2w/HJ/aYAM/mIqhbfBenClqPJeZLa+tskjSIe56A
         XHJjzIRlmdXdK7x/kK5w3J0JrJrT2ZhcqqqS6B5P6ZojYBtSA9vR53Lfr6hVcDTX5gOY
         GxaB1mh8CTkxRtLmY5gLMRCP2hpzJsUh6Ac+SfCxkHBpvO135d4Ir5/2HehML980zsKa
         hUBdldEM5m7jyOzuptc+842TeobtbCxKwNZshT0qz9zkmYxB/OFRddZ5FIk6ySVPPjj5
         s2Khtqg1iowDMfWGjfkxhRHZbL5CIe91udDNPiM3j2Z9DJu+gkEEKiCMd3JpNTHrdQ7e
         gUhA==
X-Gm-Message-State: AOAM533l1CxGVLX++VlmpjHmZt6/WbQjS0j9UaagA2orEF7d7pWBJBkL
        iEQ1TdUJxgPvGJJdTDhZTDQQKR7V7oR7M0AOlAE=
X-Google-Smtp-Source: ABdhPJymeQ2q7XhAB3CRl2/vW8KBbmXYb+yuC1/BUt+dznX8kraCX+2Ia2V4fC84zNCY6PskmE9NPGAdnksw2oU6IoY=
X-Received: by 2002:ad4:4b6c:: with SMTP id m12mr8427259qvx.46.1633677568722;
 Fri, 08 Oct 2021 00:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com> <YVTrbPC4/ir974xs@robh.at.kernel.org>
 <CAA+D8ANdQQFuPh_F8DZka+Y6hVDGuT8BvRfWdUFJxHd5JTQPNA@mail.gmail.com>
 <CAL_JsqK2KHfDisDXsuyWX0P99uY+nmEG72AsNUmqGRjJKHmg_Q@mail.gmail.com> <CAA+D8ANDP0ZPFKbRaYCwD+8zE3qvckKo9JjXwNBFUPrJ66=idw@mail.gmail.com>
In-Reply-To: <CAA+D8ANDP0ZPFKbRaYCwD+8zE3qvckKo9JjXwNBFUPrJ66=idw@mail.gmail.com>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Fri, 8 Oct 2021 15:19:17 +0800
Message-ID: <CAA+D8AMLn6Hn4P9U38dPKFO1z4k5x1Nf43X2ej6ohNY9O8Z+tQ@mail.gmail.com>
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

On Fri, Oct 8, 2021 at 12:12 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> Hi Rob
>
> On Sat, Oct 2, 2021 at 12:40 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Sep 29, 2021 at 9:34 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > >
> > > Hi Rob
> > >
> > > On Thu, Sep 30, 2021 at 6:40 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Sun, Sep 26, 2021 at 11:07:10AM +0800, Shengjiu Wang wrote:
> > > > > As there are two drivers for DSP on i.MX, one is for sound open
> > > > > firmware, another is for remote processor framework. In order to
> > > > > distinguish two kinds of driver, defining different compatible strings.
> > > > >
> > > > > For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> > > > > are needed and the mailbox channel is different with SOF.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > > > ---
> > > > >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
> > > > >  1 file changed, 75 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > > index 7afc9f2be13a..51ea657f6d42 100644
> > > > > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > > @@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
> > > > >
> > > > >  maintainers:
> > > > >    - Daniel Baluta <daniel.baluta@nxp.com>
> > > > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > >
> > > > >  description: |
> > > > >    Some boards from i.MX8 family contain a DSP core used for
> > > > > @@ -19,6 +20,10 @@ properties:
> > > > >        - fsl,imx8qxp-dsp
> > > > >        - fsl,imx8qm-dsp
> > > > >        - fsl,imx8mp-dsp
> > > > > +      - fsl,imx8qxp-hifi4
> > > > > +      - fsl,imx8qm-hifi4
> > > > > +      - fsl,imx8mp-hifi4
> > > > > +      - fsl,imx8ulp-hifi4
> > > > >
> > > > >    reg:
> > > > >      maxItems: 1
> > > > > @@ -28,37 +33,63 @@ properties:
> > > > >        - description: ipg clock
> > > > >        - description: ocram clock
> > > > >        - description: core clock
> > > > > +      - description: debug interface clock
> > > > > +      - description: message unit clock
> > > > > +    minItems: 3
> > > > > +    maxItems: 5
> > > >
> > > > Don't need maxItems.
> > >
> > > Ok, I will update it.
> > >
> > > >
> > > > >
> > > > >    clock-names:
> > > > >      items:
> > > > >        - const: ipg
> > > > >        - const: ocram
> > > > >        - const: core
> > > > > +      - const: debug
> > > > > +      - const: mu
> > > > > +    minItems: 3
> > > > > +    maxItems: 5
> > > >
> > > > ditto
> > >
> > > Ok, I will update it.
> > >
> > > >
> > > > >
> > > > >    power-domains:
> > > > >      description:
> > > > >        List of phandle and PM domain specifier as documented in
> > > > >        Documentation/devicetree/bindings/power/power_domain.txt
> > > > > +    minItems: 1
> > > >
> > > > This is curious. The h/w sometimes has fewer power domains?
> > >
> > > On i.MX8QM/8QXP,  there are independent power domains for DSP core,
> > > DSP's RAM and DSP's MU.
> > > But on i.MX8MP, all these DSP components are in same audio subsystem
> > > There is only one power domain for whole audio subsystem,  when
> > > power on audio subsystem, the DSP's components are powered on also.
> > >
> > > So the number of power domain depends on how the DSP component
> > > integrated in SoC.
> >
> > Sounds like you can write an if/then schema for this difference.
> >
>
> I try this:
>
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - fsl,imx8mp-hifi4
>               - fsl,imx8mp-dsp
>
>     then:
>       properties:
>         power-domains:
>           maxItems: 1
>
>     else:
>       properties:
>         power-domains:
>           maxItems: 4
>
>
> But the dt_binding_check report error:
>   DTEX    Documentation/devicetree/bindings/dsp/fsl,dsp.example.dts
>   DTC     Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml
> /opt/alsa/sound/Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml:
> dsp@3b6e8000: power-domains: [[4294967295]] is too short
>         From schema:
> /opt/alsa/sound/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
>
> I don't know the reason, could you please help to have a look what
> is wrong?

Seems still need to add "minItems" in original power-domains besides
if/then schema. otherwise the dt_binding_check report above
error.

Best Regards
Wang Shengjiu
