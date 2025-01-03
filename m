Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A021F9EA9;
	Fri,  3 Jan 2025 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901867; cv=none; b=mP10F41DOGF+jlaMr5UBLF/Lxv9/B3Vf4nUUZz5C63vnDCelBaE7BuTQyht3BZslXJypS5KJbgm6UVr+i5NVHVifr9nyQ6sDFw0AaH2qH25+uw6FiUvv+J2GQR6boUX9N9gu4hC6d5ADbemtEfnyEv3ksJKNusuamBQvCaXnjo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901867; c=relaxed/simple;
	bh=Lf4rsD9XbwGTjXAonmMAkvkYbefjvoVqRUf8YMaU1Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XX30ejMjCU5vN8bcf7eZUXmby+3Q5ujVYumbF0tYrp1Vv9K3mD7jAPGNfTjKEeYcQ54XdlMC7SXvla1B9sWJQce6lCLM73OKW6Q5hOJlxbDU2ixjOafvzTMh8+3AHyxVNm8mix/5S1JCrL6TyKH5XwdGf+CAkxSnxY8ith/L8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bm3bJ81b; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bm3bJ81b"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503AvaxH023996;
	Fri, 3 Jan 2025 04:57:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735901856;
	bh=XARjs6/CRAvzoWtW+qccUFptE2fLQL/nHAmAqPQt/X8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Bm3bJ81b6FbX7wQemRu0T0aURN/ez3sOYnZIiX3uEmnfCmY2bj5CZIP/gVK9TDMF0
	 VQ8F9WxYmkAvLFl5Ggk9Lvj+Xux/C4Ra4pejt6q7kdjLqj0UYV9NLSDlCDHeJqRQBd
	 flE14wLD/PUUVk/FfI2jownpgDMfjNtYfYhNTX6Y=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503AvavL065771;
	Fri, 3 Jan 2025 04:57:36 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:57:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:57:35 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503AvV9t025048;
	Fri, 3 Jan 2025 04:57:31 -0600
Message-ID: <582a900a-d885-4430-bbe4-b8651e0bda4e@ti.com>
Date: Fri, 3 Jan 2025 16:27:30 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] remoteproc: k3-r5: Fix checks in
 k3_r5_rproc_{mbox_callback/kick}
To: "Kumar, Udit" <u-kumar1@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <s-vadapalli@ti.com>, <srk@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241224091457.1050233-1-b-padhi@ti.com>
 <20241224091457.1050233-2-b-padhi@ti.com>
 <1e905d23-c5fa-443e-b277-aabd319f2dac@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <1e905d23-c5fa-443e-b277-aabd319f2dac@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 03/01/25 16:18, Kumar, Udit wrote:
