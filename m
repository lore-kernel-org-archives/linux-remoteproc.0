Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59B1C5F39
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Jul 2025 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753803277; cv=none; b=UcOwfbF6waX7NkAns9gEzZN9krFGoFaIcJkTfP0FJ+yWhwBzHkU358qqkVrFmIfJafgmddHiZEczrfeCiXmU5GKaAJ1I35bxj6ovYz2fOcDoWHPC8+j5zuY8v1q2QPXXXhgoNAJOHf74LFnA6/SEmyN+FSLMBm/4xbQ0Kjux4Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753803277; c=relaxed/simple;
	bh=i5h0os/YtNwZTZidzFNsIxF45bH5oA2E+VUtDTiVQnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwRfZMHhxC8uRZa2QMb4++mfrVH/9SEoBClKmnlSuQp+4jcTEUkE75EjSuAWiUICPUjFIKan3YUCDGNoEXxGMJl0OUvmwkMmEMBZNA+R8AfLESTGtnO19YJmb+6iNrFk24KTIIzfYw2g+UElbkojyjDnrLwCeT4vuRiGUxz+KOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gm/UWWf2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gm/UWWf2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2402bbb4bf3so28566615ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Jul 2025 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753803274; x=1754408074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VMoqKFLALEq+ZmPG9wCyqAsQPACRG2hPVvh+rmUE0OA=;
        b=Gm/UWWf2IRaDM1h5HLY13taz1WRy6vjT3b6QiDStPs9e+ceR2c+mV+FUvwPU1Bcf3N
         BdxC7YeuFmxe0gVrhusU1UqUiH89LiTLcRI0qWR9lQIwN0e9zMe52bzDn+blQ3GL1pcP
         BCaVvvAnuy8HJrdaR78BWALZcIABmqJmu4kCyyFLpCOCuWK+0kvIVNlDsKIcAQ22ffXe
         vGh/QPX8xhkRzeV865xNWr+U5RDKJhB0FwoIM55QPXidin5cGr1rMIKj3IF+buP5kqNH
         ItzRISFhOKXYBcMGxVlTiz1IQewavWwMP9zdCSRBXKcy07KTnBuAH4whI/sKkdQ0eRVT
         wWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753803274; x=1754408074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMoqKFLALEq+ZmPG9wCyqAsQPACRG2hPVvh+rmUE0OA=;
        b=jbS2dsc8FfJuEkKpuQkvITzS/noKxGpGxPhwPvfHTIKzPzfOfDOBnD2JvHnnukqPjS
         eiZIY3WqosKR67DQXEZXQKVIe97vpbpjGEtA68JV2FJG0RbbY2Kzku8uWxizNgK3vzBB
         tws5ySZngDIqHF7tYonXEb3WFv+T1IKa7Qs49/DuYWtv1M51QEdUqawNrIYyyPb0NCuC
         TVI4KVtdOA7qdTjwVpJwYAJ2Lk1AjH3x5lXscf0YfsTMVMhNkH/Qh706D/d7LGKcuHac
         mT0ERcJrSVeYsQVKbvzChNHp9fl+kvzQO6C1yMfHmO/Ktw0zAl1TKDEoBy34Uik4czbM
         4SiA==
X-Forwarded-Encrypted: i=1; AJvYcCV7sJwVfYAptWANNf6CZ8iNZ57omxnmXBjrtlgTWZ9ucDXOGiuE1iQvC/yVZ1bAHWzzRRx64TVskA6vkGmM6MlM@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtSYXKt9WRRHCciYcNjJGfnBR8bAoI5KYeK1cJql9hmFSGFR7
	HEPEi9eNaSmaB3oFgZF7S5Fgd0nyRB15+8FitUd8heGVKLypZi+m0ShS9wC8oMjkBkM=
