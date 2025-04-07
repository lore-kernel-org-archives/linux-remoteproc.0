Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B81ADC78;
	Mon,  7 Apr 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033546; cv=none; b=CY2ARCDIX6NM9WGu5AJBE5+e0qU2KUdzXBaCSMdf1xgSC9ngAVlUa/s3KXvs53kvypFwfzdwb1QZ1bgdXeAK25mR6PLT/L9XzrNSoWyrdA57EqhRddPNlxhK2PQE8AfN0v/rNhMgyWjqZdti2+Wbtt3IZt+xzQUSLohLTPlrlgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033546; c=relaxed/simple;
	bh=umqm3TDU9XF0elsu9EbhVRvgfRPIxrhVZo2wxsQWo4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U6B8m0uXKS6PGMPZogWkm9/B1rZ4+9ko6cIk+vYlDTJ9Krgig6wwVBGrHbBT6SE9OE12xYKhmmQw32YpFYNbSkJHqXYya/DITVJ8DU36t66FRmv0awGtPdmD31yxuPMGaKAoV3lwXNS2mogeKeTTq9um1Cel+6oiTU5CW5GonfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=to2Avqhs; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="to2Avqhs"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537DjX3P229288
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744033533;
	bh=63OGtBoO5syfbGWX7pALVbovpmBjCKAz86cxo6QHknc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=to2AvqhsGYXnmtYVdQgSnSwmjIKYxVSLrEnA0A0WjyI11VzQn385rZLgmB2OrScAU
	 oDvo3MWQvBn5MZz/7Byu2jt0QeZtqK7o6Fo49RKa3zqhApG9nh+RZrmZ/Rz0kI+PYm
	 fS6LGhFxChfqEp2vvDVJPy3lbuEWdCG1qHRdbJFY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537DjXcI028968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:45:33 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:45:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:45:33 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537DjW9h091835;
	Mon, 7 Apr 2025 08:45:32 -0500
Message-ID: <4647ecee-491f-4480-9d43-c5a19f300ca3@ti.com>
Date: Mon, 7 Apr 2025 08:45:32 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/26] remoteproc: k3-r5: Refactor sequential core
 power up/down operations
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
 <20250317120622.1746415-9-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250317120622.1746415-9-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 3/17/25 7:06 AM, Beleswar Padhi wrote:
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

Same as the above two patches in this series, these are all valid fixes, but should be
done first before the refactoring begins, so move them to the start of the series.

Andrew

>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 114 +++++++++++++----------
>   1 file changed, 65 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index c0e4da82775d..30081eafbd36 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -475,7 +475,7 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
>   static int k3_r5_rproc_prepare(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
> -	struct k3_r5_core *core = kproc->priv;
> +	struct k3_r5_core *core = kproc->priv, *core0, *core1;
>   	struct k3_r5_cluster *cluster = core->cluster;
>   	struct device *dev = kproc->dev;
>   	u32 ctrl = 0, cfg = 0, stat = 0;
> @@ -483,6 +483,29 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
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
>   	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
>   	if (ret < 0)
>   		return ret;
> @@ -498,6 +521,14 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   		return ret;
>   	}
>   
> +	/*
> +	 * Notify all threads in the wait queue when core0 state has changed so
> +	 * that threads waiting for this condition can be executed.
> +	 */
> +	core->released_from_reset = true;
> +	if (core == core0)
> +		wake_up_interruptible(&cluster->core_transition);
> +
>   	/*
>   	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
>   	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
> @@ -542,11 +573,31 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
> -	struct k3_r5_core *core = kproc->priv;
> +	struct k3_r5_core *core = kproc->priv, *core0, *core1;
>   	struct k3_r5_cluster *cluster = core->cluster;
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
> @@ -554,6 +605,14 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   	if (ret)
>   		dev_err(dev, "unable to disable cores, ret = %d\n", ret);
>   
> +	/*
> +	 * Notify all threads in the wait queue when core1 state has changed so
> +	 * that threads waiting for this condition can be executed.
> +	 */
> +	core->released_from_reset = false;
> +	if (core == core1)
> +		wake_up_interruptible(&cluster->core_transition);
> +
>   	return ret;
>   }
>   
> @@ -577,7 +636,7 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   static int k3_r5_rproc_start(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
> -	struct k3_r5_core *core0, *core = kproc->priv;
> +	struct k3_r5_core *core = kproc->priv;
>   	struct k3_r5_cluster *cluster = core->cluster;
>   	struct device *dev = kproc->dev;
>   	u32 boot_addr;
> @@ -600,21 +659,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   				goto unroll_core_run;
>   		}
>   	} else {
> -		/* do not allow core 1 to start before core 0 */
> -		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
> -					 elem);
> -		if (core != core0 && core0->kproc->rproc->state == RPROC_OFFLINE) {
> -			dev_err(dev, "%s: can not start core 1 before core 0\n",
> -				__func__);
> -			return -EPERM;
> -		}
> -
> -		ret = k3_r5_core_run(core->kproc);
> +		ret = k3_r5_core_run(kproc);
>   		if (ret)
>   			return ret;
> -
> -		core->released_from_reset = true;
> -		wake_up_interruptible(&cluster->core_transition);
>   	}
>   
>   	return 0;
> @@ -654,9 +701,8 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   static int k3_r5_rproc_stop(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
> -	struct k3_r5_core *core1, *core = kproc->priv;
> +	struct k3_r5_core *core = kproc->priv;
>   	struct k3_r5_cluster *cluster = core->cluster;
> -	struct device *dev = kproc->dev;
>   	int ret;
>   
>   	/* halt all applicable cores */
> @@ -669,17 +715,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   			}
>   		}
>   	} else {
> -		/* do not allow core 0 to stop before core 1 */
> -		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
> -					elem);
> -		if (core != core1 && core1->kproc->rproc->state != RPROC_OFFLINE) {
> -			dev_err(dev, "%s: can not stop core 0 before core 1\n",
> -				__func__);
> -			ret = -EPERM;
> -			goto out;
> -		}
> -
> -		ret = k3_r5_core_halt(core->kproc);
> +		ret = k3_r5_core_halt(kproc);
>   		if (ret)
>   			goto out;
>   	}
> @@ -1441,26 +1477,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
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
> -			dev_err(cdev,
> -				"Timed out waiting for %s core to power up!\n",
> -				rproc->name);
> -			goto out;
> -		}
>   	}
>   
>   	return 0;
