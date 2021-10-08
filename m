Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA7AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 04:12:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D1D360F6E
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 04:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhJHEON (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 00:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhJHEOM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 00:14:12 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E384DC061570;
        Thu,  7 Oct 2021 21:12:17 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id r1so8374773qta.12;
        Thu, 07 Oct 2021 21:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kpVveClApwG0f1MnOqx8Bs+gZiIua6pFcbtmAW5z2vE=;
        b=HFR4Iurmu8llLf9/t436kyERqMxFzX0S9BXVmQphHY+eC094l2FixYiSO/6IyRNrzg
         aGnSn1JLegb+klcmlL9c1FHA6kv8ooUumw8gQ/zUrSEVix7JDROjy1ggNEtJ5OPfIKAE
         DubkE0HzXEtoETInYz7iIkiFfSQcsa4UsOs6OumtJY+ohNxSwbSF3OxjqFAGOzJJ8Q75
         zraUH9qJ/pgTZXCCXZj605AfcXXwEqvIf0LSSOmIvjgDCjW1EfRmaibzdvqNIpR+HJFp
         LuKOKTNDsKsjt5X0SjEDa/dxID3ceTSPG9OgLZlioueIvqUmCwSxrW1ydmNwRjkabnca
         Hzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kpVveClApwG0f1MnOqx8Bs+gZiIua6pFcbtmAW5z2vE=;
        b=HLoI2Hlz4FSXG/MSelvtfuVPLZOW0SJcPzQ3Q00eaggOMkDB+FT2WAQr2RrUUSjZfc
         UJWr+zvPSPnBiDingvTYXtZrLoNp1WBn8n3Dk2QFkDSlSxdR3YqNR5uGFDs6e+652rF+
         c/dba00KFXs5RywOgn2iuazz7PxYpmwEADAGuViCMPRPYSqPu+L1lFZiiX8PzATNW9HP
         AP/+UGPGGzWFFORNvEVAQQFXKQ3auh+VDJNpirFprK4Ff71EZSfhtK6578DhmWIM7RoH
         7YMzDv1C15Dy9/c3JxR9ulEHwKXS8xQ9etAvYG1gDShexWw1Rd0JSlrSSUVmVWg3PZj4
         PpAw==
X-Gm-Message-State: AOAM530I/lMuNaaLXGCSyfS+Lry15A3ews6dlWRfPRvKzYB9W/VGAce6
        R/wP4md+RUELvHZlkg4e9aQf2sH7zQkBU0s1K10=
X-Google-Smtp-Source: ABdhPJzb94QCdtXn2IloaHOWQOje6kwaxFQI1o2Yjku+KrGOvzD0W8w4bJY53EmcCjFfEfO5v9EsOb93TC2vxJ2i4kM=
X-Received: by 2002:ac8:1e06:: with SMTP id n6mr9069200qtl.365.1633666337060;
 Thu, 07 Oct 2021 21:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com> <YVTrbPC4/ir974xs@robh.at.kernel.org>
 <CAA+D8ANdQQFuPh_F8DZka+Y6hVDGuT8BvRfWdUFJxHd5JTQPNA@mail.gmail.com> <CAL_JsqK2KHfDisDXsuyWX0P99uY+nmEG72AsNUmqGRjJKHmg_Q@mail.gmail.com>
In-Reply-To: <CAL_JsqK2KHfDisDXsuyWX0P99uY+nmEG72AsNUmqGRjJKHmg_Q@mail.gmail.com>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Fri, 8 Oct 2021 12:12:06 +0800
Message-ID: <CAA+D8ANDP0ZPFKbRaYCwD+8zE3qvckKo9JjXwNBFUPrJ66=idw@mail.gmail.com>
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

On Sat, Oct 2, 2021 at 12:40 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 29, 2021 at 9:34 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> >
> > Hi Rob
> >
> > On Thu, Sep 30, 2021 at 6:40 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sun, Sep 26, 2021 at 11:07:10AM +0800, Shengjiu Wang wrote:
> > > > As there are two drivers for DSP on i.MX, one is for sound open
> > > > firmware, another is for remote processor framework. In order to
> > > > distinguish two kinds of driver, defining different compatible strings.
> > > >
> > > > For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> > > > are needed and the mailbox channel is different with SOF.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
> > > >  1 file changed, 75 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > index 7afc9f2be13a..51ea657f6d42 100644
> > > > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > @@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
> > > >
> > > >  maintainers:
> > > >    - Daniel Baluta <daniel.baluta@nxp.com>
> > > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > >
> > > >  description: |
> > > >    Some boards from i.MX8 family contain a DSP core used for
> > > > @@ -19,6 +20,10 @@ properties:
> > > >        - fsl,imx8qxp-dsp
> > > >        - fsl,imx8qm-dsp
> > > >        - fsl,imx8mp-dsp
> > > > +      - fsl,imx8qxp-hifi4
> > > > +      - fsl,imx8qm-hifi4
> > > > +      - fsl,imx8mp-hifi4
> > > > +      - fsl,imx8ulp-hifi4
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -28,37 +33,63 @@ properties:
> > > >        - description: ipg clock
> > > >        - description: ocram clock
> > > >        - description: core clock
> > > > +      - description: debug interface clock
> > > > +      - description: message unit clock
> > > > +    minItems: 3
> > > > +    maxItems: 5
> > >
> > > Don't need maxItems.
> >
> > Ok, I will update it.
> >
> > >
> > > >
> > > >    clock-names:
> > > >      items:
> > > >        - const: ipg
> > > >        - const: ocram
> > > >        - const: core
> > > > +      - const: debug
> > > > +      - const: mu
> > > > +    minItems: 3
> > > > +    maxItems: 5
> > >
> > > ditto
> >
> > Ok, I will update it.
> >
> > >
> > > >
> > > >    power-domains:
> > > >      description:
> > > >        List of phandle and PM domain specifier as documented in
> > > >        Documentation/devicetree/bindings/power/power_domain.txt
> > > > +    minItems: 1
> > >
> > > This is curious. The h/w sometimes has fewer power domains?
> >
> > On i.MX8QM/8QXP,  there are independent power domains for DSP core,
> > DSP's RAM and DSP's MU.
> > But on i.MX8MP, all these DSP components are in same audio subsystem
> > There is only one power domain for whole audio subsystem,  when
> > power on audio subsystem, the DSP's components are powered on also.
> >
> > So the number of power domain depends on how the DSP component
> > integrated in SoC.
>
> Sounds like you can write an if/then schema for this difference.
>

I try this:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - fsl,imx8mp-hifi4
              - fsl,imx8mp-dsp

    then:
      properties:
        power-domains:
          maxItems: 1

    else:
      properties:
        power-domains:
          maxItems: 4


But the dt_binding_check report error:
  DTEX    Documentation/devicetree/bindings/dsp/fsl,dsp.example.dts
  DTC     Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml
/opt/alsa/sound/Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml:
dsp@3b6e8000: power-domains: [[4294967295]] is too short
        From schema:
/opt/alsa/sound/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml

I don't know the reason, could you please help to have a look what
is wrong?

Best regards
Wang Shengjiu
