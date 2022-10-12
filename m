Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4587C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 Oct 2022 22:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiJLWcW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 12 Oct 2022 18:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiJLWcW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Oct 2022 18:32:22 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989198D0EC
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 15:32:20 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so3256597pjq.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8R/2SBneV3cPFfr0s37+GfcYDzED7riWEsF89VBCYM=;
        b=Y6OxN6sWR5mCUx23xYOzWArtrxZu02LItgLM0IICrDYx0/ChW9OPjcY9KvLsdvc0Az
         Qo/F+m6+0Pcf/JxYHVCo51BCSmxkquSJFsYMwhH5R2HJ4VtPafxEJ/0IqGOfQlJJSWea
         cTYZRBxOTaWbrbcEEZ5snMTmbUX1MoUVhIama0YKwi1FdDC70v1+VPFQRrkyZ5Ji079L
         Sr6n1y5bP8DQCLdklIidnz3kS7gxf5vv9zMJbxggTFEaWY3h6Tuk0RiMdOvvwSpwiDhK
         1tec0ofCb4MWRU69h3WAyPCVsvb9TN+85adJh/pfrv7cNbyJB4Tb2XFQ9uA1j9uP+j7D
         7Cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8R/2SBneV3cPFfr0s37+GfcYDzED7riWEsF89VBCYM=;
        b=yjdbcByu4+7uQhf8PXYid2Q7cSxfvyQmvi1zE6yRjwu+E8OCwUduLJsDitjwBTv+/6
         RUf0D4D1IBDHP7hmSVv421iM1z4YFaozRI+V8e+RouDy//PTQFcYbhGqw6Qjf6OjCI4q
         k+49wUAcXDMEPDq+PTIrW5KxUkHLTEqny0nj0fQG575HEIfgbRLNOlgYZKJjuu5AtDrg
         /2QYwEHbq5CEUgirhSsxCFeBNvhrCUyWtD6GJQIAL+pTRl62oy0vqBmJDO/k7I1f2Nfk
         MvbXZ6p08RGKWUeq8XH++hUNTazx0H6KXYZEy47jKr4kMd1RWVHypQOpn2yydkS2ZmUn
         iOPA==
X-Gm-Message-State: ACrzQf3p5nFV8CxXK59qa71fssCoS/S3myPbUUrO3Zx71JqsBRLflQuM
        OTWQIg34StzpONv0XIPFPYL4uQ==
X-Google-Smtp-Source: AMsMyM5Nvh0iMciiQNKnlgkwpcY5VCCgf9BRSlxSLc062BCwAmEtZbYyMOX+h6JYKeJS/06LBZe08w==
X-Received: by 2002:a17:90b:1b4f:b0:20d:363d:7943 with SMTP id nv15-20020a17090b1b4f00b0020d363d7943mr7713504pjb.106.1665613940138;
        Wed, 12 Oct 2022 15:32:20 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r5-20020a170902be0500b00172c7dee22fsm10966517pls.236.2022.10.12.15.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 15:32:19 -0700 (PDT)
Date:   Wed, 12 Oct 2022 16:32:16 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V6 7/7] remoteproc: imx_rproc: Enable attach recovery for
 i.MX8QM/QXP
Message-ID: <20221012223216.GE1196937@p14s>
References: <20220929061704.1571746-1-peng.fan@oss.nxp.com>
 <20220929061704.1571746-8-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929061704.1571746-8-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 29, 2022 at 02:17:04PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8QM/QXP M4 could recover without help from Linux, so to support it:
>  - enable feature RPROC_FEAT_ATTACH_ON_RECOVERY
>  - add detach hook
>  - Since we have detach callback, we could move the free mbox operation
>  from partition reset notify to detach callback.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bece44b46719..4057d6f33813 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -603,6 +603,22 @@ static int imx_rproc_attach(struct rproc *rproc)
>  	return imx_rproc_xtr_mbox_init(rproc);
>  }
>  
> +static int imx_rproc_detach(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (dcfg->method != IMX_RPROC_SCU_API)
> +		return -EOPNOTSUPP;
> +
> +	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id))
> +		return -EOPNOTSUPP;
> +
> +	imx_rproc_free_mbox(rproc);

Which is exactly what you did here.

I really don't understand what you did in patch 6/7...  Anyways, I suggest to
add support for the detached scenario and then fix the mailbox corruption
problem.

I am done reviewing this set.

> +
> +	return 0;
> +}
> +
>  static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -618,6 +634,7 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> +	.detach		= imx_rproc_detach,
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.kick		= imx_rproc_kick,
> @@ -797,8 +814,6 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  	if (!((event & BIT(priv->rproc_pt)) && (*(u8 *)group == IMX_SC_IRQ_GROUP_REBOOTED)))
>  		return 0;
>  
> -	imx_rproc_free_mbox(priv->rproc);
> -
>  	rproc_report_crash(priv->rproc, RPROC_WATCHDOG);
>  
>  	pr_info("Partition%d reset!\n", priv->rproc_pt);
> @@ -916,7 +931,8 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  		}
>  
>  		priv->rproc->state = RPROC_DETACHED;
> -		priv->rproc->recovery_disabled = true;
> +		priv->rproc->recovery_disabled = false;
> +		rproc_set_feature(priv->rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>  
>  		/* Get partition id and enable irq in SCFW */
>  		ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc_id, &pt);
> -- 
> 2.37.1
> 
