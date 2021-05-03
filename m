Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A3CC433ED
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 16:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3005261166
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 May 2021 16:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhECQb1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 May 2021 12:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhECQb0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 May 2021 12:31:26 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2260BC061761
        for <linux-remoteproc@vger.kernel.org>; Mon,  3 May 2021 09:30:32 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so6078889pjh.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 May 2021 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EapMqo/OLl+j3jdXKjeGdsgmzEj1HQe1hRFKca8q+6A=;
        b=C/diLqTofNdL2L3UQNySHFSMf8kta5H6GQIuxwE8d/AjN1svTd8wmbDYkG1MJQCp8+
         h1yr2vX/WkZTs3xRjxIWXh5UQ6mXrsgBmkEU5cf6GmCtJGDaNmfzmcx7jp8qgPjFGpRW
         z3PiQbRFhvl4rVXj6tKUsS2lwehUHtQJoCDB68Y0k2v0798717r7pZvlhyQLKGNg4CO+
         mdE2+jWpFBHfapJQo+7t+kQaRoI2dUVd6Z2JH883DBOQW/Er756wanxgGwuFAfqgA0pI
         26qMXp/EC4tW/c4D60e//8JiuMaoDlkpK58i42GxvOTD7nMyeJYbyROmDly1UdTNoG0K
         M2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EapMqo/OLl+j3jdXKjeGdsgmzEj1HQe1hRFKca8q+6A=;
        b=SfUiS1yXOGReQXJyk9IU1OulEiWPd0QuXKPqYlqejG5RhfOCnA73Bb3nO4JQDOHUV0
         2+Wpo3QhCOkRchvInTrOClzQgF9XLEubpWcDk/UMLPLJwDs4okMQGXtpspQRP9/Hwuxt
         bGNpd16nEOOl6eXPva4lnkLFvUjiS5AQ/8Nv8ccjEmfZwwAOTK8wrdX+dmuohlK+RGak
         4rUTSyqhz8dlxmq1m4jWgHhkiBghZtx8wrwlq13Zwi3aVQA3AEaAcl+QY9tbDtWnAZVs
         remzTXLdqM4N5QCA9CoDCsNzqSmZGY7iI5clNuvhFP54a5zonS1tICLkA4dftM5nq+/n
         8kXQ==
X-Gm-Message-State: AOAM530J7lKxcgHuStvkpvarx6Vl4eXqMdNal8SCOIg1hj7CJ8CKpJkH
        rNrIHRqIa6lWAtw80GI/4vqa/egCqv5ICQ==
X-Google-Smtp-Source: ABdhPJzwtq7mjX3hYAL/TNFTiJfK7icexqpayF9WmFmrYT0VVvx2PUn3rCuFqBYFWvFGyOKnT30lJA==
X-Received: by 2002:a17:902:d645:b029:ed:5c25:9ac0 with SMTP id y5-20020a170902d645b02900ed5c259ac0mr21439416plh.23.1620059431667;
        Mon, 03 May 2021 09:30:31 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id i123sm9788207pfc.53.2021.05.03.09.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 09:30:31 -0700 (PDT)
Date:   Mon, 3 May 2021 10:30:28 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V5 5/8] remoteproc: imx_rproc: initial support for
 mutilple start/stop method
Message-ID: <20210503163028.GC1699665@xps15>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <1618971622-30539-6-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618971622-30539-6-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 21, 2021 at 10:20:19AM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO
> (start/stop through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).
> 
> The current SoCs supported are all using IMX_RPROC_MMIO.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 06dac92e98e6..6289aeae95b6 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -74,6 +74,15 @@ struct imx_rproc_att {
>  	int flags;
>  };
>  
> +/* Remote core start/stop method */
> +enum imx_rproc_method {
> +	IMX_RPROC_NONE,
> +	/* Through syscon regmap */
> +	IMX_RPROC_MMIO,
> +	/* Through ARM SMCCC */
> +	IMX_RPROC_SMC,
> +};
> +
>  struct imx_rproc_dcfg {
>  	u32				src_reg;
>  	u32				src_mask;
> @@ -81,6 +90,7 @@ struct imx_rproc_dcfg {
>  	u32				src_stop;
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
> +	enum imx_rproc_method		method;
>  };
>  
>  struct imx_rproc {
> @@ -183,6 +193,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx8mq,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
> @@ -192,6 +203,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx7d,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
> @@ -201,6 +213,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
>  	.src_stop	= IMX6SX_M4_STOP,
>  	.att		= imx_rproc_att_imx6sx,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
> +	.method		= IMX_RPROC_MMIO,
>  };
>  
>  static int imx_rproc_start(struct rproc *rproc)
> -- 
> 2.30.0
> 
