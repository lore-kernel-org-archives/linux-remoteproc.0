Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954EC22B8BF;
	Mon,  7 Apr 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032364; cv=none; b=U7hTWHsi3tGP9mrJWp1KHH1KSPbvj5xUxL00LScV5vgH9QqNmTX0idxSwil0/CjLd9AhcvryP5cEqjK3lt0airmgMljdALRxXuIqwe+ojP8Co8v8xoR4kGjaWSDBRDWo0c7D7P9uvVr2vMp6dkcyykDuOXFB2P+wJZJEKMFKPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032364; c=relaxed/simple;
	bh=6KNQbUaZWTS21QEc6soXyOUWbYaoFheI98eTxvMmUBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GIhWgrSamwjKJp4wcfZtRfRrMtOlhHEmN+AEcBfJ+pw9ImNSzbc9QZyqRZTVPpWiUl/K6AXZeEm6UborIu2PUC6AOCzTPGeEEfjuwrbozbAFF8n8NXVmTaFhFghsW22ssJZK5PomM3mIk+NjdzNNjkbazBfGwcrJAuQBnYKiiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Sb76gOoO; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Sb76gOoO"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537DPcZH872426
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744032338;
	bh=MSps/hr5ZWL6fQm1K0IGsFiPkMLdouOskGm2hjK21is=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Sb76gOoOMbI5agxnEeua31xyCtl0MRACimApgo+ii2LOaSHa97fmwzNemxm68pAZM
	 6QDJmlbRDcNuM7bNHCj+3+d6BVTusA0aa3X+6miVgN+I+41laHUmpvp9U0ofNuhqDR
	 KAEzzitGif0/THcZmNL7Mmd/VOhsbdnKsHiXUbjo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537DPcEp067113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:25:38 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:25:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:25:38 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537DPbQ8066248;
	Mon, 7 Apr 2025 08:25:38 -0500
Message-ID: <67eed6a8-f66c-4ca4-bf35-57f9bf6cde3a@ti.com>
Date: Mon, 7 Apr 2025 08:25:37 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/26] remoteproc: k3-r5: Drop check performed in
 k3_r5_rproc_{mbox_callback/kick}
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-7-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250317120622.1746415-7-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 3/17/25 7:06 AM, Beleswar Padhi wrote:
> From: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
> probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()"
> and "k3_r5_rproc_kick()" callbacks, causing them to exit if the remote
> core's state is "RPROC_DETACHED". However, the "__rproc_attach()"
> function that is responsible for attaching to a remote core, updates
> the state of the remote core to "RPROC_ATTACHED" only after invoking
> "rproc_start_subdevices()".
> 
> The "rproc_start_subdevices()" function triggers the probe of the Virtio
> RPMsg devices associated with the remote core, which require that the
> "k3_r5_rproc_kick()" and "k3_r5_rproc_mbox_callback()" callbacks are
> functional. Hence, drop the check in the callbacks.
> 
> Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

This patch seems out of place here, while you do need to do this before
the next couple patches, this patch stands alone and probably should go
at the start of the series before the start of the refactoring.

Andrew

>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 29205d9e21af..c0e4da82775d 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -224,10 +224,6 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
>   	const char *name = kproc->rproc->name;
>   	u32 msg = omap_mbox_message(data);
>   
> -	/* Do not forward message from a detached core */
> -	if (kproc->rproc->state == RPROC_DETACHED)
> -		return;
> -
>   	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>   
>   	switch (msg) {
> @@ -263,10 +259,6 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
>   	mbox_msg_t msg = (mbox_msg_t)vqid;
>   	int ret;
>   
> -	/* Do not forward message to a detached core */
> -	if (kproc->rproc->state == RPROC_DETACHED)
> -		return;
> -
>   	/* send the index of the triggered virtqueue in the mailbox payload */
>   	ret = mbox_send_message(kproc->mbox, (void *)msg);
>   	if (ret < 0)
