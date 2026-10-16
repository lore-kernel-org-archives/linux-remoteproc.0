Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA292AD35
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166144; cv=none; b=kg5ErKEXmjCpjV1gZvF9hehQPKqtcBf91UpVdRqYcof0bv3pLGhJP+YKjXzWP0oClTnyfEFW1dJ8bVPl0f3Rwm6Tj3RmisoMl10MnQmRl58Vz56hme3KOn1JerPf72CCHRoHCYKbG+tzmKNWFumevOK7EpT4eTiLknwlIIa7mDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166144; c=relaxed/simple;
	bh=XovGGZDGcMTSdz8nogdvxDY0i5eeOP5V0+TcNmFECBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdAZr+yGTYtj28XzZfqTc0sliXLdk8JUduZW0/xJj3F2Mg03H3QNQn8AJ1d0S6c/9hpM35YH60lqkatBBgkocgUm1KCHTa3eHZ4T4YFtT+/v/L6+d3l9UwsJE4CU9FcgQVwQaYmPiAHKEejvBDrvNbLaHXNIwu4qidB1dcVpewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImKKOb9f; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImKKOb9f"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8256106635eso3073902a34.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166142; x=1792770942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MANMo/9EL3PurFRTyqp9fqNscO3ewlbZ43zTZIeVTEM=;
        b=ImKKOb9fW0meVxetLtUMwwSVnuorHVWX2YzrYFvZYVyRTrGML32MW6vFsZUViEhl20
         wFYDg0JqPM0srze1b5V/F0nDCe0nHnvn17RXegk0I0JwRw9HaQH1kGz03nI/RnW75UkH
         Ckv+5CXLUNCTOJ3q/ORWSDGiRRULYGwV4lz2MlXXaQjPQOY3mDRGszLGTqgTpzsCLnax
         mb/+STdlw+bzmQH+o7qFZSps47UQZPkdAKD5otyPXtg7dT5FzfcOCBApi2r9ktFQYSGG
         GI8GKSCbSgGhjCRbpVhZnC6Klk0o9l4HqYqg+iAlakjRDaCKveyLqgCjSb2VYT1q2ImA
         11Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166142; x=1792770942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MANMo/9EL3PurFRTyqp9fqNscO3ewlbZ43zTZIeVTEM=;
        b=cfpimAk8dmoJvgmv7u8gI6/pUcJM231HZM22kNI6tx7wH2uCE4TburVTmQ7yLTyM8n
         LWCXK2h6ba6by7GS470PBgLwTzRQNI8gj5WkrVwnQu1TcL4xUCBtOgs6sItSm7wqH0iG
         yziPs2hqZsMxa82QtNH09/gJp7TOnmaCNaXIEg3UZUCP0yZPNt2Kuajlg6X53DygOXXG
         1VDaZlXNkvHE3RnPTap14i9JK2F/seCHHC3821zz0IBGC2g38NRVGusCx8bkG+On9WOY
         yBWkewcEoQ9I0UnZWVbmGtjJj4izRr5VnTLLymgnMONxv700xw5/A/fX1hWOhomDLeyc
         3+dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVWCJf6DDpPiYp6ooIGTA9eBC1SiSE81a6xoaKP1JGrRii7hE5jcizqkCTfTOZ5MnxEcyqD2uYRNwnz+UtEwEE@vger.kernel.org
X-Gm-Message-State: AFq9FYJN8Qi+xhyVsyIGFF2QstDGbHoEVNI4c21kC0R1ht5uzx1Wox+b
	56YUAvU8CHBEYyzWdu9IIedBGxmXXPfX0lVdIrgT3d0hiKiTLEfTDGJrSgjGW3AmxLY=
X-Gm-Gg: AYBFou28PZIq/coVM/K9aJgtXe71m5vGFwmFiWOtyZ2ZasHLZnpzi6EM5yPab7iNhqY
	4r5VuzhkIFJjeQwA0mm+sd+mbEJZ0qmrrVIM4ExIqs35a+DT2fxEC4JDYis5EDAj+jIv/LiKCc3
	uKmYzewHzSAp037wzt/l14Ju8IvomEzM4cU39JN+lGn5eXxNcU+1OVg+ALkOCX79xdWVy7PMPxr
	G5eNuiyfAZiMx0pHmUzm0jtLQ2naUJpul3o+XfG556wh4NWGiaiBnYjtukCWVsXV7MRUm8rLtUu
	x51vAA8Et3TI5dDyNbkwfIwww1tNX7vBY9S2n6xd7/51pk1fxed6zBWi2PndeZJtqorDmCjt1Bm
	m0dJlbWfEHALQEbcEkL46cYU1OPrUC+4bh3UYN6XMvq/BJM9jIBTqZTkoRR78RtvyqQyZN1VLa4
	U8AKuZjm0LFJSmVdTszF6ZrP2Bxlfkkns5sEYi42fBQoG425d7DMauRqt02WBtA0LxZtByp6TDt
	Q==
X-Received: by 2002:a05:6830:4408:b0:81c:292f:97a3 with SMTP id 46e09a7af769-8309610badfmr21885225a34.5.1792166141529;
        Fri, 16 Oct 2026 08:55:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f284d1sm2073901a34.2.2026.10.16.08.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:55:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:55:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: core: Guard against a missing stop() in
 rproc_start()
Message-ID: <atJI-r0JBsnVfMVS@p14s>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-3-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929075453.2324597-3-hyz3367@gmail.com>

On Tue, Sep 29, 2026 at 03:54:51PM +0800, Yonghao Zhang wrote:
> When the subdevice registration fails after a successful ops->start(),
> rproc_start() unrolls with an unconditional ops->stop() call: an
> implementation without stop() turns that error path into a NULL
> dereference, and there is no other way to undo a start once the
> processor is up.
> 
> Nothing rules that implementation out.  rproc_validate() checks the
> callbacks against the state a processor registers in: start() for
> an offline one, attach() for a detached one, which never look at
> stop(); the only written rule, Documentation/staging/remoteproc.rst
> ("Every remoteproc implementation should at least provide the ->start
> and ->stop handlers"), is a should the core does not enforce.  The
> in-tree implementations all provide both, or neither when they only
> attach (commit 1168af40b1ad ("remoteproc: k3-r5: Add support for
> IPC-only mode for all R5Fs")), so none of them can reach the call
> today.
> 
> Skip the rollback call when there is no stop(): with nothing to roll
> the start back with, the processor stays running and the failure is
> reported by the boot attempt itself.
> 
> Fixes: 7bdc9650f036 ("remoteproc: Introduce subdevices")
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 123aadb467a0..19e0ea3e7240 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1336,7 +1336,10 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  stop_rproc:
> -	rproc->ops->stop(rproc);
> +	if (rproc->ops->stop)
> +		rproc->ops->stop(rproc);
> +	else
> +		dev_err(dev, "can't roll %s back: no stop()\n", rproc->name);

I don't want to clutter the function's error path.  Please move that to the
error path for rproc_start_subdevices() and call the correct "goto" based on the
validity of rproc->ops->stop.

>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> -- 
> 2.34.1
> 
