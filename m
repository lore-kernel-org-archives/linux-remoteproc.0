Return-Path: <SRS0=mdwO=7H=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19883C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 May 2020 20:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8531204EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 May 2020 20:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4GvibCu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389092AbgEYUKi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 May 2020 16:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388974AbgEYUKi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 May 2020 16:10:38 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D6BC061A0E
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2020 13:10:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t16so7787547plo.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2020 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vXTUdauXUxQoo2TNoxao1MjabWgPfDtazwZyVjiCBLE=;
        b=B4GvibCu0W6JlJm8rwEF8rGgul04eTGIFsiiLZMPwdcLADyzHJUJiVHmGgTtczPDRr
         4tVIs/EbGOYFa+83VBo1V6qWTv++/uYApGDJjHL7ENom+TanKl63kxlGYEBb+aRZg1F/
         Oc/yb4VFZPdD4SLTvCnWRACVdVmSIWEaknOLNaAyTO//YLfEfZ8z/zC+oGNcGIpDM8sM
         CfBZYqQ4c48gvWvnnPyl7+8twX6pqqXrwZJOUmUQeidb0J6mZrVdoVTHLsDH7S+E4c4j
         kfHJ4ZXN+SmUjoeXghWRF65s/rX4DP6Nlf3zMTMoL6KkK6kwBbs7SN0iiJIHLKK8sLOe
         gsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vXTUdauXUxQoo2TNoxao1MjabWgPfDtazwZyVjiCBLE=;
        b=VJvT/X0jlh9n+WOMNZj29spM2jDXPEgbU+X4PeCmcH2FQUzEnMn2h2U8mqtHPt5cF5
         57YBxmxwzcIqGyucr/JZJN7jskxcEGceS3XzDY96KX3zRRYKH6VVty8O3dFJYl4AnXX2
         29d270kh7MIHldHrX15+QotWBedPrcykI0RYuGhfiVQbF0l9arKG9ygRuucJqXso8G0H
         nkles0BqFM88kvDymjMvIon+mkhsZDIKGx1GkxNFAbzTd2gGxEMDfA9cCC4/77IAry1e
         PRzKbQSn8kHjzxNiqbbHU1Hr4lHIUZgbKBdLbK8ztmLCGhyZWoGjDEo0lDYdIhDfIhGe
         qe0w==
X-Gm-Message-State: AOAM531dx8n2nQ8PNaQkelZ8fCcupRIdDpgCQ8TeCLAyq0+SpAyH0mBS
        iR3K1XNZ1GXmPu+59LPJv+rAug==
X-Google-Smtp-Source: ABdhPJwTFj9xAnu4+xqWcMhF2TfUQXOxSp2q+y3x2c2Zkg2OFgJDj1XDQIN0RHeC0uQg0RuibJUYdA==
X-Received: by 2002:a17:902:8ec5:: with SMTP id x5mr29635447plo.149.1590437437509;
        Mon, 25 May 2020 13:10:37 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id v1sm13634451pjn.9.2020.05.25.13.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 13:10:37 -0700 (PDT)
Date:   Mon, 25 May 2020 14:10:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 4/5] rpmsg: update documentation
Message-ID: <20200525201035.GB9309@xps15>
References: <20200525144458.8413-1-guennadi.liakhovetski@linux.intel.com>
 <20200525144458.8413-5-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525144458.8413-5-guennadi.liakhovetski@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, May 25, 2020 at 04:44:57PM +0200, Guennadi Liakhovetski wrote:
> rpmsg_create_ept() takes struct rpmsg_channel_info chinfo as its last
> argument, not a u32 value.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>  Documentation/rpmsg.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.txt
> index 24b7a9e..4f9bc4f 100644
> --- a/Documentation/rpmsg.txt
> +++ b/Documentation/rpmsg.txt
> @@ -194,7 +194,7 @@ Returns 0 on success and an appropriate error value on failure.
>  
>    struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *rpdev,
>  		void (*cb)(struct rpmsg_channel *, void *, int, void *, u32),
> -		void *priv, u32 addr);
> +		void *priv, struct rpmsg_channel_info chinfo);

The second argument, i.e *cb is also wrong.  The first argument to the function
pointer is a struct rpmsg_device rather than a rpmsg_channel.  Please fix that
while at it by simply using "rpmsg_rx_cb_t cb", the same way it is in
linux/rpmsg.h.

Thanks,
Mathieu

>  
>  every rpmsg address in the system is bound to an rx callback (so when
>  inbound messages arrive, they are dispatched by the rpmsg bus using the
> -- 
> 1.9.3
> 
