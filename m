Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711321;
	b=NKRYmNZsPtz+aVBgfECutb4sjm+TcDxueLVeyupTC5mYWT/KgFRTsE6HK2aA7r/1Sih5
	 ApVTaueSyQIUn9h58e9RpXITxncBOP+fsFAaG+0NAc4flEPkCEbH7ev7/CAJsx5lpzG+h
	 rsqHZP4aXER56yMmfkwWSrYQLsjydixJGxHA8ggzjrmiiierDcKdzAwFodbqbWSYuwXdT
	 /707HNEtkFLdfGKQaOoc2GSQnPkw4VjHdIMzIkbhUElZfb22RzrrO3AQ1wpY9PHFSiKKk
	 XS49qZukTWLC9KjfnolFpeb7PV9i0YffU/aNh3nFGL1ircELgeeuezxDisrDAVO3EyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DFx8uLlfH38O1wM08TWFx3spSB+MhB3V2u/GmquIAZ4=;
	b=cFScqRdqWjCP40xej1bM5/653qlKBnLgbWTC9LmHJ1MsY9Kg5r0hQVFyIBpzYOnd1gMr
	 7ogk+uLq5I5vJqAPGgQbbU5Z2tY5f26OYLX+UOlbu/mJFpjVMWs3LWjsWhOmnuO7xO0m/
	 d8hLn+y/YcCEQFgbiIweKEQNtC2ByKo5qHVKGyBbKpdseHLuMG4COhU5otBJaXKPZNdsx
	 jd9wAs0XeVt698taeh55sKOmCZRbOgzn8Gpq2E15G66Ui5e0/jEsz04QUKbdal3EYF0RU
	 z2vfsEq4qydouHuFKwu30g9dH84hFLJP41aPWb+rMeP/XC9Rq98PffRXo33iwQqfwgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ym0pG+Bc;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1A606A6AD
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 16:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16E1A606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ym0pG+Bc
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8d1aec63541so292618b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795711320; x=1796316120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFx8uLlfH38O1wM08TWFx3spSB+MhB3V2u/GmquIAZ4=;
        b=Ym0pG+BcFynmcz8B2d4N6OfByGIpmzmiPdbaS9dWXroPgtGcZp55zqnFaCgjBR7xjA
         BZjE7sAgyb8bVxYfPIYJgZwXoEj4F/Fnl0f7Te5WNT3IBFd1a9ypYM7R2egWuZ2qLZd0
         60WjOd6UvqV9tdsxowg7RoNs2gt+UvjMCNr/OCQb4xxoNhO1BjzCr+9gmIteYmbzLC1z
         K+drecOscsEdGt2lJ9J4jiD/YJgTRIALCTTkDEc9PM0sCC2LQqqUzdQNJL73CiKYRthk
         9cYtRw4sqxr74by+lojDytgDUOS6iZcx5+5KXKEmRGANdpICQ16ZmFvymDqw4eCUS0WF
         kTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711320; x=1796316120;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx8uLlfH38O1wM08TWFx3spSB+MhB3V2u/GmquIAZ4=;
        b=TRAcXzwkXk6WVhefnS4owAIW+TPZCCSZ9e3r2tIj8ghQmlGMn8WHm2PVDzODV7DD3D
         kKTxbK7i6p3OXIHOqGCKwA6n/7a/vhMbJyiRYykHUF6DAl9YdcDz/cbKaXm+ZUyNPYMl
         vHuH7s4bmtREv1zbp3TQ11n8L3qGBlAZVIm72a/tkfoZZsyHDVPL6+yNk0iFsI4XilIe
         6Jgm9dHZwqVAgrj0e+1AXLodUGcDQjutpGqwHV0TD8zsUSRJ8baOCPi6D7uYHgnV/STx
         CQNFHOIZH6I9LMH3iLyG4Z8sI//fAIkkwnHDVF5ziQCUkQOW42x+ecG70qDRiNt7OHSE
         qmvg==
X-Forwarded-Encrypted: i=1; AL+hErGiSWcdHBQ16R+1k7wgGdtIMSAIZGR+2OpTuLYSHq5Yr5PcpgpfUHoLNE95GGg94EGvA5ytxPRJVL1uAzWwT1f4@vger.kernel.org
X-Gm-Message-State: APuU4Z8IAktOqVPaM4pBFpvdWNtIuAaCQsBn8gZV1LWHOTmA/Kxfu3fd
	bZZST6Po/PcpN3tIACehHjyOAZHx9FTUe/rYl7tXLdBIKxM3gHXBzIdlszHzY8Q7jnI=
