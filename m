Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C427E1FD7AD;
	Tue, 17 Dec 2024 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451416; cv=none; b=cCfKGcthYTmF3ZERRcLFaBh+onMb/Y+6v+nrE0ns9ezO8NzSeb02uxOIDUrO1ckfZKWGK8sBIZuJSUdN1aUnpWGr9izujGIJFaD+UZCBeDlcTxX7fGvdw/YdNa3LN+m9BR98j/OFT/k7CrfQdmegUi4XB/sQzhdTghFdmyAnlvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451416; c=relaxed/simple;
	bh=3gVW8sJ19x+XhJVhfUINu8KjcT0AJItbbgXL3rS2obg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HdHfEZ/VLmCYXTM5E/1XXrJbJxwJrVLBp4w5SGVt8v0JTTb5Lj6dp8UxEjd/FcmSbT6XDJKpI+RMrBD2FfuACmI5eNTs4LvfIMeHqKaic7z/NiTovWdVMv72nR5IV+EDTGyJQa654L1Iid7hC187BF4iqX8N8vb1UtLW6FyQPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=h09aMngD; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h09aMngD"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHG3EES026092
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 10:03:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734451394;
	bh=zby8vFaemZ6HefASXb1ZXOjPbI3Ei5fPe0K1T7m5K2E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=h09aMngDbvpNDAXkLd4N6bC5ptokBzjnayDaWZURV3fLeEOBSOh2mi9ZUEcX9DFeE
	 i84un0JULoAftvrBebW14ov+k1JnYOlDiKJ2EeH0NviamR49wEJQBWtmQJnzsrysQV
	 GbVfuSLkYwXSOLT8Gi7z4e9Wez8zAPbydGoLs2PA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHG3EfL090725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 10:03:14 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 10:03:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 10:03:13 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHG3Dca017409;
	Tue, 17 Dec 2024 10:03:13 -0600
Message-ID: <5c016c4a-b7f2-4e9a-bb99-f56e0bf86e6f@ti.com>
Date: Tue, 17 Dec 2024 10:03:13 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] remoteproc: k3-r5: Use devm_ioremap_wc() helper
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241204111130.2218497-1-b-padhi@ti.com>
 <20241204111130.2218497-5-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241204111130.2218497-5-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/4/24 5:11 AM, Beleswar Padhi wrote:
> Use a device lifecycle managed ioremap helper function. This helps
> prevent mistakes like unmapping out of order in cleanup functions and
> forgetting to unmap on all error paths.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 40 +++++-------------------
>   1 file changed, 8 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 2966cb210403..1a7681502f62 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1004,17 +1004,13 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
>   	/* use remaining reserved memory regions for static carveouts */
>   	for (i = 0; i < num_rmems; i++) {
>   		rmem_np = of_parse_phandle(np, "memory-region", i + 1);
> -		if (!rmem_np) {
> -			ret = -EINVAL;
> -			goto unmap_rmem;
> -		}
> +		if (!rmem_np)
> +			return -EINVAL;
>   
>   		rmem = of_reserved_mem_lookup(rmem_np);
>   		of_node_put(rmem_np);
> -		if (!rmem) {
> -			ret = -EINVAL;
> -			goto unmap_rmem;
> -		}
> +		if (!rmem)
> +			return -EINVAL;
>   
>   		kproc->rmem[i].bus_addr = rmem->base;
>   		/*
> @@ -1029,12 +1025,11 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
>   		 */
>   		kproc->rmem[i].dev_addr = (u32)rmem->base;
>   		kproc->rmem[i].size = rmem->size;
> -		kproc->rmem[i].cpu_addr = ioremap_wc(rmem->base, rmem->size);
> +		kproc->rmem[i].cpu_addr = devm_ioremap_wc(dev, rmem->base, rmem->size);
>   		if (!kproc->rmem[i].cpu_addr) {
>   			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
>   				i + 1, &rmem->base, &rmem->size);
> -			ret = -ENOMEM;
> -			goto unmap_rmem;
> +			return -ENOMEM;
>   		}
>   
>   		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> @@ -1045,19 +1040,6 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
>   	kproc->num_rmems = num_rmems;
>   
>   	return 0;
> -
> -unmap_rmem:
> -	for (i--; i >= 0; i--)
> -		iounmap(kproc->rmem[i].cpu_addr);
> -	return ret;
> -}
> -
> -static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
> -{
> -	int i;
> -
> -	for (i = 0; i < kproc->num_rmems; i++)
> -		iounmap(kproc->rmem[i].cpu_addr);
>   }
>   
>   /*
> @@ -1285,10 +1267,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   		}
>   
>   		ret = rproc_add(rproc);
> -		if (ret) {
> -			dev_err(dev, "rproc_add failed, ret = %d\n", ret);
> -			goto err_add;
> -		}
> +		if (ret)
> +			dev_err_probe(dev, ret, "rproc_add failed\n");

Did you mean to return the result of dev_err_probe() here? Without that
now anything between here and where err_add used to be will get run.
Might be more clear that this is correct by still doing a "goto out;"

Andrew

>   
>   		/* create only one rproc in lockstep, single-cpu or
>   		 * single core mode
> @@ -1333,8 +1313,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   
>   err_powerup:
>   	rproc_del(rproc);
> -err_add:
> -	k3_r5_reserved_mem_exit(kproc);
>   out:
>   	/* undo core0 upon any failures on core1 in split-mode */
>   	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
> @@ -1379,8 +1357,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>   		mbox_free_channel(kproc->mbox);
>   
>   		rproc_del(rproc);
> -
> -		k3_r5_reserved_mem_exit(kproc);
>   	}
>   }
>   
