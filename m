Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DDB1F707F;
	Wed,  4 Dec 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310718; cv=none; b=A0kHADosSQL/LnUj0p68Jb+vTTr9yzzfirnOKTL3w4HEnLcwzwqQcxFQGEjn4NlQMGR86G+R867WCQEVgFb2/sTi9LhaUBdQP3uYaYnSIjWf/FrIBkVx0QKYtgJrApE+Vdf38m6cdGZ1NfEH56GUiklw7uD9gdgFebcmjBwRl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310718; c=relaxed/simple;
	bh=STEa/wbUALAG7daocIHSS80vcnLrZ2hQirwRnWPcFOg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJ5CTEhfE/Y1sjuYbJk5CAGcWeKFnXsZfxdyhmFyYG1cqUfmVtNbS9/ItMWTRPDANHrpBZB9LREU5o75ah3U+ztwiizXMWFizHfxS73ONFWw/dCfE+uwv+HwT7m6AJovGivgijVppIiPvmOUGNdl+CM3dIujpD8cL9eJ//axxE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=zCen39Vb; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zCen39Vb"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBoEc1760343
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 05:11:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733310710;
	bh=8bFN/ISdki5HaTn/nVQXGFgD7hL89N3eSbAm+Yj27z0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zCen39VbHApvsajznLRN+L2Pd0C3EOiG+iIOHpA9lgY19G/MtiYlXluqJ5OH+lEi/
	 7AIPrrY0dJRX7kgGzuYccNRDBfbt3VKOPWeeWMVFJ9ELU9DipaxL3fn2+ebWDr56y3
	 BeFaDOliNYc6RmEY4f1tcAs1+pJZ6UHAXUal8jsI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBoLs018468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 05:11:50 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 05:11:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 05:11:49 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBVUP083186;
	Wed, 4 Dec 2024 05:11:47 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] remoteproc: k3-r5: Use devm_rproc_add() helper
Date: Wed, 4 Dec 2024 16:41:30 +0530
Message-ID: <20241204111130.2218497-6-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204111130.2218497-1-b-padhi@ti.com>
References: <20241204111130.2218497-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use device lifecycle managed devm_rproc_add() helper function. This
helps prevent mistakes like deleting out of order in cleanup functions
and forgetting to delete on all error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 1a7681502f62..1050f4a94a14 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1266,7 +1266,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		ret = rproc_add(rproc);
+		ret = devm_rproc_add(dev, rproc);
 		if (ret)
 			dev_err_probe(dev, ret, "rproc_add failed\n");
 
@@ -1355,8 +1355,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 		}
 
 		mbox_free_channel(kproc->mbox);
-
-		rproc_del(rproc);
 	}
 }
 
-- 
2.34.1

