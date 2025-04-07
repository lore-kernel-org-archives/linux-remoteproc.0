Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F022DF8D;
	Mon,  7 Apr 2025 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031079; cv=none; b=InUfI3RJcwDdFL58ktbPWSqM2aqrnLBhtsL+jVr//nuVekU6a54qV4BT2hzCaXlrr6QgfzxA55d8SrK2vlfOPFp9AfxHVc5udaaWHfoNS87l7vZHDQoURbbX/gjmG45ea3BeE0l+rcg7GqaQ93HNZfYJR2Fqd8D+wop46zqpqwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031079; c=relaxed/simple;
	bh=yO0QcwSH/o7bkZ78kL/jBlLQeXd4gTVtT6Z2+xZ9XEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KskWls5UJlGG0a9cP6/iGcD0xFFTjsENcOovh8x7BqWEJxSVMxMWlC3Q1e7dWEhEul4gxyyMvtyb2tragCofaLYkuTDw0DDaqwNWAw8DfT2e2Q3idtEYbDDXeeQ1eOBnin+mfafJaivHgMs/yNQAHQI81VGrlyVeJjpbKZrI5o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HVAGxptd; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HVAGxptd"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537D4RWs926660
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744031067;
	bh=KpvxecfJA8vYdTJ6rgupPMOhaWUXnGN0z8+UAf98wgg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HVAGxptdzhhsVArQmRGJ+X2fbZs8Y6caKUtLFYhz1ZFLjzLXjZ6PeVtrQDMjtAgbp
	 J5neAgjraOmgD1tNMRM+pfZpV9377vNEZV/DduOwuyQ11QiutRbgCzLXw+Ha+tAyBF
	 Uzv+q3TPzeBUkOUGWqIwim4VmWZzVI/DOkCEwmBc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537D4RQY011878
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:04:27 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:04:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:04:26 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537D4NQN041833;
	Mon, 7 Apr 2025 08:04:23 -0500
Message-ID: <0e299cf4-da72-4ce1-b2c8-a625fe74040b@ti.com>
Date: Mon, 7 Apr 2025 18:34:22 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/26] Refactor TI K3 R5, DSP and M4 Remoteproc Drivers
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250317120622.1746415-1-b-padhi@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250317120622.1746415-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 17/03/25 17:35, Beleswar Padhi wrote:
> This series refactors a lot of functions & callbacks from
> ti_k3_dsp_remoteproc.c, ti_k3_r5_remoteproc.c and ti_k3_m4_remoteproc.c
> drivers. This is a consolidated and final series as part of the
> refactoring of K3 remoteproc drivers. Below is the breakdown:
> 1. PATCHES #1-#5 does the pre-cleanup and aligns R5, DSP, M4 data structures.
> 2. PATCHES #6-#8 fixes important bugs in R5 and DSP drivers before refactoring
> them into a common driver.
> 3. PATCHES #9-#26 does the actual refactoring from into ti_k3_common.c driver.


Requesting review on this patchset.

Thanks,
Beleswar

>
> NOTE:
> This series supersedes below series:
> https://lore.kernel.org/all/20250219091042.263819-1-b-padhi@ti.com/
> https://lore.kernel.org/all/20250103101231.1508151-1-b-padhi@ti.com/
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
> v2:
> https://lore.kernel.org/all/20230301111323.1532479-4-martyn.welch@collabora.com/
> v1: https://lore.kernel.org/all/20220110040650.18186-1-hnagalla@ti.com/
>
> Thanks,
> Beleswar
>
> Beleswar Padhi (24):
>    remoteproc: k3-r5: Re-order internal memory initialization function
>    remoteproc: k3-r5: Refactor Data Structures to Align with DSP and M4
>    remoteproc: k3-r5: Use k3_r5_rproc_mem_data structure for memory info
>    remoteproc: k3-{m4/dsp}: Align internal rproc data structure with R5
>    remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
>    remoteproc: k3-r5: Refactor sequential core power up/down operations
>    remoteproc: k3: Refactor shared data structures
>    remoteproc: k3: Refactor mailbox rx_callback functions into common
>      driver
>    remoteproc: k3: Refactor .kick rproc ops into common driver
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
> Siddharth Vadapalli (2):
>    remoteproc: k3-r5: Drop check performed in
>      k3_r5_rproc_{mbox_callback/kick}
>    remoteproc: k3-dsp: Drop check performed in
>      k3_dsp_rproc_{mbox_callback/kick}
>
>   drivers/remoteproc/Makefile               |   4 +-
>   drivers/remoteproc/ti_k3_common.c         | 552 +++++++++++++
>   drivers/remoteproc/ti_k3_common.h         | 113 +++
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 618 +--------------
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 583 +-------------
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 898 +++++++---------------
>   6 files changed, 1021 insertions(+), 1747 deletions(-)
>   create mode 100644 drivers/remoteproc/ti_k3_common.c
>   create mode 100644 drivers/remoteproc/ti_k3_common.h
>
