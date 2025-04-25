Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66B71C5F3F;
	Fri, 25 Apr 2025 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745620966; cv=none; b=f4CSkOVGR9k1/Ho9ilFZg72UDAbR+kuC3G2rUOcuTvFr2s0esbmGs4xlL2UajBV14/30ZlNnphGEjNxxrNX9utI124veA3yREPH4gyGCzWve/ZpdtMSvFkVdNlSfYN8CFJA1+N9aXG6tLoPG9rAgXkp0SW1ca9lu9kf6UINuMy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745620966; c=relaxed/simple;
	bh=OOnQR4wb63ZNyHTRft7hP2/53ub18gi6Y/FGZXy08p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mnxUYpDbAmLeU65q8Cjg0IbVw+k/iw8nWeLI64l1esZhHrnPQ6MJNffDhC8o/h7xmMFyUv467ABzl+fAAeeSDTvZU33zXlqAMB6/vG/21swqucb8UsWHg/auTYTQ8AOi2/vXPMHz6IUtegSY0cOdbii6ofH2C91I5zdMu+rO+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Fs1XfWdq; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fs1XfWdq"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PMgWfc3038320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 17:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745620953;
	bh=TgGmZoJisySHZcjpjd1SuXQeQ524XZvakr7kMCQCF+U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fs1XfWdq2oz1N9NRKp+g/5dN7A5F1tfnDrZNo5L0p+FPDApz8juN9LICys83zTCjj
	 BgEyIU9Bp68lk9JEsBZz4Q/esrvkpVw3hl97ns9DxcM2DpxipxeghXZCazeRBUwRKz
	 FOLEoRII/mmH00qRw9bsyweLV9viwFYcxlfBGklI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PMgWxO124219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 17:42:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 17:42:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 17:42:32 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PMgWha056935;
	Fri, 25 Apr 2025 17:42:32 -0500
Message-ID: <631a0a0c-abd4-4da6-b066-4cce35894929@ti.com>
Date: Fri, 25 Apr 2025 17:42:31 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/35] Refactor TI K3 R5, DSP and M4 Remoteproc
 Drivers
To: Beleswar Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250425104135.830255-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/25/25 5:41 AM, Beleswar Padhi wrote:
> This series refactors a lot of functions & callbacks from
> ti_k3_dsp_remoteproc.c, ti_k3_r5_remoteproc.c and ti_k3_m4_remoteproc.c
> drivers. This is a consolidated and final series as part of the
> refactoring of K3 remoteproc drivers. Below is the breakdown:
> 1. PATCHES #1-#3 fixes important bugs in R5 and DSP drivers before refactoring
> them into a common driver.
> 2. PATCHES #4-#10 does the pre-cleanup and aligns R5, DSP, M4 data structures.
> 3. PATCHES #11-#35 does the actual refactoring R5, DSP and M4 drivers into
> ti_k3_common.c driver.
> 

I finally got around to looking through the last 12 patches, all seem
rather straight forward code factoring. I've already reviewed the
previous ones before this, so for the whole series,

Reviewed-by: Andrew Davis <afd@ti.com>

