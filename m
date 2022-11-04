Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8C4C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Nov 2022 15:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiKDP1u (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Nov 2022 11:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbiKDP1h (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Nov 2022 11:27:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A512B26A
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Nov 2022 08:27:35 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i3so4789292pfc.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Nov 2022 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Nd6bNvUe0UVcRt3WitzDx9mV2ITpv1BTXOeCveRv8=;
        b=udRcro9xs4r+r6ted7rjPa79NMf0EsS7OK6uHxFq9z46/Z8czPMaZxT/685iGOaWU5
         lVV6U47yiHKL3pVxz332BlQaPXDP7ntcdzw5kwnO5VhlVZeOouUqdBQd3dB12hoNH7uj
         19wzID8mx/+pEcobJBZpArkSVSCsG/fah0GrmxDge/jEUC+jxRTbQt84nBRYSQ4SiFZM
         YAI6OwQ4GXpmBX1+vNqdMkYWOpFnpQ3boXg0arqy9yQ1w3y8O6i49EVDJx8npUl/07FA
         F25NunijPdaLvBjbgVU6zmscMqI+nEKXvmm+nV4/bGlC1t2nWFPV682N2SiEUcRcVmmx
         v/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2Nd6bNvUe0UVcRt3WitzDx9mV2ITpv1BTXOeCveRv8=;
        b=lIueQI3fyFYzannArBcdCtJa3ZVOx35fCxvGhsaNPnXG4YZcEx2mbqs5JWhs/Ilb+U
         p9eFgbH48Fq/Qn/5zNnMTfzoesTXIKraEFqnENvpBMIHTo7NPPEKSY7O57QxezAZMruW
         Uo6UrtXOYgsxYATjwpZ65uzL7bPyTjm9WcQcX9TOC0KCKv69ZPSyK11L6X+wuZ89WtYS
         cH7jHwbocXrFUkuQ/F7w7HEY5/VVXezL9u6Lp8fIDnWulZitk8KAJCZbnnNYoWgyuDmf
         P684bCnhXQxINKmg84dYWVW9WuAncPlm5k98cGdPg1GtDZLJnx2UuhsYs90d3NXU9YDh
         RfYg==
X-Gm-Message-State: ACrzQf1TFdKfHaNjMmJX1LMLdp7V0Trs1FoIIZJjqdJTVSaYaqEb9OH3
        wdfjNATeuVG3zQe4q1qhoLXTIw==
X-Google-Smtp-Source: AMsMyM5rdAb7s+O02h1GUn9LmOSQvSTQUB9WGaUhWTbGZ1jAIxW2thw1XRv+RNRbRTlgrnFhXBzQcQ==
X-Received: by 2002:a05:6a00:88f:b0:530:dec:81fd with SMTP id q15-20020a056a00088f00b005300dec81fdmr36370451pfj.64.1667575655145;
        Fri, 04 Nov 2022 08:27:35 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b00186e8526790sm2812772plg.127.2022.11.04.08.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:27:34 -0700 (PDT)
Date:   Fri, 4 Nov 2022 09:27:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: imx_rproc: correct i.MX93 DRAM mapping
Message-ID: <20221104152732.GA1873068@p14s>
References: <20221102111410.38737-1-peng.fan@oss.nxp.com>
 <CANLsYky+FPNi82kDwgJBzdoxS5=SBXBqiRRFNCvt4ihUpJS+9w@mail.gmail.com>
 <DU0PR04MB9417B48835B77695D7BD535788389@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417B48835B77695D7BD535788389@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Nov 03, 2022 at 06:11:46AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH] remoteproc: imx_rproc: correct i.MX93 DRAM mapping
> > 
> > On Wed, 2 Nov 2022 at 05:12, Peng Fan (OSS) <peng.fan@oss.nxp.com>
> > wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > According to updated reference mannual, the M33 DRAM view of
> > > 0x[C,D]0000000 maps to A55 0xC0000000, so correct it.
> > >
> > > Fixes: 9222fabf0e39 ("remoteproc: imx_rproc: Support i.MX93")
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index 2c471e46f4ca..9fc978e0393c
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -134,8 +134,8 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx93[] = {
> > >         { 0x80000000, 0x80000000, 0x10000000, 0 },
> > >         { 0x90000000, 0x80000000, 0x10000000, 0 },
> > >
> > > -       { 0xC0000000, 0xa0000000, 0x10000000, 0 },
> > > -       { 0xD0000000, 0xa0000000, 0x10000000, 0 },
> > > +       { 0xC0000000, 0xC0000000, 0x10000000, 0 },
> > > +       { 0xD0000000, 0xC0000000, 0x10000000, 0 },
> > 
> > But how did this work before?  Were some SoC released with the old
> > mapping?

As it is regularly the case, you have not answered all my questions.

> The current m33 firmware release with Linux SDK only has
> TCM version, so I not have image to test the DDR mapping. 
> 
> Initially we got the information that M33 mapping of DRAM.
> DRAM (offset 0 MB)	DRAM	80000000
> DRAM (offset 256 MB)	DRAM	A0000000
> DRAM (offset 512 MB)	DRAM	C0000000
> 
> However the information is wrong after we check more,
> there is an 256MB hole, 0MB [0x80000000, 0x8fffffff],
> 512MB [0xa0000000, 0xafffffff], 
> 1024MB [0xc0000000, 0xcfffffff]
> 
> I use JTAG to confirm it.
> 
> Thanks,
> Peng.
> > 
> > >  };
> > >
> > >  static const struct imx_rproc_att imx_rproc_att_imx8qm[] = {
> > > --
> > > 2.37.1
> > >
