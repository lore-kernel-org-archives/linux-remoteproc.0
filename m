Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BB9B640;
	Sat, 11 Oct 2025 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760142871; cv=none; b=ARYqIC5ukTp+CI7XJgoG0x8rAjpJ8cVtoB29m30raRNjj5kIJ/2iDBv4tjU1ABgkEGPoty01/eZ2MXKaepnT/BzdU3Z29XDAPrmZ+K3T3yzUMfSjzXwmKJPh6wLgArJUykRKztE+GsWHhrwD6zkYyiN7EDrLCPJ6mFqsWT9qVME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760142871; c=relaxed/simple;
	bh=IxlU8/Y1MczDW264TcdbL2aQybxS1KFKgGDhR6BuU+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VBVCEUV+/xCQzIrB4yzkJpmVPVoaZ3GBsAxIF5I05ovg35cEsuvnDqOreYlJY/wz5H+JJn3gGNLAtuDoczx2ElPnXHw/uJfdC58HpFIvg/F0iVSFOD4lVzhCJ2+K9AmIA7mcPIhnNbDc2dLOJWZSW7iAYHClb1RyW68XibRlHzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wR20Rtuc; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wR20Rtuc"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0YEVF353860;
	Fri, 10 Oct 2025 19:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760142854;
	bh=5tb0FkjK5oEDROBMYZswPGbop5JJW+q0ySTeHcMG0ig=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wR20Rtuc81AJEmDFXfeQ5LQwC919WRlBMrpLJ8gpQp/ir94OTK3njFl65NdnY6UK5
	 gHmSg+evbjaef78EBCtqUxCbYROYI6XhDvW0e5LHWtnwUbiS6028AxIqSz51hus/s1
	 UWmG8E1glShbppLTS/ILeFjo57nYkKUX4WgKxX8U=
Received: from DLEE205.ent.ti.com (dlee205.ent.ti.com [157.170.170.85])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0YEsI1165764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 19:34:14 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 19:34:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:34:14 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0YDrX2676927;
	Fri, 10 Oct 2025 19:34:13 -0500
