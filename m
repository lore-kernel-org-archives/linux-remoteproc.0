Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17478CCA47C
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Jun 2022 10:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbiFBKTj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Jun 2022 06:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbiFBKTg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Jun 2022 06:19:36 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB4A297508;
        Thu,  2 Jun 2022 03:19:34 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 252AJWqb046218;
        Thu, 2 Jun 2022 05:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1654165172;
        bh=TcQDl1uLZdWGzW+QJb1P8sNXIjyeW2FbcvT3/624XIc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mHLvqJR4ibQhNzkAHBXIyfQs/QK3js6geuKBjizOn1AYZ/6r/JQE3Pgd7OdO17r6e
         n7YsV35yZU6DmPRznwyBcCnHr3TYRuqr5O/HWKBclgGK3rXNx2AZg3h00Nxh4a/MET
         58mbFEiSI8wqP220q+WgBHQGvMrHx5pKLZjq2mr0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 252AJWJM009737
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jun 2022 05:19:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Jun 2022 05:19:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Jun 2022 05:19:32 -0500
Received: from a0393678ub.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 252AJKGF063560;
        Thu, 2 Jun 2022 05:19:29 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Suman Anna <s-anna@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] remoteproc: pru: Add support for various PRU cores on K3 AM62x SoCs
Date:   Thu, 2 Jun 2022 15:49:20 +0530
Message-ID: <20220602101920.12504-4-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220602101920.12504-1-kishon@ti.com>
References: <20220602101920.12504-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The K3 AM62x family of SoC has one PRUSS-M instance and it has two
Programmable Real-Time Units (PRU0 and PRU1). This does not support
Industrial Communications Subsystem features like Ethernet.

Enhance the existing PRU remoteproc driver to support the PRU cores
by using specific compatibles. The initial names for the firmware
images for each PRU core are retrieved from DT nodes, and can be adjusted
through sysfs if required.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 1777a01fa84e..128bf9912f2c 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -897,6 +897,7 @@ static const struct of_device_id pru_rproc_match[] = {
 	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
 	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
 	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
+	{ .compatible = "ti,am625-pru",		.data = &k3_pru_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pru_rproc_match);
-- 
2.17.1

