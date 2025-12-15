Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC10818C2C
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Dec 2025 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765762766; cv=none; b=J8lZjg8rIXUZd4Fdhu4boktrY3QFICGvHtLlFSl+bbvKTogvkGErLetwN57E6/0QTBNPnjIS7lkuOet42Gumwstya45JoWGmIDBO8V3kzcsEK8BFMtdzz7Yov1+9NqztO/ih4dMywx8y3zS01gXE2WS6Ubyo4JtA/B49mkwNYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765762766; c=relaxed/simple;
	bh=k0AIvnDWVMG7Y4wKZy8PhAxFrYCzZJ0PZRlPyQMp2d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3p/z5U3DiDw3qsnMXRyIyWmGj2YAIkwaS9bld5ryFiLzLnsKW8J3q3jRIiLqzwJ0zxutsWtIfR9RBOuCwTm/iglNHpXwGQB3o5t3FX0n7LvNQOmpvB2s2SibzMS7pizMXDXEfhIKQNFHdrsBuRIB0D+pfu0wpaEQx5q6OUqELk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqGvJDZT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqGvJDZT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so3563555a91.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 Dec 2025 17:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765762764; x=1766367564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANBknulCzJ+NpT/RV9+tvFzXk2SLbrdyzL4bSFdcmvU=;
        b=kqGvJDZTxNqlZhVm3XoMzYF0aT4mbjfjNYu1/ZMWAg6La+VpbvyGcSU7ZENHnsJ2BR
         hPo1n4cUNXJIFKiowsXxwogTiSt/UUhwN+7Yi6yxRw6HX5kh/8j/mNZd8No250JJ7/QR
         FBDl1eZgG6FZnG+E3bZ8kVgESKnQT9EtwzeCp3S6GojrFszRx3wewHCgUKL1ZkuftbXl
         p7zO4cXGqcEaTKiPBUJcDoa53byMafJ5MsGn5qmFxUILfIfWCkbtG1S6xlhR4xu8w3rX
         3sTHuMfqcMxJ4pYAURdzvScqAvEbpjr8rlpehFxtIpl1z2SXYDo1ons25kcasdY9/ide
         LzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765762764; x=1766367564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANBknulCzJ+NpT/RV9+tvFzXk2SLbrdyzL4bSFdcmvU=;
        b=Ob+JEsx/tZ4VkxmLhhMJdAmJALANDPlk23KYSFbrzOcDwqsAWsdgHwF5n6ifWc0+Gg
         IfMQKxZdNLo/FBqg58vjVujngOcBm+OkNIZcKYk+5+WrAiD+p+uG+/MH2IKAy+2Gk1ef
         I1qSZ7NX6nuqTrQ+tnP3ppzvH1iC55LxwN9usahB/Sao2H+km1S1dxpTjUPgyzAS9VXV
         HQY9HEeYgBAVi/FuVmgZ8p5hiudMVse4/lnzMOlP1JM7PlAVgT7ETHhWTU7yai/QwFpf
         FolFWLlFzo1IN132VSAKsiTdODyDlH2zlbI40VvN2c8uAyoaF4eRtONyuMiYAw00Ycah
         ZOdA==
X-Forwarded-Encrypted: i=1; AJvYcCXxRSkL08E085rCEZ009URnppiNiRJ2Fn9N3/CQJbIWFo/PvxgJVfmwM2d3eGVgnkin5qkrblWbvqSxYhKyof12@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54csBBi/ADP62noiR8Exwc/6O7h81xb6AROay1u7Ke3HCwgTH
	TUXheythM+AyJRnfWQuepdmD20Znx5XkEPsQQ2SSAkMrT8Svwl1H9FQNstkuy0p/BxI=
X-Gm-Gg: AY/fxX53gGnYvr0e7sOv2oQuoXAgSvgVw8gkPPkINdrpPR0Yc79vRgDhRaRr4HXQQ8M
	DGxymjq8Esh9Zwsw0Ip5+wEnz6klbkGP0gpzemHU9m9dqpTxqKBWDpIGu27UeXgNAm2U1cLtB2m
	hgqJjY5ZUoeNQfwv0+RUlZkIgSl6ylKgoLk7/xIe6nePlzx2G0eLRwnEDnbayFuE9+0/QbhyzPH
	hPPtIXEIDxjXehnidqXXD7p/HNbx93o47yTGOrXWfSdU2mfEoT7aZLyC6iGlSw3lg95ZPbFIRPg
	PlS1CZQvQ0/sbD6lKAh7AFNfTqCMdRs4M9gJaeysFw3p6UNEv3/btV1WFwxHJbMvC4or0kUR773
	oNrc15W9Egd5xxQqyihjRMsYrtLhJIdY6JOmoM5OgWJF1FO6uDxwAeEUsnQVvzm8c1MeZ8E3wdA
	TK9rakfYZvFlP8vmhSlAr3ddN5xqlYqMXkY3AWSRv7pg==
