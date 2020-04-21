Return-Path: <SRS0=5S9b=6F=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224A2C38A30
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 01:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F27B72078C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 01:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RW1INQul"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgDUB5U (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 21:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725958AbgDUB5U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 21:57:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC09C061A0F
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 18:57:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id kb16so712049pjb.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 18:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jQ/Ly+wqz2XWXnpqb77hjmYSKdF9aJw60leWg2kb02E=;
        b=RW1INQulNwi0YSFUYKiIRsCpeHgYvd/bWAmviPE6juIvoqZkMuNL6/VnQOeszW1oM7
         nYNkZUUqVqP7/XIlB37k45PouF7Z2m7xBO1LyFFdNDkXZTif9AmfQO0wzdP8IXPfuIgr
         OO0GML6C/hnfSWfXAj53JxzQkftu+S5lYBp9OjKdTNomFJc4FHqXm6Oec5FwRNpN6XqU
         EdIXLtyOMLQYCt+9+erTZmFdHB0PKH5KNQ1UkduFSZ4GQrvYv7/trbG6U6ztDDpv5gRm
         icvqr/W8YOVDATqAlElSDdDAhOcmnb7N12fWFO0Rpb1jsh1rlqBWZqPIFIiUMd/xA/HP
         bW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jQ/Ly+wqz2XWXnpqb77hjmYSKdF9aJw60leWg2kb02E=;
        b=aJ33xOk22osiHe46Hi/z07epoce3hTaneIJF8SCghEcPgCGfUU/aHNMRKG/C9bha8P
         oa096R/GK+BE5r5XVzOO2gGzeqSUuUqecPbImHwh5zvid/n1u1TMw6KKisI5amjyaNIW
         RxPuy+ZDe7vnwm7zPZ9nntlmflk5brxw5P2qjXxisBcL08yIPN9YRQ16mZqC6GGZj46e
         zpXarJoTDVzDdEDzeasVOIC72GFhyTED4edO4mkYnKnBrnMm25H5+GCRY/0bMrhVPO5x
         7BmkPCyTH1W+jZF0hZd5Tr2a/l7JcVPtJS+ak4/laervz2tZ8xsFHYa+bM9DF5TR3v0N
         ecJQ==
X-Gm-Message-State: AGi0PuYe0EihrFh+oFmA6vZAjdg8eZqLynwuN8SESrU+Hr0MZutD5QKY
        rGb4ajkR1yH+ePoD2V9hDamGIg==
X-Google-Smtp-Source: APiQypL9IdMP4zHbcMG9i0xOHUfQ9w377ci8e7OqKpnXsxzlSwtWxNyaES4bUVwkzG35Xl9vXjeYoA==
X-Received: by 2002:a17:90a:2bc9:: with SMTP id n9mr2738894pje.131.1587434239831;
        Mon, 20 Apr 2020 18:57:19 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d8sm811533pfd.159.2020.04.20.18.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 18:57:19 -0700 (PDT)
Date:   Mon, 20 Apr 2020 18:57:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, elder@linaro.org, s-anna@ti.com,
        Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] remoteproc: Split rproc_ops allocation from
 rproc_alloc()
Message-ID: <20200421015743.GI1868936@builder.lan>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
 <20200420231601.16781-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420231601.16781-4-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200421015743.4mqR_OGHpiPmMAYeISkG5VqD2Z_tTNvGlRPR3BTBek8@z>

On Mon 20 Apr 16:16 PDT 2020, Mathieu Poirier wrote:

> Make the rproc_ops allocation a function on its own in an effort
> to clean up function rproc_alloc().
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Alex Elder <elder@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 33 ++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 45529d40342f..15318507aedb 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2028,6 +2028,26 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> +{
> +	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> +	if (!rproc->ops)
> +		return -ENOMEM;
> +
> +	if (rproc->ops->load)
> +		return 0;
> +
> +	/* Default to ELF loader if no load function is specified */
> +	rproc->ops->load = rproc_elf_load_segments;
> +	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> +	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> +	if (!rproc->ops->sanity_check)
> +		rproc->ops->sanity_check = rproc_elf32_sanity_check;
> +	rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> +
> +	return 0;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2067,8 +2087,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (rproc_alloc_firmware(rproc, name, firmware))
>  		goto free_rproc;
>  
> -	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> -	if (!rproc->ops)
> +	if (rproc_alloc_ops(rproc, ops))
>  		goto free_firmware;
>  
>  	rproc->name = name;
> @@ -2096,16 +2115,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  
>  	atomic_set(&rproc->power, 0);
>  
> -	/* Default to ELF loader if no load function is specified */
> -	if (!rproc->ops->load) {
> -		rproc->ops->load = rproc_elf_load_segments;
> -		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> -		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> -		if (!rproc->ops->sanity_check)
> -			rproc->ops->sanity_check = rproc_elf32_sanity_check;
> -		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> -	}
> -
>  	mutex_init(&rproc->lock);
>  
>  	INIT_LIST_HEAD(&rproc->carveouts);
> -- 
> 2.20.1
> 
