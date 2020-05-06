Return-Path: <SRS0=hf+e=6U=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5649DC47247
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 May 2020 00:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35E4320659
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 May 2020 00:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cuQ2w4hF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgEFAdA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 May 2020 20:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgEFAc6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 May 2020 20:32:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472D2C061A10
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2020 17:32:57 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so16118pjb.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2020 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y9zuKvlUePaRKCcBUvJhmjYkDpj49I67K3FTRShwtUw=;
        b=cuQ2w4hFuOAp5SPmwkXQA3d7zpA3nOpK+tpMpaUccVfEdFhAYLkOSZKmoq70Mmb/G8
         jJf7rPIEOW2i5o+RUZaKyAfT0DGXUi2QTXN1XdKB3Bny6hvpfblXDMcc8ZpyT0NkG5yo
         eiaOpfwqLoLG0Zv5VKd8HK/OkL8Dc8aooZaXfkC/pw7/SG6TbLW1GvU4Az+5FyvSXNHN
         OYjZBwnkNOUglIXk3w/SRhkw8hSAUbz0GBpxIy2eutHb6qZ1czfTeBiHlgIRYJOLYmBn
         eD1DSZbBFZ2YNJt1aUuBv0yXd5TRhMuO6fxhGmNaNrciRaIvZEM4iv0a/EOLILxygP+T
         z9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y9zuKvlUePaRKCcBUvJhmjYkDpj49I67K3FTRShwtUw=;
        b=qMNwzgwwpmWKqq6875gcau2uxY4WyRmRtD7o80mS4+lAS5JpuaogJWEo7S94z825na
         DuAs1UaYpa4Ue7NzjiQcc2avzW2RFejHS+5pdnD/V9hwKNI+JxsRRJg2BK2Y+OG7KDVL
         vf8C2OSrnZ9oQM0dupkDf+SDwiQJe9jfAUFUSeCQ+HUDHxKlfNznZF0RPMZ4bAUdyn70
         6SaZ4KJrX6GsTbZ7dX/eHopWjDCK+OT/cprguqCZP6zD3Yt5/dePu22c0cYBk6RW231I
         MNHkoWFD6Nn5YGdEYfjXPpiG8rICfozCSSBgYFf+TVVMFeSRgbakpJw2QM2n1ozboI2r
         q1rw==
X-Gm-Message-State: AGi0PuY7RGPvEVWcgESuFqPJoj4refx6/3QH6cipXno7ny+sVPwl5gbG
        6v/SJR78k/5Srdubp2rMQox9Yg==
X-Google-Smtp-Source: APiQypKmfqHYDq43uE5ZHs0fFzHfdRm9ymJuzwc4d1Km5l72JwpMpLECHMUpOF1jGLvA3LLYYiGasg==
X-Received: by 2002:a17:902:56d:: with SMTP id 100mr5853353plf.123.1588725176491;
        Tue, 05 May 2020 17:32:56 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y21sm10907pfm.219.2020.05.05.17.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:32:55 -0700 (PDT)
Date:   Tue, 5 May 2020 17:33:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] remoteproc: Refactor function rproc_fw_boot()
Message-ID: <20200506003341.GD2329931@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-6-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424200135.28825-6-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:

> Refactor function rproc_fw_boot() in order to better reflect the work
> that is done when supporting scenarios where the remoteproc core is
> synchronising with a remote processor.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a02593b75bec..e90a21de9de1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1370,9 +1370,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  }
>  
>  /*
> - * take a firmware and boot a remote processor with it.
> + * boot or synchronise with a remote processor.
>   */
> -static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> +static int rproc_actuate_device(struct rproc *rproc, const struct firmware *fw)

Per patch 4 this function will if rproc_needs_syncing() be called with
fw == NULL, it's not obvious to me that the various operations on "fw"
in this function are valid anymore.

>  {
>  	struct device *dev = &rproc->dev;
>  	const char *name = rproc->firmware;
> @@ -1382,7 +1382,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> +	if (!rproc_needs_syncing(rproc))

Can't we make this check on fw, to make the relationship "if we where
passed a firmware object, we're going to load and boot that firmware"?

Regards,
Bjorn

> +		dev_info(dev, "Booting fw image %s, size %zd\n",
> +			 name, fw->size);
>  
>  	/*
>  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> @@ -1818,7 +1820,7 @@ int rproc_boot(struct rproc *rproc)
>  		}
>  	}
>  
> -	ret = rproc_fw_boot(rproc, firmware_p);
> +	ret = rproc_actuate_device(rproc, firmware_p);
>  
>  	release_firmware(firmware_p);
>  
> -- 
> 2.20.1
> 
