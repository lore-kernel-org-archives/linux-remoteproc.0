Return-Path: <SRS0=SQOW=A7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A608C433E2
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Jul 2020 16:59:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06C1A206E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Jul 2020 16:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5sv0TUV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbgGTQ76 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Jul 2020 12:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbgGTQ76 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Jul 2020 12:59:58 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6936C061794
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2020 09:59:57 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so10568919pgf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2020 09:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XTpfTRtjLabMYQDaBkpj4hw5ufV0kY4GfLGgilGMUUo=;
        b=n5sv0TUVhgDbWOe+6Utv6xdRSmrGuQ8DoVuv3SnLuAFeCIMRYpoSFxkNXF2HrRBzpU
         RN/R6q024UeVvtqhHlrd++5kYTWFl2b5kU07P8or67od+CO1HhCd2hjHj2JxhsDSy0mN
         P+y2j+rmotIi6vTQiieLsv3+0ZKMqkUqJJrSegeGDr4uv8qLKDDRVMNSLaDwNejEsigB
         TQCXUQ2tHQY/3JHVTDoAqtTc+Oy0o3kaXYcj5pg6cy8RtHy18UvrKChwIW2r5RkZG3Z5
         OYu90iDD84Enw8/pUI28ijHRZhe8nfmFC+mkX2D+p4UvQflDDxz5D1ex/zEoaIe7lMPH
         NSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XTpfTRtjLabMYQDaBkpj4hw5ufV0kY4GfLGgilGMUUo=;
        b=I8UTA53wZFPem/1F7DftmH7K+MRzt904nvDmsnmVa9ofoSLP0EF4T2meHkbqmlgv+W
         aOvnNLBlNdr5MII6VZfTjZnJRMpMv5g1LaMw9wAfgetzGaH0xkEPtaqlEoOE8FY5apot
         b6539zrf73taSNqP+IWcrr1FJXlWuG/jJgSCGkA64r8TbVoNx5tFW7sS8pwX2vIyKO5G
         +9rzIa6ZsY9WVEr/Z0tqTKQc6lcJRSSgRjodfd64EFWVBABp6sVZI4q0STLB2bNjUTBn
         8rbTSDutXTMT/sz7C0utiizJtYq4RNdKVRlUgFOJULNTfjl/R33+JMLJB+XkeNgq042Y
         4Abw==
X-Gm-Message-State: AOAM532FKPkRvaOhRBjfOb04nqGB3ueew/Rqmqv8r1m+QifSbuWpImVx
        jZZxkk3wgUJYJkZNbFnbDPBqRQ==
X-Google-Smtp-Source: ABdhPJzRTVraKqfSfPPhCXufOsemlddmRnH6ao+bP8KnXOPYPmpAB1Y4Bxwp5DYGDcwSzpXCKZfx7Q==
X-Received: by 2002:a63:e14c:: with SMTP id h12mr19548473pgk.110.1595264397195;
        Mon, 20 Jul 2020 09:59:57 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t5sm15152737pgl.38.2020.07.20.09.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 09:59:56 -0700 (PDT)
Date:   Mon, 20 Jul 2020 10:59:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codearora.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v8 3/5] remoteproc: Pass size and offset as arguments to
 segment dump function
Message-ID: <20200720165954.GB1113627@xps15>
References: <1594938035-7327-1-git-send-email-rishabhb@codeaurora.org>
 <1594938035-7327-4-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594938035-7327-4-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jul 16, 2020 at 03:20:33PM -0700, Rishabh Bhatnagar wrote:
> Change the segment dump API signature to include size and offset
> arguments. Refactor the qcom_q6v5_mss driver to use these
> arguments while copying the segment. Doing this lays the ground
> work for "inline" coredump functionality being added in the next
> patch.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c       | 10 +++++-----
>  drivers/remoteproc/remoteproc_coredump.c |  5 +++--
>  include/linux/remoteproc.h               |  5 +++--
>  3 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 037cd45..6baa3ae 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1199,7 +1199,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  
>  static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  				   struct rproc_dump_segment *segment,
> -				   void *dest)
> +				   void *dest, size_t cp_offset, size_t size)
>  {
>  	int ret = 0;
>  	struct q6v5 *qproc = rproc->priv;
> @@ -1219,16 +1219,16 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  	}
>  
>  	if (!ret)
> -		ptr = ioremap_wc(qproc->mpss_phys + offset, segment->size);
> +		ptr = ioremap_wc(qproc->mpss_phys + offset + cp_offset, size);
>  
>  	if (ptr) {
> -		memcpy(dest, ptr, segment->size);
> +		memcpy(dest, ptr, size);
>  		iounmap(ptr);
>  	} else {
> -		memset(dest, 0xff, segment->size);
> +		memset(dest, 0xff, size);
>  	}
>  
> -	qproc->current_dump_size += segment->size;
> +	qproc->current_dump_size += size;
>  
>  	/* Reclaim mba after copying segments */
>  	if (qproc->current_dump_size == qproc->total_dump_size) {
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index ded0244..390f563 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -72,7 +72,8 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      dma_addr_t da, size_t size,
>  				      void (*dumpfn)(struct rproc *rproc,
>  						     struct rproc_dump_segment *segment,
> -						     void *dest),
> +						     void *dest, size_t offset,
> +						     size_t size),
>  				      void *priv)
>  {
>  	struct rproc_dump_segment *segment;
> @@ -183,7 +184,7 @@ void rproc_coredump(struct rproc *rproc)
>  		elf_phdr_set_p_align(class, phdr, 0);
>  
>  		if (segment->dump) {
> -			segment->dump(rproc, segment, data + offset);
> +			segment->dump(rproc, segment, data + offset, 0, segment->size);
>  		} else {
>  			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>  			if (!ptr) {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e7b7bab..eb08139 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -451,7 +451,7 @@ struct rproc_dump_segment {
>  
>  	void *priv;
>  	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
> -		     void *dest);
> +		     void *dest, size_t offset, size_t size);
>  	loff_t offset;
>  };
>  
> @@ -630,7 +630,8 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      dma_addr_t da, size_t size,
>  				      void (*dumpfn)(struct rproc *rproc,
>  						     struct rproc_dump_segment *segment,
> -						     void *dest),
> +						     void *dest, size_t offset,
> +						     size_t size),
>  				      void *priv);
>  int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
