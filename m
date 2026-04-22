Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC419318EE7
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869740; cv=none; b=rr9IOO2RmLFPAT/mvgr2p9A1LliEtp36v3cAQzpeYC7oFA0sPt6PuchhaS3uu1AMhQ+fmj3TfCN4UAD5MIhxOPErHeExkOKajCaLeZjiOPyya8YdQzavHMy1/RpNMaIgdiN5EYijDSxtcRhl/uJNrU6GuslxvsbWTZUSV3Jb7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869740; c=relaxed/simple;
	bh=mdFMI//Id30zN2aq8g2ejgZDnQWsIKMzLh12OdRaYN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6o8mP0NXohQfL5FYDhVEvgOXpGzof9Pf4hSjGBcN3L5Vf7T+x5qTuIjtbmXu4JwXVSIUuOkcL5QJ2+/C3htrTEo9b4IImUgAZyxNDngdwHTWsQ5aRPmziUPkrMbHvV33Z1UxR2p5aBNAzsNa3jBXWj4GHTVf5jUggmmLR4NTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MP2ZhiPY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MP2ZhiPY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d965648a2so4811172a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776869737; x=1777474537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgygZcdqXMYTxXtA4zUWZDxXXuEyYRzJdq/+ENx9HQQ=;
        b=MP2ZhiPY7Mst+WnMtFyTXC9L6gJ/ZhzZocB4FafR22ANIzhW6BWoTIdSNJwjMRKie1
         AU/wsv5xLpC3H5f46xrt1sMNm7+9udlX8LkTnpjHwSIV8kzvcvGJgvmzxoQlS2ZfGPl4
         mCqhs0ugHKhgGt/B9KKTunNM6pWkxv3wdrDdKHg7sfqAzlqDSIEWazPuG7Oz049WO0eN
         DbLHbRnRt4MwGhSLFi5IvKD6uVEMEt4CjwxMxE6u4aysueToy2Lfv5i2MQAaVfJTm0VT
         RQ3+9zvE84LZ0TW2gp40WvozjsBTK26oWmYTTAlXorUQIsf8r5rbFIgmM94/a+kep8gx
         Pulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869737; x=1777474537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgygZcdqXMYTxXtA4zUWZDxXXuEyYRzJdq/+ENx9HQQ=;
        b=RPxQsLAPdhULMIGHbCgH1TH1Ws+13gQxYk5M5rUwphFPoMXCIcYgtnvWyUQxZbxG85
         dYo5XCkG5XpBuGBIPbxmNTVRYb/stBFr5dan3o/7I/COY26jFdGQsUtbZwH7dK9ixQbZ
         qzt/UVtEH2UzoWZ+kNvN8VqGTMtgLthFKWCgmW2PEEquT4CTOO+mTJ62w7MMU5EnJ0qF
         iZwVDaG11jcV6HcYCNvZilzTOQwN8J5lO8h9gsuklrtCGj8lAgvUUzGBk9CCBUlOzelW
         +XedPUyqlZ6DdRaeuR5TRdgpCgTw9YCYjcQEJwaVe1s9c40pf0QgJh0nQUfw9pHvj+nT
         k9EA==
X-Forwarded-Encrypted: i=1; AFNElJ9Pbvv+P5PUKCyzE3t83DYxLv8XxdfmQocBqlkZHTMHJlcvoow32NWa/SFjleq8HgLkZDqSO1nxqtGVErom9Eoo@vger.kernel.org
X-Gm-Message-State: AOJu0YxerdCFUf5B9ZczmJNDkd+CkrQbTNxCOAD/tuh05W6hWpJkosSm
	da/Mo9A0edpyFukekNwp8lrPBGqtPvK+UNRd+YX1vFTZbuQonCYpEaoyNgALaLkP3Wc=
X-Gm-Gg: AeBDievCA/wEmtGsqApI+YgoVvRc9w4Roddc79qyxYKky4CqDGuu62rQ68M13PYEGuB
	Yj/2LxSLgSYyubnnePCOS9GzaLz538E6yeU9oavat0VRDLFVCiRmeksRsVy0rasyakqcQLyO0dP
	4FY9muzJIs9Sb2MYgguXHecA4ShnMjwvOJuv6ib4m5Oc1qSWotN7MkjhpUlCiSpnJaAa65WdjRH
	6PfEcIlKrhRCKlys5I9ae8wTjm6h1YcCitmU4YlJvN1Iy9q4+nwkS/S3zenbnSfzPE4VY15Kmz2
	3BaxqZtUvCGsen3QZsHj+/b398DBJQBwmzeYPo2dFoPHi+px1nsUAhqLNrQaQOoXGKXFaNaa5b3
	h3mKdAF6Ll/u7Iltd00J8QF/ReZwnTDfM4X+c7V7vXJ1Z/5JMJ37LF6ZhhAp69G/2S9EAom4dq3
	ImAdvhE9lIO4mpr2npdQfOiOIAyEIGBTP6BSjZOJlICGEDyDsK
