Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83CBC2B9F8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 17:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBB49610CE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 17:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhEYRax (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 25 May 2021 13:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbhEYRaw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 May 2021 13:30:52 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BC0C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 May 2021 10:29:20 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id q25so6108976pfn.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 May 2021 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c1te1fmETHKIo/3PXTYiGotWvN1fuCwdsljvLwzWe+U=;
        b=mJmGP2FKoCUVm6+tCyuoComU94tA6XL0a4R+34I0aN641K+/qGPNewC70RrBwNYeLS
         fzv5aUMrbTS+o+sTSkPJ+mePf1s3kP9cIS9JcAgZIdfDCH1BDFhtpwVNMMRanzz8zQq0
         BbSdOT7QAE5ZkobtNdILsQe1pVvb6KR9fEOYFeT649qVlSJa0F0ZWXgOkE0IZi5qgpY9
         1PNRPwGlZa1b0nSIYqvGjO9xR/+eZP30wZ4wodXz2Nli7p7CcNTWakLxdari5xT7rctB
         e4dSh+BLHefbAGtvH59WKXDneoOTgh0pBNm9Y0QBlXFQrlbqaU1fUN999MT6TP/6dAyi
         XBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c1te1fmETHKIo/3PXTYiGotWvN1fuCwdsljvLwzWe+U=;
        b=XYARhpbIYVLoQYggDMyBU77jsAaa5u86T5BM27ohJzO7TK5PA/OYViq9TzYr2eGQWh
         h6E250pAhzvDoPeWnK/O8puG69v0oI71PjbU0jU2c0hjG9X3/QXc/2wwSVplwNFGNG0w
         Lz0Db37NB4n6hep7+pe3N4bxa8Vk4A3NGwZC3AMyEVTfCgSSujtcw881wfXTYKXJKe/Y
         82IPODM4W5LGbucScE/HfMiR5VxE3RBhh3AWPtVMr9R4QLb8uD1r5waj3v0mH2HkX1oj
         eES+DRkw1sfUqcbXCKGhgCO+y3tdhZc1ZhwKKQNQfBJ3bfq/ZHPmqfUPTKgf2oz8sUeH
         2rtQ==
X-Gm-Message-State: AOAM533YAJOGvTJTSysnIxyLyajPV6DsFUv2xlp6i8IdO7sz7Z0GxQvx
        LhApoAm1oEIWdn7w6bYgfkSUBA==
X-Google-Smtp-Source: ABdhPJzTx6EvBIS+w3v6j8IhihjLGhwWbR+/AvLMKzy9ad3ht9mD5pnphdwupzdU8DBi2XWRaTYd+w==
X-Received: by 2002:a63:3c0e:: with SMTP id j14mr20301393pga.427.1621963759884;
        Tue, 25 May 2021 10:29:19 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id ge5sm2681961pjb.45.2021.05.25.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:29:18 -0700 (PDT)
Date:   Tue, 25 May 2021 11:29:17 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/4] rpmsg: char: Remove useless include
Message-ID: <20210525172917.GA1113058@xps15>
References: <20210517171531.21205-1-arnaud.pouliquen@foss.st.com>
 <20210517171531.21205-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517171531.21205-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, May 17, 2021 at 07:15:28PM +0200, Arnaud Pouliquen wrote:
> No facility requests the include of rpmsg_internal.h header file.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b2d163..b5907b80727c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -22,8 +22,6 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>  
> -#include "rpmsg_internal.h"
> -
>  #define RPMSG_DEV_MAX	(MINORMASK + 1)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  static dev_t rpmsg_major;
> -- 
> 2.17.1
> 
