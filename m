Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA30C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 16:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 472AE23339
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 16:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbhAMQSM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Jan 2021 11:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726235AbhAMQSL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Jan 2021 11:18:11 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C14EC061794
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jan 2021 08:17:31 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id x12so1321534plr.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jan 2021 08:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oi22ZFSSHiz5BqCswewx2XNKWFz3N9RTqmGy+V7qxvs=;
        b=qhUvTMxWi79wiaLoZoeLyF25x/qHWvpLpZBFdA9Wx8Y4U9NBsOb30JgF2oRPCSJYzv
         /jMXabkdBER72nto5pfV7a9SaePTaixmNM0HlQtjTFrnQvz7Pk8AE3FykdCYNOTBj3qo
         8WIOv39pJfj4IroTPId8aHqWiUEABDulNcDzeVwOiWzZ4FOoJkLQb5T3S+Rrv64UMmlr
         HGLRTKQKinzUA1feHlG6MGt5NmkJS5MvqK+Px+AvBYMHfAdISt+U8LbBseEVGjv1WUM7
         lZClxD/SW0mIOeeQrxvu5z+h0vFzyVdDnNHPq/W52zCpWaMqNyiKIRaCq9kDI+Kap/n5
         FDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oi22ZFSSHiz5BqCswewx2XNKWFz3N9RTqmGy+V7qxvs=;
        b=iA6aVub+fI/QHxurgU5amQlvh/DC2qLCBrDt2xsXcKT6oHK657sVp0N7N0eCCUgHL9
         JM7xZbFOHvTva1ImnVsS2ntB+W2YPABQboaDEPWFDfmmpu2oqG9Cdnk08TwQWbbPAsFR
         J9vlr/z3WSLcLvqK9f5zxMGNMwTtWWUIbWa02bW1cdOHyL1WmlxLqoQqBcRl7m1fIPYj
         HLDpum+JUyDEUMdqhi/XhStq78HMtyt7NNO1DsNX1PP3vNmr2w1bXkFjtGRWfqxA1e8c
         osG/ZJiFZytnyb3X10yQ7gamwSaMLyPrSfCBmlE2U0W9VDAJch5u26U4vn8iMB1bsn56
         PWAw==
X-Gm-Message-State: AOAM532NFdAOF9v/bhfpLQKvObtWFKvbyoWssk5dOG8b8psCpZNJ40E2
        yetiuZmIZwiOEKuX242WbPgPRA==
X-Google-Smtp-Source: ABdhPJwLCFIwkGQ+KrZaxUUyOsyH9QO21TegySOw8tG2RsJk1Nt3Und32EPY8mLaq8W6sXtpQMJL3w==
X-Received: by 2002:a17:902:9341:b029:dc:102f:c36c with SMTP id g1-20020a1709029341b02900dc102fc36cmr3175169plp.61.1610554650533;
        Wed, 13 Jan 2021 08:17:30 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p9sm3343800pjb.3.2021.01.13.08.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 08:17:29 -0800 (PST)
Date:   Wed, 13 Jan 2021 09:17:27 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev regions
Message-ID: <20210113161727.GA213180@xps15>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-8-peng.fan@nxp.com>
 <20210111215023.GJ144935@xps15>
 <DB6PR0402MB2760F6F982C32B6557467C9188AA0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210112184629.GA186830@xps15>
 <DB6PR0402MB27602E812FD657F7EC81854F88A90@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB27602E812FD657F7EC81854F88A90@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jan 13, 2021 at 02:19:32AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev
