Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AC21B9C2;
	Tue,  8 Apr 2025 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100082; cv=none; b=qlXTGFCdJiCOSAZeeSxo3X+8+J0UUBtofXQ6osSo7Wvg2p+0ZtakSJ+Qopo9e+/GafL8UVzrKH5C4+v3A20iMqbc2T1QX0CN/lRg+Vh05UwnuDNMLuHKS4ObfEw7Y7RkN2h38fmWSBpOMYahlZQiQMg+EkdKfxsnmtGlflgdJp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100082; c=relaxed/simple;
	bh=lcRnD28qaB1kgPmm9ChBRfHRQea8pNDGvVep6wcpjlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oP46N2o1N2i2rrr3G8mx9o8wZdGmaaNOWaY/pXDntXEbjb4ikR8bEcuTSFuCxS9DSsdP8dJmyGpnkQn8kydmahrQ+KNMgM7wcT8iO/w9V/luzQNXhnGz5x6ZbduhvTyLiOwCNA7p3eNU71uh1UC/O6UjHz1rAwyMkJUVrNnAE34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SG6raOFn; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SG6raOFn"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5388ETws478257
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 03:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744100069;
	bh=wyJANLn/TygeZdeBMDwbcJtQcR8LIaRotZSQWOxdTyg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SG6raOFn6/2EBZaoCx3B3UeB/NfngjhX5FN65e7LP28iUNW9G9sOahutWVyZ5M/Qj
	 uPCZr+ipLaMLEVNM/V4sutWV+TVRWoxRkVmRWbX4nwwf5rwH7HeVaUwsLJ4A9HSM8o
	 fzq/WH9H/v4AAkIs8vgEzpIOkhwpA+H7Nmv/oT7s=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5388ETv0110027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 03:14:29 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 03:14:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 03:14:28 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5388EP9r087492;
	Tue, 8 Apr 2025 03:14:25 -0500
Message-ID: <d9b2607c-fcf1-428a-aa49-2476b2907559@ti.com>
Date: Tue, 8 Apr 2025 13:44:24 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/26] remoteproc: k3-r5: Re-order internal memory
 initialization function
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-2-b-padhi@ti.com>
 <4502a296-5380-4339-bfb1-1d741b74cf01@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <4502a296-5380-4339-bfb1-1d741b74cf01@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 07/04/25 18:59, Andrew Davis wrote:
> On 3/17/25 7:05 AM, Beleswar Padhi wrote:
>> The core's internal memory data structure will be refactored to be part
>> of the k3_r5_rproc structure in a future commit. As a result, internal
>> memory initialization will need to be performed inside
>> k3_r5_cluster_rproc_init() after rproc_alloc().
>>
>> Therefore, move the internal memory initialization function,
>> k3_r5_core_of_get_internal_memories() above k3_r5_rproc_init() so that
>> it can be invoked from there.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>
> Just to keep things organized, does it make sense to also move
> the other k3_r5_core_of_get_*_memories() up with this?
>
> Also, you move k3_r5_release_tsp() up too but don't mention
> that in the commit message.


Sure, I will incorporate these changes in the next revision.

Thanks,
Beleswar

