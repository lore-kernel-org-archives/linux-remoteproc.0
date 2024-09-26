Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B0171675;
	Thu, 26 Sep 2024 03:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727322518; cv=none; b=KTRPvzsJJnCiY/TVMVODskgL6/0LUTlPrUNO0v/w47iwvGfe34b/2D5G0f1oCbo2NLoTs0xbvy2pCSFoS+CfI/gbdtZGhRTsq3Cj+AAZE2U/1p2CyrB9FBLApLXpWvkxg/Qe0HkisrRV80v4VH4q/JfSIfRh9Yg8Nhzz6W8J1io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727322518; c=relaxed/simple;
	bh=TT3botE3rQaiOP2T5I00OMpgg92VH5Ma6IG0PUW7s70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2N+mO+55vBp7Q17Wnim4/xStPzdLfa1G953/CWIaPM/beqba1Cw7kR1rKWxgjbCJITZudaVa3fhAUdJTU3jt4qzc5JJTdixZxoYahT34rRkKdLQJbL+88psouU9kcsLBA4dpczK8z5cOGpIwU+8nz25llkLIauadFKRHOzVT74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nay9SD8P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nay9SD8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1948C4CEC5;
	Thu, 26 Sep 2024 03:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727322518;
	bh=TT3botE3rQaiOP2T5I00OMpgg92VH5Ma6IG0PUW7s70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nay9SD8PrAy9k4cW4kSnRM0bKWIICeXA1yjBB6pZ3wkuK8uDpocj2eN3cNc7nH2JL
	 ekJwqgdoAt1Tozi9kBsd0jrWuH+ROXmxtAHAi+TZmNBaplNZsTubXpffpVrvtxFrQv
	 Espaf7mRfht0hwmK1fPrvZx8Xus+ADVHFy5dR4vu/30SPzVP+Zk8yF4AjJseamyLby
	 8htszNJJkP1ySIjN8eou0dr3KTlAKQRu3xFfianz4N6JC/uPUtJYSFMOVIJKLOqTgg
	 0UO+2jZ3r6JEFckKXgPrpmHyTvQrT9io17YQ5X9+9pUrJf4TT9GAcYVkAE7vsQsX1e
	 ZkRwL/XM2jaSg==
Date: Wed, 25 Sep 2024 20:51:57 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
Message-ID: <yvax326sikpqkaygfldunjpziwwlwccfzmi6r5ikaqoyvfvama@w7kifjv5yt47>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>

On Fri, Aug 30, 2024 at 11:51:44AM GMT, Arnaud Pouliquen wrote:
> Add support for releasing remote processor firmware through
> the Trusted Execution Environment (TEE) interface.
> 
> The tee_rproc_release_fw() function is called in the following cases:
> 
> - An error occurs in rproc_start() between the loading of the segments and
>   the start of the remote processor.
> - When rproc_release_fw is called on error or after stopping the remote
>   processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..32052dedc149 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -29,6 +29,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/rculist.h>
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc_tee.h>
>  #include <linux/iommu.h>
>  #include <linux/idr.h>
>  #include <linux/elf.h>
> @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);

I don't like the idea of having op-tee specific calls made from the
core. If the problem is that we need to unroll something we did at load,
can we instead come up with a more generic mechanism to unload that? Or
can we perhaps postpone the tee interaction until start() to avoid the
gap?


PS. Most of the Qualcomm drivers are TEE-based...so the "tee_interface"
boolean check here is not very nice.

Regards,
Bjorn

> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	if (ret) {
>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
>  			rproc->name, ret);
> -		goto reset_table_ptr;
> +		goto release_fw;
>  	}
>  
>  	/* power up the remote processor */
> @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	rproc->ops->stop(rproc);
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
> -reset_table_ptr:
> +release_fw:
> +	if (rproc->tee_interface)
> +		tee_rproc_release_fw(rproc);
>  	rproc->table_ptr = rproc->cached_table;
>  
>  	return ret;
> -- 
> 2.25.1
> 
