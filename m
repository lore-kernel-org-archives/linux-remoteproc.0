Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015CBC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 23:41:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E01AD60FC3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 23:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243983AbhJHXnT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 19:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244046AbhJHXnN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 19:43:13 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EDCC061765
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 16:41:17 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so13580181otj.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E2HRXF4ISVU2+cymW013Lc9bdY2GyNOKabizpiOqGQY=;
        b=nZGBkZgqbaOZWKC81X/38uDT/zKLALPhkwxZIS/ruJkI+DpGMOkOJYJbU4QEJue47Q
         WKXE+3iF+oyuMn7De5rw+x4XGSjsIV4eEm5WDXTd+lwnUCyyNKHD77lhBjxDHcEgfA70
         s/GEj7NCSJw/bcZPaVcqjfgeaM07NOIGUUdbsQ1eSB+OGwgqX031BwWFdX7AYovBfhUf
         VxohewkMyZjaVQ0NZf8QIQjTESt8c2SeeUfcRp/Q1yxxqMHzSY6YbLC53b7rZRc05Onb
         FMiYxCKyC7PLT8onmNnClHi6MUnamkUNAfETl4rqFJLPhAaCGonmSVh4wVdygxtM3GH9
         zBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E2HRXF4ISVU2+cymW013Lc9bdY2GyNOKabizpiOqGQY=;
        b=hTofZPXMldJkTuzaiT3G8wigcVGcQM5lqx7/+vah8knLbDIkx74hq72VJgU0v26MD1
         H9+nJ5/pNcrJDF3dM/QblCPIGie4XEcVA/TGvhlh3H1yUQKsHpguwqm54/0BPScy4KWV
         GS86vfQHutl73LAfmsmh2vMQ7g7Gf8tgkV3+A0r8Sj/Cx/vd1ke9OxijUAsjH7MikXNr
         OAT1PEuhQfwCpO4ebFXx4l1MqfwS3hFOIUo4Rl68uFui4bofs53vroaJr6pWcu+AB4MU
         GAck6ohYFNYqpolr7J4s/MQLG9USY5lUUTQN07B3ANsg+l2QmVYduFreoc1ZUJtTRYPZ
         CTsg==
X-Gm-Message-State: AOAM5309dCmVRdCJB4vZCpG4fDHUtJtzr4MpcA9aeerO18r0+GNvUBxj
        RgP1kKGD44W5DW4Ne0fluIrA5g==
X-Google-Smtp-Source: ABdhPJw1fJpx6ds2gCEuhqVhet8I9m53n9mue5tu41mUvYXtKQBkxf84KQuRooQD3XAXRAZX9Q0puA==
X-Received: by 2002:a9d:64c:: with SMTP id 70mr10690738otn.59.1633736475832;
        Fri, 08 Oct 2021 16:41:15 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l25sm145046oot.36.2021.10.08.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 16:41:15 -0700 (PDT)
Date:   Fri, 8 Oct 2021 16:42:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v4 3/4] rpmsg: char: Add possibility to use default
 endpoint of the rpmsg device.
Message-ID: <YWDXfeR79u5QQvk3@ripper>
References: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
 <20210712131900.24752-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712131900.24752-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 12 Jul 06:18 PDT 2021, Arnaud Pouliquen wrote:

> Current implementation create/destroy a new endpoint on each
> rpmsg_eptdev_open/rpmsg_eptdev_release calls.
> 
> For a rpmsg device created by the NS announcement mechanism we need to
> use a unique static endpoint that is the default rpmsg device endpoint
> associated to the channel.
> 

Why do you need this endpoint associated with the channel? Afaict the
read/write operations still operate on eptdev->ept, so who does use the
default endpoint for the device?

> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg channel device will require a default endpoint to
> communicate to the remote processor.
> 
> Add the static_ept field in rpmsg_eptdev structure. This boolean
> determines the behavior on rpmsg_eptdev_open and rpmsg_eptdev_release call.
> 
> - If static_ept == false:
>   Use the legacy behavior by creating a new endpoint each time
>   rpmsg_eptdev_open is called and release it when rpmsg_eptdev_release
>   is called on /dev/rpmsgX device open/close.
> 
> - If static_ept == true:
>   use the rpmsg device default endpoint for the communication.
> - Address the update of _rpmsg_chrdev_eptdev_create in e separate patch for readability.
> 
> Add protection in rpmsg_eptdev_ioctl to prevent to destroy a default endpoint.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Julien Massot <julien.massot@iot.bzh>
> ---
>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 50b7d4b00175..bd728d90ba4c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -45,6 +45,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
>   * @queue_lock:	synchronization of @queue operations
>   * @queue:	incoming message queue
>   * @readq:	wait object for incoming queue
> + * @static_ept: specify if the endpoint has to be created at each device opening or
> + *              if the default endpoint should be used.
>   */
>  struct rpmsg_eptdev {
>  	struct device dev;
> @@ -59,6 +61,8 @@ struct rpmsg_eptdev {
>  	spinlock_t queue_lock;
>  	struct sk_buff_head queue;
>  	wait_queue_head_t readq;
> +
> +	bool static_ept;

I think you can skip rpmsg_create_default_ept() if you just make this
struct rpmsg_endpoint *.

>  };
>  
>  int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> @@ -116,7 +120,15 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  
>  	get_device(dev);
>  
> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +	/*
> +	 * If the static_ept is set to true, the rpmsg device default endpoint is used.
> +	 * Else a new endpoint is created on open that will be destroyed on release.
> +	 */
> +	if (eptdev->static_ept)
> +		ept = rpdev->ept;

This would be:
	if (eptdev->static_ept)
		ept = eptdev->static_ept;

> +	else
> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +
>  	if (!ept) {
>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>  		put_device(dev);
> @@ -137,7 +149,8 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>  	/* Close the endpoint, if it's not already destroyed by the parent */
>  	mutex_lock(&eptdev->ept_lock);
>  	if (eptdev->ept) {
> -		rpmsg_destroy_ept(eptdev->ept);
> +		if (!eptdev->static_ept)
> +			rpmsg_destroy_ept(eptdev->ept);
>  		eptdev->ept = NULL;
>  	}
>  	mutex_unlock(&eptdev->ept_lock);
> @@ -264,6 +277,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>  		return -EINVAL;
>  
> +	/* Don't allow to destroy a default endpoint. */
> +	if (eptdev->ept == eptdev->rpdev->ept)

And this would be if:
	if (eptdev->static_ept)
		return -EPERM;

Wouldn't -EINVAL or something be better than -EPERM when you try to
destroy one of these endpoints?

It's not that we don't have permission, it's that it's not a valid
operation on this object.

Regards,
Bjorn

> +		return -EPERM;
> +
>  	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
>  }
>  
> -- 
> 2.17.1
> 
