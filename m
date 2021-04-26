Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE5BC433B4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Apr 2021 15:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC9A06135B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Apr 2021 15:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhDZPrL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Apr 2021 11:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbhDZPrK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Apr 2021 11:47:10 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41DBC061756
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Apr 2021 08:46:27 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g1-20020a17090adac1b0290150d07f9402so5419335pjx.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Apr 2021 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XboSkOHKR9/omD6ZttgG6rHiaNOqxSSs13MhhHHn3Q8=;
        b=UEXS2RhtQolFovqX/XpJa76Q2uluJRmWviDsMo0fYexASUQ/ezJkgmKgTVryWlIjrz
         chfHnMTbX7evnziBTSHx6XHxj8o3eTCPblueemJosyU0FVomdoyXVZPBp2UhyYQRZGsl
         CZls1NpVRWdlhJe1h0KNqg7D10LOwJ8VGVNl2vTC49vo4Ab8Y1/2P3TU1YEyswdPWOHL
         AbzL1D4gzqwF1nDF1A/WoR7eOL6T+dy0YXiYfW2Cl7eSiejrcjx7RfjriEPQoXVLIgtE
         tPhiLqfy+Lq/zQvzSakB9skJqXWynsd9/ukdDmMD3FF7goWvCblhXgyYpSg3U5XxKGHv
         394Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XboSkOHKR9/omD6ZttgG6rHiaNOqxSSs13MhhHHn3Q8=;
        b=KGlwLK3DUHl+gP3i/fsrlLAom4qfr0vb9sBezLqV9ooFaRnmLilcX1tJqkueXddBQZ
         LP4pvMT2G2ZDirpGNM10TrcbyIM/XWbKP4Mu0Uktrp4jxZ4aRXlfEIoYqtC2ApP/FErS
         bv97HyNNq+3zPOSalCH289q1AynQk9sQNURx2SrFdUxX4gFBF7zhsLRvHLiBJfkUq5+o
         7WVee4pq1ONphTHK3EqFQLtGGREi/0BWtI/wG7PoqTJJOpAHv7BzSF00ilJNJaVxBC47
         HAEjqjB9UDViSvUjnCC2j3fJ6l5RaLSJof1MrUT18eri+zyi7t306mWrtZdHSBYnl4ac
         5S5g==
X-Gm-Message-State: AOAM532R4SQnUWGpRVHBhUaxd10yTxsEHg2btX9QEkIHoAgHq15J5oXo
        m90GBUTQ52r7rK9C8uyEN0dNwQu/cBz6uA==
X-Google-Smtp-Source: ABdhPJy9MuB/wX9vtocSRPHn1bJgP98qSCnlf713nL2qGwOuiFCiq9/GIdHNktP7TMmxwgegzvZiwA==
X-Received: by 2002:a17:902:e993:b029:ec:7cc0:9390 with SMTP id f19-20020a170902e993b02900ec7cc09390mr19195578plb.27.1619451987215;
        Mon, 26 Apr 2021 08:46:27 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 20sm151931pfw.40.2021.04.26.08.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 08:46:26 -0700 (PDT)
Date:   Mon, 26 Apr 2021 09:46:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Message-ID: <20210426154623.GA1390475@xps15>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <20210422165634.GD1256950@xps15>
 <DB6PR0402MB2760E471A0391FF8A31980BA88459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CANLsYkwoS+3qYq=FHRLMjrJSr5cj_PiHaU+a+M17C+8-VJ+b9g@mail.gmail.com>
 <DB6PR0402MB2760EA88942E5549BA9CC4B588459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB2760EA88942E5549BA9CC4B588459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Apr 23, 2021 at 11:28:00PM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH V5 0/8] remoteproc: imx_rproc: support
