Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430104;
	b=t7n1ch43lGEdzDQgn6JIfmdds+5QIzkRWTCFbf5zl0SzZP+HDKGkaygqBsGiDra3zdqp
	 gIBMgvHcLqlfYQESS+ExvNmP9OpGrt/G4H0YKe1kp/c7ixujrhm+IZ3aoyv2MvYq2wvWN
	 hwePnKxt4p8lLpEvKEbPYuZodzQOuTKoc/QkLTbOuOsPMUV5w1cFkS9GoJ4EMOwSg4F/G
	 TqjealdFVGUOGvdpH88uavcJnjZYk4Z/LojsecfK6YYix63dSF+u6C8NN0uoxzQ5lbexP
	 jrVkgRWltI+qhhgBc9VtLiLgAMn+X9Tlm8DXVWNx4s3QkgkXRVb8oA+eFsZfyP4BUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u80h7r29Ghnr+vYGuleV7rteVTs1uqS7VM0+MTj++3g=;
	b=VpNg0Vl8FtLpoSH90A+siaWV6nNu62m47H+ZSGvLnpFM5qDhNfvc9GIi88BJqkxjTcpa
	 Bfn7rQ5SxaCgy4I1OxwDwqnlqJZgkV4fhpyHYkYCEr9xm4kb3khAH5ihUWwYgmMoo8cVt
	 2IepEawj8cnK9/ga37l1uv4ld3Xqvc2O6ZauaiowXNM6oHa/DGJtFHangJAaMiI1aVtlq
	 WBw8Ur5szHbxoeUwyxDc8eEkssQmBeo5iipaYHWVfK0W/6unKBQxp3da9XzeBgqo694LK
	 6IzGxllAs9jpWCfNeP1efCDOhXepqMnYOb6YmJmae5TwtFe5yBppTFH6RWudRZrPqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbSKHF4F;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFE606A31B
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 17:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbSKHF4F
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccca948203aso861536a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792430102; x=1793034902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u80h7r29Ghnr+vYGuleV7rteVTs1uqS7VM0+MTj++3g=;
        b=EbSKHF4FBi6Gw+HdwmCL9x60cXnlqyYitVKN4L3pyMtprMmREDDBIzBG66tMtCwYqp
         4UWLpM2JD4dQ1FMWGSXIdwqpgL/FUlAHYQsLGIVq1pqQziVAA/ZI2m10KDdiaCc8LqJk
         +OVM0KKpNMxy2FK7jibs7HzP7jivBBwgaxhGRKFb84H/YrC0iM2u4bXeWYkzuh3uPnR9
         ot38svkI9O/siFVxmp3V321s42UPEQCUqUHkf6I/kIGrZeRlifFKsBkCk7c8kLU5bsCj
         vDNMthUAa6UA5DryUOuiJjRwigqu5xiYDx6PHZc7uSxKLQ6/4pq+9fdUZ2Or28YB9gmy
         90XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430102; x=1793034902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u80h7r29Ghnr+vYGuleV7rteVTs1uqS7VM0+MTj++3g=;
        b=t22CZVrFWT5it15rGQpctnq2RWxCQuvjfYftj3RcP6+tsrdJlg7Ehe4Dhh34ljKnLf
         xEq8as2L7CDKUKpn9QpCpORKUZjMPUJqg39F5lU4B9VUIkPNGlNlWd5Nejdj+YLqbAX2
         Z5Y70FQXcUuzn+80kX+ICmSYYWBi1GPf2hwhIEwSOMEy3ytRFeMoBMhLAlQ5sAlqKll6
         QCpUzluJA55nsn6dOHHlYHAwK6iy/8oLFmbFqFK2y/sx6Q47HNnZBHhxk9ajXrTSWTkU
         PBS6SaHxHeEoRw9pUrRY7fCFIO/vB5TmP9l4/6P3kX5pP6v8BT8X5otQIGp7XAKmw9oI
         assQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiCB+y19Tm3tWofdEQiJ6F/xF5kKOc/22+FogG9mVVZ+mLboacCOJySjpRbtXpi3bh9kLkA7HCr42+U9h4IpRM@vger.kernel.org
