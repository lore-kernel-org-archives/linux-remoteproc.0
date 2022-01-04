Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B05C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Jan 2022 17:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbiADRq1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 Jan 2022 12:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235763AbiADRq1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Jan 2022 12:46:27 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E385C061761
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 Jan 2022 09:46:27 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so207917pjj.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Jan 2022 09:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pxdiDVXwa/ny97PWAQ3t8QcMG6dpbAX9omXQJzmLbgw=;
        b=lQJYu6sb4BL1el4AGCZ5lZ4EDih746LFOjKLJPIaNu5nXj8XVn1Ri3YZ/ZthcnhXfT
         8S/+oweJfPX+tMDFfIJAwXVWccaiGQP+tUky3Bq+tC0c0ARqjyKKUVGWdCVAmkaJl+Si
         cTI5HezO/YZOC8D6vucmrV/2Rf37XpIRTuhHedn+Zjq5/i/tM6n85kXsdIepo5UDorNz
         DrfXPDH18F6fbhX/Hs0ugWIrc89OIEMnY3aSxx2OO41w8VJTnS2U9vaiRs/lrUn7ytVn
         gmMaV6JtBDS+tTdzc+F29ofWOf/cV6iRphoZQT//VQykqySV7ex6dsa/eOaH8Ysg3ADf
         OZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pxdiDVXwa/ny97PWAQ3t8QcMG6dpbAX9omXQJzmLbgw=;
        b=mLDwKlWsg+rG9aPwZMO2gSMQ/wNRWjwQ5qV2jvK6lnxY5jDy2WEy8XTkOydl+cPfRQ
         QcZFj4k2SLYVg6LqoaNY9dCI2IWyMYY7vTkZb3UnAtNbVQ4UHauWitdKCBmKwNfE42x8
         pUaaMIk2vQ9WQatF9iedmWKX8Zul8vTZ40r6I2+soJA6T6aM7jQpB4vGiVUMGydtaJhz
         NuC8//u/MQH7ch8D0uy5F7PByaHJfN/5nfHh5YB6sB5Pf29bbSwZw1tJodY7JjTjrbXj
         Uu6i2TKIKIhTy5eSGdJqw1PaV/9+o98KoMXS35BL3XflHOZ8PGzK5vX2BjN+XVwt7jWV
         YaDA==
X-Gm-Message-State: AOAM532v9aXEg8i2LObPHs8MQj+GLickjZyz25llS4jOVt0uwRTMli10
        8BcQHvFANQO3wXeYbbHM/yPOUg==
X-Google-Smtp-Source: ABdhPJwGkqo37L+3Tk3QppOQGxkb+oeT49yO+8jdPQ1tj2onFEAXJZyowk4PVLsggA+w5VJaSLIqNQ==
X-Received: by 2002:a17:90a:d498:: with SMTP id s24mr62580529pju.46.1641318386765;
        Tue, 04 Jan 2022 09:46:26 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm19236323pgm.67.2022.01.04.09.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 09:46:25 -0800 (PST)
Date:   Tue, 4 Jan 2022 10:46:23 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Fix NULL vs IS_ERR() checking in
 rproc_create_trace_file
Message-ID: <20220104174623.GA540353@p14s>
References: <20211227090645.18600-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227090645.18600-1-linmq006@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

On Mon, Dec 27, 2021 at 09:06:45AM +0000, Miaoqian Lin wrote:
> The debugfs_create_file() function doesn't return NULL.
> It returns error pointers.

You are correct.

> 
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index b5a1e3b697d9..a2409fe2f57b 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -390,7 +390,7 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
>  
>  	tfile = debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
>  				    &trace_rproc_ops);
> -	if (!tfile) {
> +	if (IS_ERR(tfile)) {
>  		dev_err(&rproc->dev, "failed to create debugfs trace entry\n");
>  		return NULL;

Please return PTR_ERR(tfile) and fix rproc_handle_trace() to do the right error
check and propagate the error code if needed.

Thanks,
Mathieu

>  	}
> -- 
> 2.17.1
> 