>
> Andrew
>
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 158 +++++++++++------------
>>   1 file changed, 79 insertions(+), 79 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index dbc513c5569c..b2738b9a1b2d 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -1199,6 +1199,85 @@ static int k3_r5_rproc_configure_mode(struct 
>> k3_r5_rproc *kproc)
>>       return ret;
>>   }
>>   +static int k3_r5_core_of_get_internal_memories(struct 
>> platform_device *pdev,
>> +                           struct k3_r5_core *core)
>> +{
>> +    static const char * const mem_names[] = {"atcm", "btcm"};
>> +    struct device *dev = &pdev->dev;
>> +    struct resource *res;
>> +    int num_mems;
>> +    int i;
>> +
>> +    num_mems = ARRAY_SIZE(mem_names);
>> +    core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), 
>> GFP_KERNEL);
>> +    if (!core->mem)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < num_mems; i++) {
>> +        res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +                           mem_names[i]);
>> +        if (!res) {
>> +            dev_err(dev, "found no memory resource for %s\n",
>> +                mem_names[i]);
>> +            return -EINVAL;
>> +        }
>> +        if (!devm_request_mem_region(dev, res->start,
>> +                         resource_size(res),
>> +                         dev_name(dev))) {
>> +            dev_err(dev, "could not request %s region for resource\n",
>> +                mem_names[i]);
>> +            return -EBUSY;
>> +        }
>> +
>> +        /*
>> +         * TCMs are designed in general to support RAM-like backing
>> +         * memories. So, map these as Normal Non-Cached memories. This
>> +         * also avoids/fixes any potential alignment faults due to
>> +         * unaligned data accesses when using memcpy() or memset()
>> +         * functions (normally seen with device type memory).
>> +         */
>> +        core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
>> +                            resource_size(res));
>> +        if (!core->mem[i].cpu_addr) {
>> +            dev_err(dev, "failed to map %s memory\n", mem_names[i]);
>> +            return -ENOMEM;
>> +        }
>> +        core->mem[i].bus_addr = res->start;
>> +
>> +        /*
>> +         * TODO:
>> +         * The R5F cores can place ATCM & BTCM anywhere in its address
>> +         * based on the corresponding Region Registers in the System
>> +         * Control coprocessor. For now, place ATCM and BTCM at
>> +         * addresses 0 and 0x41010000 (same as the bus address on AM65x
>> +         * SoCs) based on loczrama setting
>> +         */
>> +        if (!strcmp(mem_names[i], "atcm")) {
>> +            core->mem[i].dev_addr = core->loczrama ?
>> +                            0 : K3_R5_TCM_DEV_ADDR;
>> +        } else {
>> +            core->mem[i].dev_addr = core->loczrama ?
>> +                            K3_R5_TCM_DEV_ADDR : 0;
>> +        }
>> +        core->mem[i].size = resource_size(res);
>> +
>> +        dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 
>> 0x%x\n",
>> +            mem_names[i], &core->mem[i].bus_addr,
>> +            core->mem[i].size, core->mem[i].cpu_addr,
>> +            core->mem[i].dev_addr);
>> +    }
>> +    core->num_mems = num_mems;
>> +
>> +    return 0;
>> +}
>> +
>> +static void k3_r5_release_tsp(void *data)
>> +{
>> +    struct ti_sci_proc *tsp = data;
>> +
>> +    ti_sci_proc_release(tsp);
>> +}
>> +
>>   static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>   {
>>       struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
>> @@ -1358,78 +1437,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>>       }
>>   }
>>   -static int k3_r5_core_of_get_internal_memories(struct 
>> platform_device *pdev,
>> -                           struct k3_r5_core *core)
>> -{
>> -    static const char * const mem_names[] = {"atcm", "btcm"};
>> -    struct device *dev = &pdev->dev;
>> -    struct resource *res;
>> -    int num_mems;
>> -    int i;
>> -
>> -    num_mems = ARRAY_SIZE(mem_names);
>> -    core->mem = devm_kcalloc(dev, num_mems, sizeof(*core->mem), 
>> GFP_KERNEL);
>> -    if (!core->mem)
>> -        return -ENOMEM;
>> -
>> -    for (i = 0; i < num_mems; i++) {
>> -        res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> -                           mem_names[i]);
>> -        if (!res) {
>> -            dev_err(dev, "found no memory resource for %s\n",
>> -                mem_names[i]);
>> -            return -EINVAL;
>> -        }
>> -        if (!devm_request_mem_region(dev, res->start,
>> -                         resource_size(res),
>> -                         dev_name(dev))) {
>> -            dev_err(dev, "could not request %s region for resource\n",
>> -                mem_names[i]);
>> -            return -EBUSY;
>> -        }
>> -
>> -        /*
>> -         * TCMs are designed in general to support RAM-like backing
>> -         * memories. So, map these as Normal Non-Cached memories. This
>> -         * also avoids/fixes any potential alignment faults due to
>> -         * unaligned data accesses when using memcpy() or memset()
>> -         * functions (normally seen with device type memory).
>> -         */
>> -        core->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
>> -                            resource_size(res));
>> -        if (!core->mem[i].cpu_addr) {
>> -            dev_err(dev, "failed to map %s memory\n", mem_names[i]);
>> -            return -ENOMEM;
>> -        }
>> -        core->mem[i].bus_addr = res->start;
>> -
>> -        /*
>> -         * TODO:
>> -         * The R5F cores can place ATCM & BTCM anywhere in its address
>> -         * based on the corresponding Region Registers in the System
>> -         * Control coprocessor. For now, place ATCM and BTCM at
>> -         * addresses 0 and 0x41010000 (same as the bus address on AM65x
>> -         * SoCs) based on loczrama setting
>> -         */
>> -        if (!strcmp(mem_names[i], "atcm")) {
>> -            core->mem[i].dev_addr = core->loczrama ?
>> -                            0 : K3_R5_TCM_DEV_ADDR;
>> -        } else {
>> -            core->mem[i].dev_addr = core->loczrama ?
>> -                            K3_R5_TCM_DEV_ADDR : 0;
>> -        }
>> -        core->mem[i].size = resource_size(res);
>> -
>> -        dev_dbg(dev, "memory %5s: bus addr %pa size 0x%zx va %pK da 
>> 0x%x\n",
>> -            mem_names[i], &core->mem[i].bus_addr,
>> -            core->mem[i].size, core->mem[i].cpu_addr,
>> -            core->mem[i].dev_addr);
>> -    }
>> -    core->num_mems = num_mems;
>> -
>> -    return 0;
>> -}
>> -
>>   static int k3_r5_core_of_get_sram_memories(struct platform_device 
>> *pdev,
>>                          struct k3_r5_core *core)
>>   {
>> @@ -1487,13 +1494,6 @@ static int 
>> k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
>>       return 0;
>>   }
>>   -static void k3_r5_release_tsp(void *data)
>> -{
>> -    struct ti_sci_proc *tsp = data;
>> -
>> -    ti_sci_proc_release(tsp);
>> -}
>> -
>>   static int k3_r5_core_of_init(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
