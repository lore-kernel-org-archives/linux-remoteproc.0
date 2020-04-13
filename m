Return-Path: <SRS0=OzSZ=55=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CF9C2BB86
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 20:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD3420663
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 20:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NrJehcL9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388644AbgDMU4s (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Apr 2020 16:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388633AbgDMU4r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Apr 2020 16:56:47 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF00CC0A3BDC
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 13:56:46 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id w1so10901094iot.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 13:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uC+i7PG2W1Z3WS3zlyBPsJpZoWvsgugoZpuCkaGAEfc=;
        b=NrJehcL9lG2Mv/61kEXvNVJgLcTIjHDdnphQAxuq8oPZokn98sGrhX8ceSMq6o0GL9
         JoXMni4bOx+/s/tzdhVrBMccIU+XWWda89qBtx85gpZIRRGa47H3YiuZLqS9b63ZoEoT
         BfZGxvYpsN9WyoY87EGccK0N55gAmM2rOM7/LmynGeH2ydDnRT6k/CCGPwzC4VUnASFq
         tfvfOjOsh4Hmm6Ybhs4x4anRIuQdDaylRngI8N0CQ4zDNH8lLbqd120IfWmMW9Vl/dae
         LboieNqxZMJUfD3+v0YEq95tZiJ87zmfocASENVZHN3HHjzTWI3bDwzCbfIEQeS9fsHQ
         nwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uC+i7PG2W1Z3WS3zlyBPsJpZoWvsgugoZpuCkaGAEfc=;
        b=pRpiK4rkLpTobHaCwhbh6/+LgDb7wjuzxX0uh8KFeRSZmkOXdvhQKFU8EP1qEiAgLO
         8PTkgOoOugSKmAmFCbfVqCO+EY10+1FHM/wXtSlSeWqtGoF3mWxee9Sx+XIsjDNGaRAD
         so0dm93j2qKv1KculeedQJdqvHTcRZ5coEkUBnrgC0wkwh0JjgHklIfrZqWhA0dXRsz5
         ULPniyDQ45Omdig/VlddQ8lqElSGPT5SBK97ThbMXWSnMpZs2xWgLstlCSNgnfUAg340
         TBd5ih5hOkissgKnwmDoiCZVNzeiD55mOlzj9uzMEUD6LmC998eCmlHWNMFqWkt0cfBG
         XNBg==
X-Gm-Message-State: AGi0PubdBqk88DKeDkkhfFYqOgMJEtVLXA2u21uTFKl+D1bLLFF1Gr8U
        kmeWuNYaAA6fGZGWdSbn+5eG8h11+zomlg==
X-Google-Smtp-Source: APiQypJlVZIzbukahoApRZ+l0CblZIplxBDGccE60NgzcsZXvc6BCxY8YrYiRTJq2qCxb215H3vCfQ==
X-Received: by 2002:a6b:5116:: with SMTP id f22mr18106005iob.15.1586811406197;
        Mon, 13 Apr 2020 13:56:46 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id b3sm4205746ilh.77.2020.04.13.13.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 13:56:45 -0700 (PDT)
Subject: Re: [PATCH 4/4] remoteproc: Get rid of tedious error path
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-5-mathieu.poirier@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <9944bc97-a32a-94f6-7796-174a20ad4182@linaro.org>
Date:   Mon, 13 Apr 2020 15:56:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200413193401.27234-5-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200413205650.UI2qg0_LMoQ_Rp29Q6jHifwqKOMUvBkj_0crSTcDMvs@z>

On 4/13/20 2:34 PM, Mathieu Poirier wrote:
> Get rid of tedious error management by moving firmware and operation
> allocation after calling device_initialize().  That way we take advantage
> of the automatic call to rproc_type_release() to cleanup after ourselves
> when put_device() is called.

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c272d78f07e8..10009b95867a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2061,12 +2061,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (!rproc)
>  		return NULL;
>  
> -	if (rproc_alloc_firmware(rproc, name, firmware))
> -		goto free_rproc;
> -
> -	if (rproc_alloc_ops(rproc, ops))
> -		goto free_firmware;
> -
>  	rproc->name = name;
>  	rproc->priv = &rproc[1];
>  	rproc->auto_boot = true;
> @@ -2079,12 +2073,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->dev.driver_data = rproc;
>  	idr_init(&rproc->notifyids);
>  
> +	if (rproc_alloc_firmware(rproc, name, firmware))
> +		goto out;
> +
> +	if (rproc_alloc_ops(rproc, ops))
> +		goto out;
> +
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>  	if (rproc->index < 0) {
>  		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
> -		put_device(&rproc->dev);
> -		return NULL;
> +		goto out;
>  	}
>  
>  	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
> @@ -2105,11 +2104,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->state = RPROC_OFFLINE;
>  
>  	return rproc;
> -
> -free_firmware:
> -	kfree(rproc->firmware);
> -free_rproc:
> -	kfree(rproc);
> +out:
> +	put_device(&rproc->dev);
>  	return NULL;
>  }
>  EXPORT_SYMBOL(rproc_alloc);
> 

