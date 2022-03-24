Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B4DC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Mar 2022 15:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348270AbiCXPNI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Mar 2022 11:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242453AbiCXPNI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Mar 2022 11:13:08 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FDEA94C3
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Mar 2022 08:11:36 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id h19so3207188pfv.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Mar 2022 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8rZfGXhxPnCPDkK85iJOEuPuLqVvxqMTkD5qg+n6vFE=;
        b=pkEOCiut+ZAQ5lJHTD6mEO3U8qX21+b0ADJvqP9I8NdNzs+hijc/igpJyUHZvQNz33
         Dd3LYuhKBfR2uGsCEHbMLPF5Eeb95XBStH/BXNMSWWbeHmhdJLV8eh+8tVxC0an1O3aR
         MpH2dlXc+nxiOGxB6JQyVs4LdjUeuT1Q1QdNFfg0ZCM4q+xox1t/Q5oPuxpg9cR1mlvx
         Et21nx3xZpw9WO8OSYUNsgUlZgRcG5ZwyCx4rSTHEWPCLM4w6cRJuhBl1Aq29rFmKKLF
         Y3RPyifxi6LksLivRdY9VHzVKWDge2mGn+mZgyPPRAFmzU9O8rnfgarGbu8DvrT9zKjH
         UWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8rZfGXhxPnCPDkK85iJOEuPuLqVvxqMTkD5qg+n6vFE=;
        b=SLXr8AnbT4JFcCBPEQdRffY9yhLg3PTxBK4QVgM17PXlSu+g+MeBlwvDTlFfQH+qje
         40RKHpDNxC4/g2nnEBCr0uqZgxe1tBFAyVu/og0w4hAqkstXhp+TAWic6sURVNPXn7D+
         w7HBZI4niRphAv/ZXK9del5M0qpgtMOCrhlZnpTjIgML0ghAMaoxP7C4chi1whej5j7R
         aZcYRu3O0Zf7a9ejxDbC4vC4Q9aKe3GXiYNXLiK90CytSA5o4yi3mqrCcGjzK3u57onw
         6cCsfCWMFSEwqFwHpv7EMHfKTh1w3C1lY3pA6x2l9VZm6h7H+3XD6JwfhE5SbxbX1trQ
         xP9Q==
X-Gm-Message-State: AOAM531+jPfoe0GJzKUaY5rH7iKD8XTh04PcV8BG0dd9USHudDpMCdos
        anPLU9msFaF9RN11uc6zWqEWbQ==
X-Google-Smtp-Source: ABdhPJz8fH+V3mM/o8K64N2LM9Q+QkXZ5GKXul5fdPvPPlho9Q/gScHtkAfHqSoFrBcHb+V7ldDtkg==
X-Received: by 2002:a05:6a02:10d:b0:381:f4c8:ad26 with SMTP id bg13-20020a056a02010d00b00381f4c8ad26mr4335657pgb.135.1648134695746;
        Thu, 24 Mar 2022 08:11:35 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x2-20020a63aa42000000b0038265eb2495sm2943406pgo.88.2022.03.24.08.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 08:11:34 -0700 (PDT)
Date:   Thu, 24 Mar 2022 09:11:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: imx_rproc: Ignore create mem entry for
 resource table
Message-ID: <20220324151132.GA3514576@p14s>
References: <20220308065754.3355-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308065754.3355-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 08, 2022 at 02:57:54PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Resource table will not be used for memory allocation, no need to create
> rproc mem entry.
> 
> Fixes: b29b4249f8f0c ("remoteproc: imx_rproc: add i.MX specific parse fw hook")


https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst


> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Add Fixes tag
>  Separate the patch from https://patchwork.kernel.org/project/linux-remoteproc/patch/20220111033333.403448-7-peng.fan@oss.nxp.com/
>  Address typo
> 
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7a096f1891e6..f2bfc9077c19 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -423,6 +423,9 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		if (!strcmp(it.node->name, "vdev0buffer"))
>  			continue;
>  
> +		if (!strncmp(it.node->name, "rsc-table", strlen("rsc-table")))
> +			continue;
> +
>  		rmem = of_reserved_mem_lookup(it.node);
>  		if (!rmem) {
>  			dev_err(priv->dev, "unable to acquire memory-region\n");
> -- 
> 2.30.0
> 
