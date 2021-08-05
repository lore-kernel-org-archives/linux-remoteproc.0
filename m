Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B5AC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A74EE60EEA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 16:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhHEQgu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 12:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhHEQgt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 12:36:49 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C3AC061765
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 09:36:35 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so16183356pjr.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gZUbnq9fvKjj+31UV+0WtAsWShgRVDQP8luUkhlwWZQ=;
        b=MlY3BdTH3kmc6EMwTgYCLXMCvZJN90V4Z8Ldfne/SIadxLASuCCvffmpGgaBBMIDgC
         +CAC1O1VILBOHJXORA66vwfvelYsU3UqOgTTMi3n63GA+JgJ1XlXOc8rmD8UENN3kaQX
         6LgyIZvodxAwYnw3l/ql4ZCuObRa1uHCZoS7lFE/uOTY/wKKl67sGrh4N+772G2biy1I
         /TeAuwQm/+h2mI9pAwBKp9DyPRGQQU5VVoQa2nXRJFl01UfwC2YNirCluExMBSEExSbQ
         EjLVRBPiyuGhEWwxS4u9iht0z1jS9xMEPlAx6SnNf/5B5h1EgfvMzITNqDe+3tcPhq2z
         +Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gZUbnq9fvKjj+31UV+0WtAsWShgRVDQP8luUkhlwWZQ=;
        b=MzxFE8nbhz2MqaUTZ6iAjBJZq/BEu8dbeiDD/OZEjQGqvKp3vXAvrmYDSmiPtzDGUT
         V3nlS/pvpHDgP0JrS9Aa1eOGkJC7hytv6QfQoa9qhHY7mWqOyVDGFM0hDjF6bntpJlPv
         uuzdyTrEAwkL+By25Rg9kjjLDkdWgvRyrTnNFbp6+R6Jpaw/5XwVk+fsCPKNc1YwHw4M
         0HES2OnwqV2XAsVmBcRCPtYwWDLzJ6K9sE0OOEzOgKKMJbibQXeabG887kwO+hb/C5hV
         jP/4bSYKy99POgeS8wd+ziZzNkn2g0DS0uIiuZJ3xfcbRBU9Mdgan552C+VZJeqetPNd
         g80A==
X-Gm-Message-State: AOAM53283JEPQWujXug6tFjOc49P3o76FMSBrtlJGhDL2erpZT1gLmav
        Lh+QZgZ1nzxgcCoMFQm946Mfhg==
X-Google-Smtp-Source: ABdhPJxKVkvflNkYOprr8jPB4n7GLFxdFOAJdpBRNxE2FBoHC6M+8kSjwo/+Kpxb2pby7XPIq8HLwA==
X-Received: by 2002:a17:902:c3cb:b029:12c:a426:164a with SMTP id j11-20020a170902c3cbb029012ca426164amr4665538plj.81.1628181395073;
        Thu, 05 Aug 2021 09:36:35 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id cu12sm10102789pjb.5.2021.08.05.09.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 09:36:33 -0700 (PDT)
Date:   Thu, 5 Aug 2021 10:36:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "cleger@kalray.eu" <cleger@kalray.eu>
Subject: Re: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Message-ID: <20210805163632.GC3205691@p14s>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
 <20210805033206.1295269-5-aisheng.dong@nxp.com>
 <AM5PR0402MB275630A505C7828931043F1988F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM5PR0402MB275630A505C7828931043F1988F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Aug 05, 2021 at 09:57:10AM +0000, Peng Fan (OSS) wrote:
> > Subject: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for
> > dram
> > 
> > DRAM is not io memory, so changed to ioremap_wc. This is also aligned with
> > core io accessories. e.g. memcpy/memset and cpu direct access.
> > 
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>

Did you test this one as well?

> > ---
> > v2->v3:
> >  * patch content unchanged.
> >    Only drop the wrong tag in v2
> >    Tested on MX8MQ and MX8MP, MX7ULP.
> > v1->v2:
> >  * new patch
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index ff620688fad9..4ae416ba5080
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
> >  			break;
> > 
> >  		/* Not use resource version, because we might share region */
> > -		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start,
> > resource_size(&res));
> > +		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev,
> > res.start,
> > +resource_size(&res));
> >  		if (!priv->mem[b].cpu_addr) {
> >  			dev_err(dev, "failed to remap %pr\n", &res);
> >  			return -ENOMEM;
> > --
> > 2.25.1
> 
