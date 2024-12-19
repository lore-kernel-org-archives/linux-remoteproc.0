Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D222371F;
	Thu, 19 Dec 2024 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606373; cv=none; b=RtKI4bzOL9u4+igC+tjbkkcOm4BdYM3AUIIBY5cOdlWZuYB9lctyVFYYoATnCMqinIQRVry8zhkUXjsKdPK0VF1CDqi/DLjbptL9hV76mQE3bUo3W9rnBEcfAuCF8g1Fa9LJ/Yjr6K6Od8I1pQ4+TNstYTwMkNZG1uzUvtFe9Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606373; c=relaxed/simple;
	bh=pqQEK8y55QGByePDVmPjsKwKYeZfL2kJtO2DqsNTzZs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8WiQXJJ7o29KswJQra6ePUZP1HrxMPyqfuVpTrnywHrbMwJJkEkr0b2QDK9/hL9NaZ8dBU1g1fFEYJMYi9wOphMrV7C8GPDI+q/o9JwtIVmjNbzRu7Z1Aww/PyK0lVNofGZieftOIwZMEwFzV/2K19jibM5BdPbdNrLR+/q6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Xjdnw+Eh; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Xjdnw+Eh"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB5uks3773118
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 05:05:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734606356;
	bh=Kfiag7TP1cLf4p9eFnhkxZKznqydLbnnKUDaCrM+PGk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Xjdnw+EhvOKCcURdx7ttbRBUaMtjzVOgV25SGvOBl/74iRBahESDtm1Wj5rvD34P3
	 CPCQJwGZzbtmR8KnjeYKbYtYrRZo5xzw3l7KiAj5cC7GKo5vL4Yq3m7NXP1II1hd1c
	 6GeaNqaWjijSWVz84jHoCNCfxg133hWDsCLcTr2Y=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB5uJT013014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 05:05:56 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 05:05:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 05:05:56 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB5jYA088123;
	Thu, 19 Dec 2024 05:05:53 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/5] remoteproc: k3-r5: Use devm_kcalloc() helper
Date: Thu, 19 Dec 2024 16:35:42 +0530
Message-ID: <20241219110545.1898883-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219110545.1898883-1-b-padhi@ti.com>
References: <20241219110545.1898883-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use a device lifecycle managed action to free memory. This helps prevent
mistakes like freeing out of order in cleanup functions and forgetting
to free on error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch

Link to v1:
https://lore.kernel.org/all/20241204111130.2218497-3-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index d51f88a5abc1..0753a5c35c7e 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -997,7 +997,7 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 		return ret;
 
 	num_rmems--;
-	kproc->rmem = kcalloc(num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
+	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
 	if (!kproc->rmem)
 		return -ENOMEM;
 
@@ -1049,7 +1049,6 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 unmap_rmem:
 	for (i--; i >= 0; i--)
 		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
 	return ret;
 }
 
@@ -1059,7 +1058,6 @@ static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
 
 	for (i = 0; i < kproc->num_rmems; i++)
 		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
 }
 
 /*
-- 
2.34.1

