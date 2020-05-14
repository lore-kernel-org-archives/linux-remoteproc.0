Return-Path: <SRS0=9JvK=64=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AA3C433E2
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 05:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4088206BE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 05:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Es7gB+V2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgENFFF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 May 2020 01:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725954AbgENFFF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 01:05:05 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A918C061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:05:05 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z15so2572067pjb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 22:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tj3wTZtbDhnHZV3JGD+uPMkyVs4DjgIgPsF9FB8nJ8k=;
        b=Es7gB+V2iRrBdGZENlfFP7ZPj71j6sUTsS8b5RJjQMyycpeN/dRq6+h1KC46rIh+dG
         e+y1nzHg3jqoLQh7i8c5I4c9EYPm60CBZJrrgjhCe2uf7IU1sulmF1wC1vnocmblc9Tl
         llsaiwqDsP0oYe1Rus7kOj4t2oH3xU3fVf2P3bU5JdHVmu0y0qBPea8bJhn/p14vdYNK
         yBxV1rVd/BEV1c2WW0RVMFcX92t/U5FnflbXkSTm0Q35KHD/6iqB7pVnOGvM8n9UJpGc
         +G1BKArwMEdLVLpJHsocK6RDgotJXXtlrWu/t2mFUIrTt90g9axtbXaRVvbFAZz9l5ye
         X7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tj3wTZtbDhnHZV3JGD+uPMkyVs4DjgIgPsF9FB8nJ8k=;
        b=VqCJPjDTYQtWyQoV0cqyvMWzGsbcoQyZQics/M4HR3q5T6gVeqq/e8Lhb1QfsOvRGM
         0hctJB5W7gXhHrxNOcVqE4YqrNVkUwwtwFdDz3bVH3Lbp8apfge42eT6Xl02HGMrdx8i
         dk8PyMrIQidNRjdZ3d6dg+WOI2i1RqpAypu9HH6OA4ZrfuiI1PsCx4On0jG+WdvHdeQz
         T61yq696++J1hq7A1oC92RKKL1ot6p5kaTZD1PM9K8W7AKGgEsDsV3QDfeTqM63dM9bA
         oFRLwtLjsqay7Zw//MGvKRyNclwRaGanAoUA3WJUFtTv2+AOGqRd/pE/t+Y18b0k4NqV
         6Y2w==
X-Gm-Message-State: AOAM530oHdcDiwbo16QhxRbocWlCZOlCWV4kSte1MqB572CytvpE9zk2
        MHW6dVwRqFqiVMxjcpWhSdBC8A==
X-Google-Smtp-Source: ABdhPJxE+Ga0oiFVkwJhCJzgkI8UBbxRw3MDQH0DbdFOywzsoL1X/me7zuMcKuBheK34DoyGKQsEYg==
X-Received: by 2002:a17:90a:c201:: with SMTP id e1mr5391158pjt.162.1589432704717;
        Wed, 13 May 2020 22:05:04 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 1sm1059453pgy.77.2020.05.13.22.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 22:05:04 -0700 (PDT)
Date:   Wed, 13 May 2020 22:03:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/12] remoteproc: stm32: Parse syscon that will
 manage M4 synchronisation
Message-ID: <20200514050333.GK16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-6-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-6-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Get from the DT the syncon to probe the state of the remote processor
> and the location of the resource table.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 658439d4b00a..a285f338bed8 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -70,6 +70,8 @@ struct stm32_rproc {
>  	struct reset_control *rst;
>  	struct stm32_syscon hold_boot;
>  	struct stm32_syscon pdds;
> +	struct stm32_syscon m4_state;
> +	struct stm32_syscon rsctbl;
>  	int wdg_irq;
>  	u32 nb_rmems;
>  	struct stm32_rproc_mem *rmems;
> @@ -606,6 +608,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	*auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
> +	/*
> +	 * See if we can check the M4 status, i.e if it was started
> +	 * from the boot loader or not.
> +	 */
> +	err = stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
> +				     &ddata->m4_state);
> +	if (err) {
> +		/* remember this */
> +		ddata->m4_state.map = NULL;
> +		/* no coprocessor state syscon (optional) */
> +		dev_warn(dev, "m4 state not supported\n");
> +
> +		/* no need to go further */
> +		return 0;
> +	}
> +
> +	/* See if we can get the resource table */
> +	err = stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
> +				     &ddata->rsctbl);
> +	if (err) {
> +		/* no rsc table syscon (optional) */
> +		dev_warn(dev, "rsc tbl syscon not supported\n");
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.20.1
> 
