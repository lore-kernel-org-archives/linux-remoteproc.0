Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F863DD536
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 17:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323705; cv=none; b=IeqpCnJtLRnsrqEoijO9jjkyBAI2eX4uCdAtB5hJ7wr/ZYwwcnpPHEIBwgW63i6eBvuROaUJIabv+6O+WjoL5+IL3eC3oZjsziWrYFim1Riss2Xri6cWP4CaMy83lETy12g3aIHGa35FhHFqzqs0YPI1FNHu8mSsp/WZFlZFZ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323705; c=relaxed/simple;
	bh=wwnho7hEdXTC6ab0TaoU8pKnUrHIJ2RB2ggTwseerv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1XiKLuqlQwOeO/sTaM6llK3ty2YCZyhqK7enkyom05DCVPIYbIqdEFxnOfKiejDNfpATd2KCcQjpVVbxc0rET5P6Sn8AE1uD5Tg5/roGWEBKvILhCAzp0EemzzvxU7JKeAoDb25hvZkFXug1pC4vghAuiFvlY2j8rB7XJfi7CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xu4wCQtl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xu4wCQtl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37cae9b7536so999359a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782323703; x=1782928503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4NlwdAQFxJRK87l+yQ/+R9Mq1tuhwUOP4+/t1hmPNl0=;
        b=Xu4wCQtl5QsY42R07fX/KaLSN4VMfBSEw2+6dTpScpfb1Som20gCfvEabNyD/gB6m/
         4n9tn0amevgflvxV43WYqHig6fIcXu2CXwH7ubvMCd2lLIFEqSsP+bPuzLSsHSArol3Z
         Iq7WTWqFu/PYgqg05oYkKycmS2K2vftO/VJ+YOB9fw/2cKWWVHCvOzHxqA7IaF2slyPH
         FuA0NLLuT4rPphmXMPDgeQ3v1IOsGj0/oi6Rxlk4z2Ye4k4Q86nJuanwV+JFNl8KrEHu
         mTbtpEHINF7swKCqsg4zE4wHAtqheAYk35QQ1/LgLnNpgpaC4JN0R2lT4/HbmHZz9dUe
         QeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323703; x=1782928503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NlwdAQFxJRK87l+yQ/+R9Mq1tuhwUOP4+/t1hmPNl0=;
        b=Rt8SuZDGsuizFq/3p/iVaiHjApMnaMG2VIT8huuqghVLjhfBlThPiw1AMhh2dRzh9a
         1tzM2CYwdm79U6q3akDUZFMGfxAGoUmHT0qSvCuQNdUED21VzG9BeTXQka66aHDajJ0Y
         lt4rk31wvUn9ehhymEF4ggwBA350vaGN2IvMQZ/3CRHRmfLjQn90kZ39R9Fhi8FxBPEH
         Dk7GjzoZ1GXmsDWKFR3qn1Bw9RxNZABo2uQJTaSUEiXJvjQWkwUFaLnRRh+1+uwyrsGx
         CrRCKZRnJHISbOnKvWPO7SIQ3dXRCD0JRZuEEDLyWohz5fSR3/ef64DXIQJtY4I08304
         yHPA==
X-Forwarded-Encrypted: i=1; AHgh+RoTt20EUIUiJjydEPuwaWEj+3p2SydSTeJtOpITPpuAGFHgLXBDpi+qpA6bj2dAFk2+OsrArZoL5jPQ6SWtpq8D@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvJYUkmKc1caJb9mIV6vBgzEROL/uEaWn2i/n4rQXDlGB3Y0Y
	jJYNQXig6OeGfnFxNS0df0QJkvezYrqMoEErBaxjifVSeSCX/P4m9w8yP6FX0/EtqNQ=
