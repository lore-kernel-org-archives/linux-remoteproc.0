Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5295A187322;
	Thu,  8 Aug 2024 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723102897; cv=none; b=AW/qBumrzFJjzQUd81YXjMxLDFlZ05jJgy70SW12TDlU2Pyx4RZ7q7cXRDxVhW2OiSrECcQtTEFX4zEYKR26Ucnl92bv7xMuUmMyjutgPjL2E2tMkMxS6mvXVci55YTq5bjuUl8zql7Tmj4+HXk6LfJsDnWyqpLO/jCkq0MPN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723102897; c=relaxed/simple;
	bh=qMhepFYwz1ECVfZUTwMQStPIOCqfrzgPSLuuFOmDH5Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J+qX3flStAdI5vr3XoAEu//X1WRFP56HwS2zkSAbinZbpkmqqwBATkJlYalFeKPL4n1IbKRgHVQLl49LFYOQFUpsYqPP4JDB2bJgQG0voKbywcQgEQlpW5vrXvLNya3dAOLAaYTvIsWBoHihN/oZCnD5JQlbwTYZ/MGFhoi4FIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GAxUusqc; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GAxUusqc"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4787fVDQ127512;
	Thu, 8 Aug 2024 02:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723102891;
	bh=eicows78LRobN5BEPLvbUgPocoApdpNS0Y/ZlM9iDPU=;
	h=From:To:CC:Subject:Date;
	b=GAxUusqc/LlSCKM4iPg4Pr3oirdt64HZQMh5tBtTJqL3m/DBTvNTb14VdbHwikof4
	 GIQgWsa5LR36jahcUtZizU6ETOV8qxCSLKrWuJNOCuKjbDSsgG133Y7bdrOrmHVT0o
	 I4gFxxkYUF5LXxal6BXDYRqrBgjVfdDYgoX82nbc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4787fVxa071124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 02:41:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 02:41:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 02:41:30 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4787fRZN020900;
	Thu, 8 Aug 2024 02:41:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/3] Defer TI's Remoteproc's Probe until Mailbox is Probed
Date: Thu, 8 Aug 2024 13:11:24 +0530
Message-ID: <20240808074127.2688131-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hello All,

This series adds deferred probe functionality in the TI's Remoteproc
drivers. The remoteproc drivers are dependent on the omap-mailbox driver
for mbox functionalities. Sometimes, the remoteproc driver could be
probed before the mailbox driver leading to rproc boot failures. Thus,
defer the probe routine of remoteproc drivers until mailbox driver is
probed by checking the mbox_request_channel handle in probe. 

Also, use the acquired mbox handle in probe during rproc start/attach
routine instead of re-requesting. Do not free mbox handle during
stop/detach routine or error paths. This makes our k3_rproc_attach() &
k3_rproc_detach() functions NOP.

Also, use the devm_rproc_alloc() helper to automatically free created
rprocs incase of a probe defer.

v4: Changelog:
* Andrew
1) Removed "Fixes:" tag in PATCH 01 and PATCH 02 of series as these are
improvements.
2) Removed NULL assignment to core->rproc to avoid possible nullptr
dereference while checking core state at a later stage.

Link to v3:
https://lore.kernel.org/all/20240807062256.1721682-1-b-padhi@ti.com/

v3: Changelog:
1) Added a check in k3_mbox_kick() to prevent sending messages to a
detached core.
2) Added "Fixes:" tag in PATCH 01 and PATCH 02 of series.

Link to v2:
https://lore.kernel.org/all/20240604051722.3608750-1-b-padhi@ti.com/

v2: Changelog:
1) Added a check in k3_mbox_callback() to prevent forwarding messages
from a detached core.
2) Addressed Andrew's comments in v1 regarding some cleanup (Using
dev_err_probe, removing unused labels, adding matching mbox_free_channel
call during device removal).

Link to v1:
https://lore.kernel.org/all/20240530090737.655054-1-b-padhi@ti.com/

Beleswar Padhi (3):
  remoteproc: k3-r5: Use devm_rproc_alloc() helper
  remoteproc: k3-r5: Acquire mailbox handle during probe routine
  remoteproc: k3-dsp: Acquire mailbox handle during probe routine

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 80 ++++++++-----------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 94 +++++++++--------------
 2 files changed, 65 insertions(+), 109 deletions(-)

-- 
2.34.1

