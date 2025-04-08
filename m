Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F2205E3E;
	Tue,  8 Apr 2025 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100904; cv=none; b=NNXGdR3iyoqpQvwgUug16UAO0Jn0KF5T4886wRppjMpHuq30jS6P57ORBF4bv8jxcH2v+f6EGCn93XdJM5twnv0SmUSl8LI7Q7ecqNTMmQEHOzfbuCpnnkTgSIG3CC2kIJ48X3y+TZ7qeSqWp7pd7z7Mby9yhxJ6bsfJMu7JF7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100904; c=relaxed/simple;
	bh=UDlIVI1AG1Zy49FqHXKQmFxi8nQ7hbKrJrZlTbVmDUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ce8w7j6L0Jxrrk9KhClKnwhtRzUrRt+5p83NvAakKm8x7ZAUg4Kc9X5Vc0CnNx2w/0fcAR8iKYZLpoY4RA7MQ4o4bgLJMrUV86tnkkpSfPcBD13ANI0jGGGWV0JZ0Qacadxkg6ECNnxWQeiQICG/XmSPs9bjupr/B1IyRx/nRh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kTry/2QJ; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kTry/2QJ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5388SCL0481673
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 03:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744100893;
	bh=iM/xft0Gub7/C8ovIYRxY6ENM0fN3QhM2peDPUXbEDU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kTry/2QJTz3KKesp/r0bHsc1tp+bDyTei4wjapoTbqhSsLb/BCKMtkiNwNMuU/6sa
	 nu7y5UKENeHlByPDJnMu89ZqVabl8C/LhyHtDwHNGQ0c5F4TU23T1iDRerViXyFYZV
	 D/QwVxN2k/gjwDTe9u2DeaSUjTJSdiHHIHZWjg8M=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5388SCrx071038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 03:28:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 03:28:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 03:28:12 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5388S8FZ104027;
	Tue, 8 Apr 2025 03:28:09 -0500
Message-ID: <66739a19-3af8-4276-a101-692116aba70c@ti.com>
Date: Tue, 8 Apr 2025 13:58:08 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/26] remoteproc: k3-r5: Refactor Data Structures to
 Align with DSP and M4
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-3-b-padhi@ti.com>
 <6fa9b46e-2493-4ded-b5f7-43261d93d60c@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <6fa9b46e-2493-4ded-b5f7-43261d93d60c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 07/04/25 19:03, Andrew Davis wrote:
