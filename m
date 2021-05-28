Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE29C4707F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE680613DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbhE1Dwf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 May 2021 23:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhE1Dwd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 May 2021 23:52:33 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16553C06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:50:59 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so2310807otg.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=asRlje0goAhFcEJxLUA9BBxp84jlRep9Pz0YvxsytNw=;
        b=nfADAGzbgpY5NA6+jelsBMfutNd8ztua/oK7zSpFSidti7UyaUmCZFpCdpdqXgWCOP
         16YUZThLFJXDGxmY0e6aLtilolZ10AVYNb8xXgrHlsDJ9LCsEAGFGVP7dgh6z/PTAIaR
         G+tiLxz4Ba4ChEAbTbgQEQvarmbckCnZD9RF+0blclzFEhy+Q/4rEMpR25feVE+DvXyF
         MFCoZvcBmhfy3gx7dLfeUj2RrMhLP4+iUXMLlzySRSG3ZHsDIUsafqvstmoiIlloHRx1
         C9hX7NMiyqt55ra0fW6SxKL2tXUeiozrLeRUDKNAlrBNhSF107doS8x6CH5TsMVWyQy4
         Zl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=asRlje0goAhFcEJxLUA9BBxp84jlRep9Pz0YvxsytNw=;
        b=jxfuHRRuTB0yh0eB9Ff1AvlgqJuKAva5UhLNc+yWsMHgqYs6p4fmNBFSpo7xhOf++l
         PKLf6SEsATM7njiTPy1FsGWKRksf5LZP6xTIcEXBPHyQprSALMLd/vWkLS1Rsl4Dvyan
         amHjpCRpxcgnMFq4sf525HqTZUIJWTze+JWJG1rRt+GKqM9YoD/Op07JhudnHT2E4orn
         I9V/Z0/O8j2l25cik0LtosBS28ybe8Xfz3dDnRLldBAUc1tPTG2MMtAOLA60G8/Q913R
         I4//OjId7fBmFgJCI1/+wQAZww2dyxlQlzKaW4uMds9b4Jw/Ne2yER/5kKKBD3NvjFuJ
         A7MQ==
X-Gm-Message-State: AOAM530fOtAF4XkSkkaYeRgc+HbOkj9Zv8i4uv41DQDi+p2gS34EUwP3
        YGvw4oeMPKrJGibSLyr86DVb/w==
X-Google-Smtp-Source: ABdhPJxwBt+4tqhG35N+FAveVQMOtsF/8nAal7iWx1N0eQlYBcRpavgW1FadCaaLPuNq6iagLqNhNQ==
X-Received: by 2002:a05:6830:2143:: with SMTP id r3mr5545599otd.165.1622173857906;
        Thu, 27 May 2021 20:50:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b19sm881138oib.46.2021.05.27.20.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:50:57 -0700 (PDT)
Date:   Thu, 27 May 2021 22:50:55 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: core: Cleanup device in case of failure
Message-ID: <YLBon0bBnzrizpDi@builder.lan>
References: <1621284349-22752-1-git-send-email-sidgup@codeaurora.org>
 <1621284349-22752-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621284349-22752-4-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 17 May 15:45 CDT 2021, Siddharth Gupta wrote:

> When a failure occurs in rproc_add() it returns an error, but does
> not cleanup after itself. This change adds the failure path in such
> cases.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 45d09bf..6f5fa81 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2326,8 +2326,10 @@ int rproc_add(struct rproc *rproc)
>  		return ret;
>  
>  	ret = device_add(dev);
> -	if (ret < 0)
> -		return ret;
> +	if (ret < 0) {
> +		put_device(dev);
> +		goto rproc_remove_cdev;
> +	}
>  
>  	dev_info(dev, "%s is available\n", rproc->name);
>  
> @@ -2338,7 +2340,7 @@ int rproc_add(struct rproc *rproc)
>  	if (rproc->auto_boot) {
>  		ret = rproc_trigger_auto_boot(rproc);
>  		if (ret < 0)
> -			return ret;
> +			goto rproc_remove_dev;
>  	}
>  
>  	/* expose to rproc_get_by_phandle users */
> @@ -2347,6 +2349,13 @@ int rproc_add(struct rproc *rproc)
>  	mutex_unlock(&rproc_list_mutex);
>  
>  	return 0;
> +
> +rproc_remove_dev:
> +	rproc_delete_debug_dir(rproc);
> +	device_del(dev);
> +rproc_remove_cdev:
> +	rproc_char_device_remove(rproc);

I'm confused, shouldn't this function just do cdev_del()?
__unregister_chrdev() seems to do more than unroll what cdev_add()
did...

Apart from this, I think the patch looks good. Really nice to see you
tidy this up!

Regards,
Bjorn

> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_add);
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
