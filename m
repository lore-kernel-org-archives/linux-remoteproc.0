Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9CAC433ED
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Apr 2021 16:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A42F7611CC
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Apr 2021 16:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344308AbhDGQ3i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 12:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbhDGQ3i (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 12:29:38 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2641C06175F
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Apr 2021 09:29:28 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id g10so9597950plt.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Apr 2021 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=30vaYO8QvcWp/TkVqpqtB3ob8eJXnmjqog5CouESalk=;
        b=hs7bKSs1jZB7tVMk24eqMdDhXi/Zi78JsD8ccMJHgSikkyBi9yOwjKQYOw7Qpa+91C
         zj3yKvPCbnyb5xrHxkYPdawFWI+zjII/gCnB3bat7B3fUY7b0UbDQ6otxH8nWAxlf/i8
         DVRFFuQUbSzXDHNzi+E7uCv4Pr5a4DuOBgOP8cl+YkyjitiTFsKSkNEKKmiY63amBIvB
         lAPAVSA5vcJd4ludsDfTHGGedt+fdfQqvUA9M/V8wMWMUV40Lf8uiyFXG/bY7TJqsfL7
         z1s2Y65AkNZhj6EE3p8g/gek5keY3i+9u3obqr7J/zA/WsbiGe75qDFEY7e3rLJ0iYPh
         kNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=30vaYO8QvcWp/TkVqpqtB3ob8eJXnmjqog5CouESalk=;
        b=LLad5J0rjg1nBKudZHk9nKUu8bWsATDcjpJGWCcwf57YqBBRWTEQxLaRg8pjZklQMa
         +UDB4ASbKt7Nv+jaJ25tga9JGgPGie3pzlhQmJEwMR1mabvumDHRNjVokNoy7YML0UCZ
         A1+c4qljIkx4V0rTNer6al3nWSXXeNhHl18D1UsmZX16Dr20qOv1KE83PEv8l3lIfjGh
         nw7fU1HQFZde33XQvLQSpONlxupwWChC8RpDpMW454n3K+zUIUQVYOEsFTlIk+Ic6Xiy
         f4tS71xS7h8Sz/geQH+VwZLn8Z0UAw5huo60a54QfvbVJtQlby0GYkiSQT6kQp1YRLoM
         N+GA==
X-Gm-Message-State: AOAM533rgLDvzOyLsFF139m0+jvBmpgKtF1RzqWvfSvo7D1iKhS8kVVD
        QGS73gzClig7yq+/DVWM5cNt9w==
X-Google-Smtp-Source: ABdhPJxp1BMcOO2FCXs6zLTKMNXvSMVT4MFuXpVxFI+xBc98lIgK6yT8/QQT0HBAnGcZnxOd2LsOgg==
X-Received: by 2002:a17:90a:6e47:: with SMTP id s7mr4143181pjm.229.1617812968299;
        Wed, 07 Apr 2021 09:29:28 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x18sm2456918pfu.32.2021.04.07.09.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:29:27 -0700 (PDT)
Date:   Wed, 7 Apr 2021 10:29:26 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 1/4] remoteproc: imx: add missing of_node_put
Message-ID: <20210407162926.GC418374@xps15>
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
 <1617082235-15923-2-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617082235-15923-2-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 30, 2021 at 01:30:32PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> After of_parse_phandle, we need of_node_put to decrease the refcount
> of the device_node.
> 
> Reported-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6d3207ccbaef..077413319f58 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -459,6 +459,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  			return err;
>  		}
>  
> +		of_node_put(node);
> +

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  		if (b >= IMX7D_RPROC_MEM_MAX)
>  			break;
>  
> -- 
> 2.30.0
> 
