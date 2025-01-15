Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAA0192D69
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jan 2025 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960873; cv=none; b=JTh0ILYYxV1/APDcEHwdwlz1rAn5GpIOtQEouQYhm/fn6Be8lDS0h5xYpmwwc0Y7BrZQziepe0m3/o+hsiNZDx1hQC3a603xV0YaMmolC6xAhibC160/ZQQi1syA8bC7UTj8iPxZUr26dP2ZgJBNeX7NM+b8cuQylZj4D1lIxl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960873; c=relaxed/simple;
	bh=1JZucjw1sGdnLmyrXNFAM5kNeQ7vMTwxS7tHUwH2XVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MktdIpkIDVYBIBaIhTqyCAoekAKbp85uE7sFNwD+0AxFc47/IHvauAaj3zU3BVG1PPXR0uZ0rzlSnJ8TsW8JH40ZR32MIzyGuoaQpFFTTJI9bCUgJ+C0cLbg5YqDD4VkEvNvnxGkPUgJi/1WdBbU9hZ0FBm3OTdzQvGoAn3BoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZB2eEra2; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZB2eEra2"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so94942a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jan 2025 09:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736960871; x=1737565671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0VcY46/lM+qWcYEFMTW7FPs+z3KlTxuhM3tOU/CzhrA=;
        b=ZB2eEra2s48snwkS3oIhgZ8NSz03gKBT9Rn1bfFPZ3sgCkxiiqpb/tPQkIH3EmzjAP
         xvmMgY4wBKeGiazN6S22/5JzRfWpHqlcZoHHAKRFBv2fctDddDh20g6F15iMqIiHHzAV
         gTSRux1lnORrPcepc5pcHSRHA7/i59w50uP9FJh+WdkslE+gDUslq3zG8inSYFie2uxA
         KjDuC4bKANIlSsUVmIThgMXOyTM32ZssNXJQh6q69GyHqBSsjFohVu9XecoNeVL0GtrR
         ZjxWOKM090AC31/HoFWiEDrF1fHP3zyaX9xUdknLUGC2uSnWjHyA/8VKHqas/qwamjGI
         Zu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736960871; x=1737565671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VcY46/lM+qWcYEFMTW7FPs+z3KlTxuhM3tOU/CzhrA=;
        b=e9S9WYkaInNChkqTPJtaH4tD8quu9eEb5K7lKs6z23GRIhcvJTaCzuFAGGLA+C4cNv
         Fw0zAK5r2mxtFCXtzQJA2DbAZUxDJv378QCwdRlC630lqn9i/VympjKoOB+Y5glLLL6a
         ByJ+pf1ilZLhQaFt2PcYtS9jeB4gfW4Qd2wnONMNbqxKszXeF9LaqbiZ2HH/0zoMpEGo
         uahW8Ugiz5kyACuoatLUTOtexPl/KYvrSKD5PjcbEmHQG1CUsQez0q/Luhh+1FVVxh18
         pyRyKKKqhmvrvtpOnH5hoS+5ZAXh+fBVpWyXvcFZnNzWCL1HPi4WBjh+2DFdjHBJHUxo
         1S4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxj6lMfeVWYxlfjufFXUgqFae7wV/VRFFVyD/kMYxBgkUbFSVWelVWeos0zsdqNZqf2KEoU0k8w4wKR6icO92F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6peVB3FuomWwpeOb5tGLsIP85RsDdOHiIJ9IQ8nEtYAXJSYB
	Gf4YquGrmQJfyAW/kRqXaYEovb/wSxETTgpenG4AXIj9pUUpIfLRJ2Uc8Yr/fGM=
X-Gm-Gg: ASbGncv1CxoscbSWyH1s9rywhCcmoA3qQpBzhrfPfqOtQj6pb4X3JZ1Rv2pOMHD+BhT
	jupMVLz5wxUK1eOui+dO+mTgOKkONvmamkUprHBtlr65bqkH+Lz9lGJH36rlNS0ezGXaCNFQ+s9
	AqXYKoQzCKD/cMY3Si50e+/Foee3yi+BRv5zXuV8VlQtPWnS9HWHEqWKtdWgNpCcEbMcQhZKrv6
	XiX97QZg9WoTZ7uXGqol9WzxvJuwPWKF/6k5M5EwC+ugR2NvIchgr7uQW0=
X-Google-Smtp-Source: AGHT+IFBYy/MIoFqLhH1iu5kbk/VFg8m2zjUzFPIqHf2bvIqpubLtL+eann7wEvmNhmkk/lcjY6k3w==
X-Received: by 2002:a17:90b:4a50:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f548f2a154mr51216371a91.12.1736960871023;
        Wed, 15 Jan 2025 09:07:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5bd:9b69:c7c6:475a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2c2e71sm1616086a91.35.2025.01.15.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:07:50 -0800 (PST)
Date: Wed, 15 Jan 2025 10:07:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] remoteproc: Simplify few things: omap, keystone, st
Message-ID: <Z4frY5W0Nfx/iTfR@p14s>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>

On Sat, Jan 11, 2025 at 07:42:48PM +0100, Krzysztof Kozlowski wrote:
> Few code simplifications without functional impact.  Not tested on
> hardware.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: keystone: Simplify returning syscon PTR_ERR
>       remoteproc: omap: Simplify returning syscon PTR_ERR
>       remoteproc: st: Simplify with dev_err_probe
>       remoteproc: keystone: Use syscon_regmap_lookup_by_phandle_args
>       remoteproc: st: Use syscon_regmap_lookup_by_phandle_args
> 
>  drivers/remoteproc/keystone_remoteproc.c | 17 +++-------
>  drivers/remoteproc/omap_remoteproc.c     |  7 ++---
>  drivers/remoteproc/st_remoteproc.c       | 54 +++++++++++++-------------------
>  3 files changed, 28 insertions(+), 50 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250111-b4-syscon-phandle-args-remoteproc-06dfa873d1d1
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