X-Received: by 2002:a17:90b:2ecc:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-361404a0678mr23611737a91.26.1776869737067;
        Wed, 22 Apr 2026 07:55:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fd65:9224:aee7:cdd9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf81sm164424055ad.43.2026.04.22.07.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:55:36 -0700 (PDT)
Date: Wed, 22 Apr 2026 08:55:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhang Xiaolei <zxl434815272@gmail.com>
Cc: corbet@lwn.net, ebiggers@kernel.org, andersson@kernel.org,
	ardb@kernel.org, skhan@linuxfoundation.org,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: staging: fix various typos and grammar issues
Message-ID: <aejhZQl0Yke9ZDIa@p14s>
References: <20260416105854.788-1-zxl434815272@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416105854.788-1-zxl434815272@gmail.com>

On Thu, Apr 16, 2026 at 06:58:53PM +0800, Zhang Xiaolei wrote:
> Fix a few typographical and grammatical issues across several
> staging documentation files to improve readability:
> - crc32.rst: replace "decide in" with "decide on"
> - lzo.rst: replace "independent on" with "independent of"
> - remoteproc.rst: fix word order in dependent clause
> - static-keys.rst: add hyphen to "low-level"
> 
> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
> ---
>  Documentation/staging/crc32.rst       | 2 +-
>  Documentation/staging/lzo.rst         | 2 +-
>  Documentation/staging/remoteproc.rst  | 2 +-

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  Documentation/staging/static-keys.rst | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/staging/crc32.rst b/Documentation/staging/crc32.rst
> index 64f3dd430a6c..fc0d9564b99c 100644
> --- a/Documentation/staging/crc32.rst
> +++ b/Documentation/staging/crc32.rst
> @@ -119,7 +119,7 @@ the byte-at-a-time table method, popularized by Dilip V. Sarwate,
>  v.31 no.8 (August 1988) p. 1008-1013.
>  
>  Here, rather than just shifting one bit of the remainder to decide
> -in the correct multiple to subtract, we can shift a byte at a time.
> +on the correct multiple to subtract, we can shift a byte at a time.
>  This produces a 40-bit (rather than a 33-bit) intermediate remainder,
>  and the correct multiple of the polynomial to subtract is found using
>  a 256-entry lookup table indexed by the high 8 bits.
> diff --git a/Documentation/staging/lzo.rst b/Documentation/staging/lzo.rst
> index f65b51523014..2d48b2667dd2 100644
> --- a/Documentation/staging/lzo.rst
> +++ b/Documentation/staging/lzo.rst
> @@ -75,7 +75,7 @@ Description
>       are called under the assumption that a certain number of bytes follow
>       because it has already been guaranteed before parsing the instructions.
>       They just have to "refill" this credit if they consume extra bytes. This
> -     is an implementation design choice independent on the algorithm or
> +     is an implementation design choice independent of the algorithm or
>       encoding.
>  
>  Versions
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index 5c226fa076d6..c117b060e76c 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -24,7 +24,7 @@ handlers, and then all rpmsg drivers will then just work
>  (for more information about the virtio-based rpmsg bus and its drivers,
>  please read Documentation/staging/rpmsg.rst).
>  Registration of other types of virtio devices is now also possible. Firmwares
> -just need to publish what kind of virtio devices do they support, and then
> +just need to publish what kind of virtio devices they support, and then
>  remoteproc will add those devices. This makes it possible to reuse the
>  existing virtio drivers with remote processor backends at a minimal development
>  cost.
> diff --git a/Documentation/staging/static-keys.rst b/Documentation/staging/static-keys.rst
> index b0a519f456cf..e8dc3a87c381 100644
> --- a/Documentation/staging/static-keys.rst
> +++ b/Documentation/staging/static-keys.rst
> @@ -90,7 +90,7 @@ out-of-line true branch. Thus, changing branch direction is expensive but
>  branch selection is basically 'free'. That is the basic tradeoff of this
>  optimization.
>  
> -This lowlevel patching mechanism is called 'jump label patching', and it gives
> +This low-level patching mechanism is called 'jump label patching', and it gives
>  the basis for the static keys facility.
>  
>  Static key label API, usage and examples
> -- 
> 2.53.0.windows.2
> 
