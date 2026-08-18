Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA67A3D7D97
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 16:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072080; cv=pass; b=aHZKZRaDYnfHLr/KX45CQXBXoBfhWRl78IjiNeWiKB4bdmXmb0Nz7P+T+7uc/64/BSh6JA0oYsXxPNaCaD+hwM3tvBi31ExZ/IWl0iR+mTsu+PUVytgH3lwbDPVgN6jpkNKabQKkuMVvPxdn6vUA4R1K/aWB157jwBR04Yfygs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072080; c=relaxed/simple;
	bh=K6JRBFMTMMeCQjUjKz4YsqcfOU3JmzHuVBlvM0ZERJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bydzkM7KDvfy5s+y54B65uJQU5b0//XUy4hJL/w3tESHKQd3VI9WAoyL1LmQkTsyxnQbH2nvTuNeUUWrsAMSIrWhP8vCEMvAkZgugPrLBTu/QNT+nxy0w1UjgzOeWG7iRWUBPw1Ry9QSDcCAp1e6nXIPtew3UZfhEvyvuBm6wJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lMjRkV2G; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lMjRkV2G"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a18180so135590a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 09:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787072077; cv=none;
        d=google.com; s=arc-20260327;
        b=hKhPQDIHrgi2pQLPSm6U3ulTXZa0dzTu6D/fDIXC3GB2FCbTdg1Pm4fkQzwTv39LfK
         XMEOdsftUncC3mFSxAPAjmoYBRH50p6AhbwU/xm10LVj1UMuyxmTWtdwXYT6dZAuUcB1
         AezLhyqBR7CDcCVOO4Ag6QwPgCNUooovzHsJq2pqjrKjnqejzjtNvNSkzKdvGsylw75J
         HuMTT7138/uuq1pgZZeFkcBvwt3jaO1JOZpOK9I7qGjgWrf5W1dMQQAC4zgMp0D/vVMM
         m9ZbJTnLwkAE+3WlbUE+iOkXpWK01WxugFnsR2QiPl/mCigvoGGdtLg+2kXUTH9rcXTS
         2L6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zqnxS9XoHpZEQIA/IKT4Qw6OuI1D+BX+6z9DjXQWeUg=;
        fh=qZIYN/WY/dhffQP+u0lCOh3LFGbz6L1TdrpZyOTfjRM=;
        b=Lf+7PBoinCF/obi6XKeMGjhbfznv2G3N6chzCBg51OxXjplZTp5EVwWAJYGYWcly+C
         qmOAm//3zhgiy0evDFegYC5fm5YEXy+t8nHRMhSDUaNzFSF5ftTdPLYjc//c+kGYsAp2
         KtgysN7AiXRZo7mzGKctDZVgt0myBj+3rsJ/ri8BrLW5YOo5+ZzCfUXklxwLrZu4gapc
         aT061H796tHdom3DVvmYzewMeJb8C1Cmjv+XwKOtXAo7G/XXzYRxXq1lwQLeNvUGzywi
         0h10Wy08jk+n13t8N/Npj465WGQETPdIIaqCx/ymJJRaNmf3Dpxg91uYnVI8aJhZHU4M
         sRTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787072077; x=1787676877; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqnxS9XoHpZEQIA/IKT4Qw6OuI1D+BX+6z9DjXQWeUg=;
        b=lMjRkV2Gy0NCo769OJ7IHG/qlgYh4EOfWt/skdJsdwy/T0yORIcdcKuWlcsPCQ9Yaz
         hRQ1xtxWVGtAfiCZJ7f3/zi0ahdACKRwnTd3RwNxnnOnfDIgeqB5WBeYPJCj6LnftJ0f
         3e5A0q0yd5Ys48lkcgpL+6KdPkR/hF9fdeiwmYhhaapS2MDC4dp+APtPM7HiotAP+nmL
         vpx57ewoMvGdUNECkLclwco9z6OkadyhjZfMVIrYIAgP59JGBNLO50KaHXQ638Vg90ex
         8IxfV2WlHUs0V5fDKbCuFPhiGnILrm52m95w6X9Ppwqjxyju9ynUMimXT/gNegs6VWGI
         H9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787072077; x=1787676877;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zqnxS9XoHpZEQIA/IKT4Qw6OuI1D+BX+6z9DjXQWeUg=;
        b=I6iT10xstyp1Oh91pyXNkP1+DZysXu5Pta9CG/rtFVJ8+DgQojCFYoG4BMXAWM3OIe
         ehJ8ilYEe2vuFc09UlPCLJtUSck0OajkLl9eukcYEiOsIGpQztYiLnMEr5WUOvLQ1tCy
         i7E7oJhaN32LSEfHZTgflUaAdtHR+ulXaHTA4a11RMBLovOKrCb9OPWPneSquJcnaLkT
         ESW4IOX3Sd86QQu6cZ0WTJvtaFCikDNriAcGLA5Ra0MR0cgSmZYfW2AITgP4ulmpjNLa
         nWfnZmMoOeZ2oPniX4/YAEpA8n5QhnQYr6WY1+XR5Amnm4N8p/E+njiSuFIVck70ih01
         yviA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/A/CJ6w8loJZXKewwfQXwNg0QOHMs4MuSKZByrDmyLSX9NacBJ3VH6vnYREBtmEvE1VDJoRO+lcwJZu8koFTy@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsWrCyOkNzUykqooxDVUppg+KMKLkJiP7g8egDxaGBwAruIHM
	2YrrBridJ+Hd1e7STwj5gsI8P5BvvoExLmTvmIMpannWuOE7kgLSufyWaeSnDs1+UhK06KV6JQ4
	ncvTfLQfQVUFUQdfETz/9iLMWn/taOZrbow3ObpOUcuXerAcI+D1G
