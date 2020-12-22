Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671D1C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 00:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28E3A229C5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 00:27:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgLVA0w (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 19:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgLVA0v (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 19:26:51 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9D1C061282
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Dec 2020 16:26:11 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id i6so10521274otr.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Dec 2020 16:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JkT2GoAgaDCIg6JP1BBV4nUDnDd5UxbXfE+0ky9BWws=;
        b=mVcxaYyxooCgxbJpCm1rd54CEfXZq0eH3JT8VYFsjVoz8RAaKAR5FrrKRHZ1Beefgf
         NIvfhHmCaF70c67max9e9NFoT3oBGCDFnZ98Cspcp74LMJ7Qq8kHIOQ+6FOXbU+LJCX1
         ug9U7LJmxQoRS1pNV/RRe8XvU+zplfJxoiH80s2+iVQbxJzoQkqdhTaTepjEdXa6C5if
         qsMeqUe4nC0ygvtnwFrnt9w2cXbPL477zOueDblm5vZJcbE2eKLGmfCCUg/wh/RGOspP
         b1EzJnCSNavPb/10WYeERP1UJb36Vg+8iGTgE82cr0QDIwITkjJ9yWvMcwi1Jn8MqpuD
         iC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JkT2GoAgaDCIg6JP1BBV4nUDnDd5UxbXfE+0ky9BWws=;
        b=uoN5RkXHxRuxaSY9yFa2uAkGxGsHEY6I8odTY2+3xGNsoULX1zHQwebAVIJu6+4P6v
         h73seAGGtTDhmqkptq16Kw/IUR9LVduK1HiH4NxZXmoYmPBlhBomVlofBlVK/JAjIa9k
         zlxrMx0LaLUftU1KOFUABY37kzPHRBf1wjSEze2cEBSOFXOuZsRxvX8oDSG1vt84Qnbn
         E2aAbLjcoo0F8DMEZUVrXdXTR9SuwEKjt8gRsnjFVaBm78+VrT5Zwgy8lgxqawMqkYOj
         /sCv+PNO6vwiplyDDo2o8YnmDNug9A7o8j6Nvisr6IBlpYSOG3jxcY9ezk51YOOqMtRr
         8prw==
X-Gm-Message-State: AOAM533Osjd4Puyzfwq56SZPepGFeraAJ/qUvxUGzZfnPm+9b7y1gZNA
        eLZ+C/hO/+0KeaCyKg1OnQaFNQ==
X-Google-Smtp-Source: ABdhPJzQZF8CgUO1+SF5WMwEL99ZiQpdPW5XrIXz4b28AIUk8f48EZoGy4LQ2q1+iKfX44jX3IVIWg==
X-Received: by 2002:a05:6830:110b:: with SMTP id w11mr13916917otq.285.1608596769655;
        Mon, 21 Dec 2020 16:26:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m7sm4066357oou.11.2020.12.21.16.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 16:26:09 -0800 (PST)
Date:   Mon, 21 Dec 2020 18:26:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/8] remoteproc: introduce is_iomem to rproc_mem_entry
Message-ID: <X+E9H1WBtK/xkjUs@builder.lan>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
 <20201221100632.7197-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221100632.7197-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 21 Dec 04:06 CST 2020, Peng Fan (OSS) wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Introduce is_iomem to indicate this piece memory is iomem or not.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V4:
>  New patch
> 
>  include/linux/remoteproc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index f28ee75d1005..a5f6d2d9cde2 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -315,6 +315,7 @@ struct rproc;
>  /**
>   * struct rproc_mem_entry - memory entry descriptor
>   * @va:	virtual address
> + * @is_iomem: io memory
>   * @dma: dma address
>   * @len: length, in bytes
>   * @da: device address
> @@ -329,6 +330,7 @@ struct rproc;
>   */
>  struct rproc_mem_entry {
>  	void *va;
> +	bool is_iomem;
>  	dma_addr_t dma;
>  	size_t len;
>  	u32 da;
> -- 
> 2.28.0
> 
