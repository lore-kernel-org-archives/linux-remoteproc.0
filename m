Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EED1C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 May 2022 17:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239105AbiE3Ru5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 May 2022 13:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237372AbiE3Ru4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 May 2022 13:50:56 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB42C562EC
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 May 2022 10:50:54 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id a63so4512454pge.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 May 2022 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5FL+pSqHkuYAmD4lldd9M4+JHQIM8FUTF/ahgwVLrFw=;
        b=g9wPBpD7I/Sq7GAtJVH9D8y2+G/UqPAY6mDRRCT4plZG/sKf6xaZeFOj/tWTAlaRBi
         CFFbs7TofJfVFCQZTzcmOXi6bOWD+KwPelWpLjbbZpfoX4gmo5qtRIAfCtD8l9uEylIq
         p8YrIg0SMIKVCOGMKaMU4GR7OOVvFVWFB6bsGOhMMmJSfhlLFYUm1naNx/RuWjtDz5l/
         Pxe426Eng2DkSOEB52Xml61WxHwynfyYcHxdwcCI3r+Vu/vj5jhA4U8xMyWaMhl6AekX
         TI/ZV+hqez53umb3aZf0uVl8qExNXizm/BpaZKFeU25jFvh5g11HteYH9Nzx3I6ANBFD
         68wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5FL+pSqHkuYAmD4lldd9M4+JHQIM8FUTF/ahgwVLrFw=;
        b=DxVcR1F1JLOCcT3mcsfbdR2r8Zxp2GR/oLjXaxQwjgznnwBxsKHEbRbSzhBFs64KJp
         EqzTff0K8Wy6ajtXFEOTNoqC83GcNDOyrQndG0oZukO0UcsApzNJbz6zHtLuCsx3G+Jk
         7vc5cvU449y6DjxxVefjp5RXNETh7SbiKJznf1Rf9QatIlKMm0n168Zy7NngiRdW+bou
         NgvrL3YUXjvyP3BFMKAlHaVe4VGbK/ZMhGZGOMXcPjsL2L+JRotTBT/v4f9RSPgyuVga
         7o0YyyXowASsEAK5c/V9OTyTgpQkMDfU7+7M1u6A5BmJVS3qwcugcfmjX5KsWX0ZShWd
         N5dw==
X-Gm-Message-State: AOAM5303Cre8Sg+Tn8VkbL72Daz7J5luH1B1LrPh1NTSZWaGw9OQykoE
        w0OExDzFdtDKA52H4hpIxPJMVw==
X-Google-Smtp-Source: ABdhPJxZ5AEgKSi2efiKwS8umeMKozakAcySTRs3eD+rAY5c/sxUpmNAgsdySZOs7N3WExMmmqiemQ==
X-Received: by 2002:a63:1661:0:b0:3fa:5855:989a with SMTP id 33-20020a631661000000b003fa5855989amr33767711pgw.451.1653933054407;
        Mon, 30 May 2022 10:50:54 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id f14-20020a17090a4a8e00b001e32a7f876dsm462634pjh.16.2022.05.30.10.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 10:50:53 -0700 (PDT)
Date:   Mon, 30 May 2022 11:50:51 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        peng.fan@nxp.com
Subject: Re: [PATCH V4 2/2] remoteproc: support attach recovery after rproc
 crash
Message-ID: <20220530175051.GB482330@p14s>
References: <20220323034405.976643-1-peng.fan@oss.nxp.com>
 <20220323034405.976643-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323034405.976643-3-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Mar 23, 2022 at 11:44:05AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Current logic only support main processor to stop/start the remote
> processor after rproc crash. However to SoC, such as i.MX8QM/QXP, the
> remote processor could do attach recovery after crash and trigger watchdog
> reboot. It does not need main processor to load image, or stop/start M4
> core.
> 
> Introduce two functions: rproc_attach_recovery, rproc_firmware_recovery
> for the two cases. Firmware recovery is as before, let main processor to
> help recovery, while attach recovery is recover itself withou help.
> To attach recovery, we only do detach and attach.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++--------
>  1 file changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c510125769b9..ad04515750ef 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1887,6 +1887,50 @@ static int __rproc_detach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int rproc_attach_recovery(struct rproc *rproc)
> +{
> +	int ret;
> +
> +	mutex_unlock(&rproc->lock);
> +	ret = rproc_detach(rproc);
> +	mutex_lock(&rproc->lock);
> +	if (ret)
> +		return ret;
> +
> +	if (atomic_inc_return(&rproc->power) > 1)
> +		return 0;
> +
> +	return rproc_attach(rproc);

The correct functions to call here are __rproc_detach() and __rproc_attach() -
they are similar to rproc_stop() and rproc_start() without the parts related to
the firmware image.

And you should not be dealing with rproc->power at this stage, which leaves the
remote processor's state machine in the same way as the start/stop scenario.  

That being said, now that we actually count how many instances are requesting
the remote processor to be powered, we might have a problem with rproc->power when
the system is recovered after a crash.  But we can address that when we get
there.

Thanks,
Mathieu

> +}
> +
> +static int rproc_firmware_recovery(struct rproc *rproc)
> +{
> +	const struct firmware *firmware_p;
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	ret = rproc_stop(rproc, true);
> +	if (ret)
> +		return ret;
> +
> +	/* generate coredump */
> +	rproc->ops->coredump(rproc);
> +
> +	/* load firmware */
> +	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +	if (ret < 0) {
> +		dev_err(dev, "request_firmware failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* boot the remote processor up again */
> +	ret = rproc_start(rproc, firmware_p);
> +
> +	release_firmware(firmware_p);
> +
> +	return ret;
> +}
> +
>  /**
>   * rproc_trigger_recovery() - recover a remoteproc
>   * @rproc: the remote processor
> @@ -1901,7 +1945,6 @@ static int __rproc_detach(struct rproc *rproc)
>   */
>  int rproc_trigger_recovery(struct rproc *rproc)
>  {
> -	const struct firmware *firmware_p;
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> @@ -1915,24 +1958,10 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  
>  	dev_err(dev, "recovering %s\n", rproc->name);
>  
> -	ret = rproc_stop(rproc, true);
> -	if (ret)
> -		goto unlock_mutex;
> -
> -	/* generate coredump */
> -	rproc->ops->coredump(rproc);
> -
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto unlock_mutex;
> -	}
> -
> -	/* boot the remote processor up again */
> -	ret = rproc_start(rproc, firmware_p);
> -
> -	release_firmware(firmware_p);
> +	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_RECOVERY))
> +		ret = rproc_attach_recovery(rproc);
> +	else
> +		ret = rproc_firmware_recovery(rproc);
>  
>  unlock_mutex:
>  	mutex_unlock(&rproc->lock);
> -- 
> 2.25.1
> 
