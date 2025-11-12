Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606D3346789
	for <linux-remoteproc@vger.kernel.org>; Wed, 12 Nov 2025 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962765; cv=none; b=DXiJ7+3m1vHuom4XcphowZsXvVQLCsbsd1I7D7CIw+COosx/2UOvcGNGqYQmlY5Idya0ikZRWX3P6YQMaYpHJSaFO6l9ArMlrB2z1fOi3vgN/Sgxc7ulxGFIlgkz+bl9MrGCR1T9DO51d6DwP/Q/oCFTwKgx5cOlhM74Yxikk+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962765; c=relaxed/simple;
	bh=eBNTN7kVD8if4ldOeG2kBLND2Z2wLJNhkZwt7yOUkG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTTfyLHbv67DE3iY2upsD+h/jw99ihbcKuT5JBHtlel1K0DdL736cH8goCIJ5tOSrbS5sR7MVLRvgbn71GIIQEnc5C8RaGCLUzAh1aI9FVZOKIrvS7OSm3w9CXoJ8c6YWd92pFIlEXW4SQAPhfU+TtJJI/4XgoXPZHg1g4v4CHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsXGwGZP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsXGwGZP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so1571565a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Nov 2025 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762962762; x=1763567562; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zkQpldxnQt7o9NuQOm3l4R5lL4sGYJLefaN7EhOn7M8=;
        b=gsXGwGZPJgoWlZpWGB8EjpeM0a1fm901YU9Om5gIs1o3yulP7KLx1zmvWR8c8NM30d
         FGlO+FStnBjMkPqt8Pxg3vp0GHih41BuJASwE5spmrmH8mj+2vOQTjs3VwHfXUt1w6pg
         Rfeuav5Hw6cdrMTLjk8OyXAxLLefWRW8eIPjjPOBPuXUcuxn7nnn0sPjtg6sxOsBYMn5
         20nUbKnJtOiei3W+4UZMnJdsMgteSzu0wT3bN6iIvMLY6DBLE+p1obT/BI7Cmcnj8Ct7
         qXTu4fzLe4YTOXBKOk3mrTwtc92VboISWhm33VWzVkt8LHazW0aSz1yxxc2vSvbG2SPZ
         Kd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962762; x=1763567562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkQpldxnQt7o9NuQOm3l4R5lL4sGYJLefaN7EhOn7M8=;
        b=Sw9vn5hX+9RA5xGMCEecbbYdvNHTrj7U/heUWGePnmwe46yocqsAf0mvlqqJNmCKFT
         +lXZr+5RavH1/ATASQwkjqQ4gRAWdiDh/AmluHIjOPb9Tq1ySZPzt1+7C1wSC3O68ksB
         ABkC70vDycNUuDkQNlQRdHhbH1GaFZXeyAjQrVYD3h1obv/vTzZAAhmkDRBwWUAEJLvU
         7ZY17iOTv9cPYEeM6bvQLKb1827I6fjDWTn+Zllaahwm1/pKj1lcrWMUArKDOTH7KUA/
         gVV8npgjAKySGn2tLmwkjS1C3R/t0M/x6F0sBzI1S54C21JOzH3o6ebhOPdPLuBZaC1+
         w4XA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Bm4pNFDYDBKzDWYfCy1SNoBhQnxLAKTBomshLbHEk/8u3/RK7KPcepHA0mUCoPS7Vigcjs83l7M6rQyAVK55@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBV7yppgRACzKJlKpps1q4ois05qQ67zMjuzWAk/Frv7WBMgk
	UUQJj9CjFe4bPib90NiksX5i3/uCkHdFRd7VyTSQ7kbtpNt9TzhNGFCUq/gouK+dd410btwNft9
	I7Cj9pG4phESt6TENmatgYXK6PV3wyRrURvZHor2Eug==
X-Gm-Gg: ASbGncvimZygtdv2mVM8l5GbzJuD51p1XCwO0TSmKJHXQbi8dtpBHOi7hK5Bumo9so6
	jGmiOHqiatHS0jQbmIaBUVlsQbc4EL4w2HZabpaRgvkC8KKLj1u+X3u2YEX2KaPl3deAtlZCKsk
	lIMm2xyCb5z9Z3ZI0RiiR7IekCGRYhuF12To7bl0BpQADBYDjU2I6AnSxbB+/emmUneK6/jJsi9
	ch5PA9D2B4OLs0E7bi+pzHZzplnzHDHapck3++nNVjrxIHIvLSYRV6sz0JBugXScYLmzu44lMdn
	v/2I84+sA6fwr9IlrW8=
