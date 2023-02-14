Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E49AC05027
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 20:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjBNUZL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 15:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjBNUZL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 15:25:11 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2579B55B2
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 12:25:10 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id 16so11057714pfo.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 12:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6owkNXIzp1vvBsxZwQmk2daqoSOZH7CsTkxkBz81Dk=;
        b=pdA6JyYQHNErVqK8LINqlRGMqxtADvlL90ZJrL6mWqZ91n/eHY3Caw74nZvN0P/HBe
         JQ5RYHrGTVqtuOgV2wOy3SLUkT3Ou378ZeWaifGUkROZMmfC0/jWnct97FqY7eMln/SC
         S6causZK3rl4RecLSW/4yIm09/4sHLwskojjipik7emxeZaxvSmVXE4KuI3MTxrP6JtI
         U5ORDIM50hiPc7R2f+nURu/EC3pzXoLENgPp+d/WqzG4ydCGUH5w/WBWo2onlmK66a0r
         e/0NPx1ilq8omftTipz3Yw924m1DVSIyCtcjTZTLan5ZLngCDPfBGkpeffuALosRElc2
         TTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6owkNXIzp1vvBsxZwQmk2daqoSOZH7CsTkxkBz81Dk=;
        b=1GjtCVlFyM6zZM2UybxPwyifJ7ftd6uidUNBoxHc2MaFz8meYKARb7DY2+RAXc12ys
         VJdb9LCzVK0+SJ7asramMZ8wWQ0Lc3G5AnJbsnoaZTA3LDUfawaFfSVqI16omuWp6Lbm
         S/s2TQjxfmKi2mCqoZ9J/ZJpdFfCINkidPqlAT/9G0g0PnzvPUJCO2XITDyW18ur+scI
         fR9m28T9tT/M02DAjxCFZSTu8qOlHHtiwBcfDU1UoppauWObERCpY4jCtHXNp79Fml4i
         z4MPA9HY6xUwWG3ht4QccKS9KIBGZtKri330JccmxVP4DOVo/JrDg7kabUwLQWeCEp2H
         4dbw==
X-Gm-Message-State: AO0yUKWrJ+ll3A5LRnvwCJNzYkGoCuDJqUxDxr5pyd66bcgoCVPf55ht
        l90FsBmu/lRLsqTpD4blOHLwr0qZq5rn0hD1
X-Google-Smtp-Source: AK7set9j8KXiZRlMz3+V5fLFfRnJMFs/x9O9jvoz8VDtOyZT2uChw1vlI384CedfCzm6km2vc0VA9Q==
X-Received: by 2002:a05:6a00:4108:b0:5a6:cbdc:2a1a with SMTP id bu8-20020a056a00410800b005a6cbdc2a1amr916874pfb.2.1676406309569;
        Tue, 14 Feb 2023 12:25:09 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:21f5:b54f:9213:bd83])
        by smtp.gmail.com with ESMTPSA id p26-20020a62ab1a000000b0058e264958b7sm5326691pff.91.2023.02.14.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 12:25:09 -0800 (PST)
Date:   Tue, 14 Feb 2023 13:25:06 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-imx <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [RESEND PATCH v4] remoteproc: imx_dsp_rproc: add module
 parameter to ignore ready flag from remote processor
Message-ID: <20230214202506.GA384054@p14s>
References: <20230214163744.16377-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214163744.16377-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Feb 14, 2023 at 06:37:44PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> There are cases when we want to test a simple "hello world"
> application on the DSP and we don't have IPC between the cores.
> Therefore, do not wait for a confirmation from the remote processor
> at start.
> 
> Added "ignore_dsp_ready" flag while inserting the module to ignore
> remote processor reply after start.
> By default, this is off - do not ignore reply from rproc.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

This patch is on my review list, as indicated in February 8th's patchset review
order email.  That said, I haven't seen Daniel's RB on the mailing list.

> ---
> Changes since v3
> - do not instantiate static var to 0, this is done by default
> - do not initialize mailbox if not IPC between the core
> 
> Changes since v2
> - s/ignoreready/ignore_dsp_ready
> 
> Changes since v1
> - change BIT(31) to BIT(1) for REMOTE_SKIP_WAIT
> 
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 95da1cbefacf..fb69f4e8ee96 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -26,9 +26,18 @@
>  #include "remoteproc_elf_helpers.h"
>  #include "remoteproc_internal.h"
>  
> +/*
> + * Module parameters
> + */
> +static unsigned int imx_dsp_rproc_ignore_ready;
> +module_param_named(ignore_dsp_ready, imx_dsp_rproc_ignore_ready, int, 0644);
> +MODULE_PARM_DESC(ignore_dsp_ready,
> +		 "Ignore remote proc reply after start, default is 0 (off).");
> +
>  #define DSP_RPROC_CLK_MAX			5
>  
>  #define REMOTE_IS_READY				BIT(0)
> +#define REMOTE_SKIP_WAIT			BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
>  /* att flags */
> @@ -282,6 +291,10 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	struct imx_dsp_rproc *priv = rproc->priv;
>  	int i;
>  
> +	/* No IPC between the cores */
> +	if (priv->flags & REMOTE_SKIP_WAIT)
> +		return 0;
> +
>  	if (!priv->rxdb_ch)
>  		return 0;
>  
> @@ -503,6 +516,13 @@ static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)
>  	struct mbox_client *cl;
>  	int ret;
>  
> +	/*
> +	 * If there is no IPC between the cores,
> +	 * then no need to initialize mailbox.
> +	 */
> +	if (priv->flags & REMOTE_SKIP_WAIT)
> +		return 0;
> +
>  	if (!of_get_property(dev->of_node, "mbox-names", NULL))
>  		return 0;
>  
> @@ -562,6 +582,10 @@ static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)
>  
>  static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>  {
> +	/* No IPC between the cores */
> +	if (priv->flags & REMOTE_SKIP_WAIT)
> +		return;
> +
>  	mbox_free_channel(priv->tx_ch);
>  	mbox_free_channel(priv->rx_ch);
>  	mbox_free_channel(priv->rxdb_ch);
> @@ -903,6 +927,9 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  	priv->rproc = rproc;
>  	priv->dsp_dcfg = dsp_dcfg;
>  
> +	if (imx_dsp_rproc_ignore_ready)
> +		priv->flags |= REMOTE_SKIP_WAIT;
> +
>  	dev_set_drvdata(dev, rproc);
>  
>  	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
> -- 
> 2.17.1
> 
