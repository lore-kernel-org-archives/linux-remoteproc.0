Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFC91EA0BB;
	Wed,  7 Aug 2024 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038673; cv=none; b=HhviHUH01/cOklkOu+eMmgGHukAoXXrXu6vBHMU7u2XLbub0yGZ/jyj3lRX8T9bVtk8Q+yS/SeGvJX5F1IjNarVkMWSqDFRIKYDDaxuapObFGDmuoRTBKwF0fhLJaM2PYBbULmy2Hy9HGrD3U1XmEQrNZaGsNwvZFX/3WdADum8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038673; c=relaxed/simple;
	bh=Dc8H4pUsAftrnquPUEPMt1SGWojyW0kazjddIKQJkLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D9ezkLPusY5egXjqTL2oSDrM5wiDKRkW0GF20hoLECNOinjQA2g3s3DPdLyi01xHhOYEoh3OsOOC2eCwVss1aNGU3+zg6lW2NItFQfvThGRLo/pLEf8VpgUFIrZdgR9tUca1ynniJfZKFwrnKLPUxSAQGyKXBOBjL0p5mZG2XtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yzjpycuC; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yzjpycuC"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477Dp69W013496;
	Wed, 7 Aug 2024 08:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723038666;
	bh=wXguwhvLz3iKFb+dLc+iTffDn5a9Z0V/ZnR/ZdUt7N4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yzjpycuCOjTAnISe4U9E0PmUnEOC3Qz8f5jf6H796dwmX4Hj/PQczFK/j9yvunLou
	 972RM0Dsjpik+LDsey++FFafpx9dh5HmU4QmzonTRZynAt/giGx7Z8sKHZuBMZNaWT
	 ApfUhlT5SxwQM4lLx97WK3aMZHmTgFQitAQ7iRXA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477Dp6Xb020072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 08:51:06 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 08:51:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 08:51:05 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477Dp5kR049805;
	Wed, 7 Aug 2024 08:51:05 -0500
Message-ID: <1d434d6c-42ba-4142-a701-032cf674c50c@ti.com>
Date: Wed, 7 Aug 2024 08:51:05 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] remoteproc: k3-dsp: Acquire mailbox handle during
 probe routine
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240807062256.1721682-1-b-padhi@ti.com>
 <20240807062256.1721682-4-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240807062256.1721682-4-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 8/7/24 1:22 AM, Beleswar Padhi wrote:
> Acquire the mailbox handle during device probe and do not release handle
> in stop/detach routine or error paths. This removes the redundant
> requests for mbox handle later during rproc start/attach. This also
> allows to defer remoteproc driver's probe if mailbox is not probed yet.
> 
> Fixes: b8431920391d ("remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs")

Not sure this patch counts as a "fix". There was a bug yes, and this certainly
is an improvment that solves the issue, but I like to reserve "Fixes" tags
for more serious issues. Otherwise this patch will be backported to "stable"
versions where it might cause things to be *less stable* given the size of
the "fix". Also, the commit you selected isn't the source of the issue,
it only adds another instance of it, getting the mailbox after probe has
been the case since the first version of this driver.

Rest of the patch LGTM,

Acked-by: Andrew Davis <afd@ti.com>

BTW, I've folded this change (getting mbox in probe) into the new
K3 M4 driver[0] I just posted, so we should be aligned here accross
all K3 rproc drivers.

Andrew

[0] https://lore.kernel.org/linux-arm-kernel/20240802152109.137243-4-afd@ti.com/

> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 80 +++++++++--------------
>   1 file changed, 30 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index a22d41689a7d..9009367e2891 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -115,6 +115,10 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
>   	const char *name = kproc->rproc->name;
>   	u32 msg = omap_mbox_message(data);
>   
> +	/* Do not forward messages from a detached core */
> +	if (kproc->rproc->state == RPROC_DETACHED)
> +		return;
> +
>   	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>   
>   	switch (msg) {
> @@ -155,6 +159,10 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
>   	mbox_msg_t msg = (mbox_msg_t)vqid;
>   	int ret;
>   
> +	/* Do not forward messages to a detached core */
> +	if (kproc->rproc->state == RPROC_DETACHED)
> +		return;
> +
>   	/* send the index of the triggered virtqueue in the mailbox payload */
>   	ret = mbox_send_message(kproc->mbox, (void *)msg);
>   	if (ret < 0)
> @@ -230,12 +238,9 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
>   	client->knows_txdone = false;
>   
>   	kproc->mbox = mbox_request_channel(client, 0);
> -	if (IS_ERR(kproc->mbox)) {
> -		ret = -EBUSY;
> -		dev_err(dev, "mbox_request_channel failed: %ld\n",
> -			PTR_ERR(kproc->mbox));
> -		return ret;
> -	}
> +	if (IS_ERR(kproc->mbox))
> +		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> +				     "mbox_request_channel failed\n");
>   
>   	/*
>   	 * Ping the remote processor, this is only for sanity-sake for now;
> @@ -315,32 +320,23 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>   	u32 boot_addr;
>   	int ret;
>   
> -	ret = k3_dsp_rproc_request_mbox(rproc);
> -	if (ret)
> -		return ret;
> -
>   	boot_addr = rproc->bootaddr;
>   	if (boot_addr & (kproc->data->boot_align_addr - 1)) {
>   		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 0x%x boundary\n",
>   			boot_addr, kproc->data->boot_align_addr);
> -		ret = -EINVAL;
> -		goto put_mbox;
> +		return -EINVAL;
>   	}
>   
>   	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
>   	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
>   	if (ret)
> -		goto put_mbox;
> +		return ret;
>   
>   	ret = k3_dsp_rproc_release(kproc);
>   	if (ret)
> -		goto put_mbox;
> +		return ret;
>   
>   	return 0;
> -
> -put_mbox:
> -	mbox_free_channel(kproc->mbox);
> -	return ret;
>   }
>   
>   /*
> @@ -353,8 +349,6 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>   {
>   	struct k3_dsp_rproc *kproc = rproc->priv;
>   
> -	mbox_free_channel(kproc->mbox);
> -
>   	k3_dsp_rproc_reset(kproc);
>   
>   	return 0;
> @@ -363,42 +357,22 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>   /*
>    * Attach to a running DSP remote processor (IPC-only mode)
>    *
> - * This rproc attach callback only needs to request the mailbox, the remote
> - * processor is already booted, so there is no need to issue any TI-SCI
> - * commands to boot the DSP core. This callback is invoked only in IPC-only
> - * mode.
> + * This rproc attach callback is a NOP. The remote processor is already booted,
> + * and all required resources have been acquired during probe routine, so there
> + * is no need to issue any TI-SCI commands to boot the DSP core. This callback
> + * is invoked only in IPC-only mode and exists because rproc_validate() checks
> + * for its existence.
>    */
> -static int k3_dsp_rproc_attach(struct rproc *rproc)
> -{
> -	struct k3_dsp_rproc *kproc = rproc->priv;
> -	struct device *dev = kproc->dev;
> -	int ret;
> -
> -	ret = k3_dsp_rproc_request_mbox(rproc);
> -	if (ret)
> -		return ret;
> -
> -	dev_info(dev, "DSP initialized in IPC-only mode\n");
> -	return 0;
> -}
> +static int k3_dsp_rproc_attach(struct rproc *rproc) { return 0; }
>   
>   /*
>    * Detach from a running DSP remote processor (IPC-only mode)
>    *
> - * This rproc detach callback performs the opposite operation to attach callback
> - * and only needs to release the mailbox, the DSP core is not stopped and will
> - * be left to continue to run its booted firmware. This callback is invoked only
> - * in IPC-only mode.
> + * This rproc detach callback is a NOP. The DSP core is not stopped and will be
> + * left to continue to run its booted firmware. This callback is invoked only in
> + * IPC-only mode and exists for sanity sake.
>    */
> -static int k3_dsp_rproc_detach(struct rproc *rproc)
> -{
> -	struct k3_dsp_rproc *kproc = rproc->priv;
> -	struct device *dev = kproc->dev;
> -
> -	mbox_free_channel(kproc->mbox);
> -	dev_info(dev, "DSP deinitialized in IPC-only mode\n");
> -	return 0;
> -}
> +static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
>   
>   /*
>    * This function implements the .get_loaded_rsc_table() callback and is used
> @@ -697,6 +671,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>   	kproc->dev = dev;
>   	kproc->data = data;
>   
> +	ret = k3_dsp_rproc_request_mbox(rproc);
> +	if (ret)
> +		return ret;
> +
>   	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
>   	if (IS_ERR(kproc->ti_sci))
>   		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
> @@ -789,6 +767,8 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
>   		if (ret)
>   			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
>   	}
> +
> +	mbox_free_channel(kproc->mbox);
>   }
>   
>   static const struct k3_dsp_mem_data c66_mems[] = {
