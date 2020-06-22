Return-Path: <SRS0=Lo8U=AD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB2CC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 07:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB56E25466
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 07:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qdOUsFKC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731323AbgFVH2m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Jun 2020 03:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731406AbgFVH2m (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 03:28:42 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E3CC061795
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:28:42 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e5so12259016ote.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7nHZLD631aya3wK+sGl4ncYqoLt5cpjewUpHQgLlyWc=;
        b=qdOUsFKC76Dy1LNXUAlfyTzBoOxFhGZpkTRBVdyfPxJR6q0KH06tLku6hbqCpM/BxG
         AFP7Xek4QQWzdzxdCJnUgjcVLyLQamwmpB0UYEx19YitLHcfZ8sQhmBsVPhj7qcvXPub
         kH15Mvq/rLHCtq9RF7Sot3s8FmUzg19XEEEs01DzpKEVhOk0/nObHKET6p/7lTStwJg3
         vjDV0ii0KlDJYg1SrsNP2v3A+EuR0fPUxDokrIvHj0nbCPbGYBOT8+fN+VjVX5dDszb2
         tGCfd9K7vqC9q2mr9eCNXAkt9uIpoWojhPCvPFw7BQXuyLV6HIUYjBv21ft49BJVRSqo
         Lv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7nHZLD631aya3wK+sGl4ncYqoLt5cpjewUpHQgLlyWc=;
        b=lVE4GSg0oiBf/9SQS4RD1i4qfBOPXOttWZIXgxaBzhvvWwXAst306uGwPM7hbFlvm2
         W8yy41Tb7rf8xwMrtyw8GZhx5Hmn4A76DC/bRu60iwxBI3oFfWOoN52rCE9OTpLOr2Wq
         e58GHzmxOqzNQbHf3Jw+9XMWNg45w4lTcg1XCAfzvWLqhlgbV4UuOviQdrmvtT1OqJmM
         e22PlszNQ8LedxrotVkL1B26C0wA0f8n7oWReNU4INQ1Qt4l5J8bJ4Pv/atXt0LEu82n
         wpyAElGx+U+qTLgXC5/Q8+q+ucKUsC1EkiL4WX2qRAqn5RiHtM+0MMJZyJFRs4D+jJsd
         Cfeg==
X-Gm-Message-State: AOAM5302bcDBu0a6PbJhDi+IC7Gwiyc0rNqMU7L3FQZgEqLR8Tqzooc6
        xixhBI5remqP0Xc1HnFrK5tshw==
X-Google-Smtp-Source: ABdhPJxOkoKSm9Jj38kEF/n89K55b0y4NnxiVqQHxHfaTr/OCizczBmwGqJ+z9X0TVOqT24Je6Kn9w==
X-Received: by 2002:a9d:3a24:: with SMTP id j33mr12576965otc.271.1592810921671;
        Mon, 22 Jun 2020 00:28:41 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g10sm3144225otn.34.2020.06.22.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:28:41 -0700 (PDT)
Date:   Mon, 22 Jun 2020 00:25:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, s-anna@ti.com
Subject: Re: [PATCH v4 7/9] remoteproc: Refactor function
 rproc_trigger_auto_boot()
Message-ID: <20200622072555.GI149351@builder.lan>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
 <20200601175139.22097-8-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601175139.22097-8-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 01 Jun 10:51 PDT 2020, Mathieu Poirier wrote:

> Refactor function rproc_trigger_auto_boot() to properly deal
> with scenarios where the remoteproc core needs to attach with a
> remote processor that has already been booted by an external
> entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 48ddc29814be..d32ac8f0c872 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1586,6 +1586,15 @@ static int rproc_trigger_auto_boot(struct rproc *rproc)
>  {
>  	int ret;
>  
> +	/*
> +	 * Since the remote processor is in a detached state, it has already
> +	 * been booted by another entity.  As such there is no point in waiting
> +	 * for a firmware image to be loaded, we can simply initiate the process
> +	 * of attaching to it immediately.
> +	 */
> +	if (rproc->state == RPROC_DETACHED)
> +		return rproc_boot(rproc);
> +
>  	/*
>  	 * We're initiating an asynchronous firmware loading, so we can
>  	 * be built-in kernel code, without hanging the boot process.
> -- 
> 2.20.1
> 
