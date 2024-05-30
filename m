Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E164117623B;
	Thu, 30 May 2024 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717078583; cv=none; b=Qif2C+r32W3DnOPKb7EUjbnDqbY3yrTz8zdSIZc8Kh2Lraj9vGaT8+GfWuqVCYAxoIuDIleeQixlC4UXMPgFE3scGXyA6dPexvj5dcbJZoZqMdkbVlODvqgxbRfdVp3PmiyT/dgtknJwAqC/x3r91Py41L/d+furfqha3EBiN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717078583; c=relaxed/simple;
	bh=XHEzmTU6TsMl2HL0lh7xh7EcI1/rI7nfT7EpcRQgBqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tpWagJitcWJEP+yjd2NEThWzb/lDC/ayvtRl5tRw31d5VsKU1BI7mJ48akBMKUNxUAQ1iMiEORx717psiCQPi23J3phSqJ7W2vhksgTEldOozdi6Z4LUuWmP1O1p+wWprquXsF5KuKrKa/v1JLMY+QpZ28nsXCXLTWhlmQUiVcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=x4UrbRbz; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x4UrbRbz"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UEGF5V048621;
	Thu, 30 May 2024 09:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717078575;
	bh=LGzBrnsj8DdUIyYlEUEk6HInlbCKMlcPqN6HFAbEEFM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=x4UrbRbz+g461/P3arZtghw29F1sZpygj5nGhy6YNW5nX6e/PRQtCSb5E1Vh7a0qe
	 G69TomoUm1RoCWwMnuqV35lOuxgHJbZd/0N2YI0JR33nkpcIN3Au430XoYO+4GrGnL
	 0JglcsXNzGDsv9vD/g9EAkzpI0NYbw4RrJ8A5dRs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UEGFQJ038600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 09:16:15 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 09:16:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 09:16:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UEGFw0034727;
	Thu, 30 May 2024 09:16:15 -0500
Message-ID: <b5582d8a-b7bf-49e2-a8a3-879275a881b2@ti.com>
Date: Thu, 30 May 2024 09:16:14 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: k3-r5: Acquire mailbox handle during
 probe
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240530090737.655054-1-b-padhi@ti.com>
 <20240530090737.655054-3-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240530090737.655054-3-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 5/30/24 4:07 AM, Beleswar Padhi wrote:
> Acquire the mailbox handle during device probe and do not release handle
> in stop/detach routine or error paths. This removes the redundant
> requests for mbox handle later during rproc start/attach. This also
> allows to defer remoteproc driver's probe if mailbox is not probed yet.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 66 ++++++++----------------
>   1 file changed, 21 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 26362a509ae3..157e8fd57665 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -391,6 +391,7 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
>   	struct mbox_client *client = &kproc->client;
>   	struct device *dev = kproc->dev;
>   	int ret;
> +	long err;
>   
>   	client->dev = dev;
>   	client->tx_done = NULL;
> @@ -400,10 +401,9 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
>   
>   	kproc->mbox = mbox_request_channel(client, 0);
>   	if (IS_ERR(kproc->mbox)) {
> -		ret = -EBUSY;
> -		dev_err(dev, "mbox_request_channel failed: %ld\n",
> -			PTR_ERR(kproc->mbox));
> -		return ret;
> +		err = PTR_ERR(kproc->mbox);
> +		dev_err(dev, "mbox_request_channel failed: %ld\n", err);
> +		return (err == -EPROBE_DEFER) ? -EPROBE_DEFER : -EBUSY;

Why turn all other errors into EBUSY? If you just return the error as-is you
can simply make these 3 lines just:

return dev_err_probe(dev, PTR_ERR(kproc->mbox), "mbox_request_channel failed\n");

>   	}
>   
>   	/*
> @@ -552,10 +552,6 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   	u32 boot_addr;
>   	int ret;
>   
> -	ret = k3_r5_rproc_request_mbox(rproc);
> -	if (ret)
> -		return ret;
> -
>   	boot_addr = rproc->bootaddr;
>   	/* TODO: add boot_addr sanity checking */
>   	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
> @@ -564,7 +560,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   	core = kproc->core;
>   	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
>   	if (ret)
> -		goto put_mbox;
> +		goto out;

