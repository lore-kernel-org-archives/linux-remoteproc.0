Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A33E732E9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Sep 2023 16:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbjI1QAC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Sep 2023 12:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjI1QAB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Sep 2023 12:00:01 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D0CD6;
        Thu, 28 Sep 2023 08:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auj+jT753LMms/vJXI7gHhXtImVx53ei3rhAt1MABoFOIDq78h3efeB3m4nQ4nX5Hk3zJdeFt/NoMnnbqAFCZDdub4Q3RAt4pDbSI6nwKfYXwSwEDoL57yBglGaFZQzv/h9xM/e0bYyPD8UUrnrlSiZxtfS2IApFfLp5RWiwV6DRgH1JvW4evRTzyifqYM7OEk6Gx6iBiuHyVlhPcIlRHu6kvjcS6Xz/02MMhaUvn+Pi/H208mg3MIDscItzgAwFLwrY0XDyBZYGSYj9BYlCBy6kzF9Vr0DUxmfLualDaX/Zs+e4YWz6PIw4PQ+GM0kikrO8p9SmVgD0Qm038+/VTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jHgV347eJb960s+ewl0DsRFPKGiNqcwAmiilwfAxk4=;
 b=JUnJgIEQ/2aG0YxERk/MIokCCTmRy+hGyN7Icu71cLXhSni/XGCMc1hrYj3Zet/FTTvCeSG4bwgqCFq7x/2vxfX1mLLpyAUUN78qvcHnGSLeNC5tOEjKBbMVH5vVUDHbfbwBjgjOa4HGIUSeMv6gjXk4XdOjB/NsoVV9gSD2AmC/kuJVlIRUXUjIQoQbe0cAW2RC7pxFYTl1MjudIDtn7c0Z5A1CYpcrEdPNj7xJlU1N5oZmCailXMzb5sCMPQ+uaD4u0s82Lw7Z2ZRBmxzAWLznbdJKmDhEg5JMwX7TjIC4sqCjK143Bzs8vGhGBliiogHp8hu9Wks/3kowBbNIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jHgV347eJb960s+ewl0DsRFPKGiNqcwAmiilwfAxk4=;
 b=HoeakUjpNExMib9wuqTiDmd7N8sCOEK++1AlOML8OB9cw+amymKtwUDBh/kUvQw+Akx9ffMQIcssIvIqr6XgbNa2IliCsB3HPrRoe2fKjKHjHtCxD/1yHU+pucC6GstZCkCZ93F5pD9l5fUL17NzVHNhAKgXaAa+jJxGYd+2wUg=
Received: from DM6PR02CA0093.namprd02.prod.outlook.com (2603:10b6:5:1f4::34)
 by PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 28 Sep
 2023 15:59:57 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::cd) by DM6PR02CA0093.outlook.office365.com
 (2603:10b6:5:1f4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Thu, 28 Sep 2023 15:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 15:59:57 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 10:59:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 08:59:23 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 28 Sep 2023 10:59:23 -0500
From:   Tanmay Shah <tanmay.shah@amd.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@amd.com>
CC:     <radhey.shyam.pandey@amd.com>, <tanmay.shah@amd.com>,
        <ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 3/4] remoteproc: zynqmp: add pm domains support
