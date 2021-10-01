Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF612C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 16:41:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A14D36124D
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 16:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355199AbhJAQna (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Oct 2021 12:43:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:33994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232126AbhJAQmY (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Oct 2021 12:42:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C28361A08;
        Fri,  1 Oct 2021 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633106440;
        bh=+0oV5hICGzs20gfTIWOOlRzxQyWjfv0UKK6MtavSITw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YzCLJtHtz2ZspaMIV/0SpMWLmpjdQFXHeI4p6xgH4Dr8wN75k3loun9UoUGxn4dK9
         ZKj//oKCd73kooE8d4DZtJNnXXbP/Y6EBkclzjwqF5NIKP0zoJsDHAndmvD+ULetnU
         ShSYO3azGPFMEajf7PFfylIeZRUEicbWks1KyiCNr6wL2Va70OeAMvSTxVNyvsm0Wf
         cD9hP7f12AYRaFZxcOBQsFeCFaOezMfir+iQlZyruyBwntVj/ahWn/M68iwIFv3Pxl
         bio2syHGpE2PITqgiy30bkrLKPLgZK6ANlF8Q4wWAe2GVgQ5or3Y3vVv8CkHMkaFO2
         cpfBYtJrpXvXg==
Received: by mail-ed1-f48.google.com with SMTP id s17so36121464edd.8;
        Fri, 01 Oct 2021 09:40:39 -0700 (PDT)
X-Gm-Message-State: AOAM533bvMXI77HhP/SRZxxC3BRnJf2NlH5sk/SaIEgvxt9VM1SkJeFD
        NNh8B7pCbZnVIN0brIQqfe6xsL3YNHRoS2pJ/g==
X-Google-Smtp-Source: ABdhPJwuJO24pNWXkNj7tzY9aOJ1BlPYMZPP5B7w2BlxS8ZEVzKLRl3HHzZ8FnJYpzAuZFmg1Y3i6Ch8HqxkzHwPyD8=
X-Received: by 2002:a05:6402:44c:: with SMTP id p12mr15986633edw.145.1633106438415;
 Fri, 01 Oct 2021 09:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <1632625630-784-1-git-send-email-shengjiu.wang@nxp.com>
 <1632625630-784-5-git-send-email-shengjiu.wang@nxp.com> <YVTrbPC4/ir974xs@robh.at.kernel.org>
 <CAA+D8ANdQQFuPh_F8DZka+Y6hVDGuT8BvRfWdUFJxHd5JTQPNA@mail.gmail.com>
In-Reply-To: <CAA+D8ANdQQFuPh_F8DZka+Y6hVDGuT8BvRfWdUFJxHd5JTQPNA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 1 Oct 2021 11:40:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK2KHfDisDXsuyWX0P99uY+nmEG72AsNUmqGRjJKHmg_Q@mail.gmail.com>
Message-ID: <CAL_JsqK2KHfDisDXsuyWX0P99uY+nmEG72AsNUmqGRjJKHmg_Q@mail.gmail.com>
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

On Wed, Sep 29, 2021 at 9:34 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> Hi Rob
>
> On Thu, Sep 30, 2021 at 6:40 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Sep 26, 2021 at 11:07:10AM +0800, Shengjiu Wang wrote:
> > > As there are two drivers for DSP on i.MX, one is for sound open
> > > firmware, another is for remote processor framework. In order to
> > > distinguish two kinds of driver, defining different compatible strings.
> > >
> > > For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> > > are needed and the mailbox channel is different with SOF.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > ---
> > >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
> > >  1 file changed, 75 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > index 7afc9f2be13a..51ea657f6d42 100644
> > > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > @@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
> > >
> > >  maintainers:
> > >    - Daniel Baluta <daniel.baluta@nxp.com>
> > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > >  description: |
> > >    Some boards from i.MX8 family contain a DSP core used for
> > > @@ -19,6 +20,10 @@ properties:
> > >        - fsl,imx8qxp-dsp
> > >        - fsl,imx8qm-dsp
> > >        - fsl,imx8mp-dsp
> > > +      - fsl,imx8qxp-hifi4
> > > +      - fsl,imx8qm-hifi4
> > > +      - fsl,imx8mp-hifi4
> > > +      - fsl,imx8ulp-hifi4
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -28,37 +33,63 @@ properties:
> > >        - description: ipg clock
> > >        - description: ocram clock
> > >        - description: core clock
> > > +      - description: debug interface clock
> > > +      - description: message unit clock
> > > +    minItems: 3
> > > +    maxItems: 5
> >
> > Don't need maxItems.
>
> Ok, I will update it.
>
> >
> > >
> > >    clock-names:
> > >      items:
> > >        - const: ipg
> > >        - const: ocram
> > >        - const: core
> > > +      - const: debug
> > > +      - const: mu
> > > +    minItems: 3
> > > +    maxItems: 5
> >
> > ditto
>
> Ok, I will update it.
>
> >
> > >
> > >    power-domains:
> > >      description:
> > >        List of phandle and PM domain specifier as documented in
> > >        Documentation/devicetree/bindings/power/power_domain.txt
> > > +    minItems: 1
> >
> > This is curious. The h/w sometimes has fewer power domains?
>
> On i.MX8QM/8QXP,  there are independent power domains for DSP core,
> DSP's RAM and DSP's MU.
> But on i.MX8MP, all these DSP components are in same audio subsystem
> There is only one power domain for whole audio subsystem,  when
> power on audio subsystem, the DSP's components are powered on also.
>
> So the number of power domain depends on how the DSP component
> integrated in SoC.

Sounds like you can write an if/then schema for this difference.

Rob
