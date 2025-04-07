Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409335959;
	Mon,  7 Apr 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033077; cv=none; b=noT+N1yyNbutTRPHIHypa8LH4WyQ0kja+cSql5SLOkwz3r3HbTHK03FK7hMQvVz5aCSRAuTHdSpmtP/DxDoB/Od7hjTJG5PfvAr99HHaT0EUK7e/y1XKJDZawsAogkaOBhnmd/NQ/7Tke1NBg31YcLJx4hw+ZreI5MKgOCupwBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033077; c=relaxed/simple;
	bh=f5GDDJgSRxiOFPVGid4NO407JXRs2uJDGQUIqHYt6so=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mgv5B1RBL9Ijtd2eesa8uBlx3z/1jT8BKSrgwDmr8M7CmL21zZ3sYZThO46i1obNP/VelWKKRlF63Li7T0W5jq5UbmchOkgjbjsHzs1eqBtu2XHrIDlSXQs5tpFtE3N9PJUQvER2jVGfvHhRUTbXQElpDshjyZAAMoX5dfixrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k3KcTo4B; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k3KcTo4B"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Dbi0U874366
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744033064;
	bh=zyBUYRmfceZIhDmuxqW+GqAdGByCBZdWwRne1MIXY3Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k3KcTo4BZOY8hRS3CuO4Kw2kcKmi39Uw4dRYd/Nes3Q5UoFQF6aEQrxLy8toRSTRU
	 E4dmffQBf4qtnGGa+T7t798cRdpuA+px/VA2ZC/35fLqv9i+FX1GFK2YEsOvPlccOg
	 4yG+EyvjhoOQDZjOEFuCWsMwAuyNhbXl49SNrWT4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537DbiaE007681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:37:44 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:37:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:37:44 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Dbhea062869;
	Mon, 7 Apr 2025 08:37:43 -0500