The label "out" doesn't do anything, just directly `return ret;` here and
in the other cases below.

>   
>   	/* unhalt/run all applicable cores */
>   	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
> @@ -581,12 +577,12 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   			dev_err(dev, "%s: can not start core 1 before core 0\n",
>   				__func__);
>   			ret = -EPERM;
> -			goto put_mbox;
> +			goto out;
>   		}
>   
>   		ret = k3_r5_core_run(core);
>   		if (ret)
> -			goto put_mbox;
> +			goto out;
>   	}
>   
>   	return 0;
> @@ -596,8 +592,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   		if (k3_r5_core_halt(core))
>   			dev_warn(core->dev, "core halt back failed\n");
>   	}
> -put_mbox:
> -	mbox_free_channel(kproc->mbox);
> +out:
>   	return ret;
>   }
>   
> @@ -658,8 +653,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   			goto out;
>   	}
>   
> -	mbox_free_channel(kproc->mbox);
> -
>   	return 0;
>   
>   unroll_core_halt:
> @@ -674,42 +667,21 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   /*
>    * Attach to a running R5F remote processor (IPC-only mode)
>    *
> - * The R5F attach callback only needs to request the mailbox, the remote
> - * processor is already booted, so there is no need to issue any TI-SCI
> - * commands to boot the R5F cores in IPC-only mode. This callback is invoked
> - * only in IPC-only mode.
> + * The R5F attach callback is a NOP. The remote processor is already booted, and
> + * all required resources have been acquired during probe routine, so there is
> + * no need to issue any TI-SCI commands to boot the R5F cores in IPC-only mode.
> + * This callback is invoked only in IPC-only mode and exists for sanity sake.
>    */
> -static int k3_r5_rproc_attach(struct rproc *rproc)
> -{
> -	struct k3_r5_rproc *kproc = rproc->priv;
> -	struct device *dev = kproc->dev;
> -	int ret;
> -
> -	ret = k3_r5_rproc_request_mbox(rproc);
> -	if (ret)
> -		return ret;
> -
> -	dev_info(dev, "R5F core initialized in IPC-only mode\n");
> -	return 0;
> -}
> +static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
>   
>   /*
>    * Detach from a running R5F remote processor (IPC-only mode)
>    *
> - * The R5F detach callback performs the opposite operation to attach callback
> - * and only needs to release the mailbox, the R5F cores are not stopped and
> - * will be left in booted state in IPC-only mode. This callback is invoked
> - * only in IPC-only mode.
> + * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
> + * left in booted state in IPC-only mode. This callback is invoked only in
> + * IPC-only mode and exists for sanity sake.
>    */
> -static int k3_r5_rproc_detach(struct rproc *rproc)
> -{
> -	struct k3_r5_rproc *kproc = rproc->priv;
> -	struct device *dev = kproc->dev;
> -
> -	mbox_free_channel(kproc->mbox);
> -	dev_info(dev, "R5F core deinitialized in IPC-only mode\n");
> -	return 0;
> -}
> +static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }

Do we still need to disable the mbox channel somehow here to prevent
receiving more messages from the detached core?

>   
>   /*
>    * This function implements the .get_loaded_rsc_table() callback and is used
> @@ -1277,6 +1249,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   		kproc->rproc = rproc;
>   		core->rproc = rproc;
>   
> +		ret = k3_r5_rproc_request_mbox(rproc);

Now that we get the channel here in init you'll want to add a matching
mbox_free_channel() call to k3_r5_cluster_rproc_exit().

Andrew

> +		if (ret)
> +			return ret;
> +
>   		ret = k3_r5_rproc_configure_mode(kproc);
>   		if (ret < 0)
>   			goto err_config;
