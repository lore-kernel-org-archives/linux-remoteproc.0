Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EB91FC7CB
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Oct 2024 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010893; cv=none; b=Nuep4hPX+MZEcGYPOb6DgYQTgqobQx2+l9yL7vp+bl31j6Eyq3Z5eQz0Xnja3ErYliVp185AjX3neUPag9fNvA2fwPdiXQXgMr1ZK72lHMcY1DKYiiM41ZmYOavUf765K2He78ji9qz7ym0tLnXslLCNBAEeHo1/QT7dFCTysUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010893; c=relaxed/simple;
	bh=/Jc8uvLh1yHtx6Qpa7GDZefgH+t5Jvkba6SDmj7fFIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKVo+b2eyS+4L/ggt6D7w3M1XK3+lJLAGzX6b9jEjLnLHY1gC+NUiQNKNwgFfK15DBift64qcM5RMNO2k3alcCEkROd6Ai4vc3EbHE/iIJIx4MFEyPF5M45TPEFhUJIHkrmHiS7JGYbTTZ1PzqiUmwngQRJTTC2giwiLjybmANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9/D5LIV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9/D5LIV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ca1b6a80aso33874825ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Oct 2024 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729010891; x=1729615691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihI25Jo95pBvZkJLqX0Jc6fBbS14WZlY5IwIVqf7awk=;
        b=m9/D5LIV/YbeTllFHf4IBsSZJtfKa3l9yJvD4yYXnKm5hScPLG42JPN33B/l5Zdf0P
         w7ZB4DifSPnvQ16yY7VkIfBiJ0hWe0OHsg019kUoB8UjR5j9Q/BqmcY+5ZzDn2Kq6wrs
         Gz27JFYCCHVWnj78bRhuKuc4qpQ8wDinwVvtlOG+psL8Xw3K/Mh30zd0Z32AWRjsSLU2
         E+UJQTBxA7mHtW6FoUoXM8jasKro9tLuYXENR19yI4fknOfr6H8IanKYQlVpQ5cB45mO
         advFbchgUwbzEDU6gwWUALW8s+0U7uDNoRVrB88d5ud3YQ0CdruvskxWezSIn8ERlfBh
         /A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729010891; x=1729615691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihI25Jo95pBvZkJLqX0Jc6fBbS14WZlY5IwIVqf7awk=;
        b=hOKNOjkdSlYHfT9688+13ff/es2WmMUMI3c56DIVIvGz9l+7B55eZbLpIWWTDK7s+P
         ZymxBL8PteSQcSVuM9mb1eidwJDacPu2K9+nwUEXPi732I9EsBgNRLUG7jyvF7SLYYl1
         INM2YkO50psOmlvtD6XygwAJcUfTttrlFuwh2HZA7hIELKHfD9gtvMVhoQ4DkPxQcf2W
         nxJ6FkoM5/VZEtLfP5dUQZ882xgqEgjTUr3i69e3umki+WAiMbIIIavfu11/LK/f8YSf
         VRi26NKCC5oVdvgZbDD0x7cNilzDeiijPWmLJV7YFsaura6YNICqQbjVugm+ab+ui4EJ
         zugg==
X-Gm-Message-State: AOJu0YxMhBPxlCKHXxTqWjGHGVL6GEVgt0JpZ5dauS+PiQLeCYkpXGtY
	oZ5sVWwIla0JwgVAqGfcCLLrWoBzTages/MpjVGJn0RzmiHnDJ7Xf9PIyigcED4=
X-Google-Smtp-Source: AGHT+IH7nqrjmNQoECCe3KKhqSZv+vi5izhEjiijtArvlkP/GK5rigzGBG9sRCIvmLdogJuWgQ2ccw==
X-Received: by 2002:a17:902:d48b:b0:20b:7210:5859 with SMTP id d9443c01a7336-20cbb240b1bmr173955925ad.38.1729010891503;
        Tue, 15 Oct 2024 09:48:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3f26:e29e:2634:fca0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805ca55sm14105185ad.261.2024.10.15.09.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 09:48:10 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:48:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, upstream+rproc@sigma-star.at, ohad@wizery.com,
	s-anna@ti.com, t-kristo@ti.com
Subject: Re: [PATCH] rpmsg_ns: Work around TI non-standard message
Message-ID: <Zw6cyFirqQ6Esr+0@p14s>
References: <20241011123922.23135-1-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011123922.23135-1-richard@nod.at>

Good morning Richard,

