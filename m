Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896804;
	b=LpMYIV8nCbBwMTrK8KxQiXrDMkScvV5Ws6525Q6GhXwYNnDZqoHcjrNhrsQ/eaD88FoQ
	 upewo7WRbVPZWliuga1hKQ8N2nQIUxqneFW4B7+2ON3QBryrb4diB5FBvVTNUuJosYDIH
	 huPf6Mdkk6jJHipU9PirKC3GnevpWILw/99Xe1N4YfK+nA5ImHuog9Gu9SMKdVPyWd1bM
	 Tgw+lB8aFv7D/B3jLiia8qpL41mHeIBWzK5ER0ZMmFOimRuDsI6Gn6vS7ID7qGDe1kR+s
	 6jjZjkb9Jg+I/eC9JigGTdCDr6cP7pR/sEmFrONp1We9I7Omire+8uz/SaxK7zsR/ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OHxjdRTl2ayBechFrqmEx31ZUG4z0ezErTIz2onp4OM=;
	b=z7uYLcjvHCkVBVp15orVPpvCSqJD42t5m7gMsiCSE8khRbS0KY8gHk21RoQ4FCjk9zGL
	 qQaB55TQzpAP/NJgbk6xhDuTAwCpGUqBGaRRqLKEzai4ZEKe+mW/CxCh8l7SJzsOySwUm
	 V6c/jomueblAaPdxMe0f0LTNcUw3VIO6UK6muVJCgByRXsdrZB4kEXNXp13uZ+QZx0T+h
	 AFulyOCfcnKjY7vBGZE+jjCxlvVxQHLG4Httn/DSwL3r2D7Uoz3yaDPGP8e61VlTEJgD+
	 dZXH1MYWsk+O/+oJOR8a1uvEJXAiItLqMF/ayx5PV1DOnmMAj5YgdWUSOiTpTnPPjXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RMRGUHJw;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B7606D827
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 16:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D2B7606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RMRGUHJw
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0960fdde9so1110826a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793896803; x=1794501603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHxjdRTl2ayBechFrqmEx31ZUG4z0ezErTIz2onp4OM=;
        b=RMRGUHJwuly7k/nYdMK/tDheHbVep575I/d+FuUvw1H+/Ls6BRh3jvpn67XXRYKtAm
         AFu1oejlF4zzXVFmF8aW+0gU9JvB1xu3exO3RcmSCXtEyAyPdHYYzDd3IslRo094m4vS
         NUY4Kbxmhmq9HOMcyzwruVY1vMphvYFvMdW0PvkcSX7m7tdaD1hItNYdZMBrHabyUnV5
         BmTucVNDitms2kR605P2eLkJlL40xPFBp+SlBoD05fxyoLmktnZEyQlN7q6bJyxMaX38
         +FPQGs1KIMnkf+wnJp43WWjNixB8CI7nW8oIoNXCFE4n+DmKHzTJUPKS+FYgkb3HAuOK
         21VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896803; x=1794501603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHxjdRTl2ayBechFrqmEx31ZUG4z0ezErTIz2onp4OM=;
        b=a3j59XdaO6I8t4Icz5hP4W/yPuGuIm3T+B5RrRUqQgITA/+DF25V8Zf7SlHE/hMHcW
         /joW5FvodxP2jtrqHukQfrBTRdkHoNkO/k5tAZ8gw6DfkjZzyXIPXOUTTMpxE2DbxCJO
         bCCvR40SmTgjmtmhDoyemtE+ffOjSTut/4wdF8M03qFfMQ/UqRSFI6mHwFFUYJU83QU8
         9ce8gohHh541FFJvQkEGNIa867xWaOWAs30GLNnTIEwpmZDG8REO9XkuWwndb/dStJC1
         LQeNJqtmxMYmZ0IeDB4uSZE4n/rp0wijPyl1liVP0fwoOpzP3wLqPRFQsbK+Q9kIAwhQ
         yQgg==
