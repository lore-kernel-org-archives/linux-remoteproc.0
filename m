Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723313;
	b=IayTBCyiUq+ZdSjTrAxKVhrHdUeDyM7lK2n2Bb+mo+Mi4CC/fgiYjZwWa4pB2vWdBPTz
	 SydBI9alfp/iLHaSJuwudzcP5RntOzmsVWMHyXhQdImehs3Uz/TaZ7SQ0gypYoAbhmj8H
	 mqp0DHO3qX43dmElPdFFyxsEX8krPlm2QlFAA4Y+4P8LG0/ywfH1HxuymYAPLO82q8klT
	 A1CHqJzvFMeq8IHI3hxXLoNcWm1fweL27yINKLfTsjSTsNdrpyYBiSroYN+h9QXUs5JVR
	 VArh8MUWD+XcX/DJeX0UM5a92/tlvDwNs/E85Nyt1qFvndXQeNsGGrV5Uc/hsouwMdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sdvitsaksHrr5OEOxevIRq5WqAQiArs+/fMmaTWDUU0=;
	b=txFtEWibJQTWZVZ36lnMJku5r31zMHvKwG93kPjp/akDFF3myiFGesvOFtF65BDfK6D9
	 vEOFWc/G8GKSxAjm7Ddwmb2FTN1TxiQiMYsgtAMSGXotCHwAAAl9rk4YGT/6wH+fdfExV
	 kxzdVcYBo11BFicO3/af2aivuJ7dQ3YrK3gU69VeoXh+5As+mzEgFoB9gga6ttxrn94xP
	 Ou1H5xqbkkx0rcOCFnvY9mGjOfyGijg+8iK8RdVEjeGBNgMaprkjnaCJF21cM0DsPwVqk
	 5ttZVTHU8wLh1OadfoEkWP4FXJ3+tf4SbF21z9dDhV3BaimJxdYfT+NmfG14c1L64JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZIikJLpg;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8A3606A328
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 16:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8A3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZIikJLpg
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1809393b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Nov 2026 08:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793723312; x=1794328112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdvitsaksHrr5OEOxevIRq5WqAQiArs+/fMmaTWDUU0=;
        b=ZIikJLpg1u13HyPLtDZ0CZ6tXiU09GIKtut2zOBRR/qZuQ+33p0hzi/LkRPBtn8oZV
         fcreG9b+kRq91SHrsb9uT1Sa9WiR+3mjX/nILbpuQdLZH73kkb0OKxW9BBw65CNg7PL3
         sqHKLom7ayeg/9YR/7gbM7v3PIvuRLMSAtVFrNDhBAZI7tlCwfsOv95/iezoqFzJgmvw
         NRhFuSEV5Fz5iGusZwRo9rr7uY2j852h448UaUQ5lOrVAVXFasmTxk4sD6Gr5hMxgvr7
         668k4LZpsjdYhqj/rXQwIAhc35SyooyNHXMUdf20MyElixuhHWuXeqLz7YtcOTha8yjk
         llSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723312; x=1794328112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdvitsaksHrr5OEOxevIRq5WqAQiArs+/fMmaTWDUU0=;
        b=uS2+H9/PIV6OunUsu9Gdxo/AaEtphXHsrocSWGfPEU0AwKGfkl3uKLaZvCjJOAAAw1
         8IuFIRAmip2fLysSg5k88vTABjh1RzEW9XBx//z4FB3SUX2PMQpysS4ROmcot85lVfcp
         J/v67Nzy4a+uFvkTQa3D5l+cqF5s7P0cTkTIt9pZSY3C3qTCVoNPmuQaDGuyzp1f05ON
         eIb8aWuITgnLGbMSSveQJ1a4FHMTm2FhBGMXZQyY+LvE41mgWK9Sfov0JIZd7T9z3vVf
         HQpYE4SV7NemmXnPF2INCOh61YseEe52kdVcTh2YsVDidEVW8Jd5uZJ5IkZblkfQKmOx
         5cPQ==
X-Forwarded-Encrypted: i=1; AKwUvByP0klMcIfqVPoqX09nOe04sMB2WHDCAelQEfs5TqX2oVKrnczEDKcsAvinFe+0UpE9jRhcsfW2P6PtpEzzmxRu@vger.kernel.org
X-Gm-Message-State: APuU4Z9Elerzakdd9FUcUP5ccgro760SX0SVQGSx4fPkj2UZFZ0UU/pN
	UwuszvdS/aaeS39WB3iVNUky3bdGAFQ4BVpP4s9UKtgaM1QC43MeT33fqXmtqe+oXOA=
