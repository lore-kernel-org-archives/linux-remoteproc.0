Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB45253F15;
	Mon,  7 Apr 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032604; cv=none; b=u+DseALxcfRCdp9Tfjpc2Hf5j2XMS51TYJL9OPywH00q1YQ3ki/M/4UoxFryKujSupTB+xIy4NFt/yiQbJMZNCULY1FBtFcuMA+jZu+AODbt81p928dHX2eNWWmBRPvv1TR4XAeJ+3maYA84T419JAKq+j7pyEs+p+eqS99ecgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032604; c=relaxed/simple;
	bh=BJu9B2LP9EIalQ3GZPi/3doAGmBH7tWgbeYPUcufNEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CANlDGEy0urfxf9rNpgBRLf7xDx/B9hgtVh1SaL4eTV+V0gJyNb0roWet3gKBhZspOEC6Q3AVOYW4+2MRYAYepgt7gjx0UCiKZZyZyTyXOO1QZq/aiviULPyTvImLERQPhAjldfGaPKRpMwJhGRYNQe5OcKJGLOpwiuBMt5pzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LO5YXX1G; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LO5YXX1G"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537DTd3U226109
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744032579;
	bh=48iUf6CFVE6YZK5q72DaOTxx/w3TmGHEnB7xMllYYxY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LO5YXX1GmJWibOH7EakBC1Fx95PkPYI2KsZSkR5ed91L+cpsmLTi75H4zLt6fH4xW
	 spU0skoMGfHbzGGyik+NK7IWgi73V6gFPtQqkxhqL8roPeS/I+eeKE0ISi3Lwy8R4t
	 XDq8KUhB9HTdD2Dmx83XU7izASCWM1eyE6rm/AE8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537DTd8S068967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:29:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:29:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:29:38 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537DTch6051962;
	Mon, 7 Apr 2025 08:29:38 -0500
Message-ID: <4502a296-5380-4339-bfb1-1d741b74cf01@ti.com>
Date: Mon, 7 Apr 2025 08:29:38 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/26] remoteproc: k3-r5: Re-order internal memory
 initialization function
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-2-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250317120622.1746415-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 3/17/25 7:05 AM, Beleswar Padhi wrote:
> The core's internal memory data structure will be refactored to be part
> of the k3_r5_rproc structure in a future commit. As a result, internal
> memory initialization will need to be performed inside
> k3_r5_cluster_rproc_init() after rproc_alloc().
> 
> Therefore, move the internal memory initialization function,
> k3_r5_core_of_get_internal_memories() above k3_r5_rproc_init() so that
> it can be invoked from there.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Just to keep things organized, does it make sense to also move
the other k3_r5_core_of_get_*_memories() up with this?

Also, you move k3_r5_release_tsp() up too but don't mention
that in the commit message.

Andrew