Message-ID: <3117c242-02ec-4607-90c1-2bf771be5ea0@ti.com>
Date: Mon, 7 Apr 2025 08:37:43 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/26] remoteproc: k3-r5: Use k3_r5_rproc_mem_data
 structure for memory info
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-4-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250317120622.1746415-4-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 3/17/25 7:05 AM, Beleswar Padhi wrote:
> The ti_k3_r5_remoteproc.c driver previously hardcoded device memory
> region addresses and names. Change this to use the k3_r5_rproc_mem_data
> structure to store memory information. This aligns with K3 DSP and M4
> drivers, and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 65 ++++++++++++++++++++----
>   1 file changed, 56 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 525f26996b56..29205d9e21af 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -84,18 +84,44 @@ enum cluster_mode {
>   	CLUSTER_MODE_SINGLECORE
>   };
>   
> +/**
> + * struct k3_r5_mem_data - memory definitions for a R5
> + * @name: name for this memory entry
> + * @dev_addr: device address for the memory entry
> + */
> +struct k3_r5_mem_data {
> +	const char *name;
> +	const u32 dev_addr;
> +};
> +
> +/**
> + * struct k3_r5_dev_data - device data structure for a R5
> + * @mems: pointer to memory definitions for a R5
> + * @num_mems: number of memory regions in @mems
> + * @boot_align_addr: boot vector address alignment granularity
> + * @uses_lreset: flag to denote the need for local reset management
> + */
> +struct k3_r5_dev_data {
> +	const struct k3_r5_mem_data *mems;
> +	u32 num_mems;
> +	u32 boot_align_addr;
> +	bool uses_lreset;
> +};
> +
>   /**
>    * struct k3_r5_soc_data - match data to handle SoC variations
>    * @tcm_is_double: flag to denote the larger unified TCMs in certain modes
>    * @tcm_ecc_autoinit: flag to denote the auto-initialization of TCMs for ECC
>    * @single_cpu_mode: flag to denote if SoC/IP supports Single-CPU mode
>    * @is_single_core: flag to denote if SoC/IP has only single core R5
> + * @core_data: pointer to R5-core-specific device data
>    */
>   struct k3_r5_soc_data {
>   	bool tcm_is_double;
>   	bool tcm_ecc_autoinit;
>   	bool single_cpu_mode;
>   	bool is_single_core;
> +	const struct k3_r5_dev_data *core_data;
>   };
>   
>   /**
> @@ -151,6 +177,7 @@ struct k3_r5_core {
>    * @rmem: reserved memory regions data
>    * @num_rmems: number of reserved memory regions
>    * @reset: reset control handle
> + * @data: pointer to R5-core-specific device data
>    * @tsp: TI-SCI processor control handle
>    * @ti_sci: TI-SCI handle
>    * @ti_sci_id: TI-SCI device identifier
> @@ -166,6 +193,7 @@ struct k3_r5_rproc {
>   	struct k3_r5_mem *rmem;
>   	int num_rmems;
>   	struct reset_control *reset;
> +	const struct k3_r5_dev_data *data;
>   	struct ti_sci_proc *tsp;
>   	const struct ti_sci_handle *ti_sci;
>   	u32 ti_sci_id;
> @@ -1207,31 +1235,32 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
>   static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>   					       struct k3_r5_rproc *kproc)
>   {
> -	static const char * const mem_names[] = {"atcm", "btcm"};
> +	const struct k3_r5_dev_data *data = kproc->data;
>   	struct device *dev = &pdev->dev;
>   	struct k3_r5_core *core = kproc->priv;
>   	struct resource *res;
>   	int num_mems;
>   	int i;
>   
> -	num_mems = ARRAY_SIZE(mem_names);
> -	kproc->mem = devm_kcalloc(dev, num_mems, sizeof(*kproc->mem), GFP_KERNEL);
> +	num_mems = kproc->data->num_mems;
> +	kproc->mem = devm_kcalloc(kproc->dev, num_mems, sizeof(*kproc->mem),
> +				  GFP_KERNEL);
>   	if (!kproc->mem)
>   		return -ENOMEM;
>   
>   	for (i = 0; i < num_mems; i++) {
>   		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   mem_names[i]);
> +						   data->mems[i].name);
>   		if (!res) {
>   			dev_err(dev, "found no memory resource for %s\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>   			return -EINVAL;
>   		}
>   		if (!devm_request_mem_region(dev, res->start,
>   					     resource_size(res),
>   					     dev_name(dev))) {
>   			dev_err(dev, "could not request %s region for resource\n",
> -				mem_names[i]);
> +				data->mems[i].name);
>   			return -EBUSY;
>   		}
>   
> @@ -1245,7 +1274,8 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>   		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
>   							 resource_size(res));
>   		if (!kproc->mem[i].cpu_addr) {
> -			dev_err(dev, "failed to map %s memory\n", mem_names[i]);
> +			dev_err(dev, "failed to map %s memory\n",
> +				data->mems[i].name);
>   			return -ENOMEM;
>   		}
>   		kproc->mem[i].bus_addr = res->start;
> @@ -1258,7 +1288,7 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>   		 * addresses 0 and 0x41010000 (same as the bus address on AM65x
>   		 * SoCs) based on loczrama setting
>   		 */
> -		if (!strcmp(mem_names[i], "atcm")) {
> +		if (!strcmp(data->mems[i].name, "atcm")) {
>   			kproc->mem[i].dev_addr = core->loczrama ?
>   							0 : K3_R5_TCM_DEV_ADDR;
>   		} else {
> @@ -1268,7 +1298,7 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
>   		kproc->mem[i].size = resource_size(res);
>   
>   		dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
> -			mem_names[i], &kproc->mem[i].bus_addr,
> +			data->mems[i].name, &kproc->mem[i].bus_addr,
>   			kproc->mem[i].size, kproc->mem[i].cpu_addr,
>   			kproc->mem[i].dev_addr);
>   	}
> @@ -1323,6 +1353,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   		kproc->priv = core;
>   		kproc->dev = cdev;
>   		kproc->rproc = rproc;
> +		kproc->data = cluster->soc_data->core_data;
>   		core->kproc = kproc;
>   
>   		kproc->ti_sci = devm_ti_sci_get_by_phandle(cdev, "ti,sci");
> @@ -1764,11 +1795,24 @@ static int k3_r5_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct k3_r5_mem_data r5_mems[] = {
> +	{ .name = "atcm", .dev_addr = 0x0 },
> +	{ .name = "btcm", .dev_addr = K3_R5_TCM_DEV_ADDR },
> +};
> +
> +static const struct k3_r5_dev_data r5_data = {
> +	.mems = r5_mems,
> +	.num_mems = ARRAY_SIZE(r5_mems),
> +	.boot_align_addr = 0,
> +	.uses_lreset = true,
> +};
> +
>   static const struct k3_r5_soc_data am65_j721e_soc_data = {
>   	.tcm_is_double = false,
>   	.tcm_ecc_autoinit = false,
>   	.single_cpu_mode = false,
>   	.is_single_core = false,
> +	.core_data = &r5_data,
>   };
>   
>   static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
> @@ -1776,6 +1820,7 @@ static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
>   	.tcm_ecc_autoinit = true,
>   	.single_cpu_mode = false,
>   	.is_single_core = false,
> +	.core_data = &r5_data,
>   };
>   
>   static const struct k3_r5_soc_data am64_soc_data = {
> @@ -1783,6 +1828,7 @@ static const struct k3_r5_soc_data am64_soc_data = {
>   	.tcm_ecc_autoinit = true,
>   	.single_cpu_mode = true,
>   	.is_single_core = false,
> +	.core_data = &r5_data,
>   };
>   
>   static const struct k3_r5_soc_data am62_soc_data = {
> @@ -1790,6 +1836,7 @@ static const struct k3_r5_soc_data am62_soc_data = {
>   	.tcm_ecc_autoinit = true,
>   	.single_cpu_mode = false,
>   	.is_single_core = true,
> +	.core_data = &r5_data,
>   };
>   
>   static const struct of_device_id k3_r5_of_match[] = {