> On 3/17/25 7:05 AM, Beleswar Padhi wrote:
>> Currently, struct members such as mem, num_mems, reset, tsp, ti_sci and
>> ti_sci_id are part of the k3_r5_core structure. To align the rproc->priv
>> data structure of the R5 remote processor with that of the DSP and M4,
>> move the above members from k3_r5_core to k3_r5_rproc.
>>
>> Additionally, introduce a void *priv pointer in k3_r5_rproc that can be
>> typecasted to point to the k3_r5_core structure. This abstraction is
>> done to ensure common functionalities across R5, DSP and M4 drivers can
>> be refactored at a later stage.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 381 ++++++++++++-----------
>>   1 file changed, 198 insertions(+), 183 deletions(-)
>>
[... snip ...]
>> @@ -1284,6 +1290,7 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>       struct device *dev = &pdev->dev;
>>       struct k3_r5_rproc *kproc;
>>       struct k3_r5_core *core, *core1;
>> +    struct device_node *np;
>>       struct device *cdev;
>>       const char *fw_name;
>>       struct rproc *rproc;
>> @@ -1292,6 +1299,7 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>       core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>>       list_for_each_entry(core, &cluster->cores, elem) {
>>           cdev = core->dev;
>> +        np = dev_of_node(cdev);
>>           ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
>>           if (ret) {
>>               dev_err(dev, "failed to parse firmware-name property, 
>> ret = %d\n",
>> @@ -1312,11 +1320,63 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>           rproc->recovery_disabled = true;
>>             kproc = rproc->priv;
>> -        kproc->cluster = cluster;
>> -        kproc->core = core;
>> +        kproc->priv = core;
>>           kproc->dev = cdev;
>>           kproc->rproc = rproc;
>> -        core->rproc = rproc;
>> +        core->kproc = kproc;
>> +
>> +        kproc->ti_sci = devm_ti_sci_get_by_phandle(cdev, "ti,sci");
>> +        if (IS_ERR(kproc->ti_sci)) {
>> +            ret = dev_err_probe(cdev, PTR_ERR(kproc->ti_sci),
>> +                        "failed to get ti-sci handle\n");
>> +            kproc->ti_sci = NULL;
>> +            goto out;
>> +        }
>> +
>> +        ret = of_property_read_u32(np, "ti,sci-dev-id", 
>> &kproc->ti_sci_id);
>> +        if (ret) {
>> +            dev_err(cdev, "missing 'ti,sci-dev-id' property\n");
>> +            goto out;
>> +        }
>> +
>> +        kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
>> +        if (IS_ERR_OR_NULL(kproc->reset)) {
>> +            ret = PTR_ERR_OR_ZERO(kproc->reset);
>> +            if (!ret)
>> +                ret = -ENODEV;
>> +            dev_err_probe(cdev, ret, "failed to get reset handle\n");
>> +            goto out;
>> +        }
>> +
>> +        kproc->tsp = ti_sci_proc_of_get_tsp(cdev, kproc->ti_sci);
>> +        if (IS_ERR(kproc->tsp)) {
>> +            ret = dev_err_probe(cdev, PTR_ERR(kproc->tsp),
>> +                        "failed to construct ti-sci proc control\n");
>> +            goto out;
>> +        }
>> +
>> +        ret = 
>> k3_r5_core_of_get_internal_memories(to_platform_device(cdev), kproc);
>> +        if (ret) {
>> +            dev_err(cdev, "failed to get internal memories, ret = 
>> %d\n",
>> +                ret);
>> +            goto out;
>> +        }
>> +
>> +        ret = ti_sci_proc_request(kproc->tsp);
>> +        if (ret < 0) {
>> +            dev_err(cdev, "ti_sci_proc_request failed, ret = %d\n", 
>> ret);
>> +            goto out;
>> +        }
>> +
>> +        ret = devm_add_action_or_reset(cdev, k3_r5_release_tsp, 
>> kproc->tsp);
>> +        if (ret)
>> +            goto out;
>> +    }
>> +
>> +    list_for_each_entry(core, &cluster->cores, elem) {
>> +        cdev = core->dev;
>> +        kproc = core->kproc;
>> +        rproc = kproc->rproc;
>>             ret = k3_r5_rproc_request_mbox(rproc);
>>           if (ret)
>> @@ -1330,7 +1390,7 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>             ret = k3_r5_rproc_configure(kproc);
>>           if (ret) {
>> -            dev_err(dev, "initial configure failed, ret = %d\n",
>> +            dev_err(cdev, "initial configure failed, ret = %d\n",
>>                   ret);
>>               goto out;
>>           }
>> @@ -1340,14 +1400,14 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>             ret = k3_r5_reserved_mem_init(kproc);
>>           if (ret) {
>> -            dev_err(dev, "reserved memory init failed, ret = %d\n",
>> +            dev_err(cdev, "reserved memory init failed, ret = %d\n",
>>                   ret);
>>               goto out;
>>           }
>>   -        ret = devm_rproc_add(dev, rproc);
>> +        ret = devm_rproc_add(cdev, rproc);
>>           if (ret) {
>> -            dev_err_probe(dev, ret, "rproc_add failed\n");
>> +            dev_err_probe(cdev, ret, "rproc_add failed\n");
>>               goto out;
>>           }
>>   @@ -1373,7 +1433,7 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>                                  core->released_from_reset,
>>                                  msecs_to_jiffies(2000));
>>           if (ret <= 0) {
>> -            dev_err(dev,
>> +            dev_err(cdev,
>>                   "Timed out waiting for %s core to power up!\n",
>>                   rproc->name);
>>               goto out;
>> @@ -1396,8 +1456,8 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>       /* undo core0 upon any failures on core1 in split-mode */
>>       if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1) {
>>           core = list_prev_entry(core, elem);
>> -        rproc = core->rproc;
>> -        kproc = rproc->priv;
>> +        kproc = core->kproc;
>> +        rproc = kproc->rproc;
>>           goto err_split;
>>       }
>>       return ret;
>> @@ -1422,8 +1482,8 @@ static void k3_r5_cluster_rproc_exit(void *data)
>>           list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>>         list_for_each_entry_from_reverse(core, &cluster->cores, elem) {
>> -        rproc = core->rproc;
>> -        kproc = rproc->priv;
>> +        kproc = core->kproc;
>> +        rproc = kproc->rproc;
>>             if (rproc->state == RPROC_ATTACHED) {
>>               ret = rproc_detach(rproc);
>> @@ -1539,58 +1599,12 @@ static int k3_r5_core_of_init(struct 
>> platform_device *pdev)
>>           goto err;
>>       }
>>   -    core->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
>> -    if (IS_ERR(core->ti_sci)) {
>> -        ret = dev_err_probe(dev, PTR_ERR(core->ti_sci), "failed to 
>> get ti-sci handle\n");
>> -        core->ti_sci = NULL;
>> -        goto err;
>> -    }
>> -
>> -    ret = of_property_read_u32(np, "ti,sci-dev-id", &core->ti_sci_id);
>> -    if (ret) {
>> -        dev_err(dev, "missing 'ti,sci-dev-id' property\n");
>> -        goto err;
>> -    }
>> -
>> -    core->reset = devm_reset_control_get_exclusive(dev, NULL);
>> -    if (IS_ERR_OR_NULL(core->reset)) {
>> -        ret = PTR_ERR_OR_ZERO(core->reset);
>> -        if (!ret)
>> -            ret = -ENODEV;
>> -        dev_err_probe(dev, ret, "failed to get reset handle\n");
>> -        goto err;
>> -    }
>> -
>> -    core->tsp = ti_sci_proc_of_get_tsp(dev, core->ti_sci);
>> -    if (IS_ERR(core->tsp)) {
>> -        ret = dev_err_probe(dev, PTR_ERR(core->tsp),
>> -                    "failed to construct ti-sci proc control\n");
>> -        goto err;
>> -    }
>> -
>> -    ret = k3_r5_core_of_get_internal_memories(pdev, core);
>> -    if (ret) {
>> -        dev_err(dev, "failed to get internal memories, ret = %d\n",
>> -            ret);
>> -        goto err;
>> -    }
>> -
>
> Is there anyway to do this part of the refactor (moving all this up into
> k3_r5_cluster_rproc_init()) as part of a pre-patch? Might make this patch
> more readable.


Unfortunately not. We move the structure members around in this patch, 
so we should also do the necessary code changes to work with updated 
structure in the same patch. So this patch has to go around being a 
lengthier one :(

Thanks,
Beleswar

>
> Otherwise this all looks fine to me as it should be very mechanical 
> renaming
> and moving variables around.
>
> Andrew
[... snip ...]
