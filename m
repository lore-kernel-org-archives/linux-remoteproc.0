Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8544C1DC182;
	Wed,  4 Dec 2024 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310704; cv=none; b=FC/RTj97Yw7z5QmMIZ75rwk/C8MyL1yiJ54y7z1SAypVKdvnFU7+hZz2g/fszM9xdJAPYF5axqpeDOoGAG56461NG+/6SgqtN5wYQvgx0+SuoMeDqpkcU0DqwgqYm15svuFbaRnIbLPEf+KaB/tFkWJ7E5WRmLAVicabDSoLbVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310704; c=relaxed/simple;
	bh=5yf6lei5QoETHygWsavj/1LOdrGbezl/grnOZQzVKnA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l0zbK6YgT9ytbnHcWqe8asDOS99fGW5cQxKoq7MzByNnnzWDzZEaRIyi3LWwcUuuV2BGTMUIn6Tc653TGrN3byNZbNrBA7eIbY++heqKr7/NbMLz3f7noYC22l7uYmc5dND+emUQaK8O2vOcGWr35bFJg4/AEufC/0KY0CU7LJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F5pfacFA; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F5pfacFA"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBZBZ130387;
	Wed, 4 Dec 2024 05:11:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733310695;
	bh=07Mi1yBIPlHTaBD/rKbas7s1qaQYiA9j5nfJCgLRBoQ=;
	h=From:To:CC:Subject:Date;
	b=F5pfacFAz0hxu2h3oRJDd2JL4CMjvUD7mIrejwG5t+DJ/P85Larwg0dpews3JoDAd
	 xfhT/PDGsSAxdTCKDmjPrGZ+EatMhfKMFHrx+jUhR20t7R8OoDzgg+HqfMIS2ObRa6
	 mDcpAAT5SscetcosYXqmtOJLKNTZVmhg63cClUV8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBZmN018417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 05:11:35 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 05:11:34 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 05:11:34 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBVUK083186;
	Wed, 4 Dec 2024 05:11:32 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] Use Device Lifecycle managed functions in TI R5 Remoteproc
Date: Wed, 4 Dec 2024 16:41:25 +0530
Message-ID: <20241204111130.2218497-1-b-padhi@ti.com>
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

[0]: https://lore.kernel.org/all/Zr4w8Vj0mVo5sBsJ@p14s/

Beleswar Padhi (5):
  remoteproc: k3-r5: Add devm action to release reserved memory
  remoteproc: k3-r5: Use devm_kcalloc() helper
  remoteproc: k3-r5: Add devm action to release tsp
  remoteproc: k3-r5: Use devm_ioremap_wc() helper
  remoteproc: k3-r5: Use devm_rproc_add() helper

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 86 ++++++++++--------------
 1 file changed, 34 insertions(+), 52 deletions(-)

-- 
2.34.1

