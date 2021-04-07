Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BED7C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Apr 2021 16:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC69861205
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Apr 2021 16:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354328AbhDGQg7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 12:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354325AbhDGQgy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 12:36:54 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E2CC06175F
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Apr 2021 09:36:45 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id t23so6865757pjy.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Apr 2021 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pEEhjTO9JV5okKF7T4MRSprI70KvuiQd/IpVgcL8zGg=;
        b=o/VII+Jx+ad6iMKK+qAdAYnwhh9a6MQvFh9liFeXv1i74yoOg4/4KHJHadvYQJ8gj6
         ZAB+0xL/BQT/MwzCoeW1Nkdjo2BzA4JtDQeDZSsvN2/tkIrmMUclyB8bsf9LNz44wlYu
         mnErsaqChcz4N/LsCo6sHFauznR2iFqheiSCAYaeuWfAX7MLDITO2T9jCNjmXrTDS9hp
         qqB6ujoz1NMlwZgKys38LYk8XNvqBNIfIiYBExIkPkPzKfa5nzPFkY0Y0oQYCTsHEacI
         U2ClAZTUJ/pnzHKumNoDWdjWghmRW6ltleYu4/bnBazDTR94cgPRq2fhXdA5nqAoEyDC
         lGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pEEhjTO9JV5okKF7T4MRSprI70KvuiQd/IpVgcL8zGg=;
        b=hROyhnRQ1xbpK4s4O/C19VClaBepllxtirI+Z1kU9ySp3GzIOWbfGeXa0NiYPouWIW
         kxH6jZuQyc+vh+C6OqCjUmTmJps+sRorwuw4YhlkNdlu1L8hpalECyn1cjShW+OX/dub
         50qkeYFZWL6oh4ImlohHk5FwxYEc4NQP4UhXYTrDNzuLFbJBvkZEyPM+E9+Ev/2UP9mg
         WqcjgIqa0HdASmLwP5vMRb89QIW/an11+qmZKiyqqPTPx1l8Er7rBTI1sLQjTFyjDsBv
         t54aLmlfhU75l5gjns4ts5WyTZ5Ukg+Rrcfnzb9uUh/I70/7Vf9tAuBfdCAP007ybtj3
         zu2Q==
X-Gm-Message-State: AOAM5323ZViCi4l4DDeIKg0zHv6gOaNN/hQTCd2XrMIV74mHFoZ4zfQA
        u7A16/3rezlvRltSiLCiWOsP2Q==
X-Google-Smtp-Source: ABdhPJwwpcXbX3SPUZyeqzlXInVrruizddprEMheMKqVbORqTtMo4h/iT/KC4/GRIcmDyX6msyrC2Q==
X-Received: by 2002:a17:902:bb8e:b029:e6:3b2:5834 with SMTP id m14-20020a170902bb8eb02900e603b25834mr3815144pls.38.1617813404691;
        Wed, 07 Apr 2021 09:36:44 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n16sm21971850pff.119.2021.04.07.09.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:36:44 -0700 (PDT)
Date:   Wed, 7 Apr 2021 10:36:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 3/4] remoteproc: imx: move memory parsing to rproc_ops
Message-ID: <20210407163642.GD418374@xps15>
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
 <1617082235-15923-4-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617082235-15923-4-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 30, 2021 at 01:30:34PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use the rproc_ops::prepare() hook for doing memory resources
> reallocation when reattach an remote procesor.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index b05aae0ad7a2..7cd09971d1a4 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -317,7 +317,7 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> -static int imx_rproc_parse_memory_regions(struct rproc *rproc)
> +static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device_node *np = priv->dev->of_node;
> @@ -363,10 +363,7 @@ static int imx_rproc_parse_memory_regions(struct rproc *rproc)
>  
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
> -	int ret = imx_rproc_parse_memory_regions(rproc);
> -
> -	if (ret)
> -		return ret;
> +	int ret;
>  
>  	ret = rproc_elf_load_rsc_table(rproc, fw);
>  	if (ret)
> @@ -399,6 +396,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  }
>  
>  static const struct rproc_ops imx_rproc_ops = {
> +	.prepare	= imx_rproc_prepare,
>  	.start		= imx_rproc_start,
>  	.stop		= imx_rproc_stop,
>  	.kick		= imx_rproc_kick,
> -- 
> 2.30.0
> 
