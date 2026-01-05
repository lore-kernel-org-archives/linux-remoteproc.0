Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50B283FC4
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 22:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767651399; cv=none; b=aqS8FhshGi8zM4752i3ZVsl2MW+l4v4Aj2x2DAByGU3Ng315/biW/9cANVCzuZs0V/IzroiAEoTVyeW4VqL79A76sjE7+yenvmenbwjz6oTS6rAeNFEVNel6DQ5kbOBfPjTXb6emLHlc67YzAYqMpqUU86OgoqLmawAidWFvC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767651399; c=relaxed/simple;
	bh=sxuOpDVmcxS0y+984zhJqhvj5uPVdZTauFqdbuZLFEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G52ru/3cK98X8iDPiU/8AgtL4X+Xcpuq8y0JBVO/xGHvbF16DI203T0Y0J+PUzgpJ8KHZqvBtW9FZ7DKAtgc7hXnc8eQKGM8hWS9rFpEwa6eSG0v1iTW/EKI1NIXbvr7ngzofxzrznxcuI8352iI0wK4XQ9zaarwdcp+QgPoWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guMki96P; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guMki96P"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0ac29fca1so3881925ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 14:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767651397; x=1768256197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CnUVUqPqeZj3uBC9OMfEyvC2v1C7JsZ9WatRVB2qxEc=;
        b=guMki96P0FjnePpdMcz15ZRG9VBFBGo8onWcUSsJ0v+jUvnqJf6x+CoY8f1B32bhaC
         ef6h5RQPXcsS1nyL5q5FZLMa7OS9emiswlEF1LX5/BzAkcURNzuDGVwbNsg7wyJ7WBbf
         VRnYXhhWM71EUDUlwsDyuLCDd+f15elbcqvYuId8ayl5hTdTopvjCASwIuhWIjZAUfsR
         u+0RvoJOQ3xEFf9lE0iZCu6mdiAO+Nkmt3fv3i2uQjJnH4zvXDZcSVH330Iq/HG3E5OB
         vvU7nYLRFx+aLU8yEseIv99ltCbzA686J4iMFajOkHam75lD3dDsl108SfNvE3k+ZzGs
         l8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767651397; x=1768256197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnUVUqPqeZj3uBC9OMfEyvC2v1C7JsZ9WatRVB2qxEc=;
        b=m/mKXn1BTbjpvCkYCTJpqH1mNeHODHJEBab+Fe39YxZnTQ/j3gQncC51lIn1ak0a87
         Nwp9ZXftKGVpZ5GAcBMDweQKBS+tuW9oW8LAoYdzeALeXdmO6bIMV2DHTbEDyTAXd/0x
         DMZR+lQ7fJ7mN4aOCiwVj0IUciGv/pHJR/h3zIm1XdUOpsvyODNrjobd4ERlaP7ZkYSX
         d4/bo7VGr5I6OECNuaBw1z1FiulxUocWSxTX0sJLGZh3yv/kSrhDyw9YmrjaHrg6wB3r
         KxipOpzBffUS9sYunt3MCMoHKaNce0T6sgx7aPJQvv99lqDD4fl0NnfsLk5EJb9D486r
         nQIg==
X-Forwarded-Encrypted: i=1; AJvYcCVIl/JRr5FIl1TPji35ws+iZJqmJt2OUBOBFjggN3F/u4MqCIJhWhYeKfnmhKbDHRfQED+lJFqlcDq2K0CX3dki@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzTAYxjR75ojsWnor3YsV4vMk/+DY+6Wd/fsRUbMITMIp/hwp
	zF8Ybi4GdR+9S16yoLtLsLKtNXGnmsayBQdn7Wg7yDfTPG+ozxCleuNRebs4Z65kaD8=
