Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A734156997
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Dec 2024 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333955; cv=none; b=h8HIon6tXgX/Ei8O9QCwi0Urg8YC1m0ZBz6IzWwSY9jyaNsphBYWwK96NEWU2tyqIuJVwdLzIasedbv/VZCib7zp+wy+nRfmX6Iz3yo1zKOqVmCk/PD3Dddscs1qWscaFTCd0Nw4h1LhE39K7U6XRNZFbx/Mvw5iG+DZW9Qd55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333955; c=relaxed/simple;
	bh=fgfEZZslgIKWvv4S+o/nxyoqF3C4cu7XP4OXGkmGtHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVbcv9yWnsks7sGj9CX4yss0qiI4sFuauTGPnuYem9oyQP6LyQ78EkS2TNQ0nclkzhTZfZJT9w1i8Dq4mY1g7crxPMG4EsF/ScjrLHCnzqwTUDTalNCxcME3rSXgZcO8CVLTuwIvqDKMLA9COZQWW+VxpSWq02jT3obCnmp0EAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hsyASPLz; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hsyASPLz"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso68308a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Dec 2024 09:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733333953; x=1733938753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+VthV+b5458qivE7JcnZbaYt7S0cTsx4Urffvhiw4LM=;
        b=hsyASPLzKSeLbO6yMfbpqUWGotvdw4Se3SJFFeX5ESEkOxHjCMPGmNAkrB0/GGuovQ
         RBsFqBF1h2LBQhWvCq463ZEe7h4f82FSz+rdPR1UKm/yZe37fgtABOgm9LCsL5IG8ABp
         FBYGLk0ub7nrb6SUWj5WpzA5w2uGbKT/1zeHi4oV0Cu3h5FsXbSUXhOp6LHHxo4x9NpT
         QAt4+qxryC6LmS6ggo1fCUNE88X9T/vm32awUwFXnsx2htFE18xwZaDfC7zK0CO2x/RF
         cN8a4SwAmt6ErCXjlwROigqAbLt07yda3KF/1lNxgc7oAz6pG3U8fpPaeJscCGAlDfrA
         ABEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733333953; x=1733938753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VthV+b5458qivE7JcnZbaYt7S0cTsx4Urffvhiw4LM=;
        b=k70vzGmta1c2rBK/S9PtEysQUh2SULU2UxqnIZqgE5TJFQVqkE+NngFVOoQuE0Uag8
         3A5irdn5Q+QWoo3nl2y6P5TQO2ZalVmBA2UNahR5jC/XYy4TBHBfQ1aFCzr7KBFAhg9v
         VTJ+4qCRiMknEkHaGOdZvcLRaoX9NOi25RkyUNuoY4iqEeZ9eIeTQwj1s9cq9Xnpd1MA
         ZZf+Dhm+y0bdWFh2p5jX3+spX88gvp0EW6gj52qM62p9oESZFj+b1I37LD62oO8j/Dic
         qW9RwFohQUKipd672r7gMavXfv6HhCCIlUMQCuYFxlghtz+UENwPvzFo3P26yt0tfXQ4
         UkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ37oMbDBlCZQRuQ/RqqHAoG0FLtIC9CtzU33c1LKUgxkhloVkQZRgWf60zPugnKazeV7YcH1M84GSNCigREbm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1g0P4gl591Uv/qrx3xPGQzp3EQUR6p1TTIc2fYYbUX3e5pW+H
	aX7iihXx70A3Jx404ERcrdk/v3xryx6h3dLUeg5hP7WRfaFsO+DI4PAmpwNA7xY=
X-Gm-Gg: ASbGncsLpUHwxnsY8E+NI5lCL4JV2qmxzXSI2FzSTzdw6Uch4Q7M0gbQIPjFtfTzIO6
	FZpEMhJxQpZ3gFLzE+6VfjrhNH4tMcr0cFJ/RqZ56Cr4vAZtYA/g2BFTH8ZNezT5kXXD9gCS6XA
	/f06AcaRHSr5q145sXye2rKUz0AUQ/15j1aDmQUw99Ppi+L2ZSSTZVZ2Z/v6qYal8SyU+gYY3Ab
	kG49d3b2eYU/N3BdSez7VvkVZTXRu7C/fdJYyEMw7b3bkTgVFRDaw==