X-Gm-Gg: AZFdTZfDYHi/X5+F0r9bQTjMkE4PqQZXjtCoMvG+b8GiiNol/CF6ASLZm5XtYxQHV+x
	BQFg7eoXdzJq8z+fvSShmOG7dW6AJiDFxrYljm1vbbqkefD17Y2uNndjbabdLJpBSc6set90BFP
	Brb3RPEWW1wVfaFcsIXfDKO2MrVY3CwvbbombTqR+9FtsIWk747n+y+r+z1GIFEPjiyYHPSXwWO
	2dTy6sja3T7qC2n64QcGk1HX+jA3Z8UQ9C4XH8vHclSzD27dSYU1IbhcSNn/jMTbmq2T6MtWTXV
	MRGClYTYYtmbw2nTo0xXPM6+irie0E9jYqd4joIKchv77WRIuarC9MoBOw5CDhJpD2nUD4HV3rU
	dRd2hZdh20wtuylHYOnQMjuhxZR4MNWmmh7smq+ro1ozFxfrqIm62qSWnxjslhLvtnvQJ6oQeHF
	x/7n14S+YTo6p082IaGFhdyWpQpngK9fzqqPMYqJ2g19BHu+anMgqc6WakNBdo18dHypXMJcs03
	IWFLXOgugNIFEclFeLKUoDTUtVJitq7Rg3PuWCYzK41m8Bukv6eCFQDCkdSIPhNcmubzPYj3DyG
	VF5ozXdKU8zkwYQiYjKocStZyZj+2uqsGTUdp6kFtZ8325N3Y0eTEw==
X-Received: by 2002:a05:6a00:27a2:b0:8bc:686a:a54b with SMTP id d2e1a72fcca58-8c87daf2a2amr19220157b3a.56.1795711320184;
        Thu, 26 Nov 2026 08:42:00 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ce00:143c:88b9:bd58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm11312174b3a.7.2026.11.26.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:59 -0800 (PST)
Date: Thu, 26 Nov 2026 10:41:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] remoteproc: virtio: Drop rvdevs list and
 associated functions
Message-ID: <awhhVRBokzbdPJB2@p14s>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
 <20261114-remoteproc_pdev_decouple-v2-3-95235dd056aa@valla.it>
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
In-Reply-To: <20261114-remoteproc_pdev_decouple-v2-3-95235dd056aa@valla.it>