X-Gm-Gg: AfdE7ckBrt2DnAEBvz02/Dh86ywVjJ4Sii2dLlGBHzZThnoE0M5F4A0rr2t+4O0GExi
	XAWzwa5hByQ195AoFVqoDy2zWbOq3u64/aIKY7mypCtSDkZpRpGFLqVxuNI4IAmXEXfpceJk16k
	BzY9I1lMY26iPBWW6U6xQR1MJ3WmTgEG77prMrBjxmfqHMM1vpgK8kI01/Iz0kYblAyOWSrcCVy
	LYw2zkh3ctn5nqTatRKZ6QLGwab8ZIYeWWBPoZMVuuREOh0DNUe0tKuWwggDE8gbdRMloY10f5O
	H8IUCn7QduQJzGS6BAZS9ljkjxHkWQbT0Mhw/vrN2ZDVmP9b4UljUCM8EgyqiIENb8R6j2sOo2u
	8bdI1O5KHugpqiUjVoSWTFNL6ti0hsJ3gaBtlq2OWaJ7RWAhy2VDGiudg3/35+4q3NpeYqkL4If
	W9Q8Y3Qb0TodIb7va7
X-Received: by 2002:a17:90b:2543:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-37de43b6c88mr5058783a91.23.1782323703018;
        Wed, 24 Jun 2026 10:55:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c087:d655:ef04:fbeb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df36c34basm273518a91.0.2026.06.24.10.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:55:02 -0700 (PDT)
Date: Wed, 24 Jun 2026 11:55:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] remoteproc: virtio: support dynamic number of vrings
Message-ID: <ajwZ9EPnrYu2M6G-@p14s>
References: <20260621-vring_flex-v1-1-c6c582fbe94b@valla.it>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621-vring_flex-v1-1-c6c582fbe94b@valla.it>

Hi Francesco,

On Sun, Jun 21, 2026 at 11:57:31PM +0200, Francesco Valla wrote:
> The number of vrings for each vdev has been fixed to 2 since the
> introduction of multi-vdev support [1]; this is completely fine for the
> rpmsg usecase, but can conflict with other virtio devices (CAN for
> example requires 3 virtqueues, entropy only 1, network a variable number
> and so on).

I suppose the remoteproc subsystem is involved because these other virtio
devices are behind a remote processor?  If so, how does virtio drivers for the
devices get called?

Otherwise I'm good with the code.

Thanks,
Mathieu

