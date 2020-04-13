Return-Path: <SRS0=OzSZ=55=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF65C2BBC7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 20:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 726E120644
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 20:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CfOkaTZ+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388636AbgDMU4i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Apr 2020 16:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388631AbgDMU4g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Apr 2020 16:56:36 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E781C0A3BDC
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 13:56:35 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id m4so10895434ioq.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nq1CQd3jLxR9OAK0VqPDUwMZG87RHIFLCePTtybb5tw=;
        b=CfOkaTZ+8aDFPEwQAwiHXmY9LZuqAaCEJzOiEZRGudxgoekbxc1lFBBYfLHDWIBsA6
         fEjT2OUBEoyAP2rBTcQ2697WOT3LoMAc42Slrf2Xx1HzVLGyLlTXy+y9/6orgVEr8TNB
         QYZUA6kPO9PQ6QXn8jme46jWQnHwdjv3W1UwVGtTyy+XTuOW2G3oWhfjVSBXuYE/0B+Q
         bzdOxmH/i1+BL10v6xBzg6+JFMH5fx/NlmGTb/i4p7V9xhty0QjQm21yikqV8gJcV3yE
         jVRoaYZhqoypaNDYDDBMUUjCzjxKBejkeDxqi9TzYB2G7qBo4j1k9GnRSQl4T7lvGvBI
         8YJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nq1CQd3jLxR9OAK0VqPDUwMZG87RHIFLCePTtybb5tw=;
        b=hxdzAKLv+jv25J3VF2idq3BkWjJ+odKGHkOplsD6my4guGvMTJSkbmhgtkh0KE/oqr
         bHfJrw1+Odm+oNWXyiG7AelFCejS0ff6t5UhhpYdsX2e+D9POqahgfuDS7Gw9FZ5ofDd
         VZq/f8pGD3cq/Ag07T+536aGzAY777h0duOEyy/Fhx4HsG1yOoR+T9IV1Q9+DqbvhSKm
         GOSRtwKZRalH0QKune05Bk2yLMZYXfLkaTByDVt38LnmZXAEuMjlfPAJTTDhtXjiIokL
         hI5we8OMJDbVhahnE/aZaCYm6pu8+GqpVK8tq7WUbEO2IxZRVTSllK3RzDuKR4RJFaJI
         n7cA==
X-Gm-Message-State: AGi0Puada3mr0QN1I+mFIK88+jWC76rT3poEXiMbVSDFIhxOmBlqyRoG
        UwsXCv59z5udO/VyJ8ikmucW9w==
X-Google-Smtp-Source: APiQypJ94bZgztCV3yJWb0L0tHzUOWaTtJZ7xqhj4mLP5drMOyDdfibsq4rpp+muICQN1p5NhP0HCA==
X-Received: by 2002:a5d:924f:: with SMTP id e15mr12013530iol.43.1586811394231;
        Mon, 13 Apr 2020 13:56:34 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x29sm4205834ilk.74.2020.04.13.13.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 13:56:33 -0700 (PDT)
Subject: Re: [PATCH 2/4] remoteproc: Split firmware name allocation from
 rproc_alloc()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-3-mathieu.poirier@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <bd8cc8d5-94c1-5767-d089-535731fc1055@linaro.org>
Date:   Mon, 13 Apr 2020 15:56:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200413193401.27234-3-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200413205638.vCoi5J7BG213rLCUPcjecYsigrOkoIp6v5twyxdt-6w@z>

On 4/13/20 2:33 PM, Mathieu Poirier wrote:
> Make the firmware name allocation a function on its own in order to
> introduce more flexibility to function rproc_alloc().
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

I didn't look at the larger context (MCU series); I'm only looking
at this (and the others in this series) in isolation.  I like
that you're encapsulating this stuff into functions but doing so
doesn't really add any flexibility.

Two small suggestions for you to consider but they're truly
more about style so it's entirely up to you.  Outside of that
this looks straightforward to me, and the result of the series
is an improvement.

I'll let you comment on my suggestions before offering my
"reviewed-by" indication.

					-Alex

> ---
>  drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
>  1 file changed, 39 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 80056513ae71..4dee63f319ba 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
>  	.release	= rproc_type_release,
>  };
>  
> +static int rproc_alloc_firmware(struct rproc *rproc,
> +				const char *name, const char *firmware)
> +{
> +	char *p, *template = "rproc-%s-fw";
> +	int name_len;

Not a big deal (and maybe it's not consistent with other nearby
style) but template and name_len could be defined inside the
"if (!firmware)" block.

> +	if (!firmware) {
> +		/*
> +		 * If the caller didn't pass in a firmware name then
> +		 * construct a default name.
> +		 */
> +		name_len = strlen(name) + strlen(template) - 2 + 1;
> +		p = kmalloc(name_len, GFP_KERNEL);


I don't know if it would be an improvement, but you could
check for a null p value below for both cases.  I.e.:

		if (p)
			snprintf(p, ...);

(more below)

> +		if (!p)
> +			return -ENOMEM;
> +		snprintf(p, name_len, template, name);
> +	} else {
> +		p = kstrdup(firmware, GFP_KERNEL);
> +		if (!p)
> +			return -ENOMEM;
> +	}
> +

	if (!p)
		return -ENOMEM;
	
> +	rproc->firmware = p;
> +
> +	return 0;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  			  const char *firmware, int len)
>  {
>  	struct rproc *rproc;
> -	char *p, *template = "rproc-%s-fw";
> -	int name_len;
>  
>  	if (!dev || !name || !ops)
>  		return NULL;
>  
> -	if (!firmware) {
> -		/*
> -		 * If the caller didn't pass in a firmware name then
> -		 * construct a default name.
> -		 */
> -		name_len = strlen(name) + strlen(template) - 2 + 1;
> -		p = kmalloc(name_len, GFP_KERNEL);
> -		if (!p)
> -			return NULL;
> -		snprintf(p, name_len, template, name);
> -	} else {
> -		p = kstrdup(firmware, GFP_KERNEL);
> -		if (!p)
> -			return NULL;
> -	}
> -
>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> -	if (!rproc) {
> -		kfree(p);
> +	if (!rproc)
>  		return NULL;
> -	}
> +
> +	if (rproc_alloc_firmware(rproc, name, firmware))
> +		goto free_rproc;
>  
>  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> -	if (!rproc->ops) {
> -		kfree(p);
> -		kfree(rproc);
> -		return NULL;
> -	}
> +	if (!rproc->ops)
> +		goto free_firmware;
>  
> -	rproc->firmware = p;
>  	rproc->name = name;
>  	rproc->priv = &rproc[1];
>  	rproc->auto_boot = true;
> @@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->state = RPROC_OFFLINE;
>  
>  	return rproc;
> +
> +free_firmware:
> +	kfree(rproc->firmware);
> +free_rproc:
> +	kfree(rproc);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(rproc_alloc);
>  
> 

