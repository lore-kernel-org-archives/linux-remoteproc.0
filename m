Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7818048
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jan 2024 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3xN0lJg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6db786df38dso1170905b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jan 2024 10:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705342463; x=1705947263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YBn2qZQx8P3zg2r39V5+2Dh28lfRonfO6AcXOPJi0eo=;
        b=Z3xN0lJgoMpkO7ZmWQWssNERIlWY/LH1cbKdVjbqumPdwcFgGfR6CrSozF90Ub0YrZ
         noGdHjoPd4sUouvD9veEsjJWKeXlLJWIdTP2R8DuZWWGDKHBnTOP/67SmPCZN4xeSa+E
         h1gQTnzJh6o6XrHW493lsywTl3FHNd+youIwd5px/QZMH0o4ohGtD2YBUvG7wzcflSFM
         9jzvGcnmpL8eplLFjgTsP8VlIGhycspNS/vH+F1RUi4MuE6/MDJqlyjbjHiZJ+DCQ9jr
         JdDQb81joMFiIdqhNpzAETy1lTwCamZd/G1sX8eiWLm6GpYaP40gZOGOZnH7HSRl1M8W
         CyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705342463; x=1705947263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBn2qZQx8P3zg2r39V5+2Dh28lfRonfO6AcXOPJi0eo=;
        b=YbVi+xxFwiK4Se1TTB4Ur7PLOSGzPYWI0YGFz4f4uMUDvGfzlmnQzUUOH0rMNqi5+f
         2un23Ah4AW3nJtr3Uwj47nOt1jczZAr0vNkUEbXLGbRk/LzKMK7O3ivhAN8/NGLKytp5
         mL29Sn+NA9nJHboFc0iimH62BsdwVuvEyMgYCxjRM2Aq4+QJM2LN5Frpa4cwyb9EiUFz
         R84OlBFg9v602NBYz8Er9XnUlkVvnpTbK1YuyAVgJxoZJXD0GCvc+Frsu3gsh8g8/p+V
         LInNS91Rx6fsQjuQCArQS3DUIVy5EAwBclJ3YqrN6kc5lqdKfSHIIDwW5N7GXtbSkCJy
         8IrQ==
X-Gm-Message-State: AOJu0Yz6Ba7SeHfLzzEnAUr8wwnd8fPjigwZ4NWlDDIjbUm9PJIMv1sA
	+o6u5K54a4/ZFRkB1wNZciRiv33kzR4fgw==
X-Google-Smtp-Source: AGHT+IE+Bl8C8gShAKZw9kvDRcOSbLDBFpmGYYhTQ367w8nhdPd/vWjoDLLYXnHf7zdXAZEBXtu+7w==
X-Received: by 2002:a05:6a20:9c89:b0:19b:2303:88a4 with SMTP id mj9-20020a056a209c8900b0019b230388a4mr731854pzb.105.1705342463524;
        Mon, 15 Jan 2024 10:14:23 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800::5ced])
        by smtp.gmail.com with ESMTPSA id lc18-20020a056a004f5200b006d9cf4b56edsm8116673pfb.175.2024.01.15.10.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 10:14:23 -0800 (PST)
Date: Mon, 15 Jan 2024 11:14:20 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Levinsky <ben.levinsky@xilinx.com>
Subject: Re: [PATCH v4 1/2] remoteproc: Make rproc_get_by_phandle() work for
 clusters
Message-ID: <ZaV1/GEiV2VS6c2p@p14s>
References: <20240103221124.3063683-1-tanmay.shah@amd.com>
 <20240103221124.3063683-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103221124.3063683-2-tanmay.shah@amd.com>

Hi Tanmay,

Thanks for the refactoring, this is in line with what Bjorn and I have talked
about at Plumbers.  Please see my comments below.

On Wed, Jan 03, 2024 at 02:11:24PM -0800, Tanmay Shah wrote:
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> Multi-cluster remoteproc designs typically have the following DT
> declaration:
> 
> 	remoteproc_cluster {
> 		compatible = "soc,remoteproc-cluster";
> 
>                 core0: core0 {
> 			compatible = "soc,remoteproc-core"
>                         memory-region;
>                         sram;
>                 };
> 
>                 core1: core1 {
> 			compatible = "soc,remoteproc-core"
>                         memory-region;
>                         sram;
>                 }
>         };
> 
> A driver exists for the cluster rather than the individual cores
> themselves so that operation mode and HW specific configurations
> applicable to the cluster can be made.
> 
> Because the driver exists at the cluster level and not the individual
> core level, function rproc_get_by_phandle() fails to return the
> remoteproc associated with the phandled it is called for.
> 
> This patch enhances rproc_get_by_phandle() by looking for the cluster's
> driver when the driver for the immediate remoteproc's parent is not
> found.
> 
> Reported-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Humm... You wrote the code in this patch so you also deserve some credit.  If I
end up applying this set I will add myself as a co-developer, i.e
Co-developed-by:, and add your SoB.  If you end up re-spinning this set then
simply do so for the next revision.

As far as I am concerned this patchset is ready.  I will wait to see if other
people would like to see something adjusted.

Mathieu

> ---
>  drivers/remoteproc/remoteproc_core.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 695cce218e8c..0b3b34085e2f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -33,6 +33,7 @@
>  #include <linux/idr.h>
>  #include <linux/elf.h>
>  #include <linux/crc32.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_ring.h>
> @@ -2112,6 +2113,7 @@ EXPORT_SYMBOL(rproc_detach);
>  struct rproc *rproc_get_by_phandle(phandle phandle)
>  {
>  	struct rproc *rproc = NULL, *r;
> +	struct device_driver *driver;
>  	struct device_node *np;
>  
>  	np = of_find_node_by_phandle(phandle);
> @@ -2122,7 +2124,26 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  	list_for_each_entry_rcu(r, &rproc_list, node) {
>  		if (r->dev.parent && device_match_of_node(r->dev.parent, np)) {
>  			/* prevent underlying implementation from being removed */
> -			if (!try_module_get(r->dev.parent->driver->owner)) {
> +
> +			/*
> +			 * If the remoteproc's parent has a driver, the
> +			 * remoteproc is not part of a cluster and we can use
> +			 * that driver.
> +			 */
> +			driver = r->dev.parent->driver;
> +
> +			/*
> +			 * If the remoteproc's parent does not have a driver,
> +			 * look for the driver associated with the cluster.
> +			 */
> +			if (!driver) {
> +				if (r->dev.parent->parent)
> +					driver = r->dev.parent->parent->driver;
> +				if (!driver)
> +					break;
> +			}
> +
> +			if (!try_module_get(driver->owner)) {
>  				dev_err(&r->dev, "can't get owner\n");
>  				break;
>  			}
> -- 
> 2.25.1
> 
