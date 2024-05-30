Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8818399E;
	Thu, 30 May 2024 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060078; cv=none; b=MmUo0c6vy0CbLOhoyikqHTRqrGZF+C7PKYQiA0cHewNdBV77ODnzyi0GCCmPEDqx9PpKB1pBY+z3S/eO3V210o4WUmDZ5NS0FsX/rfm/gIZHJ4iVet7OXAr+B8tpOrGxaLOZIAcs6Arspo6i0Ok95SfLYRVTbQ61eAwvpdM54Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060078; c=relaxed/simple;
	bh=PrR8VuJccENQD2Bn4bmV00K/kVoDt/lRf5WP/W+WyU8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VP5v3Px4IRIqf7D8W8L0tz767D0sHiEdpuTpk5nX7bN4Cn8vJZ+kCvUsrM52O5RugOYESBpSWqOrOpWvF2pY3IkLWiKtWW3o+697SVYQWdoMl/egv6mCXgHxC1TX9oo+z6XB2P2HMvO9XyyuOOWMl5g9N2HHFraCSZin5q2CzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CSPv9AbA; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CSPv9AbA"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U97fsS049835;
	Thu, 30 May 2024 04:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717060061;
	bh=E7W0pkrX/cn35jnZ3leRW1gI8WwDYGTHGoYL0gw9ok4=;
	h=From:To:CC:Subject:Date;
	b=CSPv9AbA/ZFn3+ziS2GHnCaNufoMSztvqo+2YBhCEC5mC72BqnL813WP+C1H4F3ku
	 KHDGvt2d7xyYXJxw/Vmp4298/eEITgVEM3GlW+sh7Ziz5E+9+mmL3xYTB+e91hEzeT
	 Kd4RMoTBf3Bst1EsCxU681xceJk1Sj+tM4ZdVwYc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U97fI8038287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 04:07:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:07:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:07:41 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U97clm043154;
	Thu, 30 May 2024 04:07:38 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Defer TI's Remoteproc's Probe until Mailbox is Probed
Date: Thu, 30 May 2024 14:37:34 +0530
Message-ID: <20240530090737.655054-1-b-padhi@ti.com>
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

Beleswar Padhi (3):
  remoteproc: k3-r5: Use devm_rproc_alloc() helper
  remoteproc: k3-r5: Acquire mailbox handle during probe
  remoteproc: k3-dsp: Acquire mailbox handle during probe routine

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 67 +++++++--------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 72 ++++++++---------------
 2 files changed, 44 insertions(+), 95 deletions(-)

-- 
2.34.1

