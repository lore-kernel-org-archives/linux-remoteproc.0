Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EC2C48BD1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 17:11:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 418E5613C9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 17:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhFJRNw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Jun 2021 13:13:52 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:34568 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhFJRNv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Jun 2021 13:13:51 -0400
Received: by mail-pl1-f172.google.com with SMTP id h1so1384483plt.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Jun 2021 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fGe4DY8mKKnygk1FE1mf6upUstyZmptYOrEfvpk5Mh4=;
        b=mdhUfAb6YifrK82K1uc/PcW7Zxwk4vR3l4dsm8mWZeEkgaENHt8dNJfm9RlVGfAeFg
         HXWfyBTRkCAA8Sw4IU5MahyfcRsTv/7i7ZCIWQYC3dG698lzzVo/PsMeIyKPMhZEfBsb
         BteICrFlQFZxM6TsPbdHKk39bzZo97p/pLGzdq0hMwTd3yHSqFH0PS9iTeMImIX2OL8k
         kJkfTNlkVynbsIoVk10EyMZr7Y25M4buoHWx/ITZV395lRP6gJktiI3zgSmSUMMqFbaC
         3ZqEqdOqRYCsDJ8OWLH2tGhy++wUmUBZrwymWmqSBguSYnRrQZPQhIyIP334l1g9wSxW
         MC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fGe4DY8mKKnygk1FE1mf6upUstyZmptYOrEfvpk5Mh4=;
        b=DbaG9aghTsLMn7lXMUV/Yr4sHRraR+2GDTxCfPTPr/GlMT4ue9iRXbzRpq0bMM7N6B
         tvPqDPTJ8L5Gh8YBi3hvYLaTka5ivzV1YF3F5qh60pZ/nrNqOjG3G+VP7VzVPtWe5QeO
         lxobu0YC2yHJvg6rV2rAu9a65ILEnHnsSlXPtJwjcoWP12uBLkQVqUWyb795gVo/Zf6L
         75PtTsQwMSUgcsh/u8WEfvx/YesX7w/hn+GX/SNr2VNU6ZfN/uuvsWG+AxU/izwhPcsc
         rMX9OJIKxX4atOFuKQJNJMlUGnSxup09T6FVpsZxe+B6Al802qlwf6ElXyN8PXmX6X0N
         ZUGg==
X-Gm-Message-State: AOAM530sa8EYu7RA9vGzxFv0f/p47jAuaw5aJmR3RcIdowLjh4p1KOcs
        A4sgMogF4FeOHDK1LDwI1hM3Mw==
X-Google-Smtp-Source: ABdhPJz7u6AlNLguXb+LpDc0K2GTrwuNFStkzdToNRbtHqF0bLOWIe1cPg3HAR319u2Dk5WLeiBA0g==
X-Received: by 2002:a17:90a:7c02:: with SMTP id v2mr4377021pjf.118.1623345055266;
        Thu, 10 Jun 2021 10:10:55 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g6sm3010793pfq.110.2021.06.10.10.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 10:10:53 -0700 (PDT)
Date:   Thu, 10 Jun 2021 11:10:52 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] rpmsg: Fix rpmsg_create_ept return when RPMSG config is
 not defined
Message-ID: <20210610171052.GF34238@p14s>
References: <20210604160549.2122-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604160549.2122-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 04, 2021 at 06:05:49PM +0200, Arnaud Pouliquen wrote:
> This is a minor fix.
> 
> According to the description of the rpmsg_create_ept in rpmsg_core.c
> the function should return NULL on error.
> 

You are correct, and none of the client return an error code either.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  include/linux/rpmsg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd049f18..a8dcf8a9ae88 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -231,7 +231,7 @@ static inline struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev
>  	/* This shouldn't be possible */
>  	WARN_ON(1);
>  
> -	return ERR_PTR(-ENXIO);
> +	return NULL;

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  }
>  
>  static inline int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
> -- 
> 2.17.1
> 
