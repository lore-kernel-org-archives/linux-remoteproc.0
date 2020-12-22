Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85317C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 00:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 433CC229C5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 00:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgLVA1Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 19:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgLVA1Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 19:27:24 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFA3C0613D6
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Dec 2020 16:26:44 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 15so13104484oix.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Dec 2020 16:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CZlWxDu0IGcpbm5IJlrVcGywiVsBKMfEDTAOQYhNOLk=;
        b=QCrzxkUIKUnVtc5CraxckDbuKVj9GmBKTf3rz+Ot0kcu5FWSMmUbPhJbuLiK86DKIw
         9qlRcShYAPMfpDJK+ICq1Dl0qaPwksIVAySKG/CcILk5MbTcSOF6YRpCekiQLlfLjJxL
         Ku9GncLABOtQNHmHvlAKhvhmXeLUGFU4vxjmAYnTAopWzYOVL1blLYgqEGgVT7pMMrAb
         b3hPF1l3lxkxYDk+HtxhPFNruAxYzaKdO21C26+5AxCEO4mwHBruIaTsBzsbC9vgTC2m
         u87fjfSYehD8XOvCoy1i6o5zyGXnY2SSJGHFebiuty7wMpgmG9im4Fc209ForSQwFtXa
         A6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CZlWxDu0IGcpbm5IJlrVcGywiVsBKMfEDTAOQYhNOLk=;
        b=qebGpfQDSAG8teLBPbLKYUWgdoKLkcNac/9VKPXorYG/ZGO+tEFRFI4xlpOXPxqzyf
         KUzXtOvOuEapSztN248GCGfuhDMJ2YByg0GrMqs0TZVshxdp9AwDYn9weoL8N0g3ESNi
         f71iOkLdFo4cZfyNNB5h0wuOrqCB7d8C+fKwXk06qG+NWPw2tab0pP75QXTyObsf/kws
         aGksKEXD/rjnruBoGW5Aj4Qmt4mhkTvph+HrHF+nG35K//BUaaH0xvjdiLBoB6kQzgCb
         o8b1roVJfiS37z3ZdRhTmJURwif8p49ZygJXLxTqbzS1BkK8RIt0rJPXhugookXpEBhh
         6raA==
X-Gm-Message-State: AOAM531F5wz7+PBywfn9sEzGpZ0YjxN5avZ7juyyrzmfuY8hLWE15zKY
        z2rM6yIIgXVZolgOutlH2thSZA==
X-Google-Smtp-Source: ABdhPJzLmchhEzmN14SJse+/UNka4tEcHY3ZrGiBwD5TZF7SjSdcJ69v46VQd/UbAH8zqnq9PBYZwA==
X-Received: by 2002:aca:3b03:: with SMTP id i3mr12694199oia.170.1608596803929;
        Mon, 21 Dec 2020 16:26:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 11sm4136721oty.65.2020.12.21.16.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 16:26:43 -0800 (PST)
Date:   Mon, 21 Dec 2020 18:26:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/8] remoteproc: imx_rproc: correct err message
Message-ID: <X+E9QfqsMQEFkIPE@builder.lan>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
 <20201221100632.7197-4-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221100632.7197-4-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 21 Dec 04:06 CST 2020, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> It is using devm_ioremap, so not devm_ioremap_resource. Correct
> the error message and print out sa/size.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V4:
>  Drop the R-b tag
>  Follow Bjorn's comments, correct/update the err msg.
> 
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6603e00bb6f4..fab772b02c9f 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -268,7 +268,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
>  						     att->sa, att->size);
>  		if (!priv->mem[b].cpu_addr) {
> -			dev_err(dev, "devm_ioremap_resource failed\n");
> +			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
>  			return -ENOMEM;
>  		}
>  		priv->mem[b].sys_addr = att->sa;
> @@ -298,7 +298,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  
>  		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
>  		if (IS_ERR(priv->mem[b].cpu_addr)) {
> -			dev_err(dev, "devm_ioremap_resource failed\n");
> +			dev_err(dev, "failed to remap %pr\n", &res);
>  			err = PTR_ERR(priv->mem[b].cpu_addr);
>  			return err;
>  		}
> -- 
> 2.28.0
> 