X-Google-Smtp-Source: AGHT+IH7HJeViQ7kIBpaLTTgqp5Ytv3ncug+09D0vgvjthq8GQE0yiNgo5FDY8yMILoHnsk/S0XOMguiI4hDseW9TUI=
X-Received: by 2002:a05:6402:2707:b0:641:9aac:e4a9 with SMTP id
 4fb4d7f45d1cf-6431a4b7687mr3123191a12.15.1762962761633; Wed, 12 Nov 2025
 07:52:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112150108.49017-1-dawei.li@linux.dev>
In-Reply-To: <20251112150108.49017-1-dawei.li@linux.dev>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 12 Nov 2025 08:52:30 -0700
X-Gm-Features: AWmQ_bm9aDl1pQBX-LxpU4Y9ovVVtqN-LgWlcWYuge4gqh557J97f-E3xwBbHhk
Message-ID: <CANLsYkwfthuOQTCdgU2r6wXjYMeM1fGjvgr1TB1-TFpUXFBLOQ@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: char: Fix UAF and memory leak
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Nov 2025 at 08:01, Dawei Li <dawei.li@linux.dev> wrote:
>
> Potential UAF and memory leak exsit in exception handling paths for
> rpmsg_anonymous_eptdev_create(), fix them.
>
> While at it, rework the error handling of rpmsg_eptdev_add() and its
> callers, following rule of "release resource where it's allocated".
>

Please split this patch in two parts.

Thanks,
Mathieu

> Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
>
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
> Change for v2:
> - Add put_device() when __rpmsg_eptdev_open() failed.
>
> Link to v1:
> https://lore.kernel.org/all/20251112142813.33708-1-dawei.li@linux.dev/
> ---
>  drivers/rpmsg/rpmsg_char.c | 61 +++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 34b35ea74aab..92c176e9b0e4 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -460,44 +460,34 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>
>         eptdev->chinfo = chinfo;
>
> -       if (cdev) {
> -               ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> -               if (ret < 0)
> -                       goto free_eptdev;
> -
> -               dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -       }
> -
>         /* Anonymous inode device still need device name for dev_err() and friends */
>         ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>         if (ret < 0)
> -               goto free_minor_ida;
> +               return ret;
>         dev->id = ret;
>         dev_set_name(dev, "rpmsg%d", ret);
>
> -       ret = 0;
> -
>         if (cdev) {
> +               ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> +               if (ret < 0) {
> +                       ida_free(&rpmsg_ept_ida, dev->id);
> +                       return ret;
> +               }
> +
> +               dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +
>                 ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> -               if (ret)
> -                       goto free_ept_ida;
> +               if (ret) {
> +                       ida_free(&rpmsg_ept_ida, dev->id);
> +                       ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> +                       return ret;
> +               }
>         }
>
>         /* We can now rely on the release function for cleanup */
>         dev->release = rpmsg_eptdev_release_device;
>
> -       return ret;
> -
> -free_ept_ida:
> -       ida_free(&rpmsg_ept_ida, dev->id);
> -free_minor_ida:
> -       if (cdev)
> -               ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> -free_eptdev:
> -       put_device(dev);
> -       kfree(eptdev);
> -
> -       return ret;
> +       return 0;
>  }
>
>  static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> @@ -509,12 +499,17 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>                                struct rpmsg_channel_info chinfo)
>  {
>         struct rpmsg_eptdev *eptdev;
> +       int ret;
>
>         eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, parent);
>         if (IS_ERR(eptdev))
>                 return PTR_ERR(eptdev);
>
> -       return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +       ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +       if (ret)
> +               kfree(eptdev);
> +
> +       return ret;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>
> @@ -546,6 +541,11 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>         ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>         if (ret) {
>                 dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> +               /*
> +                * Avoid put_device() or WARN() will be triggered due to absence of
> +                * device::release(), refer to device_release().
> +                */
> +               kfree(eptdev);
>                 return ret;
>         }
>
> @@ -561,6 +561,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>
>         if (!ret)
>                 *pfd = fd;
> +       else
> +               put_device(&eptdev->dev);
>
>         return ret;
>  }
> @@ -571,6 +573,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>         struct rpmsg_channel_info chinfo;
>         struct rpmsg_eptdev *eptdev;
>         struct device *dev = &rpdev->dev;
> +       int ret;
>
>         memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>         chinfo.src = rpdev->src;
> @@ -589,7 +592,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>          */
>         eptdev->default_ept->priv = eptdev;
>
> -       return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +       ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +       if (ret)
> +               kfree(eptdev);
> +
> +       return ret;
>  }
>
>  static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> --
> 2.25.1
>
