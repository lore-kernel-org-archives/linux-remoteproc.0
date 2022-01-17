Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0CEC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jan 2022 18:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241563AbiAQSZ4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jan 2022 13:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241497AbiAQSZz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jan 2022 13:25:55 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA00C06161C
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 10:25:55 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id n16-20020a17090a091000b001b46196d572so536031pjn.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 10:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s8JBuoZ641S86dciUWb+q82uqO3uCSnRWiB4MWHK+xI=;
        b=oqKo55kQCTJyFrCgpgAmfiX9BGfzBQJxezjlffxGmoOCocowd7ghAEstvHPfFzsBEt
         OiwBDIb+g/sLzSyjEwqm1jKzMrZmdRRiDAxFQWk7jWm46oLzXz2O1XpOC9EkyRnO1cEN
         LcPFuf9lYOIOt6zjRbHO/msfXuGxZHpWCeW4k8PLVCwepFBkpGrgBVW8z3WIFElTZzrL
         wqGIUTXdk/jteFlLK+jv0cYwjrlJx2QGXWfR0cHP62QqjH60ZrM5ZpBcpTZOmek24kUe
         m1qLqmKK2HYN6C06qxMILyNg81FPnXWYMIfzJZFex0f1yeuKf6dK8ebv9gw0/ko3JKbN
         1Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s8JBuoZ641S86dciUWb+q82uqO3uCSnRWiB4MWHK+xI=;
        b=YBq5VY0k/Tbm1WGJaVXUacLzF76lH2uHEOLKmWxqxjXTFdgcD4p47PMUNJ4rcRvi39
         bWyK+CPoWO9MaZfXbDwIandzpltJ6We2pyeYtw8LpGUsT0VBjUjm4D69DNhg8a3oMF7Z
         bhWIzkFd3Iao8z6Jb/pxgdHENw2h5C9mhJciU00Kd0XqJDvQ6kcZqtgUC+XZ8lcONBLF
         iD0thRd5wMm2ZeoFm8+gu/vtawQV3v8OyAncR9AAE1xEVB2BPgTSy8HBTqfe3LE3QPg7
         YonzXNK7Sf1nHBUVrKV5qiBp/gZb18Ho4WKK0CLbYe2GaPOsZpGKHEcTkFIPg57RJyFT
         8tpw==
X-Gm-Message-State: AOAM5334YkBWNlcJ200/icgA8r2dgIPPad+GII2tEwr4J9vr7qm1DlYm
        CI0TUCwz2onK+t+DjnSs3oQa8Q==
X-Google-Smtp-Source: ABdhPJxvrGQl2x1vsrIL8aGdK+/fB0RQgMpZfHxL8kDefayeQ4Co3huvhWIj4IRnDKUPObsF2JDUiA==
X-Received: by 2002:a17:902:b784:b0:14a:2fec:dda2 with SMTP id e4-20020a170902b78400b0014a2fecdda2mr23898376pls.118.1642443955114;
        Mon, 17 Jan 2022 10:25:55 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id m1sm12394066pgb.13.2022.01.17.10.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 10:25:53 -0800 (PST)
Date:   Mon, 17 Jan 2022 11:25:51 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: validate resource table
Message-ID: <20220117182551.GC1119324@p14s>
References: <20220111033333.403448-1-peng.fan@oss.nxp.com>
 <20220111033333.403448-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111033333.403448-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

On Tue, Jan 11, 2022 at 11:33:23AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Currently NXP use one device tree to support all NXP released Cortex-M
> demos. There is one simple demo that not need to communicate with
> Linux, thus it will not update the resource table. So there maybe
> garbage data in it. In such case, Linux should directly ignore it.
> 
> It is hard to decide what data is garbage data, NXP released SDK use
> ver(1), reserved(0) in a valid resource table. But in case others
> use different value, so here use 0xff as a max value for ver and num.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 0bd24c937a73..75fde16f80a4 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -490,11 +490,19 @@ static int imx_rproc_attach(struct rproc *rproc)
>  static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> +	struct resource_table *table;
>  
>  	/* The resource table has already been mapped in imx_rproc_addr_init */
>  	if (!priv->rsc_table)
>  		return NULL;
>  
> +	table = priv->rsc_table;
> +	/* Gabage data check */
> +	if (table->ver >= 0xff || table->num >= 0xff || table->reserved[0] || table->reserved[1]) {
> +		dev_err(priv->dev, "Ignore invalid rsc table\n");
> +		return NULL;
> +	}
> +

This seems like the wrong fix to me.  Either use different DTs or update the
resource table for all demos - efficiency should not be a problem since they are
demos.  With the above it is only a matter of time before the pattern
associated with valid resource tables changes, leading to more hacks that will be
impossible to maintain over time.

Thanks,
Mathieu

>  	*table_sz = SZ_1K;
>  	return (struct resource_table *)priv->rsc_table;
>  }
> -- 
> 2.25.1
> 
