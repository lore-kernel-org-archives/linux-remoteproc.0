Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396317B502;
	Tue, 24 Dec 2024 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735031725; cv=none; b=JSnmsqx3H9rpfvZb6lXoIo42UGagsZkoKFvzqvQN0PEcmVxDZeOtTUv/BPDPvVIPQFajRtD0t4Ekz/qu7+ujoaJ8UFm1GVCtKBvd2mJuDI7BThxPCjks8Jdsm3nrSUkbEP9rpt8mXNTvbPhXTn1HN23idz+PjzamQ5seCSA40oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735031725; c=relaxed/simple;
	bh=x3chcV99r6iKQvVuVUXuBSMs5vesqoviJxhmxaoIFV4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gvQKk4Ow1F8ZqftbTzrLcgSdrhY6RjX2BUa3WPAWWWsZyKAFQXjNGzaDB3Ow4vEBVi0UaoCnVb1dPhpT4mNqStQzjE17LWC06apdkvc+76qilEV08ZZENljtOBVlY9ED1R9jZ4z7iM29ij3BYhERIj7Z2y9M2mX1sPWwEq+xrjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vHQH0o7l; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vHQH0o7l"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BO9F27L697320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Dec 2024 03:15:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735031703;
	bh=jTZ4FMtW5w3JNK0kJIdPceUskioxvcRfg7otKnA/P4c=;
	h=From:To:CC:Subject:Date;
	b=vHQH0o7lknNItJ9L+gxgO+ZmYKEdDXZ2BhkIgIfiBlWUNZCb5S+ucMNMrpqGycdNK
	 seIkckK2HzVzuB7y97YBAaWNqxxsVG0HZz2kWp5RQIj8NIJFi10ZW0mv3Lb1+kHcFo
	 CroaTQ0VfpfUOWZDD3qxIOjkXtc5u26ba1tYCVVc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BO9F2rm034457
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Dec 2024 03:15:02 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Dec 2024 03:15:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Dec 2024 03:15:02 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BO9EwEO123859;
	Tue, 24 Dec 2024 03:14:59 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Rework TI K3 R5F remoteproc driver
Date: Tue, 24 Dec 2024 14:44:54 +0530
Message-ID: <20241224091457.1050233-1-b-padhi@ti.com>
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

This series cleans up the TI R5F remoteproc driver by addressing various bugs.
This is also the second series as part of the refactoring of K3 remoteproc
drivers[0]. The third and final series for K3 Refactoring will be posted soon
which will deal with the TI DSP and TI M4 drivers. The R5F driver takes care of
configuring dual core R5Fs in Lockstep/Split mode and therefore has worked out
separate data structures & reset logic than the DSP/M4 drivers which deal with
single core CPUs. Therefore, I wish to exclude R5F driver from the common
refactoring in the upcoming final series.

NOTE:
This series is _dependent_ upon the below series which does devm_ cleanup
https://lore.kernel.org/all/20241219110545.1898883-1-b-padhi@ti.com/

Bugs fixed in this series:
1. Fixed IPC-Only mode attach for R5F cores. PATCH #1
2. Fixed IPC-Only mode attach for DSP cores. (Included in this series, as this
was related to point 1 and fix is similar) PATCH #2
3. Fixed support to load firmware from userspace by refactoring wait mechanism
logic into prepare()/start() ops. PATCH #3

Testing Done:
1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
IPC-Only mode and Kernel remoteproc mode in all Jacinto K3 devices.
2. Tested Lockstep, Split and Single-CPU Mode configuration (wherever
applicable) of R5F remoteprocs in all Jacinto K3 devices.
3. Tested shutdown of R5F remoteprocs from Linux userspace and also by
executing `modprobe -r ti_k3_r5_remoteproc`.
4. Tested usecases where firmware not available at Kernel boot time, but later
in sysfs, able to load firmware into a remotecore and start it.
5. Tested that each patch in this series generates no new warnings/errors.
Exception: Using the "wait_event_interruptible_timeout" macro in PATCH #3 raises
a -Wshadow warning, which is expected as it is called out in the implementation
of the macro itself[1].

Thanks,
Beleswar

[0]: https://lore.kernel.org/all/20241219110545.1898883-1-b-padhi@ti.com/
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/wait.h#n289

Beleswar Padhi (3):
  remoteproc: k3-r5: Fix checks in k3_r5_rproc_{mbox_callback/kick}
  remoteproc: k3-dsp: Fix checks in k3_dsp_rproc_{mbox_callback/kick}
  remoteproc: k3-r5: Refactor sequential core power up/down operations

 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  53 +++++--
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 167 +++++++++++++---------
 2 files changed, 139 insertions(+), 81 deletions(-)

-- 
2.34.1

