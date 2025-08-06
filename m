Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C20C1B960;
	Wed,  6 Aug 2025 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754503474; cv=none; b=bIBwsOowEiU8TN+koupEXyV9qXMpI/zfaUGqC8oXT6NF0XqVWhWZ8h4J7AbId//hn+K9rpNsvuK5mLykwmp4JsDaRV8eFhVSF9FTe3138KynBqiclFIZNJXtSoOrQZ5uKIQf5O/09JVEfU40ZD+Dgm+H5nwqkzkNbNUVQnUgb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754503474; c=relaxed/simple;
	bh=fxxFRpreUF44bnAKkUQf9zi1CX2XhQINYRPg9cvoscA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qGave2AcLGidagrXJE8hNrBZ5yiQbYAN8v+c1vK96neUPxSLH34eqWnFcVUjBPhg2Offzoh6ITcf5mmF85168Q0h9H0vOweFXC3FZz2C4NTPBVe0e0GcN2rneoegN8H9mgFjfyMHpjzZS9+PmpkPqoCZNfHs6f6R4Etdb17OJ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aZXvSg8v; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aZXvSg8v"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576I4Mc5572412;
	Wed, 6 Aug 2025 13:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754503463;
	bh=USSsD0fTMnoEPyLnpU+rwmf6E8P+D7r9EPQDFSatJPc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aZXvSg8vXJPaFj/ZByX1p0XDU68VyBxvtgrkPRLX3XwzaqmOlD5WsdEc6Buj1Wdji
	 KcLz2tkIwWfkxq6jX/ytvCfpf7ZxX8BRwGl/o7wUisMbGvJh5xLCjRLC2UIaReBBSf
	 MQhCz0qjY5VtJuI4zmt3vH9Z4HXskj/nHev+f9QU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576I4MeC3274838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 13:04:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 13:04:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 13:04:22 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576I4MmM3937262;
	Wed, 6 Aug 2025 13:04:22 -0500
Message-ID: <2dafd450-61af-43c3-90d8-d52c20db905d@ti.com>
Date: Wed, 6 Aug 2025 13:04:22 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: ti_k3_common: remove remote processor mailbox
 ping
To: Hiago De Franco <hiagofranco@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Beleswar Prasad Padhi <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Hiago De
 Franco <hiago.franco@toradex.com>
References: <20250806-v1-fix-am62-hmp-suspend-v1-1-1c4a81bb5dde@toradex.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250806-v1-fix-am62-hmp-suspend-v1-1-1c4a81bb5dde@toradex.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 8/6/25 12:48 PM, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> As of today, pinging the remote processor during k3_rproc_request_mbox()
> does not have any functional effect. This behavior was originally based on
> the OMAP remoteproc driver, where the idea was to send messages such as
> suspend requests (among others) to the remote processor, but this was
> never upstreamed.
> 
> Currently, the ping message has no effect in upstream usage and causes an
> unread message to remain in the mailbox, which ultimately prevents the
> system from entering suspend mode:
> 
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages
> omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
> omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
> 
> The ping is only replied if the remote core firmware is capable of doing
> it, otherwise the unread message stays into the mailbox.
> 
> Remove the ping and fix the suspend issue.
> 
> Suggested-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---

Looks good to me,

Acked-by: Andrew Davis <afd@ti.com>

> Hi,
> 
> this is the result patch of the discussion from
> 
> https://lore.kernel.org/lkml/20250725150713.barg5lhqr4reoxv3@hiagonb/
> ---
>   drivers/remoteproc/ti_k3_common.c | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index d4f20900f33bdd92a59c62d0a7b166c4ad66ed16..8266e11914af87ac38977763099521dee4334348 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -160,7 +160,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>   	struct k3_rproc *kproc = rproc->priv;
>   	struct mbox_client *client = &kproc->client;
>   	struct device *dev = kproc->dev;
> -	int ret;
>   
>   	client->dev = dev;
>   	client->tx_done = NULL;
> @@ -173,20 +172,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>   		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>   				     "mbox_request_channel failed\n");
>   
> -	/*
> -	 * Ping the remote processor, this is only for sanity-sake for now;
> -	 * there is no functional effect whatsoever.
> -	 *
> -	 * Note that the reply will _not_ arrive immediately: this message
> -	 * will wait in the mailbox fifo until the remote processor is booted.
> -	 */
> -	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> -	if (ret < 0) {
> -		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> -		mbox_free_channel(kproc->mbox);
> -		return ret;
> -	}
> -
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> 
> ---
> base-commit: 6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
> change-id: 20250805-v1-fix-am62-hmp-suspend-aed6a8de0225
> 
> Best regards,

