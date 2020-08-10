Return-Path: <SRS0=2sxO=BU=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0CBC433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Aug 2020 22:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA586206DA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Aug 2020 22:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szlzA6BX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgHJWyu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Aug 2020 18:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgHJWyt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Aug 2020 18:54:49 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80ABEC06174A
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Aug 2020 15:54:49 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d19so5751903pgl.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Aug 2020 15:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fKb1XDtHYo4y9AlyAa0W068lkmxD2lT16yayOu1K+QI=;
        b=szlzA6BXPZZzYv7tgeeiBI/hmXhcZHAA8oH87hVJwjeA85Xg/l+ifQwGM4YQO05kYa
         lVvi/JBybmOD6wA4PJc7d/UeaFDTMxI/IQt926VCum9UT7Hs3JeLA3UGyhycIoWHgwxk
         BMu+OG3PffIKVMJRcsEfVqSVxjxqP6/GV0JZUyL3Dhh8cfE7wizpemJbiN7TFywWMGpl
         U5zb4KuXamUDsq7moDAydYTNnjtpyCZCaQP8vf2PkKUlZnzhxtQZuKKMuqzo5lHbQH3d
         96OYjaEvWw5d07CCxhnFlRC5Rl3JDgSau2idJy+DrIlSCsVZe1sVBgHrb4pNNcUyjfPA
         75PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fKb1XDtHYo4y9AlyAa0W068lkmxD2lT16yayOu1K+QI=;
        b=LVO32HAB7K7lhjUDI7n/bYIC3D+0c91vH/QUyCPVDEPUY6pEeBGw+XoajeSV0Yvmm+
         9SmcdwIJ9Jwwq0muoYQc5Ak0h57BxRsKgW6liIQi5S0r1qkGWrQpIKx1oWbaftcp08Xc
         pRcdHvmS9eRAn6tPeyC+NyiQ/qfMuizRXJsnLEI8KxHuHLTfsr20Ibf+GHvz+x29J8qG
         nvvpliixV+96ny7lbrlcmSC7t+Zqkrxdc9JivOCdnkUsugj9Ng+wFHd9Nds/u8nP8JBI
         7y9fXfbBoMREAGk6udLyi0PA/zb8OadmZDj8eCDct2eHr3eoDfMHYu2XmgUxojUtyo/W
         W+pA==
X-Gm-Message-State: AOAM530vlH1z0TKvzJAjwFt1d2xUArQtwQQI3qX8en84LDJihxp4qhz8
        m5SzVdLWbSzsyEvLo3jjRpD3sBSeVqA=
X-Google-Smtp-Source: ABdhPJz/gQKxkcJrWRzNaQSJ51fY2n1i6N2UjOuPLlsH6LfuPsWN8GZxDxhKTIjNyJ4Aabnv8C3/Ww==
X-Received: by 2002:a63:545a:: with SMTP id e26mr18363900pgm.60.1597100088918;
        Mon, 10 Aug 2020 15:54:48 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y1sm25234135pfr.207.2020.08.10.15.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 15:54:48 -0700 (PDT)
Date:   Mon, 10 Aug 2020 16:54:46 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Gurbir Arora <gurbaror@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        rishabhb@codeaurora.org
Subject: Re: [PATCH 1/3] remoteproc: core: Add coredump to remoteproc ops
Message-ID: <20200810225446.GG3223977@xps15>
References: <1596843121-82576-1-git-send-email-gurbaror@codeaurora.org>
 <1596843121-82576-2-git-send-email-gurbaror@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596843121-82576-2-git-send-email-gurbaror@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Aug 07, 2020 at 04:31:59PM -0700, Gurbir Arora wrote:
> Each remoteproc might have different requirements for coredumps and might
> want to choose the type of dumps it wants to collect. This change allows
> remoteproc drivers to specify their own custom dump function to be executed
> in place of rproc_coredump. If the coredump op is not specified by the
> remoteproc driver it will be set to rproc_coredump by default.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++++-
>  include/linux/remoteproc.h           | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)

This is not the patch Siddharth sent.

Please fix it problem along with the 3 kernel test robot warnings this set has
generated and send again after 5.9-rc1 has been released.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7f90eee..283ecb6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1681,7 +1681,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  		goto unlock_mutex;
>  
>  	/* generate coredump */
> -	rproc_coredump(rproc);
> +	rproc->ops->coredump(rproc);
>  
>  	/* load firmware */
>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> @@ -2113,6 +2113,10 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	rproc->ops->sanity_check = rproc_elf_sanity_check;
>  	rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>  
> +	/* Default to rproc_coredump if no coredump functions is specified */
> +	if (!rproc->ops->coredump)
> +		rproc->ops->coredump = rproc_coredump;
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 2fa68bf..0ed1a2b 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -392,6 +392,7 @@ struct rproc_ops {
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	void (*coredump)(struct rproc *rproc);
>  	unsigned long (*panic)(struct rproc *rproc);
>  };
>  
> -- 
> 1.9.1
> 
