Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479F0C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Sep 2021 21:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B0206135F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Sep 2021 21:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242927AbhI1Vfi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Sep 2021 17:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242917AbhI1Vfh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Sep 2021 17:35:37 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E65C06161C
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Sep 2021 14:33:58 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso218442otb.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Sep 2021 14:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x0j16BBvqxXG+KYJUkAYzRaWwxrrN/feAhDVtADRmrQ=;
        b=dK2ys5OM2DozYPjmO+MJwEhKeoGMx5Eg+pWLrOzD9NWkGrdiqUXfcpubXs12crSqWm
         MOojC5w0nDgndZ7mtlK67E0g+RsHAEXAuVZOGGoyvO6tHyFKlDpzppCA6Io8IXqHu2gX
         STNHhmyNGmFz0aZjMQECxDrxxq4MyhnaBVVIejbhEkE4Mp21mHzcJSUxfiZmQZZsj6Yy
         XJ6h8jpz2bf9ZP2ab8ZCs674NNC0lP3EuUwuZvlIEo1Yy2RenjPizt0ap7OUqI++w9vZ
         SlFfGjRznEvjJWYhs9yc5cXpJYq2PhKGdlionjwS2ogUlzCyl5GVP9ykeb/JzLQWKBR/
         DZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x0j16BBvqxXG+KYJUkAYzRaWwxrrN/feAhDVtADRmrQ=;
        b=jaTRPFH1IfCpTTMvrUzx0cg5iey7NG1zg15WxEp8ITiEGbsgyGv31CWBdcwaEo0FNv
         n/QQBvOpIi5Sq30tSMkOvu2XNwQroQ7Frj/ilusJE5aMKQeL/v8cmRaKcJ2wjATDkm7G
         +WhE67ZaY05+7qAeUJSkHrX46c85wrTufKJeN3vJo7tBh3CLjTszHCA5PKaNTIEN3xaO
         pypEMDgASXbMiRtMSf+RQuPlTXsNqN9YC9TJ7qwiCVV6TG44h6oyuqWWuH3cQzMcsaBf
         EgmpvWp/WVZqhXBXTHlEAYhWcY8jRhkkFj86sNl2q+Aiw97/7NIiPg9X3iP+6JfvueXD
         fJPg==
X-Gm-Message-State: AOAM530CoRA6AzR6UgHuem0JlYRZQNVHq/qt+NgrxwHTiVeM7ra2UUxy
        y4gAD2dP8EsIyJPYx5kO9BCLbg==
X-Google-Smtp-Source: ABdhPJxoVraG0TfAlcXuHZ3rh8f4xpaUbnHCReaZKkKlwqFDy5QUmzAZPi0J35hqTuGq2klHPSYHYw==
X-Received: by 2002:a9d:7284:: with SMTP id t4mr7084188otj.285.1632864837366;
        Tue, 28 Sep 2021 14:33:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s24sm61536otp.36.2021.09.28.14.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 14:33:56 -0700 (PDT)
Date:   Tue, 28 Sep 2021 16:33:55 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alexandru Ardelean <ardeleanalex@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: use dev_warn_ratelimited for
 msg with no recipient
Message-ID: <YVOKQwGj5/jR8Q5H@builder.lan>
References: <20210928132902.1594277-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928132902.1594277-1-aardelean@deviqon.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 28 Sep 08:29 CDT 2021, Alexandru Ardelean wrote:

> From: Alexandru Ardelean <ardeleanalex@gmail.com>
> 
> Even though it may be user-space's fault for this error (some application
> terminated or crashed without cleaning up it's endpoint), the rpmsg
> communication should not overflow the syslog with too many messages.
> 
> A dev_warn_ratelimited() seems like a good alternative in case this can
> occur.
> 

Is there anything a user could/should do when they see this entry in
their log?

It doesn't look very actionable to me, should we perhaps degrade it
further to just a dev_dbg()?

Regards,
Bjorn

> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8e49a3bacfc7..546f0fb66f1d 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -749,7 +749,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  		/* farewell, ept, we don't need you anymore */
>  		kref_put(&ept->refcount, __ept_release);
>  	} else
> -		dev_warn(dev, "msg received with no recipient\n");
> +		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>  
>  	/* publish the real size of the buffer */
>  	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> -- 
> 2.31.1
> 