Message-ID: <3b7ab4c5-7dfc-41f9-bf6d-6deabfe97338@ti.com>
Date: Fri, 10 Oct 2025 19:34:13 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to simplify
 lock handling
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/10/25 7:24 AM, Peng Fan wrote:
> Replace manual mutex_lock/unlock and error-handling patterns with cleanup.h
> macros (ACQUIRE, ACQUIRE_ERR, and scoped_guard) to streamline lock
> management. As a result, several goto labels and redundant error paths are
> eliminated.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/remoteproc/remoteproc_core.c | 113 ++++++++++++++---------------------
>   1 file changed, 45 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8004a480348378abef78ad5641a8c8b5766c20a6..dd859378f6ff6dec2728980cc82d31687aa7a3dc 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -17,6 +17,7 @@
>   #define pr_fmt(fmt)    "%s: " fmt, __func__
>   
>   #include <asm/byteorder.h>
> +#include <linux/cleanup.h>
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/dma-mapping.h>
> @@ -1830,13 +1831,14 @@ int rproc_trigger_recovery(struct rproc *rproc)
>   	struct device *dev = &rproc->dev;
>   	int ret;
>   
> -	ret = mutex_lock_interruptible(&rproc->lock);
> +	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> +	ret = ACQUIRE_ERR(mutex_intr, &lock);
>   	if (ret)
>   		return ret;
>   
>   	/* State could have changed before we got the mutex */
>   	if (rproc->state != RPROC_CRASHED)
> -		goto unlock_mutex;
> +		return ret;
>   
>   	dev_err(dev, "recovering %s\n", rproc->name);
>   
> @@ -1845,8 +1847,6 @@ int rproc_trigger_recovery(struct rproc *rproc)
>   	else
>   		ret = rproc_boot_recovery(rproc);
>   
> -unlock_mutex:
> -	mutex_unlock(&rproc->lock);
>   	return ret;
>   }
>   
> @@ -1864,25 +1864,19 @@ static void rproc_crash_handler_work(struct work_struct *work)
>   
>   	dev_dbg(dev, "enter %s\n", __func__);
>   
> -	mutex_lock(&rproc->lock);
> -
> -	if (rproc->state == RPROC_CRASHED) {
> +	scoped_guard(mutex, &rproc->lock) {

Not sure this one is worth switching to scoped_guard as is doesn't save
us needing the goto out label. Plus it adds indent to a bunch of lines.

>   		/* handle only the first crash detected */
> -		mutex_unlock(&rproc->lock);
> -		return;
> -	}
> +		if (rproc->state == RPROC_CRASHED)
> +			return;
>   
> -	if (rproc->state == RPROC_OFFLINE) {
>   		/* Don't recover if the remote processor was stopped */
> -		mutex_unlock(&rproc->lock);
> -		goto out;
> -	}
> -
> -	rproc->state = RPROC_CRASHED;
> -	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
> -		rproc->name);
> +		if (rproc->state == RPROC_OFFLINE)
> +			goto out;
>   
> -	mutex_unlock(&rproc->lock);
> +		rproc->state = RPROC_CRASHED;
> +		dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
> +			rproc->name);
> +	}
>   
>   	if (!rproc->recovery_disabled)
>   		rproc_trigger_recovery(rproc);
> @@ -1915,23 +1909,21 @@ int rproc_boot(struct rproc *rproc)
>   
>   	dev = &rproc->dev;
>   
> -	ret = mutex_lock_interruptible(&rproc->lock);
> +	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> +	ret = ACQUIRE_ERR(mutex_intr, &lock);
>   	if (ret) {
>   		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>   		return ret;
>   	}
>   
>   	if (rproc->state == RPROC_DELETED) {
> -		ret = -ENODEV;
>   		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
> -		goto unlock_mutex;
> +		return -ENODEV;
>   	}
>   
>   	/* skip the boot or attach process if rproc is already powered up */
> -	if (atomic_inc_return(&rproc->power) > 1) {
> -		ret = 0;
> -		goto unlock_mutex;
> -	}
> +	if (atomic_inc_return(&rproc->power) > 1)
> +		return 0;
>   
>   	if (rproc->state == RPROC_DETACHED) {
>   		dev_info(dev, "attaching to %s\n", rproc->name);
> @@ -1955,8 +1947,7 @@ int rproc_boot(struct rproc *rproc)
>   downref_rproc:
>   	if (ret)
>   		atomic_dec(&rproc->power);
> -unlock_mutex:
> -	mutex_unlock(&rproc->lock);
> +
>   	return ret;
>   }
>   EXPORT_SYMBOL(rproc_boot);
> @@ -1987,26 +1978,24 @@ int rproc_shutdown(struct rproc *rproc)
>   	struct device *dev = &rproc->dev;
>   	int ret;
>   
> -	ret = mutex_lock_interruptible(&rproc->lock);
> +	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> +	ret = ACQUIRE_ERR(mutex_intr, &lock);
>   	if (ret) {
>   		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>   		return ret;
>   	}
>   
> -	if (rproc->state != RPROC_RUNNING &&
> -	    rproc->state != RPROC_ATTACHED) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)

I liked this better as two lines

if (rproc->state != RPROC_RUNNING &&
     rproc->state != RPROC_ATTACHED) {

> +		return -EINVAL;
>   
>   	/* if the remote proc is still needed, bail out */
>   	if (!atomic_dec_and_test(&rproc->power))
> -		goto out;
> +		return ret;
>   
>   	ret = rproc_stop(rproc, false);
>   	if (ret) {
>   		atomic_inc(&rproc->power);
> -		goto out;
> +		return ret;
>   	}
>   
>   	/* clean up all acquired resources */
> @@ -2021,8 +2010,7 @@ int rproc_shutdown(struct rproc *rproc)
>   	kfree(rproc->cached_table);
>   	rproc->cached_table = NULL;
>   	rproc->table_ptr = NULL;
> -out:
> -	mutex_unlock(&rproc->lock);
> +
>   	return ret;
>   }
>   EXPORT_SYMBOL(rproc_shutdown);
> @@ -2052,27 +2040,25 @@ int rproc_detach(struct rproc *rproc)
>   	struct device *dev = &rproc->dev;
>   	int ret;
>   
> -	ret = mutex_lock_interruptible(&rproc->lock);
> +	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> +	ret = ACQUIRE_ERR(mutex_intr, &lock);
>   	if (ret) {
>   		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>   		return ret;
>   	}
>   
>   	if (rproc->state != RPROC_ATTACHED) {
> -		ret = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>   	}

