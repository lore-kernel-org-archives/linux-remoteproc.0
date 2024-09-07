Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C74A55;
	Sat,  7 Sep 2024 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725703911; cv=none; b=QO/avcMy5U1laoDrgjHkFhNdefJFisPvJopqVTyXt6kAHu4AQzkK0+0nnP5jVEXqQkJTJ+xAWrnx0hMSzXSWhu3HIcUZS69h98CAhTzd45v+lJV7tIYKlFuK3SHX1qaAMrhqBK1gdYBu4bYUZtQy0Jqz6E1xVHKWjsnCtsTNJSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725703911; c=relaxed/simple;
	bh=WaPMHwU3Rxuwr3bf8WZxqprZwf/RxFr9wYjdc0f4vPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kYy5BpGgwp7L5NCUCOvHQrrMsqVQwT186KeDX+AipNATz2n/LufY4CDSXh1s2SZsgzr2tC6wgJ3NpZjhKaMWT+7jS3PPzvSYzYjfKGciDjg+43QgQcDrbI3XOsVmTyzpp17iixwBRYVp177aEUno0EcQaurKkC9DPWbxj9aS+bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KNJbeW3G; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KNJbeW3G"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 487ABiEK124605;
	Sat, 7 Sep 2024 05:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725703904;
	bh=9R5rjZuv1wB/YbDyuU7BA588rMLZUdVe8ARpHHFtqyE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KNJbeW3GLfs3rZo1mhB6IrSlLslFssKcvZkWAB3T6FMG2C+cdvy7VfAZUh/4zw5nG
	 rpZEcmEDli39dzcTc1ZMtTDb2Fh9E07n+O/XocZ2D7Ub9gMcM+BQoY7NgPkH2BboyE
	 dem4WdtUQ1BIPkLHhXN58+7D7G6Ft7d8XSblU0js=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 487ABiHS032856
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 7 Sep 2024 05:11:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 7
 Sep 2024 05:11:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 7 Sep 2024 05:11:43 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 487ABdMM052772;
	Sat, 7 Sep 2024 05:11:40 -0500
Message-ID: <56b63a39-ea4d-4edf-9295-ca28c83655c8@ti.com>
Date: Sat, 7 Sep 2024 15:41:38 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: k3-r5: Decouple firmware booting from probe
 routine
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240906094045.2428977-1-b-padhi@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20240906094045.2428977-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180


On 9/6/2024 3:10 PM, Beleswar Padhi wrote:
> The current implementation of the waiting mechanism in probe() waits for
> the 'released_from_reset' flag to be set which is done in
> k3_r5_rproc_prepare() as part of rproc_fw_boot(). This causes unexpected
> failures in cases where the firmware is unavailable at boot time,
> resulting in probe failure and removal of the remoteproc handles in the
> sysfs paths.

I won't say failure, I will say this is behavior of driver.

Driver expect firmware to be available , but I agree driver should be 
able to execute

with/without firmware availability.


> To address this, the waiting mechanism is refactored out of the probe
> routine into the appropriate k3_r5_rproc_prepare/unprepare() and
> k3_r5_rproc_start/stop() functions. This allows the probe routine to
> complete without depending on firmware booting, while still maintaining
> the required power-synchronization between cores.
>
> Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Posted this as a Fix as this was breaking usecases where we wanted to load a
> firmware by writing to sysfs handles in userspace.
>
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 170 ++++++++++++++++-------
>   1 file changed, 118 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> [..]
> +	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
> +	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
> +	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1 &&
> +	    core0->released_from_reset == false) {
> +		ret = wait_event_interruptible_timeout(cluster->core_transition,
> +						       core0->released_from_reset,
> +						       msecs_to_jiffies(2000));
only one wait in start should be good enough,
> +		if (ret <= 0) {
> +			dev_err(dev, "can not power up core1 before core0");
> +			return -EPERM;
> +		}
> +	}
> +
>   	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
>   	if (ret < 0)
>   		return ret;
> @@ -470,6 +492,12 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   		return ret;
>   	}
>   
> +	/* Notify all threads in the wait queue when core state has changed so
> +	 * that threads waiting for this condition can be executed.
> +	 */
> +	core->released_from_reset = true;
> +	wake_up_interruptible(&cluster->core_transition);
> +
>   	/*
>   	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
>   	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
> @@ -515,14 +543,46 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
>   {
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
> -	struct k3_r5_core *core = kproc->core;
> +	struct k3_r5_core *core0, *core1, *core = kproc->core;


why you need wait in unprepare/stop,

In case you are failing during firmware load or so then already we are 
in bad state.

if this is call from user land then, i don't except anyone will auto 
trigger stopping of core-0

IMO, in unprepare/stop, if action is attempted on core1 with core-0 ON, 
simply return error.


> [..]
> @@ -629,7 +702,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   	struct k3_r5_rproc *kproc = rproc->priv;
>   	struct k3_r5_cluster *cluster = kproc->cluster;
>   	struct device *dev = kproc->dev;
>
