Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EF9C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 21:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB7742225E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 21:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbhAMVZb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Jan 2021 16:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729107AbhAMVXy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Jan 2021 16:23:54 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B4FC061786
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jan 2021 13:23:00 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id i5so2323829pgo.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jan 2021 13:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2oVuzEK0sHFjnoocbJw1sqteX5S5UuoEAAdB30o3rmg=;
        b=t+gXcNaa45OlK6+8xH7sItflZVBIhUj34KZPFZWe/JMyLbGnPghaSz/K8BQ4y7Guvr
         wk+cfVxX+4UJEaPnLuq3i+kANW6mX1qN6RZQBNTO99pDJxtK4i6b7XcJLDwMXZgh4ipO
         eD2yDQOuniD4PTq9feSqqc5mvmFiZ37hweclA+KmWD42DeMcdlo+hb8luIyfbscoodge
         mTVQKGIE0xsGiSYAE/VFQIYOswrZrQGxy3qXN5CNp0666Tva2F0GiaAcYRu7oJiTv7Rc
         940RCWMVXSQESVs7hvM7R0RUiR2rdYl+GKgjKt6m0/GK7llECaFlNai63pl/KVaOwmSr
         LVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2oVuzEK0sHFjnoocbJw1sqteX5S5UuoEAAdB30o3rmg=;
        b=ifcX1WOx0GAfH+gqYqYNOv6gl5pQ1XDhnobnWwa5/uURMcTSBzvlRMMGHHk2VfcVJ9
         TWqd045VbUAxM27mLEYZpT2Inwr4Td5YzNGQm1RffCrKxwQihzedUSZoYtWqHs3p2fVG
         nRw/v4QcnKWRuy+77enDNL/DarL4Fw99KsnQvoR87Fj56ybSXrpXyqR5hkx0KGDcQ1Um
         D6C3meZD92eJ5tMNEW//kwRg3MAB18L5jkDDcCMoTNgxokXJM5IZWbPJkHg5lCLAJlxP
         P0fPOHyNGdzrv2Hhl9WEwmSc9QF5Y1GybjrVQMMwqLC7kgLNql5Lgw43WEeYD9p67ilG
         LUdQ==
X-Gm-Message-State: AOAM533C3KV/X8DoxqIkuwkbkqzzhwypfAhVo9IXAiEgtPBaZOr39tu5
        ku88AtSOpXqg/N/AQ/b3LePiQg==
X-Google-Smtp-Source: ABdhPJz17kHLtL3rBoveX55Roj7DegDuMBw9EqP3t71VYpd6/wa2ekUezRqn20cgZYLzz+dOZiLO4w==
X-Received: by 2002:a63:1322:: with SMTP id i34mr3945492pgl.282.1610572980072;
        Wed, 13 Jan 2021 13:23:00 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x15sm3284847pfn.118.2021.01.13.13.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 13:22:59 -0800 (PST)
Date:   Wed, 13 Jan 2021 14:22:57 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF
 loader
Message-ID: <20210113212257.GB229796@xps15>
References: <20210107235053.745888-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107235053.745888-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On Thu, Jan 07, 2021 at 03:50:53PM -0800, Bjorn Andersson wrote:
> Analog to the issue in the common mdt_loader code the MSS ELF loader
> does not validate that p_filesz bytes will fit in the memory region and
> that the loaded segments are not truncated. Fix this in the same way
> as proposed for the mdt_loader.
> 
> Fixes: 135b9e8d1cd8 ("remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 66106ba25ba3..2b59e0cbdce1 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1210,6 +1210,14 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			goto release_firmware;
>  		}
>  
> +		if (phdr->p_filesz > phdr->p_memsz) {
> +			dev_err(qproc->dev,
> +				"refusing to load segment %d with p_filesz > p_memsz\n",
> +				i);
> +			ret = -EINVAL;
> +			break;

Based on the error handling for the above and below conditions, I would have
expected a "goto release_firmware" rather than a "break".

> +		}
> +
>  		ptr = memremap(qproc->mpss_phys + offset, phdr->p_memsz, MEMREMAP_WC);
>  		if (!ptr) {
>  			dev_err(qproc->dev,
> @@ -1241,6 +1249,15 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  				goto release_firmware;
>  			}
>  
> +			if (seg_fw->size != phdr->p_filesz) {
> +				dev_err(qproc->dev,
> +					"failed to load segment %d from truncated file %s\n",
> +					i, fw_name);
> +				ret = -EINVAL;
> +				memunmap(ptr);
> +				break;

Same here.

> +			}
> +
>  			release_firmware(seg_fw);
>  		}

Thanks,
Mathieu

>  
> -- 
> 2.29.2
> 
