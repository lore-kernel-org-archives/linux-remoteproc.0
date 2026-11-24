Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539346;
	b=gSVDhnjWycG1Xs1V/yWXdfPU1ea3WWxPvBruavF2H7wyRtQM1jU1BLHFxDAqFAfmnsUu
	 JdtL755oLC9YVzz4Ncss75j1mOdyE1GxpRCBzpHokVzYgTEII0tpDGcJZs6T/m5zIgkuo
	 wBcPXAYz35p36ELnSDwD/703nYkbfV5FPKqMC3vA9Pwu00/HQV36KgcvN+KNZ19ex1eSQ
	 sakzWf4dhniMruPZ0M5Nwv2QHDqVN/+6M1K/8WbSzmlEJ61zq9U6zpnuFB+hy+1ZBRePh
	 7R+wQwX3g8UXxkpqfTn2u5sr7LuuGhFHVIDPCtz+UQ31Y0Eob1L2aRlDaWYLuAkdfDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Eidq/u0B0uHPbaz+QN/RsKm5aUjYoNx3Hsqs43GeY5k=;
	b=AkWrPEu8GxiFJrlKSZzy+RLYQCRvx6sRS9uVu6ny7+9kfxGpkLKZCYKJopqiACEVRaRp
	 QOxtM5UGTpZzzMJFKGUMbylQdmXaoJ6W3Reymb8cxBorWaNQpBn01CGEtYy1b6FOdHPpa
	 YrVscxNajRAxaxuQUKecFBNPK5oRawUA8H1fMDoupoh2sctR+w5XQWZZz1AqwrCKs7/Bw
	 LXaZvbnixdXASmUQwKI4QlywoLgqS7Iz3nW2W1yuB9kHv37ZexcN1qeeBOjCPh676Dftj
	 hPyKoPf2BW9ZjkIz+NwIFAKUy75ztZ2sKQJf5hagbI2Qwq0E8WbwPrCjFxeSYy+JpqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sbPhVwUu;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6114606A33B
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 16:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6114606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sbPhVwUu
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so3692002b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795539345; x=1796144145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eidq/u0B0uHPbaz+QN/RsKm5aUjYoNx3Hsqs43GeY5k=;
        b=sbPhVwUuMo0ML11i6dL/aAmKDlDuMNtHoHPStcBow7//qphCTOL57iFhZdSYFOTTdR
         qdBTwWrbkzorPSH+kjcwvqhV2FB2fZnrrYV5g6onstPrEXI91BwubWFP7vcYN6vBWXZf
         /6uAr1Jhdhhbf2ZnXfXHlCI9x6MUbwFDhXc/bP+xtyaoG3KegCgDE82r/ZTig5QRm0cn
         rqpexyaev1GbA+8D4T5Rz63DVWTMr6b0GnRvzKXIw33aPh5T79w6SOpNnot+aVgNQovB
         eBoaw+XfCsLiLImg75guBApuACOXGtYdJA/mcDgBWikZkAVHNsJsXzDcw7rbZw40hlI7
         WNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539345; x=1796144145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eidq/u0B0uHPbaz+QN/RsKm5aUjYoNx3Hsqs43GeY5k=;
        b=Vnfcvv0tewAr4uPVSZxgNbHvt2iUUYLzf1Y09lAMu+4SZFVU+FYz6edMTpKD65ISFl
         D32kfZ12nrZil8ManG5ZvPD6tcmUXSRMZJYHy5lBTOn9TinthoRFZAH7nUeM/K2OcTFT
         f+bj8XxYRReqNqa7SQG0WwGQwuFzvxjuW5QbE8qvIloZyi9WVHswlRhDQzBCUAKOrlrx
         8CYL5USDS1x+IE/aV3Ym5j5sGgqyaTo97zbspjbSRfwnLzp5HSAmiOM8sHen1EBDhgFu
         PkvSAbZRTFC7JTeMBTjDhyTS0HX1QyPKpa0eqYNdlxKuvsqNcocQHQrRkEwyOzpm9gvb
         B+UA==
X-Forwarded-Encrypted: i=1; AL+hErGMl7UB/LfQSGY3MbkKqkI1k4jAcZwq0lbUA6617RwDsigGuQ6qV1ZHSc7qYxWJ/OtV9wSU8B86p3vVdvsPrQR5@vger.kernel.org
X-Gm-Message-State: APuU4Z+ODttsfhPGg7C7S0S7c/5vppnRXkT0kcgOl3/UNZ/I6Q1g3zA6
	wvIbl9gpAnJ/b3W/9LXwpYk9Efc6IvGXES9zu4lySY2GADiUj2tKm1QZi93wj42UBP+f3vLNNzb
	gpyJc
