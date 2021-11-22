Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A02FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 12:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235119AbhKVMdG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:33:06 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59114 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbhKVMdG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 07:33:06 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCTuaC110096;
        Mon, 22 Nov 2021 06:29:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1637584196;
        bh=HkO7IvYUeIEpfOuzz+wJ7e4lEw9YlwMoFgvzm1eI1xQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gj5yOcQdpk5Bap8MQFQ/mGcBS7/bEiypHP305ZLQCiAIUtxqth5DoQuwnX0VSHyxJ
         Z6Wd5jjth2V6oCVMh78l1bZ0F6dqNN5gfOHLS5/KKG+VH12yhkE/LOPfpgWvkwO3VZ
         jaF3xUssImdrx7CSDLJiYn3CWFiJXlicd7P+vC88=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AMCTuF4114661
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Nov 2021 06:29:56 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 22
 Nov 2021 06:27:49 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 22 Nov 2021 06:27:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRn15063556;
        Mon, 22 Nov 2021 06:27:49 -0600
From:   Hari Nagalla <hnagalla@ti.com>
To:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <a-govindraju@ti.com>
Subject: [PATCH 4/4] remoteproc: k3-r5: Extend support for R5F clusters on J721S2 SoCs
Date:   Mon, 22 Nov 2021 06:27:26 -0600
Message-ID: <20211122122726.8532-5-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122122726.8532-1-hnagalla@ti.com>
References: <20211122122726.8532-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The K3 J721S2 SoCs have three dual-core R5F subsystems, one in MCU voltage
domain and the other two in MAIN voltage domain. These R5F clusters are
similar to the R5F clusters in J7200 SoCs.

Compatible Info is updated to support J721S2 SoCs.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 6499302d00c3..969531c05b13 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1535,7 +1535,7 @@ static const struct k3_r5_soc_data am65_j721e_soc_data = {
 	.single_cpu_mode = false,
 };
 
-static const struct k3_r5_soc_data j7200_soc_data = {
+static const struct k3_r5_soc_data j7200_j721s2_soc_data = {
 	.tcm_is_double = true,
 	.tcm_ecc_autoinit = true,
 	.single_cpu_mode = false,
@@ -1550,8 +1550,9 @@ static const struct k3_r5_soc_data am64_soc_data = {
 static const struct of_device_id k3_r5_of_match[] = {
 	{ .compatible = "ti,am654-r5fss", .data = &am65_j721e_soc_data, },
 	{ .compatible = "ti,j721e-r5fss", .data = &am65_j721e_soc_data, },
-	{ .compatible = "ti,j7200-r5fss", .data = &j7200_soc_data, },
+	{ .compatible = "ti,j7200-r5fss", .data = &j7200_j721s2_soc_data, },
 	{ .compatible = "ti,am64-r5fss",  .data = &am64_soc_data, },
+	{ .compatible = "ti,j721s2-r5fss",  .data = &j7200_j721s2_soc_data, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, k3_r5_of_match);
-- 
2.17.1

