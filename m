Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351411A4E88;
	Tue,  3 Sep 2024 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358547; cv=none; b=H+88JKke2mo6tioV4XeLPrIBQA6Xem7EBMZoAlB0zmiMbXqLkZssv7nVJXGe0LRWyBRJuMAVng6Fnc1M86yftUTYgG6DJm3iRoT/1RGyI8sprUYN5KXz+nb8rb2FjXwoK+83nbPe6Tobald+mowjM8hYtQWlWy8J1sbZHge/wQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358547; c=relaxed/simple;
	bh=YnJsw34CPYXxPakcw5H5XwjWdoP51JinkgYjwgJSIqo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=TIiLqWLjoj7zyVrQ5bH0RgdchNfx31ClEetHZj5s+LH5BGoHunw9m5KKafwP7i+Yf2YeEoyVeIuzJsypK0LCT5izdoHRA9cdaZmnYmP8tPuBW/6gFlaXhzYiu6klnEuG+jaXh5E/j6mdRXgoRQJNlWpoEli/Qo/gwStE5D6vHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jueN7WZq; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jueN7WZq"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 483AFYNQ128308;
	Tue, 3 Sep 2024 05:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725358534;
	bh=+cOqQ68ocmQKPHgHc8JkaDbSzQUEWOAxWN6anZ9lMbQ=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=jueN7WZqY6JvvtovIbrqXTEpxkoGnRX0zbPJXNIskTuZXbcqaSVp/rX8rMhauczFN
	 v8E1MVkEMXe4r6lkuO9A98wBedNa9A8DWF6l8IdulVuJu/i/vIz1gpnTSYn821INhl
	 kfvqWuBTQXpJTMdq49gwlXVTBY/FNl2sEei8m6eo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 483AFY0X025789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Sep 2024 05:15:34 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 05:15:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 05:15:34 -0500
Received: from [10.249.130.61] ([10.249.130.61])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483AFUne091499;
	Tue, 3 Sep 2024 05:15:31 -0500
Message-ID: <522affaa-47ad-4834-be3c-acdd04902821@ti.com>
Date: Tue, 3 Sep 2024 15:45:29 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: k3-r5: Delay notification of wakeup event
From: Beleswar Prasad Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240820105004.2788327-1-b-padhi@ti.com>
Content-Language: en-US
In-Reply-To: <20240820105004.2788327-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Mathieu,

On 20-08-2024 16:20, Beleswar Padhi wrote:
> From: Udit Kumar <u-kumar1@ti.com>
>
> Few times, core1 was scheduled to boot first before core0, which leads
> to error:
>
> 'k3_r5_rproc_start: can not start core 1 before core 0'.
>
> This was happening due to some scheduling between prepare and start
> callback. The probe function waits for event, which is getting
> triggered by prepare callback. To avoid above condition move event
> trigger to start instead of prepare callback.
>
> Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")


Please put this patch on hold. I have some additional changelog that 
should go in v3.

Thanks,
Beleswar

> Signed-off-by: Udit Kumar <u-kumar1@ti.com>
> [ Applied wakeup event trigger only for Split-Mode booted rprocs ]
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> * Mathieu
> 1) Rebased changes on top of -next-20240820 tag.
>
> Link to v1:
> https://lore.kernel.org/all/20240809060132.308642-1-b-padhi@ti.com/
>
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 8a63a9360c0f..e61e53381abc 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -469,8 +469,6 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>   			ret);
>   		return ret;
>   	}
> -	core->released_from_reset = true;
> -	wake_up_interruptible(&cluster->core_transition);
>   
>   	/*
>   	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
> @@ -587,6 +585,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>   		ret = k3_r5_core_run(core);
>   		if (ret)
>   			return ret;
> +
> +		core->released_from_reset = true;
> +		wake_up_interruptible(&cluster->core_transition);
>   	}
>   
>   	return 0;
