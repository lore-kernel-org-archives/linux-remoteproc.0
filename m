Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88474433D8;
	Mon, 21 Oct 2024 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729544399; cv=none; b=ASpTtxh1pTm+XQX4wto5M59ni+50SRwTbmXhYvNjenytCCWHGiw8/+BVH6XVXR+3ZkgilfKkt74sWj4sP8h8Auv6ZiNBRBA7sxnuBBBOqy7Tj0Q4c22ybVfP9k70KbAliO12QULq8A1QeTbhgBp9yfjcsj7CDTF4b0bEc7cQJI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729544399; c=relaxed/simple;
	bh=s+LVNUlBmSDrw1LMeiDbaJqt7WfYBs3DvyWS/InFHSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lyH8c7mMMOCtDi/6IseZdYMvBlIXsCdS/n4P/2rcHdfbnAPF3MsHqKhRL/ljuIdG6X95dbKN3JvTSTwdPiPL9uc7XZ7SmXMbHsIA1hs9HJ2tQB5dIKO3cmiEdt8y5fIRu/dEKbftw4h/fT6maQProK7M0HgpKUcPuUz725+9SGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RLvZpqxY; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RLvZpqxY"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LKjxcR040170;
	Mon, 21 Oct 2024 15:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729543559;
	bh=WRaotlzLG0176sAxDgwghGqpp9E32PZXQdHe7JQOo/o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RLvZpqxYhNeq2VaNo0WFWC5VnujZERXA45xLcV+E03NhcpdofHQLBumK8tz1+0vo9
	 mn4HDtuvmA7FUA7u76IxBxSgtp5sOz1Mh7y/ob+8sSpi/E/Afi0XwKGQNpfAWjqGkX
	 df32uz1V2ymu4pSeyjhgdntf4MtRp2hbRhKrppJA=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49LKjxbJ044382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 15:45:59 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 15:45:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 15:45:59 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LKjwf0030965;
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
Subject: [PATCH 3/3] remoteproc: k3-dsp: Force cast from iomem address space
Date: Mon, 21 Oct 2024 15:45:57 -0500
Message-ID: <20241021204557.929823-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241021204557.929823-1-afd@ti.com>
References: <20241021204557.929823-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

These memory regions are mapped as Normal Non-Cached which on
does not have the normal IO address space limitations and so this
cast is safe. Add '__force' to explicitly specify that the cast is
intentional to remove a sparse check warning.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d08a3a98ada1c..ffb46c64170ac 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -403,7 +403,7 @@ static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
 	 * the hard-coded value suffices to support the IPC-only mode.
 	 */
 	*rsc_table_sz = 256;
-	return (struct resource_table *)kproc->rmem[0].cpu_addr;
+	return (__force struct resource_table *)kproc->rmem[0].cpu_addr;
 }
 
 /*
-- 
2.39.2

