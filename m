Return-Path: <SRS0=Lo8U=AD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6539BC433E1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 07:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44DC82545C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 07:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bj/SwDTZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731409AbgFVH2N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Jun 2020 03:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731405AbgFVH2M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:28:12 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF5DC061797
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:28:12 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id v1so3157320ooh.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KIe17PDfxINe85+izk43k/Wcish2GCiyfRA3rpsfJKs=;
        b=Bj/SwDTZduu8yXxA83pmovC+mlgDvYrOkMBZzSdgHjLzhaC1uB4ghehjySLQdaDmsR
         isYonN6nMHF7je9Jhj1LqjzonLVwm/jhbxFk9pnGNe4UzHaanjfLHokCMAU1Rieoszyi
         ImmALpchRH8ethhcYYGZxjwAXKSKcsKrHBRWihn5ObXlh3eX/rypwqorqSRVjvVTLzMc
         YY1bjWBM90dfPexk6/J1LXx8G/JHhWqK4av0vv9W6ZRCPZKo6hF6DqqBmqP9rEbX7koM
         LeTSKJKWEMX4PY9jdSfsyDtvFJ/ZEkVFhFSCG4cnUnECFyp3BG2LhWUf68wCvdlxeU22
         vLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KIe17PDfxINe85+izk43k/Wcish2GCiyfRA3rpsfJKs=;
        b=FOjJou0wJ41wMraRg2o63BtFlTrkHxNHgSjsY3J1/CTuWRmz/xLsYPy6h2kzhJna1g
         KUUBr/4DDQBSsnspWtnnIXXeQmRZlnQPQ3/AENNYRCWbSRzsfdAsyG4DI5lf1KFx4zL5
         khjz2a6QuOUZhoAWBMDFbve3yzC6ORYl1+d77aH+z3He5SVta4rYsCe0DEqcu0qW6vlN
         LLy7c+o2mX0EQ0sKGFPwBqaafyYckGqCcXsm7tJ5G+dfMphXkRmLXj01pCiR/IdUcrbz
         lcHmixiebUzoQ1xXoTGIxS6Cy9/u65xYIek7bWop7zNa/YDWbqP50PrSWKUSJ/pGsleO
         1s+w==
X-Gm-Message-State: AOAM530zB0KrIaquwBnMffFyYa4wpFE6WW+4XAY0n6DVpKV914DptSaB
        +BnsnKlofCwk97uiuhqu28Q0XQ==
X-Google-Smtp-Source: ABdhPJxhhBLYdxkoLduy9RcNw7C6U0WH2sW0dk8GxratBDuLPLu3m+5y6ouqT5n2DmEs9G13ClCJ4Q==
X-Received: by 2002:a4a:e496:: with SMTP id s22mr13004323oov.67.1592810891515;
        Mon, 22 Jun 2020 00:28:11 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j46sm3125503ota.69.2020.06.22.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:28:10 -0700 (PDT)
Date:   Mon, 22 Jun 2020 00:25:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 6/9] remoteproc: Refactor function rproc_boot()
Message-ID: <20200622072525.GH149351@builder.lan>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-7-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601175139.22097-7-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:

> Refactor function rproc_boot() to properly deal with scenarios
> where the remoteproc core needs to attach with a remote
> processor that has already been booted by an external entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0be8343dd851..48ddc29814be 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1503,7 +1503,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
>   */
> -static int __maybe_unused rproc_actuate(struct rproc *rproc)
> +static int rproc_actuate(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1923,24 +1923,30 @@ int rproc_boot(struct rproc *rproc)
>  		goto unlock_mutex;
>  	}
>  
> -	/* skip the boot process if rproc is already powered up */
> +	/* skip the boot or attach process if rproc is already powered up */
>  	if (atomic_inc_return(&rproc->power) > 1) {
>  		ret = 0;
>  		goto unlock_mutex;
>  	}
>  
> -	dev_info(dev, "powering up %s\n", rproc->name);
> +	if (rproc->state == RPROC_DETACHED) {
> +		dev_info(dev, "attaching to %s\n", rproc->name);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto downref_rproc;
> -	}
> +		ret = rproc_actuate(rproc);
> +	} else {
> +		dev_info(dev, "powering up %s\n", rproc->name);
>  
> -	ret = rproc_fw_boot(rproc, firmware_p);
> +		/* load firmware */
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto downref_rproc;
> +		}
>  
> -	release_firmware(firmware_p);
> +		ret = rproc_fw_boot(rproc, firmware_p);
> +
> +		release_firmware(firmware_p);
> +	}
>  
>  downref_rproc:
>  	if (ret)
> -- 
> 2.20.1
> 
