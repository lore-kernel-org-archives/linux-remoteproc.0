Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D86C001DE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Aug 2023 06:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjHBGu1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Aug 2023 02:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbjHBGtj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Aug 2023 02:49:39 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A952D43;
        Tue,  1 Aug 2023 23:49:36 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3726nWc8053335;
        Wed, 2 Aug 2023 01:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1690958972;
        bh=5dhhBkcIIjQkD4NGE6KjlFSzwhe0pTH+UkvbUnYAUqw=;
        h=From:To:CC:Subject:Date;
        b=O2dxfOSlgXvbHD7RANj0PEqYlDtjr3Ib/phyCLHg3rDFPduxMtYlgBGnKTovqF/vO
         33mEbuc9FqojMjB8ypCFJvNj8yQyx9gB6LbpW97qlIEDU2dprsyqOcYgGkeYZa+Mzf
         1MepDlBzfQIWPA+qoep9sqgNrsmXuOMcSyb/BiZE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3726nWUm030628
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Aug 2023 01:49:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Aug 2023 01:49:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Aug 2023 01:49:32 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3726nWna010081;
        Wed, 2 Aug 2023 01:49:32 -0500
Received: from localhost (uda0501179.dhcp.ti.com [172.24.227.217])
        by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 3726nVKx015117;
        Wed, 2 Aug 2023 01:49:31 -0500
From:   MD Danish Anwar <danishanwar@ti.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <srk@ti.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
        <vigneshr@ti.com>
Subject: [PATCH] remoteproc: pru: add support for configuring GPMUX based on client setup
Date:   Wed, 2 Aug 2023 12:19:25 +0530
Message-ID: <20230802064925.1895750-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

The GPMUX config value for a PRU device can now be configured by client
by specifying it in the device node ti,pruss-gp-mux-sel.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 5b2dc75836fc..327f0c7ee3d6 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -110,6 +110,7 @@ struct pru_private_data {
  * @dbg_single_step: debug state variable to set PRU into single step mode
  * @dbg_continuous: debug state variable to restore PRU execution mode
  * @evt_count: number of mapped events
+ * @gpmux_save: saved value for gpmux config
  */
 struct pru_rproc {
 	int id;
@@ -128,6 +129,7 @@ struct pru_rproc {
 	u32 dbg_single_step;
 	u32 dbg_continuous;
 	u8 evt_count;
+	u8 gpmux_save;
 };
 
 static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
@@ -229,6 +231,7 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	struct device *dev;
 	const char *fw_name;
 	int ret;
+	u32 mux;
 
 	rproc = __pru_rproc_get(np, index);
 	if (IS_ERR(rproc))
@@ -253,6 +256,23 @@ struct rproc *pru_rproc_get(struct device_node *np, int index,
 	if (pru_id)
 		*pru_id = pru->id;
 
+	ret = pruss_cfg_get_gpmux(pru->pruss, pru->id, &pru->gpmux_save);
+	if (ret) {
+		dev_err(dev, "failed to get cfg gpmux: %d\n", ret);
+		goto err;
+	}
+
+	/* An error here is acceptable for backward compatibility */
+	ret = of_property_read_u32_index(np, "ti,pruss-gp-mux-sel", index,
+					 &mux);
+	if (!ret) {
+		ret = pruss_cfg_set_gpmux(pru->pruss, pru->id, mux);
+		if (ret) {
+			dev_err(dev, "failed to set cfg gpmux: %d\n", ret);
+			goto err;
+		}
+	}
+
 	ret = of_property_read_string_index(np, "firmware-name", index,
 					    &fw_name);
 	if (!ret) {
@@ -291,6 +311,8 @@ void pru_rproc_put(struct rproc *rproc)
 
 	pru = rproc->priv;
 
+	pruss_cfg_set_gpmux(pru->pruss, pru->id, pru->gpmux_save);
+
 	pru_rproc_set_firmware(rproc, NULL);
 
 	mutex_lock(&pru->lock);
-- 
2.34.1

