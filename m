Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457613BC0C;
	Tue,  4 Jun 2024 05:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478652; cv=none; b=SNO2VcisH4J7e3Ssg+vq+LUZnwFQnCg0rRJuMZjvv9L4Bq/jO4nQk4Tev583l7yjYOxc9c85bwYGP782843UzDi9yvrSEFTOnrDCi0VwIdRMYaudZQbpzMnpoVfgGYyutYjyO4jochkZZUgUzxEaLkrNHUa7w0U1aRSR+i+Ok7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478652; c=relaxed/simple;
	bh=zO5E4nRegnCwQ9vgd83Tdn+Uov+DomFmRsWWPMOdEUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gK9VKUyYqtNfzvZ5b3B+1XjFaPdW+POIvLn6w6ySiiMZewKLYpu9DF3j+PzdRIAa7ygwiJZ1jL21Yxti6iyOckC/0AB7o/KeU1sKhkClrJjzeMFMX4cMdTp5IkxKWThZvxmRQyxD3/7/fOM5HtOu4kNNPTDObfsyMkAaf6pELdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M5HEvRDS; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M5HEvRDS"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4545O4as005554;
	Tue, 4 Jun 2024 00:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717478644;
	bh=kou1v0Jno9D0H4zO+eOmTBrl/hSdSgCo3ASElwkCCTA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M5HEvRDSaToeoQIj35cmOqkOvZNRSGgmVpRPKsEQmHTwAdoyaBbeZAOxzPtc5Zjsn
	 UnGzB4IPU71m2WYTDTF8T7rcKFO2L/m50JfhJTRIe19423sK4EBG/1ImMGR3NXOt5K
	 dnnMB2Ms2qPxzIR82I1A6mrRKGz/A1BB1N0oQM28=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4545O4WG110578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 00:24:04 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 00:24:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 00:24:04 -0500
