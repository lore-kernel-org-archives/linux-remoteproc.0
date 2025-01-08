Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33A519EEBF;
	Wed,  8 Jan 2025 06:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736318265; cv=none; b=XnE8G0XdFfeUDgz9eb4iBLDdBAAjU4615wvVNdjeDHn4n5jNfMx/9a0ScJJ65yoU9TlsBRC4hpeZoelVSE1QKueIWxQj3TBzGs10eNzZPFaEw2pXWfbExhNG7KlEyi9U3WiiY2CTbFyH4gJPwm8V1ozOeRWQT7mdWjQCRyhf5VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736318265; c=relaxed/simple;
	bh=GqX272S/doP/JjvoJ/e4q7yntWOaFNXF/EZZZLlH830=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jO+eYWQEeRTJ8sc691Ao8OVlwy6s5nHWYhMqjl64WIfZz6I3eA7eJyCXeH9vIRU7yWeLs7RRkIR2a+wq4BqkGXFnfjtuAGzK7D3VG49O9GPWbJcWqsJgezxHoYRESi3IlXuB1TvwUjcQVlwOGlb5YErrCQkgWaiHh1JgDPgwgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E/4hLeOJ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E/4hLeOJ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5086bWWk2762732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 00:37:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736318253;
	bh=jZUhYCDBAt6xZofwEPAGBnU17+1CzpkkWcPqS5+6Mt0=;
	h=From:To:CC:Subject:Date;
	b=E/4hLeOJUSCg43Tx9vRapJt6TB6kOQtp1NVV9UQ6fxmH+XoJSO0kp4XERN/ZlMoXh
	 CuqsbEzJiiuSpHHPlIo2y6t2XQQB5VbxY6WSn7oFZWOfvL4CJ+7aVfhWuD7j09d/uM
	 XJOvakiz0cYoIfWWEafRhMm1cAc6C9MXEn5KEiYc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5086bWZL062989
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 00:37:32 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 00:37:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 00:37:32 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5086bSPd127347;
	Wed, 8 Jan 2025 00:37:28 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] Rework TI K3 R5F remoteproc driver
Date: Wed, 8 Jan 2025 12:07:24 +0530
Message-ID: <20250108063727.1416324-1-b-padhi@ti.com>
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
drivers[0]. The third and final series for K3 Refactoring is also posted[1]
which deals with the TI DSP and TI M4 drivers. The R5F driver takes care of
configuring dual core R5Fs in Lockstep/Split mode and therefore has worked out
separate data structures & reset logic than the DSP/M4 drivers which deal with
single core CPUs. Therefore, I have excluded R5F driver from the common
refactoring in the final series[1].

NOTE:
This series is _dependent_ upon the below series which does devm_ cleanup
[Now merged in rproc-next/linux-next].
https://lore.kernel.org/all/20241219110545.1898883-1-b-padhi@ti.com/

Bugs fixed in this series:
1. Fixed IPC-Only mode attach for R5F cores. PATCH #1
2. Fixed IPC-Only mode attach for DSP cores. (Included in this series, as this
was related to point 1 and fix is similar) PATCH #2
3. Fixed support to load firmware from userspace by refactoring wait mechanism
logic into prepare()/start() ops. PATCH #3

Testing Done:
1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
IPC-Only mode and Kernel remoteproc mode in all Jacinto K3 (j7*) devices.
2. Tested Lockstep, Split and Single-CPU Mode configuration (wherever
applicable) of R5F remoteprocs in all Jacinto K3 (j7*) devices.
3. Tested shutdown of R5F remoteprocs from Linux userspace and also by
executing `modprobe -r ti_k3_r5_remoteproc`.
4. Tested usecases where firmware not available at Kernel boot time, but later
in sysfs, able to load firmware into a remotecore and start it.
5. Tested that each patch in this series generates no new warnings/errors.
Exception: Using the "wait_event_interruptible_timeout" macro in PATCH #3 raises
a -Wshadow warning, which is expected as it is called out in the implementation
of the macro itself[2].

v2: Changelog:
1. Changed variable name "is_attach_ongoing" to "is_attached" in PATCH #1 and
PATCH #2. [Udit]
2. Triggered wakeup event signal only for core0 in .prepare(), and only for
core1 in .unprepare() in PATCH #3. [Udit]
3. Carried Reviewed-by tags from v1 of the series.

Link to v1:
https://lore.kernel.org/all/20241224091457.1050233-1-b-padhi@ti.com/

Thanks,
Beleswar

[0]: https://lore.kernel.org/all/20241219110545.1898883-1-b-padhi@ti.com/
[1]: https://lore.kernel.org/all/20250103101231.1508151-1-b-padhi@ti.com/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/wait.h#n289

Beleswar Padhi (3):
  remoteproc: k3-r5: Fix checks in k3_r5_rproc_{mbox_callback/kick}
  remoteproc: k3-dsp: Fix checks in k3_dsp_rproc_{mbox_callback/kick}
  remoteproc: k3-r5: Refactor sequential core power up/down operations

 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  63 ++++++--
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 179 ++++++++++++++--------
 2 files changed, 161 insertions(+), 81 deletions(-)

-- 
2.34.1

