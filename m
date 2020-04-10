Return-Path: <SRS0=Skgh=52=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8746EC2BA19
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Apr 2020 02:16:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C4CA20A8B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Apr 2020 02:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjfn/IP8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgDJCQs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 22:16:48 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55002 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgDJCQs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 22:16:48 -0400
Received: by mail-pj1-f68.google.com with SMTP id np9so261495pjb.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2020 19:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=epcePNPH75ZrOgRmkPaWETOFUufSwk1exuBAOcMmYKU=;
        b=pjfn/IP8jAV7H7R+w1ysZc+k8OBRHDB+7tnnwKs9KOlerSrQpXe+PcIJfqm/jgAfrK
         Zv8qRfcT4RqhPlTiGwjYle9eLBeczRlE6OCGR8Ap3OJXpPVyDfxxTrbErDCQUyltqm1f
         AX2lzP5P+Z9q7nOWpd+ib1y8DAR391Ers/N0LqsMn/uBK2EsoZQCiiIlAwmHdjyLU4mk
         LoR0nHuuDquB04+10oLTkQCAPwjKTa6UcFE/KxLXt5sgtYgo00JfW5lIUzxmsq0gNlwP
         oqHFrMQn1H3/YWhoksSyKOI1P9dvFP0a8q/kBjAoPxLQZ4ux7c9M+Jh90W1N+7YPeFs0
         uFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=epcePNPH75ZrOgRmkPaWETOFUufSwk1exuBAOcMmYKU=;
        b=YdilJOcF93WQPbEjjhK86vl/TyNcrGVawobpvyfD20h95Jg8gLRZpCYgzyfb79kj+G
         waT429s41kIfkWO3n4Db0dp0hY7vByjiEeKAYDVGUNIlv26ryCiIiQunIehWR/a225mT
         mRmqSNJYNvR36laj6zGHmrPFIw6yh7eciggw6Lkbizzm4DdygYEHwe6EQNQ9iZd7QmTU
         xP8WlrPXUuBHfTKgcaeUbABUMcbuqatiVGiAnZw+Nv6LeZ/esMXbJ9d6Mr7E/MXxDu6K
         MSY/GigXZSMsmH5ZviMKwfH9LLRwDxU7LzDXXZl7aQo8EDeZamhHsTmnrS+REeKvP2Ay
         l0nw==
X-Gm-Message-State: AGi0PuZ0Eo2yrqyO/6eULAkN7B/ot4wU+dyvfitIsVIiCzucO6KOvpsY
        Gumuwp8jLn2NmMmWRzDcs+pJ+R7nJrY=
X-Google-Smtp-Source: APiQypJqyKR3rsDc5ml7bDajSOWFoKnB5Kl1YpiY804f+Y5ThLwopJ6r9asJ14nxdI4SJULEUHHkNg==
X-Received: by 2002:a17:902:ab83:: with SMTP id f3mr2612236plr.197.1586485007444;
        Thu, 09 Apr 2020 19:16:47 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q15sm381086pgj.4.2020.04.09.19.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 19:16:46 -0700 (PDT)
Date:   Thu, 9 Apr 2020 19:16:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] remoteproc: pull in slab.h
Message-ID: <20200410021655.GA20625@builder.lan>
References: <20200409211054.12091-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409211054.12091-1-mst@redhat.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200410021655.W2hRRVMZ5q3gpDCBWXQKxJNbF5XQVxA7f2Nicm3Tj4M@z>

On Thu 09 Apr 14:10 PDT 2020, Michael S. Tsirkin wrote:

> In preparation to virtio header changes, include slab.h directly as
> this module is using it.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index a18f88044111..7ef931e9605c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
> +#include <linux/slab.h>
>  #include <linux/workqueue.h>
>  
>  #include "remoteproc_internal.h"
> -- 
> MST
> 
