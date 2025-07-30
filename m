Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5652BCFB;
	Wed, 30 Jul 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753901099; cv=none; b=N4cfTjgp3IEDsamL4oAlVQrSbanZQnmGqByKmwDrMww2wU6NASuEaij8EW/WT8FdJkdvM/dlwlBu8eSNMemqwCO8hnLNy8GxgksykYhZD8/DA6B5Ibw6jTZclJeXDeF6c5nnp206xCHeoPusnNSSnYt3su83wbZnKKHbqet3g60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753901099; c=relaxed/simple;
	bh=DDzNrb4/KBwgOnqsjjO2c0fRBaYUNByny0LdYPhj7Xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vtwt803rII8thchgGgayaqsC2nj9+vPZreJfMhfOjHIRMgW62uKLQQ8bP8qlAsG/JM1O6HWRqfAtXc2MTsGc6//XFnW2giv5WTKVIHPG0olGik6DNJ4kp9iHPntOfOhNn9Mgtc0TM+p8ccLfBzFUB4HlBIvWXTq3ZeKzwI2DlfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DQTR+BRI; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DQTR+BRI"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56UIiagb2823687;
	Wed, 30 Jul 2025 13:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753901076;
	bh=TpA/iY6HaimgiIJXyRur9oIJCGOLfcmJvAehNpUMH2M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DQTR+BRIICbPG+m+2xwQTuD3eGv81YajwCL9NkicJEkYsyPGg8o/SzV2jq6cV+HCe
	 KJVjvQXb6JXdl3GXsncrhG5A6JE9wlepnWb0pIDLz5pBxGcfBAoplnGbv7jKv0Rqy9
	 RMeuN1hUp0Rba8rSU82HWiIubTM6M6rfwGXKqgQw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56UIia0X2121948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 13:44:36 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 13:44:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 13:44:36 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56UIia1a1390304;
	Wed, 30 Jul 2025 13:44:36 -0500
Message-ID: <214ee37b-050a-4764-9d05-4afa7cc2f8bd@ti.com>
Date: Wed, 30 Jul 2025 13:44:36 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] remoteproc: core: Do not process carveout and devmem
 rsc in attach mode
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <jm@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250724133144.3776839-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250724133144.3776839-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 7/24/25 8:31 AM, Beleswar Padhi wrote:
> When attaching to a remote processor, it is implied that the rproc was
> booted by an external entity. Thus, it's carveout and devmem resources
> would already have been processed by the external entity during boot.
> 
> Re-allocating the carveouts in Linux (without proper flags) would zero
> out the memory regions used by the firmware and can lead to undefined
> behaviour. And there is no need to re-map the memory regions for devmem
> resources as well.
> 

So the zeroing of the memory seems to be one of the core issues, and as
you know (just re-stating for folks following along) we internally carry
some hacks that allows allocating from these carveouts without the core
dma_alloc_coherent() zeroing the memory out. Those will not go upstream
so skipping the allocations in the first place does seem logical here,
but I'd like to better document what this implies.

For one, any requests for devmem and carveouts in the resource table
will not be handled by Linux and so *must* be already fulfilled by the
external entity that originally booted these rprocs.

Two, since Linux is not providing these memory regions, it doesn't know
they are in use by these rprocs, so we need to be sure to mark them as
no-map or similar, reusable carveout regions will not work here.

Lastly, I've been working on some plans to allow better passing of
buffers to rprocs which currently requires the rproc framework have
knowledge of which rprocs own which regions (for sanity checks,
IOMMU translations, etc..). I'll have to think on how we can still
associate these memories with the rprocs even if they were not
allocated using the below path and don't end up in rproc->mappings.

Andrew

> Therefore, do not process the carveout and devmem resources in attach
> mode by not appending them to the rproc->carveouts and rproc->mappings
> lists respectively.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Testing:
> 1. Tested IPC with remoteprocs in attach mode in TI platforms.
> [However, TI K3 platforms do not use resource table for carveouts,
> all the memory regions are reserved statically in Device Tree.]
> 
>   drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 825672100528..ef709a5fa73c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -640,6 +640,20 @@ static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
>   		return -EINVAL;
>   	}
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
>   	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>   	if (!mapping)
>   		return -ENOMEM;
> @@ -839,6 +853,22 @@ static int rproc_handle_carveout(struct rproc *rproc,
>   		return -EINVAL;
>   	}
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
>   	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
>   		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
>   