X-Forwarded-Encrypted: i=1; AKwUvBxBy6oyLTMCOzcvFErKyhpkALZUbvs1IH4H+2dj/t+na87YeWT1zXZJrZdxyaR9odkaw55/ebjbIzvIWXC+hkA9@vger.kernel.org
X-Gm-Message-State: APuU4Z+V9S1IfPQOjHgCGcxEXJaevdvQrUSSbT/be4E0IUyDi3Z7ZgqS
	giB9AIECiuyl5sVdf7I32MnpOVxq/0HPU5jyKeCycorlN9RAHglXXPzgX8E6qcqoQFI=
X-Gm-Gg: AYBFou1D3gGm5nYOX49kiW2FlWiMSpvhg4ZK5lyyZ6ttQpGNTm6dY6g0U2R8w6zAdFi
	/xk8i/Ew0vigb1XDuJWovuFZuuAH6MeFJr5GA136mIGComhfVF2KWJiFNDoTV9a76ymVWzE7oWV
	iID3hvIWVgfMwgWVhRZ1ITzwwg2pIYlHHWn/DJtDbzdTlWeNJcdYAFy/UrSnCTZN3gG9K78L1Hm
	io+7y1X4iW5r3fRIpDAet8GvyFkx+YQmFJ7Gj/wC4tc93EpNXGxQ8vne2Lac3msrKFpysYzok1V
	tdmNmKpAOkAZwiiip+0NKLPuyXbqa+ZAWPLKXmXo72okkyC1xdi0cww0jz/1eDE+MElbx2QIAv3
	VRotxhFWxGcb6iPyVY5hu5G9ERgZKRaZpMOGa68u9+3vXyglayqHCl7yF5/tCJJOe80KcwcYl2n
	dBnFE4TzNycBLle4oBHPiDwegkxKF8pc3+fPIA4vLF7s4KT7x+M7IJwi1Pa53AuNtzkI1gph3er
	PyctYLASrMECmMpUXhuGr6jdA/rR1HEvOUPAOgocuto8cGn6S3zlOFHjkEYpJG8JKwUhG6TusnR
	01FbVGUqn5wrtwiFb+vNdHczAe7VuSs=
X-Received: by 2002:a17:90b:2745:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae89776d99mr16769973a91.13.1793896803139;
        Thu, 05 Nov 2026 08:40:03 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:c7a9:fa1d:b267:7419])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0969eeacdsm4764364a91.4.2026.11.05.08.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:40:02 -0800 (PST)
Date: Thu, 5 Nov 2026 10:40:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: fix integer overflow in
 rproc_da_to_va() bounds check
Message-ID: <auyxYDRg1QbIrKNo@p14s>
References: <20261031161131.1647-1-atul.akella@gmail.com>
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
In-Reply-To: <20261031161131.1647-1-atul.akella@gmail.com>

On Sat, Oct 31, 2026 at 09:41:30PM +0530, Atul Akella wrote:
> offset is calculated as da - carveout->da and stored in a 32 bit
> signed int, while da and carveout->da are both u64. For a
> sufficiently small da, the 64bit difference is truncated into the
> 32 bit int, bypassing the offset < 0 underflow check with a small
> positive value. Additionally, offset + len > carveout->len can
> itself overflow when offset and len are both large, providing a
> second bypass.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < carveout->da). Replace the
> addition-based overflow check with a subtraction-based one
> (len > carveout->len - offset) so no intermediate sum can wrap.
> 
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 23f8539a99bd..d5fa9d23bd5c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -198,18 +198,20 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  	}
>  
>  	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		int offset = da - carveout->da;
> +		u64 offset;
>  
>  		/*  Verify that carveout is allocated */
>  		if (!carveout->va)
>  			continue;
>  
>  		/* try next carveout if da is too small */
> -		if (offset < 0)
> +		if (da < carveout->da)
>  			continue;
>  
> -		/* try next carveout if da is too large */
> -		if (offset + len > carveout->len)
> +		offset = da - carveout->da;
> +
> +		/* try next carveout if da or len is too large */
> +		if (offset > carveout->len || len > carveout->len - offset)
>  			continue;
>  
>  		ptr = carveout->va + offset;
> -- 
> 2.43.0
> 