X-Gm-Gg: AYBFou19hneNrs5/p1AvIkjL4ZFLdMZ+oEIxgZx5mykCDhrpmE12smbNY+bBk3o/rkY
	hhAt/sOH5XTqClvJmHc/wAS242JXwsFVzDDKkAP7GEqDoWlbl03a2ZYfV8PruUroyaJUzg4lqqc
	b0KvddHtzQgoavZtWqtyr6y+GEvJx6CggDqRE8S6JIVawN9YFRtcWAPD0dT6ykt18PCy/D4n1ff
	jILDpjZrF2GWvnn0pCYGQ7vP+epcFYbyjwyZ0tfgrzPk58dKop3Loe0k7fkIuiEbqzj3x8BUJCj
	6+dIQLaXLJAkBI/75h4x/O3FhIidZmbeUiJG7h7Gsz8n9Xn2Ubml8Sn1znO5tA8AyDhOPgKlc/c
	9lLMIUOQsdHjn/nb32ONOpgiBId0QZfdfHmkIlJrybbH6uyo67dUiF26eeGEqJjVULLSgDHh0mb
	Ubv5DHLAdXELyrgqYnRLccTaUTeeNF0uYbfTzmuSVK3F681vi3WQ5Li4IS2rYrPWIm7xAkNykxN
	4C+SqrT16iSJ1eL49A5nWTOXV5j+IrBth/hKpwpK7WFT/VKDyehsGiGUiT9g2sJo8rlLgYD/LH9
	nampBvAq+6H178WEf6qmYdB1UWUj7w==
X-Received: by 2002:a05:6a21:6906:b0:3e1:a57c:ab8e with SMTP id adf61e73a8af0-3e928d92fbamr11677675637.46.1793723311503;
        Tue, 03 Nov 2026 08:28:31 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9b3e:1037:bf8:ee7d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cf90sm3447777b3a.16.2026.11.03.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:28:30 -0800 (PST)
Date: Tue, 3 Nov 2026 10:28:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuqiang Sun <izaiahsun@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: Do not put the device when
 device_add() fails
Message-ID: <auoLrJPq9eRAbeQa@p14s>
References: <20261029130037.5505-1-izaiahsun@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029130037.5505-1-izaiahsun@gmail.com>

On Thu, Oct 29, 2026 at 09:00:37PM +0800, Yuqiang Sun wrote:
> When device_add() fails, rproc_add() calls put_device() and then
> removes the character device.  The reference it drops is the one
> rproc_alloc() took with device_initialize(), which belongs to the
> caller: after a failed rproc_add(), every driver frees the rproc,
> either with rproc_free() or through devm_rproc_alloc(), and both drop
> that reference again.
> 
> So the rproc is freed inside rproc_add(): by the put_device() itself,
> or, with CONFIG_REMOTEPROC_CDEV, by the cdev_del() that follows, when
> the character device drops its reference on the parent device.  The
> caller then uses the freed rproc and puts it a second time.
> 
> With one allocation failure injected into device_add() (failslab
> restricted to rproc_add) while st_fdma probes, KASAN reports:
> 
>   BUG: KASAN: slab-use-after-free in slim_clk_disable+0x38/0xf4 [st_slim_rproc]
>   Read of size 8 by task insmod/69
>   Call trace:
>    slim_clk_disable
>    st_slim_rproc_alloc
>    st_fdma_probe
>   Freed by task 69:
>    kfree
>    rproc_type_release
>    device_release
>    kobject_put
>    cdev_default_release
>    kobject_put
>    cdev_del
>    rproc_char_device_remove
>    rproc_add
>    st_slim_rproc_alloc
> 
> followed by use-after-free reports in kobject_put() and
> refcount_warn_saturate() from the rproc_free() in
> st_slim_rproc_alloc().
> 
> Remove the put_device(): the caller's rproc_free() drops the reference
> and releases the rproc, as it does for the other failures in
> rproc_add().
> 
> The problem was found with kbound, a static analysis prototype that
> checks whether callers rely on an object after a callee returns a value
> for which the callee may have released it, on v7.2.12; it is present
> in rproc-next.
> 
> Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
> warnings.  Run-tested on QEMU's arm64 virt machine (TCG) with KASAN,
> using a device tree node for an ST FDMA with a SLIM core, so that
> st_fdma_probe() reaches rproc_add() without the hardware (no clocks,
> MMIO windows only mapped), and failing each allocation in rproc_add()
> in turn with failslab: before this patch every failure in device_add()
> (9 of 9) gives the reports above; with it nothing is reported, and the
> rproc is released once, by rproc_free().  Not tested on remoteproc
> hardware.
> 
> Fixes: 7dbdb8bd7c02 ("remoteproc: core: Cleanup device in case of failure")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5 kbound
> Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b88bf179507d..e4f44a3c8b4d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2309,10 +2309,8 @@ int rproc_add(struct rproc *rproc)
>  		return ret;
>  
>  	ret = device_add(dev);
> -	if (ret < 0) {
> -		put_device(dev);

The documentation for device_add() is clear, and looking at the implementation
of device_add(), I understand why put_device() needs to be called here.

Unfortunately I do not have the time to read through and digest what Claude has
generated in the changelog.

Thanks,
Mathieu


> +	if (ret < 0)
>  		goto rproc_remove_cdev;
> -	}
>  
>  	dev_info(dev, "%s is available\n", rproc->name);
>  
> 
> base-commit: 82d0bbd67c42a44f0e18b0b7b0da0f3ace0c9527
> -- 
> 2.53.0
> 
