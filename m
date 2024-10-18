Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18186202F89
	for <linux-remoteproc@vger.kernel.org>; Fri, 18 Oct 2024 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267701; cv=none; b=EkJZeOf94Andx/ItfxMCLxdabw0YhJldGi0ffBK3tKVCo5PoL2yztvaqt8jw3p3jIUg2bc0O7UiOLEXIuQH8fzvaiargj+Xe7RVEkgVLa/+WZ298zqdYm3/h7oFvKaNg07JHJ8y7rX2uBQOwsxVyk19b9XSQWw4siUn4tO/J/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267701; c=relaxed/simple;
	bh=ZDSCREZ4GeJfN24LLyvFpOCH2GTNNhH1Bc4SQJJVgY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAc06zMKh3KBBWBPuZLSsG/RIQ+wzRq3uFTnV4o+0JM0DKWJtkadubPDubKApkG1r5nE0VoeI/YUikHGrceI/+h6+VfT+tGw3wX4HOZsKwIzAyhhubTRVTHOR6y+bhRZjTMr16d6Ij0k4VRpFZn6oJXmIVlSW8n6cixzklP0gpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KHkS5JbN; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KHkS5JbN"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7eab7622b61so1749184a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Oct 2024 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729267699; x=1729872499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNR0bPGSjLyuFmU7GhxyaSTvabJeE4hQt9n77qexHMY=;
        b=KHkS5JbNjBE/Kq3qpDqAGZJnDtZ32021whGRGi+NouzVX2YQBeFJRaewBbewLm+ItH
         f++iC8HUwCnVpsuNWpECJimOYy48NuOZ0BXUvCJKx7mebFG6wwtejqR4AaWvkdWquWuw
         W714lUlcD5ZDkCZEgqgKMsjsSFfYq0MhdKnBKB+fyqHNn6NAYovN0tZ1tulrSXDGcUlv
         lMTMjZyTgLgSUZ9wE6nlKpWjhnNDKzAP19npkU1sHly9d5vNEE0yEmCkbskinR6/aZft
         AQ79rGTwQvfQ6e8yWIn5kYWxMJM4n3dpMYlA0PmPSn+e1lQ1eHW0KIsPNVJbok6xLxxv
         Malw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267699; x=1729872499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNR0bPGSjLyuFmU7GhxyaSTvabJeE4hQt9n77qexHMY=;
        b=LH/uzDqUZgt0mjanHuB524cUft9vf3WkW1UmTO6UDi5U4iNqNG/+/YusDZ1CKAYNr1
         MW2rHmjY55HnTrJfahLTAsdG32wJwtNjOtSR07oqmByu4ToiTkwhK7vYkcoaQRT4nsn0
         PPM+qoLrJrABK+N99O1dJ4TwH57c+C3Mz08v310/8N20hk98+8H/+Vvm13yAq6/qfa7W
         hXgvD1EZdTjDK5GPtV0mbEYP393FbewWH6DQiQfpUWMr4x+hRXHpC4MejEkF8IEu11wM
         3igS00+MTzi5DWAtCaUiZXENbPQfMc08UzSojKoWPdZlDT+sqSIAxcM3fmh9s8k9sYYI
         rAJA==
X-Forwarded-Encrypted: i=1; AJvYcCXUZOmO86EKzDFEkPQrBKpR/+cu2PHsz8NwSpoNMpnzLzv5JYEphJ9TU7+lK9+dKIWZ7+0QJ88D/d9kjy+XUT4L@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3CHRJqJ/5OpXfyj5GRfOBKHJApXQuSHS16R1Nqv/EEerfQfnv
	HsAgJz6X46dCN47/B9n+CY4SQLYjFRLSb+OlMa708EhKQRSis0JfIvZyXssGAX8=
X-Google-Smtp-Source: AGHT+IF9TqiR2RO3BGwLsSjTV73hbKFyYwD80eadD15JYSLkGQjGHwgW5vg1eOfKD6I7rrg8rjsHOQ==
X-Received: by 2002:a05:6a21:1698:b0:1d8:a29b:8f6f with SMTP id adf61e73a8af0-1d92c4dfbabmr3916839637.16.1729267699273;
        Fri, 18 Oct 2024 09:08:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6af4:1971:ad72:1f9f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc2081f4sm1538199a12.2.2024.10.18.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:08:18 -0700 (PDT)
Date: Fri, 18 Oct 2024 10:08:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable compile testing for K3 RemoteProc drivers
Message-ID: <ZxKH773hQ+JZ2km3@p14s>
References: <20241016164141.93401-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016164141.93401-1-afd@ti.com>

On Wed, Oct 16, 2024 at 11:41:39AM -0500, Andrew Davis wrote:
> Hello all,
> 
> This is a follow up to [0] that adds the same for the other two K3
> RemoteProc drivers. Series is based on rproc-next branch.
> 
> Thanks,
> Andrew
> 
> [0] https://lore.kernel.org/lkml/20241007132441.2732215-1-arnd@kernel.org/
> 
> Andrew Davis (2):
>   remoteproc: k3-dsp: Add compile testing support
>   remoteproc: k3-r5: Add compile testing support
>

I have applied this set.

Thanks,
Mathieu

>  drivers/remoteproc/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> -- 
> 2.39.2
> 
