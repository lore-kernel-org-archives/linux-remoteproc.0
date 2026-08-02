Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477462BE639;
	Sun,  2 Aug 2026 04:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785643715; cv=none; b=EFQWeXATERgN7BhqkGyXOuvVyEGtm5lAxJSmy4CLSySv1oELjY2ADjmU9eGAWkcsjzbtxgccuGZ4kWC5IIDWlcScTZvMVV5MJwdZuEy2hHt0eV20FqcpneafVVucZ/sLsOGh6ChiywNYpjScf2o1wufV8voqUm4EQYRCGOyuZKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785643715; c=relaxed/simple;
	bh=RnFQL6YjnhYoRCAoIPQes8fo7PDgH0+TITsSNhSPtY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew8QzaU+3FX+L15NRZRmF5KJWj8DgrJhmG0LszwV3kz5UeV0RZQzsS05mSvMsksess4TrTt2KwG8P2iBiemZI2q2C5sZ+NGvmLwO33A2vb/22Cvpkk/nQZYh78jOWvptVb4mkbH+YnAPr5lDr1VPc6aM4HAvVd70SovcoTIKur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5R0iidb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5R0iidb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208521F00AC4;
	Sun,  2 Aug 2026 04:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785643713;
	bh=uUbaLxHS/enWwBQFVGCaLcGfc4XcbrRZeJRf2gUpHi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X5R0iidbgpYl3wYNMDeNH7ThdY/zELAswCS+kIM9exhZ+CLjaS2eKwB6FJ2OH0yeR
	 We8g9NLSLO7pA3DOYYJVTpCEQEhTR2aLxOxTFxxg20M66Xv6NrOSjGxyRXGwivbkO3
	 /9DE/I/E6LCotKREvgMQyAGIp2qgMCY/xJwz+JyZkz75dCS5GMe5KMsmjmY6yLhXss
	 O3utZ+wRibShbZ7KBcLl7PgrQr4fPwrXDimQdRbM8PUxZy9ZPNv8IYQ/Nh++s6MI8c
	 6uL9ZfeMcmd13R0OY0zLfHCu2cOqcsbTu+Y+cP+zOcFedtONMufcF3OFdn79z+Gx2t
	 YSLH0J7VBz1nA==
Date: Sat, 1 Aug 2026 23:08:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <am7Aj5UdrrtGUHjA@baldur>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
 <20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com>

On Fri, Jul 24, 2026 at 11:58:58PM +0530, Mukesh Ojha wrote:
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error‑ prone and incorrect.
> 
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.
> 

I presume given that this was sent together with the remoteproc patches
that this can't be merged until those other changes has made it into the
tree.

Please confirm if there is an actual dependency here.

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 18 +++++++++++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
>  include/linux/firmware/qcom/qcom_pas.h |  1 +
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 16ae42e6c434..54ffec97cc26 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
>  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
>  
>  	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
> -	if (ret < 0)
> +	if (ret < 0 || !ctx->keep_mdt_buf)
>  		qcom_tzmem_free(mdata_buf);
>  	else
>  		ctx->ptr = mdata_buf;
> @@ -664,9 +664,21 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
>  	memcpy(mdata_buf, metadata, size);
>  
>  	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> -	if (ret < 0 || !ctx) {
> +
> +	/*
> +	 * Some clients still pass the PAS context as NULL. Until all clients
> +	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
> +	 * for NULL before dereferencing it.

Why don't we fix the problematic clients? There's no point in working
around such things.

> +	 *
> +	 * When a valid context is provided, keep_mdt_buf controls whether the
> +	 * metadata buffer is retained after PAS_INIT. PAS remoteproc subsystems
> +	 * set this flag so metadata persists until auth_and_reset() completes,
> +	 * as TrustZone keeps the buffers locked until then. Other callers leave
> +	 * it unset and metadata is freed immediately after the PAS_INIT call.

Please rewrite this to make it more succinct. It seems you could say the
same thing with just the words "free the metadata on error or if client
didn't request us to keep it".

Regards,
Bjorn

> +	 */
> +	if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
>  		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> -	} else if (ctx) {
> +	} else {
>  		ctx->ptr = mdata_buf;
>  		ctx->phys = mdata_phys;
>  		ctx->size = size;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 0391e30f42ba..38e6f6019825 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -722,6 +722,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  	if (IS_ERR(pas->pas_ctx))
>  		return PTR_ERR(pas->pas_ctx);
>  
> +	pas->pas_ctx->keep_mdt_buf = true;
>  	if (!pas->dtb_pas_id)
>  		return 0;
>  
> @@ -740,6 +741,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  	if (IS_ERR(pas->dtb_pas_ctx))
>  		return PTR_ERR(pas->dtb_pas_ctx);
>  
> +	pas->dtb_pas_ctx->keep_mdt_buf = true;
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
> index fb2ec3be6a16..1d132e89536e 100644
> --- a/include/linux/firmware/qcom/qcom_pas.h
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -22,6 +22,7 @@ struct qcom_pas_context {
>  	dma_addr_t phys;
>  	ssize_t size;
>  	bool use_tzmem;
> +	bool keep_mdt_buf;
>  };
>  
>  static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
> -- 
> 2.53.0
> 
