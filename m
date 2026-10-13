Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA444B8262
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909384; cv=none; b=qvDRuWXuX2E6XCMt1/cMELisHE211gBgLqcVOsaLYyxGn+QlwMokS9ntQfFurYp4FPk4F3qBx1qfQVi2f+kguYY1847my3GEMz10/4TtaefM0VOqa+UACqi4/wZWf5IE2WGesiM9ekVkrW2kSKs6mSgsxcti6hoGPZLh8MAw2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909384; c=relaxed/simple;
	bh=k0DCG2gP1hbSdZ25QEMVdWJyAe3omnWy9frZDE1LnnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxFA6+PZAU7AJnW3Oez6mnoOlSdZo8j5wEGOu1nj0dyJwE5pfBwd/J1wAtOo6cOmlWq6zSnhkPQ0VQptxbiMejIFXxXvshmQo90MJAK3pMwg6vGJnn59+3A5h2HLB6SdoYeem+WtyiAi7HM/niAeWtFI+yWr8B0Uyz36+vgxlyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J1yV1Dle; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J1yV1Dle"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e81738d24eso819085ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791909382; x=1792514182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n/66SXzEr6yi4jVYkGgNI85Pe9ob0taR0HTyDCDl144=;
        b=J1yV1DleeP0iribDjcAE8KWDGkxcFQdi6hxEDLl68W8r6oQHMbw3QPoA3Pwip0fKVm
         2b93V2wZNQorV3HxSv93XiB0hCqtLc09S+DGIs6YMeGM5z4mkAduKrDuyavY5m83b0sq
         YyAtUjsKb31sidS52DfcPr+U2gRyYIFiPcxeNjQB2CqMc/4+zJeC8xG71b418WSZka+4
         9hhykk7wX81MtQmzN+yAspjy9ecJioPaffKhSSq30IwMAgtqqDActmTBbhQ0dWMZTbiw
         Cub3TF+nkW2tamI6P2UshLANeJp2tXgxGYP6jbn6q6KRkNrw2M2TKxZy+bWRfDqLLiAk
         RWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909382; x=1792514182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/66SXzEr6yi4jVYkGgNI85Pe9ob0taR0HTyDCDl144=;
        b=ie6DgspOMoPq8PVdACRTDjWFIaMWdUXOxpqEOHsgNA2/XhKyeVC04tuQC+y4keU114
         stwo2+V+BA1VguuKn1Yx/HLhSxu7vItRw4D6/o/SW4iW6tBSyoao0/6k2tBdKl/SmsbD
         fDvSgNp4mKeseTn6NPVsVUPj/w3BQJTCW5/ze25amrBUcfJ31m/7qg5v4uK2MWWSazXv
         KgBiouIYJnGg+ipYTDFDu2SLl8W2GBUuVj+BFWUG+4ktbQEp3IMH0jmW4Z/0zeQLsVfe
         jb0uaNBu60U61z9f0b+24/z+1zIdT+WKE9vCOyuZJrSddJbuKExUXBO/SOPU8fTCD9Nn
         6pNQ==
X-Forwarded-Encrypted: i=1; AKwUvBybyCaFX9MYrOBCiAwb4ZbWVGSaxUAePSKcAw2z1ByVFO7vV9wdPfxkVFI/tgWFQqH2iix040cttONjEiYXzcAY@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Shbc7Upf6rfWM5m6gW93CK733CmFu7g0r5PvjPzuz24iHi2E
	0BflHSzIoy0CjTc3k211OlC4F+Tum4MM2YlP4PBH9T8LTOc96UyFYz5PEAUKSPH8X2vZmippECx
	e5T3l
X-Gm-Gg: AYBFou0EZUWqlTxhVIysNfUKumoAX9zfbGfUfHAD7PFfpkw6AlClge4iuNTPQJB5eet
	A+v6+LGPH/lt4NE7GdeMkMzvMF753bMjWgiUPlrAH34Bd73d/8XPoCAsOZ3Cc3aMRKmTdZH/rtv
	947gty+1TMgINEnnFSg+WjyqkivvFFPiuuLgMtaNeo5+q8WVuc4TK3agG0Zh1lP5yeT5LAmxQZe
	T9QvjQPPYuLmxV1Rum2wKBI+vvRQoAB/3Muhm5C8qAT3okMsEpDx5fzp0rf2Cd8KOTcjD7Gb7of
	TEN1ZxtjSicl8e4TR35AahehIm0h6AykUsFq68BGGbrQqBgLgMjRoOwXdLMpCV+Wb+qMCYz9Bpo
	xjfJNwU0yWJbacwB6Mk4IDPW0TT9PrjgWGCDoYYGCFy/HvgYZOOmUQvMbEe3iRFx/PlqF/z30af
	9NF1TZwsz8s5EOTHvFIA30Gyi0pVqb7Z6hnhSeyvq5Vng98AguZMWb0p3H+KCvvvFjTGNC+Z+4G
	32xJ6mL8Fnk
X-Received: by 2002:a17:902:e892:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e842e1363emr126560095ad.39.1791909381526;
        Tue, 13 Oct 2026 09:36:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adc4:c3cd:7c5f:3991])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1562sm60325445ad.34.2026.10.13.09.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:36:19 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:36:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Minor improvements for remoteproc_virtio
Message-ID: <as5eAVihirrdYh-r@p14s>
References: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>

On Sat, Oct 10, 2026 at 05:21:05PM +0200, Francesco Valla wrote:
> Hello,
> 
> while working on the v2 of [1] I noticed a couple of areas that can be
> improved in remoteproc_virtio, without a real functional impact.
> Nothing critical.
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> [1] https://lore.kernel.org/linux-remoteproc/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Francesco Valla (3):
>       remoteproc: virtio: add vdev_to_rsc() helper
>       remoteproc: virtio: replace kmemdup with kmemdup_array
>       remoteproc: virtio: remove stray white space
> 
>  drivers/remoteproc/remoteproc_virtio.c | 61 +++++++++++++---------------------
>  1 file changed, 24 insertions(+), 37 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
> change-id: 20261010-remoteproc_rework-6a06eb95ea86
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>
> 