>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 158 +++++++++++------------
>   1 file changed, 79 insertions(+), 79 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index dbc513c5569c..b2738b9a1b2d 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1199,6 +1199,85 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
>   	return ret;
>   }
>   
> +static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
> +					       struct k3_r5_core *core)
> +{
> +	static const char * const mem_names[] = {"atcm", "btcm"};
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int num_mems;
> +	int i;
> +
> +	num_mems = ARRAY_SIZE(mem_names);
> +	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
> +	if (!core->mem)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_mems; i++) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						   mem_names[i]);
> +		if (!res) {
> +			dev_err(dev, "found no memory resource for %s\n",
> +				mem_names[i]);
> +			return -EINVAL;
> +		}
> +		if (!devm_request_mem_region(dev, res->start,
> +					     resource_size(res),
> +					     dev_name(dev))) {
> +			dev_err(dev, "could not request %s region for resource\n",
> +				mem_names[i]);
> +			return -EBUSY;
> +		}
> +
> +		/*
> +		 * TCMs are designed in general to support RAM-like backing
> +		 * memories. So, map these as Normal Non-Cached memories. This
> +		 * also avoids/fixes any potential alignment faults due to
> +		 * unaligned data accesses when using memcpy() or memset()
> +		 * functions (normally seen with device type memory).
> +		 */
> +		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
> +							resource_size(res));
> +		if (!core->mem[i].cpu_addr) {
> +			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
> +			return -ENOMEM;
> +		}
> +		core->mem[i].bus_addr = res->start;
> +
> +		/*
> +		 * TODO:
> +		 * The R5F cores can place ATCM & BTCM anywhere in its address
> +		 * based on the corresponding Region Registers in the System
> +		 * Control coprocessor. For now, place ATCM and BTCM at
> +		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
> +		 * SoCs) based on loczrama setting
> +		 */
> +		if (!strcmp(mem_names[i], "atcm")) {
> +			core->mem[i].dev_addr = core->loczrama ?
> +							0 : K3_R5_TCM_DEV_ADDR;
> +		} else {
> +			core->mem[i].dev_addr = core->loczrama ?
> +							K3_R5_TCM_DEV_ADDR : 0;
> +		}
> +		core->mem[i].size = resource_size(res);
> +
> +		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> +			mem_names[i], &core->mem[i].bus_addr,
> +			core->mem[i].size, core->mem[i].cpu_addr,
> +			core->mem[i].dev_addr);
> +	}
> +	core->num_mems = num_mems;
> +
> +	return 0;
> +}
> +
> +static void k3_r5_release_tsp(void *data)
> +{
> +	struct ti_sci_proc *tsp = data;
> +
> +	ti_sci_proc_release(tsp);
> +}
> +
>   static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   {
>   	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
> @@ -1358,78 +1437,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>   	}
>   }
>   
> -static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
> -					       struct k3_r5_core *core)
> -{
> -	static const char * const mem_names[] = {"atcm", "btcm"};
> -	struct device *dev = &pdev->dev;
> -	struct resource *res;
> -	int num_mems;
> -	int i;
> -
> -	num_mems = ARRAY_SIZE(mem_names);
> -	core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), GFP_KERNEL);
> -	if (!core->mem)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num_mems; i++) {
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   mem_names[i]);
> -		if (!res) {
> -			dev_err(dev, "found no memory resource for %s\n",
> -				mem_names[i]);
> -			return -EINVAL;
> -		}
> -		if (!devm_request_mem_region(dev, res->start,
> -					     resource_size(res),
> -					     dev_name(dev))) {
> -			dev_err(dev, "could not request %s region for resource\n",
> -				mem_names[i]);
> -			return -EBUSY;
> -		}
> -
> -		/*
> -		 * TCMs are designed in general to support RAM-like backing
> -		 * memories. So, map these as Normal Non-Cached memories. This
> -		 * also avoids/fixes any potential alignment faults due to
> -		 * unaligned data accesses when using memcpy() or memset()
> -		 * functions (normally seen with device type memory).
> -		 */
> -		core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
> -							resource_size(res));
> -		if (!core->mem[i].cpu_addr) {
> -			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
> -			return -ENOMEM;
> -		}
> -		core->mem[i].bus_addr = res->start;
> -
> -		/*
> -		 * TODO:
> -		 * The R5F cores can place ATCM & BTCM anywhere in its address
> -		 * based on the corresponding Region Registers in the System
> -		 * Control coprocessor. For now, place ATCM and BTCM at
> -		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
> -		 * SoCs) based on loczrama setting
> -		 */
> -		if (!strcmp(mem_names[i], "atcm")) {
> -			core->mem[i].dev_addr = core->loczrama ?
> -							0 : K3_R5_TCM_DEV_ADDR;
> -		} else {
> -			core->mem[i].dev_addr = core->loczrama ?
> -							K3_R5_TCM_DEV_ADDR : 0;
> -		}
> -		core->mem[i].size = resource_size(res);
> -
> -		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> -			mem_names[i], &core->mem[i].bus_addr,
> -			core->mem[i].size, core->mem[i].cpu_addr,
> -			core->mem[i].dev_addr);
> -	}
> -	core->num_mems = num_mems;
> -
> -	return 0;
> -}
> -
>   static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
>   					   struct k3_r5_core *core)
>   {
> @@ -1487,13 +1494,6 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
>   	return 0;
>   }
>   
> -static void k3_r5_release_tsp(void *data)
> -{
> -	struct ti_sci_proc *tsp = data;
> -
> -	ti_sci_proc_release(tsp);
> -}
> -
>   static int k3_r5_core_of_init(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
