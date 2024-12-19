Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D6A222591;
	Thu, 19 Dec 2024 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606362; cv=none; b=ImCevCSs7mCM1ucjo3P0Zq6eCnPqmbrBpti5t86wDRmX2796s+FF3lAr4uYFJ68o5C8KK5/nVmg08pt+mWK2cIGy+xJ/SkQiQm+6e2SnkOxeYx+UEG8n+wUDtmMKc1n8AzGrXnkOJwKWu2KKzVt4gkNr0ieA5yikbW9Q7UTMDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606362; c=relaxed/simple;
	bh=zz3NRvnX5Onb8TZ1AqTTMrRI7WRV9U7mbcJV7E8zMb8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ui51lZlKdfXoV0uvW4CyAoZ3Fu0CU50W+flzPIiOYdnIkx3i2L9/F/nW1u3bxEwzMwmEGeDNeu8eNsdzzfY2nuB1Ba/yZlI5sYqWRj5lSt2byxoqnnqWkA375bo/dR/Fc1xMNaBUnMBR4P/RMC55q5lqqi9PHxsd3gchKmX2z+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VwxWUlq/; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VwxWUlq/"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB5nvp083410;
	Thu, 19 Dec 2024 05:05:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734606349;
	bh=pxlYcTdWxZkuC3D4XFICXfoye4DPVVbJwZOlrxf45jc=;
	h=From:To:CC:Subject:Date;
	b=VwxWUlq/sEbW58ShWuQwcZqUlsOq6daI7S8jz6JsjkcqD03nW5ZX5DM4Mi6+jYzQs
	 L8yHD2260dK/0rZd9sEDzSIETfqP+IKj0o/XnsAu8zm3VMqtcm/3RFV47Xio1rV+5J
	 5NiT/OylVlFfXvGrGpdgnhpynCKuGI1KKpgPvaFg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB5nqZ012969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 05:05:49 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 05:05:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 05:05:49 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB5jY8088123;
	Thu, 19 Dec 2024 05:05:46 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/5] Use Device Lifecycle managed functions in TI R5 Remoteproc driver
Date: Thu, 19 Dec 2024 16:35:40 +0530
Message-ID: <20241219110545.1898883-1-b-padhi@ti.com>
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

This series uses various devm_ helpers to simplify device removal path in
ti_k3_r5_remoteproc driver. This is the first series in the TI K3
Remoteproc refactoring as long planned since [0].

Testing Done:
1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
IPC-Only mode and Kernel remoteproc mode in all Jacinto K3 devices.
2. Tested Lockstep, Split and Single-CPU Mode configuration (wherever
applicable) of R5F remoteprocs in all Jacinto K3 devices.
3. Tested shutdown of R5F remoteprocs from Linux userspace and also by
executing `modprobe -r ti_k3_r5_remoteproc`.
4. Tested that each patch in this series generates no new warnings/errors.

v2: Changelog:
1. Re-ordered patches in the series to use devm functions starting from
the last called function in remove(), to ease review. [Andrew]
2. Fixed a missing return after dev_err_probe() call in [PATCH v2 3/5]
("remoteproc: k3-r5: Use devm_ioremap_wc() helper"). [Andrew]
3. Removed redundant rproc_del() call in [PATCH v2 4/5] ("remoteproc:
k3-r5: Use devm_rproc_add() helper").

Link to v1:
https://lore.kernel.org/all/20241204111130.2218497-1-b-padhi@ti.com/

[0]: https://lore.kernel.org/all/Zr4w8Vj0mVo5sBsJ@p14s/

Beleswar Padhi (5):
  remoteproc: k3-r5: Add devm action to release reserved memory
  remoteproc: k3-r5: Use devm_kcalloc() helper
  remoteproc: k3-r5: Use devm_ioremap_wc() helper
  remoteproc: k3-r5: Use devm_rproc_add() helper
  remoteproc: k3-r5: Add devm action to release tsp

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 88 ++++++++++--------------
 1 file changed, 35 insertions(+), 53 deletions(-)

-- 
2.34.1

