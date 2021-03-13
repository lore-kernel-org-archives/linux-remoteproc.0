Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE5CC433E0
	for <linux-remoteproc@archiver.kernel.org>; Sat, 13 Mar 2021 00:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71CBD64F6B
	for <linux-remoteproc@archiver.kernel.org>; Sat, 13 Mar 2021 00:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbhCMAIi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 19:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235940AbhCMAIY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 19:08:24 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F766C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 16:08:24 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so2285682otk.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 16:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tskbPV38ZQ+dCuIiAy+hlftEgTtSwQTfVcXEgTZ53LE=;
        b=syl4IVzUqcCzG/X8KX1ZmIvAcK9joYMmYIC+1NdCcNUvAK4hsCQRfjLe3q2XDMS7SU
         W/zyY841KjSLXs9ZJ+D/CmDuMvAx/HLrFmye7Fq+7PzNN9k6Dyro9d51DU6f2jTU2Ael
         X/dlLqIf5rsgXTRaQdogOkMCeG1OBu2m9eBrGMLMQalQBcK6bNzHCpjxbjIY5N060OBd
         KtH7uDPPjMkEPJjJtq4J+/wgRBVKelDfarY40aqTNR+X0+OBfLoo8ZzHz+Altj1igtlZ
         8fZUIXh5t3Fop96VnnhbjGohAlwPJ+bbjhj3phYEbIUhUGyfZrC9CMOnBAvyuFwrtmaE
         iCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tskbPV38ZQ+dCuIiAy+hlftEgTtSwQTfVcXEgTZ53LE=;
        b=OJhQecIKEPPgPzHL4DwiuliOej8MrEBPkrThkNhcxU5meH7TurSqhJoWZ5S/qvI3pv
         ImxW5WprDLsOEsPPDCX8rxMZD2MNDF2uZezKYF1OZZouwQva0Bc1GND0rPCp/+3/I7kN
         1+Cl6XW7TiA/Oz/QSbIXlfLSDo/4s5rRcrh9xIKrYHmfXKV67u5tTQx+Rxnk8R/AiNd3
         R2uJBw7HM6Ksp2DXBtaf6MdcnMq3YvwnsivQ7xqXGEzOrb9KYxlVZuSPwXyKlXTBcjWg
         Cet+DhOWCsME12ZX0Yv4h4s1H2UfNvozjAukIS9xPvbtI09Apwbc6OWxqUNVDtnVms6c
         83eQ==
X-Gm-Message-State: AOAM5300Ck4YKpTnk9y4MheVqzxAMu7JREc5gPUhWeiT29nJC/hZtTMJ
        04RdbXRRrhs/LUQHIdJXAz9jvQ==
X-Google-Smtp-Source: ABdhPJx1Tgg6tgSb0mIivL8DCU2RQ7YRolkf5fIw2kxWEPXAgogJMSu1wzkCApV9yRUqgxNJtmfnFQ==
X-Received: by 2002:a9d:6c88:: with SMTP id c8mr5390359otr.87.1615594103626;
        Fri, 12 Mar 2021 16:08:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k24sm2123198oic.51.2021.03.12.16.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 16:08:23 -0800 (PST)
Date:   Fri, 12 Mar 2021 18:08:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] remoteproc: imx_rproc: fix return value check in
 imx_rproc_addr_init()
Message-ID: <YEwCdRagkF04spZx@builder.lan>
References: <20210312080420.277151-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312080420.277151-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 12 Mar 02:04 CST 2021, 'Wei Yongjun wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.
> 
> Fixes: ecadcc47492c ("remoteproc: imx_rproc: use devm_ioremap")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5ebb9f57d3e0..3ba4b6ba47aa 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -464,9 +464,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  
>  		/* Not use resource version, because we might share region */
>  		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
> -		if (IS_ERR(priv->mem[b].cpu_addr)) {
> +		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "failed to remap %pr\n", &res);
> -			err = PTR_ERR(priv->mem[b].cpu_addr);
> +			err = -ENOMEM;
>  			return err;

Took the liberty of changing this to return -ENOMEM, as I applied the
patch.

Thank you,
Bjorn

>  		}
>  		priv->mem[b].sys_addr = res.start;
> 