X-Gm-Message-State: AFq9FYIFR/jMMLc+6JgcEh9dF2czgS3ut34CrOJfpNq/KL698rYrzBh7
	gnRGgpiM7bVtzztge2m+MXfw7G/6yXoB2a5+OCMToCyIM2PvBGTagk483EQKDPtwK8Q=
X-Gm-Gg: AYBFou2Y4cSmEYYKmtFtk+Q/7KWv0x/z81kt61EbgDC3k27OYLNDIOurUNvQtEwMR55
	XcYhe083FjWEIjyOwyLKgXmbiwzH/5u2hSdPGYegHokrLHnuDQcwh3EE3idFsC/Gdis9vqTyFJD
	MjpIjpSnjAcRQR+i18wZbG47yfoUnaSpcS7X5HwAQJDM9pGDzBVAv/h79eYMyV6g5iDydF6TP9q
	XQNAuOnEvqOnw9G/x1LOdtEIQvjOMjYfLi93/vFsYr9p5r0w/PkQkkNrHwSih9Bu87LsShlRsdZ
	F3IdBwtIQmHTa+gjwtzwYM6MRoM9RAsnyeN2bA3/0HDOg/DweGdYFokRYUFHwwFwz9fHEYIkkHT
	QqLMTBLZ6B2KSlBEVEzwXys5LY2449Ug1aq72trSpeJ+j8kzt9fo25dFOkKx05lG6idzV+n4o1v
	uKjNBPe2j2jywhakF2rJTNrsODc6K6dQmbB2nifT0nLVLKPJuab73A9NRrvLl2qh6y6pRKGxU=
X-Received: by 2002:a17:90b:2c90:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3acef0ff0cdmr7098929a91.46.1792430102161;
        Mon, 19 Oct 2026 10:15:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:76fe:654:667:da52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm9453824a91.1.2026.10.19.10.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:15:01 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:14:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>, arnaud.pouliquen@foss.st.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] remoteproc: core: Roll a failed attach back with
 detach() when available
Message-ID: <atZQEuXMwMpvmoBz@p14s>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-4-hyz3367@gmail.com>
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
In-Reply-To: <20260929075453.2324597-4-hyz3367@gmail.com>

@Arnaud Pouliquen - please review this patch to make sure it doesn't break
STM32.

On Tue, Sep 29, 2026 at 03:54:52PM +0800, Yonghao Zhang wrote:
> When the subdevice registration that follows ops->attach() fails,
> __rproc_attach() rolls back with an unconditional ops->stop() call.
> That is wrong on three counts.
>

It isn't wrong, simply implemented during a time where any kind of fault in the
attach()/detach() scenario called for a stop().  I would certainly appreciate a
less reproachful tone.

 
> An attach-only implementation, one without stop() such as
> commit 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only
> mode for all R5Fs"), dereferences NULL right there.  A processor that
> is being attached to was started by another entity and is not ours to
> power off: detach() is the matching undo of attach(), and stop()
> should only be used as a last resort, when there is no detach() or
> it fails.  This is reachable today: when the re-attach of an
> RPROC_FEAT_ATTACH_ON_RECOVERY processor fails (imx_rproc and
> xlnx_r5 use the feature), the unwind stops a processor which,
> per the feature's own contract, "does not need help from Linux to
> recover... Linux just needs to attach".  And the unwind leaves
> the accounting inconsistent -- no resource table bookkeeping
> is done, unlike on the rproc_stop() and __rproc_detach() paths,
> and a processor powered off through the fallback keeps its
> RPROC_DETACHED state, so the next rproc_boot() tries to attach to a
> core that is no longer running.
> 

Remove the above paragraph.