On Fri, Oct 11, 2024 at 02:39:22PM +0200, Richard Weinberger wrote:
> Texas Instruments ships a patch in their vendor kernels,
> which adds a new NS message that includes a description field.
> While TI is free to do whatever they want in their copy of the kernel,
> it becomes a mess when people switch to a mainline kernel and want
> to use their existing DSP programs with it.

I suspect there is a lot more things to change when going from downstream to a
mainline kernel.  

> 
> To make it easier to migrate to a mainline kernel,
> let's make the kernel aware of their non-standard extension but
> briefly ignore the description field.

In my opinion the real fix here is to get TI to use the standard message
announcement structure.  The ->desc field doesn't seem to be that useful since
it gets discarted.

Thanks,
Mathieu

> 
> [0] https://patchwork.kernel.org/project/linux-remoteproc/patch/20190815231448.10100-1-s-anna@ti.com/
> [1] https://stash.phytec.com/projects/PUB/repos/linux-phytec-ti/commits/aeded1f439effc84aa9f4e341a6e92ce1844ab98#drivers/rpmsg/virtio_rpmsg_bus.c
> 
> Cc: ohad@wizery.com
> Cc: s-anna@ti.com
> Cc: t-kristo@ti.com
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> FWIW, this is a forward port of a patch I'm using on v6.6.
> 
> Thanks,
> //richard
> ---
>  drivers/rpmsg/rpmsg_ns.c | 30 ++++++++++++++++++++++--------
>  include/linux/rpmsg/ns.h |  8 ++++++++
>  2 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index bde8c8d433e0a..2fb3721eb0141 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -31,10 +31,11 @@ EXPORT_SYMBOL(rpmsg_ns_register_device);
>  static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  		       void *priv, u32 src)
>  {
> -	struct rpmsg_ns_msg *msg = data;
>  	struct rpmsg_device *newch;
>  	struct rpmsg_channel_info chinfo;
>  	struct device *dev = rpdev->dev.parent;
> +	__rpmsg32 ns_addr, ns_flags;
> +	char *ns_name;
>  	int ret;
>  
>  #if defined(CONFIG_DYNAMIC_DEBUG)
> @@ -42,23 +43,36 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  			 data, len, true);
>  #endif
>  
> -	if (len != sizeof(*msg)) {
> +	if (len == sizeof(struct rpmsg_ns_msg)) {
> +		struct rpmsg_ns_msg *msg = data;
> +
> +		ns_addr = msg->addr;
> +		ns_flags = msg->flags;
> +		ns_name = msg->name;
> +	} else if (len == sizeof(struct __rpmsg_ns_msg_ti)) {
> +		struct __rpmsg_ns_msg_ti *msg = data;
> +
> +		ns_addr = msg->addr;
> +		ns_flags = msg->flags;
> +		ns_name = msg->name;
> +		dev_warn(dev, "non-standard ns msg found\n");
> +	} else {
>  		dev_err(dev, "malformed ns msg (%d)\n", len);
>  		return -EINVAL;
>  	}
>  
>  	/* don't trust the remote processor for null terminating the name */
> -	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> +	ns_name[RPMSG_NAME_SIZE - 1] = '\0';
>  
> -	strscpy_pad(chinfo.name, msg->name, sizeof(chinfo.name));
> +	strscpy_pad(chinfo.name, ns_name, sizeof(chinfo.name));
>  	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
> +	chinfo.dst = rpmsg32_to_cpu(rpdev, ns_addr);
>  
>  	dev_info(dev, "%sing channel %s addr 0x%x\n",
> -		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
> -		 "destroy" : "creat", msg->name, chinfo.dst);
> +		 rpmsg32_to_cpu(rpdev, ns_flags) & RPMSG_NS_DESTROY ?
> +		 "destroy" : "creat", ns_name, chinfo.dst);
>  
> -	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
> +	if (rpmsg32_to_cpu(rpdev, ns_flags) & RPMSG_NS_DESTROY) {
>  		ret = rpmsg_release_channel(rpdev, &chinfo);
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
> index a7804edd6d58f..60fca84ad4cea 100644
> --- a/include/linux/rpmsg/ns.h
> +++ b/include/linux/rpmsg/ns.h
> @@ -26,6 +26,14 @@ struct rpmsg_ns_msg {
>  	__rpmsg32 flags;
>  } __packed;
>  
> +/* Non-standard extended ns message by Texas Instruments */
> +struct __rpmsg_ns_msg_ti {
> +	char name[RPMSG_NAME_SIZE];
> +	char desc[RPMSG_NAME_SIZE]; /* ignored */
> +	u32 addr;
> +	u32 flags;
> +} __packed;
> +
>  /**
>   * enum rpmsg_ns_flags - dynamic name service announcement flags
>   *
> -- 
> 2.35.3
> 
