Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF214A0A4;
	Thu, 23 Jan 2025 04:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737607410; cv=none; b=mxhd+T0Bq2xPlr4TnFnscwSAtn7GEGw6U+Nak5TyYEFhKqCaYWCRQRy0gdTneiXgh9ArX9FY6X0xaNu5N8ooYACzuCwKwvnrv+wElOwE3s7f8OfuFzOMMEXaVcp28SORPwNZ5Qt7fdwWZOiwjoqTe4Eve7iso4Yo1bNWmQ81LPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737607410; c=relaxed/simple;
	bh=NMRerMPqGMVRxIgGYS8PF5iopq1EeX4TIOQLKoEvvC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GD4jM6GrvH5A5TLLTsDsGYkBfHR7Zi4r4l1/ZZD3hX9rLADyilegIO645G65otbU54paRtTBtXw6ngilLwunRIh/YFLXZtubCSskZaNbQ7rfFv+hovV6Qjs1+KzQ8Orw08MJh2OHlbD260g/VwPBELX5oFmnwCii2fEMSPEAi5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d1LzW2j4; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d1LzW2j4"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50N4hHG7310790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 22 Jan 2025 22:43:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737607397;
	bh=wdL5Zy25iS0k0e0OQpHpQ0hGBAuhiiaGkHKcTOjCw8w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d1LzW2j4VOYkEvt5uXTvgTiVUnRMiyzjyZWnUWtDbwUswhgziajYw2b+6inU4M/uH
	 GHfSwjbSeQnpSNDsCsqO1tupq6vD5H9t31fJAh7Cs/I6FJvw3982JaD9HOW6Gok9cW
	 KxZ5t4w1HsnyuoW1dBjwvsB3i18G79dajihfHtEM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50N4hHEp085806;
	Wed, 22 Jan 2025 22:43:17 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 22:43:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 22:43:16 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50N4hCNS025383;
	Wed, 22 Jan 2025 22:43:13 -0600
Message-ID: <8cbd9dde-e6ac-4f24-a060-9ba8abbff8d7@ti.com>
Date: Thu, 23 Jan 2025 10:13:12 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] remoteproc: k3-r5: Fix checks in
 k3_r5_rproc_{mbox_callback/kick}
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>, <srk@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241224091457.1050233-1-b-padhi@ti.com>
 <20241224091457.1050233-2-b-padhi@ti.com>
 <545c990c-63f8-4d31-ae80-3454736b1329@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <545c990c-63f8-4d31-ae80-3454736b1329@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 22/01/25 00:17, Andrew Davis wrote:
> On 12/24/24 3:14 AM, Beleswar Padhi wrote:
>> Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
>> probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()"
>> and "k3_r5_rproc_kick()" callbacks to exit if the remote core's state
>> was "RPROC_DETACHED". However, this caused issues in IPC-only mode, as
>> the default state of the core is set to "RPROC_DETACHED", and the
>> transition to "RPROC_ATTACHED" happens only after the "__rproc_attach()"
>> function has invoked "rproc_start_subdevices()".
>>
>
> Sounds like the core issue was making assumptions about the state of a
> variable that is usually only used internally by the rproc core 
> (rproc->state).


Yes that is right, so we now combined internal rproc state 
(is_attach_ongoing) with core framework's rproc->state.

>
> Instead, what would be the harm in just dropping the state check?
> Messages coming from a detached core should be processed the same.


Taking a look at k3_r5/dsp_rproc_mbox_callback(), today we don't really 
do much other than just log a print to console when we receive 
non-virtio mailbox messages. If we get a virtio mailbox message from a 
detached core, that will anyways be dropped in the further layers. So, I 
am okay with removing these checks entirely. These additional checks 
would be needed when we decide to do something more than just logging 
prints, a problem for another day though.

I will respin the series with these checks dropped.

Thanks,
Beleswar

>
> Andrew
>
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
