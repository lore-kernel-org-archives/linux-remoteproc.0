Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3141F941E;
	Fri,  3 Jan 2025 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901311; cv=none; b=PCH146Nnqu4jBNUuaj67om+0t35v2c0EimmGEXuya2puBdK8X6Y7qRrOJyutSrpOKYrz46M/kutJ2USluXtXyO5YZI1kZVU4UmzveOA/dupb2otIlNqvpWufzPOjSd3HCdBwX06VAe+2UrmwK8Sa60C3DI4oLE2IOHaaKteFH1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901311; c=relaxed/simple;
	bh=JRARIUQzg7199sV8OuqPAINycHDAW5D/RR6t88lC4gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dY8JjYPvG9O+4MomIubsns2hD6F2tWi4lCOhog2cvFb5mdEbtT/RhWxh5zBy3qzWc4XXFdGqyKVGuRQmGCNS54aUAKzTS4M0evuVmMfuPijpgoz32QpFqhs+bCY8qD5XY0FR+1oIDyALTzjWeJtkWPYn7ThUUKJYh8AR8/FAuk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DY0fzcCY; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DY0fzcCY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503AmJ5U2079919
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 04:48:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735901299;
	bh=OuWIQibR02jfW/BNVFMOLNCwKrhtNiwxqgC6n+aMpWs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DY0fzcCYWrR9ke+wc6t1NHHuQ690xdw1Brfs6hCbyxDYm6ICbrOA/9W7HVjay2hIh
	 8ZFbl2N3sfu8sjUrECNT0YJcPXAymWzIO49bJfNruzaIQ0t0nfaD3MwfLmmsl+2DHD
	 8tWKv3LxaYdUqSF/QG4cGcz8q6TV/9B81k8IO5GA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503AmJb2016093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:48:19 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:48:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:48:19 -0600
Received: from [172.24.24.243] (lt5cd2489kgj.dhcp.ti.com [172.24.24.243])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503AmFDc016291;
	Fri, 3 Jan 2025 04:48:16 -0600
Message-ID: <beffe56a-ae72-4e51-b574-0126e93f775a@ti.com>
Date: Fri, 3 Jan 2025 16:18:14 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] remoteproc: k3-r5: Refactor sequential core power
 up/down operations
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <s-vadapalli@ti.com>, <srk@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241224091457.1050233-1-b-padhi@ti.com>
 <20241224091457.1050233-4-b-padhi@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20241224091457.1050233-4-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 12/24/2024 2:44 PM, Beleswar Padhi wrote:
> The existing implementation of the waiting mechanism in
> "k3_r5_cluster_rproc_init()" waits for the "released_from_reset" flag to
> be set as part of the firmware boot process in "k3_r5_rproc_start()".
> The "k3_r5_cluster_rproc_init()" function is invoked in the probe
> routine which causes unexpected failures in cases where the firmware is
> unavailable at boot time, resulting in probe failure and removal of the
> remoteproc handles in the sysfs paths.
>
> To address this, the waiting mechanism is refactored out of the probe
> routine into the appropriate "k3_r5_rproc_{prepare/unprepare}()"
> functions. This allows the probe routine to complete without depending
> on firmware booting, while still maintaining the required
> power-synchronization between cores.
>
> Further, this wait mechanism is dropped from
> "k3_r5_rproc_{start/stop}()" functions as they deal with Core Run/Halt
> operations, and as such, there is no constraint in Running or Halting
> the cores of a cluster in order.
>
> Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Link to v1:
> https://lore.kernel.org/all/20240906094045.2428977-1-b-padhi@ti.com/
>
> v2: Changelog:
> 1. Improved commit message to call out functions correctly. [Mathieu]
> 2. Removed sequential wait/checks from .start()/.stop() ops as there is no
> constraint for Core Run/Halt operations.
>
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 114 ++++++++++++-----------
>   1 file changed, 61 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index e218a803fdb5..15e5a10801cd 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -456,13 +456,36 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
> -	struct k3_r5_core *core = kproc->core;
> +	struct k3_r5_core *core = kproc->core, *core0, *core1;
>   	struct device *dev = kproc->dev;
>   	u32 ctrl = 0, cfg = 0, stat = 0;
>   	u64 boot_vec = 0;
>   	bool mem_init_dis;
>   	int ret;
>   
> +	/*
> +	 * R5 cores require to be powered on sequentially, core0 should be in
> +	 * higher power state than core1 in a cluster. So, wait for core0 to
> +	 * power up before proceeding to core1 and put timeout of 2sec. This
> +	 * waiting mechanism is necessary because rproc_auto_boot_callback() for
> +	 * core1 can be called before core0 due to thread execution order.
> +	 *
> +	 * By placing the wait mechanism here in .prepare() ops, this condition
> +	 * is enforced for rproc boot requests from sysfs as well.
> +	 */
> +	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
> +	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
> +	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1 &&
> +	    !core0->released_from_reset) {
> +		ret = wait_event_interruptible_timeout(cluster->core_transition,
> +						       core0->released_from_reset,
> +						       msecs_to_jiffies(2000));
> +		if (ret <= 0) {
> +			dev_err(dev, "can not power up core1 before core0");
> +			return -EPERM;
> +		}
> +	}
> +
>   	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
>   	if (ret < 0)
>   		return ret;
> @@ -478,6 +501,13 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   		return ret;
>   	}
>   
> +	/*
> +	 * Notify all threads in the wait queue when core state has changed so
> +	 * that threads waiting for this condition can be executed.
> +	 */
> +	core->released_from_reset = true;
> +	wake_up_interruptible(&cluster->core_transition);

