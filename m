Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC23DC433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C061960FF3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 16 Apr 2021 17:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243374AbhDPRmT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242890AbhDPRmS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 16 Apr 2021 13:42:18 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7854CC061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:41:53 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id a12so18802668pfc.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Apr 2021 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Kx3UcFdv/eRIfY3Uc8K/OykQp2bLhtDqFTwHRlJGkc=;
        b=k2MNufu1970ZVAMczqrdsGovu9JaJc1xX1Hp071LsHaxBvxl8xOhtkkxILO8FEllV/
         y5iVTa5QXGlBjFuZDsFxDbRzSb4oGG1QcTl0Yb9hE8CoPDEitRXg6Wz/ZU+SjSahYk00
         FVFeMkV3wzZl9SyGcH9OX6mzppEOaqtZpskncCTlIGxV4xR/CryjYUzTLnZwAUiOxIpf
         +ZWk4b32gkwAAFUimvGCg1wtJ+Lae5+jLSxWnMmoFcjWPlmfheYTkIYie5DHW5MC75KD
         7wEl5IuqBpCFj+g6oPIwmjb0V/vVeOOCUyah4XbzszmCeRTDpw2fjmU5h30R/MqCfDfN
         pzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7Kx3UcFdv/eRIfY3Uc8K/OykQp2bLhtDqFTwHRlJGkc=;
        b=TrYYkI56Aa1sKpyi+6wE5lZ2Xaes9bhJ1KrhVNr1Kvcn0CGHgyYrwh/E+8zQnfh2t+
         0S4GBsftorIbCmmZKhjl/kogJv4nsmQdB/DiP8X4V6KCGXKJQaAa9xotmkhfaRMD4r15
         6fp73hyVA8pWUULblLO8G8ec8Frlm4eHsQrsKQtYRMDZAy0cPhpqruZNE3cvrlvsleMX
         Ytb2hfw3pRgF4gGqmWtDfcRWGo+c7NbMtPwi5Rtnw32YwcVq4HZ5v07GBSiK0K9XBE8p
         MOdiAhNHBsCmWvzmEqqx2WE49yVsoUBr65B223096AvKdK70aujxeNY7Sf7pBa1Jq8Bu
         78LA==
X-Gm-Message-State: AOAM530Xe5bnTV6lGzfTiBAW36C4ur2uEUKLLnqVxfHkVOmLkylWh8dk
        gRRwo3T/0ytlflBijXEef0l5Zw==
X-Google-Smtp-Source: ABdhPJyEK6zn9gkTmeVXKDB7SUNWFl5FHVT928E8q/dwEi9HIjsdYuDs2H7QLKrXtoIGJaRkvO2LUg==
X-Received: by 2002:aa7:864d:0:b029:24b:dd03:edec with SMTP id a13-20020aa7864d0000b029024bdd03edecmr9062588pfo.18.1618594912941;
        Fri, 16 Apr 2021 10:41:52 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a9sm5265558pfo.186.2021.04.16.10.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 10:41:52 -0700 (PDT)
Date:   Fri, 16 Apr 2021 11:41:50 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 4/8] remoteproc: imx_rproc: parse fsl,auto-boot
Message-ID: <20210416174150.GA1050209@xps15>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
 <1618493261-32606-5-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618493261-32606-5-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 15, 2021 at 09:27:37PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Parse fsl,auto-boot to indicate whether need remoteproc framework
> auto boot or not.
> 
> When remote processor is booted before Linux Kernel up, do not parse
> fsl,auto-boot, so only need to parse the property when rproc state is
> RPROC_DETACHED.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index d633887..06dac92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -654,6 +654,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
>  
> +	if (rproc->state != RPROC_DETACHED)
> +		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
> +

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> -- 
> 2.7.4
> 
