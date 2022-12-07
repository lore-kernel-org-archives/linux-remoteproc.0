Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379A8C352A1
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Dec 2022 18:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiLGSgo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Dec 2022 13:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiLGSgn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Dec 2022 13:36:43 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98C160DE
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Dec 2022 10:36:42 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id x66so18245483pfx.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Dec 2022 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1b653XqKdE+ACkzobajku7SrEFL8PYTT2ucOENSGGQU=;
        b=BLOIftrH9HeVn1463TiO4mC1wIwJbuww9ZFfHvVAMMkZllcS5dP7hC8xxHhEvcfpHc
         mnViOVvb2jwyCK2ZC+Q2jBMMvkFlNA1cwAh0aYQDqeD4SL5GYK7JHDlzTdexb9acMshh
         58gmbcqptqC4Hrb6TDKCOdCK058K6+RfeG1CMByknUeVrY1u+SVQvYOVgyMsbYrwUPRb
         9NAjnNTt8U4+/yXqOfoppggzzcq1JE6y3Lo2PPvhSM3JqlL0N9+1CNwQe5eFxyoChXQP
         9WBLo7G3mPhCbloQ9FX8w3nQ/+PNYV/ELa7X2S8Xwl8TvtzijDS05nJhbuhC0BKn4aqO
         N3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b653XqKdE+ACkzobajku7SrEFL8PYTT2ucOENSGGQU=;
        b=d5swrID5tGq/ozWU/ghLoLWITehK/iIwnZjzgJhDsyvjg7xtyEI8zhsioXX5KlaJ/Y
         m8SREpWkSBlSW5FWSiIBYAtKsaNb5SyyXFwebgSDA3MJhrldw4+/Dj0lwzVyvuxOZi5P
         Uedw4utoJMwk2QFbA5f3w3yWzFKAIu+HIVH6abxmKkkJ/2NfNKV425Ja+GTp5HByccwL
         rObHiXKYz32CNi8VptxVIhu0l0xnNmKS8IL+JUHQ7Wil5oxHjikg7NOdNOg7bXvRusBQ
         VVXpgSVxip3LEyOoiWA7jyaQurr7WOMz0nN0m2CecUMaR2NOWJNdLsOAYbA7pFXq+llV
         7kPQ==
X-Gm-Message-State: ANoB5pmnhtuqnK7C3SU+Hn0exJ2F//hToWylRafK0xNcTynSKI9K0i9y
        BPhspGYmWKPkwVFsAW8CjGaTKw==
X-Google-Smtp-Source: AA0mqf4Vmxwo0MGusyBmh4fpv4U1HnTv6DSe5jj7GvspXF9DPDnm3NOb9z5gYTUJIDZXQFA1+85R5w==
X-Received: by 2002:a63:f5a:0:b0:470:18d4:f18d with SMTP id 26-20020a630f5a000000b0047018d4f18dmr66096148pgp.295.1670438202238;
        Wed, 07 Dec 2022 10:36:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5942:e1b3:57a1:f106])
        by smtp.gmail.com with ESMTPSA id c73-20020a624e4c000000b00575448ab0fdsm13895741pfb.114.2022.12.07.10.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 10:36:41 -0800 (PST)
Date:   Wed, 7 Dec 2022 11:36:39 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     andersson@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_clew@quicinc.com,
        quic_mojha@quicinc.com
Subject: Re: [PATCH v6 1/1] remoteproc: core: do pm_relax when in
 RPROC_OFFLINE state
Message-ID: <20221207183639.GB527346@p14s>
References: <20221206015957.2616-1-quic_aiquny@quicinc.com>
 <20221206015957.2616-2-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206015957.2616-2-quic_aiquny@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 06, 2022 at 09:59:57AM +0800, Maria Yu wrote:
> Make sure that pm_relax() happens even when the remoteproc
> is stopped before the crash handler work is scheduled.
> 
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8768cb64f560..7419e1460f2a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1862,12 +1862,18 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	mutex_lock(&rproc->lock);
>  
> -	if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE) {
> +	if (rproc->state == RPROC_CRASHED) {
>  		/* handle only the first crash detected */
>  		mutex_unlock(&rproc->lock);
>  		return;
>  	}
>  
> +	if (rproc->state == RPROC_OFFLINE) {
> +		/* Don't recover if the remote processor was stopped */
> +		mutex_unlock(&rproc->lock);
> +		goto out;
> +	}
> +
>  	rproc->state = RPROC_CRASHED;
>  	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
>  		rproc->name);
> @@ -1877,6 +1883,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  	if (!rproc->recovery_disabled)
>  		rproc_trigger_recovery(rproc);
>  
> +out:
>  	pm_relax(rproc->dev.parent);

I have applied this patch.

Thanks,
Mathieu

>  }
>  
> -- 
> 2.17.1
> 
