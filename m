Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF941FDE38;
	Wed,  8 Jan 2025 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348624; cv=none; b=Ifk6BXziB7M08risqwKvMgsIrJmLhOLiTY3gZ5BI+ZXv+eXPTvvOS8HlU+C7IO7nkhChB6f3MQRUT7qXlol//dCs8cFLkU1nXvUjh9JMM3K6U/DkRYeIdh9I0XcQfMFPlMRfV+YYN09EhVdv/AEZoPee5bNRWAB3wk201ISZgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348624; c=relaxed/simple;
	bh=OKMw5nSXJqxBQ/QK5k64Xm7PldlJCM9TF5Renfvt48E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nK+mCjB48r0b1zO8XyKACV2xheVongKUwLCnXxrmMOc9abA9qizsZXVbvuDd6KD6IexGIDYRA1HcvxRbb/CGts2vxzM3xjWxiBgfLlUPMMylRKk+s2g+/WUYBmQf80rkUx/OR10wuOgWpioOz2OZJZGl2ntm/VFoSE4ez7QarK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UTZ3Et4U; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UTZ3Et4U"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508F3HSM114236;
	Wed, 8 Jan 2025 09:03:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736348597;
	bh=0GsXQz0gfJfKhjfoWnbPv66KpvUC6/kUyjLx9fAwZuE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UTZ3Et4UNxCO+h1Xgj0kIhvQPx9IBQ7YkXVtWiGPsMlYurrOFiqkSIe7oRLfBNzHj
	 k1U8kt3xLH3eZLf6jnTtwXdUr2acKpEZS5MabsaW8WthO38gqA13QxMh0SdVYJM5Vy
	 tTrEsFEyeOYP9s/8uTvi7czKRGSdQLDKYcPznIUs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508F3Hdw116320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:03:17 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:03:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:03:17 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508F3GSu034693;
	Wed, 8 Jan 2025 09:03:16 -0600
Message-ID: <da80e039-bcea-41a3-83ec-e10ffb4b0c46@ti.com>
Date: Wed, 8 Jan 2025 09:03:16 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/20] Refactor TI K3 DSP and M4 Drivers
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <p.zabel@pengutronix.de>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250103101231.1508151-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250103101231.1508151-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/3/25 4:12 AM, Beleswar Padhi wrote:
> This series refactors a lot of functions & callbacks from ti_k3_dsp_remoteproc.c
> and ti_k3_m4_remoteproc.c drivers. This is the third and final series as part of
> the refactoring of K3 remoteproc drivers. The patches for internal refactoring
> and bug fixes of TI K3 R5 remoteproc driver has been already posted[0][1]. Since
> the R5 driver has worked out separate data structures and reset logic than the
> DSP/M4 drivers, I have excluded R5 from this refactoring.
> 

Diffstat looks great, 765 (+), 1164 (-), good to see all that duplicated code
factored away. But R5 is the largest of the 3 drivers and really needs it the
most.

Looking at the data structure in R5 preventing this I see what should be
the normal "struct k3_rproc" structure is really split into two,
"struct k3_r5_rproc"  and "struct k3_r5_core". The first containing a single
instance of the latter. There is no reason for this split I can see, just
combine the two structs.

Next, there are some members of the struct that we don't need, such as
atcm_enable and the others that are only used in probe (or functions
called as part of probe). We only use these as a way to collect this
info in one function, and use in a later one. Instead you could either
fetch this info at the time of use. Or move these members into the
cluster level "struct k3_r5_cluster".

Speaking of "struct k3_r5_cluster", it is silly for cluster to keep a list
of cores. There are two, and will only ever be two. No clue why a list was
chosen as the data structure to hold two pointers, switch this two an array
of size two, or even just two pointers. This also cleans up a bunch of the
weird "list_for_each" logic and loops that have to then check if they have
found with core0 or core1. Instead, just directly access core0 or core1.

That gets rid of member "struct list_head" from the combined struct,
and would you look at that, the struct now matches DSP/M4 :)

I'd suggest doing the above fixups to R5 first, then you can do
this series here after that and include R5.

Thanks,
Andrew

