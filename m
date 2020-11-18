Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C4BC63798
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 16:50:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66AAC2483B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 16:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6gdbcbo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgKRQuL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgKRQuK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 11:50:10 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC38C0613D4
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 08:50:10 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id i13so581140oou.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=URQNgyNxIHm+Nf/Hqg7Nkrw+oIop3mCsDqykmWHiPgE=;
        b=P6gdbcboxT0pSx5moV/y7QRhQdx2rrNm5RZwDp6W140s0AVfhrvYve+BBzSe3CgJ00
         AS/J+She41UTSheICK4rQ1vpVNpfc8Oq5daP284Q3qcv6xunrJEEq9xnGaN/ZluzIahD
         70Sch3yBFzePEXofd97lJj36zkjq9uKFLFOEsXg5XIKQ1ViPZFpiz3P7qCPweZhF9RG/
         eCl7OPp6j7+PW/lu4zzXkkTnosF92Sw5YWfjYRsdNsBS5nBwP1RtunNW5ZZiNrs9osjq
         u/tPDZGzQm5Hv4bGZmv/20LiBCoYzmHcBwZ9eIf8983qPjdiVRhAWpR7Ur6zbd9ZvySd
         ysoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=URQNgyNxIHm+Nf/Hqg7Nkrw+oIop3mCsDqykmWHiPgE=;
        b=Mf8YQEPcN3VkR32gq3BR2b2KL92vebtwlKRcuPpiN1PakDHjIQ7OiE55n+vAUiIv4h
         L1EUcdBCKfXCySYx5PW5vestC4+2Ayhj2QVLbaZdc6sUnvDN/PhnbhfS6WeHb06uVayk
         gXa1dX/F4ZY/PW9YkqyKoBdg285f3dhcsygNyIkkDllPGtJFab01qkq9ONrYi920PDAO
         H/85RvCXie88g0l4Nt5tBPkJ9Q8/zCrh1aMsplQoOvvSnZ4oNBMgBP8MzEox1GFRblTI
         wgO55KrWlTH+I/GDJskZbFdYvmgkJNnE2c9P6xDmwYwAy3Z5qOHSUhxfG2AsV5RVXUuV
         EZiQ==
X-Gm-Message-State: AOAM532kUlExYAly6ugxe6zhr7eK3xt39c8zZBc0BbDvcj4J+k/YVj/e
        CEJi1JKZDbelHMSY+oAvzXb20Q==
X-Google-Smtp-Source: ABdhPJxki4cZFgEf6A0WK9Hze8CJ+1QEdKRx5vi7OqXv2q274o6Dpqb031Rjo/CXDFV0u/MWI8xRMQ==
X-Received: by 2002:a4a:d81a:: with SMTP id f26mr7135860oov.59.1605718209627;
        Wed, 18 Nov 2020 08:50:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w21sm6374700ooj.32.2020.11.18.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 08:50:08 -0800 (PST)
Date:   Wed, 18 Nov 2020 10:50:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 4/4] remoteproc: qcom: Add minidump id for sm8150 modem
Message-ID: <20201118165007.GD9177@builder.lan>
References: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
 <1604395160-12443-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604395160-12443-5-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 03 Nov 03:19 CST 2020, Siddharth Gupta wrote:

> Add minidump id for modem in sm8150 chipset so that the regions to be
> included in the coredump generated upon a crash is based on the minidump
> tables in SMEM instead of those in the ELF header.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 349f725..23f4532 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -707,6 +707,7 @@ static const struct adsp_data mpss_resource_init = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
> +	.minidump_id = 3,
>  	.has_aggre2_clk = false,
>  	.auto_boot = false,
>  	.active_pd_names = (char*[]){
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
