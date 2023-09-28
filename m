Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BD3E732E5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Sep 2023 16:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbjI1QAI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Sep 2023 12:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjI1QAH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Sep 2023 12:00:07 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A209D6;
        Thu, 28 Sep 2023 09:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePvu5+jR7kg1r0fcsC5/Vh/JVOD2cevMnVo3wXxe9ppjdTOr6mwUGfo7ZwbSkOjqtY0WWTX+XiyvImTclD0wEYovxaG47AfLhKObmuXfAwbsUSPvD57+2r1XUnRrxK8I3YThI64iwldW7wvdqEUjmL+aviun7Ef1K22KNMrAbnZ8B4eao5K1OmkJBxC6WFGlw0Hg84M58P+a95QAx49epbGgiI5C8jf3mtW4lwtZFQ4DBwKCJLODzw3EoHTHBI1vuc5TYh7LgnFZiniQOexJvPAHWKtbUM5p5/FlSukM5JBTHeFjrh1nbFruPsP98exS8YyL3FEmt1xpkBTa3EsJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo001g7G0kjh1Xv6JBDuR7MoVZ4U9Nspzq3Mt29IKjM=;
 b=JyWFJJavmVBw7PJqWfMFbkvkfu9e9uz1GXrc1KeD4fQE+XbZ9FwaooDlXN7V4dxaDIpKPny1nMnh8816QDa+rU1p2433TkifeATkyxht0NxY4zNNQzHLrn8qQH6FJrPEZaTxwKCk7WBwa5B4qHatcbyJ/9lJlAAq9MbeG10rZhk5cNuL9uwVhZaqC+SugoqBdSVNwT3AhDwz3x/pty4asm0Nz+l4iDgpjUvy+u2YdP+7FdA0lPXvsOniS33fVQ9iriB6n9799xMK2wG77QNzDrJWZDsyS2sSEKBBFnJsmmgyIaYJksFiGh6Sf279hAuTXs0CLjVuiz8K1zCoaJOVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo001g7G0kjh1Xv6JBDuR7MoVZ4U9Nspzq3Mt29IKjM=;
 b=GZXerfGxBaXNqNJgR2aiNGJUvCxVH/KBP+1cJo6vX1ZDs5Zz2qk2Kq/NeLGvMb6uzB1jhKBfwviCARgeaDixpAQcuvLOQtYURM+PQqW21EWs3HqcGkTRntawWcnFg5EEh2eNNUU4SF7r68LX7a6a0E/ck51rDtACKKe5N4Cw8ro=
Received: from DS7PR03CA0227.namprd03.prod.outlook.com (2603:10b6:5:3ba::22)
 by PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 16:00:03 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::ac) by DS7PR03CA0227.outlook.office365.com
 (2603:10b6:5:3ba::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Thu, 28 Sep 2023 16:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 16:00:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 10:59:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 10:59:56 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 28 Sep 2023 10:59:55 -0500
From:   Tanmay Shah <tanmay.shah@amd.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@amd.com>
CC:     <radhey.shyam.pandey@amd.com>, <tanmay.shah@amd.com>,
        <ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 4/4] remoteproc: zynqmp: parse TCM from device tree
Date:   Thu, 28 Sep 2023 08:59:00 -0700
Message-ID: <20230928155900.3987103-5-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928155900.3987103-1-tanmay.shah@amd.com>
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|PH0PR12MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c86d00-6ec9-4941-38de-08dbc03bf9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzKR42/shRYe7oFKOeQ4Fkd5vLKQ7yl7D8wAf//LMPQP5lohxVpVQWkyF7KN/N+mgrUiqO+7P1MXiLkFX7B1lsqDr5VZEHrjvZx0ZGLHXIOoeVGOaex7RcBpwo2vlnyAsZceWF+eqxgX7Se5tkFZ4ZSpOPWcmGxb/eUK8FDRfcd1aGQpAd89i+5tmY5SOfTSpbVZSjDCKBc+GgO6ZvLZY0wsxWni3XpYxWNSJs4BzGbdkueB2N55fPVyWKWKA1KhayitOoixiqZw7LvE5twdsy8xZDaYl/xFHO1ETD7DFmXFvEKKYnmQrvVgw7BX6Es7eH2r2bgXfkGPvufoRJnRF6SF2zkuv9otVNAYt628E1bfXWP3CB/RycPbq6/phpDneTCfMX0QhKCgWAssBanPPMMcg6p0qRrXVLMf4PKSBMYfaYQqoDgFeZlFVbW4cyoSCRUsCNbBk4oQir6cainEl3KwhFzieImazT3JbN6wAMAux7lAF80nNml3p3nOcqiOeaZvPUfBsQoTS9ieMjxn4YG2mOqM7Bb6SGdpSsBymyMNIpUz5Dyb6e8qofg/hAd0xyP+HSjo8jUGHHEaLBHgvgeHu4wy0nI7S+TObQXVhoOQbrOURp8WQczSsLWoVbAoqUzgwkZEQuTGsoi+vRy0AfQG3JPD8VgYvDnnRgkXZAmAdpqcFR1W2Zy3IWRU3pOI1u3wZ76WJTT/IjrSYcRJST8bFe+nsHi2+2dPujfXenxkG916pi82bVt1oDU0ETI+svUvGoOiLo7gKh5a8/WyWw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(2906002)(6666004)(1076003)(2616005)(110136005)(70206006)(70586007)(86362001)(478600001)(54906003)(47076005)(36860700001)(336012)(426003)(82740400003)(26005)(83380400001)(356005)(81166007)(6636002)(36756003)(5660300002)(44832011)(40480700001)(316002)(4326008)(41300700001)(8676002)(8936002)(66899024)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:00:03.2132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c86d00-6ec9-4941-38de-08dbc03bf9ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8773
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

