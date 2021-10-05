Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ADDC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69F8661373
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbhJEQ2G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Oct 2021 12:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhJEQ2G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Oct 2021 12:28:06 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CCFC061749
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Oct 2021 09:26:15 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id y201so14743oie.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Oct 2021 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8FXEoaPuSjmYoE44Oy8m4nN5N37CAdgGF5w9YsNL5XM=;
        b=AaD6XS/7fj5QAtYuDKc2BsZu97Uset633WpxM3qa0/m8Ces9bSTUEn7MYvS5CJpzX1
         JwybKgBe950zI6Pe9QhYWF8z76dK2imnAyroQ4OMKd+z1V4ruubXHXHAJ57iqXSDlV3V
         lc5xzevZNI4AHlZEf9F+YaBWT+QF5a7ij1QvjWWqY8wsY1rY8rTSw4kKBzY4fyqJIbQA
         oI9JgehKTy1PFikO3iQ/0WrOa/Q/2yCOIlpYkYB1ruqI1CfbX/0FC7KycJ7rkN6qgA36
         E15gVNxNY699HZn390A4/IEq+3px2ox4rlEGeD7XDjadmkEmyGqPO56U2bQ5k5LCsp4Q
         Bd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8FXEoaPuSjmYoE44Oy8m4nN5N37CAdgGF5w9YsNL5XM=;
        b=guH4j7v/Rij6h0fkt+hriHjWij4Dc8rnGvvyyzClPYgL/IrKEyviCMUsJF0o063A/q
         7xBX5RTBT+EB4X7M6RbJMSbYmXK5IXIBaFeMBbF1TlqxzU4HMQhnNv9X002A7yWYmZ/w
         jNq8d7AFbxdBQiy6DLS2zXGkjTI4aVM4oWmRNOcBUtf++FJQ6Iw7SWzIxLRRUVXxgi5W
         H1pari3VYYplYCipRnDAtNv4aCbN5Tplv9+QnPw6Ws+k0fjtwNXfh70XCUnMPZtLWMDO
         o+HZCk93tEzD83/u7YJWDadPh2xU1c1XCfalaPdf9uqLMBgGXs/fITn7UPuDbPozF8iY
         xlFA==
X-Gm-Message-State: AOAM533ZFqtq5taapB3x4raBry9aDawNz4iowP4GLeZGmEV/+u70d2z+
        oltxDWmlDqv1r4W1zYD54BRFOw==
X-Google-Smtp-Source: ABdhPJy/XeVqid/7dcxYSksdL2f1Y0ro1GG40qMnqWBRMkVeNftGqE/gyc6WmTdwdpqZYaxYQpLRhw==
X-Received: by 2002:a05:6808:178c:: with SMTP id bg12mr3429148oib.157.1633451174904;
        Tue, 05 Oct 2021 09:26:14 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id y12sm3489926otu.11.2021.10.05.09.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:26:14 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:27:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v8 1/2] rpmsg: core: add API to get MTU
Message-ID: <YVx9DG/HYCEVJ6wv@ripper>
References: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
 <20210930160520.19678-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930160520.19678-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 30 Sep 09:05 PDT 2021, Arnaud Pouliquen wrote:

> Return the rpmsg buffer MTU for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Acked-by: Suman Anna <s-anna@ti.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  include/linux/rpmsg.h            | 10 ++++++++++
>  4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 9151836190ce..fb955a79462b 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -327,6 +327,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>  
> +/**
> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> + * @ept: the rpmsg endpoint
> + *
> + * This function returns maximum buffer size available for a single message.

Nit. Can we add "outgoing" between "single" and "message" here?


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> + *
> + * Return: the maximum transmission size on success and an appropriate error
> + * value on failure.
> + */
> +
> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->get_mtu)
> +		return -ENOTSUPP;
> +
> +	return ept->ops->get_mtu(ept);
> +}
> +EXPORT_SYMBOL(rpmsg_get_mtu);
> +
>  /*
>   * match a rpmsg channel with a channel info struct.
>   * this is used to make sure we're not creating rpmsg devices for channels
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..b1245d3ed7c6 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -53,6 +53,7 @@ struct rpmsg_device_ops {
>   * @trysendto:		see @rpmsg_trysendto(), optional
>   * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>   * @poll:		see @rpmsg_poll(), optional
> + * @get_mtu:		see @rpmsg_get_mtu(), optional
>   *
>   * Indirection table for the operations that a rpmsg backend should implement.
>   * In addition to @destroy_ept, the backend must at least implement @send and
> @@ -72,6 +73,7 @@ struct rpmsg_endpoint_ops {
>  			     void *data, int len);
>  	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>  			     poll_table *wait);
> +	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
>  };
>  
>  struct device *rpmsg_find_device(struct device *parent,
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8e49a3bacfc7..05fd06fc67e9 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -149,6 +149,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>  				  int len, u32 dst);
>  static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>  					   u32 dst, void *data, int len);
> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>  static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
>  						   struct rpmsg_channel_info *chinfo);
>  
> @@ -160,6 +161,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>  	.trysend = virtio_rpmsg_trysend,
>  	.trysendto = virtio_rpmsg_trysendto,
>  	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
> +	.get_mtu = virtio_rpmsg_get_mtu,
>  };
>  
>  /**
> @@ -696,6 +698,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>  	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>  }
>  
> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	struct rpmsg_device *rpdev = ept->rpdev;
> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> +
> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +}
> +
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  			     struct rpmsg_hdr *msg, unsigned int len)
>  {
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index d97dcd049f18..990b80fb49ad 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait);
>  
> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
> +
>  #else
>  
>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> @@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	return 0;
>  }
>  
> +static inline ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return -ENXIO;
> +}
> +
>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
>  
>  /* use a macro to avoid include chaining to get THIS_MODULE */
> -- 
> 2.17.1
> 
