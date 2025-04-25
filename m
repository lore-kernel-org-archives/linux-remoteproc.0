Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8C8244673;
	Fri, 25 Apr 2025 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577739; cv=none; b=V0WmO2HUR/BlblIr1Mt0Ag0tPrwAEvZaztXpciwauPf31IXFGuaBRXuHnfXk5JSq3M7rbgy6YvB4kdq9WqaQSjWFoAklWIPwSvQGOxSb9H+t4WQSBiUfNjrHEJ2UuLBvLTE/ofZ5uOCIuh+Z5jgJ7Vvj8+kjaoEKQlvXhwQ0eAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577739; c=relaxed/simple;
	bh=uh+i5OwbC+n13KR4J0ZL+QSVR9Ro9DoVR8lYGBwwz+E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iB1ywbMKrPXEgut77341RG7obRq2yoLdajZ+RHnkZ14HSksV8sm5LkXojWnML6ypAiBGPBtTU3LpAyhe1OX7B894Vkq8D1kf847GMkUUNKspuZqkQZgLKUZSGZ0wsXNS0383osWdFc6GOYpk3hMiIFf/Jw/JvkFwAsYr+UbtCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qFKYsdr+; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qFKYsdr+"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgAsR2123071
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577730;
	bh=wWbhmB0BrexDIuvB4dWpllRQQ9pnkw4c2HZ3PtcxErk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qFKYsdr+OwBXwLO4iapTrWsQs7PkLzKR6TC4WdJyfS07CvBh7UNuHHKSVTt+Qp6Gx
	 df8C+7gwCKTz5uYH9UOXhT2fMOK0p1VzisZHB0o19FFJS+DXHJRAjuCpGGJALgIB8j
	 osBQ/H7nWX38CEOjJ6Wvx0mOVOE34fOWOOLesr98=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgAP1088484
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:10 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:10 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZT038329;
	Fri, 25 Apr 2025 05:42:07 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 08/35] remoteproc: k3-{m4/dsp}: Add a void ptr member in rproc internal struct
Date: Fri, 25 Apr 2025 16:11:08 +0530
Message-ID: <20250425104135.830255-9-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
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
---
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

