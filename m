Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40142221440;
	Thu, 19 Dec 2024 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621828; cv=none; b=nJptHtCy2DTbKaQh8lova51jMeohJaf5px69ezDIZcoHCdcgvxUD51lgCTVwWGIedKKGWourILxqRDxOBlASYebd/xQN1JlNy7cUJnaVTXfD8oC5OfD+xOXrb1MMaeAB5CObWP9oee/OiIQ89ndDVJTnk6mIC86iX9+/6ELgR74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621828; c=relaxed/simple;
	bh=M3yN71ljsXYTFgobJLFdJhudiCS/EZvb3/FHqDuX+Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eEd6EN4n1kGjU1c0MnsLCoU5uRxIIIseEChCj4+Bl/zDb8EvmIF9bcHmLuHa4MFv4Djtxms/+/cPbidpjegI1oU5hwUlYCH1bdJAxMFhRFM9BkXXMAAIavgNxuOhOCQ6jmVCAmaDFMLzXkISrN9stLx9Q6jBEysOZEnpshIV9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OnivL8iy; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OnivL8iy"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJFNacP022508
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 09:23:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734621816;
	bh=iggi7avFUAv8rxT92MI6UKWzcRTu5UX3YgP+paYDKdY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OnivL8iyue8qsp2Hw0NDCvWxFjHDienVwbmFTZajaUlCMY/x0kydqTcw+KfLsmclw
	 YeyNEddWnXIIbve67/g6rjkMk9OZdS+iAD8ehLBrBD22s/A56TGx0/VOlx3Ap72PKz
	 +JTGP9kjV9oZ4sSFRwsZ04EKFbpcLvGJHJ36QaJ0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJFNafs104932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 09:23:36 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 09:23:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 09:23:36 -0600
Received: from [10.249.132.239] ([10.249.132.239])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJFNVM7031966;
	Thu, 19 Dec 2024 09:23:32 -0600
Message-ID: <58e93d91-58fc-4a80-b145-78e4ebf4ae01@ti.com>
Date: Thu, 19 Dec 2024 20:53:30 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Use Device Lifecycle managed functions in TI R5
 Remoteproc driver
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241219110545.1898883-1-b-padhi@ti.com>
 <71a32b3b-290d-4d16-9cac-d65f36846178@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <71a32b3b-290d-4d16-9cac-d65f36846178@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 12/19/2024 8:22 PM, Andrew Davis wrote:
> On 12/19/24 5:05 AM, Beleswar Padhi wrote:
>> This series uses various devm_ helpers to simplify device removal 
>> path in
>> ti_k3_r5_remoteproc driver. This is the first series in the TI K3
>> Remoteproc refactoring as long planned since [0].
>>
>> Testing Done:
>> 1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
>> IPC-Only mode and Kernel remoteproc mode in all Jacinto K3 devices.
>> 2. Tested Lockstep, Split and Single-CPU Mode configuration (wherever
>> applicable) of R5F remoteprocs in all Jacinto K3 devices.
>> 3. Tested shutdown of R5F remoteprocs from Linux userspace and also by
>> executing `modprobe -r ti_k3_r5_remoteproc`.
>
> Did you also test that you could then start the cores back up?
>
> I think that might need some firmware fixes we are working on, so
> might not work even before these patches, but just wanted to check
> if we have tried it yet.


Yes, the above graceful shutdown feature is part of firmware fixes. 
Also, some support needs to be added in the Linux driver, which sends a 
special "SHUTDOWN" mailbox message to the remotecore which signals the 
firmware to relinquish all resources and shutdown gracefully. So, 
support for turning the remoteprocs back on is not yet added, and not 
tested.

>
>> 4. Tested that each patch in this series generates no new 
>> warnings/errors.
>
> Was that with `make W=1 C=1`? Sparse checks will be done during -next
> testing so good to check for those too.


Yes, did that testing.

>
> Otherwise patches all look good to me, for the series:
>
> Reviewed-by: Andrew Davis <afd@ti.com>


Thanks!

>
>>
>> v2: Changelog:
>> 1. Re-ordered patches in the series to use devm functions starting from
>> the last called function in remove(), to ease review. [Andrew]
>> 2. Fixed a missing return after dev_err_probe() call in [PATCH v2 3/5]
>> ("remoteproc: k3-r5: Use devm_ioremap_wc() helper"). [Andrew]
>> 3. Removed redundant rproc_del() call in [PATCH v2 4/5] ("remoteproc:
>> k3-r5: Use devm_rproc_add() helper").
>>
>> Link to v1:
>> https://lore.kernel.org/all/20241204111130.2218497-1-b-padhi@ti.com/
>>
>> [0]: https://lore.kernel.org/all/Zr4w8Vj0mVo5sBsJ@p14s/
>>
>> Beleswar Padhi (5):
>>    remoteproc: k3-r5: Add devm action to release reserved memory
>>    remoteproc: k3-r5: Use devm_kcalloc() helper
>>    remoteproc: k3-r5: Use devm_ioremap_wc() helper
>>    remoteproc: k3-r5: Use devm_rproc_add() helper
>>    remoteproc: k3-r5: Add devm action to release tsp
>>
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 88 ++++++++++--------------
>>   1 file changed, 35 insertions(+), 53 deletions(-)
>>
