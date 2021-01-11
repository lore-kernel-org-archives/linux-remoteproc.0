Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6163FC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 18:54:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AE1E225AC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 18:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730372AbhAKSyV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 13:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbhAKSyV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 13:54:21 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5B6C061795
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 10:53:41 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id x126so479562pfc.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 10:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jSERQ+46dpd0R1Tdu0kDaiLVRoNkNJzqJu2xIoZLDwc=;
        b=HQU12V6IQwHtU+MAo57BdWUwiuR2P3Qx5SBmBR3VmTsefNj4XuV/6tdcIuOxlzV4S4
         G3w9GECjcEIej/Fb3h6YQN67qMoTermjimXuPqMVJ0XJfVXK3uvxC75FQ8fE2n8uNzwP
         y9vPYamS5tuwrRYF89xpvF6ocoscB4gTFjQ5PCtBuL5AJRROdzernNepyHp4agcAE+9w
         kF4ZRZCIiSfhseiJlNQCTA1OQMwymbmkYfuWJV3z19tsfUXzuOousnP4CPpsNBoz8+2b
         Za5uvLhhXM/5StEAyCzaN8GY21Y+06Oj6CzY1wR7SXZ6SD3y2cqZhv42ovEsGz1h/mt3
         sb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jSERQ+46dpd0R1Tdu0kDaiLVRoNkNJzqJu2xIoZLDwc=;
        b=C4uK866adjlApK8FE0593L2/VjhuY5eXFMX9cfo0VL1HMNvHAmzU+UqnGThIHMamrS
         HrO9kN++tWrMbSU2M6HSb8cHfAf0jQYMdYqfwHsyOQfaKVx4STVLDNNDPyhNJs0+gJ9u
         Cacw+X8qdCDoiWoW0rhJGckXFasUR2Ca2UQFCDZ2jYTnauzmeUi0Ce8T/Ay0sPN4Q45f
         /irFYvMUQDCOF/gmwQaEGW5s1CogFQOxfAQSKmBEqRwQ/7idvAurPwVwAMGlM7Fn0BqO
         lm6+UEOChqOmhDehSHMJq7XbDI/FhHpgWCujOIN5O5VGHbKbvt8DiC7myAe68+lR5FV7
         f3Lw==
X-Gm-Message-State: AOAM532meKQjj/gOzeFoS909l5EQniX0LztNpatram3lsZcwYn9IC9ou
        oCWrzWsbJ8+GTMm1Z4UT5ttaWg==
X-Google-Smtp-Source: ABdhPJyJxqnV8GtIbQSTPtRVjQC4HTgiloJsRJrImG/IokTvyHb/RJ0KxJoVO/40sN1d4VXLj4opTA==
X-Received: by 2002:a62:384b:0:b029:19d:a5c6:d76 with SMTP id f72-20020a62384b0000b029019da5c60d76mr804697pfa.16.1610391220801;
        Mon, 11 Jan 2021 10:53:40 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n195sm339537pfd.169.2021.01.11.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 10:53:40 -0800 (PST)
Date:   Mon, 11 Jan 2021 11:53:38 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com
Subject: Re: [PATCH V5 1/8] remoteproc: introduce is_iomem to rproc_mem_entry
Message-ID: <20210111185338.GD144935@xps15>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-2-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229033019.25899-2-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 29, 2020 at 11:30:12AM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Introduce is_iomem to indicate this piece memory is iomem or not.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/linux/remoteproc.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

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
