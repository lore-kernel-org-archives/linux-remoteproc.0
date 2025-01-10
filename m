Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83D20DD74;
	Fri, 10 Jan 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736521012; cv=none; b=Z9dIrM9EPsxcQfPkrCpUSH0egOQCIgDJjUERqwrDT8t3OB+aGQzjyQ1n8cscdT/Y5nNLZcofelUBAS4KvTYdgGD2VrsX0G7wHuuRGYR9liVZUvV8OUj+GG02l74JMxGQlqBjYcIQFcDbp5rhaQJI8BdT0gx1jR1E9EEP6tbKSnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736521012; c=relaxed/simple;
	bh=1KxKNxYPod3OqQfY0HDLCjAZMYY+4yJL4vXm3fNHB8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fY/AAQbVT05Grzcwx6Bw91G9bIJxf9fvdOeGyY5goBPef4IJbn0fiDUg/disWb6sB5S9NSL9nAyt4GE2pWqCDLNiJ7NuuIgcUnFAC8PPKrdxbhBjKWwHZWWCWjCYJDrqH/scf3AirTW12MDob29kHEdV5uFEvCOQanV8LGicyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xvATWtWJ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xvATWtWJ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AEuTe23430574
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 08:56:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736520989;
	bh=XpOdzJcuSjj3j8jW9DaNivXFRr/DSbY2F77nruMvqc4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xvATWtWJjqNtzaIg49bOnJgxNHpEXUwhd1tRXwPZOoOaGpdrcaWtYetdcJuFOKeM7
	 Q3W/6wRdZciO3P0ZUPkYJXJNrjrl8Y4t1mtWP5rM4hnOwP4Ftdhe6HAnMTCkpQNPoe
	 NH5coO5Rm5XhamG0xGmuOjorvcIeVF4ONwJThOLk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AEuTaV073597
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 08:56:29 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 08:56:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 08:56:29 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AEuP7L109622;
	Fri, 10 Jan 2025 08:56:26 -0600
Message-ID: <932ab43c-8766-422c-b73e-0929fd18253e@ti.com>
Date: Fri, 10 Jan 2025 20:26:25 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/20] Refactor TI K3 DSP and M4 Drivers
To: Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <p.zabel@pengutronix.de>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250103101231.1508151-1-b-padhi@ti.com>
 <da80e039-bcea-41a3-83ec-e10ffb4b0c46@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <da80e039-bcea-41a3-83ec-e10ffb4b0c46@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 08/01/25 20:33, Andrew Davis wrote:
> On 1/3/25 4:12 AM, Beleswar Padhi wrote:
>> This series refactors a lot of functions & callbacks from 
>> ti_k3_dsp_remoteproc.c
>> and ti_k3_m4_remoteproc.c drivers. This is the third and final series 
>> as part of
>> the refactoring of K3 remoteproc drivers. The patches for internal 
>> refactoring
>> and bug fixes of TI K3 R5 remoteproc driver has been already 
>> posted[0][1]. Since
>> the R5 driver has worked out separate data structures and reset logic 
>> than the
>> DSP/M4 drivers, I have excluded R5 from this refactoring.
>>
>
> Diffstat looks great, 765 (+), 1164 (-), good to see all that 
> duplicated code
> factored away. But R5 is the largest of the 3 drivers and really needs 
> it the
> most.
>
> Looking at the data structure in R5 preventing this I see what should be
> the normal "struct k3_rproc" structure is really split into two,
> "struct k3_r5_rproc"  and "struct k3_r5_core". The first containing a 
> single
> instance of the latter. There is no reason for this split I can see, just
> combine the two structs.
>
> Next, there are some members of the struct that we don't need, such as
> atcm_enable and the others that are only used in probe (or functions
> called as part of probe). We only use these as a way to collect this
> info in one function, and use in a later one. Instead you could either
> fetch this info at the time of use. Or move these members into the
> cluster level "struct k3_r5_cluster".
>
> Speaking of "struct k3_r5_cluster", it is silly for cluster to keep a 
> list
> of cores. There are two, and will only ever be two. No clue why a list 
> was
> chosen as the data structure to hold two pointers, switch this two an 
> array
> of size two, or even just two pointers. This also cleans up a bunch of 
> the
> weird "list_for_each" logic and loops that have to then check if they 
> have
> found with core0 or core1. Instead, just directly access core0 or core1.
>
> That gets rid of member "struct list_head" from the combined struct,
> and would you look at that, the struct now matches DSP/M4 :)
>
> I'd suggest doing the above fixups to R5 first, then you can do
> this series here after that and include R5.


