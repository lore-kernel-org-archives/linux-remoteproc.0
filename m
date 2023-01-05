Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE62C4708E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Jan 2023 21:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjAEVEs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Jan 2023 16:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbjAEVEq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Jan 2023 16:04:46 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FA860CFC
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jan 2023 13:04:45 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id ge16so37507706pjb.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jan 2023 13:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gq5zMT7qKiOGGkpiOdS+aWAUivss5/0EuyAwYBJFMig=;
        b=dVcdBT+/xkDAkKF8GVZEYW6CTpjUmbAe4hKOJq/HYqbURNjyylhjfhioHHYdQhB/uI
         diQg9vP/tXK3FWkx061EzTi1RcfYC0vvUYOuy/9bVwZwduF2kASda0nonxYoI31yqqsc
         aWPJ3bs6fZa5dzl7k/V8H5DcoeXxjUK0vsc6yaFKPOLSXniz+kwKkGGXjGyUgtUEZS35
         l9jdvPRkJdIuXPua6X3pXjWS1yzR8MQ0rmZAMVrbhxMp872M58YPWz5P2ktsw3bJdr13
         AOMgXlfXeZ42f+5/t90c6CEf1I+2NKLK05PbdW5MPScYhzahY6pjY2tjhrzI59JjjmTE
         aiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq5zMT7qKiOGGkpiOdS+aWAUivss5/0EuyAwYBJFMig=;
        b=vhTYYTC8Cwcray1tfulsRpbYObIy6dIy7JoQ5a4Xix/Y43l/1miSo3YF6SUVM/BYmf
         ppshNyk9xDarzW+n1iN2sVwVM27mthgs71ecL28Zw1+Ynl82GIhMqm37m2fJmOip1zPD
         lMCKHUDfEjhbJdBhKp5ranuW39Xtl+ZhbMzHQjAY9Svgp877AsmvjO7Nt1BwBmjql3ti
         fw/LaiHxGSNIb9BcPXfftmyrPwY0VKHAeAWKhH0fbcmojMvnPZR48jxHdnHrmrkpM0YY
         w9koNmwyPvKrVhaR6HbRFWqu1DJ8Noak+M42UcDEheeKBRzN7z4NWPjELgkudO4UOSVA
         C9fg==
X-Gm-Message-State: AFqh2koINQccIqCUYXQDtyzI6s3ZaZ7UJAFJsDwVL9cs4aSh43UhQdS2
        DOCLUuHWRDIGi1oo3dJTIrXyDA==
X-Google-Smtp-Source: AMrXdXuQs+bKKl0YjIFT3ZKePK3lGkzMI7uH11S1pVoC2C9+suVGGMQQ184rbDqB8ApJ+iV6FumKnQ==
X-Received: by 2002:a05:6a21:3949:b0:a7:9022:5d5e with SMTP id ac9-20020a056a21394900b000a790225d5emr64436311pzc.2.1672952685024;
        Thu, 05 Jan 2023 13:04:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1328:ca09:d4c2:fcbc])
        by smtp.gmail.com with ESMTPSA id n184-20020a6227c1000000b005832c23f33fsm1739855pfn.15.2023.01.05.13.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 13:04:44 -0800 (PST)
Date:   Thu, 5 Jan 2023 14:04:41 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     yang.yang29@zte.com.cn
Cc:     andersson@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, xu.panda@zte.com.cn
Subject: Re: [PATCH linux-next] rpmsg: use strscpy() to instead of strncpy()
Message-ID: <20230105210441.GA2292796@p14s>
References: <202212231044105692444@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212231044105692444@zte.com.cn>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Dec 23, 2022 at 10:44:10AM +0800, yang.yang29@zte.com.cn wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
> 
> The implementation of strscpy() is more robust and safer.
> That's now the recommended way to copy NUL-terminated strings.
> 
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com>
> ---
>  drivers/rpmsg/rpmsg_ns.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index c70ad03ff2e9..c7b5b60aef4d 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -48,9 +48,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	}
> 
>  	/* don't trust the remote processor for null terminating the name */
> -	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> -

This is broken.

> -	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> +	strscpy(chinfo.name, msg->name, sizeof(chinfo.name));

In this case there isn't a need to use strscpy() since we _know_ from the above
that msg->name is NULL terminated.

>  	chinfo.src = RPMSG_ADDR_ANY;
>  	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
> 
> -- 
> 2.15.2