X-Gm-Gg: ASbGncssRTt2dd90Mi7QUJEK4+7RQJuONkxMoVppiRnqD+OINUux420tXsnBqWBje4q
	Ka79nug2GaYlrqg7sJ9j7fsOalVHrgCYkw1CEOFV9RK1RimApuHnTUWZSV8Pnhxterze5uSGUO9
	nn/a1FKgJChySBCs/j82XWTMgn8HJICdsK5iYme0wyXXgjuviT+PeFdD0iBcfoaVDI7kc6V/uO6
	7tXsSMPP+c+ZqLWAZ8H1fvRSs+pMu7fUcbYfIgJkbNdn+MZ6gaPhb0o+2Xq+hbzWCtoHkEjJfms
	fm228nu2IPWS0AvciZoeXr5lQBRxF2w+1VG13pwXfIm84c8uFcEuvw843ZPWWK2yxQa0nHSbn2s
	G1uFDeDaGJzAkPy3YN+jtEETAQg==
X-Google-Smtp-Source: AGHT+IHlEsBwMee/kywPI2/tvT1g4ScsliyDmtiDbB1WAnykD0Ma1gjgSCy2s0F1viosLS+e5Kxzqg==
X-Received: by 2002:a17:903:2ec7:b0:240:5c38:756b with SMTP id d9443c01a7336-2405c3879e4mr62619735ad.14.1753803273589;
        Tue, 29 Jul 2025 08:34:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8920:ecd3:44e1:110b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24052e03863sm32464055ad.41.2025.07.29.08.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:34:32 -0700 (PDT)
Date: Tue, 29 Jul 2025 09:34:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, jm@ti.com,
	jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@nxp.com,
	arnaud.pouliquen@foss.st.com, tanmay.shah@amd.com
Subject: Re: [RFC PATCH] remoteproc: core: Do not process carveout and devmem
 rsc in attach mode
Message-ID: <aIjqBi3X4hWGsJLP@p14s>
References: <20250724133144.3776839-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724133144.3776839-1-b-padhi@ti.com>

Hi Beleswar,

On Thu, Jul 24, 2025 at 07:01:44PM +0530, Beleswar Padhi wrote:
> When attaching to a remote processor, it is implied that the rproc was
> booted by an external entity. Thus, it's carveout and devmem resources
> would already have been processed by the external entity during boot.
> 
> Re-allocating the carveouts in Linux (without proper flags) would zero
> out the memory regions used by the firmware and can lead to undefined
> behaviour. And there is no need to re-map the memory regions for devmem
> resources as well.
> 
> Therefore, do not process the carveout and devmem resources in attach
> mode by not appending them to the rproc->carveouts and rproc->mappings
> lists respectively.
> 

I think what you are proposing is logical.  Arnaud, Daniel, Iuliana and Tanmay -
please test this on your platforms.  I will also need another TB from someone at
TI.

Regards,
Mathieu

> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Testing:
> 1. Tested IPC with remoteprocs in attach mode in TI platforms.
> [However, TI K3 platforms do not use resource table for carveouts,
> all the memory regions are reserved statically in Device Tree.]
> 
>  drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 825672100528..ef709a5fa73c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -640,6 +640,20 @@ static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * When attaching to a remote processor, it is implied that the rproc
> +	 * was booted by an external entity. Thus, it's devmem resources would
> +	 * already have been mapped by the external entity during boot. There is
> +	 * no need to re-map the memory regions here.
> +	 *
> +	 * Skip adding the devmem rsc to the mapping list and return without
> +	 * complaining.
> +	 */
> +	if (rproc->state == RPROC_DETACHED) {
> +		dev_info(dev, "skipping devmem rsc in attach mode\n");
> +		return 0;
> +	}
> +
>  	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>  	if (!mapping)
>  		return -ENOMEM;
> @@ -839,6 +853,22 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * When attaching to a remote processor, it is implied that the rproc
> +	 * was booted by an external entity. Thus, it's carveout resources would
> +	 * already have been allocated by the external entity during boot.
> +	 * Re-allocating the carveouts here (without proper flags) would zero
> +	 * out the memory regions used by the firmware and can lead to undefined
> +	 * behaviour.
> +	 *
> +	 * Skip adding the carveouts to the alloc list and return without
> +	 * complaining.
> +	 */
> +	if (rproc->state == RPROC_DETACHED) {
> +		dev_info(dev, "skipping carveout allocation in attach mode\n");
> +		return 0;
> +	}
> +
>  	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
>  		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
>  
> -- 
> 2.34.1
> 
