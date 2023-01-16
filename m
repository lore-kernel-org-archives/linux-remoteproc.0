Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2853C67871
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Jan 2023 17:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234171AbjAPRAq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Jan 2023 12:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbjAPRAW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Jan 2023 12:00:22 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBC559E44
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Jan 2023 08:43:05 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 7so20050487pga.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Jan 2023 08:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikxZNlHUgNrbKf+8U/yVt2M8Gk6i+Q3n7f7a9saNKsI=;
        b=Rtmn/zdGuLDgMj9Slnnpf/54DTVzbMzb9eHnyHiw5BIn7frY+F06y/ZUr7E2DEiGju
         0OLsAEXiAIesVl3aafeOMfq1wvVH5CIgDcXikCoKMenFqkwvcpsnnHIbJlZc2Ng5s6JF
         68+3y6ajiz5CKq+RXJ6oQW7/Yqq6cnXskjOg60jZmKhqcc6FrKjfu3M/jw2yT06dr4Ix
         lKPmxGQnowZBWOFQ3HXiTsLMmZdQcMLExfpj905OpC9K/cnV5MOI3zELibeReHU4OepM
         ZRwUw//CFbaOWL/A68cWT7cbUcuHMztzkjRDfluApD9d2CuSG4LMouUwUkPXwOynzJ6/
         tWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikxZNlHUgNrbKf+8U/yVt2M8Gk6i+Q3n7f7a9saNKsI=;
        b=3zWY8TSgUN/5rbPTY1xNxMkZ4TBupPEzPMN8eyswmvTNWU051Ksn+Ml5O+pUJiybu4
         E9MR3MZ6uLVFLVlIq0f20JUL3P59SW5/kpczBOlOGG62GPhGoMMZCkyrUgBWJXJdctSH
         Jzc1QbKHysYIoc7a+mejlYpFqREvvAmys+fKO3JSzP1rPdmblDXlV05O1dS3mGU+jeU0
         BDalWJcMgybBjqUMMAXxioOvFNVI+IEuo/M0JUYUnXxsb+mUZThfnfjuOkY6ui22L38p
         PITUdw/L2tLiPELJb8admv4DhZ0CEyH4NMr5m15OOqEgCZd1MrzE3smJZdP3ISKxrhPJ
         wcYg==
X-Gm-Message-State: AFqh2koFoqN7NMQ7uyXjKlmV5LpF57XA3CDHz1AHlz70BQpvTRI0SI1a
        s3GjqaXorbZ7rdNV2TB7eO9/pA==
X-Google-Smtp-Source: AMrXdXsGM+JKHBOueEKiRd1ruDWOukTMmYx3k3dePs3jQNUQPeyMRIKpRFmIUfTREkNd6WyzHXbCbg==
X-Received: by 2002:a05:6a00:179a:b0:58b:bc3a:622a with SMTP id s26-20020a056a00179a00b0058bbc3a622amr16498632pfg.21.1673887385170;
        Mon, 16 Jan 2023 08:43:05 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:32ab:eb7f:cea:1014])
        by smtp.gmail.com with ESMTPSA id w124-20020a626282000000b005769b23260fsm18932094pfb.18.2023.01.16.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:43:04 -0800 (PST)
Date:   Mon, 16 Jan 2023 09:43:01 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Devarsh Thakkar <devarsht@ti.com>
Cc:     andersson@kernel.org, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s-anna@ti.com, hnagalla@ti.com,
        praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
        j-luthra@ti.com
Subject: Re: [PATCH v6 1/3] remoteproc: k3-r5: Simplify single core config set
Message-ID: <20230116164301.GA3239767@p14s>
References: <20230116151906.549384-1-devarsht@ti.com>
 <20230116151906.549384-2-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116151906.549384-2-devarsht@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jan 16, 2023 at 08:49:04PM +0530, Devarsh Thakkar wrote:
> The config PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE
> is set only when cluster mode is set to
> CLUSTER_MODE_SINGLECPU and cluster mode
> is already configured before setting this config.
> 
> So directly check for cluster mode instead of checking
> soc_data->single_cpu_mode first and then checking
> cluster mode.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V6: No change
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 0481926c6975..036c9dc217f3 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -875,15 +875,14 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
>  	boot_vec = 0x0;
>  	if (core == core0) {
>  		clr_cfg = PROC_BOOT_CFG_FLAG_R5_TEINIT;
> -		if (cluster->soc_data->single_cpu_mode) {
> -			/*
> -			 * Single-CPU configuration bit can only be configured
> -			 * on Core0 and system firmware will NACK any requests
> -			 * with the bit configured, so program it only on
> -			 * permitted cores
> -			 */
> -			if (cluster->mode == CLUSTER_MODE_SINGLECPU)
> -				set_cfg = PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE;
> +		/*
> +		 * Single-CPU configuration bit can only be configured
> +		 * on Core0 and system firmware will NACK any requests
> +		 * with the bit configured, so program it only on
> +		 * permitted cores
> +		 */
> +		if (cluster->mode == CLUSTER_MODE_SINGLECPU) {
> +			set_cfg = PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE;

This is exactly the kind of buggy situation I want to avoid by asking to use
soc_data->single_cpu_mode only in probe().

>  		} else {
>  			/*
>  			 * LockStep configuration bit is Read-only on Split-mode
> -- 
> 2.34.1
> 