> 
> Remove the static vring allocation, transforming it to a flex array that
> is allocated at vdev probe time; for the existent usecases (i.e.: mainly
> rpmsg) this leads to no functional change, except the additional memory
> used for the counter associated to the new array.
> 
> The maximum number of virtqueues is limited to 256 due to the uint8_t
> value used inside the resource table to indicate the number of vring to
> allocate; for this reason, no additional plausibility check is performed
> on the number of vrings indicated by the resource table.
> 
> As a side effect, this also fixes the single virtqueue usecase, which
> was apparently supported also before but for which the remove action
> caused an error (because the remove action was trying to unmap also the
> second vring, which was in fact not mapped).
> 
> [1] https://lore.kernel.org/all/1330589497-4139-5-git-send-email-ohad@wizery.com/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_core.c   |  7 -------
>  drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++++++--------
>  include/linux/remoteproc.h             | 10 ++++------
>  3 files changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f003be006b1b..88504d6eed93 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -473,7 +473,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  {
>  	struct fw_rsc_vdev *rsc = ptr;
>  	struct device *dev = &rproc->dev;
> -	struct rproc_vdev *rvdev;
>  	size_t rsc_size;
>  	struct rproc_vdev_data rvdev_data;
>  	struct platform_device *pdev;
> @@ -494,12 +493,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
>  		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
>  
> -	/* we currently support only two vrings per rvdev */
> -	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
> -		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
> -		return -EINVAL;
> -	}
> -
>  	rvdev_data.id = rsc->id;
>  	rvdev_data.index = rproc->nb_vdev++;
>  	rvdev_data.rsc_offset = offset;
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index d5e9ff045a28..96f13f828b8e 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -115,8 +115,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>  	void *addr;
>  	int num, size;
>  
> -	/* we're temporarily limited to two virtqueues per rvdev */
> -	if (id >= ARRAY_SIZE(rvdev->vring))
> +	if (id >= rvdev->num_vrings)
>  		return ERR_PTR(-EINVAL);
>  
>  	if (!name)
> @@ -503,17 +502,20 @@ static int rproc_virtio_probe(struct platform_device *pdev)
>  	if (!rvdev_data)
>  		return -EINVAL;
>  
> -	rvdev = devm_kzalloc(dev, sizeof(*rvdev), GFP_KERNEL);
> +	rsc = rvdev_data->rsc;
> +
> +	rvdev = kzalloc_flex(*rvdev, vring, rsc->num_of_vrings);
>  	if (!rvdev)
>  		return -ENOMEM;
>  
>  	rvdev->id = rvdev_data->id;
>  	rvdev->rproc = rproc;
>  	rvdev->index = rvdev_data->index;
> +	rvdev->num_vrings = rsc->num_of_vrings;
>  
>  	ret = copy_dma_range_map(dev, rproc->dev.parent);
>  	if (ret)
> -		return ret;
> +		goto free_rvdev;
>  
>  	/* Make device dma capable by inheriting from parent's capabilities */
>  	set_dma_ops(dev, get_dma_ops(rproc->dev.parent));
> @@ -527,13 +529,11 @@ static int rproc_virtio_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, rvdev);
>  	rvdev->pdev = pdev;
>  
> -	rsc = rvdev_data->rsc;
> -
>  	/* parse the vrings */
>  	for (i = 0; i < rsc->num_of_vrings; i++) {
>  		ret = rproc_parse_vring(rvdev, rsc, i);
>  		if (ret)
> -			return ret;
> +			goto free_rvdev;
>  	}
>  
>  	/* remember the resource offset*/
> @@ -569,6 +569,9 @@ static int rproc_virtio_probe(struct platform_device *pdev)
>  	for (i--; i >= 0; i--)
>  		rproc_free_vring(&rvdev->vring[i]);
>  
> +free_rvdev:
> +	kfree(rvdev);
> +
>  	return ret;
>  }
>  
> @@ -579,7 +582,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
>  	struct rproc_vring *rvring;
>  	int id;
>  
> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
> +	for (id = 0; id < rvdev->num_vrings; id++) {
>  		rvring = &rvdev->vring[id];
>  		rproc_free_vring(rvring);
>  	}
> @@ -588,6 +591,8 @@ static void rproc_virtio_remove(struct platform_device *pdev)
>  	rproc_remove_rvdev(rvdev);
>  
>  	put_device(&rproc->dev);
> +
> +	kfree(rvdev);
>  }
>  
>  /* Platform driver */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 7c1546d48008..222e1a56cebc 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -339,10 +339,6 @@ struct rproc_subdev {
>  	void (*unprepare)(struct rproc_subdev *subdev);
>  };
>  
> -/* we currently support only two vrings per rvdev */
> -
> -#define RVDEV_NUM_VRINGS 2
> -
>  /**
>   * struct rproc_vring - remoteproc vring state
>   * @va:	virtual address
> @@ -370,9 +366,10 @@ struct rproc_vring {
>   * @id: virtio device id (as in virtio_ids.h)
>   * @node: list node
>   * @rproc: the rproc handle
> - * @vring: the vrings for this vdev
>   * @rsc_offset: offset of the vdev's resource entry
>   * @index: vdev position versus other vdev declared in resource table
> + * @num_vrings: the number of vrings for this vdev
> + * @vring: the vrings for this vdev
>   */
>  struct rproc_vdev {
>  
> @@ -382,9 +379,10 @@ struct rproc_vdev {
>  	unsigned int id;
>  	struct list_head node;
>  	struct rproc *rproc;
> -	struct rproc_vring vring[RVDEV_NUM_VRINGS];
>  	u32 rsc_offset;
>  	u32 index;
> +	unsigned int num_vrings;
> +	struct rproc_vring vring[] __counted_by(num_vrings);
>  };
>  
>  struct rproc *rproc_get_by_phandle(phandle phandle);
> 
> ---
> base-commit: ef0c9f75a19532d7675384708fc8621e10850104
> change-id: 20260618-vring_flex-b4d23d1974ba
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>
> 
