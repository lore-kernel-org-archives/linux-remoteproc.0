Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260B3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Sep 2021 12:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04171610F8
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Sep 2021 12:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344455AbhIGMvd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:51:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344461AbhIGMvc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Sep 2021 08:51:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0E3A610C9;
        Tue,  7 Sep 2021 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631019026;
        bh=eE7IcVilEeLSkeD9jdj8PAa18oA0xgkkm+nApsk0DZk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mMkwAK0Rz3SOyZykHhBCwE0VBctxlyV5+MgeG+U850enODi2uT/+M2Rq2hug7fwPl
         qy4h25ZnvOAPLKLXHZyBaldi9EAflsZ6d1zQh/rDC2USXMObmmSCAuB+SOEwnbO83o
         Ihj4oSxY0GNGNk9BAyC8fKuXSbNtgdDFOBGPXo2SG5VY6k17zTLG0PL+cH3YcZlKyI
         UC/O1TSbses582KUDzHUTUOkexan8c21j/WHDYTGdsOMe+7j/jE/gnsmntNYB1Sqrd
         swgW2TS6bWkXz+XDJ+JLi1FGMbE2C9mO3staTvxg60WI05XLVsQGS1gbdjb0vesW/C
         skvdDHMn9SFrQ==
Received: by mail-ed1-f53.google.com with SMTP id q3so13771959edt.5;
        Tue, 07 Sep 2021 05:50:26 -0700 (PDT)
X-Gm-Message-State: AOAM530a4xfavdU0Ezwq/YbD+0CHbRYNYRXzEwTQGVyXfNXYV1jzuHvq
        J0mG3DO+cgy47u+K4c0uI2Rbo6yFMjFQunXGfw==
X-Google-Smtp-Source: ABdhPJw5cBPQONabehNgOWu4OgwSuYqkLspA0QJtmUpp9qSSrQXtvo+Sw8Ey+UBtk9U7PrrhKQnPS328rU7+LfBQEPU=
X-Received: by 2002:aa7:c514:: with SMTP id o20mr18319405edq.318.1631019025305;
 Tue, 07 Sep 2021 05:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
 <1630661377-31244-4-git-send-email-shengjiu.wang@nxp.com> <YTJQcIOU1mMxoIpF@robh.at.kernel.org>
 <CAL_JsqL_5U0QB5d5VmgX3PMa9LNkyFa+RHWSAzeeTzq6xR=_nA@mail.gmail.com> <CAA+D8ANSR49juFDvPxHECKv7-uSowjdxruqnb=z6vu_CEkujjg@mail.gmail.com>
In-Reply-To: <CAA+D8ANSR49juFDvPxHECKv7-uSowjdxruqnb=z6vu_CEkujjg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 7 Sep 2021 07:50:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-vbMHGRkHSEuQQUjmv3dp4zaiYuCdpXimYnuJLQ7amQ@mail.gmail.com>
Message-ID: <CAL_JsqJ-vbMHGRkHSEuQQUjmv3dp4zaiYuCdpXimYnuJLQ7amQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 3, 2021 at 9:58 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> Hi Rob
>
> On Sat, Sep 4, 2021 at 12:50 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Fri, Sep 3, 2021 at 11:42 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, 03 Sep 2021 17:29:36 +0800, Shengjiu Wang wrote:
> > > > Define the compatible string and properties needed by imx_dsp_rproc
> > > > driver.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 131 ++++++++++++++++++
> > > >  1 file changed, 131 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> > > >
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > I take that back. What's the difference with this binding and
> > Documentation/devicetree/bindings/dsp/fsl,dsp.yaml?
>
> Some devices, but two kinds of driver. one for remoteproc
> framework,  another one is for ALSA.
> So should I merge fsl,imx-dsp-rproc.yaml to fsl,dsp.yaml?

You can have 100 drivers for all I care, but it's 1 DT binding for 1
piece of h/w.

Rob