Received: from [10.24.69.66] (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4545O1oT078553;
	Tue, 4 Jun 2024 00:24:02 -0500
Message-ID: <c28daf2d-4252-40f0-8c93-298b6ea1d96c@ti.com>
Date: Tue, 4 Jun 2024 10:54:00 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: k3-r5: Acquire mailbox handle during
 probe
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240530090737.655054-1-b-padhi@ti.com>
 <20240530090737.655054-3-b-padhi@ti.com>
 <b5582d8a-b7bf-49e2-a8a3-879275a881b2@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <b5582d8a-b7bf-49e2-a8a3-879275a881b2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andrew,

On 30/05/24 19:46, Andrew Davis wrote:
> On 5/30/24 4:07 AM, Beleswar Padhi wrote:
>> Acquire the mailbox handle during device probe and do not release handle
>> in stop/detach routine or error paths. This removes the redundant
>> requests for mbox handle later during rproc start/attach. This also
>> allows to defer remoteproc driver's probe if mailbox is not probed yet.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 66 ++++++++----------------
>>   1 file changed, 21 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 26362a509ae3..157e8fd57665 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -391,6 +391,7 @@ static int k3_r5_rproc_request_mbox(struct rproc 
>> *rproc)
>>       struct mbox_client *client = &kproc->client;
>>       struct device *dev = kproc->dev;
>>       int ret;
>> +    long err;
>>         client->dev = dev;
>>       client->tx_done = NULL;
>> @@ -400,10 +401,9 @@ static int k3_r5_rproc_request_mbox(struct rproc 
>> *rproc)
>>         kproc->mbox = mbox_request_channel(client, 0);
>>       if (IS_ERR(kproc->mbox)) {
>> -        ret = -EBUSY;
>> -        dev_err(dev, "mbox_request_channel failed: %ld\n",
>> -            PTR_ERR(kproc->mbox));
>> -        return ret;
>> +        err = PTR_ERR(kproc->mbox);
>> +        dev_err(dev, "mbox_request_channel failed: %ld\n", err);
>> +        return (err == -EPROBE_DEFER) ? -EPROBE_DEFER : -EBUSY;
>
> Why turn all other errors into EBUSY? If you just return the error 
> as-is you
> can simply make these 3 lines just:
>
> return dev_err_probe(dev, PTR_ERR(kproc->mbox), "mbox_request_channel 
> failed\n");
>
>>       }
>>         /*
>> @@ -552,10 +552,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>       u32 boot_addr;
>>       int ret;
>>   -    ret = k3_r5_rproc_request_mbox(rproc);
>> -    if (ret)
>> -        return ret;
>> -
>>       boot_addr = rproc->bootaddr;
>>       /* TODO: add boot_addr sanity checking */
>>       dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", 
>> boot_addr);
>> @@ -564,7 +560,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>       core = kproc->core;
>>       ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
>>       if (ret)
>> -        goto put_mbox;
>> +        goto out;
>
> The label "out" doesn't do anything, just directly `return ret;` here and
> in the other cases below.
>
>>         /* unhalt/run all applicable cores */
>>       if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>> @@ -581,12 +577,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>               dev_err(dev, "%s: can not start core 1 before core 0\n",
>>                   __func__);
>>               ret = -EPERM;
>> -            goto put_mbox;
>> +            goto out;
>>           }
>>             ret = k3_r5_core_run(core);
>>           if (ret)
>> -            goto put_mbox;
>> +            goto out;
>>       }
>>         return 0;
>> @@ -596,8 +592,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>           if (k3_r5_core_halt(core))
>>               dev_warn(core->dev, "core halt back failed\n");
>>       }
>> -put_mbox:
>> -    mbox_free_channel(kproc->mbox);
>> +out:
>>       return ret;
>>   }
>>   @@ -658,8 +653,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>               goto out;
>>       }
>>   -    mbox_free_channel(kproc->mbox);
>> -
>>       return 0;
>>     unroll_core_halt:
>> @@ -674,42 +667,21 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   /*
>>    * Attach to a running R5F remote processor (IPC-only mode)
>>    *
>> - * The R5F attach callback only needs to request the mailbox, the 
>> remote
>> - * processor is already booted, so there is no need to issue any TI-SCI
>> - * commands to boot the R5F cores in IPC-only mode. This callback is 
>> invoked
>> - * only in IPC-only mode.
>> + * The R5F attach callback is a NOP. The remote processor is already 
>> booted, and
>> + * all required resources have been acquired during probe routine, 
>> so there is
>> + * no need to issue any TI-SCI commands to boot the R5F cores in 
>> IPC-only mode.
>> + * This callback is invoked only in IPC-only mode and exists for 
>> sanity sake.
>>    */
>> -static int k3_r5_rproc_attach(struct rproc *rproc)
>> -{
>> -    struct k3_r5_rproc *kproc = rproc->priv;
>> -    struct device *dev = kproc->dev;
>> -    int ret;
>> -
>> -    ret = k3_r5_rproc_request_mbox(rproc);
>> -    if (ret)
>> -        return ret;
>> -
>> -    dev_info(dev, "R5F core initialized in IPC-only mode\n");
>> -    return 0;
>> -}
>> +static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
>>     /*
>>    * Detach from a running R5F remote processor (IPC-only mode)
>>    *
>> - * The R5F detach callback performs the opposite operation to attach 
>> callback
>> - * and only needs to release the mailbox, the R5F cores are not 
>> stopped and
>> - * will be left in booted state in IPC-only mode. This callback is 
>> invoked
>> - * only in IPC-only mode.
>> + * The R5F detach callback is a NOP. The R5F cores are not stopped 
>> and will be
>> + * left in booted state in IPC-only mode. This callback is invoked 
>> only in
>> + * IPC-only mode and exists for sanity sake.
>>    */
>> -static int k3_r5_rproc_detach(struct rproc *rproc)
>> -{
>> -    struct k3_r5_rproc *kproc = rproc->priv;
>> -    struct device *dev = kproc->dev;
>> -
>> -    mbox_free_channel(kproc->mbox);
>> -    dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
>> -    return 0;
>> -}
>> +static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
>
> Do we still need to disable the mbox channel somehow here to prevent
> receiving more messages from the detached core?
>
>>     /*
>>    * This function implements the .get_loaded_rsc_table() callback 
>> and is used
>> @@ -1277,6 +1249,10 @@ static int k3_r5_cluster_rproc_init(struct 
>> platform_device *pdev)
>>           kproc->rproc = rproc;
>>           core->rproc = rproc;
>>   +        ret = k3_r5_rproc_request_mbox(rproc);
>
> Now that we get the channel here in init you'll want to add a matching
> mbox_free_channel() call to k3_r5_cluster_rproc_exit().
>
> Andrew


Thanks for the review! I have sent out v2 addressing these comments:

https://lore.kernel.org/all/20240604051722.3608750-1-b-padhi@ti.com/

>
>> +        if (ret)
>> +            return ret;
>> +
>>           ret = k3_r5_rproc_configure_mode(kproc);
>>           if (ret < 0)
>>               goto err_config;