Thanks a lot for suggesting this detailed plan! I agree with your 
assessment, and I will post a series addressing this.

Thanks,
Beleswar

>
> Thanks,
> Andrew
>
>> NOTE:
>> This series is _dependent_ upon the [PATCH 2/3] of below series:
>> https://lore.kernel.org/all/20241224091457.1050233-3-b-padhi@ti.com/
>>
>> Testing Done:
>> 1. Tested boot of C66x DSPs, C71x DSPs across Jacinto J7* devices in 
>> Remoteproc
>> mode and IPC-Only mode.
>> 2. Tested boot of M4F core _only_ in _AM62xx SK_ board in Remoteproc 
>> mode and
>> IPC-Only mode.
>> 3. Tested Core stop and detach operations from sysfs for C66x DSPs, 
>> C71x DSPs
>> and M4F.
>> 4. Tested device removal paths by executing 'modprobe -r 
>> ti_k3_dsp_remoteproc'
>> and 'modprobe -r ti_k3_m4_remoteproc'.
>> 5. Tested usecases where firmware not available at device probe time, 
>> but later
>> in sysfs, able to load firmware into a remotecore and start it. 
>> [C66x, C71x, M4]
>> 6. Tested that each patch in this series generates no new 
>> warnings/errors.
>>
>> v8: Changelog:
>> 1. Broken down refactoring into patches, each patch dealing with one 
>> function
>> for ease in review. [Andrew]
>>
>> Links to older versions:
>> v7: https://lore.kernel.org/all/20240202175538.1705-1-hnagalla@ti.com/
>> v6: https://lore.kernel.org/all/20230913111644.29889-1-hnagalla@ti.com/
>> v5: https://lore.kernel.org/all/20230808044529.25925-1-hnagalla@ti.com/
>> v4: https://lore.kernel.org/all/20230801141117.2559-1-hnagalla@ti.com/
>> v3: 
>> https://lore.kernel.org/all/20230302171450.1598576-1-martyn.welch@collabora.com/
>> v2: 
>> https://lore.kernel.org/all/20230301111323.1532479-4-martyn.welch@collabora.com/
>> v1: https://lore.kernel.org/all/20220110040650.18186-1-hnagalla@ti.com/
>>
>> Thanks,
>> Beleswar
>>
>> [0]: 
>> https://lore.kernel.org/all/20241219110545.1898883-1-b-padhi@ti.com/
>> [1]: 
>> https://lore.kernel.org/all/20241224091457.1050233-1-b-padhi@ti.com/
>>
>> Beleswar Padhi (20):
>>    remoteproc: k3-m4: Prevent Mailbox level IPC with detached core
>>    remoteproc: k3: Refactor shared data structures
>>    remoteproc: k3: Refactor mailbox rx_callback functions into common
>>      driver
>>    remoteproc: k3: Refactor .kick rproc ops into common driver
>>    remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
>>    remoteproc: k3: Refactor rproc_reset() implementation into common
>>      driver
>>    remoteproc: k3: Refactor rproc_release() implementation into common
>>      driver
>>    remoteproc: k3: Refactor rproc_request_mbox() implementations into
>>      common driver
>>    remoteproc: k3: Refactor .prepare rproc ops into common driver
>>    remoteproc: k3: Refactor .unprepare rproc ops into common driver
>>    remoteproc: k3: Refactor .start rproc ops into common driver
>>    remoteproc: k3: Refactor .stop rproc ops into common driver
>>    remoteproc: k3: Refactor .attach rproc ops into common driver
>>    remoteproc: k3: Refactor .detach rproc ops into common driver
>>    remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
>>    remoteproc: k3: Refactor .da_to_va rproc ops into common driver
>>    remoteproc: k3: Refactor of_get_memories() functions into common
>>      driver
>>    remoteproc: k3: Refactor mem_release() functions into common driver
>>    remoteproc: k3: Refactor reserved_mem_init() functions into common
>>      driver
>>    remoteproc: k3: Refactor release_tsp() functions into common driver
>>
>>   drivers/remoteproc/Makefile               |   4 +-
>>   drivers/remoteproc/ti_k3_common.c         | 586 ++++++++++++++++++++
>>   drivers/remoteproc/ti_k3_common.h         | 113 ++++
>>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 643 +---------------------
>>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 583 ++------------------
>>   5 files changed, 765 insertions(+), 1164 deletions(-)
>>   create mode 100644 drivers/remoteproc/ti_k3_common.c
>>   create mode 100644 drivers/remoteproc/ti_k3_common.h
>>
