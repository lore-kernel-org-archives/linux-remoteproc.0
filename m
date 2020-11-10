Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCD9C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 03:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5B9E206E3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Nov 2020 03:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iI1Ti+tw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730482AbgKJDfu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 22:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbgKJDft (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 22:35:49 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9D9C0613D3
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2020 19:35:49 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id n15so11202544otl.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2020 19:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fxbnx6fB8pa6ONyNTh9qdaa1sggi/dJNjnt3v+Nrh9I=;
        b=iI1Ti+twWOnzmRmblWhhRYQrQVRuajNGU7U+jAf9UL4xcfCvt7JI1oRQMLuNfUMBxX
         cwhgTiaLWlGsGJbIP0R0XhJI2bQc8TtOvL81YnqTigq7WHm+pahMnJxFm5hhVD2KnmG4
         rKa/eVw2u7K06UGyOuMWtJgmOyLjbcjNCrw0Td2s6RQ+IrAL5q4e/Cdz45LkihRmZm3S
         RBsWaLwvsQ1d/ldUCOxUC+U3WQwIprAcXcHVPT4+RgSpZGTs3fCJLYhlWldmo3jCyaYU
         L4ne78CZHHMD9DT1AGyAs4dfi+bXWY/0/i9uahiqp7ePe5/xadO8AD7R9Rdh3HYwYopp
         s1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fxbnx6fB8pa6ONyNTh9qdaa1sggi/dJNjnt3v+Nrh9I=;
        b=m2EZuKZP0kx/e8VZFmxCAuOAXKht7kY/N1wGo7sPZ+GU5E9MajlBMmjTzjdBs8tJkz
         1oBIsflnPMoSKBf1ckhX7Z4jijaxNy7mSh8cEehUmjOzd5I+UDNLDwikQiEaWuFOdQn+
         fJrVs1OQ1xls9KEEhpbOC6qRWHdAjPFU4/uel/p/FTs9X8XaDvUGIvhxqZ7yIaiheO8H
         BL+8yZfw/7UiRSY0tvO7hoDH2d9haVK1oQrea9pVdp7UpzJffwAtgW4yWxHogWg5J8sS
         +61i0+Pzj259ERGJGrMq8MWVpKosIf04+/I2lXBBYXo80lTpNB3X3QYMa4x8eRno6qRJ
         hUkQ==
X-Gm-Message-State: AOAM533rxDyd+fwtmTFOwkZZtS5FgrOTC5yAqsdf8Ns9ABOAN+dzD/mn
        kmRDW1O2oLkUhGgYE26lkkrfKtz2gk07fg==
X-Google-Smtp-Source: ABdhPJyOScqheXQ3E47DhzYXn+OVAGDdqd3gFuweaisaCp9+W50ErM3MhuGXeEvqxOGybnvW2ftwOQ==
X-Received: by 2002:a9d:6e82:: with SMTP id a2mr12551695otr.274.1604979349232;
        Mon, 09 Nov 2020 19:35:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x25sm2923469oie.17.2020.11.09.19.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 19:35:48 -0800 (PST)
Date:   Mon, 9 Nov 2020 21:35:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH 1/2] soc: qcom: Add tracepoints to mdt loader
Message-ID: <20201110033547.GD332990@builder.lan>
References: <1604971241-29000-1-git-send-email-rishabhb@codeaurora.org>
 <1604971241-29000-2-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604971241-29000-2-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 09 Nov 19:20 CST 2020, Rishabh Bhatnagar wrote:

> Add trace events to the mdt loader driver. These events
> can help us trace the region where we are loading the
> segments and the time it takes to initialize the image
> and setup the memory region.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/soc/qcom/mdt_loader.c     |  8 ++++++
>  include/trace/events/mdt_loader.h | 57 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 include/trace/events/mdt_loader.h
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 24cd193..df69e23 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -17,6 +17,9 @@
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/mdt_loader.h>
> +
>  static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
>  {
>  	if (phdr->p_type != PT_LOAD)
> @@ -169,6 +172,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  			goto out;
>  		}
>  
> +		trace_memory_setup("pas_init_image", fw_name);

I think it would be favourable if you pushed this into the PAS functions
in the scm driver instead.

>  		ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len);
>  
>  		kfree(metadata);
> @@ -196,8 +200,10 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  
>  	if (relocate) {
>  		if (pas_init) {
> +			trace_memory_setup("pas_mem_setup", fw_name);
>  			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
>  						     max_addr - min_addr);
> +
>  			if (ret) {
>  				dev_err(dev, "unable to setup relocation\n");
>  				goto out;
> @@ -232,6 +238,8 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  
>  		ptr = mem_region + offset;
>  
> +		trace_regions(ptr, phdr->p_filesz, i);

"regions" is a very generic name for a trace event, perhaps
trace_qcom_mdt_load_segment() ?

I think it would be quite useful with a trace event indicating which
firmware mdt file (and what .bXX files) we're trying to load.

PS. ptr is a virtual address, there's no point in tracing this - we're
interested in "mem_reloc + offset".

Regards,
Bjorn

> +
>  		if (phdr->p_filesz && phdr->p_offset < fw->size) {
>  			/* Firmware is large enough to be non-split */
>  			if (phdr->p_offset + phdr->p_filesz > fw->size) {
> diff --git a/include/trace/events/mdt_loader.h b/include/trace/events/mdt_loader.h
> new file mode 100644
> index 0000000..6299f65
> --- /dev/null
> +++ b/include/trace/events/mdt_loader.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM mdt_loader
> +
> +#if !defined(_TRACE_MDT_LOADER_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_MDT_LOADER_H
> +
> +#include <linux/types.h>
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(memory_setup,
> +
> +	TP_PROTO(const char *event, char *fw_name),
> +
> +	TP_ARGS(event, fw_name),
> +
> +	TP_STRUCT__entry(
> +		__string(event, event)
> +		__string(fw_name, fw_name)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(event, event);
> +		__assign_str(fw_name, fw_name);
> +	),
> +
> +	TP_printk("doing %s for %s", __get_str(event), __get_str(fw_name))
> +);
> +
> +TRACE_EVENT(regions,
> +
> +	TP_PROTO(void *region_start, size_t region_size, int i),
> +
> +	TP_ARGS(region_start, region_size, i),
> +
> +	TP_STRUCT__entry(
> +		__field(void *, region_start)
> +		__field(size_t, region_size)
> +		__field(int, index)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->region_start = region_start;
> +		__entry->region_size = region_size;
> +		__entry->index = i;
> +	),
> +
> +	TP_printk("segment %d: region start=%pK size=%zx", __entry->index,
> +		  __entry->region_start, __entry->region_size)
> +);
> +
> +#endif
> +#include <trace/define_trace.h>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