ZynqMP TCM information is fixed in driver. Now ZynqMP TCM information
is available in device-tree. Parse TCM information in driver
as per new bindings

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 122 ++++++++++++++++++++++--
 1 file changed, 114 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 27ed2c070ebb..749e9da68906 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -75,8 +75,8 @@ struct mbox_info {
 };
 
 /*
- * Hardcoded TCM bank values. This will be removed once TCM bindings are
- * accepted for system-dt specifications and upstreamed in linux kernel
+ * Hardcoded TCM bank values. This will stay in driver to maintain backward
+ * compatibility with device-tree that does not have TCM information.
  */
 static const struct mem_bank_data zynqmp_tcm_banks_split[] = {
 	{0xffe00000UL, 0x0, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each */
@@ -613,7 +613,8 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
 						 bank_name);
 		if (!rproc_mem) {
 			ret = -ENOMEM;
-			zynqmp_pm_release_node(pm_domain_id);
+			if (pm_domain_id)
+				zynqmp_pm_release_node(pm_domain_id);
 			goto release_tcm_split;
 		}
 
@@ -626,7 +627,8 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
 	/* If failed, Turn off all TCM banks turned on before */
 	for (i--; i >= 0; i--) {
 		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
-		zynqmp_pm_release_node(pm_domain_id);
+		if (pm_domain_id)
+			zynqmp_pm_release_node(pm_domain_id);
 	}
 	return ret;
 }
@@ -1064,6 +1066,107 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	return ERR_PTR(ret);
 }
 
+static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
+{
+	int i, j, tcm_bank_count, ret = -EINVAL;
+	struct zynqmp_r5_core *r5_core;
+	struct platform_device *cpdev;
+	struct resource *res = NULL;
+	u64 abs_addr = 0, size = 0;
+	struct mem_bank_data *tcm;
+	struct device_node *np;
+	struct device *dev;
+
+	for (i = 0; i < cluster->core_count; i++) {
+		r5_core = cluster->r5_cores[i];
+		dev = r5_core->dev;
+		np = dev_of_node(dev);
+
+		/* we have address cell 2 and size cell as 2 */
+		ret = of_property_count_elems_of_size(np, "reg",
+						      4 * sizeof(u32));
+		if (ret == 0) {
+			ret = -EINVAL;
+			goto fail_tcm;
+		}
+		if (ret < 0)
+			goto fail_tcm;
+
+		tcm_bank_count = ret;
+
+		r5_core->tcm_banks = devm_kcalloc(dev, tcm_bank_count,
+						  sizeof(struct mem_bank_data *),
+						  GFP_KERNEL);
+		if (!r5_core->tcm_banks) {
+			ret = -ENOMEM;
+			goto fail_tcm;
+		}
+
+		r5_core->tcm_bank_count = tcm_bank_count;
+		for (j = 0; j < tcm_bank_count; j++) {
+			tcm = devm_kzalloc(dev, sizeof(struct mem_bank_data *),
+					   GFP_KERNEL);
+			if (!tcm) {
+				ret = -ENOMEM;
+				goto fail_tcm;
+			}
+
+			r5_core->tcm_banks[j] = tcm;
+
+			/* get tcm address without translation */
+			ret = of_property_read_reg(np, j, &abs_addr, &size);
+			if (ret) {
+				dev_err(dev, "failed to get reg property\n");
+				goto fail_tcm;
+			}
+
+			/*
+			 * remote processor can address only 32 bits
+			 * so convert 64-bits into 32-bits. This will discard
+			 * any unwanted upper 32-bits.
+			 */
+			tcm->da = (u32)abs_addr;
+			tcm->size = (u32)size;
+
+			cpdev = to_platform_device(dev);
+			res = platform_get_resource(cpdev, IORESOURCE_MEM, j);
+			if (!res) {
+				dev_err(dev, "failed to get tcm resource\n");
+				ret = -EINVAL;
+				goto fail_tcm;
+			}
+
+			tcm->addr = (u32)res->start;
+			tcm->bank_name = (char *)res->name;
+			res = devm_request_mem_region(dev, tcm->addr, tcm->size,
+						      tcm->bank_name);
+			if (!res) {
+				dev_err(dev, "failed to request tcm resource\n");
+				ret = -EINVAL;
+				goto fail_tcm;
+			}
+		}
+	}
+
+	return 0;
+
+fail_tcm:
+	while (i >= 0) {
+		r5_core = cluster->r5_cores[i];
+		for (j = 0; j < r5_core->tcm_bank_count; j++) {
+			if (!r5_core->tcm_banks || !r5_core->tcm_banks[j])
+				continue;
+			tcm = r5_core->tcm_banks[j];
+			devm_kfree(r5_core->dev, tcm);
+		}
+		devm_kfree(r5_core->dev, r5_core->tcm_banks);
+		r5_core->tcm_banks = NULL;
+		i--;
+	}
+
+	return ret;
+}
+
 /**
  * zynqmp_r5_get_tcm_node()
  * Ideally this function should parse tcm node and store information
@@ -1142,10 +1245,13 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 	struct zynqmp_r5_core *r5_core;
 	int ret, i;
 
-	ret = zynqmp_r5_get_tcm_node(cluster);
-	if (ret < 0) {
-		dev_err(dev, "can't get tcm node, err %d\n", ret);
-		return ret;
+	ret = zynqmp_r5_get_tcm_node_from_dt(cluster);
+	if (ret) {
+		ret = zynqmp_r5_get_tcm_node(cluster);
+		if (ret < 0) {
+			dev_err(dev, "can't get tcm node, err %d\n", ret);
+			return ret;
+		}
 	}
 
 	for (i = 0; i < cluster->core_count; i++) {
-- 
2.25.1