I think, you should signal this only for core-0,


> +
>   	/*
>   	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
>   	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
> @@ -523,10 +553,30 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
> -	struct k3_r5_core *core = kproc->core;
> +	struct k3_r5_core *core = kproc->core, *core0, *core1;
>   	struct device *dev = kproc->dev;
>   	int ret;
>   
> +	/*
> +	 * Ensure power-down of cores is sequential in split mode. Core1 must
> +	 * power down before Core0 to maintain the expected state. By placing
> +	 * the wait mechanism here in .unprepare() ops, this condition is
> +	 * enforced for rproc stop or shutdown requests from sysfs and device
> +	 * removal as well.
> +	 */
> +	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
> +	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
> +	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core0 &&
> +	    core1->released_from_reset) {
> +		ret = wait_event_interruptible_timeout(cluster->core_transition,
> +						       !core1->released_from_reset,
> +						       msecs_to_jiffies(2000));
> +		if (ret <= 0) {
> +			dev_err(dev, "can not power down core0 before core1");
> +			return -EPERM;
> +		}
> +	}
> +
>   	/* Re-use LockStep-mode reset logic for Single-CPU mode */
>   	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
>   	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
> @@ -534,6 +584,13 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   	if (ret)
>   		dev_err(dev, "unable to disable cores, ret = %d\n", ret);
>   
> +	/*
> +	 * Notify all threads in the wait queue when core state has changed so
> +	 * that threads waiting for this condition can be executed.
> +	 */
> +	core->released_from_reset = false;
> +	wake_up_interruptible(&cluster->core_transition);
> +
>   	return ret;
>   }
>   
> @@ -559,7 +616,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
>   	struct device *dev = kproc->dev;
> -	struct k3_r5_core *core0, *core;
> +	struct k3_r5_core *core;
>   	u32 boot_addr;
>   	int ret;
>   
> @@ -581,21 +638,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   				goto unroll_core_run;
>   		}
>   	} else {
> -		/* do not allow core 1 to start before core 0 */
> -		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
> -					 elem);
> -		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
> -			dev_err(dev, "%s: can not start core 1 before core 0\n",
> -				__func__);
> -			return -EPERM;
> -		}
> -
>   		ret = k3_r5_core_run(core);
>   		if (ret)
>   			return ret;
> -
> -		core->released_from_reset = true;
> -		wake_up_interruptible(&cluster->core_transition);
>   	}
>   
>   	return 0;
> @@ -636,8 +681,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
> -	struct device *dev = kproc->dev;
> -	struct k3_r5_core *core1, *core = kproc->core;
> +	struct k3_r5_core *core = kproc->core;
>   	int ret;
>   
>   	/* halt all applicable cores */
> @@ -650,16 +694,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   			}
>   		}
>   	} else {
> -		/* do not allow core 0 to stop before core 1 */
> -		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
> -					elem);
> -		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
> -			dev_err(dev, "%s: can not stop core 0 before core 1\n",
> -				__func__);
> -			ret = -EPERM;
> -			goto out;
> -		}
> -
>   		ret = k3_r5_core_halt(core);
>   		if (ret)
>   			goto out;
> @@ -1154,12 +1188,6 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
>   		return reset_ctrl_status;
>   	}
>   
> -	/*
> -	 * Skip the waiting mechanism for sequential power-on of cores if the
> -	 * core has already been booted by another entity.
> -	 */
> -	core->released_from_reset = c_state;
> -
>   	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
>   				     &stat);
>   	if (ret < 0) {
> @@ -1304,26 +1332,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   		    cluster->mode == CLUSTER_MODE_SINGLECPU ||
>   		    cluster->mode == CLUSTER_MODE_SINGLECORE)
>   			break;
> -
> -		/*
> -		 * R5 cores require to be powered on sequentially, core0
> -		 * should be in higher power state than core1 in a cluster
> -		 * So, wait for current core to power up before proceeding
> -		 * to next core and put timeout of 2sec for each core.
> -		 *
> -		 * This waiting mechanism is necessary because
> -		 * rproc_auto_boot_callback() for core1 can be called before
> -		 * core0 due to thread execution order.
> -		 */
> -		ret = wait_event_interruptible_timeout(cluster->core_transition,
> -						       core->released_from_reset,
> -						       msecs_to_jiffies(2000));
> -		if (ret <= 0) {
> -			dev_err(dev,
> -				"Timed out waiting for %s core to power up!\n",
> -				rproc->name);
> -			goto out;
> -		}
>   	}
>   
>   	return 0;
