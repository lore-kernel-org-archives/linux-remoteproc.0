Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57396C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Dec 2021 20:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349255AbhLFUPE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Dec 2021 15:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349378AbhLFUPC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Dec 2021 15:15:02 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C905C061359
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Dec 2021 12:11:33 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso15166282otj.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Dec 2021 12:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ypDUIho7eWHCZJ7Rm8us7oavNNmEtNxG3tY05fvu+RY=;
        b=XyUZEWbAbyTD3x8dQ0p4NuyJAKpyRvj+HcEOYnANI8nHWL+EDMYBkNOYd8KkvNo7rr
         H7aODQqhN0WeBX86PxnV6HGVSJQ8tugnbzyQYFmtDECQgYqjhF3Oxoh25iq+Jt2LBjJd
         S1c1GUR6Z/a+4ww8MN0HudJG+cJfdlrC/yydAMmDrxz057uJxYXNVHnigGxiMOqih+ql
         YWgsgm9xIDs/jeZ/snxT8AOdXJXIjk5cvgaTfpBX92Pt8p74dNz1WkiSgKKJIy6JYm/a
         0Qv8Kjx3FlVasKJ2TpLwvfHxWo7Vu16ubsK9o+AsZzuCcUtriZbw79MyZ8Ovhzbk/qjr
         ZILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ypDUIho7eWHCZJ7Rm8us7oavNNmEtNxG3tY05fvu+RY=;
        b=nOp2ItfYug3kMP0B51OpYM0PdM3M44PWRaFfEMRaCgBcZnNgbsnfyinkmtRCjbNEbt
         g8lXQsAzT6AlXW0/8cKHhd3pLtlH+CuVYkRBML7bP29eyQy7HXMVq8GJRvsu598eTKOu
         yZ44O3Tx0vPIEFt3EjfwiIdNpFBT6nZzSUNaJyfLvzCs0Uv1xgGuGfUJCfwysAzRSGAi
         l12FzcBOUwLVvtyJYgzNXiz8Q3VBYbV4ppjtHJopU60JhJR5F62YpClgX7XTNhCteN6j
         6kDUGd8QuX4IwKynXMsOtixLGFvSmXBEue0dsk912kO8EN9F/cf1TlS4Y9akRINkFfwN
         8YqQ==
X-Gm-Message-State: AOAM531gZ4yvKozs/qbpZiKqu7F1u79m+N08pdsJq5LoFBH/qFkuS0q5
        GkWaltdZs4AkyrC99Wv0tCgSow==
X-Google-Smtp-Source: ABdhPJxquBRAhZlmEi8XL4TUa6etjEftnBL+pcRWhwWyPPZUItxs0BtS0PUQYihYDzhMNEPZEIkxBw==
X-Received: by 2002:a9d:7f91:: with SMTP id t17mr30910146otp.197.1638821492818;
        Mon, 06 Dec 2021 12:11:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q2sm2478175otg.64.2021.12.06.12.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 12:11:32 -0800 (PST)
Date:   Mon, 6 Dec 2021 14:11:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] remoteproc: Fix remaining wrong return formatting in
 documentation
Message-ID: <Ya5ucVAGf/qFpVbx@builder.lan>
References: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 06 Dec 13:18 CST 2021, Arnaud Pouliquen wrote:

> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> ---
>  drivers/remoteproc/mtk_scp_ipi.c   | 4 ++--
>  drivers/remoteproc/st_slim_rproc.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index 6dc955ecab80..00f041ebcde6 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -23,7 +23,7 @@
>   *
>   * Register an ipi function to receive ipi interrupt from SCP.
>   *
> - * Returns 0 if ipi registers successfully, -error on error.
> + * Return: 0 if ipi registers successfully, -error on error.
>   */
>  int scp_ipi_register(struct mtk_scp *scp,
>  		     u32 id,
> @@ -150,7 +150,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
>   * When the processing completes, IPI handler registered
>   * by scp_ipi_register will be called in interrupt context.
>   *
> - * Returns 0 if sending data successfully, -error on error.
> + * Return: 0 if sending data successfully, -error on error.
>   **/
>  int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  		 unsigned int wait)
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 22096adc1ad3..4ed9467897e5 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -216,7 +216,7 @@ static const struct rproc_ops slim_rproc_ops = {
>   * obtains and enables any clocks required by the SLIM core and also
>   * ioremaps the various IO.
>   *
> - * Returns st_slim_rproc pointer or PTR_ERR() on error.
> + * Return: st_slim_rproc pointer or PTR_ERR() on error.
>   */
>  
>  struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
> -- 
> 2.17.1
> 