The above becomes one line, so you can drop the { }

Andrew

>   
>   	/* if the remote proc is still needed, bail out */
> -	if (!atomic_dec_and_test(&rproc->power)) {
> -		ret = 0;
> -		goto out;
> -	}
> +	if (!atomic_dec_and_test(&rproc->power))
> +		return 0;
>   
>   	ret = __rproc_detach(rproc);
>   	if (ret) {
>   		atomic_inc(&rproc->power);
> -		goto out;
> +		return ret;
>   	}
>   
>   	/* clean up all acquired resources */
> @@ -2087,8 +2073,7 @@ int rproc_detach(struct rproc *rproc)
>   	kfree(rproc->cached_table);
>   	rproc->cached_table = NULL;
>   	rproc->table_ptr = NULL;
> -out:
> -	mutex_unlock(&rproc->lock);
> +
>   	return ret;
>   }
>   EXPORT_SYMBOL(rproc_detach);
> @@ -2192,7 +2177,8 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
>   
>   	dev = rproc->dev.parent;
>   
> -	ret = mutex_lock_interruptible(&rproc->lock);
> +	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> +	ret = ACQUIRE_ERR(mutex_intr, &lock);
>   	if (ret) {
>   		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>   		return -EINVAL;
> @@ -2200,28 +2186,22 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
>   
>   	if (rproc->state != RPROC_OFFLINE) {
>   		dev_err(dev, "can't change firmware while running\n");
> -		ret = -EBUSY;
> -		goto out;
> +		return -EBUSY;
>   	}
>   
>   	len = strcspn(fw_name, "\n");
>   	if (!len) {
>   		dev_err(dev, "can't provide empty string for firmware name\n");
> -		ret = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>   	}
>   
>   	p = kstrndup(fw_name, len, GFP_KERNEL);
> -	if (!p) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +	if (!p)
> +		return -ENOMEM;
>   
>   	kfree_const(rproc->firmware);
>   	rproc->firmware = p;
>   
> -out:
> -	mutex_unlock(&rproc->lock);
>   	return ret;
>   }
>   EXPORT_SYMBOL(rproc_set_firmware);
> @@ -2316,9 +2296,8 @@ int rproc_add(struct rproc *rproc)
>   	}
>   
>   	/* expose to rproc_get_by_phandle users */
> -	mutex_lock(&rproc_list_mutex);
> -	list_add_rcu(&rproc->node, &rproc_list);
> -	mutex_unlock(&rproc_list_mutex);
> +	scoped_guard(mutex, &rproc_list_mutex)
> +		list_add_rcu(&rproc->node, &rproc_list);
>   
>   	return 0;
>   
> @@ -2582,16 +2561,14 @@ int rproc_del(struct rproc *rproc)
>   	/* TODO: make sure this works with rproc->power > 1 */
>   	rproc_shutdown(rproc);
>   
> -	mutex_lock(&rproc->lock);
> -	rproc->state = RPROC_DELETED;
> -	mutex_unlock(&rproc->lock);
> +	scoped_guard(mutex, &rproc->lock)
> +		rproc->state = RPROC_DELETED;
>   
>   	rproc_delete_debug_dir(rproc);
>   
>   	/* the rproc is downref'ed as soon as it's removed from the klist */
> -	mutex_lock(&rproc_list_mutex);
> -	list_del_rcu(&rproc->node);
> -	mutex_unlock(&rproc_list_mutex);
> +	scoped_guard(mutex, &rproc_list_mutex)
> +		list_del_rcu(&rproc->node);
>   
>   	/* Ensure that no readers of rproc_list are still active */
>   	synchronize_rcu();
> 

