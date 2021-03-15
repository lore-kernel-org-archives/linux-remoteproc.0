Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB548C433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 17:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2CDB64F21
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 17:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbhCORGu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Mar 2021 13:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233002AbhCORGh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Mar 2021 13:06:37 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E224FC06175F
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Mar 2021 10:06:25 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id n9so19864511pgi.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Mar 2021 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yY3mhIGzvfIcea0oS5vnOF6ZD7eoZRfXqgRluJD6Ksk=;
        b=g6cpgZcwUgiy6sRyLSlM8Fgt+n+NM8QrgLWk7DBpT3nUvsZXTKZ92qpHV47YNnDCgO
         PYHE5t0mhQupKH7qGzopGZ8NKkmyTbwtnqrdM/zrzsnfwfgqaUh1mFjstfeWPvumXAEb
         tF5axhwM9S32tkzLbbnm2KLR9Y5gJZsPOHAug4T41G3Vc/ByVC/lOqzl0ar+BHQzBClD
         IRjskivPKqHZWgEEY789XI4McmHMckuhIsQ6EsLKiH9i+ZEYoie7XKZlIHF0L8bNiTQ3
         mXLtOTGRkIgxF/g4b0TfDZKmIi7rEvY/xsyR59XZVZ7hMUK1LtPJpd1L4m8HNvZKgtqN
         pX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yY3mhIGzvfIcea0oS5vnOF6ZD7eoZRfXqgRluJD6Ksk=;
        b=KcMCbhKw3RvXt3ML9TtZYEY88MHuZDItimwVKSWuF+sk49i7JJdngzmZXpQp3Xna65
         s05NhxkNidlVppxgcW7zjGnuldLBvDuJmjMvUZ/kL6YdMD8aFeHY5t6ZO9kgOhpUYWbA
         nJsWVIvRZSw/c4KK6RrcxJ8f7sPGaxxtG598/p9cxygBY9Ffo6lz9sxSh4qeSWZ1O0hB
         /WD8YsI7BFZfNFMqpus9aItaOolyr2/ag16WTodkz7mwDzmyQU0pRop0QDd5yEOGL4RY
         XtugWJ9xfUb9zdYP+mDDCGmHD/Z5d3br1fMe/ftPWDELCmvX8R/Hob3AJP3E2Z9AUqb9
         Dp9g==
X-Gm-Message-State: AOAM533SRe9jVl6TrwcQM/k9ulQNKAAmEV+L7ADRHGflr5f8QMAzVqAK
        4QOwtQeEoRH9R9u3dBYetMRdIQ==
X-Google-Smtp-Source: ABdhPJztwsViJzEquhAP1o+/MucyFw8LNEvEwKu1nZeYWRHgNBTFMt11CRG/3FjDjsm7t3+rIaxGJQ==
X-Received: by 2002:a62:92cc:0:b029:1fa:515d:808f with SMTP id o195-20020a6292cc0000b02901fa515d808fmr24978009pfd.43.1615827985438;
        Mon, 15 Mar 2021 10:06:25 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id ge16sm184580pjb.43.2021.03.15.10.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:06:25 -0700 (PDT)
Date:   Mon, 15 Mar 2021 11:06:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF
 loader
Message-ID: <20210315170623.GD1339147@xps15>
References: <20210312232002.3466791-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312232002.3466791-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Mar 12, 2021 at 03:20:02PM -0800, Bjorn Andersson wrote:
> Analog to the issue in the common mdt_loader code the MSS ELF loader
> does not validate that p_filesz bytes will fit in the memory region and
> that the loaded segments are not truncated. Fix this in the same way
> as proposed for the mdt_loader.
> 
> Fixes: 135b9e8d1cd8 ("remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Don't just break the loop, goto release_firmware.
> - Release seg_fw as well.
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 66106ba25ba3..14e0ce5f18f5 100644
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
> +			goto release_firmware;
> +		}
> +
>  		ptr = memremap(qproc->mpss_phys + offset, phdr->p_memsz, MEMREMAP_WC);
>  		if (!ptr) {
>  			dev_err(qproc->dev,
> @@ -1241,6 +1249,16 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  				goto release_firmware;
>  			}
>  
> +			if (seg_fw->size != phdr->p_filesz) {
> +				dev_err(qproc->dev,
> +					"failed to load segment %d from truncated file %s\n",
> +					i, fw_name);
> +				ret = -EINVAL;
> +				release_firmware(seg_fw);
> +				memunmap(ptr);
> +				goto release_firmware;
> +			}
> +

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  			release_firmware(seg_fw);
>  		}
>  
> -- 
> 2.29.2
> 
