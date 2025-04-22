Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA0197A68;
	Tue, 22 Apr 2025 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745301327; cv=none; b=iMaJB0OmJmeRVp5vRdN7G3froZ1HgFwbAtwuiWQdpDSBsnqt7QRL+2TC4snRsCaR1zgkb6XZfaaZOfydFjQS7PsIlAaoyeqxAhyJl+i+G/IS+guCh9F+YyLkiexP0A+hw4qBcqPVG7lggdieHH3HWiyy/K+bARcctfNFGzXTBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745301327; c=relaxed/simple;
	bh=C5z4jwzY/Q6jl8fCYTODTkdRtBjoOwcJxXXJrraR7VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RGYnJHFSU0Icjf2GOosVjw/f2qbxZEdFGLmxkcN25rITF+pN8pY71AOzA88M4fQ17dH9Q+WXyiJAw+32tWBq1U3ODtYLdnrpKK4zYKgU792LirMpJ8+LJRsjKIlQMJ+kNOhnfr4y7J7uWP1ILHiGiJkeZXZsodrh4nfvgiGYJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vnzfcb7F; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vnzfcb7F"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M5tF7g1798170
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 00:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745301315;
	bh=WmYhYO2Gm4VPZ2iX4jFUJYcz/d+rKx2qdXYWRKc4+ZE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vnzfcb7Fg3tgfdlZNvPveakhZi/sEP+F3Nls1fx2lhJxE1/oJ2fgGSq0iipM9x3ru
	 8Krh976TJan4lQNMO66GCkjA+HloGu7qgIphhZaC90K7YYtHIY/N0u7lT/aY9nJIn9
	 Xwg+TVGEomHT/98IxGgmGW080anZGC9/ZHpw5JqQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M5tF7F027293
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 00:55:15 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 00:55:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 00:55:14 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M5tAM9047438;
	Tue, 22 Apr 2025 00:55:11 -0500
Message-ID: <65960138-8e54-42af-a309-89ca62c23bd9@ti.com>
Date: Tue, 22 Apr 2025 11:25:10 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/33] remoteproc: k3: Refactor .kick rproc ops into
 common driver
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250417182001.3903905-1-b-padhi@ti.com>
 <20250417182001.3903905-14-b-padhi@ti.com>
 <4567caaa-3cf6-47a1-beeb-53ee29562ce5@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <4567caaa-3cf6-47a1-beeb-53ee29562ce5@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 21/04/25 20:28, Andrew Davis wrote:
> On 4/17/25 1:19 PM, Beleswar Padhi wrote:
>> The .kick rproc ops implementations in TI K3 R5, DSP and M4 remoteproc
>> drivers sends a mailbox message to the remote processor in the same
>> way. Refactor the implementations into a common function
>> 'k3_rproc_kick()' in the ti_k3_common.c driver.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> v10: Changelog:
>> None
>>
>> Link to v9:
>> https://lore.kernel.org/all/20250317120622.1746415-12-b-padhi@ti.com/
>>
>>   drivers/remoteproc/ti_k3_common.c         | 25 ++++++++++++++++++++++
>>   drivers/remoteproc/ti_k3_common.h         |  1 +
>>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 22 +------------------
>>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 26 +----------------------
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 17 +--------------
>>   5 files changed, 29 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>> index 7b45e3b416186..aace308b49b0e 100644
>> --- a/drivers/remoteproc/ti_k3_common.c
>> +++ b/drivers/remoteproc/ti_k3_common.c
>> @@ -80,5 +80,30 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>>   }
>>   EXPORT_SYMBOL_GPL(k3_rproc_mbox_callback);
>>   +/*
>> + * Kick the remote processor to notify about pending unprocessed messages.
>> + * The vqid usage is not used and is inconsequential, as the kick is performed
>> + * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
>> + * the remote processor is expected to process both its Tx and Rx virtqueues.
>> + */
>
> This comment is wrong. Looks like this is a copy paste error that ended up
> in every ti_k3_*_remoteproc.c driver. This whole "simulated GPIO" thing
> is only true for the K2 DSP (keystone_remoteproc.c), all the K3 devices
> have proper mailbox interrupts.
>
> Anyway, no need to remove it here, this patch is just a refactor and since
> it was already in every driver you are factoring this out from I'd suggest
> fixing it in a later patch.


Sure, I can put a patch later to fix this comment.

Thanks,
Beleswar

