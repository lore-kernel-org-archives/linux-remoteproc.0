Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3163EC6379D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 01:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA8F7246E1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 01:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BrNxKzRK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgKSBF6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 20:05:58 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56774 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgKSBF6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 20:05:58 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJ15qOo070018;
        Wed, 18 Nov 2020 19:05:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605747952;
        bh=5PHh617lCH6Ug2fKlt6PCR+qvi9MScqYVwoln/9DNHg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BrNxKzRK2gAgNeFnlbq8v6FmpQ3NE+Xw/AnMW0bUBxBbYrHma8XZF3shJV/rEZlQB
         6w3Eaefncw7J6tfezlhwAJmDHrBsxkhe3Iv5EkHGtULn8qtuSvRKEUSfOSdIVPmU5E
         uq5L2Tung0bUszlRfQeEIzHC1Klm+VT5Y0nGJgB4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJ15qpR052456
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Nov 2020 19:05:52 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 19:05:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 19:05:52 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJ15qWP029382;
        Wed, 18 Nov 2020 19:05:52 -0600
Received: from localhost ([10.250.38.244])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0AJ15qRa076072;
        Wed, 18 Nov 2020 19:05:52 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/3] remoteproc: k3-r5: Extend support to R5F clusters on J7200 SoCs
Date:   Wed, 18 Nov 2020 19:05:30 -0600
Message-ID: <20201119010531.21083-3-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201119010531.21083-1-s-anna@ti.com>
References: <20201119010531.21083-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The K3 J7200 SoC family has a revised R5F sub-system and contains a
subset of the R5F clusters present on J721E SoCs. The K3 J7200 SoCs
only have two dual-core Arm R5F clusters/subsystems with 2 R5F cores
each. One cluster is present within the MCU voltage domain (MCU_R5FSS0),
while the other is present in the MAIN voltage domain (MAIN_R5FSS0).

The revised IP has the following two new features:
 1. TCMs are auto-initialized during module power-up, and the behavior
    is programmable through a MMR bit.
 2. The LockStep-mode allows the Core1 TCMs to be combined with the
    Core0 TCMs effectively doubling the amount of TCMs available.
    The LockStep-mode on previous SoCs could only use the Core0 TCMs.
    This combined TCMs appear contiguous at the respective Core0 TCM
    addresses.

Extend the support to these clusters in the K3 R5F remoteproc driver
using J7200 specific compatibles. Logic for the second feature is
added in the next patch. The integration of these clusters is very
much similar to J721E SoCs otherwise.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 52 +++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 40fa7a4d2ec8..66a32dcdd7d0 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -38,6 +38,8 @@
 #define PROC_BOOT_CFG_FLAG_R5_TCM_RSTBASE		0x00000800
 #define PROC_BOOT_CFG_FLAG_R5_BTCM_EN			0x00001000
 #define PROC_BOOT_CFG_FLAG_R5_ATCM_EN			0x00002000
+/* Available from J7200 SoCs onwards */
+#define PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS		0x00004000
 
 /* R5 TI-SCI Processor Control Flags */
 #define PROC_BOOT_CTRL_FLAG_R5_CORE_HALT		0x00000001
@@ -67,16 +69,26 @@ enum cluster_mode {
 	CLUSTER_MODE_LOCKSTEP,
 };
 
+/**
+ * struct k3_r5_soc_data - match data to handle SoC variations
+ * @tcm_ecc_autoinit: flag to denote the auto-initialization of TCMs for ECC
+ */
+struct k3_r5_soc_data {
+	bool tcm_ecc_autoinit;
+};
+
 /**
  * struct k3_r5_cluster - K3 R5F Cluster structure
  * @dev: cached device pointer
  * @mode: Mode to configure the Cluster - Split or LockStep
  * @cores: list of R5 cores within the cluster
+ * @soc_data: SoC-specific feature data for a R5FSS
  */
 struct k3_r5_cluster {
 	struct device *dev;
 	enum cluster_mode mode;
 	struct list_head cores;
+	const struct k3_r5_soc_data *soc_data;
 };
 
 /**
@@ -362,8 +374,16 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 	struct k3_r5_cluster *cluster = kproc->cluster;
 	struct k3_r5_core *core = kproc->core;
 	struct device *dev = kproc->dev;
+	u32 ctrl = 0, cfg = 0, stat = 0;
+	u64 boot_vec = 0;
+	bool mem_init_dis;
 	int ret;
 
+	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
+	if (ret < 0)
+		return ret;
+	mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
+
 	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP) ?
 		k3_r5_lockstep_release(cluster) : k3_r5_split_release(core);
 	if (ret) {
@@ -372,6 +392,17 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 		return ret;
 	}
 
+	/*
+	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
+	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
+	 * configurable through System Firmware, the default value does perform
+	 * auto-init, but account for it in case it is disabled
+	 */
+	if (cluster->soc_data->tcm_ecc_autoinit && !mem_init_dis) {
+		dev_dbg(dev, "leveraging h/w init for TCM memories\n");
+		return 0;
+	}
+
 	/*
 	 * Zero out both TCMs unconditionally (access from v8 Arm core is not
 	 * affected by ATCM & BTCM enable configuration values) so that ECC
@@ -1309,15 +1340,23 @@ static int k3_r5_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct k3_r5_cluster *cluster;
+	const struct k3_r5_soc_data *data;
 	int ret;
 	int num_cores;
 
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data) {
+		dev_err(dev, "SoC-specific data is not defined\n");
+		return -ENODEV;
+	}
+
 	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
 	if (!cluster)
 		return -ENOMEM;
 
 	cluster->dev = dev;
 	cluster->mode = CLUSTER_MODE_LOCKSTEP;
+	cluster->soc_data = data;
 	INIT_LIST_HEAD(&cluster->cores);
 
 	ret = of_property_read_u32(np, "ti,cluster-mode", &cluster->mode);
@@ -1367,9 +1406,18 @@ static int k3_r5_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct k3_r5_soc_data am65_j721e_soc_data = {
+	.tcm_ecc_autoinit = false,
+};
+
+static const struct k3_r5_soc_data j7200_soc_data = {
+	.tcm_ecc_autoinit = true,
+};
+
 static const struct of_device_id k3_r5_of_match[] = {
-	{ .compatible = "ti,am654-r5fss", },
-	{ .compatible = "ti,j721e-r5fss", },
+	{ .compatible = "ti,am654-r5fss", .data = &am65_j721e_soc_data, },
+	{ .compatible = "ti,j721e-r5fss", .data = &am65_j721e_soc_data, },
+	{ .compatible = "ti,j7200-r5fss", .data = &j7200_soc_data, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, k3_r5_of_match);
-- 
2.28.0