On Sat, Nov 14, 2026 at 09:06:35AM +0100, Francesco Valla wrote:
> The rvdevs linked list is kept at rproc side to track the rproc_vdev
> devices registered at runtime and de-register them during cleanup, but
> the same information can be obtained from the driver core using
> parent-child relationships coupled with driver name.
> 
> Drop the list and all associated functions and de-register the virtio
> children of a remoteproc using device_for_each_child(), with the
> following benefits:
> 
>  - increased separation between the core and virtio parts of remoteproc;
>  - reduction in code and occupied memory;
>  - the platform devices whose probe fail are now de-registered correctly
>    during remoteproc cleanup.
> 
> A dedicated macro is used to register rproc-virtio platform devices to
> avoid duplication (in code, not in memory) of the same string.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++++++++----------------
>  drivers/remoteproc/remoteproc_internal.h |  4 ++--
>  drivers/remoteproc/remoteproc_virtio.c   |  5 +----
>  include/linux/remoteproc.h               |  6 +-----
>  4 files changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d5fa9d23bd5c..296b955f415f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -431,17 +431,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
>  	}
>  }
>  
> -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> -{
> -	if (rvdev && rproc)
> -		list_add_tail(&rvdev->node, &rproc->rvdevs);
> -}
> -
> -void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> -{
> -	if (rvdev)
> -		list_del(&rvdev->node);
> -}
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -513,7 +502,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	 * as device id, then we get duplication in sysfs, so need to use
>  	 * PLATFORM_DEVID_AUTO to auto select device id.
>  	 */
> -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> +	pdev = platform_device_register_data(dev, RPROC_VIRTIO_DRV_NAME,
> +					     PLATFORM_DEVID_AUTO, &rvdev_data,
>  					     sizeof(rvdev_data));
>  	if (IS_ERR(pdev)) {
>  		dev_err(dev, "failed to create rproc-virtio device\n");
> @@ -1212,6 +1202,19 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int rproc_unregister_vdev_pdev(struct device *dev, void *data)
> +{
> +	struct platform_device *pdev;
> +
> +	if (!dev_is_platform(dev))
> +		return 0;

What other child of a remoteproc do you expect isn't a platform driver?

> +
> +	pdev = to_platform_device(dev);
> +	if (!strcmp(pdev->name, RPROC_VIRTIO_DRV_NAME))
> +		platform_device_unregister(pdev);
> +
> +	return 0;
> +}
>  
>  /**
>   * rproc_resource_cleanup() - clean up and free all acquired resources
> @@ -1224,7 +1227,6 @@ void rproc_resource_cleanup(struct rproc *rproc)
>  {
>  	struct rproc_mem_entry *entry, *tmp;
>  	struct rproc_debug_trace *trace, *ttmp;
> -	struct rproc_vdev *rvdev, *rvtmp;
>  	struct device *dev = &rproc->dev;
>  
>  	/* clean up debugfs trace entries */
> @@ -1258,9 +1260,8 @@ void rproc_resource_cleanup(struct rproc *rproc)
>  		kfree(entry);
>  	}
>  
> -	/* clean up remote vdev entries */
> -	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
> -		platform_device_unregister(rvdev->pdev);
> +	/* unregister platform devices */
> +	device_for_each_child(&rproc->dev, NULL, rproc_unregister_vdev_pdev);
>  
>  	rproc_coredump_cleanup(rproc);
>  }
> @@ -2521,7 +2522,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	INIT_LIST_HEAD(&rproc->carveouts);
>  	INIT_LIST_HEAD(&rproc->mappings);
>  	INIT_LIST_HEAD(&rproc->traces);
> -	INIT_LIST_HEAD(&rproc->rvdevs);
>  	INIT_LIST_HEAD(&rproc->subdevs);
>  	INIT_LIST_HEAD(&rproc->dump_segments);
>  
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 3a742ef6ef60..d587a3301811 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -18,6 +18,8 @@
>  #include <linux/io.h>
>  #endif
>  
> +#define RPROC_VIRTIO_DRV_NAME	"rproc-virtio"
> +
>  struct rproc;
>  
>  struct rproc_debug_trace {
> @@ -122,8 +124,6 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  						       const struct firmware *fw);
>  struct rproc_mem_entry *
>  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
> -void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>  
>  #ifdef CONFIG_HAS_IOMEM
>  static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 6cfdab831185..403519e78ee3 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -549,8 +549,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
>  			goto unwind_vring_allocations;
>  	}
>  
> -	rproc_add_rvdev(rproc, rvdev);
> -
>  	rvdev->subdev.start = rproc_vdev_do_start;
>  	rvdev->subdev.stop = rproc_vdev_do_stop;
>  
> @@ -588,7 +586,6 @@ static void rproc_virtio_remove(struct platform_device *pdev)
>  	}
>  
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	rproc_remove_rvdev(rvdev);
>  
>  	put_device(&rproc->dev);
>  }
> @@ -598,7 +595,7 @@ static struct platform_driver rproc_virtio_driver = {
>  	.probe		= rproc_virtio_probe,
>  	.remove		= rproc_virtio_remove,
>  	.driver		= {
> -		.name	= "rproc-virtio",
> +		.name	= RPROC_VIRTIO_DRV_NAME,
>  	},
>  };
>  builtin_platform_driver(rproc_virtio_driver);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 00019b1895e6..77ea0e1067e0 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -228,8 +228,7 @@ enum rproc_features {
>   * @carveouts: list of physically contiguous memory allocations
>   * @mappings: list of iommu mappings we initiated, needed on shutdown
>   * @bootaddr: address of first instruction to boot rproc with (optional)
> - * @rvdevs: list of remote virtio devices
> - * @vq_srcu: SRCU domain for the virtqueue callbacks of @rvdevs
> + * @vq_srcu: SRCU domain for the virtqueue callbacks of the virtio devices
>   * @subdevs: list of subdevices, to following the running state
>   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
>   * @index: index of this rproc device
> @@ -275,7 +274,6 @@ struct rproc {
>  	struct list_head carveouts;
>  	struct list_head mappings;
>  	u64 bootaddr;
> -	struct list_head rvdevs;
>  	struct srcu_struct vq_srcu;
>  	struct list_head subdevs;
>  	struct idr notifyids;
> @@ -351,7 +349,6 @@ struct rproc_vring {
>   * @subdev: handle for registering the vdev as a rproc subdevice
>   * @pdev: remoteproc virtio platform device
>   * @id: virtio device id (as in virtio_ids.h)
> - * @node: list node
>   * @rproc: the rproc handle
>   * @vring: the vrings for this vdev
>   * @rsc_offset: offset of the vdev's resource entry
> @@ -362,7 +359,6 @@ struct rproc_vdev {
>  	struct platform_device *pdev;
>  
>  	unsigned int id;
> -	struct list_head node;
>  	struct rproc *rproc;
>  	struct rproc_vring vring[RVDEV_NUM_VRINGS];
>  	u32 rsc_offset;
> 
> -- 
> 2.56.0
> 
