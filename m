Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A961BC3C;
	Sat, 18 May 2024 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716029103; cv=none; b=j4czcIQkxSPOSAwZ+tLIZh/oRofuLuYf4AdWbfSJWKNk9Wlj+I1NZ3sN3NJqpnca3lyEN9jAXI/70U4Bu8X1fOY6pWdUx15KYIcp9M8PyBfaCLgcq43js6g0ZzMXHZNKWwn+bMRNhZVWv2h4dw1oxE6DEeVhBkEdKrkkyRLFaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716029103; c=relaxed/simple;
	bh=w9uO90PEVchWF/KDLtiQBRWtcj+my9bPQ3PyABa0620=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMMoYTK8a6QHmdeJUhWC/4tsvUYVMQNmik/LBafD64VY806dU9gohFKGEQvtky7xdyIZd/TB6nf/wB3FKsdJu9/BppmioVmFM9lanGvxEfNR8ICQP1naW94/zbPoVbN4QcXIcBNO3pgnT2r81uWactgdNxfxKTGHy74lEjdAh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MubZWbbp; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MubZWbbp"
Received: from [192.168.1.37] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 8HYOsF27V8l328HYOsn98a; Sat, 18 May 2024 12:44:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716029082;
	bh=CnHWkfDAsDJHSUGxw5qt7rqfqyEiFLAjpWktp56bQ+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=MubZWbbpbZ3c+j/jDwgju82KMsgt+psBSNdHLGfXsH58n04rw1MlW4ZNCTFcY2QGL
	 yCBkWFWanH+ekkYkHzQKG2+nu4uERUD28J3d/hCtIAUe6rLoSTQSnfnZQ3AIkYz64L
	 GtJ+CIPBU9Kx1PQ74L2ZlJv0LLnZdflmoG1JSMaTbL/J+AZHZvmJKCJe2RZH4HyTZK
	 adnu+08kdbp3MQdqfw/xFgy6k1ppyo/D9RIVyw7tyOiSMe8YGVR80DvTLCg+ZYZmMX
	 7e8e/lpKecQs8hT9O3Q/LHh9T/+YNiVkgg9ZEPQjiMJ+/jYoj7qljJqKdbe7vdKpIP
	 QXbjpEYyitC+g==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 May 2024 12:44:42 +0200
X-ME-IP: 86.243.17.157
Message-ID: <954f974f-8b97-4ff6-bb57-35501fa9ceb9@wanadoo.fr>
Date: Sat, 18 May 2024 12:44:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] remoteproc: k3-r5: Do not allow core1 to power up
 before core0 via sysfs
To: Beleswar Padhi <b-padhi@ti.com>, andersson@kernel.org
Cc: mathieu.poirier@linaro.org, s-anna@ti.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 u-kumar1@ti.com, nm@ti.com, devarsht@ti.com, hnagalla@ti.com
References: <20240430105307.1190615-1-b-padhi@ti.com>
 <20240430105307.1190615-3-b-padhi@ti.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240430105307.1190615-3-b-padhi@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/04/2024 à 12:53, Beleswar Padhi a écrit :
> PSC controller has a limitation that it can only power-up the second
> core when the first core is in ON state. Power-state for core0 should be
> equal to or higher than core1.
> 
> Therefore, prevent core1 from powering up before core0 during the start
> process from sysfs. Similarly, prevent core0 from shutting down before
> core1 has been shut down from sysfs.
> 
> Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 6d6afd6beb3a..1799b4f6d11e 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -548,7 +548,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
>   	struct device *dev = kproc->dev;
> -	struct k3_r5_core *core;
> +	struct k3_r5_core *core0, *core;
>   	u32 boot_addr;
>   	int ret;
>   
> @@ -574,6 +574,15 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   				goto unroll_core_run;
>   		}
>   	} else {
> +		/* do not allow core 1 to start before core 0 */
> +		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
> +					 elem);
> +		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
> +			dev_err(dev, "%s: can not start core 1 before core 0\n",
> +				__func__);
> +			return -EPERM;
> +		}
> +
>   		ret = k3_r5_core_run(core);
>   		if (ret)
>   			goto put_mbox;
> @@ -619,7 +628,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
> -	struct k3_r5_core *core = kproc->core;
> +	struct device *dev = kproc->dev;
> +	struct k3_r5_core *core1, *core = kproc->core;
>   	int ret;
>   
>   	/* halt all applicable cores */
> @@ -632,6 +642,15 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   			}
>   		}
>   	} else {
> +		/* do not allow core 0 to stop before core 1 */
> +		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
> +					elem);
> +		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
> +			dev_err(dev, "%s: can not stop core 0 before core 1\n",
> +				__func__);
> +			return -EPERM;

Hi,

this patch has already reached -next, but should this "return -EPERM;" be :
	ret = -EPERM;
	goto put_mbox;

instead?

CJ

> +		}
> +
>   		ret = k3_r5_core_halt(core);
>   		if (ret)
>   			goto out;

