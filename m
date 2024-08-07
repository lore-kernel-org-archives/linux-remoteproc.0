Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E21B150A;
	Wed,  7 Aug 2024 06:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011787; cv=none; b=Wqofvj1vsFobMTXjpaRPUZSP49Q2PMf65xRNF7x/v4wDXJVGFWOH6paBmUwobaAIkfMIMUoBUaZkAWAaYS19RuDoN1ZuxOBA+wThDETQ5fL84GwrobQd01k9qNc4L91/z8WQQj4rpvQ6i4uf1igSfWc/ObWZelDuGndVM/xC2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011787; c=relaxed/simple;
	bh=+a8IgULydooImPiMeYvM2SRCF8as9Pm9t+kx5OH/odo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q4Bq3GaNsKDCnYUy5+0poYKJzMaM8EsqxKCdpWeB4OiH3uXA4nabg+YH59eFLiM29W1lbKXr3tcAxakpSq1G63NVVR9hKVhctCbfeIb/6mB7MjHntD21J6K9JUxevhpRSn3L5+pqXaGLEEVVaHYm+JsnQOmnvwPXhguENLjpB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=zTjc8ahh; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zTjc8ahh"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4776N0cY012188;
	Wed, 7 Aug 2024 01:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723011780;
	bh=J1zYBmJteKsj+JCo4ktwBuseTRvPgtPL42YGtK1Hk8I=;
	h=From:To:CC:Subject:Date;
	b=zTjc8ahhj+Yplcg5Z6r7QTRgGfkc/F/3AH2UDMQ3CVspTpC8sgbRK0EQkugI1G7uZ
	 0Nm+Ti/kIJTiypHGy73SdUc3AqWL+/ABw+Hy5SEB/F2sLvr4uRtG9rC1gtsK2QnmXn
	 SJPBIRkSdAD5ledEs6hoZjYNaC7flBy0Gendukao=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4776N05d002417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2024 01:23:00 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 01:23:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 01:23:00 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4776MvbP109450;
	Wed, 7 Aug 2024 01:22:57 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] Defer TI's Remoteproc's Probe until Mailbox is Probed
Date: Wed, 7 Aug 2024 11:52:53 +0530
Message-ID: <20240807062256.1721682-1-b-padhi@ti.com>
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

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 80 ++++++++-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 84 +++++++++--------------
 2 files changed, 62 insertions(+), 102 deletions(-)

-- 
2.34.1

