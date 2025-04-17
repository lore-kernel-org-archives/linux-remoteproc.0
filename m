Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355AB256C9B;
	Thu, 17 Apr 2025 18:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914047; cv=none; b=PGYrHC3ikfxC8ZkYOlKT3L+EETPjsO6LbfqO3COfUPq/cCsRbL99R0c9eID5Dh6ukavH/8NZWAcoa7xB/egoNFNl9pdK8NUXQ6cD6/cUUrIzUHk9gCo3TiUjjWJSjvjEt7uWNTQLaXOp3yrGnLYUFMd8yD4dQik2stQ3ZbbuTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914047; c=relaxed/simple;
	bh=0u0J70vdAwroBusEz7sBV68GqwtQMYCbDXpsmD2DY7s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kurI2tglmcOOl3mLGfyyUwNmEiabuTbUk6fdJWPUMwvpT2Eiz6pM/1Ssr6afyEaoB2Wd4v2Xof6aGLlY8LJUKIL/UEIiqS0Kpbe4pS1IVFHWNh/+rBCTclKsJDAo0RAlPjoC+zWm9iLpOvsPUHGrl9PvvHPPEgj2mCV6L2P57Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OWU5hk8f; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OWU5hk8f"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKaOd720094
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914036;
	bh=htZJuH7MCHBsYaztPzE25XCbLUZxeHARLzDV8OKAf/0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OWU5hk8fNqpHRQkvyz/AdpCfPVj3e0jEBMowcQCHXRkOCTaM7Fe/D//t7DU81modn
	 72ru0CidGaH5dReQ0loG6kCUZ13TPjbKB/zsANDFvckjKd9WBYaMQ69T7OzP9rWb3z
	 5IBTMvCmXuC7YC4NqGDjARSZR6UWHg5DOtxxhu54=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKaF3022600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:20:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:20:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:20:36 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1Hq071102;
	Thu, 17 Apr 2025 13:20:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 08/33] remoteproc: k3-{m4/dsp}: Add a void ptr member in rproc internal struct
Date: Thu, 17 Apr 2025 23:49:36 +0530
Message-ID: <20250417182001.3903905-9-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
References: <20250417182001.3903905-1-b-padhi@ti.com>
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
---
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
index a16fb165fcedd..24c90db58ee3d 100644
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

