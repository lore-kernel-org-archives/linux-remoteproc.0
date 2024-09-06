Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B41304BF;
	Fri,  6 Sep 2024 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725646675; cv=none; b=gdjqRTvtiBS7Ntva+kSpkYYMrD4zzbS7vaij9JJPAwCDyoAfeYj5FbxijZOZgN9Errs/9yTqpXOsKYhg76zIdcvAAJ/RniTKDhCMNKeH7ggpRDL8v1OnarEE5InZF3BXxeVSqtayqMUy97kTaFoDwSanR25D5sjwZjrr0H5ku1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725646675; c=relaxed/simple;
	bh=3ZsVZxZRiOEtdIbt7m3kXxVk3snOz/dBbtGCqg7xyjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lil5PnTwv3HskoYaEOfiyksRkeKMPHVhOyuQTBA6Cjy+V46vH9bSGktvGwFBw5zN/u1ucrM09vEqVyycJikOiPcU05O3LTTRKRVrHJbgO1dok74ywhBhukV694MHOzVRcnf/zbLiVqHyf6kWT7pPCFElK9EQPT55YQw2NW2bagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OD+b0Pvr; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OD+b0Pvr"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 486IHawa080299;
	Fri, 6 Sep 2024 13:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725646656;
	bh=hYglL1zDcOHOA/KWyKkQET2E5wdq6KlS/ZwLBgUMino=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OD+b0PvrynLSdRKqj2E6dl/w39rg3Sz5TjvuJSKqXr8beQmMu64tjqwjVpfjntvFo
	 VQDretE0MxIN8rAdmPkkczhxlmP8CV1rS/hyDtNtjqwKBX7Nl0IiBmFDyL37/9GAmt
	 eNnSOyJKFNilJvSLUTQAumh2ADORJtfJkFB1R3PM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 486IHa9d019898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Sep 2024 13:17:36 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 13:17:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 13:17:36 -0500
Received: from [10.249.130.61] ([10.249.130.61])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486IHWXs125220;
	Fri, 6 Sep 2024 13:17:33 -0500
Message-ID: <9ea91582-4745-4559-97a5-65b57ead7d70@ti.com>
Date: Fri, 6 Sep 2024 23:47:31 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: k3-r5: Decouple firmware booting from probe
 routine
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <afd@ti.com>, <hnagalla@ti.com>, <s-anna@ti.com>,
        <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240906094045.2428977-1-b-padhi@ti.com> <ZtsyE2ibvJwuL7oH@p14s>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <ZtsyE2ibvJwuL7oH@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Mathieu,

On 06-09-2024 22:17, Mathieu Poirier wrote:
> On Fri, Sep 06, 2024 at 03:10:45PM +0530, Beleswar Padhi wrote:
>> The current implementation of the waiting mechanism in probe() waits for
>> the 'released_from_reset' flag to be set which is done in
>> k3_r5_rproc_prepare() as part of rproc_fw_boot(). This causes unexpected
> If you are looking at rproc-next, @released_from_reset is set in
> k3_r5_rproc_start().


You are correct. Apologies, this flag is set in the start() function 
(still a part of rproc_fw_boot()), not prepare(). I wanted to point out 
@released_from_reset is set in rproc_fw_boot() routine, and is checked 
for in the probe() routine.

> Moreover, the waiting mechanic happens in
> k3_r5_cluster_rproc_init(), which makes reading your changelog highly confusing.


Yes, the mechanism is in the k3_r5_cluster_rproc_init() function which 
is called from k3_r5_probe(), hence I referred to it being called in the 
probe routine. The point I wanted to make was, any error while booting 
firmware would end up in a probe failure. Apologies for not making it 
clearer.