>
> For this patch,
>
> Acked-by: Andrew Davis <afd@ti.com>
>
>> +void k3_rproc_kick(struct rproc *rproc, int vqid)
>> +{
>> +    struct k3_rproc *kproc = rproc->priv;
>> +    struct device *dev = kproc->dev;
>> +    u32 msg = (u32)vqid;
>> +    int ret;
>> +
>> +    /*
>> +     * Send the index of the triggered virtqueue in the mailbox payload.
>> +     * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
>> +     * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
>> +     */
>> +    ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
>> +    if (ret < 0)
>> +        dev_err(dev, "failed to send mailbox message, status = %d\n",
>> +            ret);
>> +}
>> +EXPORT_SYMBOL_GPL(k3_rproc_kick);
>> +
>>   MODULE_LICENSE("GPL");
>>   MODULE_DESCRIPTION("TI K3 common Remoteproc code");
>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>> index 785bb4b17d02f..6ae7ac4ec5696 100644
>> --- a/drivers/remoteproc/ti_k3_common.h
>> +++ b/drivers/remoteproc/ti_k3_common.h
>> @@ -89,4 +89,5 @@ struct k3_rproc {
>>   };
>>     void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
>> +void k3_rproc_kick(struct rproc *rproc, int vqid);
>>   #endif /* REMOTEPROC_TI_K3_COMMON_H */
>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> index 7bd1d5a790cb2..476f4e69d2c11 100644
>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> @@ -24,26 +24,6 @@
>>     #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK    (SZ_16M - 1)
>>   -/*
>> - * Kick the remote processor to notify about pending unprocessed messages.
>> - * The vqid usage is not used and is inconsequential, as the kick is performed
>> - * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
>> - * the remote processor is expected to process both its Tx and Rx virtqueues.
>> - */
>> -static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
>> -{
>> -    struct k3_rproc *kproc = rproc->priv;
>> -    struct device *dev = rproc->dev.parent;
>> -    mbox_msg_t msg = (mbox_msg_t)vqid;
>> -    int ret;
>> -
>> -    /* send the index of the triggered virtqueue in the mailbox payload */
>> -    ret = mbox_send_message(kproc->mbox, (void *)msg);
>> -    if (ret < 0)
>> -        dev_err(dev, "failed to send mailbox message (%pe)\n",
>> -            ERR_PTR(ret));
>> -}
>> -
>>   /* Put the DSP processor into reset */
>>   static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
>>   {
>> @@ -342,7 +322,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
>>   static const struct rproc_ops k3_dsp_rproc_ops = {
>>       .start        = k3_dsp_rproc_start,
>>       .stop        = k3_dsp_rproc_stop,
>> -    .kick        = k3_dsp_rproc_kick,
>> +    .kick        = k3_rproc_kick,
>>       .da_to_va    = k3_dsp_rproc_da_to_va,
>>   };
>>   diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> index a1bcc4b265dfe..8a6917259ce60 100644
>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> @@ -21,30 +21,6 @@
>>   #include "ti_sci_proc.h"
>>   #include "ti_k3_common.h"
>>   -/*
>> - * Kick the remote processor to notify about pending unprocessed messages.
>> - * The vqid usage is not used and is inconsequential, as the kick is performed
>> - * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
>> - * the remote processor is expected to process both its Tx and Rx virtqueues.
>> - */
>> -static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
>> -{
>> -    struct k3_rproc *kproc = rproc->priv;
>> -    struct device *dev = kproc->dev;
>> -    u32 msg = (u32)vqid;
>> -    int ret;
>> -
>> -    /*
>> -     * Send the index of the triggered virtqueue in the mailbox payload.
>> -     * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
>> -     * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
>> -     */
>> -    ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
>> -    if (ret < 0)
>> -        dev_err(dev, "failed to send mailbox message, status = %d\n",
>> -            ret);
>> -}
>> -
>>   static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
>>   {
>>       struct device *dev = kproc->dev;
>> @@ -448,7 +424,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
>>       .stop = k3_m4_rproc_stop,
>>       .attach = k3_m4_rproc_attach,
>>       .detach = k3_m4_rproc_detach,
>> -    .kick = k3_m4_rproc_kick,
>> +    .kick = k3_rproc_kick,
>>       .da_to_va = k3_m4_rproc_da_to_va,
>>       .get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
>>   };
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index a1dfbe383c13c..dedc9456983e0 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -129,21 +129,6 @@ struct k3_r5_core {
>>       bool released_from_reset;
>>   };
>>   -/* kick a virtqueue */
>> -static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
>> -{
>> -    struct k3_rproc *kproc = rproc->priv;
>> -    struct device *dev = rproc->dev.parent;
>> -    mbox_msg_t msg = (mbox_msg_t)vqid;
>> -    int ret;
>> -
>> -    /* send the index of the triggered virtqueue in the mailbox payload */
>> -    ret = mbox_send_message(kproc->mbox, (void *)msg);
>> -    if (ret < 0)
>> -        dev_err(dev, "failed to send mailbox message, status = %d\n",
>> -            ret);
>> -}
>> -
>>   static int k3_r5_split_reset(struct k3_rproc *kproc)
>>   {
>>       int ret;
>> @@ -735,7 +720,7 @@ static const struct rproc_ops k3_r5_rproc_ops = {
>>       .unprepare    = k3_r5_rproc_unprepare,
>>       .start        = k3_r5_rproc_start,
>>       .stop        = k3_r5_rproc_stop,
>> -    .kick        = k3_r5_rproc_kick,
>> +    .kick        = k3_rproc_kick,
>>       .da_to_va    = k3_r5_rproc_da_to_va,
>>   };
>>   