>
> On 12/24/2024 2:44 PM, Beleswar Padhi wrote:
>> Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
>> probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()"
>> and "k3_r5_rproc_kick()" callbacks to exit if the remote core's state
>> was "RPROC_DETACHED". However, this caused issues in IPC-only mode, as
>> the default state of the core is set to "RPROC_DETACHED", and the
>> transition to "RPROC_ATTACHED" happens only after the "__rproc_attach()"
>> function has invoked "rproc_start_subdevices()".
>>
>> The "rproc_start_subdevices()" function triggers the probe of Virtio
>> RPMsg subdevices, which require the mailbox callbacks to be functional.
>> To resolve this, a new variable, "is_attach_ongoing", is introduced to
>> distinguish between core states: when a core is actually detached and
>> when it is in the process of being attached. The callbacks are updated
>> to return early only if the core is actually detached and not during an
>> ongoing attach operation in IPC-only mode.
>>
>> Reported-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Closes: 
>> https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/
>> Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle 
>> during probe routine")
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> Link to RFC version:
>> https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/
>>
>> Improvements in v1:
>> 1. Ensured these mbox callbacks are functional when the core is in 
>> the proccess
>> of getting attached in IPC-Only mode.
>> 2. Ensured these mbox callbacks are _not_ functional when the core 
>> state is
>> actually detached.
>>
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 53 +++++++++++++++++-------
>>   1 file changed, 39 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c 
>> b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index dbc513c5569c..e218a803fdb5 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -131,6 +131,7 @@ struct k3_r5_cluster {
>>    * @btcm_enable: flag to control BTCM enablement
>>    * @loczrama: flag to dictate which TCM is at device address 0x0
>>    * @released_from_reset: flag to signal when core is out of reset
>> + * @is_attach_ongoing: flag to indicate if IPC-only "attach()" is in 
>> progress
>
> Variable name is misleading, Core are attached after call to rproc_add 
> from this driver.


Right, but from all locations where this variable is checked 
(mbox_kick()/mbox_callback()), .attach would be still in progress.

>
> but variables says still attach_ongoing , I suggest to use is_attached


Thought so, but that is confusing with rproc->state. E.g, in 
mbox_kick(), rproc->state = detached, but we are saying 
kproc->is_attached = true.

What do you think?

>
>
>>    */
>>   struct k3_r5_core {
>>       struct list_head elem;
>> @@ -148,6 +149,7 @@ struct k3_r5_core {
>>       u32 btcm_enable;
>>       u32 loczrama;
>>       bool released_from_reset;
>> +    bool is_attach_ongoing;
>>   };
>>     /**
>> @@ -194,8 +196,11 @@ static void k3_r5_rproc_mbox_callback(struct 
>> mbox_client *client, void *data)
>>       const char *name = kproc->rproc->name;
>>       u32 msg = omap_mbox_message(data);
>>   -    /* Do not forward message from a detached core */
>> -    if (kproc->rproc->state == RPROC_DETACHED)
>> +    /*
>> +     * Do not forward messages from a detached core, except when the 
>> core
>> +     * is in the process of being attached in IPC-only mode.
>> +     */
>> +    if (!kproc->core->is_attach_ongoing && kproc->rproc->state == 
>> RPROC_DETACHED)
>>           return;
>>         dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>> @@ -233,8 +238,11 @@ static void k3_r5_rproc_kick(struct rproc 
>> *rproc, int vqid)
>>       mbox_msg_t msg = (mbox_msg_t)vqid;
>>       int ret;
>>   -    /* Do not forward message to a detached core */
>> -    if (kproc->rproc->state == RPROC_DETACHED)
>> +    /*
>> +     * Do not forward messages to a detached core, except when the 
>> core is
>> +     * in the process of being attached in IPC-only mode.
>> +     */
>> +    if (!kproc->core->is_attach_ongoing && kproc->rproc->state == 
>> RPROC_DETACHED)
>>           return;
>>         /* send the index of the triggered virtqueue in the mailbox 
>> payload */
>> @@ -671,22 +679,39 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   /*
>>    * Attach to a running R5F remote processor (IPC-only mode)
>>    *
>> - * The R5F attach callback is a NOP. The remote processor is already 
>> booted, and
>> - * all required resources have been acquired during probe routine, 
>> so there is
>> - * no need to issue any TI-SCI commands to boot the R5F cores in 
>> IPC-only mode.
>> - * This callback is invoked only in IPC-only mode and exists because
>> - * rproc_validate() checks for its existence.
>> + * The R5F attach callback only needs to set the "is_attach_ongoing" 
>> flag to
>> + * notify k3_r5_rproc_{kick/mbox_callback} functions that the core 
>> is in the
>> + * process of getting attached in IPC-only mode. The remote 
>> processor is
>> + * already booted, and all required resources have been acquired 
>> during probe
>> + * routine, so there is no need to issue any TI-SCI commands to boot 
>> the R5F
>> + * cores in IPC-only mode. This callback is invoked only in IPC-only 
>> mode.
>>    */
>> -static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
>> +static int k3_r5_rproc_attach(struct rproc *rproc)
>> +{
>> +    struct k3_r5_rproc *kproc = rproc->priv;
>> +
>> +    kproc->core->is_attach_ongoing = true;
>> +
>> +    return 0;
>> +}
>>     /*
>>    * Detach from a running R5F remote processor (IPC-only mode)
>>    *
>> - * The R5F detach callback is a NOP. The R5F cores are not stopped 
>> and will be
>> - * left in booted state in IPC-only mode. This callback is invoked 
>> only in
>> - * IPC-only mode and exists for sanity sake.
>> + * The R5F detach callback performs the opposite operation to attach 
>> callback
>> + * and only needs to clear the "is_attach_ongoing" flag to ensure no 
>> mailbox
>> + * messages are sent to or received from a detached core. The R5F 
>> cores are
>> + * not stopped and will be left in booted state in IPC-only mode. This
>> + * callback is invoked only in IPC-only mode.
>>    */
>> -static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
>> +static int k3_r5_rproc_detach(struct rproc *rproc)
>> +{
>> +    struct k3_r5_rproc *kproc = rproc->priv;
>> +
>> +    kproc->core->is_attach_ongoing = false;
>> +
>> +    return 0;
>> +}
>>     /*
>>    * This function implements the .get_loaded_rsc_table() callback 
>> and is used
