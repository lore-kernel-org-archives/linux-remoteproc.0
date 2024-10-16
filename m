Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1F520FAA3;
	Wed, 16 Oct 2024 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729096914; cv=none; b=qdx6SX3/p4c6Q7cA5bG9Q+vLJf5B2pPRxgbjimd5BL7n3Xrn4QNUW2rCEkwAYAUpXfFbl0yuCkE4o0ujzNEjer4+ATFys21cX9Jml4NZyu8hiZo2OLY/sFX1mjyoN6SdBVuo9vxWz8bnXAX0Uk65aRkffbKb4JqKia1eVtIV3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729096914; c=relaxed/simple;
	bh=DpHtPfq04oiPZVx392+SDoWvf1uEXJ38XX3wKwUtOl0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CMqc+AKOIMXXzxR4yjeUAoAMgMRwHQfGcuIytkn8GnSK8OlYzTMR2vbVlySSIpqE2d7ZlYnX8ceyJNQ5ZmCm1DFJKUEOGhDQtir2XDO7st1SSk6atdfxilq8gRdhh9NHiTFwIEhO31LgNquCeX73SbeLAwcJjZKNLtdKQeZT2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WcV+K+mO; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WcV+K+mO"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GGfh9m050027;
	Wed, 16 Oct 2024 11:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729096903;
	bh=4L8V23/lFtOiQ9FZsGss0DJeQC13lVShPiCHSbWsSl8=;
	h=From:To:CC:Subject:Date;
	b=WcV+K+mOnvHTH0JAsaZsBzyNgOOxThNQKO9iSUF+LDMC+ChQDTZJ860facbL0bQMI
	 xjdyHFGU+jg1qeUhMVrfg9L0HvHSOnFCw2P3vn17BlJa96p5KZGgisFVR3mNumHCXW
	 8v7+5NRAjTgEUy5dCgNOIxODjo1aqMDRG27I5Opc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49GGfhjR011854
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Oct 2024 11:41:43 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 11:41:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 11:41:43 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GGfgas109164;
	Wed, 16 Oct 2024 11:41:42 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 0/2] Enable compile testing for K3 RemoteProc drivers
Date: Wed, 16 Oct 2024 11:41:39 -0500
Message-ID: <20241016164141.93401-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello all,

This is a follow up to [0] that adds the same for the other two K3
RemoteProc drivers. Series is based on rproc-next branch.

Thanks,
Andrew

[0] https://lore.kernel.org/lkml/20241007132441.2732215-1-arnd@kernel.org/

Andrew Davis (2):
  remoteproc: k3-dsp: Add compile testing support
  remoteproc: k3-r5: Add compile testing support

 drivers/remoteproc/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.39.2

