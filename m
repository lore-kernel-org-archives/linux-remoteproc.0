Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892134A99DF
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Sep 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888145; cv=none; b=ZAwk39bg+WVRQdF3HIpbKtnzwbCZg0J5dlHJQairEb4NN95j/s9CNZ5rdMXQElHzr9G7yBOL8+hqlo5/1q5+EesCKFbi2oHf4Z1ccLXKXkUgcmtjYqEmvd/1NrGJQUyFmM54nLhbKMX47oDBODTS92VW8bZqzajV0kyh+U0AQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888145; c=relaxed/simple;
	bh=yNBFvkyXPc2cDeY16n1RC7KI9GdsL64r6EmDH6VG3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPrujoSGVFIXXJg/7aNAQTc5sZqb3m0azEDvMgyF/Ev/3vHmuImjaB4r0trshvgDFTEVWBMkA9JHYcrYSio1RUJTvk3RTyKwAB5MbA65cjA0FOwR0A9kao5pVZc7pD1OQzfalBVYQl5vezc2I5P0z1m32Impx0peB0yjN6Hu3uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4HsHUvo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4HsHUvo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso5072349a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Sep 2026 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788888143; x=1789492943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4QjhxezMuD4M6Sjd/ZpNTJ/GPfFmgcgxaM9H6LF+90=;
        b=o4HsHUvomsh4vBHTNEbSbfDWD7ETGq9T8gruPizY5RMKvuBAozdbSIr2uEuLUbBusJ
         xnxsHcSWh+ZMK+Uc3Bm9Ig/CRHCn25v+J7W1tsx8+EdPx7UhiRMSnMkkNMZTZ+PvpOtc
         IcXfpdBZVwYXXKabD1rAbHL6Am6R7k5MuuJiQwOsZc46R1H4Y4DNaeebEbhDfjaRrQYQ
         z0XTzTBiwgAH8g7U27Dva9zPuxtBVPbX3JDymnLDTU5KB1bwt2a+hE3alJgXyMWQcQdf
         /a6sFoXclBykcYnPt2Bf+9AK7ARrAvdjP3q/AAgPutOgMnMKSFUstuVScDNMxrRetC3b
         xtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888143; x=1789492943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4QjhxezMuD4M6Sjd/ZpNTJ/GPfFmgcgxaM9H6LF+90=;
        b=KZ9Wz6JDHeKlPjDUfvSe1U2sBgAw7WbIpk3wOIWdeApZm/4mXF181Lmn6/6tjgHzwv
         7WIMwW3l2KTEC5t7RBgzmOX5GoT/PgSV31tYW8bL/Ra/lNz3FxZXznXvSCwYd+y479r1
         h9DPMVw7gyTFdT9KCc7TSbIg5BoqcSw0FdOMFyKY+VGHxAl9E7PHtzz/YjSNprc+Z1qB
         Y2gNCRK5Bg0GRUTgSSRjZ9hUgjkIDsr+JyLs03UIA2VUUt68Xhh/y/4vojpzM81dI0nK
         /rGu+p94+a0tNo/K7z1NPPjenUT72KeSiaWuvkSb6nhr9njSb8c81MfYs02A6Kgn+MbK
         BUHg==
X-Forwarded-Encrypted: i=1; AKwUvByUy1GWRKLSNsuH9ODzd4ComqCYxvm7eIDp3H78O4iJq1hVI1XR0oto40zAIW3uynIz0bB5kvuUU7QQDF7KN/hC@vger.kernel.org
X-Gm-Message-State: AFuF++kRSfL4d5nftAr6v66wB3E/8gyxZS264iyutsBajU0wcMsRlBtu
	janD3vBJ4anvWayEe2F+JouP2AfA5SJtvf/1n53xtWyHZ/EhQv+B/x3vKwBCHDO9UCg=
X-Gm-Gg: AYBFou2RPCMD8rb/2zjfKY6O2uD6WNVccbxmK+hxUnDaBaHy+mfIRzHJBs94mysmnYV
	TB7ZtJyvU5pJfXHH9DdTvGeon0vXfdmuDYJG4vuW5LRVtkcHk+Ly/sC9UtcOy+PQB4fKNU03PB7
	vhE5J+0ceXzbgTOFj3Q9h+mKs0lEiSAPhGiz/YhtORrFRAdzFCoxmykfK7cjOUNSaTlwZgDQMyS
	jxnxDKZ0UMVYjy1uGh906CacJiEX6ok/gzcfcRL+TIYxyugEhml59QLBuuhGaUaWhs4dWKcsGc4
	H2xOINLOoZA2E9jBGsp8Q45TzKs+ym12AeV6Xf65GzqFSOWeQMGKT8iz2WHoJk1zG2SJ/Q5AKcB
	6rTUDE1EqFDcVBkqQWQei5pmIS22DuElR5n8fXQdwnlHma3cw3qmBMJjqgs138Jv3MjlCOPKnbZ
	VoFffEfYVpCOBB9VtQBKn4MWhWtolC73ZMdyerKQmpxo8F3gsxsw0z1U8pZ6tlvNOiuVRxR/7ak
	iU=
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr45236783a91.4.1788888142766;
        Tue, 08 Sep 2026 10:22:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:14af:4aef:7bc8:f5bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm26886750a91.3.2026.09.08.10.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:22:22 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:22:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: fix typo "upto" in comment
Message-ID: <aqBETPYGwsKqUmL1@p14s>
References: <20260907061927.4585-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907061927.4585-1-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 11:49:27AM +0530, Hemanth Selam wrote:
> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 1b8bb05924af..28bef36931e4 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -110,7 +110,7 @@ struct virtio_rpmsg_channel {
>  /*
>   * We're allocating buffers of 512 bytes each for communications. The
>   * number of buffers will be computed from the number of buffers supported
> - * by the vring, upto a maximum of 512 buffers (256 in each direction).
> + * by the vring, up to a maximum of 512 buffers (256 in each direction).
>   *

This has been fixed in linux-next and remoteproc/for-next.

Thanks,
Mathieu

>   * Each buffer will have 16 bytes for the msg header and 496 bytes for
>   * the payload.
> -- 
> 2.48.1
> 