X-Google-Smtp-Source: AGHT+IGhU7zUXdw1jO4qBjRP/qSHZPrcmJ5kU/snB6sUvFjEiUozfQ22D4pCzEUIkaBRIYvxxgj5yw==
X-Received: by 2002:a17:90b:1643:b0:2ee:f80c:6884 with SMTP id 98e67ed59e1d1-2ef012796bdmr10132428a91.33.1733333952612;
        Wed, 04 Dec 2024 09:39:12 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cb58:bf7f:6102:4f57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2701df43sm1838077a91.30.2024.12.04.09.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:39:11 -0800 (PST)
Date: Wed, 4 Dec 2024 10:39:09 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 3/8] remoteproc: Introduce load_fw and release_fw
 optional operation
Message-ID: <Z1CTvQqULM0TjulR@p14s>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128084219.2159197-4-arnaud.pouliquen@foss.st.com>

On Thu, Nov 28, 2024 at 09:42:10AM +0100, Arnaud Pouliquen wrote:
> This patch updates the rproc_ops structures to include two new optional
> operations.
> 
> - The load_fw() op is responsible for loading the remote processor
> non-ELF firmware image before starting the boot sequence. This ops will
> be used, for instance, to call OP-TEE to  authenticate an load the firmware

1) two space between "to" and "authenticate"
2) s/"an load"/"and load"

> image before accessing to its resources (a.e the resource table)
> 
> - The release_fw op is responsible for releasing the remote processor
> firmware image. For instance to clean memories.
> The ops is called in the following cases:
>  - An error occurs between the loading of the firmware image and the
>    start of the remote processor.
>  - after stopping the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Update vs version V13:
> - Rework the commit to introduce load_fw() op.
> - remove rproc_release_fw() call from  rproc_start() as called in
>   rproc_boot() and rproc_boot_recovery() in case of error.
> - create rproc_load_fw() and rproc_release_fw() internal functions.
> ---
>  drivers/remoteproc/remoteproc_core.c     | 16 +++++++++++++++-
>  drivers/remoteproc/remoteproc_internal.h | 14 ++++++++++++++
>  include/linux/remoteproc.h               |  6 ++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ace11ea17097..8df4b2c59bb6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1488,6 +1488,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  unprepare_rproc:
>  	/* release HW resources if needed */
>  	rproc_unprepare_device(rproc);
> @@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	ret = rproc_load_fw(rproc, firmware_p);
> +	if (ret)
> +		return ret;
> +
>  	/* boot the remote processor up again */
>  	ret = rproc_start(rproc, firmware_p);
> +	if (ret)
> +		rproc_release_fw(rproc);
>  
>  	release_firmware(firmware_p);
>  
> @@ -1997,7 +2004,13 @@ int rproc_boot(struct rproc *rproc)
>  			goto downref_rproc;
>  		}
>  
> +		ret = rproc_load_fw(rproc, firmware_p);
> +		if (ret)
> +			goto downref_rproc;
> +
>  		ret = rproc_fw_boot(rproc, firmware_p);
> +		if (ret)
> +			rproc_release_fw(rproc);
>  
>  		release_firmware(firmware_p);
>  	}
> @@ -2071,6 +2084,7 @@ int rproc_shutdown(struct rproc *rproc)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +	rproc_release_fw(rproc);
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> @@ -2471,7 +2485,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	if (!rproc->ops->coredump)
>  		rproc->ops->coredump = rproc_coredump;
>  
> -	if (rproc->ops->load)
> +	if (rproc->ops->load || rproc->ops->load_fw)
>  		return 0;
>  
>  	/* Default to ELF loader if no load function is specified */
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0cd09e67ac14..2104ca449178 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -221,4 +221,18 @@ bool rproc_u64_fit_in_size_t(u64 val)
>  	return (val <= (size_t) -1);
>  }
>  
> +static inline void rproc_release_fw(struct rproc *rproc)
> +{
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
> +}
> +
> +static inline int rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	if (rproc->ops->load_fw)
> +		return rproc->ops->load_fw(rproc, fw);
> +
> +	return 0;
> +}
> +
>  #endif /* REMOTEPROC_INTERNAL_H */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 2e0ddcb2d792..ba6fd560f7ba 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,10 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @load_fw:	optional function to load non-ELF firmware image to memory, where the remote
> + *		processor expects to find it.
> + * @release_fw:	optional function to release the firmware image from memories.
> + *		This function is called after stopping the remote processor or in case of error
>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -403,6 +407,8 @@ struct rproc_ops {
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
>  	void (*coredump)(struct rproc *rproc);
> +	int (*load_fw)(struct rproc *rproc, const struct firmware *fw);
> +	void (*release_fw)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> 2.25.1
> 
