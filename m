Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456D1D0E28;
	Fri,  3 Jan 2025 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735901443; cv=none; b=PvtHcI8NjVRYKY7Dm8xYvvjpl64wzzTGOgHEStTo+jymHMkE+EWVuEK6C1boP1y6bBcRflge+lkdEIOSQxEZTrsfzfOFSmixmeECV3eFzUrHGAjyEAobk02LKpHBjYdlyOpPwLTrAuANkLxwmrl7Iiwaa7j7ulRVtmZISw5FiGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735901443; c=relaxed/simple;
	bh=TxfNuMIpcQ1IPYMR3wfREU1M4SdsweX2g1KrGUFwijs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V3vAxZtb9YF2RwSF9oM76mTwoFpo6axyQKa3y6aXI+YwhSV2hy9cjDtq6pvIDYsXQyN6uqYZ+FMR4b4ZYVmdTExT631I/yMTJdfq86pPlToNTqXbveJBlTQc6Ke6ZR+uYX74aSzvbxF7z/tDPasgh0vkmjizmLch6Q4CKFu0Izk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TUxSe/WW; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TUxSe/WW"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503AoUAu2080196
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 04:50:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735901430;
	bh=6RWjATr+7EO9RdoOTbieRXg/ZzOvyXOKh3JhaPtYH8M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TUxSe/WWj1DEcRZsubeQx7HRwyMqJeG7ioWH1Ky5cvONxY0JwAw4uiad+/ejmBpQS
	 xWVzVqdhXV9q67LDy40bv3gE7la0CmA/mgmCjRDwGS/YDdivORo3Zah+XMmr6CIMUS
	 ySGnX+IJdAWv0Ussp+1rk7Y0HEQgtfzzq59sFYp0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503AoUjj001601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:50:30 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:50:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:50:29 -0600
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503AoQ3X018335;
	Fri, 3 Jan 2025 04:50:26 -0600
Message-ID: <fcd76b9a-4d75-4a2d-a390-162c793f1b7c@ti.com>
Date: Fri, 3 Jan 2025 16:20:25 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/20] Refactor TI K3 DSP and M4 Drivers
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250103101231.1508151-1-b-padhi@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250103101231.1508151-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Missed few changelog. Adding below.

On 03/01/25 15:42, Beleswar Padhi wrote:
> This series refactors a lot of functions & callbacks from ti_k3_dsp_remoteproc.c
> and ti_k3_m4_remoteproc.c drivers. This is the third and final series as part of
> the refactoring of K3 remoteproc drivers. The patches for internal refactoring
> and bug fixes of TI K3 R5 remoteproc driver has been already posted[0][1]. Since
> the R5 driver has worked out separate data structures and reset logic than the
> DSP/M4 drivers, I have excluded R5 from this refactoring.
>
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


2. Introduced checks to prevent mailbox IPC with detached M4 core.
3. Refined reset/release from reset logic for DSP cores that do not have 
a local reset in PATCH #6 and PATCH #7 of this series.
4. Refactored additional .start()/.stop()/.attach()/.detach()/mbox 
.rx_callback()/request_mbox() functions in this series.

Thanks,
Beleswar

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