X-Gm-Gg: AZFdTZdvoW7f1k0Gy6n30hXT2tFLeAyY2DZnE7qPeykGq8gRdu85ZqCZp/y7TuyzhVD
	z6FwlFG9VNwU0HB67GkQ1oyanZFcbTQILAiaI4/TXVhXgxyDUFmubLJIgYbFjnNFgrA/eKYDIpN
	oX75rn7mY+1b1BtBfUsJAAwPteCiBxF/sY5rD8HsmrDTa8NgZxQxxsvwx/3oQRR+HQztYOIdh2I
	09WyJQqq8X+MBkku5vsqZiy3fFVrQ+JFmY48RrlHW1svP+uUw+q491rUMn+dHxlm2i1fRQCxzQ1
	krJCfU//nPGNJd3v72rJT0VzINWZGKXujvvMFAvTO36x/rpbvMYK5+RbVTRep6kS4CDOnS6y/jY
	SSwU9LuQAiZxeTRiUw12cbXSQlsZAsxjvsYWTrUCe3BphWvUOI5+MyIHYkiznwK/xRXdnYUKdjy
	DfGyI5rB4bK5d1Qdp6HK9tu/fLWg1iPnC2F+kZw/UrYQKJYnRg1Jvq3LxI1CSt0YigNKwMBjYbo
	sHwjCPiUojvwG0IN4ViXJ+yIPM0jI89Q4y4W29ZcrcaWTXBCIDpLthcbiB5nxkgWGGvXMjrAURg
	YMXP+6Vuk04NBhYavObOoEI26rSqNIA=
X-Received: by 2002:a05:6a00:bb8c:b0:89e:2a91:4fd1 with SMTP id d2e1a72fcca58-8c8794b8c20mr13015434b3a.6.1795539344765;
        Tue, 24 Nov 2026 08:55:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5349:b6fc:237c:41e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b889sm7546809b3a.42.2026.11.24.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:55:44 -0800 (PST)
Date: Tue, 24 Nov 2026 10:55:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] remoteproc: virtio: Decouple vdev from the parent
 pdev
Message-ID: <awXBjZ9jqXW1ETNZ@p14s>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
 <20261114-remoteproc_pdev_decouple-v2-1-95235dd056aa@valla.it>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114-remoteproc_pdev_decouple-v2-1-95235dd056aa@valla.it>

On Sat, Nov 14, 2026 at 09:06:33AM +0100, Francesco Valla wrote:
> The rproc-virtio platform device can have a lifetime different from the
> virtio_device it registers. During cleanup (e.g.: when a remoteproc is
> stopped) the platform device is de-registered by the remoteproc core,
> but the related virtio_device might be released later; if this happens,
> rproc_virtio_dev_release() will try to de-reference a NULL pointer as
> part of vdev_to_rvdev(). This can easily be reproduced with
> CONFIG_DEBUG_KOBJECT_RELEASE.

Can you provide steps to reproduce this problem?  Otherwise I'm good with the
simplifications provided by this patch.

Thanks,
Mathieu

> 
> Remove the access to the platform device structure from the cleanup path
> and interact instead with its backing device, whose refcount was
> explicitly increased during rproc_add_virtio_dev() and will be
> decremented as part of rproc_virtio_dev_release(). The same is done for
> the pdev de-reference inside vdev_to_rvdev(), even if no more used
> during cleanup, to maintain the same access pattern.
> 
> While at it, fix the comments on the specific matter.
> 
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 29a3a4c18097..b59f4acbb630 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -49,11 +49,7 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  
>  static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
>  {
> -	struct platform_device *pdev;
> -
> -	pdev = container_of(vdev->dev.parent, struct platform_device, dev);
> -
> -	return platform_get_drvdata(pdev);
> +	return dev_get_drvdata(vdev->dev.parent);
>  }
>  
>  static struct rproc *vdev_to_rproc(struct virtio_device *vdev)
> @@ -348,7 +344,7 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
>  
>  /*
>   * This function is called whenever vdev is released, and is responsible
> - * to decrement the remote processor's refcount which was taken when vdev was
> + * to decrement the platform device's refcount which was taken when vdev was
>   * added.
>   *
>   * Never call this function directly; it will be called by the driver
> @@ -357,14 +353,13 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
>  static void rproc_virtio_dev_release(struct device *dev)
>  {
>  	struct virtio_device *vdev = dev_to_virtio(dev);
> -	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>  
> -	kfree(vdev);
> +	of_reserved_mem_device_release(dev->parent);
> +	dma_release_coherent_memory(dev->parent);
>  
> -	of_reserved_mem_device_release(&rvdev->pdev->dev);
> -	dma_release_coherent_memory(&rvdev->pdev->dev);
> +	put_device(dev->parent);
>  
> -	put_device(&rvdev->pdev->dev);
> +	kfree(vdev);
>  }
>  
>  /**
> @@ -372,8 +367,7 @@ static void rproc_virtio_dev_release(struct device *dev)
>   * @rvdev: the remote vdev
>   * @id: the device type identification (used to match it with a driver).
>   *
> - * This function registers a virtio device. This vdev's partent is
> - * the rproc device.
> + * This function registers a virtio device with the platform device as parent.
>   *
>   * Return: 0 on success or an appropriate error value otherwise
>   */
> @@ -448,7 +442,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  	vdev->dev.parent = dev;
>  	vdev->dev.release = rproc_virtio_dev_release;
>  
> -	/* Reference the vdev and vring allocations */
> +	/* Reference the parent device, which will be used during teardown. */
>  	get_device(dev);
>  
>  	ret = register_virtio_device(vdev);
> 
> -- 
> 2.56.0
> 
