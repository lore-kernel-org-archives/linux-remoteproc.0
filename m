Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79E20B7EF;
	Tue,  8 Apr 2025 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101535; cv=none; b=TEsDpbu0TddU+8U+/7GgOFIf5R1JGuInFgMznmqq/fUV3YYgaDlkowxSK2XrEso2j/ayrAGmBbHI4k5WYJpXz+lzRC/PQOcpBT5sGkvNs78bbkiUgxCavcvBWDCLWUfiWDD8MJywipdW+NA/dhhaxdBV8tJHrRl6Vhf/OGHruOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101535; c=relaxed/simple;
	bh=tD4ZkMVt3jVD7U7yMoRCeDLuNYUNM43WUhXIx7cmSVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u/eCM7fHjJKYi3VDwo3v4+ejuEQFcKKyls/2E7WrVurKTW11/4CEGIf4JRvpw3GwYPhs9SJxz9o0VW53bNXaQLZjEzNPseI4qX2Fo678AyNqlQ9tDibjUo70l43B47+cTrT0yfW+/pi4RnPn8re0g77LcC/BhFOoiVjsB7IJnRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HUTumJXr; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HUTumJXr"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5388cet41115119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 03:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744101520;
	bh=qsaih3Jo6Z1Xo1D/DfJr19vzt9FO3H4iagoufj6pYzQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HUTumJXrS7JayWUFy5URgF4UrZd/BpJ8Y/ByHx198XIAWCQIsP0tWT0hRn4Zh32wS
	 CCoWvJ23kEtrCrGjRUbpcCEc7Xw2Y5lXDYiHwhc4OYORfm7eWSyDBfenJOBAmbbWew
	 Mpc1WkM4D+inqRTm8sKgwHnV0p1PLVFbkcT01o6s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5388cec5017789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 03:38:40 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 03:38:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 03:38:40 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5388caj6008681;
	Tue, 8 Apr 2025 03:38:37 -0500
Message-ID: <7ead4800-3653-49ce-9151-b7a78892bdd6@ti.com>
Date: Tue, 8 Apr 2025 14:08:36 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/26] remoteproc: k3-m4: Use k3_rproc_mem_data
 structure for memory info
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-6-b-padhi@ti.com>
 <0636d6a8-7de9-4887-82eb-3f5fd8a208d5@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <0636d6a8-7de9-4887-82eb-3f5fd8a208d5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 07/04/25 19:13, Andrew Davis wrote:
> On 3/17/25 7:06 AM, Beleswar Padhi wrote:
>> The ti_k3_m4_remoteproc.c driver previously hardcoded device memory
>> region addresses and names. Change this to use the k3_rproc_mem_data
>> structure to store memory information. This aligns with DSP and R5
>> drivers, and can be refactored out later.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   drivers/remoteproc/ti_k3_m4_remoteproc.c | 60 ++++++++++++++++++------
>>   1 file changed, 45 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> index d0ee7a8d460d..e83bef7cfddf 100644
>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> @@ -20,9 +20,6 @@
>>   #include "remoteproc_internal.h"
>>   #include "ti_sci_proc.h"
>>   -#define K3_M4_IRAM_DEV_ADDR 0x00000
>> -#define K3_M4_DRAM_DEV_ADDR 0x30000
>> -
>
> So two patches ago when you did this same thing for R5, you kept the
> K3_R5_TCM_DEV_ADDR define. But here you remove the adress #defines.
> I don't care if you leave them or keep them, but just do the same
> either way for both M4 and R5.


Actually the K3_R5_TCM_DEV_ADDR define is used in multiple places in the 
R5 driver even after migrating to `k3_r5_rproc_mem_data`. Ex - 
k3_r5_core_of_get_internal_memories() uses this define to override the 
`kproc->mem[i].dev_addr` initially assigned by 
k3_rproc_of_get_memories() based on `loczrama`.

The M4 driver does not need these defines after migrating to 
`k3_m4_rproc_mem_data` as its IRAM/DRAM dev addresses are fixed. R5 
core's ATCM/BTCM dev addresses are not fixed.

Besides, keeping K3_M4_IRAM_DEV_ADDR will throw unused var warnings.

Thanks,
Beleswar