Date:   Thu, 28 Sep 2023 08:58:59 -0700
Message-ID: <20230928155900.3987103-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928155900.3987103-1-tanmay.shah@amd.com>
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: fc554264-c10f-40bb-f0a2-08dbc03bf666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ma3L2emzTVD99zdiEuE6Sx/xFGkFDWx1nNoLXTVOoWu/0ERNrWDYHpkzUfWcm+wefmly8cd6DhSmdjxhedoLM7yWKsxXUdOqa4UlDFo9ocd/w8fbhAFIVT6fpbOa/8CyOvyzVUbDvvEAPRWVcbcDsDb6gFR9WZVkcSVrF9bLJ5Oesf2bBPURfn+EuVZCGNlNm9hNSsa6s0HoiXHHN93b3EDPFUmJF0jEcl92DHOJhltRPewv63kkjQEKII9RJekiz0tK5+l8ykqxQZpZ1N/GKHwNnpue3VfF8SKr020NT7G8SYLK1Kl1VlcWPYiijLj8RD6sineHFuCULVNMoIV0mAh0vC7g5am5ZzaJXSUJ8C2RnsrjQz6qiUduMSTNoHEHf7DgPvE1KFD30hKTKNiQXMa86aWzWGiHFwCgce6s0v+H+XzJx8Zqu5HFUdlqEcpOuXa0PG5yAt29QY51GJeJ9nB4a4xRaUV5AMzAiNEMdF57QLCC0idnXcn97zHrunFuL5H3YevysNoIe+5zaH8g/2y1VMm8RbmOGVRGUH640/6s7uFaNhNoTVB1ARsIIX4VcUYPkFy2tHZ0rhCmwRngxQ7MWh7hXXQNdyPENLnh1cK4eOtTs+O6A3NbLw4Brd4cKPGIKlYzi6vHw35HJei1xpIGgcfs+lP/iuNb27uXFz0MUwkrzbkwS+Vg7bETWfmifEVxJyY4k7LLlkRkBdqKMWUn/zfa18TIJBz+gUGIIbue8j+xcYa2NID0/C99GQ65Fcor4bOgI2P+HLy8X7PRag==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(64100799003)(82310400011)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(356005)(8676002)(2616005)(41300700001)(2906002)(26005)(82740400003)(36756003)(8936002)(44832011)(6666004)(36860700001)(1076003)(6636002)(47076005)(478600001)(81166007)(4326008)(86362001)(316002)(54906003)(40460700003)(426003)(336012)(110136005)(5660300002)(40480700001)(83380400001)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:59:57.1977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc554264-c10f-40bb-f0a2-08dbc03bf666
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use TCM pm domains extracted from device-tree
to power on/off TCM using general pm domain framework

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 224 ++++++++++++++++++++++--
 1 file changed, 205 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 4395edea9a64..27ed2c070ebb 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -16,6 +16,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
+#include <linux/pm_domain.h>
 
 #include "remoteproc_internal.h"
 
@@ -102,6 +103,12 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  * @rproc: rproc handle
  * @pm_domain_id: RPU CPU power domain id
  * @ipi: pointer to mailbox information