> NOTE:
> This series is _dependent_ upon the [PATCH 2/3] of below series:
> https://lore.kernel.org/all/20241224091457.1050233-3-b-padhi@ti.com/
> 
> Testing Done:
> 1. Tested boot of C66x DSPs, C71x DSPs across Jacinto J7* devices in Remoteproc
> mode and IPC-Only mode.
> 2. Tested boot of M4F core _only_ in _AM62xx SK_ board in Remoteproc mode and
> IPC-Only mode.
> 3. Tested Core stop and detach operations from sysfs for C66x DSPs, C71x DSPs
> and M4F.
> 4. Tested device removal paths by executing 'modprobe -r ti_k3_dsp_remoteproc'
> and 'modprobe -r ti_k3_m4_remoteproc'.
> 5. Tested usecases where firmware not available at device probe time, but later
> in sysfs, able to load firmware into a remotecore and start it. [C66x, C71x, M4]
> 6. Tested that each patch in this series generates no new warnings/errors.
> 
> v8: Changelog:
> 1. Broken down refactoring into patches, each patch dealing with one function
> for ease in review. [Andrew]
> 
> Links to older versions:
> v7: https://lore.kernel.org/all/20240202175538.1705-1-hnagalla@ti.com/
> v6: https://lore.kernel.org/all/20230913111644.29889-1-hnagalla@ti.com/
> v5: https://lore.kernel.org/all/20230808044529.25925-1-hnagalla@ti.com/
> v4: https://lore.kernel.org/all/20230801141117.2559-1-hnagalla@ti.com/
> v3: https://lore.kernel.org/all/20230302171450.1598576-1-martyn.welch@collabora.com/
> v2: https://lore.kernel.org/all/20230301111323.1532479-4-martyn.welch@collabora.com/
> v1: https://lore.kernel.org/all/20220110040650.18186-1-hnagalla@ti.com/
> 
> Thanks,
> Beleswar
> 
> [0]: https://lore.kernel.org/all/20241219110545.1898883-1-b-padhi@ti.com/
> [1]: https://lore.kernel.org/all/20241224091457.1050233-1-b-padhi@ti.com/
> 
> Beleswar Padhi (20):
>    remoteproc: k3-m4: Prevent Mailbox level IPC with detached core
>    remoteproc: k3: Refactor shared data structures
>    remoteproc: k3: Refactor mailbox rx_callback functions into common
>      driver
>    remoteproc: k3: Refactor .kick rproc ops into common driver
>    remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
>    remoteproc: k3: Refactor rproc_reset() implementation into common
>      driver
>    remoteproc: k3: Refactor rproc_release() implementation into common
>      driver
>    remoteproc: k3: Refactor rproc_request_mbox() implementations into
>      common driver
>    remoteproc: k3: Refactor .prepare rproc ops into common driver
>    remoteproc: k3: Refactor .unprepare rproc ops into common driver
>    remoteproc: k3: Refactor .start rproc ops into common driver
>    remoteproc: k3: Refactor .stop rproc ops into common driver
>    remoteproc: k3: Refactor .attach rproc ops into common driver
>    remoteproc: k3: Refactor .detach rproc ops into common driver
>    remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
>    remoteproc: k3: Refactor .da_to_va rproc ops into common driver
>    remoteproc: k3: Refactor of_get_memories() functions into common
>      driver
>    remoteproc: k3: Refactor mem_release() functions into common driver
>    remoteproc: k3: Refactor reserved_mem_init() functions into common
>      driver
>    remoteproc: k3: Refactor release_tsp() functions into common driver
> 
>   drivers/remoteproc/Makefile               |   4 +-
>   drivers/remoteproc/ti_k3_common.c         | 586 ++++++++++++++++++++
>   drivers/remoteproc/ti_k3_common.h         | 113 ++++
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 643 +---------------------
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 583 ++------------------
>   5 files changed, 765 insertions(+), 1164 deletions(-)
>   create mode 100644 drivers/remoteproc/ti_k3_common.c
>   create mode 100644 drivers/remoteproc/ti_k3_common.h
> 