X-Google-Smtp-Source: AGHT+IEEH/MPRy5s7U+kyHScGR0GHLIOXl1SxGpgweU/Mtzit1FYvEDkVU28mycvGRDH2rPMUZtm9A==
X-Received: by 2002:a17:90b:35d2:b0:34a:48ff:694 with SMTP id 98e67ed59e1d1-34abd7a4d37mr6767705a91.31.1765762764021;
        Sun, 14 Dec 2025 17:39:24 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe13f7e6sm3093132a91.0.2025.12.14.17.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 17:39:23 -0800 (PST)
Date: Sun, 14 Dec 2025 18:39:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] rpmsg: core: fix race in driver_override_show() and use
 core helper
Message-ID: <aT9mx4cd4JldZtyc@p14s>
References: <20251202174948.12693-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202174948.12693-1-hanguidong02@gmail.com>

On Wed, Dec 03, 2025 at 01:49:48AM +0800, Gui-Dong Han wrote:
> The driver_override_show function reads the driver_override string
> without holding the device_lock. However, the store function modifies
> and frees the string while holding the device_lock. This creates a race
> condition where the string can be freed by the store function while
> being read by the show function, leading to a use-after-free.
> 
> To fix this, replace the rpmsg_string_attr macro with explicit show and
> store functions. The new driver_override_store uses the standard
> driver_set_override helper. Since the introduction of
> driver_set_override, the comments in include/linux/rpmsg.h have stated
> that this helper must be used to set or clear driver_override, but the
> implementation was not updated until now.
> 
> Because driver_set_override modifies and frees the string while holding
> the device_lock, the new driver_override_show now correctly holds the
> device_lock during the read operation to prevent the race.
> 
> Additionally, since rpmsg_string_attr has only ever been used for
> driver_override, removing the macro simplifies the code.
> 
> Fixes: 39e47767ec9b ("rpmsg: Add driver_override device attribute for rpmsg_device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Thanks,
Mathieu

> ---
> I verified this with a stress test that continuously writes/reads the
> attribute. It triggered KASAN and leaked bytes like a0 f4 81 9f a3 ff ff
> (likely kernel pointers). Since driver_override is world-readable (0644),
> this allows unprivileged users to leak kernel pointers and bypass KASLR.
> Similar races were fixed in other buses (e.g., commits 9561475db680 and
> 91d44c1afc61). Currently, 9 of 11 buses handle this correctly; this patch
> fixes one of the remaining two.
> ---
>  drivers/rpmsg/rpmsg_core.c | 66 ++++++++++++++++----------------------
>  1 file changed, 27 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 5d661681a9b6..96964745065b 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -352,50 +352,38 @@ field##_show(struct device *dev,					\
>  }									\
>  static DEVICE_ATTR_RO(field);
>  
> -#define rpmsg_string_attr(field, member)				\
> -static ssize_t								\
> -field##_store(struct device *dev, struct device_attribute *attr,	\
> -	      const char *buf, size_t sz)				\
> -{									\
> -	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
> -	const char *old;						\
> -	char *new;							\
> -									\
> -	new = kstrndup(buf, sz, GFP_KERNEL);				\
> -	if (!new)							\
> -		return -ENOMEM;						\
> -	new[strcspn(new, "\n")] = '\0';					\
> -									\
> -	device_lock(dev);						\
> -	old = rpdev->member;						\
> -	if (strlen(new)) {						\
> -		rpdev->member = new;					\
> -	} else {							\
> -		kfree(new);						\
> -		rpdev->member = NULL;					\
> -	}								\
> -	device_unlock(dev);						\
> -									\
> -	kfree(old);							\
> -									\
> -	return sz;							\
> -}									\
> -static ssize_t								\
> -field##_show(struct device *dev,					\
> -	     struct device_attribute *attr, char *buf)			\
> -{									\
> -	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
> -									\
> -	return sprintf(buf, "%s\n", rpdev->member);			\
> -}									\
> -static DEVICE_ATTR_RW(field)
> -
>  /* for more info, see Documentation/ABI/testing/sysfs-bus-rpmsg */
>  rpmsg_show_attr(name, id.name, "%s\n");
>  rpmsg_show_attr(src, src, "0x%x\n");
>  rpmsg_show_attr(dst, dst, "0x%x\n");
>  rpmsg_show_attr(announce, announce ? "true" : "false", "%s\n");
> -rpmsg_string_attr(driver_override, driver_override);
> +
> +static ssize_t driver_override_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +	int ret;
> +
> +	ret = driver_set_override(dev, &rpdev->driver_override, buf, count);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t driver_override_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +	ssize_t len;
> +
> +	device_lock(dev);
> +	len = sysfs_emit(buf, "%s\n", rpdev->driver_override);
> +	device_unlock(dev);
> +	return len;
> +}
> +static DEVICE_ATTR_RW(driver_override);
>  
>  static ssize_t modalias_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
> -- 
> 2.43.0
> 
