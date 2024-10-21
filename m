Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1A61FE11C;
	Mon, 21 Oct 2024 20:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729544401; cv=none; b=Yv4TyR5TbqORRA7CIFxw9j764dS74ziEj7vCY/MawaFNV2h8y+TfZDcfYpXbyL8uAWsAH68BZm8r9Con2PKjVF3mM5nGDlZVyv/zwmGL6X0vSVt6ncAqAsA+cq7rPmpWdPCsaRkuGzzPOLl+B0++b5RUCBNk1Z5oYD7j4gvN/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729544401; c=relaxed/simple;
	bh=2sKBu+QZ+AvjZxLrr6nDrfL60wFayPkrk8TH7UhKTQg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KNqwfJbjZuxsTiAritMujDGLeKslAebO0svK1WlPOz1S2VmyAYxbyxtA8y2lBWyOD0254GlzbPtptDljZTSiiQKL6LvRavqZfcvvgDuwj93zTA2Ul7gLETTFF3gNe8noUIXdamnpMwvDTy7qBLjcrTcr7l17rLoQPI6lcKR7l/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l55scDGs; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l55scDGs"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LKjwqR040165;
	Mon, 21 Oct 2024 15:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729543558;
	bh=Kcgzds91ib2MFPSxXFB3TTAvgTEhUg1wrYZ1rCJaZiU=;
	h=From:To:CC:Subject:Date;
	b=l55scDGsFpqYBUuj6j5zoUiixfg0krGqshfwxd5jrnWznETgYSAe4oX+9jGTNd0CJ
	 takpgJXU4wIS3+UTasOeDr5wPGhXojF2g3KJyzEhKHfSUWh325DmKhtnejHEIYFgFo
	 Wn4UxlvroE3r6nZ1pcb4i50q0Cf5qAPQrjMrGjV8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49LKjw8o013043
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 15:45:58 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 15:45:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 15:45:58 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LKjwew030965;
	Mon, 21 Oct 2024 15:45:58 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/3] remoteproc: k3-r5: Use IO memset to clear TCMs
Date: Mon, 21 Oct 2024 15:45:55 -0500
Message-ID: <20241021204557.929823-1-afd@ti.com>
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

While it should be safe to use normal memset() on these memories as they
are mapped as Normal Non-Cached, using the memset_io() provides stronger
guarantees on access alignment and fixes a sparse check warning. Switch
to memset_io() here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 2f996a962f557..e1fe85e5eba6a 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -487,10 +487,10 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 	 * can be effective on all TCM addresses.
 	 */
 	dev_dbg(dev, "zeroing out ATCM memory\n");
-	memset(core->mem[0].cpu_addr, 0x00, core->mem[0].size);
+	memset_io(core->mem[0].cpu_addr, 0x00, core->mem[0].size);
 
 	dev_dbg(dev, "zeroing out BTCM memory\n");
-	memset(core->mem[1].cpu_addr, 0x00, core->mem[1].size);
+	memset_io(core->mem[1].cpu_addr, 0x00, core->mem[1].size);
 
 	return 0;
 }
-- 
2.39.2

