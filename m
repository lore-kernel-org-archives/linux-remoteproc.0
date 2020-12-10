Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2916C4167B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6684D23DE3
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404081AbgLJRNO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 12:13:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392117AbgLJRNM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 12:13:12 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014CAC061794
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:12:32 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id 9so1443636ooy.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0WIm/b5GDSiNvjX5ZdgOqsnZwxxISiPiAUIdEi8cV0Q=;
        b=kjz8ekFyK0bkeLDkpFqDpqDdx5h9rugLHulW3Ks14r6OvnK2pOB3FR7psYOHUvnKhJ
         T53OLETGFp7QzcmsU/1uHBMyTPDepy7HDXcN6kXGH6dFn0hzCHc826JcZWU80ukP1hew
         IGlzGb7lf1Yip/HjV6a+jElRh3azO0PecpJyt8gqTkIaLoSEP/KyxH4+DaK6CNz982vF
         5Cj8Z+bmYUfO62tKC9MRFdy12aUkxjR3hyvQa7XRbsov32hIPvin/BCPmeQ6XFgZmIzh
         BCDw6hHEIxnq3V6sLzLel7ArWQ7R33hkKVF5FzOHvHwF4ZTie5OOMp2QldV6jx3CeNJ8
         TGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0WIm/b5GDSiNvjX5ZdgOqsnZwxxISiPiAUIdEi8cV0Q=;
        b=QiKLWD8Ct9r9/7631ZsQ0gk6u5rnsJSIG2Do6fxWlqq92fgJ71pstwVSKyHwz7DzVV
         K1Xp+HhRPNB0l/RoTIKlPwGf/KMi9Suspnwqu+JmeLdwATlthH/FZK8Jwl00yLtxk8UK
         XlgjBzze6uKjaAtGqSugOZC91JsJMpBIkPYzb8AFVLy0PJaDcL9dsdUYYcP9MH5k9aji
         wE64jxtxGMpVpAeOR+f39KfQaDSFkSKj6OpZ0qo0224+063NBRMlMXCuxkr3BFbrNl0S
         axS6C0YBG2wGXPUM9IywhtwSBIDWJTnd6BLIv6wC+V5Ze3TA5DF8q7ZfBGmpn13WnRIU
         K/GA==
X-Gm-Message-State: AOAM530lvMFf98R2JnnnGPmM24cTcL3SR3zbOOa9NWMbshtxf38wnT8t
        1ryN+DQMy/hxjQhm33/AuDY7QXNb7ffJSg==
X-Google-Smtp-Source: ABdhPJxE1dEalHUoCXjw5hxBwnC2Q3X+SKcPYbgvf0sihy8H8lbuKnCN1RbdTNR/9Aip8guLG9jKXg==
X-Received: by 2002:a4a:d043:: with SMTP id x3mr6631894oor.19.1607620351334;
        Thu, 10 Dec 2020 09:12:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b25sm1191416ooe.18.2020.12.10.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 09:12:30 -0800 (PST)
Date:   Thu, 10 Dec 2020 11:12:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v2 2/3] firmware: scm: Add tracepoints to scm driver for
 pas calls
Message-ID: <X9JW/ZQVqp2kIivE@builder.lan>
References: <1605563084-30385-1-git-send-email-rishabhb@codeaurora.org>
 <1605563084-30385-3-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605563084-30385-3-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 16 Nov 15:44 CST 2020, Rishabh Bhatnagar wrote:

> Add trace events to the qcom_scm driver to trace pas calls.
> These events can help us analyze the time impact for each scm
> operation and can also serve as standard checkpoints in code.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm.c     |  9 +++++++++
>  include/trace/events/qcom_scm.h | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 include/trace/events/qcom_scm.h
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 7be48c1..5bc9b65 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -19,6 +19,9 @@
>  
>  #include "qcom_scm.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/qcom_scm.h>
> +
>  static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
>  module_param(download_mode, bool, 0);
>  
> @@ -442,6 +445,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size)
>  	};
>  	struct qcom_scm_res res;
>  
> +	trace_qcom_scm_call("Start scm_pas_init_image");

Please don't trace human readable strings into the trace buffer. Also,
aren't you curious about at least which @peripheral this was?

>  	/*
>  	 * During the scm call memory protection will be enabled for the meta
>  	 * data blob, so make sure it's physically contiguous, 4K aligned and
> @@ -467,6 +471,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size)
>  
>  free_metadata:
>  	dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> +	trace_qcom_scm_call("Complete scm_pas_init_image");

Wouldn't it be useful to know if this call succeeded?

>  
>  	return ret ? : res.result[0];
>  }
> @@ -495,6 +500,7 @@ int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
>  	};
>  	struct qcom_scm_res res;
>  
> +	trace_qcom_scm_call("Start scm_pas_mem_setup");

Wouldn't it be useful to know the @peripheral, @addr and @size here?

>  	ret = qcom_scm_clk_enable();
>  	if (ret)
>  		return ret;
> @@ -502,6 +508,7 @@ int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_clk_disable();
>  
> +	trace_qcom_scm_call("Complete scm_pas_mem_setup");

Ditto.

>  	return ret ? : res.result[0];
>  }
>  EXPORT_SYMBOL(qcom_scm_pas_mem_setup);
> @@ -525,6 +532,7 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
>  	};
>  	struct qcom_scm_res res;
>  
> +	trace_qcom_scm_call("Start auth_and_reset");

Ditto.

>  	ret = qcom_scm_clk_enable();
>  	if (ret)
>  		return ret;
> @@ -532,6 +540,7 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_clk_disable();
>  
> +	trace_qcom_scm_call("Complete  auth_and_reset");

Ditto.

>  	return ret ? : res.result[0];
>  }
>  EXPORT_SYMBOL(qcom_scm_pas_auth_and_reset);
> diff --git a/include/trace/events/qcom_scm.h b/include/trace/events/qcom_scm.h
> new file mode 100644
> index 0000000..d918332
> --- /dev/null
> +++ b/include/trace/events/qcom_scm.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM qcom_scm
> +
> +#if !defined(_TRACE_QCOM_SCM_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_QCOM_SCM_H
> +
> +#include <linux/types.h>
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(qcom_scm_call,
> +
> +	TP_PROTO(const char *event),
> +
> +	TP_ARGS(event),
> +
> +	TP_STRUCT__entry(
> +		__string(event, event)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(event, event);
> +	),
> +
> +	TP_printk("qcom_scm_call event:%s", __get_str(event))

We already know that this is the qcom_scm_call trace event, so no need
to include that in the trace data.

Regards,
Bjorn

> +);
> +
> +#endif
> +#include <trace/define_trace.h>
> +
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
