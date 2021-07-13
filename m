Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1382C07E95
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Jul 2021 17:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEA8C61362
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Jul 2021 17:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhGMRKH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Jul 2021 13:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhGMRKH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Jul 2021 13:10:07 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB51C0613DD
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jul 2021 10:07:17 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a127so20224071pfa.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jul 2021 10:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rqIuPI5g0C7jbNOQY3Oslc7BrhONgDRjmQP2hQEh/60=;
        b=Mp7qhKEbedzaNill1MGRfB52XPbThqTxhHMQIv1t36xDlIBV2QSGlkhleAtwioRe3L
         0IYwM+RTiFTh3o8otmPnIg3TR/wLw98kXUzPN5LniehxqJ7xbXKpy0nE3Irm29m+2sU5
         u6cUx349OsFS27zeNORw7v7R+OVydo+1jjP3FtIVdttTpnXRDZWRIN1zurx+1H+mYlce
         vmwuf6iM7rWueId+O0jv6WyNpBjn4lYY0md6hXLs1RbykvwBvF7BN6860Oqk25c8Yt6K
         S/bUrSElVTkaxYNfRMiLW3FGGZe6wl377gg4qvqYFgiEtjepfssSISk22j11sR/8Gmps
         6dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rqIuPI5g0C7jbNOQY3Oslc7BrhONgDRjmQP2hQEh/60=;
        b=sWg97dHn1DdbOeTWBzbHkJ3EcfTX9KC4G1GdTon2lflMxP1NCsJvDb+9te/1Mi81Jl
         d54R/sy8DAkr6VELamHKhWLAf/T2DTh0qJIjABQfrgtZQq6xM0WbZCs27TeBhoFZhKnq
         hTQHGx95hoWvc8d/GYFgMlLyUrHKC/H0k0LGNkUslYn1tTe9u+sQ7RuzBODhveQVDV5n
         FA2pU04LwkGtd3XJc6icZTNloCYDEGK/bv9JtldVxG993NdiAcrt62ycA6cnMB4tTuLw
         pQxx25TsKZZO7Unm1clEtZMx2idzB0XZzXp9G5QBP74XQ6PugcaIppr5wGgRSwa4419G
         JyZA==
X-Gm-Message-State: AOAM531k5YaFg8mIX1lG8fNbk21jAD+QKJZCvlujIpcpi2UaTGvge4SL
        gfpJEtJLaIP6wNvwrlNbm3Npvg==
X-Google-Smtp-Source: ABdhPJxvgr2zjWS14qBP5YSln/TlB0agXOMukEPxthRY4CQydBKIkdk8k/4RZFwygIuR2Fglk7p3yg==
X-Received: by 2002:a62:4e0f:0:b029:329:20be:287a with SMTP id c15-20020a624e0f0000b029032920be287amr5605209pfb.55.1626196036740;
        Tue, 13 Jul 2021 10:07:16 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id m16sm15821063pfo.152.2021.07.13.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 10:07:15 -0700 (PDT)
Date:   Tue, 13 Jul 2021 11:07:13 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
Message-ID: <20210713170713.GB1816225@p14s>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
 <20210706142335.952858-4-aisheng.dong@nxp.com>
 <20210712180859.GC1779922@p14s>
 <DB9PR04MB84772D8DAA30CF992F9076E180149@DB9PR04MB8477.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB84772D8DAA30CF992F9076E180149@DB9PR04MB8477.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 13, 2021 at 02:47:44AM +0000, Aisheng Dong wrote:
> Hi Mathieu,
> 
> Thanks for the feedback.
> 
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Tuesday, July 13, 2021 2:09 AM
> > 
> > On Tue, Jul 06, 2021 at 10:23:35PM +0800, Dong Aisheng wrote:
> > > Usually the dash '-'  is preferred in node name.
> > 
> > ... And yet the DT binding shows &m4_reserved_sysmem1 and
> > &m4_reserved_sysmem2.
> > 
> > Either change it all or leave as is.
> 
> These are phandles and not node names.
> So should be ok.
> 
> BTW, I've sent V2, could you help review V2 series?
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210707094033.1959752-1-aisheng.dong@nxp.com/
>

Looks like I reviewed the wrong version...

> Regards
> Aisheng
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > > So far, not dts in upstream kernel, so we just update node name in
> > > driver.
> > >
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Cc: Peng Fan <peng.fan@nxp.com>
> > > Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores
> > > booted before Linux Kernel")
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index 12de153abb2d..26eb130f3263
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -600,7 +600,7 @@ static int imx_rproc_addr_init(struct imx_rproc
> > *priv,
> > >  		}
> > >  		priv->mem[b].sys_addr = res.start;
> > >  		priv->mem[b].size = resource_size(&res);
> > > -		if (!strcmp(node->name, "rsc_table"))
> > > +		if (!strcmp(node->name, "rsc-table"))
> > >  			priv->rsc_table = priv->mem[b].cpu_addr;
> > >  		b++;
> > >  	}
> > > --
> > > 2.25.1
> > >
