Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577D24A042;
	Mon, 17 Mar 2025 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213304; cv=none; b=Icc1mCTx7SBjl0Bjmn7tNoCfcTKO61bFP9UA/mKUT97slZXabywBwq0C56UMDul0KmyHcOK4JRfXeY11KrN1LHkqjUjiGWhnAEAauzZPMsaz/YQHWUOiwk3tNXeBU7C/q08i3ClE85uc1udMqrSJVCMxfEJA79HAFUagLU5QfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213304; c=relaxed/simple;
	bh=zayEsJU+c8cOBRixd8Ws3Oj7Y3PF77IZpr5UDqJofo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgf0rzP+D+h5NTGbv7HLJ2UD+mpirKZ8+Fr8Bbjx4L+CkolGojzAE4JDljjJMb8xk4jfXDHd3/nA9zIrypk8YPfWy13e6DR0aCTcu9s+7C7iKZMo7O+t3bgsZNpxs9z4IFTxi/DbAjdP36XPKV+ITNcMKqa8kx8qYm+Z5sM8mHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PZ/Pjrqn; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PZ/Pjrqn"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC8Cg42755841
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213292;
	bh=NgtW+ifdP60oEZkzqO6isD8I+BsOR6W5AuC7p1fICE8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PZ/PjrqnS9QVIWZED7Yx4r81Vew8oXcdfTHMjt7es+fF5Y3HEkMAitDThgdJyHWOW
	 JVjADAMVxEmEvFn7VjqICbYt4XsU+nlUNN3fK0ysfpThflbYTjmPeufFzja9I5lY0E
	 3dXFjLMaDTZZWQ1Sjl+lyPjqocsW2E/AG6KJs1nc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC8CTY124573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:08:12 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:08:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:08:11 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKN060901;
	Mon, 17 Mar 2025 07:08:06 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 26/26] remoteproc: k3: Refactor release_tsp() functions into common driver
Date: Mon, 17 Mar 2025 17:36:22 +0530
Message-ID: <20250317120622.1746415-27-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317120622.1746415-1-b-padhi@ti.com>
References: <20250317120622.1746415-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_{r5/dsp/m4}_release_tsp() functions release the TI-SCI processor
control of a remote processor, which is auto triggered upon device
removal. Refactor these functions into ti_k3_common.c driver as
k3_release_tsp() and align R5, DSP and M4 drivers to use this common
function throughout.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 8 ++++++++
 drivers/remoteproc/ti_k3_common.h         | 1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 9 +--------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 9 +--------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 9 +--------
 5 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index b72c4c179c97..d5003112136b 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -540,5 +540,13 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 }
 EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
 
+void k3_release_tsp(void *data)
+{
+	struct ti_sci_proc *tsp = data;
+
+	ti_sci_proc_release(tsp);
+}
+EXPORT_SYMBOL_GPL(k3_release_tsp);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 148717942dfb..a9981303dde8 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -109,4 +109,5 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
 void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
+void k3_release_tsp(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 40187d03206f..f5f17c18fc1b 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -66,13 +66,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.get_loaded_rsc_table	=	k3_get_loaded_rsc_table,
 };
 
-static void k3_dsp_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static int k3_dsp_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -136,7 +129,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_dsp_release_tsp, kproc->tsp);
+	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a1a31c4f8c3e..c9c563c75ff6 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,13 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static void k3_m4_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
@@ -93,7 +86,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	ret = ti_sci_proc_request(kproc->tsp);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
-	ret = devm_add_action_or_reset(dev, k3_m4_release_tsp, kproc->tsp);
+	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index ecac013b6482..ffb146c9cd47 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -954,13 +954,6 @@ static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void k3_r5_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1046,7 +1039,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		ret = devm_add_action_or_reset(cdev, k3_r5_release_tsp, kproc->tsp);
+		ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsp);
 		if (ret)
 			goto out;
 	}
-- 
2.34.1

