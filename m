Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E3EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 18:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B79DE64F65
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 18:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhCDSqn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Mar 2021 13:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234259AbhCDSqM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Mar 2021 13:46:12 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578B9C061760
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 Mar 2021 10:45:32 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id i14so7148785pjz.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Mar 2021 10:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AfzYA4MYm4o0NBs3+MWAkCalbICVDep2WzlX9v2I+F8=;
        b=cvbIZzFy4tKSoioTDRDvsehbKvgBr8wpI09lcjS9KYeFH47NqnzM5VHMUMDWwo8kK7
         Gsuuj01NzyWNLBzuRsHc9wjcr6EsLet7kLPllDQ5MIjKS0nMuafzRfFlv7w5LXctv9Us
         Qc6j8tsi0K70HjsTxooAwecliEJYSExLL5kxoesnuRqXBspMfcAEpd9l7VH6oaQqRAxE
         qheBgIn1LYST2OZkjpeMkCgPGmVcWlOcWlLsmiVRZPUeCZUXDkgwObM9hI7w3ti/A0jc
         DymPvg2DkNqp1CDNFP0jEnfN3QKOE+E+R6fXLSZvCTZHTAwRCJqD8uHBHFBeSTxm5vII
         vkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AfzYA4MYm4o0NBs3+MWAkCalbICVDep2WzlX9v2I+F8=;
        b=dHW6S4jN4LLLGIfktnwhalVQ4cuTAC1Xw5UTTJzDy64kAYxw9ImjqTAVGiusVn5TR9
         N6Xk2PS2uBuxEk6zMj6akhMD0V7Ty12u9SlouR9cBimmJ2moNMimqgZuTy8xghTmRlSN
         hCaaU4d+l1pMKqIR3j6VLe+PGpD8YO+Q2YTxwAd3qXqKARdIak5k3IK8gLIpLXhoO1DA
         6Oe2wDdx5B/8V7CD/u01cP82YWE9uCftmEawe1Fpgh9DudhjIlkqI4BFl+Xuq15jDG7i
         TWBmQ0xcZ9kg2vjAGlrqRLXInqm0py73GMjKkY6pj1DlQotFIcVE6/cMFCKnErryline
         xTLw==
X-Gm-Message-State: AOAM530FeIsb7nN6TwgKvUeOfKc5E/6mv/LtxDg8XEZ0D46RvlzeDl+c
        OQbfTbemkxDxYQKdpzme5UEv1Q==
X-Google-Smtp-Source: ABdhPJwL3EYl86r8faI7gQK72idH6mIl1cI7i334/cvnu7Kb7ruGlHdt3+2DWYhNx+nSRWRUiL6y1Q==
X-Received: by 2002:a17:902:b941:b029:e3:1628:97b7 with SMTP id h1-20020a170902b941b02900e3162897b7mr5296349pls.60.1614883531870;
        Thu, 04 Mar 2021 10:45:31 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 68sm131267pfd.75.2021.03.04.10.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 10:45:31 -0800 (PST)
Date:   Thu, 4 Mar 2021 11:45:29 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 16/16] rpmsg: char: return an error if device already
 open
Message-ID: <20210304184529.GB3854911@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-17-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-17-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 19, 2021 at 12:15:01PM +0100, Arnaud Pouliquen wrote:
> The rpmsg_create_ept function is invoked when the device is opened.
> As only one endpoint must be created per device. It is not possible to
> open the same device twice. But there is nothing to prevent multi open.

s/multi/multiple

> Return -EBUSY when device is already opened to have a generic error
> instead of relying on the back-end to potentially detect the error.
> 
> Without this patch for instance the GLINK driver return -EBUSY while
> the virtio bus return -ENOSPC.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 8d3f9d6c20ad..4cd5b79559f0 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -116,6 +116,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct device *dev = &eptdev->dev;
>  	u32 addr = eptdev->chinfo.src;
>  
> +	if (eptdev->ept)
> +		return -EBUSY;
> +

It would be nice to return the same error code regardless of the backend but at
the same time I feel like it isn't the right place to do this.  I need to think
about this one but for now we can keep it.

>  	get_device(dev);
>  
>  	/*
> -- 
> 2.17.1
> 
