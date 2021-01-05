Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868D9C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jan 2021 01:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CE7922583
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jan 2021 01:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbhAEBeH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jan 2021 20:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbhAEBeD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jan 2021 20:34:03 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24771C061796
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Jan 2021 17:33:23 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id w124so34382200oia.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Jan 2021 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YjjrmI1TJBpi7Irm0qGvA6ztJhR4MpSEaSWj5uIitYo=;
        b=Di+a2AWDW7bd7YL5Yy80WByU19A7SQge1qLnYyRquxiKeEe5mhx/0UUZzRsJ4r44gn
         P9MuPLf9UJxmhScHLeMqGpCdbc92Yp1WDrpmLh9wnBVvpFa9Y9qZ4Z04g7jP8cKFQ2tA
         wxgjt0cI1B0zWKZ4fb3pYdnfYC+H1I+oR+1agtcjXXZ5LAIXiB8YLpShQgOCr/iLV0Wq
         r4hBj7NRvT3SwP5Bd6WUYxrp8BOI+mv3EOZu8Bd719jcGXTlznSKH1m0FKn0hJHSR04h
         iasIhbhKOFUzIL+w0lLiM8pDgKLPiv3WXa3sVXVgn1g+VuxXpZGu66/MAJ/I6PPIa7nf
         q0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YjjrmI1TJBpi7Irm0qGvA6ztJhR4MpSEaSWj5uIitYo=;
        b=e5UTqqhR2jdg+xAG/j1bF8/K7q6+2O6ak5uu8ME9lrx0TC3mK1hYp8kr+yu3nBENSE
         mm7/PjTkHbxg5HelDGzWnvKvkSedz74wSCZPFq5Umd+j2C81RCmObTI0ScuT9DaIXeOl
         Z757lCHlIqFqMiEdp35f540/fHh46iiNySCb/WIvn4aAoa+M6cT3q+ASsLFHqLga1uyL
         JRDkvRPZnu4x5o0rsFdNU/yS3aXC/k3mTv7yHG+awfOmtLCSTnkUmK/sQgYMpG2h8THX
         D+Vg4DOlRv9BtVRSOg32Zy1YVYans3uDd0+h7gz7Ywz9deLKTkGmoqs464m3MbjZvdz9
         0Xaw==
X-Gm-Message-State: AOAM530tZFQb7hBKAcu0Jh2Pgr5y+NjDzGQxrM2vn4agFaFw6LTcFM8b
        M1WsfRqpRvr+9fq15+JAyr38xA==
X-Google-Smtp-Source: ABdhPJxnvz9nFenxvDKifxzOuMYNP+KpJ7Ygm/gMu16A7P1BreWCnaI2rkRhKLuHaw3KqV0bXaWMPw==
X-Received: by 2002:aca:7544:: with SMTP id q65mr1170662oic.51.1609810402083;
        Mon, 04 Jan 2021 17:33:22 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n16sm13601112oov.23.2021.01.04.17.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 17:33:21 -0800 (PST)
Date:   Mon, 4 Jan 2021 19:33:19 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 04/16] rpmsg: ctrl: implement the ioctl function to
 create device
Message-ID: <X/PB3z4tMnfvzBnx@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> Implement the ioctl function that parses the list of
> rpmsg drivers registered to create an associated device.
> To be ISO user API, in a first step, the driver_override
> is only allowed for the RPMsg raw service, supported by the
> rpmsg_char driver.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 43 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 065e2e304019..8381b5b2b794 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -56,12 +56,51 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +static const char *rpmsg_ctrl_get_drv_name(u32 service)
> +{
> +	struct rpmsg_ctl_info *drv_info;
> +
> +	list_for_each_entry(drv_info, &rpmsg_drv_list, node) {
> +		if (drv_info->ctrl->service == service)
> +			return drv_info->ctrl->drv_name;
> +	}
> +
> +	return NULL;
> +}
> +
>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
>  				 unsigned long arg)
>  {
>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
> -
> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
> +	void __user *argp = (void __user *)arg;
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_endpoint_info eptinfo;
> +	struct rpmsg_device *newch;
> +
> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
> +		return -EINVAL;
> +
> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> +		return -EFAULT;
> +
> +	/*
> +	 * In a frst step only the rpmsg_raw service is supported.
> +	 * The override is foorced to RPMSG_RAW_SERVICE
> +	 */
> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
> +	if (!chinfo.driver_override)
> +		return -ENODEV;
> +
> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> +	chinfo.src = eptinfo.src;
> +	chinfo.dst = eptinfo.dst;
> +
> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);

Afaict this would create and announce and endpoint (or possibly find a
endpoint announced by the other side of the link).

In the case of the Qualcomm transports, and as been discussed to
introduce for virtio in the past, the channel actually have a state. So
opening/announcing it here means that we have no way to close and reopen
this channel later?


It would also mean that we announce to the firmware that there's an
application in Linux now ready to receive data on this channel - but
that won't be the case until someone actually open the created cdev (or
tty in your case) - which quite likely will result in data loss.

I think instead of piggybacking on the rpmsg_device we should just carry
these "raw exports to userspace" in some other construct - perhaps a
auxiliary_bus, or if we still only care for char and tty, not split them
up at all using the device model.

Regards,
Bjorn

> +	if (!newch) {
> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
> +		return -ENXIO;
> +	}
>  
>  	return 0;
>  };
> -- 
> 2.17.1
> 