> Roll the attach back with detach() first, along with the same
> rproc_reset_rsc_table_on_detach() bookkeeping __rproc_detach() does,
> and fall back to stop() only when detach() is unavailable or failed.
> A failed resource table reset does not abort the unwind: this is an
> error path, and detaching from the remote processor, or powering it
> off as the last resort, takes precedence over the bookkeeping.  A
> successful fallback moves the processor to RPROC_OFFLINE so the next
> boot reloads firmware instead of attaching to a dead core;
> implementations with neither handler keep the processor running and
> untouched, which is all an attach-only core needs.  The rollback is
> factored into rproc_unwind_attach().
> 
> The unwind runs the same resource table resets as the detach and
> stop paths, which free clean_table and leave a cached copy of the
> installed table in rproc->cached_table.  Make rproc_attach()'s error
> cleanup, which runs right after, null clean_table after freeing it
> and release that copy along with table_ptr, or a failed attach
> double-frees clean_table and leaks the copy.
> 
> Fixes: d848a4819d85 ("remoteproc: Introducing function rproc_attach()")
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 65 ++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 19e0ea3e7240..c52212a1d180 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1348,6 +1348,59 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static int rproc_reset_rsc_table_on_detach(struct rproc *rproc);
> +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc);
> +
> +/*
> + * Undo an attach whose subdevice registration failed.  The remote
> + * processor was started by another entity and is not ours to power
> + * off, so roll back with detach() when available and fall back to
> + * stop() when there is no detach() or when it failed.  stop() is
> + * the only rollback that does not rely on the remote side.  A
> + * processor powered off through the fallback is marked RPROC_OFFLINE,
> + * so the next boot reloads firmware instead of attaching to a dead
> + * core; with neither handler there is nothing to roll back with and
> + * the processor is left running.
> + *
> + * The resource table resets are best-effort: when one fails, the
> + * unwind carries on with detach()/stop() anyway.  Unlike
> + * __rproc_detach() and rproc_stop(), which bail out before touching
> + * the processor when their reset fails, this is already an error
> + * path, and detaching the remote processor -- or, failing that,
> + * powering it off -- is the minimum it must still deliver.
> + */
> +static void rproc_unwind_attach(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	if (rproc->ops->detach) {
> +		ret = rproc_reset_rsc_table_on_detach(rproc);
> +		if (ret)
> +			dev_err(dev, "can't reset rsc table on detach: %d\n",
> +				ret);
> +
> +		ret = rproc->ops->detach(rproc);
> +		if (!ret)
> +			return;
> +
> +		dev_err(dev, "can't detach from rproc %s: %d\n",
> +			rproc->name, ret);
> +	}
> +
> +	if (rproc->ops->stop) {
> +		ret = rproc_reset_rsc_table_on_stop(rproc);
> +		if (ret)
> +			dev_err(dev, "can't reset rsc table on stop: %d\n",
> +				ret);
> +
> +		if (rproc->ops->stop(rproc))
> +			dev_err(dev, "can't stop rproc %s\n", rproc->name);
> +		else
> +			rproc->state = RPROC_OFFLINE;
> +	}
> +}


Please remove all the dev_err() above.  An error messages are already generate
in __rproc_attach() when something goes wrong.

> +
>  static int __rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
> @@ -1373,7 +1426,7 @@ static int __rproc_attach(struct rproc *rproc)
>  	if (ret) {
>  		dev_err(dev, "failed to probe subdevices for %s: %d\n",
>  			rproc->name, ret);
> -		goto stop_rproc;
> +		goto unwind_attach;
>  	}
>  
>  	rproc->state = RPROC_ATTACHED;
> @@ -1382,8 +1435,8 @@ static int __rproc_attach(struct rproc *rproc)
>  
>  	return 0;
>  
> -stop_rproc:
> -	rproc->ops->stop(rproc);
> +unwind_attach:
> +	rproc_unwind_attach(rproc);
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  out:
> @@ -1562,6 +1615,7 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
>  	 * rproc_set_rsc_table().
>  	 */
>  	kfree(rproc->clean_table);
> +	rproc->clean_table = NULL;

This change is not needed.

>  
>  	return 0;
>  }
> @@ -1597,6 +1651,7 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
>  	 * won't be needed.  Allocated in rproc_set_rsc_table().
>  	 */
>  	kfree(rproc->clean_table);
> +	rproc->clean_table = NULL;


This change is not needed.

>  
>  out:
>  	/*
> @@ -1675,6 +1730,10 @@ static int rproc_attach(struct rproc *rproc)
>  	/* release HW resources if needed */
>  	rproc_unprepare_device(rproc);
>  	kfree(rproc->clean_table);
> +	rproc->clean_table = NULL;
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;

->table_ptr doesn't need to be set to NULL.

Thanks,
Mathieu

>  disable_iommu:
>  	rproc_disable_iommu(rproc);
>  	return ret;
> -- 
> 2.34.1
> 
