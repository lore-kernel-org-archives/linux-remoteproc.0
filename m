Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525B2C11CA
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579073; cv=none; b=UInqy3KEDb7AeysRR6UYA8LXVY1JHNpMaMh8J/gSBvCGN8+xO72Gc8rGAXrMxUNgA7LtIdECqRk8+KPdkvmA61H8CQuSYtravaJHjsj+GbY035pKt1JC9WV/4mhuPMQn3ld4g3dkSClc6lKYhxSchrAcb0pGBZaKebE6CbjBi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579073; c=relaxed/simple;
	bh=dj+bnTfPD5E4CT0YPt0fXWXRL59XVMUbXq5o10JY+O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgrtMmUoM+Y4zuvl9WLMyjQn+V1a7euNMei6sjM8K7Y10wL2FojKTvISyOHtM45jDCS48vcMGrsrw7DgyWqOJkeR1YO2dEXEgiOhRfzQ4NZ9ad2deDVQtv4FSZ3I0TNHM7wK0bGZmXp/40HhBv8MmF1f+sdY6JtZBYoeXQgB0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CLUT95eK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CLUT95eK"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6cf07258e3so3484619a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 08:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761579070; x=1762183870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+DsN4jdZOSZ5kOtvEnVeEW6g+UQqLuSnwSLzBPvWmk=;
        b=CLUT95eK7npT+yoxbE0m9cj/uUdcQ+tKI7gq9zVeeaPrc60/ECzDaWK04T3da3KAkw
         im2AzB6fNOoVj8qYEeMaU/dlA5gpSF36+/h4t8BmZ5p3cxYF5yVz3lBSBrZ+Pj4HOYZg
         Y/+dcHyya7/8uVQ3OEdUczXmjOyDYsnbkSW23zvi9u8iLQeuPKAH+IE/sRh8zCIl0wrA
         6T0V21PBQYC7XAcAofKdQZNdN/oeMHInu02+d5K2HVOLJFMM7z+UxNd7qj6JQN2j71SG
         uY1bwMtEhxIeh21/212mR5FLmYPswelnfaGFWRzUjtiAmCmEHpYS/xgmRwc8LP7DVqgs
         Z/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579070; x=1762183870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+DsN4jdZOSZ5kOtvEnVeEW6g+UQqLuSnwSLzBPvWmk=;
        b=c/t1+AzHg6c0VGar0Gl3YizKSm6q9nDc4/Zj+sdWFOiBQWMwZC31dXfLqYurFrSuYa
         bxjH/8UQZLPVsfLUbrypmJD+TCU6vIbmovROD+Rm1n4YB3SdU/sxUBLYXPBAxkmTHWNt
         CkEo/xSeYiqmSq3Do26VgFhTCyI3c3vPykpbCD7yGL7Itp0b9sMkUJbXt+0PQRSMxUfE
         0cJ+phTzTQUsOBzx5mslvPsxIZfQUem/CNgc5Jx31x3g7CBiQf4mifzZqiSrlHIisuks
         8cteFZVqhAHvybY+y2Ih051Km9UNWVNLotVYqdcoUKsH2a3slhn4ul7wFJbzL8Q54Vxi
         UCvg==
X-Forwarded-Encrypted: i=1; AJvYcCXLGweVgU8VzuJur3YDh4mu6qAzX8uAgLV+C8PtiZG7bwfzbX/TIYE4+hQEL533NtVmNss8w+tCSPpKycJ5G26C@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Q1f0gdps2xGyPNvbJZ7fJ3243c1LJZ71CvLTyIPpSqKvJDFz
	QtXgQisX6gAdhZGMOFQYjmGmBbx533IEmx6VsVGBhxK6lS4CuyO7YKCF5vrR4fm+vcosb/SOG4r
	+dnxXMlk=
X-Gm-Gg: ASbGncte/0DIkcK0TjbhpMVf5xe7Gj71rpzHp4Y/2AAZHN9MR951DxBJxgau/1bTSJ9
	hX6DIMu4AEsF96VdqwwEYxhy83pDQMFVkLVfs6k7AhFxUCDUPubF4c23i7Cw8pj9lRbtONUlva5
	hT/mIrl4jZfSm+1GJjH5omDTI/RB9Le4R0lp5HW+NyxyMT6SY5/dzUTzPFlh8+d7i7MHE/7mlVr
	zFnyhXSImCXE3cFKRCZObks3eE3Gpczuimk0IhWk365OaJ170mMejiAPTMkE1LUqyqK4i01za1h
	/OnevFPBxFK29osXrSv0xJvY2V+830JQPfOomK1NgeVd/YDfyt5tvQD7G+ts6tWu3Sp0FT3ZQhT
	El1L6o+eCOrIns1jR1yE3Gv8kMd5JtGJo6sYwOnJCte6t5YwzZlN4EhVe6u2qYSrMp5lle7NovU
	tLNeXiTBfb8iOXAg==
X-Google-Smtp-Source: AGHT+IEP4FsWGs0UlCG38/MmB7iYt/IImDnHvF1ET52ZGM8b5MM8tWTghb1WNjJHrfHPnwqQpuudRg==
X-Received: by 2002:a17:903:b50:b0:264:a34c:c6d with SMTP id d9443c01a7336-294cb3ecbc3mr3384865ad.37.1761579069792;
        Mon, 27 Oct 2025 08:31:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6669:f9ca:a6a4:f3ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed807dbasm8970788a91.12.2025.10.27.08.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:31:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 09:31:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] remoteproc: core: misc update
Message-ID: <aP-QOnTuiEcx9nQK@p14s>
References: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>

On Thu, Oct 16, 2025 at 07:47:57PM +0800, Peng Fan wrote:
> This patchset is a misc update of remoteproc_core.c.
> Patch 1: Drop a pointless initialization to variable ret
> Patch 2-3: Cleanup the included headers
> Patch 4: Remove export of rproc_va_to_pa
> 
> I am also reviewing the rproc->lock usage and thinking whether we
> need to add a lockdep_assert_held for some functions that should have
> lock held. But not sure.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Drop patch 4: Use cleanup API. Because there is a deadlock issue
>   reported, need review the lock usage before the cleanup.
> - Drop patch 6 & 7: Use bitfield for bool
> - Add A-b from Andrew
> 
> Changes in v2:
> - Add patch 6 "remoteproc: stm32: Avoid directly taking address of auto_boot"
>   to address stm32_rproc.c build issue
> - Link to v1: https://lore.kernel.org/r/20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com
> 
> ---
> Peng Fan (4):
>       remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
>       remoteproc: core: Sort header includes
>       remoteproc: core: Removed unused headers
>       remoteproc: core: Remove unused export of rproc_va_to_pa
>

I have applied this set.

Thanks,
Mathieu
 
>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> ---
> base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
> change-id: 20251016-rproc-cleanup-v3-330464eee32e
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
