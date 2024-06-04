Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA62F30;
	Tue,  4 Jun 2024 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478253; cv=none; b=MPwYxXSpAkWJmw2tiMmTEJhuWFND4CUZGTnx1KSx0q9Cp/Yd+Q/837E+Va/D2mMtMKdP5wzjJa79WPQ/Dy3LZozdMZRLBYDC5bOIuTSc5A3zrNfWSigdO4Inl/bkoWAYwTSD9Xf0YKJe9eEwEUW8Qc3S1+YBu90FzaDgQn1+Nb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478253; c=relaxed/simple;
	bh=vz7g+Vy8etMz3ItiT/90hkhv9t1iog2ipHtSzbpvCr8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iHGki1JOnCub6quoibEtqmbuRr0X2C3+YWkuoYGcXDLJdwVZzuqXwx/Rtv56amLcreR4Vtpa13DQ9BGgW2+qR20KU85Ir2CTDEfWdnKUIJYHlMo31SxIh5u2RNCYXWNHVe82wDjNtxnWhG9ojv36KGxSxEiQfqhu2s191Cy/Cb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NfUbw6W7; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NfUbw6W7"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4545HQxV041003;
	Tue, 4 Jun 2024 00:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717478246;
	bh=kQdpZ4YUeWwRVQ6Z+ae9gy0QKj4zL29BKyGpvG/1Y3k=;
	h=From:To:CC:Subject:Date;
	b=NfUbw6W7v0F2JE10jVP4WQd2y+2yHKW9CYmWx5lhiApKZ55PW571EaL4BVVd4/fxu
	 rUIzRD7eS4ZsB6dgins+h3+fchhUjfxFoOXL0g5QNb4gEZK6BrKrjwf6Nl1hgR2qqr
	 GEDbLS9rE2EYXMNkwpkBPoWjXav+iGMgQpv0JPEc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4545HQLc107125
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 00:17:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 00:17:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 00:17:26 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4545HNG4067975;
	Tue, 4 Jun 2024 00:17:24 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] Defer TI's Remoteproc's Probe until Mailbox is Probed
Date: Tue, 4 Jun 2024 10:47:19 +0530
Message-ID: <20240604051722.3608750-1-b-padhi@ti.com>
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

v2: Changelog:
1) Added a check in k3_mbox_callback() to prevent forwarding messages to
a detached core.
2) Addressed Andrew's comments in v1 regarding some cleanup (Using
dev_err_probe, removing unused labels, adding matching mbox_free_channel
call during device removal).

Link to v1:
https://lore.kernel.org/all/20240530090737.655054-1-b-padhi@ti.com/

Beleswar Padhi (3):
  remoteproc: k3-r5: Use devm_rproc_alloc() helper
  remoteproc: k3-r5: Acquire mailbox handle during probe
  remoteproc: k3-dsp: Acquire mailbox handle during probe routine

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 76 ++++++++-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 80 ++++++++---------------
 2 files changed, 54 insertions(+), 102 deletions(-)

-- 
2.34.1