X-Gm-Gg: AR+sD102GONEa9ELJtRqxTazSuC7isc7KN15uzWNJCYchF5SrId5JKJQ8tq8V0DM1Sd
	pmflAQ+F/ZpfXDabL0Iclc7f8q+TPb58SMJhU3jaHSUmkFwMsOaI9WOVFBItER4o1EitKmP8O9r
	CVd8lEKrSm9dXc4xebG8Nzn4kiyuVY9tXcB+4ANOWim4GGYsooIIelDxU2fG+pLveEOxm4cS/DY
	wUIM/LWs8BjHLKB0JKP4webwQdXHxJOSoWvw1Oclh4J8zzORnazkwXvfSKpFxZ3Sw2dOxQDEJJ5
	0Gmng2nbwH8+iGoUDTYgikAab/6PunjWOlCwZZ3d3RMK0JwQUyMMQ8ORflxVRlYtVHTqBsBMNfO
	PST4=
X-Received: by 2002:a05:6402:1ccf:b0:698:9e5e:5df8 with SMTP id
 4fb4d7f45d1cf-6a38a903b19mr18652311a12.7.1787072077127; Tue, 18 Aug 2026
 09:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730052922.1610116-1-rdunlap@infradead.org>
In-Reply-To: <20260730052922.1610116-1-rdunlap@infradead.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 18 Aug 2026 10:54:25 -0600
X-Gm-Features: AcwNN1WRiHu7mLOcW9xRfRWwYQaB85hzyIV1qts_LBhRnwuiHjt6jJlCq5ufVcY
Message-ID: <CANLsYkwOOU9YC73BgzjRjELzfcS1DwOmU9++ZmorHkG-4L=ooA@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: ctrl: use kernel-doc format for ioctl macros
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jul 2026 at 23:29, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Convert the ioctl macros to kernel-doc format to avoid kernel-doc
> warnings:
>
> Warning: include/uapi/linux/rpmsg.h:26 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Instantiate a new rmpsg char device endpoint.
> Warning: include/uapi/linux/rpmsg.h:31 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Destroy a rpmsg char device endpoint created by the RPMSG_CREATE_EPT_IOCTL.
> Warning: include/uapi/linux/rpmsg.h:36 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Instantiate a new local rpmsg service device.
> Warning: include/uapi/linux/rpmsg.h:41 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Release a local rpmsg device.
> Warning: include/uapi/linux/rpmsg.h:46 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Get the flow control state of the remote rpmsg char device.
> Warning: include/uapi/linux/rpmsg.h:51 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Set the flow control state of the local rpmsg char device.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org
>

If Bjorn doesn't do so in his PR for this merge window, I'll pick this
up when rc1 comes out.

Thanks,
Mathieu

>  include/uapi/linux/rpmsg.h |   15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> --- linux-next-20260729.orig/include/uapi/linux/rpmsg.h
> +++ linux-next-20260729/include/uapi/linux/rpmsg.h
> @@ -24,32 +24,35 @@ struct rpmsg_endpoint_info {
>  };
>
>  /**
> - * Instantiate a new rmpsg char device endpoint.
> + * RPMSG_CREATE_EPT_IOCTL - Instantiate a new rmpsg char device endpoint.
>   */
>  #define RPMSG_CREATE_EPT_IOCTL _IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
>
>  /**
> - * Destroy a rpmsg char device endpoint created by the RPMSG_CREATE_EPT_IOCTL.
> + * RPMSG_DESTROY_EPT_IOCTL - Destroy a rpmsg char device endpoint created
> + * by the RPMSG_CREATE_EPT_IOCTL.
>   */
>  #define RPMSG_DESTROY_EPT_IOCTL        _IO(0xb5, 0x2)
>
>  /**
> - * Instantiate a new local rpmsg service device.
> + * RPMSG_CREATE_DEV_IOCTL - Instantiate a new local rpmsg service device.
>   */
>  #define RPMSG_CREATE_DEV_IOCTL _IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
>
>  /**
> - * Release a local rpmsg device.
> + * RPMSG_RELEASE_DEV_IOCTL - Release a local rpmsg device.
>   */
>  #define RPMSG_RELEASE_DEV_IOCTL        _IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
>
>  /**
> - * Get the flow control state of the remote rpmsg char device.
> + * RPMSG_GET_OUTGOING_FLOWCONTROL - Get the flow control state of the
> + * remote rpmsg char device.
>   */
>  #define RPMSG_GET_OUTGOING_FLOWCONTROL _IOR(0xb5, 0x5, int)
>
>  /**
> - * Set the flow control state of the local rpmsg char device.
> + * RPMSG_SET_INCOMING_FLOWCONTROL - Set the flow control state of the
> + * local rpmsg char device.
>   */
>  #define RPMSG_SET_INCOMING_FLOWCONTROL _IOR(0xb5, 0x6, int)
>
