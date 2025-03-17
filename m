Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E889821D3DF;
	Mon, 17 Mar 2025 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213219; cv=none; b=GGSQeeAmEg1s1Cg4TC9ePVmPV21ZBtRRXo5ocyJ+8WTnww4s7NPVCY/87stLftTZTbukiM+TSFQ05Ty9esNsQ41SFkh2g+8oK/cvcu5upCjzdh/AB8YvdM7dOsthuBKVH+90eLse3nQn0mSHI+HS0ijm/ku2VAx1f6X2KSNgNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213219; c=relaxed/simple;
	bh=PF3ZDWVN8LuCDbIaK0PxC8hkeYCHGUuekx7FZJ4PTjw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y3vqsDlLYdNvEG6N0T/tum70Q3e2Se6sCMcB3+zgkii7/TfRG6H2C44WcUa6l/uuD5ZMhudPrTvzo1CALklGeLkrlRlJinXYdQwNB1oWOcl/EOpGRitTEBGno62KbERV5lLyqvy3fZcZLbhYlRtjOv6f5qCPN1Yp2GDJtczPsD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HewFk8I/; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HewFk8I/"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC6W9D2802691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 07:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213192;
	bh=sYqMUxY6aPO+kyTDUr8OW8US2KBxBSF0pqrgcL06vOE=;
	h=From:To:CC:Subject:Date;
	b=HewFk8I/BiRkZFwkjP5kdUdFvRQZNA2fn8utS9geqzmzctGNtYwEkU397jIYUR3Qa
	 nvZbsKPNGJJdBkZpe63jb5Dr1m67wUdDJZN1WIbIf2rli1wOIRjiyHsLeKbRts9LNL
	 vz+qqw8b/gPnNfECiw/Ry+Qp7wRBjyinl7u1PGhE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6Wb4004869;
	Mon, 17 Mar 2025 07:06:32 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:06:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:06:31 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MJv060901;
	Mon, 17 Mar 2025 07:06:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 00/26] Refactor TI K3 R5, DSP and M4 Remoteproc Drivers
Date: Mon, 17 Mar 2025 17:35:56 +0530
Message-ID: <20250317120622.1746415-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This series refactors a lot of functions & callbacks from
ti_k3_dsp_remoteproc.c, ti_k3_r5_remoteproc.c and ti_k3_m4_remoteproc.c
drivers. This is a consolidated and final series as part of the
refactoring of K3 remoteproc drivers. Below is the breakdown:
1. PATCHES #1-#5 does the pre-cleanup and aligns R5, DSP, M4 data structures.
2. PATCHES #6-#8 fixes important bugs in R5 and DSP drivers before refactoring
them into a common driver.
3. PATCHES #9-#26 does the actual refactoring from into ti_k3_common.c driver.

NOTE:
This series supersedes below series:
https://lore.kernel.org/all/20250219091042.263819-1-b-padhi@ti.com/
https://lore.kernel.org/all/20250103101231.1508151-1-b-padhi@ti.com/
https://lore.kernel.org/all/20250108063727.1416324-1-b-padhi@ti.com/

Testing Done:
1. Tested boot of R5Fs, C66x DSPs, C71x DSPs across Jacinto J7* devices in
remoteproc mode and IPC-Only mode.
2. Tested boot of M4F core _only_ in _AM62xx SK_ board in Remoteproc mode and
IPC-Only mode.
3. Tested Core stop and detach operations from sysfs for R5Fs, C66x DSPs, C71x DSPs
4. Tested device removal paths by executing 'modprobe -r ti_k3_dsp_remoteproc'
and 'modprobe -r ti_k3_r5_remoteproc'.
5. Tested usecases where firmware not available at device probe time, but
later in sysfs, able to load firmware into a remotecore and start it. [R5Fs]
6. Tested that each patch in this series generates no new warnings/errors.

v9: Changelog:
1. Added R5 cleanup & refactoring along with existing DSP, M4 refactoring into this series. [Andrew]
2. Dropped Mailbox level IPC checks across R5, DSP, M4 drivers in IPC-only mode. [Andrew] 

Link to v8:
https://lore.kernel.org/all/20250103101231.1508151-1-b-padhi@ti.com/

v8: Changelog:
1. Broken down refactoring into patches, each patch dealing with one function
for ease in review. [Andrew]

Links to older versions:
v7: https://lore.kernel.org/all/20240202175538.1705-1-hnagalla@ti.com/
v6: https://lore.kernel.org/all/20230913111644.29889-1-hnagalla@ti.com/
v5: https://lore.kernel.org/all/20230808044529.25925-1-hnagalla@ti.com/
v4: https://lore.kernel.org/all/20230801141117.2559-1-hnagalla@ti.com/
v3: https://lore.kernel.org/all/20230302171450.1598576-1-martyn.welch@collabora.com/
v2:
https://lore.kernel.org/all/20230301111323.1532479-4-martyn.welch@collabora.com/
v1: https://lore.kernel.org/all/20220110040650.18186-1-hnagalla@ti.com/

Thanks,
Beleswar

Beleswar Padhi (24):
  remoteproc: k3-r5: Re-order internal memory initialization function
  remoteproc: k3-r5: Refactor Data Structures to Align with DSP and M4
  remoteproc: k3-r5: Use k3_r5_rproc_mem_data structure for memory info
  remoteproc: k3-{m4/dsp}: Align internal rproc data structure with R5
  remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
  remoteproc: k3-r5: Refactor sequential core power up/down operations
  remoteproc: k3: Refactor shared data structures
  remoteproc: k3: Refactor mailbox rx_callback functions into common
    driver
  remoteproc: k3: Refactor .kick rproc ops into common driver
  remoteproc: k3: Refactor rproc_reset() implementation into common
    driver
  remoteproc: k3: Refactor rproc_release() implementation into common
    driver
  remoteproc: k3: Refactor rproc_request_mbox() implementations into
    common driver
  remoteproc: k3: Refactor .prepare rproc ops into common driver
  remoteproc: k3: Refactor .unprepare rproc ops into common driver
  remoteproc: k3: Refactor .start rproc ops into common driver
  remoteproc: k3: Refactor .stop rproc ops into common driver
  remoteproc: k3: Refactor .attach rproc ops into common driver
  remoteproc: k3: Refactor .detach rproc ops into common driver
  remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
  remoteproc: k3: Refactor .da_to_va rproc ops into common driver
  remoteproc: k3: Refactor of_get_memories() functions into common
    driver
  remoteproc: k3: Refactor mem_release() functions into common driver
  remoteproc: k3: Refactor reserved_mem_init() functions into common
    driver
  remoteproc: k3: Refactor release_tsp() functions into common driver

Siddharth Vadapalli (2):
  remoteproc: k3-r5: Drop check performed in
    k3_r5_rproc_{mbox_callback/kick}
  remoteproc: k3-dsp: Drop check performed in
    k3_dsp_rproc_{mbox_callback/kick}

 drivers/remoteproc/Makefile               |   4 +-
 drivers/remoteproc/ti_k3_common.c         | 552 +++++++++++++
 drivers/remoteproc/ti_k3_common.h         | 113 +++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 618 +--------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 583 +-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 898 +++++++---------------
 6 files changed, 1021 insertions(+), 1747 deletions(-)
 create mode 100644 drivers/remoteproc/ti_k3_common.c
 create mode 100644 drivers/remoteproc/ti_k3_common.h

-- 
2.34.1

