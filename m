Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DD726982C
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869512; cv=none; b=kkN9TTqy6CeE2u8pwaPU4fkgcb1FNonodwFNwyeoGulo+OKueTi+k9JyjySbAxJH1GfYTkMAnYlObtlW0Tkflo9AC3BPGMm1aOzl/ej5Jls5lX3xioBgpksBLE8Q7bEJf1w9hpygTIi5LIkHiOmUfDq2G4BQ/GUEHHfKx5QIxmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869512; c=relaxed/simple;
	bh=ahzeuw2Fr7v2Q6H4S+tVbXo/VAJSEVqnHn8ydmBa/aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeeZmjS7aPt5MvC4lNBhG3Xa2IS4lkrVCAOGfFzI4QfijyuCaaVwlgVqTTN87L6h+fwrfwIMMpH7MSMjZWpI6HPRekO7+VXNwcPgYW6jrZndj+ax1v64lDSxISh9wlMNMXBG6GFwRBr4FCCpGhu7NXvQhfntEVDPtnsxFBg9L48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmVGIkrn; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmVGIkrn"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso2517674b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776869510; x=1777474310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbt+BBcSmg7tGy8kUDRFXyu/cUFZjBGT0zn2Cx7Dl4A=;
        b=mmVGIkrnSqCsk4pvbbf4vYCABl85xSKDXsXwh6yLjGT/D2gFxpj5bPmXv7jmwA1NH/
         ebk5wuLJiOKpspb05w1dVE/FkBGbo7d/4BUF+0E4Mia96+Kso+6WFRU4v7oJ18m8Nrou
         tSRTw3svC80GEY3ivCK+HCLnW6+dxZcWi8AEwkoDj+5kYKIaR3H1mDJqJLpGD5NIxQlE
         cOR5XN0wcLw6nFQxkmD0sRVVhdzfW8/PbJvL9Z2zuf8slAhwfPQZjkDPed5dtO3BnkqC
         fBmfUrCLzaz5/iPn6Zq3lfpdTe/pXMGhrS8DDt4IFRPxZzjGZop1KcBNLdmU42XBXE5/
         qDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869510; x=1777474310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rbt+BBcSmg7tGy8kUDRFXyu/cUFZjBGT0zn2Cx7Dl4A=;
        b=VkByK+/3foJFYdmjRuzpJrDn1QT/3I/z6mvGrssQ/9691dfYEfT0SHpdywrwN4LhWZ
         n/JWrOcABesRYwiYk+7maCI+u35wcHzn25Mg4RulGDjsOEuLBc60egojwhK+Kr2Z1You
         roPUMMkrMtn72+ln48oGhrcwqSrUrLp29UnkJAZTJaVcACkTa0IhXNrZdrPKMCMg+Hog
         T/cRMjTgZsjYVZoogC4bmDWXaT5Ww3XdVQdMpcVTqOwvoR/z0flVfgyzjmdiW+w6q4bD
         91OTWF6d4tjBVbJBFfYoJBQfS1e13ahtNj/MkYw/KXGBEj8/hDZo/GyB+qYJx8eD+A0Z
         YzCA==
X-Forwarded-Encrypted: i=1; AFNElJ+hMaMWbLD48yfDeYTkCtw2FctyKFByqm7IHhBaMXCR3Z+yy+zqpJw9554kHO8rKAvlOMHY7NISH9Cx3uajQVWA@vger.kernel.org
X-Gm-Message-State: AOJu0YzV7xEwd+3eivxnYkbF+gmH2DKu0bg2pzUFGCW1wRIF8k3sQA2z
	gJmX6nTvFR6dDKsq7Kry2IQHHiZoRYiy13ziv+L8d6yQJ2kfbzffcGxO5L5Xd3YKdXQcg66BkPN
	7tCtc
