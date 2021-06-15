Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B7EC48BE5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 17:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32F3A61009
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 17:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhFORuh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Jun 2021 13:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhFORue (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Jun 2021 13:50:34 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091BEC06175F
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Jun 2021 10:48:28 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id e7so8859868plj.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Jun 2021 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1zxWWH5viqfAr6sUMJsjqthPFquxVNQ/+2gZK8GZHEU=;
        b=W1KDjeJo1cBehCZp2FSA8WVvWq4LYFsAmqIeEOVO58/J/QguNi9YAWBPsskjFVIbpx
         0LPXzEcxwXLZ+tgAuxVMYfJXbBeQXUCUZUqWn/U9K9TDHIL/WCN1Ho1sBP7WyqZSgZPo
         WlV48EsL9I0E2wgh0EEHPKDyn/eqvJXS8jAiMfnl+I+2dZjS5MiGV71YSVpY+R0JQTtE
         6VXYyI9ol518Gak+0Q/+2iZ6VlubHQxfIfDdA9ZkJW1Nho8mZxglpB5/FK/XdZCaPdZM
         m81n9n8dF/h4dWf4QILpUcpHShIEB/nIoy0jdLM088PCEh0Y8r3FZlx5PhGgYnwj+rq+
         B+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1zxWWH5viqfAr6sUMJsjqthPFquxVNQ/+2gZK8GZHEU=;
        b=ARFxCTJKJ3RHwFi9Y+7fM0M1QKnQ9HAqsrhs+8NF8zWUONOFUolIPYmwzR9e/uyPAb
         FLHnbKZ8p7FiqeEmCkXAzBe23zJypBckUz1DIQzCnpK4aa/j6ytcmjvpqrY4xglSpptD
         l4Rnk1KGtOzdNKtik9AuDKDhKrhO2A80+W4b/+/1x2NbePrxXLeTey7IJwJ0T2KB4HzY
         SdguRvhrbXWggSP8NOIGFVebNMaN+wIjiWB6LsOLM8vXpxJU21R4wAVjf7NEp4wSePXL
         BeLu9LiLJgeerdGXSt2xslseFQ5DQ05E/X1ikAoHJlBzOScJMzROg272jZp3XtcKnd7m
         KXBw==
X-Gm-Message-State: AOAM533mHPbpRzndtzmEd8S5DjBvupdCTEpm86fki0tnh+bGdkUrN8+P
        1RZ4OWQPGnrMyBZUVg9+M02cAQ==
X-Google-Smtp-Source: ABdhPJyszR7HGXp7Wtg+9mMiJpdT9xu41oqbEma8mNjUvAEcaTvlZie+cr1iuLr904fwvWGPoqFQww==
X-Received: by 2002:a17:90a:5998:: with SMTP id l24mr358719pji.169.1623779307427;
        Tue, 15 Jun 2021 10:48:27 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 11sm16696147pge.57.2021.06.15.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 10:48:26 -0700 (PDT)
Date:   Tue, 15 Jun 2021 11:48:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/4] rpmsg: Add a removable attribute to the rpmsg device
Message-ID: <20210615174824.GC604521@p14s>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604091406.15901-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 04, 2021 at 11:14:06AM +0200, Arnaud Pouliquen wrote:
> Adds a new attribute to the rpmsg device to expose in sysfs the
> the removability of an rpmsg device.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e5daee4f9373..b2543ef4a92f 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -413,6 +413,7 @@ rpmsg_show_attr(src, src, "0x%x\n");
>  rpmsg_show_attr(dst, dst, "0x%x\n");
>  rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
>  rpmsg_string_attr(driver_override, driver_override);
> +rpmsg_show_attr(removable, us_removable ? "true" : "false", "%s\n");
>  
>  static ssize_t modalias_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
> @@ -435,6 +436,7 @@ static struct attribute *rpmsg_dev_attrs[] = {
>  	&dev_attr_src.attr,
>  	&dev_attr_announce.attr,
>  	&dev_attr_driver_override.attr,
> +	&dev_attr_removable.attr,

And this patch shouldn't be needed if we move forward with my recommendation on
patch 3/4.

>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(rpmsg_dev);
> -- 
> 2.17.1
> 
