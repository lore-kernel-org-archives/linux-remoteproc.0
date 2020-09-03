Return-Path: <SRS0=MlSR=CM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613CCC433E9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 19:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36598208CA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 19:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVYjX9M1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgICTV3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Sep 2020 15:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbgICTV0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Sep 2020 15:21:26 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50F9C061244
        for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2020 12:21:25 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p37so2910823pgl.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2020 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q7YB49Z6FATfgU+2Nu8aPBnU00wGfHT6UiL2jY7pK04=;
        b=GVYjX9M1tBuOs/QcT2ah8LDjeouqCLclRazR42CP0YusT1VaQQ8ZnzegV8W3Uiqc7Y
         sr3YXbI6yv2Aswo/aiettmCgnEWj8EpsDQlA5v5NGmhl6qMFxf42tQM9+bHxHS8JPihf
         0f5oKMp3DJPsAkywv8A0xbdgDr687S84Tkhn5fecnwVS9o/Io9z4SYXqNWWT31PslKZx
         NaXuZ4nfCM9Ohg1a6LbXYylEwv5tQeonJIJrf8vRxIgIUaUm99LxZWqNHfVPRHCWIvv5
         PDpJubG6oA1+SSBlLJZK9/Svfqej608pm9P8kcEC+itt8S6riTnAp9Mj8hA1lccghT3a
         Y9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q7YB49Z6FATfgU+2Nu8aPBnU00wGfHT6UiL2jY7pK04=;
        b=PYRacmYS1Pougq/BFdQBCZO7Gl78nd2tok94/urzHYxyfuqyzl914UqL0Y4fKCUnod
         7JlCQ4ThH2cmXMANNhOnayHFQJVLRMvpaQOdxkDOU/AXhyI72BIfBIs7CdyEG0us0g8V
         LB50KM4z0KPZ9dqqV30RlxLgN5KiZNvh6pu9qaDKaEL9gszL/yNNhTs2xQCc5uAZUGEJ
         CK7T+cmUGQYXdIZLHF6vSDIQXYIXIVajUg8AnYnqV3tRK6hnt39YyY2w2I+1FgcC5QoO
         +KhksS4iq2q+dUIquqr1ozZ9KWZ+jY09ijT7cp4pGr8ZfEZHiSRSP5Dl5iD7O7yO5feW
         QoSg==
X-Gm-Message-State: AOAM533bcH5nnXjLEVG1DKW2YrVoOuSfIRats3u4/IMiIWWz8e8/cvWa
        nHLBtL9dAJ45saQVL04rF5Tgcg==
X-Google-Smtp-Source: ABdhPJyC+gt78TXcMnK1ouLlIEaVy9YVuaNcEg045k2jJWcUYUy/jqOvX39/hi/HVE06FpXkU1RkPA==
X-Received: by 2002:a17:902:868b:: with SMTP id g11mr5386144plo.83.1599160885258;
        Thu, 03 Sep 2020 12:21:25 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id s6sm3206785pjn.48.2020.09.03.12.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 12:21:24 -0700 (PDT)
Date:   Thu, 3 Sep 2020 13:21:22 -0600
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v6 3/4] rpmsg: update documentation
Message-ID: <20200903192122.GA333030@xps15>
References: <20200901151153.28111-1-guennadi.liakhovetski@linux.intel.com>
 <20200901151153.28111-4-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901151153.28111-4-guennadi.liakhovetski@linux.intel.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 01, 2020 at 05:11:52PM +0200, Guennadi Liakhovetski wrote:
> rpmsg_create_ept() takes struct rpmsg_channel_info chinfo as its last
> argument, not a u32 value. The first two arguments are also updated.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>  Documentation/rpmsg.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.txt
> index 24b7a9e1a5f9..1ce353cb232a 100644
> --- a/Documentation/rpmsg.txt
> +++ b/Documentation/rpmsg.txt
> @@ -192,9 +192,9 @@ Returns 0 on success and an appropriate error value on failure.
>  
>  ::
>  
> -  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *rpdev,
> -		void (*cb)(struct rpmsg_channel *, void *, int, void *, u32),
> -		void *priv, u32 addr);
> +  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
> +					  rpmsg_rx_cb_t cb, void *priv,
> +					  struct rpmsg_channel_info chinfo);
>

I added my RB tag to this patch in V3.
 
>  every rpmsg address in the system is bound to an rx callback (so when
>  inbound messages arrive, they are dispatched by the rpmsg bus using the
> -- 
> 2.28.0
> 