X-Gm-Gg: AeBDieuS35VfmMSoVNX2HJX1Wxx/0iBcXbgGb232Apx4mqhbuWvShbYUMwGpjD/mASr
	dj76sjphgMeL+TNL4qnDhbajwE0rc8HH14deEr/rxjcPCLjeoe2f74ABC72fX4tEaFi0a88n81D
	tEuQl3/dHdfx/0rLMLAFF/ELzltWAgB5EQqfdlRlvXkvpmywMgZmPa3osrvmwd3XwmX+/yBq41x
	pKemF4cogaWnh9gUU+H1ljbuPobxR/5z9Yi4zANFC0dv9wsY4rLmjWq1WhUPkYmEdIZKR+hk6zH
	gpwI9olEY+iKlf7lef2C49HDNxb7efZKa13BLT7764t+XjuE989xu1FEwngJS87wXKiocxs1jwA
	tOUeN924r4Ean0E3vBOrEAbCv8L/GjSTfRQ01vh2kueAFw/pGnyz2UWTPMSJIzebP86/4YWYf4k
	66rwejuB8gihMkQfDPyeZOXuq5vQbKxH45L0EJzw==
X-Received: by 2002:a05:6a00:1bc4:b0:81f:4a36:1c7c with SMTP id d2e1a72fcca58-82f8c8c5b5fmr22866132b3a.23.1776869510056;
        Wed, 22 Apr 2026 07:51:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fd65:9224:aee7:cdd9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm19470018b3a.47.2026.04.22.07.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:51:49 -0700 (PDT)
Date: Wed, 22 Apr 2026 08:51:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rpmsg: char: fix use-after-free on probe error path
Message-ID: <aejgg4J6ygbsP-kI@p14s>
References: <20260416042338.10146-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416042338.10146-1-dbgh9129@gmail.com>

Good morning,

On Thu, Apr 16, 2026 at 12:23:38AM -0400, Yuho Choi wrote:
> rpmsg_chrdev_probe() stores the newly allocated eptdev in the default
> endpoint's priv pointer before calling rpmsg_chrdev_eptdev_add(). If
> rpmsg_chrdev_eptdev_add() then fails, its error path frees eptdev while
> the default endpoint may still dispatch inbound messages through
> rpmsg_ept_cb(), leaving the callback with a dangling priv pointer.
> 
> Avoid publishing eptdev through the default endpoint until
> rpmsg_chrdev_eptdev_add() succeeds. Any message that arrives before the
> priv is published should be ignored, so make rpmsg_ept_cb() return
> success when priv is NULL.
> 
> Fixes: bc69d10665690 ("rpmsg: char: Introduce the "rpmsg-raw" channel")

The SHA should be 12 characters.

> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index ca9cf8858a5ef..549a24b70884d 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -11,6 +11,7 @@
>   * was based on TI & Google OMX rpmsg driver.
>   */
>  
> +#include "asm-generic/rwonce.h"

Why is this needed?

>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>  
>  #include <linux/cdev.h>
> @@ -104,6 +105,9 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  	struct rpmsg_eptdev *eptdev = priv;
>  	struct sk_buff *skb;
>  
> +	if (!eptdev)
> +		return 0;
> +

If this is needed, the same check is probably needed in rpmsg_ept_flow_cb().

Thanks,
Mathieu

>  	skb = alloc_skb(len, GFP_ATOMIC);
>  	if (!skb)
>  		return -ENOMEM;
> @@ -490,6 +494,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	struct rpmsg_channel_info chinfo;
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev = &rpdev->dev;
> +	int ret;
>  
>  	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>  	chinfo.src = rpdev->src;
> @@ -502,13 +507,17 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	/* Set the default_ept to the rpmsg device endpoint */
>  	eptdev->default_ept = rpdev->ept;
>  
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +
> +	if (ret)
> +		return ret;
>  	/*
>  	 * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
> -	 * Storedit in default_ept *priv field.
> +	 * Stored it in default_ept *priv field.
>  	 */
>  	eptdev->default_ept->priv = eptdev;
>  
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	return 0;
>  }
>  
>  static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> -- 
> 2.50.1 (Apple Git-155)
> 