X-Gm-Gg: AY/fxX6bM1IpDeV134+nqMZb/2PHAfp2H71WIM2y3F3Dt/SeYBTtrAciRf6rrqf13QZ
	IgkStZlTZjS+30XkByGQjI0o0p1VLXrQrHUczBifQrYOvmgv6VQ/xOfnsoZ7TwvMQmJwfay5WdG
	+5Aw9Ltfr8Qd5z9+shYrRM7Dbt4VoIodB2i5H+2QunOoVTJkuu7iNdaxfQ4ckNJ70ixpP2y32VW
	mFurnnxKAwWy0Pk9DW/bkHTf5hWltbxWxSKSeAKFw3WGK6d6SDb1d3BytOll2sH6TJhXH0lYHwF
	gnT0eGrsAUX1PnvfjAgAYnBuiiKDFBCGY/hk0CuLVqTXL4PxqmDAJNCAoO4NtrdaVWLUU+v5AR+
	ED56CnOTuIbnQdHW7eQs4A6qfO3TJIra7olDDyD0UHxTG2oSqeWc5ivcBcUWniUFZ7u0YNqo3gA
	WjEKuzOO43IOjDn3uynWf5/4n3
X-Google-Smtp-Source: AGHT+IFbsf18BdWtCP1OIiQqEHJAmtLTt1hAikD6D8lF6RRDdyMObb7WGPdWGrrGijJ79i/5gVbYuA==
X-Received: by 2002:a17:903:2c8:b0:2a0:a92c:2cb6 with SMTP id d9443c01a7336-2a3e2cfd028mr8149165ad.36.1767651396518;
        Mon, 05 Jan 2026 14:16:36 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4893dsm2212295ad.28.2026.01.05.14.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 14:16:36 -0800 (PST)
Date: Mon, 5 Jan 2026 15:16:33 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aVw4QUp6j4vBOrOF@p14s>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229043146.4102967-1-tzungbi@kernel.org>

On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> reverse dependency exists where `clk_prepare` can trigger operations
> that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).

What operation would that be?  Please be specific so that I can trace the code.

> 
> Move clock prepare / unprepare operations to remoteproc prepare() /
> unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> to `prepare_lock`.

With the information presented to me, I don't see how doing that changes
anything.  @prepare_lock is simply held for a longer period of time.  

Thanks,
Mathieu

> 
> This breaks the dependency chain in the lockdep report:
> > WARNING: possible circular locking dependency detected
> > ...
> > the existing dependency chain (in reverse order) is:
> > ...
> > -> #0 (prepare_lock){+.+.}-{3:3}:
> >        __lock_acquire
> >        lock_acquire
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        clk_prepare
> >        scp_ipi_send [mtk_scp_ipi]
> >        scp_send_ipi [mtk_scp]
> >        mtk_rpmsg_send [mtk_rpmsg]
> >        rpmsg_send [rpmsg_core]
> >        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
>  drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index db8fd045468d..98d00bd5200c 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  	struct mtk_scp *scp = priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return IRQ_NONE;
> @@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  
>  	scp->data->scp_irq_handler(scp);
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp_elf_load_segments(rproc, fw);
>  leave:
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> @@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
>  	}
>  
>  	ret = scp_ipi_init(scp, fw);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
>  	struct scp_run *run = &scp->run;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
>  		goto stop;
>  	}
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
>  
>  	return 0;
>  
>  stop:
>  	scp->data->scp_reset_assert(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
>  	struct mtk_scp *scp = rproc->priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return ret;
> @@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
>  
>  	scp->data->scp_reset_assert(scp);
>  	scp->data->scp_stop(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return 0;
>  }
>  
> +static int scp_prepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	return clk_prepare(scp->clk);
> +}
> +
> +static int scp_unprepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
>  static const struct rproc_ops scp_ops = {
> +	.prepare	= scp_prepare,
> +	.unprepare	= scp_unprepare,
>  	.start		= scp_start,
>  	.stop		= scp_stop,
>  	.load		= scp_load,
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index c068227e251e..7a37e273b3af 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  	    WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
>  		return -EINVAL;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clock\n");
>  		return ret;
> @@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  
>  unlock_mutex:
>  	mutex_unlock(&scp->send_lock);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 