> > i.MX7ULP/8MN/8MP
> > 
> > On Thu, 22 Apr 2021 at 19:01, Peng Fan <peng.fan@nxp.com> wrote:
> > >
> > > Hi Mathieu,
> > >
> > > > Subject: Re: [PATCH V5 0/8] remoteproc: imx_rproc: support
> > > > i.MX7ULP/8MN/8MP
> > > >
> > > > On Wed, Apr 21, 2021 at 10:20:14AM +0800, peng.fan@oss.nxp.com
> > wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > V5:
> > > > >  Add R-b tag
> > > > >  Move the change in detect mode of patch 5 to patch 7 Per
> > > > > Mathieu's comments
> > > > >
> > > > > V4:
> > > > >  Typo fix
> > > > >  patch 4: take state as a check condition  patch 5: move regmap
> > > > > lookup/attach to imx_rproc_detect_mode  patch 6: add
> > > > > imx_rproc_clk_enable for optional clk  patch 8: use switch/case in
> > > > > imx_rproc_detect_mode
> > > > > V3:
> > > > >  Add A-b tag for Patch 1/2
> > > > >  Fix the checkpatch warning for Patch 6,8
> > > > >
> > > > > V2:
> > > > >  Patch 1/8, use fsl as vendor, typo fix  Because patchset [1] has
> > > > > v2 version, patch 5,6,7,8 are adapted that  change.
> > > > >
> > > > > This patchset is to support i.MX7ULP/8MN/8MP, also includes a
> > > > > patch to parse fsl,auto-boot
> > > > >
> > > >
> > > > One of the request I had from the last revision was to explicitly
> > > > list what other patchset this work depends on and what branch it is
> > > > based of, something I can't find here.
> > >
> > > Sorry, that patchset has been merged, so I remove that line.
> > > I should mention that that patchset has been merged into Linux-next tree.
> > >
> > 
> > And what branch this set should be applied to is missing.
> 
> I take latest linux-next/master for my upstream new feature work.
> 
> > 
> > > >
> > > > As such I am dropping this set and won't look at another revision
> > > > before May 22nd.
> > >
> > > Ah. Is it just because that the dependency patchset not been mentioned
> > > or you have issue applying the patchset that delay the patchset for one
> > month?
> > >
> > 
> > Both.
> 
> I replay my flow:
> git fetch linux-next
> git checkout linux-next/master -b master-next-4-24-2021
> pwclient list -w "Peng Fan (OSS)" -s New | grep V5 | awk '{print $1}' | xargs -I {} pwclient git-am {}
> 
> It could successfully apply the patchset.
> Applying patch #12215291 using 'git am'
> Description: [V5,1/8] dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
> Applying: dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
> Applying patch #12215293 using 'git am'
> Description: [V5,2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
> Applying: dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
> Applying patch #12215295 using 'git am'
> Description: [V5,3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
> Applying: dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
> Applying patch #12215297 using 'git am'
> Description: [V5,4/8] remoteproc: imx_rproc: parse fsl,auto-boot
> Applying: remoteproc: imx_rproc: parse fsl,auto-boot
> Applying patch #12215299 using 'git am'
> Description: [V5,5/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
> Applying: remoteproc: imx_rproc: initial support for mutilple start/stop method
> Applying patch #12215301 using 'git am'
> Description: [V5,6/8] remoteproc: imx_rproc: make clk optional
> Applying: remoteproc: imx_rproc: make clk optional
> Applying patch #12215303 using 'git am'
> Description: [V5,7/8] remoteproc: imx_rproc: support i.MX7ULP
> Applying: remoteproc: imx_rproc: support i.MX7ULP
> Applying patch #12215305 using 'git am'
> Description: [V5,8/8] remoteproc: imx_rproc: support i.MX8MN/P
> Applying: remoteproc: imx_rproc: support i.MX8MN/P
> 
> 
> If anything wrong my work flow conflicts with Linux remoteproc subsystem upstream flow,
> please correct me, and I'll follow.
> 
> Thanks for your time and patience on reviewing my patches. Sorry for the inconvince
> that I bring in.
> 
> Anyway please share me your flow to apply patches, I will try to avoid unhappy things
> in following patches. 
>

All I asked is that you list the branch your work is based on _and_ any
dependencies, something you did not do.

I review hundreds of patchsets every year and knowing exactly how to work with a
series goes a long way in saving precious time, time that can be used to
review other people's submissions.

I am not angry at you but at the same time I can't review your patches if you
are not ready to help me do so.
 
> Thanks,
> Peng.
> 
> > 
> > > Thanks,
> > > Peng.
> > >
> > > >
> > > > > Peng Fan (8):
> > > > >   dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
> > > > >   dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
> > > > >   dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
> > > > >   remoteproc: imx_rproc: parse fsl,auto-boot
> > > > >   remoteproc: imx_rproc: initial support for mutilple start/stop method
> > > > >   remoteproc: imx_rproc: make clk optional
> > > > >   remoteproc: imx_rproc: support i.MX7ULP
> > > > >   remoteproc: imx_rproc: support i.MX8MN/P
> > > > >
> > > > >  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
> > > > >  drivers/remoteproc/imx_rproc.c                | 196
> > > > +++++++++++++++---
> > > > >  2 files changed, 173 insertions(+), 34 deletions(-)
> > > > >
> > > > > --
> > > > > 2.30.0
> > > > >
