Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DAFC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 17:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0CA7611BD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 17:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235902AbhI0RKD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 13:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235412AbhI0RIi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 13:08:38 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F74FC06176D
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 10:05:08 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id s11so18355753pgr.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 10:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cQyqtr+L+VXU+jp3z8c/s+IojY3vui6TA42W1Hb48DM=;
        b=vv/iQ9yBgKL6nJ3mRDybqrPBvIRybfNL0ZgBsP7UudN27zhewYTQ5I4FSL/1TRG1xN
         dXVMeYLLM+ryTcaGix5Kw9VIxi60ENhhLCswv9HaMuuDedmgKu9GfQI+nCJGA6g5IFpa
         O6E55IBK0A+b6o/3hx78DENhOuGE7NKbE2zCVo/BlXgx0yqktSkIgGyf7LlW7TsDgWvv
         jQMenFDIsRsXr79/iFq3pH2iQEunv+hK4lpVvcHQhHtRstMFsZg0NB3zshWI4qcZQBk+
         JMxd8pmsbKfqLYQf8XY3m5N5zPymMrDrMesiw0TalivnK2HpBw6Umtk0fMpanUzHjPxn
         aHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cQyqtr+L+VXU+jp3z8c/s+IojY3vui6TA42W1Hb48DM=;
        b=MO2rlu/H8CIwmCq49ARrLepYpWNCBZbvaP8N3H282jJAtH1YMtoZlFFikk9xKlNblF
         hdkZgDw3aU1lHns6vJKrHu/52goAWWP3/tfiyFNoAOC1oajDcMhvsww/AIf10BZ6AoRV
         tVyZxVqOdQwm5Jj4U3s532vQhUgY+isuB5mTBXS7l5NfIpJ7qZUsDH6yTiPLe4tPyqJW
         eKhlUJaGMMHakPkKieDSa8VuraszNNvJieadqxeT4GlnBVLBm7fvdP/07fkJLOk+Q1dn
         OWCG67lTg4rFkjXJe/X4IYF60wq3rxanpS0dJihWTKtDDsWfiSca+3X/Sw11VOfKJIjp
         IwvA==
X-Gm-Message-State: AOAM533Z5nST3U4f+uFMJb3Hw3xZk8/4gXsL147YljknVoDuly3VLAxI
        HXkshXRjeXW5JxDtfL+/FGA3pw==
X-Google-Smtp-Source: ABdhPJxNJaRILZu6Oyl6tl/p/ynig5QHQ07oMUSxC74y48fSfYjhGixdkQPdstFvf2a+xg+1/WpiUg==
X-Received: by 2002:a05:6a00:2d0:b0:446:d18c:9aac with SMTP id b16-20020a056a0002d000b00446d18c9aacmr1098291pft.16.1632762308084;
        Mon, 27 Sep 2021 10:05:08 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g24sm17803770pfk.52.2021.09.27.10.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 10:05:07 -0700 (PDT)
Date:   Mon, 27 Sep 2021 11:05:05 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] rpmsg: change naming of mediatek rpmsg property
Message-ID: <20210927170505.GB2837840@p14s>
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
 <20210924033935.2127-6-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924033935.2127-6-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Tinghan,

On Fri, Sep 24, 2021 at 11:39:34AM +0800, Tinghan Shen wrote:
> Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 96a17ec29140..5b4404b8be4c 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -183,7 +183,7 @@ mtk_rpmsg_match_device_subnode(struct device_node *node, const char *channel)
>  	int ret;
>  
>  	for_each_available_child_of_node(node, child) {
> -		ret = of_property_read_string(child, "mtk,rpmsg-name", &name);
> +		ret = of_property_read_string(child, "mediatek,rpmsg-name", &name);

I have applied patches 1 to 5.  I assume Matthias will pick up patch 6.

Thanks,
Mathieu

>  		if (ret)
>  			continue;
>  
> -- 
> 2.18.0
> 
