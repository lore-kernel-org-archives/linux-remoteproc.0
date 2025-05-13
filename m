Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2B81EDA2F;
	Tue, 13 May 2025 05:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115163; cv=none; b=ARGKue0THxJQH8+2+pok7j+HlqtZd816KgX3xOURiJhd5UDUJg04SIZliK8OiTnL/MXd5y9/deKF6tJRrAOV6Ai32Fzj65PuEN4dV4TlPCn11iOMWLFH3mnBjj3B+OA6nZZVAuZFkZjB36BUMPENVgBnBfbyt59rkikX3JmxhN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115163; c=relaxed/simple;
	bh=tbgSf7C0xQLydhBGd8ZQuEGQmKa19a/IllYysgobLz0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPo6fQNd9ssGeomn0ERpJ7lR2Ibq4vIpsgPYYoR0xn/o309vk/8eRCK7timb+M+ju9BJ4JRPGMQ5WVlivKWZjRjq96yRp6B9eBTp0SAlDnuitXtb6ApzP/CJYztQWGs/7lLQTTX2pgJzpRovIuYCrvuLh1Nay4lh9B2GVN4mT80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cVHucxkw; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cVHucxkw"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jrJQ2985533
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115153;
	bh=09yGL7zeZIImPy9c49v035SGN0vx7Iqh010EdE7WE3U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cVHucxkwn/0lHg87gOFS3u+PMABVoV3MJY1PztQetjaMsr2XfdTVR8CRDTT7/pVoz
	 dnb+yFVWyYa4w5hjldvNz/5j+ach2luU04sCYQ5+h7jAccHCcKYvD1B65Ma7Sr/aEQ
	 JlmUSwmaS6VlUh6tJcfsn01BNFBGiqDDfvY/wkX0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jrHE027717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:45:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:45:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:45:52 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqI131001;
	Tue, 13 May 2025 00:45:49 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 09/36] remoteproc: k3-{m4/dsp}: Add a void ptr member in rproc internal struct
Date: Tue, 13 May 2025 11:14:43 +0530
Message-ID: <20250513054510.3439842-10-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Introduce a void pointer in the k3_{m4/dsp}_rproc internal data
structure which can be used to point to any private data needed by the
driver. Currently, the M4/DSP drivers do not have any private data, so
the pointer can be left pointing to NULL.

This is done to align the data structures with R5 driver which can be
factored out at a later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-9-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-9-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 04/26] into [v10 08/33] and [v10 09/33] patches.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-5-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 ++
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 35e8c3cc313c3..2191547529c55 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @priv: Remote processor private data
  */
 struct k3_dsp_rproc {
 	struct device *dev;
@@ -91,6 +92,7 @@ struct k3_dsp_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	void *priv;
 };
 
 /**
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 6cd50b16a8e82..b161770dcb26f 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -60,6 +60,7 @@ struct k3_m4_rproc_mem_data {
  * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
+ * @priv: Remote processor private data
  */
 struct k3_m4_rproc {
 	struct device *dev;
@@ -73,6 +74,7 @@ struct k3_m4_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	void *priv;
 };
 
 /**
-- 
2.34.1

