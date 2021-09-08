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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA00C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Sep 2021 07:23:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35DF561155
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Sep 2021 07:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350360AbhIHHYb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Sep 2021 03:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350012AbhIHHYV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Sep 2021 03:24:21 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38384C061575;
        Wed,  8 Sep 2021 00:23:14 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id a10so1282909qka.12;
        Wed, 08 Sep 2021 00:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QISFurn052uq4hGhwxdYBG/1xRqkANqtCrV2mA2mnzY=;
        b=jxQw7jUuXTX04PwDbFygUgBjnqpaIQh1c1sDG4oQxr17zdGTZrYdpwCuo+N0c2MbFt
         zebTrubozmQl7+W0Rj945+iQCJlZVxGMN/brqjodrc5AZJBTXS+AORI84qadUwsv5nl5
         7o5SmvHcm1l7ibLC/+o9i3pm3Xb2iABOr6BBzxaPyvNlTPPF5xZiSa35dT4tusErZSAJ
         PuiiNR8i8r23lA3tsDimZLE7kxQ4jVJdLChm3UkIpWlBwlB6V9QDOk9wZOalax0p05ql
         9g2Yuzw/WECp5k4jq1uj2CWvYKyFHCfEYRjy1sYvuBnNrbMVM0cYd/T/zO/QwjyaBdy+
         Vesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QISFurn052uq4hGhwxdYBG/1xRqkANqtCrV2mA2mnzY=;
        b=FyFPngXay53dSltl08QvHeMB2ZyvRtXUNDV/f0CZ3ojRZl6flxVxIGvj8BS1m6Ea0V
         lfVbs9p3I4KpQj2LGTcRaqhc/tbh5f5WB01/+Sc6eCB65ZqDPZQ7GgMfAfHfjiTFl9MD
         vDsU4GfUR79Tg1gaJ/Rhrx7smbLZTZXyLYkjCeakTvIqRjHuoVqO0FmUbw7ZqcIe9TOd
         u5fwJBbTuS6iHPyGOaMllfEEagqCRl2zo1ScxwiJ42beWjg5p/gjOJ+Exva8n0Jp8g5n
         +KCm8ABCuTohwJpRuP6ts15HY4qfq7N2E7GXc1cFYIUAa37PHHZax2gOHpTMiOmc7kIV
         5zKA==
X-Gm-Message-State: AOAM530QMRdatMmOc3zKhZnCUwhTOfTT67iOFv3ihVqLgCZEQ0FlmHYU
        ChgK7PsHlwiVj+belAi9/RX8NQcQ9U2D/7OwnFU=
X-Google-Smtp-Source: ABdhPJyQMAVzbMp/vk4N5ubvPQqpMh6HYwn2PFBBNlLkl7/flU3MnlXwycAJFBUNuadVNdkKCWX+l5Gz2WryQ30kObI=
X-Received: by 2002:a05:620a:1905:: with SMTP id bj5mr2017294qkb.124.1631085793458;
 Wed, 08 Sep 2021 00:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
 <1630661377-31244-4-git-send-email-shengjiu.wang@nxp.com> <YTJQcIOU1mMxoIpF@robh.at.kernel.org>
 <CAL_JsqL_5U0QB5d5VmgX3PMa9LNkyFa+RHWSAzeeTzq6xR=_nA@mail.gmail.com>
 <CAA+D8ANSR49juFDvPxHECKv7-uSowjdxruqnb=z6vu_CEkujjg@mail.gmail.com> <CAL_JsqJ-vbMHGRkHSEuQQUjmv3dp4zaiYuCdpXimYnuJLQ7amQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJ-vbMHGRkHSEuQQUjmv3dp4zaiYuCdpXimYnuJLQ7amQ@mail.gmail.com>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Wed, 8 Sep 2021 15:23:02 +0800
Message-ID: <CAA+D8AOvF49f=sur19OApaq7FcovvbmJcG4tBKmcXb377h+CNA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
To:     Rob Herring <robh+dt@kernel.org>
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

On Tue, Sep 7, 2021 at 8:50 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Sep 3, 2021 at 9:58 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> >
> > Hi Rob
> >
> > On Sat, Sep 4, 2021 at 12:50 AM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Fri, Sep 3, 2021 at 11:42 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, 03 Sep 2021 17:29:36 +0800, Shengjiu Wang wrote:
> > > > > Define the compatible string and properties needed by imx_dsp_rproc
> > > > > driver.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 131 ++++++++++++++++++
> > > > >  1 file changed, 131 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> > > > >
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > >
> > > I take that back. What's the difference with this binding and
> > > Documentation/devicetree/bindings/dsp/fsl,dsp.yaml?
> >
> > Some devices, but two kinds of driver. one for remoteproc
> > framework,  another one is for ALSA.
> > So should I merge fsl,imx-dsp-rproc.yaml to fsl,dsp.yaml?
>
> You can have 100 drivers for all I care, but it's 1 DT binding for 1
> piece of h/w.
>

Ok, I will merge it to fsl,dsp.yaml

Best regards
wang shengjiu
