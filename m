Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65790C56202
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 03:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29749223B0
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 03:40:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PrVavSIA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgKUDjn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 22:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgKUDjn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 22:39:43 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF05C061A48
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 19:39:41 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id 92so7673635otd.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 19:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yt1RKeBAyO/ZvyBjIZKUNXc1EPd/mhgYIE1hAiiHLA4=;
        b=PrVavSIAKHzqHIrSaafaiiSEVMcgTha2+wFop+AYntc+ri24hKAib3maBrgyHOigIh
         MnrrGEdpHF7Z8BhBbu6KDVpXkNk0amQzb/LbAWP+J/c2faJjugvReaYUYm1J+elGZKEV
         AuPkz5bb6mP4B4JcoCORSwh7Y8AzczCaKRPGlWBNS4sSgZnFe1i0PYlauoSKpVGpkMTL
         vquIr0rNONKvJX3h80pzWrO0LeIAFRC99wsWZlGbbLTywTiC+y6H/RDrHpIfjglcturM
         AWC15T0g1LxsCcWBXGK23O/N80UkQTU1WniOJFBNvLpHAKaPDhV8UQfWed2sy3VduwHs
         DHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yt1RKeBAyO/ZvyBjIZKUNXc1EPd/mhgYIE1hAiiHLA4=;
        b=TDHs8PtvaGTJWzZdp4mm0939nIZToPDV8YjlT6duZxogh8a5voEe5GRkkn5YgN3jm3
         15NrGvOHcmNOfXvoXe+gHgXnYvV6uIg6oTC+4lVcUdPs+ZhTWKFnh4OfV61kP4gxlwxk
         uqHMA1rHsNQFL8Wt+dh2/XVQToJrZZY1qPE80KVweYuAMQbIWqFxKEtrO1Gb/YYhf6Dl
         6zoTc86o9ypQV6ojbpRMNLygdR16RIrVne+YxIVEy3BCbuoKLnyeBXf0xW0v71JjCuGY
         ReU/MQA+i4QKtrNuXzU6sjKDVEJaSE4qJ3aMt1XUl4LvEcqNaIC9khD27TdXey9wpbYe
         fA1g==
X-Gm-Message-State: AOAM530bmf5zQNFgeY2T/DvyQuFbWWUgimNRiaRC4H10ZmsqESOMcIKR
        aacCP24fPLesbrx+E8piZNHQXg==
X-Google-Smtp-Source: ABdhPJzxbDle5d1+EsCC/raEZWSn9K83g5/BDo0MkIhkGm4FiPS6Nb7OUDiHpyUlTov9CDBZCJyi0Q==
X-Received: by 2002:a9d:27c9:: with SMTP id c67mr15608307otb.301.1605929981238;
        Fri, 20 Nov 2020 19:39:41 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w14sm2688442oou.16.2020.11.20.19.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 19:39:40 -0800 (PST)
Date:   Fri, 20 Nov 2020 21:39:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: wkup_m3: Set deny_sysfs_ops flag
Message-ID: <20201121033938.GH9177@builder.lan>
References: <20201121030156.22857-1-s-anna@ti.com>
 <20201121030156.22857-4-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201121030156.22857-4-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 20 Nov 21:01 CST 2020, Suman Anna wrote:

> The Wakeup M3 remote processor is controlled by the wkup_m3_ipc
> client driver, so set the newly introduced 'deny_sysfs_ops' flag
> to not allow any overriding of the remoteproc firmware or state
> from userspace.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: rebased version, no code changes, patch title adjusted slightly
> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20180915003725.17549-6-s-anna@ti.com/
> 
>  drivers/remoteproc/wkup_m3_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index b9349d684258..d92d7f32ba8d 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -160,6 +160,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
>  	}
>  
>  	rproc->auto_boot = false;
> +	rproc->deny_sysfs_ops = true;
>  
>  	wkupm3 = rproc->priv;
>  	wkupm3->rproc = rproc;
> -- 
> 2.28.0
> 
