Return-Path: <SRS0=Av4F=BB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65530C433E2
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 03:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4013920792
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 03:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TI6grtPK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731979AbgGVD4X (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Jul 2020 23:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731857AbgGVD4W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jul 2020 23:56:22 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B77C0619DB
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2020 20:56:22 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 207so486597pfu.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2020 20:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eocmnDIsQLfevW1nQrEzuqjG8rUX3ygxa1czr+P2gmM=;
        b=TI6grtPKFFAbd5jxTwUjjnzEFinPbwpMNEo11SKc2mYL6DD7emvsK1cLuMTc8516xv
         Ne1q/n2DwtDGb9PQrePzYtMrzeldMxy7T8Mnq2o2s7/YUhEKn5FNwNo8Q7/p6wzyFyy1
         eCDzDFcZe1tGeMY9FQT9Yu/PwG2w0p+KtUYQyOjGiKmeoE13kgZnLpnARa8wefs9qC4j
         LbGN8tQN/0wwo+NrlxEzflKqwwO+oklwCQ6tXBB3vvCIfpjG1Qi0jPkQxppiyOLy/sXy
         BFUN5FuUFf7P3DcLvPNxa7GyfC8a1WCC1iOda2F32hdJ3nOrI/S12pcYWhuBHPhWJtSF
         NTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eocmnDIsQLfevW1nQrEzuqjG8rUX3ygxa1czr+P2gmM=;
        b=NS1BsrOwuwD2jacKUW1aja6sYZBgE4ui4oS/8b29ch2VNqWnLS7DSqvypYaYpGqNx6
         IwIpKxsb97czmCJ46G0GQYH/sRfRaDK8h7pmklHR/c5xkoPWQRFq4Nd0VxcXCZYWCIw7
         yJtBq1edQ9T+W8s4wdL+rdM6J9HiFw+gh64v29GfE/djS83aH3Gl20T5yM1pygrTET+A
         2Hap7r7VWfS/elwpVOYx9d8iHTOonGbISsfZhrc972yrE/kBR36mdgc0B7NqSeyI6Nb7
         +5t5pH2NwkI6uheVLRwVEBdRxJspw7EFxPAH1pENoHqWTKMvwljvMtcO9JLSYkbFG06Z
         FMPg==
X-Gm-Message-State: AOAM5329vLGbyQJTIrdBhZ1kIdU43+jQ+mPDQgfEximbQclNo0Q6OwEU
        VFA891Lf5vY3j11PdtskqV1f7g==
X-Google-Smtp-Source: ABdhPJwejzId9c6+xg8NWwUEGs51S8vMOaY1Z1gQDLh5jElHYxI3WwTJQ6RdiKmoi6Cph1s04ez8sg==
X-Received: by 2002:a05:6a00:5c:: with SMTP id i28mr27768787pfk.274.1595390181536;
        Tue, 21 Jul 2020 20:56:21 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r6sm19592723pgn.65.2020.07.21.20.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 20:56:20 -0700 (PDT)
Date:   Tue, 21 Jul 2020 20:54:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: Add modem debug policy
 support
Message-ID: <20200722035427.GQ388985@builder.lan>
References: <20200721112935.25716-1-sibis@codeaurora.org>
 <20200721112935.25716-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721112935.25716-2-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 21 Jul 04:29 PDT 2020, Sibi Sankar wrote:

> Add modem debug policy support which will enable coredumps and live
> debug support when the msadp firmware is present on secure devices.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v2:
>  * Use request_firmware_direct [Bjorn]
>  * Use Bjorn's template to show if debug policy is present
>  * Add size check to prevent memcpy out of bounds [Bjorn]
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0b6f260eb5349..49cd16e050533 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -189,6 +189,7 @@ struct q6v5 {
>  	phys_addr_t mba_phys;
>  	void *mba_region;
>  	size_t mba_size;
> +	size_t dp_size;
>  
>  	phys_addr_t mpss_phys;
>  	phys_addr_t mpss_reloc;
> @@ -408,6 +409,14 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> +	const struct firmware *dp_fw;
> +
> +	if (!request_firmware_direct(&dp_fw, "msadp", qproc->dev) && fw->size <= SZ_1M &&
> +	    (SZ_1M + dp_fw->size) <= qproc->mba_size) {
> +		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
> +		qproc->dp_size = dp_fw->size;
> +		release_firmware(dp_fw);

If request_firmware_direct() succeeds, but return a firmware blob bigger
than mba_size - SZ_1M you won't get here and will end up leaking dp_fw.

Additionally, there really isn't a need for requesting the firmware in
the first place if fw->size > SZ_1M.

So I think it's better if you break this out in it's own function where
you don't need to squeeze everything into one or two conditionals.

Regards,
Bjorn

> +	}
>  
>  	memcpy(qproc->mba_region, fw->data, fw->size);
>  
> @@ -896,6 +905,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	}
>  
>  	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
> +	if (qproc->dp_size) {
> +		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> +		writel(qproc->dp_size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +	}
>  
>  	ret = q6v5proc_reset(qproc);
>  	if (ret)
> @@ -1257,7 +1270,8 @@ static int q6v5_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(qproc->dev, "MBA booted, loading mpss\n");
> +	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
> +		 qproc->dp_size ? "" : "out");
>  
>  	ret = q6v5_mpss_load(qproc);
>  	if (ret)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
