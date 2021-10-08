Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59886C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 19:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 370BD610D1
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 19:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhJHT24 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 15:28:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:32852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231316AbhJHT2z (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 15:28:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 243BE61073;
        Fri,  8 Oct 2021 19:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633721220;
        bh=QnbMDhIm9HL7pJkR672kGyuF+7MeVCbdnt2qg7XEDQs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S2irSZZb9tAfaQp/1hWnVHqEgXPHPRSFy3Jo9wgAjYJVOBJqcvE8qAWuH5FWtfihQ
         7HZaRqR3/zgL7coZpXpoVoEUAzz+N4cIlzYUCs6mwhSnQLph/3iYzNVqDnw9mebWq+
         9Xfb4IJCP2a3J+iXGjQoA7cbq1KyS89E802O2sJhBU6L5ypR3U8QagieZa9jN8Apzc
         OpBTBnGaY4bPjvus9a5DgsFnR23lWuUYab1E2l7L5cW8S3iSezbWe3nfAA3OHP9NfX
         /n7OvAOeMxwskm1yR0pn1X8hJpDV5PATi3ti0cPqbWBU/ZqKi+wf98w/Vz9ZiZu1xc
         YMn6clcnlPzMQ==
Received: by mail-ed1-f48.google.com with SMTP id b8so40123741edk.2;
        Fri, 08 Oct 2021 12:27:00 -0700 (PDT)
X-Gm-Message-State: AOAM5329Jp6QCnA5JVDQsibVFHTJ/bPehWwneOGrcP2lIy1O+ZPb1494
        QhrfpdPrb45YttNlhldOupDK3qCPKG+NUlBwNw==
X-Google-Smtp-Source: ABdhPJz+IaG9foJegj3syUX1Q/KhZ5o+aDRniyboqmQtQ+omUebDWUdPCNHXTCAG+ENu05ulqk/trTBuMHOfiThknVM=
X-Received: by 2002:a05:6402:44c:: with SMTP id p12mr17558796edw.145.1633721218518;
 Fri, 08 Oct 2021 12:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com> <YVTrbPC4/ir974xs@robh.at.kernel.org>
 <CAA+D8ANdQQFuPh_F8DZka+Y6hVDGuT8BvRfWdUFJxHd5JTQPNA@mail.gmail.com>
 <CAL_JsqK2KHfDisDXsuyWX0P99uY+nmEG72AsNUmqGRjJKHmg_Q@mail.gmail.com>
 <CAA+D8ANDP0ZPFKbRaYCwD+8zE3qvckKo9JjXwNBFUPrJ66=idw@mail.gmail.com> <CAA+D8AMLn6Hn4P9U38dPKFO1z4k5x1Nf43X2ej6ohNY9O8Z+tQ@mail.gmail.com>
In-Reply-To: <CAA+D8AMLn6Hn4P9U38dPKFO1z4k5x1Nf43X2ej6ohNY9O8Z+tQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 8 Oct 2021 14:26:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJOZBPNZBv=Q32myz5SvvZ4Nifv88zWecu=6zxNqynAEA@mail.gmail.com>
Message-ID: <CAL_JsqJOZBPNZBv=Q32myz5SvvZ4Nifv88zWecu=6zxNqynAEA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] dt-bindings: dsp: fsl: update binding document for
 remote proc driver
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Fri, Oct 8, 2021 at 2:19 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> On Fri, Oct 8, 2021 at 12:12 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> >
> > Hi Rob
> >
> > On Sat, Oct 2, 2021 at 12:40 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Sep 29, 2021 at 9:34 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > > >
> > > > Hi Rob
> > > >
> > > > On Thu, Sep 30, 2021 at 6:40 AM Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Sun, Sep 26, 2021 at 11:07:10AM +0800, Shengjiu Wang wrote:
> > > > > > As there are two drivers for DSP on i.MX, one is for sound open
> > > > > > firmware, another is for remote processor framework. In order to
> > > > > > distinguish two kinds of driver, defining different compatible strings.
> > > > > >
> > > > > > For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> > > > > > are needed and the mailbox channel is different with SOF.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
> > > > > >  1 file changed, 75 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > > > index 7afc9f2be13a..51ea657f6d42 100644
> > > > > > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > > > > @@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
> > > > > >
> > > > > >  maintainers:
> > > > > >    - Daniel Baluta <daniel.baluta@nxp.com>
> > > > > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > >
> > > > > >  description: |
> > > > > >    Some boards from i.MX8 family contain a DSP core used for
> > > > > > @@ -19,6 +20,10 @@ properties:
> > > > > >        - fsl,imx8qxp-dsp
> > > > > >        - fsl,imx8qm-dsp
> > > > > >        - fsl,imx8mp-dsp
> > > > > > +      - fsl,imx8qxp-hifi4
> > > > > > +      - fsl,imx8qm-hifi4
> > > > > > +      - fsl,imx8mp-hifi4
> > > > > > +      - fsl,imx8ulp-hifi4
> > > > > >
> > > > > >    reg:
> > > > > >      maxItems: 1
> > > > > > @@ -28,37 +33,63 @@ properties:
> > > > > >        - description: ipg clock
> > > > > >        - description: ocram clock
> > > > > >        - description: core clock
> > > > > > +      - description: debug interface clock
> > > > > > +      - description: message unit clock
> > > > > > +    minItems: 3
> > > > > > +    maxItems: 5
> > > > >
> > > > > Don't need maxItems.
> > > >
> > > > Ok, I will update it.
> > > >
> > > > >
> > > > > >
> > > > > >    clock-names:
> > > > > >      items:
> > > > > >        - const: ipg
> > > > > >        - const: ocram
> > > > > >        - const: core
> > > > > > +      - const: debug
> > > > > > +      - const: mu
> > > > > > +    minItems: 3
> > > > > > +    maxItems: 5
> > > > >
> > > > > ditto
> > > >
> > > > Ok, I will update it.
> > > >
> > > > >
> > > > > >
> > > > > >    power-domains:
> > > > > >      description:
> > > > > >        List of phandle and PM domain specifier as documented in
> > > > > >        Documentation/devicetree/bindings/power/power_domain.txt
> > > > > > +    minItems: 1
> > > > >
> > > > > This is curious. The h/w sometimes has fewer power domains?
> > > >
> > > > On i.MX8QM/8QXP,  there are independent power domains for DSP core,
> > > > DSP's RAM and DSP's MU.
> > > > But on i.MX8MP, all these DSP components are in same audio subsystem
> > > > There is only one power domain for whole audio subsystem,  when
> > > > power on audio subsystem, the DSP's components are powered on also.
> > > >
> > > > So the number of power domain depends on how the DSP component
> > > > integrated in SoC.
> > >
> > > Sounds like you can write an if/then schema for this difference.
> > >
> >
> > I try this:
> >
> > allOf:
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             enum:
> >               - fsl,imx8mp-hifi4
> >               - fsl,imx8mp-dsp
> >
> >     then:
> >       properties:
> >         power-domains:
> >           maxItems: 1
> >
> >     else:
> >       properties:
> >         power-domains:
> >           maxItems: 4
> >
> >
> > But the dt_binding_check report error:
> >   DTEX    Documentation/devicetree/bindings/dsp/fsl,dsp.example.dts
> >   DTC     Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml
> > /opt/alsa/sound/Documentation/devicetree/bindings/dsp/fsl,dsp.example.dt.yaml:
> > dsp@3b6e8000: power-domains: [[4294967295]] is too short
> >         From schema:
> > /opt/alsa/sound/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> >
> > I don't know the reason, could you please help to have a look what
> > is wrong?
>
> Seems still need to add "minItems" in original power-domains besides
> if/then schema. otherwise the dt_binding_check report above
> error.

Yes, that's right. The main section has to pass for all cases, so you
need the maximum range (1-4 items).

Rob
