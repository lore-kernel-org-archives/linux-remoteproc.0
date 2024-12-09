Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425B19E99E;
	Mon,  9 Dec 2024 23:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733785944; cv=none; b=FqmREFxS3CJ3rujNl+p/XCOINTFAzdYqgIIehXppJxzUMSOY6AJxOR1npxh8MMRDYo4PYkyHyByLvnQ2fUk4Ozr4c07n3fi8YZKydcfptsocqJX38gGqyPnwP1SWC+BqXIdE3RA94iyhQi47J+yFxzLIPTwWdDbSKXgfJxEc4H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733785944; c=relaxed/simple;
	bh=sKFxx5KPwfV56VwByJ9VReFedKc1rFhB6hOhL53weWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXILNi9J1tjibmUY8dx86EkWcE9u18qIvNW0f2+ffIYHfazy8/+VLEJ1SbtK993/+KDVz4r5u3j7IzcUeRZU25p3HXX6fvyEfB1n3gi6yXCJ+ESHmZtJttXyXdbazPw3kuM1weMdhDfxzfi0Y6JfIRpl2KjZa5YCd766LTTAXu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A58Dq2Kw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A58Dq2Kw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F61C4CED1;
	Mon,  9 Dec 2024 23:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733785944;
	bh=sKFxx5KPwfV56VwByJ9VReFedKc1rFhB6hOhL53weWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A58Dq2KwGXVkBchRo8iVHZ65GgxOIbYV2WUa6vH0S/94yAho3uvW9w246rcFVAgdz
	 jjsAun3fL6Dvl1vtg0yNLcDv5AMf17iS0yC3L041/Cf76VJtiXTlokIWbDrFXm8Cbn
	 C/Lg5LM3f0zpqv+SRM3Ni0z41v3CzzmbMq2c6HcHecdyqvQf5NVo8CrS6TjbgdJicF
	 XILMv0AGN06MADQkWoFgUyOqAA4vvBLPda7tzmMg8XZrUIrpIvYNikedKN7WGRrgiN
	 kaj5vk5KAt7Sj9IGGQGpFtf+1SH6/2/OZMBVTUkz6OVpNuXRu9tHqbzRnH4MDhjZIh
	 9sWYXiCuhmyHQ==
Date: Mon, 9 Dec 2024 15:14:00 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 3/8] remoteproc: Introduce load_fw and release_fw
 optional operation
Message-ID: <adqulwb54wvn36mnjq7u23qdiyapadr3ruhqluxab7mg3kowz5@4rexefd5mlwp>
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

On Thu, Nov 28, 2024 at 09:42:10AM GMT, Arnaud Pouliquen wrote:
> This patch updates the rproc_ops structures to include two new optional
> operations.
> 
> - The load_fw() op is responsible for loading the remote processor
> non-ELF firmware image before starting the boot sequence. This ops will
> be used, for instance, to call OP-TEE to  authenticate an load the firmware
> image before accessing to its resources (a.e the resource table)
> 
> - The release_fw op is responsible for releasing the remote processor
> firmware image. For instance to clean memories.
> The ops is called in the following cases:
>  - An error occurs between the loading of the firmware image and the
>    start of the remote processor.
>  - after stopping the remote processor.
> 

Why does this difference need to be encoded in rproc_ops? I think we
should strive for having a single, simple high level flow of operations
through the remoteproc core for which the specifics of each remoteproc
instance can be encoded in that driver.


Perhaps there's a good reason for this, but if so please read and follow
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
to make that reasoning clear in the commit message.

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

It is not clear to me why in the case of OP-TEE we need to invoke the
"load operation" here, and in the case of "legacy" ELF loading we do it
first thing in rproc_start() (i.e. on the very next line of code being
executed).


Should we start by renaming rproc_load_segments() rproc_load() and move
it out of rproc_start()? (I.e. here?)

Perhaps define that rproc_load() is responsible for "loading firmware"
(whatever that means) and establishing rproc->cached_table, and
rproc->table_ptr?

(Note that this seems like a good cleanup of the spaghetti regardless)

> +	if (ret)
> +		return ret;
> +
>  	/* boot the remote processor up again */
>  	ret = rproc_start(rproc, firmware_p);
> +	if (ret)
> +		rproc_release_fw(rproc);

The fact that you rproc_release_fw() in the error path here, right
before we unconditionally release_firmware() the actual firmware means
that you have 2 different life cycles with very very similar names.

This will contain bugs, sooner or later.

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

Why does it matter if it's an ELF or not?

In the Qualcomm case, firmware comes in ELF format, Linux loads the
LOAD segments and the trusted world then authenticates the content and
start the remote processor.


I think the difference in your case is that you have memory reserved
elsewhere, and you want the "load" operation to pass the firmware to the
TEE - which means that you need rproc_release_fw() to eventually clean
up the state if rproc_start() fails - and upon shutdown.

If we improve the definition of rproc_load_segments() to mean
"remoteproc (or remoteproc driver) is loading segments", then in your
case there's no "loading" operation in Linux. Instead you make that a
nop and invoke LOAD_FW and START_FW within your start callback, then you
can clean up the remnant state within your driver's start and stop
callbacks - without complicating the core framework.

Regards,
Bjorn

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
