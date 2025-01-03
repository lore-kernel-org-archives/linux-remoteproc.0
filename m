Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20DA1F9427;
	Fri,  3 Jan 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899242; cv=none; b=GAZm+KSKS3U8MI/ATvZc8+PvmjMPHv7Lr59hrwwkPyMsfcWnCHxwNulVdFc9l4zyoNjUlx1Fumu3tOT96wPxfbxSfqpNAemaJ3oqjg8yk+eWERI6hdqmuEX7v5RNpYhBybXq/i8FwskTHFF+hhyukQeBJYZ01/7YgBdEtQt7Nio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899242; c=relaxed/simple;
	bh=7AlOVCumyE5chjHqUW2rw6A+EOQ7AZWZbauB+SODX2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bqVQ0A6D3TRc2u+kJNm6G4e0FKF4EhKiq09y1xJ6VDl+8yb5UtmyAG9U7dgwlMv6qO0sMGpUsjlppDQFyybVMeyg9WBVEowHrJXD5U5WyujBPPmuoEJrnOboIW5DiAHxjpbtvRNeX1NteaYNYLK5CgLvOTyf9API/LArtoppY2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oTt8iB73; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oTt8iB73"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503ADprU010898;
	Fri, 3 Jan 2025 04:13:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899231;
	bh=naeYvQEmTPXahTm4W5qFBWgHA76+YAZCObhSMS/zdLc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oTt8iB73kVWpZS4ITqIghJEVPaZyRDWOPeIzdZ77ufFr1RZ1mSo8IwSxODg37O6FM
	 DW/4GKvbplYh/kvX1rS8Pdwys2/ZWXHNfdEFZa98zhFApzbiWBHzyMe2db9x/me3ad
	 bPYibZJDkjn79lJ5WT5VRkFhp4jmSfvVhqUVJ4j4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADpMG126275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:13:51 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:50 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:50 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSc126047;
	Fri, 3 Jan 2025 04:13:47 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 20/20] remoteproc: k3: Refactor release_tsp() functions into common driver
Date: Fri, 3 Jan 2025 15:42:31 +0530
Message-ID: <20250103101231.1508151-21-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103101231.1508151-1-b-padhi@ti.com>
References: <20250103101231.1508151-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_{dsp_/m4_}release_tsp() functions release the TI-SCI processor
control of a remote processor, which is auto triggered upon device
removal. Refactor these functions into ti_k3_common.c driver as
k3_release_tsp() and align DSP and M4 drivers to use this common
function throughout.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 8 ++++++++
 drivers/remoteproc/ti_k3_common.h         | 1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 9 +--------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 9 +--------
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 8fa14b7dde25..d5bdda5d4976 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -574,5 +574,13 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
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
index 525d1da65105..94cac6c1ac62 100644
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
index ae8335c8f9e9..f17e44cebdc7 100644
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
 
-- 
2.34.1

