Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6BD1EE03D;
	Sat, 17 May 2025 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488229; cv=none; b=KK+x+SiG7rnG81pRL6vds/q6Eg3FIgjRs5vT+KJzU2MloQReE9aPJMzihEsVkQqW9Eq2mBpEkjSvVSGlP4s3/qqrA0yi9Yjb/O14X5JF4kv3F/WbxXjGonMZ26giwfoDJZZUKLIwS2+SKATVK7fSXW0c5HXyogDz6r2pYiO+LcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488229; c=relaxed/simple;
	bh=jGJhzODgUufFsBnvzcwQCkz3TcC71icxX7lRAHEn4WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=diDBTT30Ro4AHDyQTxhnk1vJ22Yr8ZK7mgZrpOJJK2XoxqicnDVPOhPq7PbVB50IrwRa1vVP/Zll/j0SocPIadHfCUQgN+PJw4r0VoXGFYjkt3doWXkATfMkks4WKm14TR3zJYSaTP/IS5Z9ghzPPwFwoevnC6TE83ClWQSM6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B+WZkxko; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B+WZkxko"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54HDNaRW3949688
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 08:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747488217;
	bh=Ux3oJ5++ua4t3XqHwoU1Gcfy1rH9qJMeXoTZK+evlHs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B+WZkxkoqfhqZK+UpN+Xd+1+U0i/lWHwEJ27ZArBo7Pvj8GQ+YVLLwKwkikQhrMRh
	 Eo3q/35+ZfWIZwWivkwFQgZ73fsQKjGwoGikscmOAwFe6z9jHCxSVlYE8pkG1N03Ed
	 dTw8/W86dKlSgnhzc+zI2Ahxa/fx7LR8iMJMibaw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54HDNan8126679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 May 2025 08:23:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 17
 May 2025 08:23:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 17 May 2025 08:23:36 -0500
Received: from [10.249.140.90] ([10.249.140.90])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54HDNUnI038038;
	Sat, 17 May 2025 08:23:31 -0500
Message-ID: <057cffb6-3ff6-4795-8501-7695d7ebc6fa@ti.com>
Date: Sat, 17 May 2025 18:53:29 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in detach
 routine
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jm@ti.com>, <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <martyn.welch@collabora.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
 <20250513054510.3439842-5-b-padhi@ti.com> <aCddoCUIpIV1ZxEW@p14s>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <aCddoCUIpIV1ZxEW@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 5/16/2025 9:15 PM, Mathieu Poirier wrote:
> On Tue, May 13, 2025 at 11:14:38AM +0530, Beleswar Padhi wrote:
>> The rproc_detach() function invokes __rproc_detach() before
>> rproc_unprepare_device(). The __rproc_detach() function sets the
>> rproc->state to "RPROC_DETACHED".
>>
>> However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
>> state in its .unprepare ops to identify IPC-only mode; which leads to
>> resetting the rproc in detach routine.
>>
>> Therefore, correct the IPC-only mode detection logic to look for
>> "RPROC_DETACHED" in k3_m4_rproc_unprepare() function.
>>
> This driver has been upstream for 9 whole months, it is hard for me to believe
> this but was just noticed.  Martyn from Collabora should be CC'ed on this, and I
> will also need the required R-b/T-b tags.


Cc: Martyn Welch martyn.welch@collabora.com

Requesting Andrew/Judith for review and test too.

>
> Typically bug fixes are not part of refactoring exercises.


Typically, yes. But the refactor depends on this fix. This 
k3_m4_rproc_unprepare() function is entirely refactored to common driver 
in [PATCH v12 26/36].

So, If the refactor is picked without this patch fix, the mainline M4 
driver would be fixed, but the older stable kernels would always have 
this bug. Let me know what you think.

Thanks,
Beleswar

>   I suggest to apply
> this set without this patch - you can then work on fixing this bug.
>
> Thanks,
> Mathieu
>
>> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> v12: Changelog:
>> 1. New patch. Fixup a state detection logic.
>>
>>   drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> index a16fb165fcedd..6cd50b16a8e82 100644
>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>> @@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
>>   	int ret;
>>   
>>   	/* If the core is going to be detached do not assert the module reset */
>> -	if (rproc->state == RPROC_ATTACHED)
>> +	if (rproc->state == RPROC_DETACHED)
>>   		return 0;
>>   
>>   	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>> -- 
>> 2.34.1
>>