>
>> failures in cases where the firmware is unavailable at boot time,
>> resulting in probe failure and removal of the remoteproc handles in the
>> sysfs paths.
>>
>> To address this, the waiting mechanism is refactored out of the probe
>> routine into the appropriate k3_r5_rproc_prepare/unprepare() and
>> k3_r5_rproc_start/stop() functions. This allows the probe routine to
>> complete without depending on firmware booting, while still maintaining
>> the required power-synchronization between cores.
>>
>> Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> Posted this as a Fix as this was breaking usecases where we wanted to load a
>> firmware by writing to sysfs handles in userspace.
>>
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 170 ++++++++++++++++-------
>>   1 file changed, 118 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 747ee467da88..df8f124f4248 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -131,6 +131,7 @@ struct k3_r5_cluster {
>>    * @btcm_enable: flag to control BTCM enablement
>>    * @loczrama: flag to dictate which TCM is at device address 0x0
>>    * @released_from_reset: flag to signal when core is out of reset
>> + * @unhalted: flag to signal when core is unhalted
>>    */
>>   struct k3_r5_core {
>>   	struct list_head elem;
>> @@ -148,6 +149,7 @@ struct k3_r5_core {
>>   	u32 btcm_enable;
>>   	u32 loczrama;
>>   	bool released_from_reset;
>> +	bool unhalted;
> Yet another flag?  @released_from_reset is not enough?


So, technically @released_from_reset should maintain the sync between 
_prepare() of #core0 and #core1. But with commit 8fa052c29e50 
("remoteproc: k3-r5: Delay notification of wakeup event"), we are trying 
to maintain the sync of both _prepare() and _start() with just this one 
flag by pushing the notification from prepare() to start(). Having two 
flags is a cleanup attempt, where @released_from_reset handles 
_prepare() sync and @unhalted handles _start() sync.

>   And why does it need to
> be "unhalted" rather than something like "running"?


"running" sounds like a better name for this flag. Thank you!

>   I will not move forward
> with this patch until I get an R-B and a T-B from two other people at TI.
>
> The above and the exchange with Jan Kiszka is furthering my belief that this
> driver is up for a serious refactoring exercise.  From hereon I will only
> consider bug fixes.


I understand the concern. I will do the refactor and possibly include 
this patch as part of that refactoring series.

Thanks,
Beleswar

>
> Thanks,
> Mathieu
>
>>   };
>>   
>>   /**
>> @@ -448,13 +450,33 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>>   {
>>   	struct k3_r5_rproc *kproc = rproc->priv;
>>   	struct k3_r5_cluster *cluster = kproc->cluster;
>> -	struct k3_r5_core *core = kproc->core;
>> +	struct k3_r5_core *core0, *core1, *core = kproc->core;
>>   	struct device *dev = kproc->dev;
>>   	u32 ctrl = 0, cfg = 0, stat = 0;
>>   	u64 boot_vec = 0;
>>   	bool mem_init_dis;
>>   	int ret;
>>   
>> +	/*
>> +	 * R5 cores require to be powered on sequentially, core0 should be in
>> +	 * higher power state than core1 in a cluster. So, wait for core0 to
>> +	 * power up before proceeding to core1 and put timeout of 2sec. This
>> +	 * waiting mechanism is necessary because rproc_auto_boot_callback() for
>> +	 * core1 can be called before core0 due to thread execution order.
>> +	 */
>> +	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>> +	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>> +	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1 &&
>> +	    core0->released_from_reset == false) {
>> +		ret = wait_event_interruptible_timeout(cluster->core_transition,
>> +						       core0->released_from_reset,
>> +						       msecs_to_jiffies(2000));
>> +		if (ret <= 0) {
>> +			dev_err(dev, "can not power up core1 before core0");
>> +			return -EPERM;
>> +		}
>> +	}
>> +
>>   	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
>>   	if (ret < 0)
>>   		return ret;
>> @@ -470,6 +492,12 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>>   		return ret;
>>   	}
>>   
>> +	/* Notify all threads in the wait queue when core state has changed so
>> +	 * that threads waiting for this condition can be executed.
>> +	 */
>> +	core->released_from_reset = true;
>> +	wake_up_interruptible(&cluster->core_transition);
>> +
>>   	/*
>>   	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
>>   	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
>> @@ -515,14 +543,46 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>>   {
>>   	struct k3_r5_rproc *kproc = rproc->priv;
>>   	struct k3_r5_cluster *cluster = kproc->cluster;
>> -	struct k3_r5_core *core = kproc->core;
>> +	struct k3_r5_core *core0, *core1, *core = kproc->core;
>>   	struct device *dev = kproc->dev;
>>   	int ret;
>>   
>>   	/* Re-use LockStep-mode reset logic for Single-CPU mode */
>> -	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
>> -	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
>> -		k3_r5_lockstep_reset(cluster) : k3_r5_split_reset(core);
>> +	if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
>> +	    cluster->mode == CLUSTER_MODE_SINGLECPU)
>> +		ret = k3_r5_lockstep_reset(cluster);
>> +	else {
>> +		/*
>> +		 * R5 cores require to be powered off sequentially, core0 should
>> +		 * be in higher power state than core1 in a cluster. So, wait
>> +		 * for core1 to powered off before proceeding to core0 and put
>> +		 * timeout of 2sec. This waiting mechanism is necessary to
>> +		 * prevent stopping core0 before core1 from sysfs.
>> +		 */
>> +		core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>> +		core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>> +
>> +		if (core == core0 && core1->released_from_reset == true) {
>> +			ret = wait_event_interruptible_timeout(cluster->core_transition,
>> +							       !core1->released_from_reset,
>> +							       msecs_to_jiffies(2000));
>> +
>> +			if (ret <= 0) {
>> +				dev_err(dev, "can not power off core0 before core1");
>> +				return -EPERM;
>> +			}
>> +		}
>> +
>> +		ret = k3_r5_split_reset(core);
>> +
>> +		/* Notify all threads in the wait queue when core state has
>> +		 * changed so that threads waiting for this condition can be
>> +		 * executed.
>> +		 */
>> +		core->released_from_reset = false;
>> +		wake_up_interruptible(&cluster->core_transition);
>> +	}
>> +
>>   	if (ret)
>>   		dev_err(dev, "unable to disable cores, ret = %d\n", ret);
>>   
>> @@ -551,16 +611,34 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>   	struct k3_r5_rproc *kproc = rproc->priv;
>>   	struct k3_r5_cluster *cluster = kproc->cluster;
>>   	struct device *dev = kproc->dev;
>> -	struct k3_r5_core *core0, *core;
>> +	struct k3_r5_core *core0, *core1, *core = kproc->core;
>>   	u32 boot_addr;
>>   	int ret;
>>   
>> +	/*
>> +	 * R5 cores require to be powered on sequentially, core0 should be in
>> +	 * higher power state than core1 in a cluster. So, wait for core0 to
>> +	 * power up before proceeding to core1 and put timeout of 2sec. This
>> +	 * waiting mechanism is necessary because rproc_auto_boot_callback() for
>> +	 * core1 can be called before core0 due to thread execution order.
>> +	 */
>> +	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>> +	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>> +	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1 && core0->unhalted == false) {
>> +		ret = wait_event_interruptible_timeout(cluster->core_transition,
>> +						       core0->unhalted,
>> +						       msecs_to_jiffies(2000));
>> +		if (ret <= 0) {
>> +			dev_err(dev, "can not power up core1 before core0");
>> +			return -EPERM;
>> +		}
>> +	}
>> +
>>   	boot_addr = rproc->bootaddr;
>>   	/* TODO: add boot_addr sanity checking */
>>   	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
>>   
>>   	/* boot vector need not be programmed for Core1 in LockStep mode */
>> -	core = kproc->core;
>>   	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
>>   	if (ret)
>>   		return ret;
>> @@ -573,20 +651,15 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>>   				goto unroll_core_run;
>>   		}
>>   	} else {
>> -		/* do not allow core 1 to start before core 0 */
>> -		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
>> -					 elem);
>> -		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
>> -			dev_err(dev, "%s: can not start core 1 before core 0\n",
>> -				__func__);
>> -			return -EPERM;
>> -		}
>> -
>>   		ret = k3_r5_core_run(core);
>>   		if (ret)
>>   			return ret;
>>   
>> -		core->released_from_reset = true;
>> +		/* Notify all threads in the wait queue when core state has
>> +		 * changed so that threads waiting for this condition can be
>> +		 * executed.
>> +		 */
>> +		core->unhalted = true;
>>   		wake_up_interruptible(&cluster->core_transition);
>>   	}
>>   
>> @@ -629,7 +702,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   	struct k3_r5_rproc *kproc = rproc->priv;
>>   	struct k3_r5_cluster *cluster = kproc->cluster;
>>   	struct device *dev = kproc->dev;
>> -	struct k3_r5_core *core1, *core = kproc->core;
>> +	struct k3_r5_core *core0, *core1, *core = kproc->core;
>>   	int ret;
>>   
>>   	/* halt all applicable cores */
>> @@ -642,19 +715,38 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   			}
>>   		}
>>   	} else {
>> -		/* do not allow core 0 to stop before core 1 */
>> -		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
>> -					elem);
>> -		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
>> -			dev_err(dev, "%s: can not stop core 0 before core 1\n",
>> -				__func__);
>> -			ret = -EPERM;
>> -			goto out;
>> +		/*
>> +		 * R5 cores require to be powered off sequentially, core0 should
>> +		 * be in higher power state than core1 in a cluster. So, wait
>> +		 * for core1 to powered off before proceeding to core0 and put
>> +		 * timeout of 2sec. This waiting mechanism is necessary to
>> +		 * prevent stopping core0 before core1 from sysfs.
>> +		 */
>> +		core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>> +		core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
>> +
>> +		if (core == core0 && core1->unhalted == true) {
>> +			ret = wait_event_interruptible_timeout(cluster->core_transition,
>> +							       !core1->unhalted,
>> +							       msecs_to_jiffies(2000));
>> +
>> +			if (ret <= 0) {
>> +				dev_err(dev, "can not power off core0 before core1");
>> +				ret = -EPERM;
>> +				goto out;
>> +			}
>>   		}
>>   
>>   		ret = k3_r5_core_halt(core);
>>   		if (ret)
>>   			goto out;
>> +
>> +		/* Notify all threads in the wait queue when core state has
>> +		 * changed so that threads waiting for this condition can be
>> +		 * executed.
>> +		 */
>> +		core->unhalted = false;
>> +		wake_up_interruptible(&cluster->core_transition);
>>   	}
>>   
>>   	return 0;
>> @@ -1145,12 +1237,6 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
>>   		return reset_ctrl_status;
>>   	}
>>   
>> -	/*
>> -	 * Skip the waiting mechanism for sequential power-on of cores if the
>> -	 * core has already been booted by another entity.
>> -	 */
>> -	core->released_from_reset = c_state;
>> -
>>   	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
>>   				     &stat);
>>   	if (ret < 0) {
>> @@ -1296,25 +1382,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>   		    cluster->mode == CLUSTER_MODE_SINGLECORE)
>>   			break;
>>   
>> -		/*
>> -		 * R5 cores require to be powered on sequentially, core0
>> -		 * should be in higher power state than core1 in a cluster
>> -		 * So, wait for current core to power up before proceeding
>> -		 * to next core and put timeout of 2sec for each core.
>> -		 *
>> -		 * This waiting mechanism is necessary because
>> -		 * rproc_auto_boot_callback() for core1 can be called before
>> -		 * core0 due to thread execution order.
>> -		 */
>> -		ret = wait_event_interruptible_timeout(cluster->core_transition,
>> -						       core->released_from_reset,
>> -						       msecs_to_jiffies(2000));
>> -		if (ret <= 0) {
>> -			dev_err(dev,
>> -				"Timed out waiting for %s core to power up!\n",
>> -				rproc->name);
>> -			goto err_powerup;
>> -		}
>>   	}
>>   
>>   	return 0;
>> @@ -1329,7 +1396,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> -err_powerup:
>>   	rproc_del(rproc);
>>   err_add:
>>   	k3_r5_reserved_mem_exit(kproc);
>> -- 
>> 2.34.1
>>
