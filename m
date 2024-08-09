Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4946184;
	Fri,  9 Aug 2024 06:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723183315; cv=none; b=sGfDSd7EtFou7sy2K72B4ssqH6ewVyur5etGO4cjZxRI7Lbj/GY/NFKKIrJOKB0z/Tb+cLca1MnlDrcBkAtHZeEm1OnEqEe5vInqPTn01u3iARzmegk0ui62IYZqmt0NmgpkZvVc4GRAdQzZ0pf9dRYBi/Yt2MH9aPnjSAQ6TsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723183315; c=relaxed/simple;
	bh=u4M3haMYYhTPIRpC5YY9/hNrGN67fqfpQhhp6BF+mEY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WosKi47A4INvVB+CGZk20ITWCOP9QWGaeIbe1Hv3z+wmCqtSrI9BUH15t3Yhh4I+w5AoHh1lcu1of1/CV3QmRQsOO1Km/7U5vXzS7zGyEt120Aj8Dub5C8i1rt8eMKRgV30xqEQDdxtI66ij4Edy0gO7wlky2hELQj0eNiGa2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Gz7REli/; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gz7REli/"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47961Z9I090003;
	Fri, 9 Aug 2024 01:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723183295;
	bh=rgHh5WpxI1LAQUjXRTB9RmGXouHqqsuo+iVVEkhZLus=;
	h=From:To:CC:Subject:Date;
	b=Gz7REli/XcjJuRJaDGb/wW8DbK7MsNcbueR2l00bJO27jQvLcljR64/bo+7MQkYZ4
	 KxvK6LdgZ+urnpZVjwliGoJ9jeSYTgoKW+zdJxR/6tunBq7w0hoJbEo8uUx5Jq3SD9
	 L1RdmgiSZvCdFgsXahCXNB4IYM8zWdQGDGhS3/po=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47961Z7p049069
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Aug 2024 01:01:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Aug 2024 01:01:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Aug 2024 01:01:35 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47961WFM102237;
	Fri, 9 Aug 2024 01:01:33 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] remoteproc: k3-r5: Delay notification of wakeup event
Date: Fri, 9 Aug 2024 11:31:32 +0530
Message-ID: <20240809060132.308642-1-b-padhi@ti.com>
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

From: Udit Kumar <u-kumar1@ti.com>

Few times, core1 was scheduled to boot first before core0, which leads
to error:

'k3_r5_rproc_start: can not start core 1 before core 0'.

This was happening due to some scheduling between prepare and start
callback. The probe function waits for event, which is getting
triggered by prepare callback. To avoid above condition move event
trigger to start instead of prepare callback.

Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
Signed-off-by: Udit Kumar <u-kumar1@ti.com>
[ Applied wakeup event trigger only for Split-Mode booted rprocs ]
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 39a47540c590..f1710a61247f 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -464,8 +464,6 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 			ret);
 		return ret;
 	}
-	core->released_from_reset = true;
-	wake_up_interruptible(&cluster->core_transition);
 
 	/*
 	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
@@ -587,6 +585,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		ret = k3_r5_core_run(core);
 		if (ret)
 			goto put_mbox;
+
+		core->released_from_reset = true;
+		wake_up_interruptible(&cluster->core_transition);
 	}
 
 	return 0;
-- 
2.34.1

