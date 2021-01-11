Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C97BC4332D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 20:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C944A22CAD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 20:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391135AbhAKUpb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391131AbhAKUp1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 15:45:27 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336C2C061795
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 12:44:47 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id q7so438562pgm.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 12:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=htaXQZSG0QXBfUKmA/4BqSl5HPobFjCxlJW4yk2E5ns=;
        b=O3N5mg9bdze7Ib2ynKPcRncsWq4DeRqKXai+5tqZT6vC3AXXoCwYrSPHkNTvmet9Iq
         1WFZ43d9O+L1KRgshF4eGm2hf5cpBZgHk7qGEIfG/CXt6BCo+vY6EwTxjCAN+FvqYfuM
         Sxp4IgTW+sJ7kjHDfPTk1AJ8WAg8K1bh0WZkmIHkjYnaWIx6i0aSbmEvZlupHGjFkpJm
         RftTtJJYX1EA4PPw4yim0yhw/Wo4oNe/NSLtFNGDz+g/MGPLPdKfNObrl0XGK1AqP0TS
         ZqKkdtAbmfw58yoMaAVNb0e2H3/eMRig8foXXdm4A1TSiwbm5Q+ZY7DYBu0rGAdVzXUN
         zNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=htaXQZSG0QXBfUKmA/4BqSl5HPobFjCxlJW4yk2E5ns=;
        b=twEl6gSq/GBeweGseQraYTBFzytsZNeheAW5lVM/gBLuDiOVlji/bndNhfQzw3eh10
         t2kPB9DbBMbEj1zng4YdMm6jpnzNR3vIvmsq/JQRUkDVxTUmwmsRce64EsNZdP9FPTps
         G+ZlYG/tpvBZD1Wyl7qWABTnBuODHU36RD17rj12AJpzkckCUXJlWymhMq9nS/jij5x0
         /D28TSfbq7IFIRJTTm61/CwVi4vNINPPWpts9zto9q4C3MmnCYG2sIpX4Qbv9rlOeTZY
         BDuAHZ1TCDNS/fzFs0Wxn7+EDQ6iUQ7YAxojZev4YjEnkR+8EtZrRUjPtJNekdPTKh4Q
         z2Jg==
X-Gm-Message-State: AOAM532QdLcfGXQDcZ8fV+z2DPPMTnfnm4/0HtCtzknpeoYH7iomsKPr
        f9O1Run3PcKHxb3xImKosZJ0o9vek2Nsxw==
X-Google-Smtp-Source: ABdhPJzKPAhhrZdX5YzDSRv6fxW723f9nT86WDJoB9QWXDuU2iIS1gUxmnqTlT9GlzyBHBi4S76Dtg==
X-Received: by 2002:a62:c312:0:b029:1a9:19c7:a8e with SMTP id v18-20020a62c3120000b02901a919c70a8emr1143762pfg.74.1610397886774;
        Mon, 11 Jan 2021 12:44:46 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b13sm499319pfi.162.2021.01.11.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 12:44:46 -0800 (PST)
Date:   Mon, 11 Jan 2021 13:44:44 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V5 3/8] remoteproc: imx_rproc: correct err message
Message-ID: <20210111204444.GG144935@xps15>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-4-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229033019.25899-4-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 29, 2020 at 11:30:14AM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> It is using devm_ioremap, so not devm_ioremap_resource. Correct
> the error message and print out sa/size.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6603e00bb6f4..2a093cea4997 100644
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