> NOTE:
> This series supersedes below series:
> https://lore.kernel.org/all/20250219091042.263819-1-b-padhi@ti.com/
> https://lore.kernel.org/all/20250417182001.3903905-1-b-padhi@ti.com/
> https://lore.kernel.org/all/20250108063727.1416324-1-b-padhi@ti.com/
> 
> Testing Done:
> 1. Tested boot of R5Fs, C66x DSPs, C71x DSPs across Jacinto J7* devices in
> remoteproc mode and IPC-Only mode.
> 2. Tested boot of M4F core _only_ in _AM62xx SK_ board in Remoteproc mode and
> IPC-Only mode.
> 3. Tested Core stop and detach operations from sysfs for R5Fs, C66x DSPs, C71x DSPs
> 4. Tested device removal paths by executing 'modprobe -r ti_k3_dsp_remoteproc'
> and 'modprobe -r ti_k3_r5_remoteproc'.
> 5. Tested usecases where firmware not available at device probe time, but
> later in sysfs, able to load firmware into a remotecore and start it. [R5Fs]
> 6. Tested that each patch in this series generates no new warnings/errors.
> 7. Tested IPC on AM64x EVM Device. [Thanks to Judith].
> 
> v11: Changelog:
> 1. New patches: [v11 15/35] and [v11 18/35].
> Broken down rproc_reset() and rproc_release() refactoring patches into more
> atomic changes.
> 2. Carried T/B on all patches from Judith.
> 3. Carried A/B on [PATCH v11 13/35] by Andrew.
> 
> Link to v10:
> https://lore.kernel.org/all/20250417182001.3903905-1-b-padhi@ti.com/
> 
> v10: Changelog:
> 1. Re-ordered Bug Fixes to the start of the series, before starting pre-cleanup
> and finally the actual refactor. [Andrew]
> 2. Broken down commits into more atomic changes for ease of review. [Andrew].
> 3. Updated commit messages to have uniform flow throughout the series.
> 4. Carried R/B tags in applicable patches.
> 5. Further patch specific changelog is attached with patches.
> 
> Link to v9:
> https://lore.kernel.org/all/20250317120622.1746415-1-b-padhi@ti.com/
> 
> v9: Changelog:
> 1. Added R5 cleanup & refactoring along with existing DSP, M4 refactoring into this series. [Andrew]
> 2. Dropped Mailbox level IPC checks across R5, DSP, M4 drivers in IPC-only mode. [Andrew]
> 
> Link to v8:
> https://lore.kernel.org/all/20250103101231.1508151-1-b-padhi@ti.com/
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
> Beleswar Padhi (33):
>    remoteproc: k3-r5: Refactor sequential core power up/down operations
>    remoteproc: k3-r5: Re-order internal memory initialization functions
>    remoteproc: k3-r5: Re-order k3_r5_release_tsp() function
>    remoteproc: k3-r5: Refactor Data Structures to Align with DSP and M4
>    remoteproc: k3-r5: Use k3_r5_rproc_mem_data structure for memory info
>    remoteproc: k3-{m4/dsp}: Add a void ptr member in rproc internal
>      struct
>    remoteproc: k3-m4: Add pointer to rproc struct within k3_m4_rproc
>    remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
>    remoteproc: k3: Refactor shared data structures
>    remoteproc: k3: Refactor mailbox rx_callback functions into common
>      driver
>    remoteproc: k3: Refactor .kick rproc ops into common driver
>    remoteproc: k3-dsp: Correct Reset logic for devices without lresets
>    remoteproc: k3-m4: Introduce central function to put rproc into reset
>    remoteproc: k3: Refactor rproc_reset() implementation into common
>      driver
>    remoteproc: k3-dsp: Correct Reset deassert logic for devices w/o
>      lresets
>    remoteproc: k3-m4: Introduce central function to release rproc from
>      reset
>    remoteproc: k3: Refactor rproc_release() implementation into common
>      driver
>    remoteproc: k3-m4: Ping the mbox while acquiring the channel
>    remoteproc: k3: Refactor rproc_request_mbox() implementations into
>      common driver
>    remoteproc: k3-dsp: Don't override rproc ops in IPC-only mode
>    remoteproc: k3-dsp: Assert local reset during .prepare callback
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
> Siddharth Vadapalli (2):
>    remoteproc: k3-r5: Drop check performed in
>      k3_r5_rproc_{mbox_callback/kick}
>    remoteproc: k3-dsp: Drop check performed in
>      k3_dsp_rproc_{mbox_callback/kick}
> 
>   drivers/remoteproc/Makefile               |    4 +-
>   drivers/remoteproc/ti_k3_common.c         |  547 +++++++++++
>   drivers/remoteproc/ti_k3_common.h         |  113 +++
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c |  616 +------------
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  |  583 +-----------
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 1012 +++++++--------------
>   6 files changed, 1072 insertions(+), 1803 deletions(-)
>   create mode 100644 drivers/remoteproc/ti_k3_common.c
>   create mode 100644 drivers/remoteproc/ti_k3_common.h
> 