+ * @num_pm_dev: number of tcm pm domain devices for this core
+ * @pm_dev1: pm domain virtual devices for power domain framework
+ * @pm_dev_link1: pm domain device links after registration
+ * @pm_dev2: used only in lockstep mode. second core's pm domain virtual devices
+ * @pm_dev_link2: used only in lockstep mode. second core's pm device links after
+ * registration
  */
 struct zynqmp_r5_core {
 	struct device *dev;
@@ -111,6 +118,11 @@ struct zynqmp_r5_core {
 	struct rproc *rproc;
 	u32 pm_domain_id;
 	struct mbox_info *ipi;
+	int num_pm_dev;
+	struct device **pm_dev1;
+	struct device_link **pm_dev_link1;
+	struct device **pm_dev2;
+	struct device_link **pm_dev_link2;
 };
 
 /**
@@ -575,12 +587,21 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
 		bank_size = r5_core->tcm_banks[i]->size;
 		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
 
-		ret = zynqmp_pm_request_node(pm_domain_id,
-					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
-					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
-		if (ret < 0) {
-			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
-			goto release_tcm_split;
+		/*
+		 * If TCM information is available in device-tree then
+		 * in that case, pm domain framework will power on/off TCM.
+		 * In that case pm_domain_id is set to 0. If hardcode
+		 * bindings from driver is used, then only this driver will
+		 * use pm_domain_id.
+		 */
+		if (pm_domain_id) {
+			ret = zynqmp_pm_request_node(pm_domain_id,
+						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+			if (ret < 0) {
+				dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
+				goto release_tcm_split;
+			}
 		}
 
 		dev_dbg(dev, "TCM carveout split mode %s addr=%llx, da=0x%x, size=0x%lx",
@@ -646,13 +667,16 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
 	for (i = 0; i < num_banks; i++) {
 		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
 
-		/* Turn on each TCM bank individually */
-		ret = zynqmp_pm_request_node(pm_domain_id,
-					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
-					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
-		if (ret < 0) {
-			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
-			goto release_tcm_lockstep;
+		if (pm_domain_id) {
+			/* Turn on each TCM bank individually */
+			ret = zynqmp_pm_request_node(pm_domain_id,
+						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+			if (ret < 0) {
+				dev_err(dev, "failed to turn on TCM 0x%x",
+					pm_domain_id);
+				goto release_tcm_lockstep;
+			}
 		}
 
 		bank_size = r5_core->tcm_banks[i]->size;
@@ -687,8 +711,10 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
 	/* If failed, Turn off all TCM banks turned on before */
 	for (i--; i >= 0; i--) {
 		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
-		zynqmp_pm_release_node(pm_domain_id);
+		if (pm_domain_id)
+			zynqmp_pm_release_node(pm_domain_id);
 	}
+
 	return ret;
 }
 
@@ -758,6 +784,153 @@ static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static void zynqmp_r5_remove_pm_domains(struct rproc *rproc)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	struct device *dev = r5_core->dev;
+	struct zynqmp_r5_cluster *cluster;
+	int i;
+
+	cluster = platform_get_drvdata(to_platform_device(dev->parent));
+
+	for (i = 0; i < r5_core->num_pm_dev; i++) {
+		if (r5_core->pm_dev_link1 && r5_core->pm_dev_link1[i])
+			device_link_del(r5_core->pm_dev_link1[i]);
+		if (r5_core->pm_dev1 && !IS_ERR_OR_NULL(r5_core->pm_dev1[i]))
+			dev_pm_domain_detach(r5_core->pm_dev1[i], false);
+	}
+
+	kfree(r5_core->pm_dev1);
+	r5_core->pm_dev1 = NULL;
+	kfree(r5_core->pm_dev_link1);
+	r5_core->pm_dev_link1 = NULL;
+
+	if (cluster->mode == SPLIT_MODE) {
+		r5_core->num_pm_dev = 0;
+		return;
+	}
+
+	for (i = 0; i < r5_core->num_pm_dev; i++) {
+		if (r5_core->pm_dev_link2 && r5_core->pm_dev_link2[i])
+			device_link_del(r5_core->pm_dev_link2[i]);
+		if (r5_core->pm_dev2 && !IS_ERR_OR_NULL(r5_core->pm_dev2[i]))
+			dev_pm_domain_detach(r5_core->pm_dev2[i], false);
+	}
+
+	kfree(r5_core->pm_dev2);
+	r5_core->pm_dev2 = NULL;
+	kfree(r5_core->pm_dev_link2);
+	r5_core->pm_dev_link2 = NULL;
+	r5_core->num_pm_dev = 0;
+}
+
+static int zynqmp_r5_add_pm_domains(struct rproc *rproc)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	struct device *dev = r5_core->dev, *dev2;
+	struct zynqmp_r5_cluster *cluster;
+	struct platform_device *pdev;
+	struct device_node *np;
+	int i, num_pm_dev, ret;
+
+	cluster = platform_get_drvdata(to_platform_device(dev->parent));
+
+	/* get number of power-domains */
+	num_pm_dev = of_count_phandle_with_args(r5_core->np, "power-domains",
+						"#power-domain-cells");
+
+	if (num_pm_dev <= 0)
+		return -EINVAL;
+
+	r5_core->pm_dev1 = kcalloc(num_pm_dev,
+				   sizeof(struct device *),
+				   GFP_KERNEL);
+	if (!r5_core->pm_dev1)
+		ret = -ENOMEM;
+
+	r5_core->pm_dev_link1 = kcalloc(num_pm_dev,
+					sizeof(struct device_link *),
+					GFP_KERNEL);
+	if (!r5_core->pm_dev_link1)
+		return -ENOMEM;
+
+	r5_core->num_pm_dev = num_pm_dev;
+
+	/* for zynqmp we only add TCM power domains and not core's power domain */
+	for (i = 1; i < r5_core->num_pm_dev; i++) {
+		r5_core->pm_dev1[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (IS_ERR(r5_core->pm_dev1[i])) {
+			dev_dbg(dev, "failed to attach pm domain %d\n", i);
+			return PTR_ERR(r5_core->pm_dev1[i]);
+		}
+		if (!r5_core->pm_dev1[i]) {
+			dev_dbg(dev, "can't attach to pm domain %d\n", i);
+			return -EINVAL;
+		}
+
+		r5_core->pm_dev_link1[i] = device_link_add(dev, r5_core->pm_dev1[i],
+							   DL_FLAG_STATELESS |
+							   DL_FLAG_RPM_ACTIVE |
+							   DL_FLAG_PM_RUNTIME);
+		if (!r5_core->pm_dev_link1[i]) {
+			dev_pm_domain_detach(r5_core->pm_dev1[i], true);
+			r5_core->pm_dev1[i] = NULL;
+			return -EINVAL;
+		}
+	}
+
+	if (cluster->mode == SPLIT_MODE)
+		return 0;
+
+	r5_core->pm_dev2 = kcalloc(num_pm_dev,
+				   sizeof(struct device *),
+				   GFP_KERNEL);
+	if (!r5_core->pm_dev2)
+		return -ENOMEM;
+
+	r5_core->pm_dev_link2 = kcalloc(num_pm_dev,
+					sizeof(struct device_link *),
+					GFP_KERNEL);
+	if (!r5_core->pm_dev_link2)
+		return -ENOMEM;
+
+	/* get second core's device to detach its power-domains */
+	np = of_get_next_child(cluster->dev->of_node, of_node_get(dev->of_node));
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev) {
+		dev_err(cluster->dev, "core1 platform device not available\n");
+		return -EINVAL;
+	}
+
+	dev2 = &pdev->dev;
+
+	/* for zynqmp we only add TCM power domains and not core's power domain */
+	for (i = 1; i < r5_core->num_pm_dev; i++) {
+		r5_core->pm_dev2[i] = dev_pm_domain_attach_by_id(dev2, i);
+		if (IS_ERR(r5_core->pm_dev2[i])) {
+			dev_dbg(dev, "can't attach to pm domain %d\n", i);
+			return PTR_ERR(r5_core->pm_dev2[i]);
+		}
+		if (!r5_core->pm_dev2[i]) {
+			dev_dbg(dev, "can't attach to pm domain %d\n", i);
+			return -EINVAL;
+		}
+
+		r5_core->pm_dev_link2[i] = device_link_add(dev, r5_core->pm_dev2[i],
+							   DL_FLAG_STATELESS |
+							   DL_FLAG_RPM_ACTIVE |
+							   DL_FLAG_PM_RUNTIME);
+		if (!r5_core->pm_dev_link2[i]) {
+			dev_pm_domain_detach(r5_core->pm_dev2[i], true);
+			r5_core->pm_dev2[i] = NULL;
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * zynqmp_r5_rproc_prepare()
  * adds carveouts for TCM bank and reserved memory regions
@@ -770,19 +943,30 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
 {
 	int ret;
 
+	ret = zynqmp_r5_add_pm_domains(rproc);
+	if (ret) {
+		dev_err(&rproc->dev, "failed to add pm domains\n");
+		goto fail_prepare;
+	}
+
 	ret = add_tcm_banks(rproc);
 	if (ret) {
 		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
-		return ret;
+		goto fail_prepare;
 	}
 
 	ret = add_mem_regions_carveout(rproc);
 	if (ret) {
 		dev_err(&rproc->dev, "failed to get reserve mem regions %d\n", ret);
-		return ret;
+		goto fail_prepare;
 	}
 
 	return 0;
+
+fail_prepare:
+	zynqmp_r5_remove_pm_domains(rproc);
+
+	return ret;
 }
 
 /**
@@ -801,11 +985,13 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
 
 	r5_core = rproc->priv;
 
+	zynqmp_r5_remove_pm_domains(rproc);
+
 	for (i = 0; i < r5_core->tcm_bank_count; i++) {
 		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
-		if (zynqmp_pm_release_node(pm_domain_id))
-			dev_warn(r5_core->dev,
-				 "can't turn off TCM bank 0x%x", pm_domain_id);
+		if (pm_domain_id && zynqmp_pm_release_node(pm_domain_id))
+			dev_dbg(r5_core->dev,
+				"can't turn off TCM bank 0x%x", pm_domain_id);
 	}
 
 	return 0;
-- 
2.25.1

