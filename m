Return-Path: <SRS0=BBTQ=BH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA08C433E8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 06:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C32E21744
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 06:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7Zq8dcV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgG1GYO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Jul 2020 02:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbgG1GYM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jul 2020 02:24:12 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744C0C0619D2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2020 23:24:12 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t1so194798plq.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2020 23:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6jk3ZlP3GO4B2FHfucgd6e8b6zp8EfqqO4iw2zaC8aY=;
        b=E7Zq8dcVI9cCO63c0WKXzLc/HMGzBBMQUq52RPE9J9PswuT3k5BgjbI73KdpD31lmq
         QHVQm3bkDTi7wjz4c2ixn7sfKgizZv5ZjxSecNvd0ooKzrwAJx+SFFBvav3fY1CrsNMG
         7978tIIw+SkZjrzV3JTFWfNXZucXm1Hx0zMk8pNxZj0MhVcunGfm7CwdSaNBOs8KL+I5
         XMF4dRYRwmpM5b8O/XbvRnULOoqGKf3lvSrq76rrPoKa3dlHg/r3hVeNGK4OJ9RDrUfQ
         3O60zlxuta1CZ2D6OqxdJhN/3iApaB6tp2V44WnPn6Uj8KvNfSSg5CH3vc1UoTDbOdg0
         qmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6jk3ZlP3GO4B2FHfucgd6e8b6zp8EfqqO4iw2zaC8aY=;
        b=m+AfTi+GimEY0bFnLAFsR8SavQd7FPGbL4m1OLaJXC9g/mKJRz8gSJZ8rLnX74M703
         S0KHnFSjR/iAjtLSAPTt3+us7lKiw1Wb0yR5EYwrR58/O7V4X4xApxSMbcXm4K4BfqsG
         qh5YbvnFI/3NcXmetwo6b32VkzF1GXkh5n4xwaV/cdrKiMQ79P6YeuTkxayY4UULhlRC
         ZFtTEk75Fk4veIOKQGr93qh6Ois2TG4BHFqNIFJ1hLf8xyS/YfZzBrpIKi94UZU4IB/h
         jEsXe1sp3gEvwnk7T6DtWJitn9H2KRUO6n9NvGAiNLwcBCLWe0ewco6pYTAdKAFLeLUl
         Mseg==
X-Gm-Message-State: AOAM531PGSAHdUONdVcZQMLO4V9+m1GrQRXn6H+bNKnHysrRjYhLsFlC
        9VeSAUc6RpA+mB3K2nje7bCnBA==
X-Google-Smtp-Source: ABdhPJx3231jHZOV0ihZEpsu2dDemlr0kFztloycZnpHADJrAq+YuPNI/M7mopVjehZWHUdhlVuxFQ==
X-Received: by 2002:a17:90a:2a09:: with SMTP id i9mr2924299pjd.50.1595917451911;
        Mon, 27 Jul 2020 23:24:11 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j19sm1617388pjy.40.2020.07.27.23.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 23:24:11 -0700 (PDT)
Date:   Mon, 27 Jul 2020 23:20:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, rohitkr@codeaurora.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Remove redundant running
 state
Message-ID: <20200728062039.GE349841@builder.lan>
References: <20200602163257.26978-1-sibis@codeaurora.org>
 <20200602163257.26978-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602163257.26978-2-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 02 Jun 09:32 PDT 2020, Sibi Sankar wrote:

> Remove the redundant running state, as an equivalent is maintained in
> the common q6v5 resource handling helpers.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index feb70283b6a21..702352cd66188 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -178,8 +178,6 @@ struct q6v5 {
>  	int active_reg_count;
>  	int proxy_reg_count;
>  
> -	bool running;
> -
>  	bool dump_mba_loaded;
>  	unsigned long dump_segment_mask;
>  	unsigned long dump_complete_mask;
> @@ -1275,7 +1273,6 @@ static int q6v5_start(struct rproc *rproc)
>  
>  	/* Reset Dump Segment Mask */
>  	qproc->dump_segment_mask = 0;
> -	qproc->running = true;
>  
>  	return 0;
>  
> @@ -1290,8 +1287,6 @@ static int q6v5_stop(struct rproc *rproc)
>  	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>  	int ret;
>  
> -	qproc->running = false;
> -
>  	ret = qcom_q6v5_request_stop(&qproc->q6v5);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(qproc->dev, "timed out on wait\n");
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