>
> Andrew
>
>>   /**
>>    * struct k3_m4_rproc_mem - internal memory structure
>>    * @cpu_addr: MPU virtual address of the memory region
>> @@ -38,15 +35,29 @@ struct k3_m4_rproc_mem {
>>   };
>>     /**
>> - * struct k3_m4_rproc_mem_data - memory definitions for a remote 
>> processor
>> + * struct k3_m4_mem_data - memory definitions for a remote processor
>>    * @name: name for this memory entry
>>    * @dev_addr: device address for the memory entry
>>    */
>> -struct k3_m4_rproc_mem_data {
>> +struct k3_m4_mem_data {
>>       const char *name;
>>       const u32 dev_addr;
>>   };
>>   +/**
>> + * struct k3_m4_dev_data - device data structure for a M4 core
>> + * @mems: pointer to memory definitions for a M4 core
>> + * @num_mems: number of memory regions in @mems
>> + * @boot_align_addr: boot vector address alignment granularity
>> + * @uses_lreset: flag to denote the need for local reset management
>> + */
>> +struct k3_m4_dev_data {
>> +    const struct k3_m4_mem_data *mems;
>> +    u32 num_mems;
>> +    u32 boot_align_addr;
>> +    bool uses_lreset;
>> +};
>> +
>>   /**
>>    * struct k3_m4_rproc - k3 remote processor driver structure
>>    * @dev: cached device pointer
>> @@ -56,6 +67,7 @@ struct k3_m4_rproc_mem_data {
>>    * @rmem: reserved memory regions data
>>    * @num_rmems: number of reserved memory regions
>>    * @reset: reset control handle
>> + * @data: pointer to M4-specific device data
>>    * @tsp: TI-SCI processor control handle
>>    * @ti_sci: TI-SCI handle
>>    * @ti_sci_id: TI-SCI device identifier
>> @@ -71,6 +83,7 @@ struct k3_m4_rproc {
>>       struct k3_m4_rproc_mem *rmem;
>>       int num_rmems;
>>       struct reset_control *reset;
>> +    const struct k3_m4_dev_data *data;
>>       struct ti_sci_proc *tsp;
>>       const struct ti_sci_handle *ti_sci;
>>       u32 ti_sci_id;
>> @@ -336,14 +349,13 @@ static void *k3_m4_rproc_da_to_va(struct rproc 
>> *rproc, u64 da, size_t len, bool
>>   static int k3_m4_rproc_of_get_memories(struct platform_device *pdev,
>>                          struct k3_m4_rproc *kproc)
>>   {
>> -    static const char * const mem_names[] = { "iram", "dram" };
>> -    static const u32 mem_addrs[] = { K3_M4_IRAM_DEV_ADDR, 
>> K3_M4_DRAM_DEV_ADDR };
>> +    const struct k3_m4_dev_data *data = kproc->data;
>>       struct device *dev = &pdev->dev;
>>       struct resource *res;
>>       int num_mems;
>>       int i;
>>   -    num_mems = ARRAY_SIZE(mem_names);
>> +    num_mems = kproc->data->num_mems;
>>       kproc->mem = devm_kcalloc(kproc->dev, num_mems,
>>                     sizeof(*kproc->mem), GFP_KERNEL);
>>       if (!kproc->mem)
>> @@ -351,17 +363,17 @@ static int k3_m4_rproc_of_get_memories(struct 
>> platform_device *pdev,
>>         for (i = 0; i < num_mems; i++) {
>>           res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> -                           mem_names[i]);
>> +                           data->mems[i].name);
>>           if (!res) {
>>               dev_err(dev, "found no memory resource for %s\n",
>> -                mem_names[i]);
>> +                data->mems[i].name);
>>               return -EINVAL;
>>           }
>>           if (!devm_request_mem_region(dev, res->start,
>>                            resource_size(res),
>>                            dev_name(dev))) {
>>               dev_err(dev, "could not request %s region for resource\n",
>> -                mem_names[i]);
>> +                data->mems[i].name);
>>               return -EBUSY;
>>           }
>>   @@ -369,15 +381,15 @@ static int k3_m4_rproc_of_get_memories(struct 
>> platform_device *pdev,
>>                                resource_size(res));
>>           if (!kproc->mem[i].cpu_addr) {
>>               dev_err(dev, "failed to map %s memory\n",
>> -                mem_names[i]);
>> +                data->mems[i].name);
>>               return -ENOMEM;
>>           }
>>           kproc->mem[i].bus_addr = res->start;
>> -        kproc->mem[i].dev_addr = mem_addrs[i];
>> +        kproc->mem[i].dev_addr = data->mems[i].dev_addr;
>>           kproc->mem[i].size = resource_size(res);
>>             dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK 
>> da 0x%x\n",
>> -            mem_names[i], &kproc->mem[i].bus_addr,
>> +            data->mems[i].name, &kproc->mem[i].bus_addr,
>>               kproc->mem[i].size, kproc->mem[i].cpu_addr,
>>               kproc->mem[i].dev_addr);
>>       }
>> @@ -563,12 +575,17 @@ static int k3_m4_rproc_probe(struct 
>> platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct k3_m4_rproc *kproc;
>> +    const struct k3_m4_dev_data *data;
>>       struct rproc *rproc;
>>       const char *fw_name;
>>       bool r_state = false;
>>       bool p_state = false;
>>       int ret;
>>   +    data = of_device_get_match_data(dev);
>> +    if (!data)
>> +        return -ENODEV;
>> +
>>       ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>>       if (ret)
>>           return dev_err_probe(dev, ret, "failed to parse 
>> firmware-name property\n");
>> @@ -583,6 +600,7 @@ static int k3_m4_rproc_probe(struct 
>> platform_device *pdev)
>>       kproc = rproc->priv;
>>       kproc->dev = dev;
>>       kproc->rproc = rproc;
>> +    kproc->data = data;
>>       platform_set_drvdata(pdev, rproc);
>>         kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
>> @@ -650,8 +668,20 @@ static int k3_m4_rproc_probe(struct 
>> platform_device *pdev)
>>       return 0;
>>   }
>>   +static const struct k3_m4_mem_data am64_m4_mems[] = {
>> +    { .name = "iram", .dev_addr = 0x0 },
>> +    { .name = "dram", .dev_addr = 0x30000 },
>> +};
>> +
>> +static const struct k3_m4_dev_data am64_m4_data = {
>> +    .mems = am64_m4_mems,
>> +    .num_mems = ARRAY_SIZE(am64_m4_mems),
>> +    .boot_align_addr = SZ_1K,
>> +    .uses_lreset = true,
>> +};
>> +
>>   static const struct of_device_id k3_m4_of_match[] = {
>> -    { .compatible = "ti,am64-m4fss", },
>> +    { .compatible = "ti,am64-m4fss", .data = &am64_m4_data, },
>>       { /* sentinel */ },
>>   };
>>   MODULE_DEVICE_TABLE(of, k3_m4_of_match);
