Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A30C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Nov 2020 16:22:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF18A206C0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Nov 2020 16:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9F3mzNo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390305AbgKXQWY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 24 Nov 2020 11:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390081AbgKXQWY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Nov 2020 11:22:24 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A4AC0617A6
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2020 08:22:23 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id n12so16353318otk.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2020 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yAx0bZUynwPp6ieRFwBxeKJxMhDlw8QUeMjYHWg4GQU=;
        b=s9F3mzNow1EmxBZlldMkYWyr9UjLbpyDCzrSEych7mauy1jw8KniN+3GJUb6ET7ULT
         nZyyf4DwpxVQc5rwbcLYj/Ii5/Km/DPMcTb/njkImGsDDZPpOX1mSM2vpN9YeE/dbLBi
         vnFZ9lP7TKYuKelnmOfxotdTGyjOtE4fPqGuCq8bmlMAi4lrZU/ozSjO5gREOd7AVQJ1
         Tca3033U0LaLHKoOfynk3kmmpymUpBEupJIqNlQiuqG6cYI4atLY+w7h3lF2Y6KkTIjW
         spF53e0p2UBEHHh/Yu9x4anaqC45GChVTdf4zJYbkm7U5OM1libzhMnxOoOnW89Bkuoy
         qkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yAx0bZUynwPp6ieRFwBxeKJxMhDlw8QUeMjYHWg4GQU=;
        b=hZWbIB+2kC+FfynGdAUj/L3Bv8IBd75ugRVxg9+I/gzqOCuavPy36Ldm93mC+SXVy4
         tpFKdkZQDhImEX4+jz0XKPQM4Jm23IUJW/+YvT9M/xVTUEaHRoiE5Sk3F2bAIihmdJdD
         XNAm6LZNW7ZrUvjkhaQ0d9tycyDdgyCBeSf3wK++CGKzC9UjzjJjXaZnXaQr/xF5L/5l
         XTIkllItRVMtEBzKqafRPSiAmuE1tHmy69beBDo8nrZ/7OrNWK+py5JOEey0vstvbI5w
         NfAHBmrglTqHi2cU/KGHJGfJEvBdNtiBxD21QnZSyDGL2xRRlhLsdHPQHA0lAo12L5zt
         PCMw==
X-Gm-Message-State: AOAM533h61FneSMVP5cnJjadSFYGVY7VW6dkVLlleIqCnWJ1BFUBQjc0
        bU4cBrQwIA77qn40rf/zkuk2xWQN31FpEw==
X-Google-Smtp-Source: ABdhPJwFSa8qQqQZZjQ4qPOcjBm6mGcsgXICH2unaCUf/0gU4cAxQgWN3P+36aQCMEblPR5qqpBJ6Q==
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr4113940oto.135.1606234943223;
        Tue, 24 Nov 2020 08:22:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm9795000oob.45.2020.11.24.08.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:22:22 -0800 (PST)
Date:   Tue, 24 Nov 2020 10:22:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, evgreen@chromium.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: map/unmap MBA region
 before/after use
Message-ID: <20201124162220.GN9177@builder.lan>
References: <1604473422-29639-1-git-send-email-sibis@codeaurora.org>
 <1604473422-29639-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604473422-29639-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 04 Nov 01:03 CST 2020, Sibi Sankar wrote:

> The application processor accessing the MBA region after assigning it to
> the remote Q6 would lead to an XPU violation. Fix this by un-mapping the
> MBA region post firmware copy and MBA text log dumps.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I renamed "ptr" to "mba_region" throughout the patch and applied the
pair.

Thanks,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2c866b6da23c..1b4a34325788 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -189,7 +189,6 @@ struct q6v5 {
>  	size_t total_dump_size;
>  
>  	phys_addr_t mba_phys;
> -	void *mba_region;
>  	size_t mba_size;
>  	size_t dp_size;
>  
> @@ -408,7 +407,7 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>  				   current_perm, next, perms);
>  }
>  
> -static void q6v5_debug_policy_load(struct q6v5 *qproc)
> +static void q6v5_debug_policy_load(struct q6v5 *qproc, void *ptr)
>  {
>  	const struct firmware *dp_fw;
>  
> @@ -416,7 +415,7 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc)
>  		return;
>  
>  	if (SZ_1M + dp_fw->size <= qproc->mba_size) {
> -		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
> +		memcpy(ptr + SZ_1M, dp_fw->data, dp_fw->size);
>  		qproc->dp_size = dp_fw->size;
>  	}
>  
> @@ -426,6 +425,7 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc)
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> +	void *ptr;
>  
>  	/* MBA is restricted to a maximum size of 1M */
>  	if (fw->size > qproc->mba_size || fw->size > SZ_1M) {
> @@ -433,8 +433,16 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  		return -EINVAL;
>  	}
>  
> -	memcpy(qproc->mba_region, fw->data, fw->size);
> -	q6v5_debug_policy_load(qproc);
> +	ptr = memremap(qproc->mba_phys, qproc->mba_size, MEMREMAP_WC);
> +	if (!ptr) {
> +		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> +			&qproc->mba_phys, qproc->mba_size);
> +		return -EBUSY;
> +	}
> +
> +	memcpy(ptr, fw->data, fw->size);
> +	q6v5_debug_policy_load(qproc, ptr);
> +	memunmap(ptr);
>  
>  	return 0;
>  }
> @@ -541,6 +549,7 @@ static void q6v5_dump_mba_logs(struct q6v5 *qproc)
>  {
>  	struct rproc *rproc = qproc->rproc;
>  	void *data;
> +	void *ptr;
>  
>  	if (!qproc->has_mba_logs)
>  		return;
> @@ -549,12 +558,16 @@ static void q6v5_dump_mba_logs(struct q6v5 *qproc)
>  				    qproc->mba_size))
>  		return;
>  
> -	data = vmalloc(MBA_LOG_SIZE);
> -	if (!data)
> +	ptr = memremap(qproc->mba_phys, qproc->mba_size, MEMREMAP_WC);
> +	if (!ptr)
>  		return;
>  
> -	memcpy(data, qproc->mba_region, MBA_LOG_SIZE);
> -	dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
> +	data = vmalloc(MBA_LOG_SIZE);
> +	if (data) {
> +		memcpy(data, ptr, MBA_LOG_SIZE);
> +		dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
> +	}
> +	memunmap(ptr);
>  }
>  
>  static int q6v5proc_reset(struct q6v5 *qproc)
> @@ -1605,12 +1618,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  
>  	qproc->mba_phys = r.start;
>  	qproc->mba_size = resource_size(&r);
> -	qproc->mba_region = devm_ioremap_wc(qproc->dev, qproc->mba_phys, qproc->mba_size);
> -	if (!qproc->mba_region) {
> -		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> -			&r.start, qproc->mba_size);
> -		return -EBUSY;
> -	}
>  
>  	if (!child) {
>  		node = of_parse_phandle(qproc->dev->of_node,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
