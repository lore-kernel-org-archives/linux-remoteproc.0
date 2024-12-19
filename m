Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B8138FB9;
	Thu, 19 Dec 2024 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734619996; cv=none; b=l7Ud00KPUpHw0enpIJKmDVZ+ErR2WDNsfbAqJ6biunUIfSWcRQJpvig4Q3HTVpwu5hm5g5SyVUFronoblTVlCi738aIMV6C5+mcXqeZu5mPFlmMPKFuEvCDI2qJL4U0gc1CTu+G1vH0do+ebEtJ39s/ijBGByq4sj3Yh1osDeaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734619996; c=relaxed/simple;
	bh=AcmV+imk2u/vhPrghDXRAIP+gg+DFDhKQZ2CK3xDwhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NhD7ghX/Nndfs6x6apzZYHAUqO9q3YF3vqOOGtd266A25e6UemAw99e2BwN3IPgwhv2+kPFZWnMSWolgco31p9Vyg250q/rrBX8CHmFy2w1SjqIvOf9oRdgMgaNWTzbT5kln31IQsT6/kqwkaZQ6jyikp2O7PHxzHCAzJm+Z4Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lQgNYxo+; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lQgNYxo+"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJEqq7L019129
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 08:52:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734619972;
	bh=8kqogJnrxlRobbTnaBQkTYKXQEGL4/+NXCMzlrz4bU0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lQgNYxo+Luw7VOYHf3pMZPX41GbU5PBQCQ1CZbgKn79hBonTo8+jorI2Pije6KqmE
	 bauiWsbSqhiopXWh0w8yWPtQKrkM5t5TqsmigCXe2FJNDEz8jpzUFNtZO0qcL+4VXX
	 IOgqz0oYyz8q+nXAKm4YUWNeLGyCggp8SI0iAHpI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJEqqt0027215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 08:52:52 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 08:52:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 08:52:50 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJEqoBD125033;
	Thu, 19 Dec 2024 08:52:50 -0600
Message-ID: <71a32b3b-290d-4d16-9cac-d65f36846178@ti.com>
Date: Thu, 19 Dec 2024 08:52:50 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Use Device Lifecycle managed functions in TI R5
 Remoteproc driver
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241219110545.1898883-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241219110545.1898883-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/19/24 5:05 AM, Beleswar Padhi wrote:
> This series uses various devm_ helpers to simplify device removal path in
> ti_k3_r5_remoteproc driver. This is the first series in the TI K3
> Remoteproc refactoring as long planned since [0].
> 
> Testing Done:
> 1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
> IPC-Only mode and Kernel remoteproc mode in all Jacinto K3 devices.
> 2. Tested Lockstep, Split and Single-CPU Mode configuration (wherever
> applicable) of R5F remoteprocs in all Jacinto K3 devices.
> 3. Tested shutdown of R5F remoteprocs from Linux userspace and also by
> executing `modprobe -r ti_k3_r5_remoteproc`.

Did you also test that you could then start the cores back up?

I think that might need some firmware fixes we are working on, so
might not work even before these patches, but just wanted to check
if we have tried it yet.

> 4. Tested that each patch in this series generates no new warnings/errors.

Was that with `make W=1 C=1`? Sparse checks will be done during -next
testing so good to check for those too.

Otherwise patches all look good to me, for the series:

Reviewed-by: Andrew Davis <afd@ti.com>

> 
> v2: Changelog:
> 1. Re-ordered patches in the series to use devm functions starting from
> the last called function in remove(), to ease review. [Andrew]
> 2. Fixed a missing return after dev_err_probe() call in [PATCH v2 3/5]
> ("remoteproc: k3-r5: Use devm_ioremap_wc() helper"). [Andrew]
> 3. Removed redundant rproc_del() call in [PATCH v2 4/5] ("remoteproc:
> k3-r5: Use devm_rproc_add() helper").
> 
> Link to v1:
> https://lore.kernel.org/all/20241204111130.2218497-1-b-padhi@ti.com/
> 
> [0]: https://lore.kernel.org/all/Zr4w8Vj0mVo5sBsJ@p14s/
> 
> Beleswar Padhi (5):
>    remoteproc: k3-r5: Add devm action to release reserved memory
>    remoteproc: k3-r5: Use devm_kcalloc() helper
>    remoteproc: k3-r5: Use devm_ioremap_wc() helper
>    remoteproc: k3-r5: Use devm_rproc_add() helper
>    remoteproc: k3-r5: Add devm action to release tsp
> 
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 88 ++++++++++--------------
>   1 file changed, 35 insertions(+), 53 deletions(-)
> 