> > regions
> > 
> > On Tue, Jan 12, 2021 at 09:41:12AM +0000, Peng Fan wrote:
> > > > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping
> > > > vdev regions
> > > >
> > > > On Tue, Dec 29, 2020 at 11:30:18AM +0800, peng.fan@nxp.com wrote:
> > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > >
> > > > > vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
> > > > > They are handled by remoteproc common code, no need to map in imx
> > > > > rproc driver.
> > > > >
> > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > > b/drivers/remoteproc/imx_rproc.c index f80428afb8a7..e62a53ee128e
> > > > > 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct
> > > > > imx_rproc
> > > > *priv,
> > > > >  		struct resource res;
> > > > >
> > > > >  		node = of_parse_phandle(np, "memory-region", a);
> > > > > +		/* Not map vdev region */
> > > > > +		if (!strcmp(node->name, "vdev"))
> > > > > +			continue;
> > > >
> > > > I am very confused and because I don't see an example for the DT in
> > > > the bindings document I have to guess what is going on.
> > >
> > > V6 will include the DT yaml.
> > >
> > > >
> > > > So I am guessing that you have laid out the memory regions for the
> > > > vrings and the vdev0buffer in the DT "memory-region".
> > >
> > > The dts part will be similar as following:
> > >
> > > +    #include <dt-bindings/clock/imx8mm-clock.h>
> > > +    rsc_table: rsc_table@550ff000 {
> > > +      no-map;
> > > +      reg = <0x550ff000 0x1000>;
> > > +    };
> > > +
> > > +    vdev0vring0: vdev0vring0@55000000 {
> > > +      no-map;
> > > +      reg = <0x55000000 0x8000>;
> > > +    };
> > > +
> > > +    vdev0vring1: vdev0vring1@55008000 {
> > > +      reg = <0x55008000 0x8000>;
> > > +      no-map;
> > > +    };
> > > +
> > > +    vdevbuffer: vdevbuffer@55400000 {
> > > +      compatible = "shared-dma-pool";
> > > +      reg = <0x55400000 0x100000>;
> > > +      no-map;
> > > +    };
> > > +
> > > +    imx8mm-cm4 {
> > > +      compatible = "fsl,imx8mm-cm4";
> > > +      clocks = <&clk IMX8MM_CLK_M4_DIV>;
> > > +      mbox-names = "tx", "rx", "rxdb";
> > > +      mboxes = <&mu 0 1
> > > +                &mu 1 1
> > > +                &mu 3 1>;
> > > +      memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > <&rsc_table>;
> > > +      syscon = <&src>;
> > > +    };
> > >
> > > >
> > > > For the vrings I don't see the allocation of a carveout, which means
> > > > that you will take the memory out of the DMA pool and the reserve
> > > > memory will be wasted.
> > >
> > > imx_rproc_parse_memory_regions will alloc carveout.
> > 
> > They _will_ but for now they don't and as such there a discrepancy between
> > the bindings and the code that was published in V6.  At this point you can
> > either drop the vrings in the DT or send another revision with the carveouts
> > allocated.  I would definitely prefer the latter because it wouldn't involve yet
> > another modification of the bindings.
> 
> You mean I drop patch v5 7/8 and send v7, right?
> 

If you do that than the implementation won't reflect the bindings.

> Or are there other changes that I need to do?

If you want to keep the bindings the same way you have them in V6, carveouts are
required in the implementation.

> 
> Thanks,
> Peng.
> 
> > 
> > >
> > > >
> > > > For the vdev0buffer, what you have will work *only* if that entry is
> > > > the first one in the list of memory regions, as we agreed here [2].
> > >
> > > Yes. I agree and follow this rule from then.
> > >
> > > Thanks,
> > > Peng.
> > >
> > > >
> > > > [1].
> > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fel
> > > > ixir.b
> > > >
> > ootlin.com%2Flinux%2Fv5.11-rc3%2Fsource%2Fdrivers%2Fremoteproc%2Fre
> > > >
> > moteproc_core.c%23L321&amp;data=04%7C01%7Cpeng.fan%40nxp.com%7
> > > >
> > C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa92cd99c5c
> > > >
> > 301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTWFpbGZsb3
> > > >
> > d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> > > > %3D%7C1000&amp;sdata=Qur6YiTWlak0ZRnrUZRzawfoO38EBrAItqZm66
> > b4
> > > > m20%3D&amp;reserved=0
> > > > [2].
> > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpa
> > > > tch
> > > >
> > work.kernel.org%2Fproject%2Flinux-remoteproc%2Fpatch%2F202007221315
> > > >
> > 43.7024-1-peng.fan%40nxp.com%2F&amp;data=04%7C01%7Cpeng.fan%40n
> > > >
> > xp.com%7C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa9
> > > >
> > 2cd99c5c301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTW
> > > >
> > FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> > > >
> > VCI6Mn0%3D%7C1000&amp;sdata=b%2F8muWtb3yxKIsnXmKmRGYYV33%2
> > > > FHjwA6a8x58geY7eE%3D&amp;reserved=0
> > > >
> > > > >  		err = of_address_to_resource(node, 0, &res);
> > > > >  		if (err) {
> > > > >  			dev_err(dev, "unable to resolve memory region\n");
> > > > > --
> > > > > 2.28.0
> > > > >
