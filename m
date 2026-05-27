Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF72C11F9;
	Wed, 27 May 2026 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779858993; cv=fail; b=Ev/sFXOqC4rnDHpu1P1ix5M+T6aRw8A/1joVTxsn2SjzRRVaUNb7XCxqzKzZIcdeEpaacG+yXnDXwzzCfWUNTXfxeHao4ipaut4q63u3LBWKma82bIFRLx46yQYNsPllrLtplJBWUP8+ihlLOrzWQTgNy10Oyu1vt8Rwhm9/jN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779858993; c=relaxed/simple;
	bh=GbrtKALcGUD8l2E94CiGgBp6+MAjUb/v9l6ku950Bd8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kd9VYt/p/Ji8OxyntL+zXTMZQdlTAB4TUA+EsOkojQutBQ0dGZCWPap1jMJVwOCUY6/gDPq4TAqtq0P+t5THmE5nEi3ETTmC/hoUnx0f1UJhcfPsvXELmTp9lNeFretGTm7Wox+YrgGL//GWM0h21vUK4lxadefKgXXWO4HMBA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vgTjq6Dg; arc=fail smtp.client-ip=52.101.61.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vgTjq6Dg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqyf80RGHATn5k+mkVycN6hxH2dp2hgRVd9jvuoDVMrIB14pf25Xfpdf9uAEzqPWk/muhsfGaTznpOYgRgFF3oHPuxlliS9FuPB2GIZFX39FQ1Xqsl6K13uNkS2rU9jp2Lc2enGzVFmGMyO7T7FX2p2Axv2PVBPLZW7d3chstkmXJ37yS0+SsiLnBLbozGgai88/bqW8REqqErl54zoYRiwPFsLvMhVdqosw5tOrAREWjGtPtn+coyQjaYUa+kzey5x/siy9vuG11K3ddbZfefZf/rxnfWhRRHq67bAI4ruhRhEAyIEYmFNutGHwRQNDTg+376JJZhHHwlwqnpdPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqGZjCsy69BlzaLw5VHyXBuuZ3S4tQVZBgAlVTRCmx8=;
 b=FVuP9kG9d9nOIduxy/thNREgMoqQqivCNKCwtM8UmtkiMLM10j4ibQDgcwRTGI0ymcFwscPmBdLPSX/zRceavyPj6VvUWIImhZfLoQ+xf5swLY4oAQRJsAedhzIofUc2dKHFmRb00VydQ4eyW1wXo2Qeyuo5qN5CwUbSG/4FgH7xzMtAE5a71t+WiPdxq7hk07zEg9JY6T5lFpvBsSUK8bCHEbpbB2d5t+nbxhmNMtrOBtfWV8rIH8eCwO41Mv/JpxkyBLfBh9giURoTVEz5/eiYcYJz7tDzUqZdIG8Z2LDgMNLh3Hh3BpUKq7Y467hGRTzz6SgHEh2mIJ6+mD2cOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqGZjCsy69BlzaLw5VHyXBuuZ3S4tQVZBgAlVTRCmx8=;
 b=vgTjq6DglbsuJf56etkHErkeLo/yCLX7MqsyLWOXaWVQslCUNhzRPQ1BqSvBwJe9tz+HGLgfUul1A3X7YB20pjhAia8vYdfe/lsYYxqt32CzCmsS6Uc/cRWKA1Ce3WWkRve1PU8ngsxQqXe5UFA81fb3yg9/I7RaD/yWCAn8gsc=
Received: from MW4PR04CA0315.namprd04.prod.outlook.com (2603:10b6:303:82::20)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 05:16:26 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::24) by MW4PR04CA0315.outlook.office365.com
 (2603:10b6:303:82::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 05:16:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 05:16:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 00:16:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 00:16:25 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 00:16:24 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] remoteproc: xlnx: enable auto boot feature
Date: Tue, 26 May 2026 22:16:11 -0700
Message-ID: <20260527051611.194844-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527051611.194844-1-tanmay.shah@amd.com>
References: <20260527051611.194844-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af457d8-8010-44cc-3ff2-08debbaf1a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QAgRZKbFgq0AA/LHwb7S9MlAkQhfEaHr1mJV2xmq9/tWYu+ORDMSy9mDNm4gA8do5eNJ1Fe7WtjiCTJRD052XgSGkzag1V/IZXbT0njC+7m/Mbq1vWHvAC9+oUWxnsszJQK8mRhzfrL0Ol4Lzm5mgqqGfMaUd0Mtx/+YOliq5RF+vuPF2Hq4x5BhREIqHH+ZeyuufqVBpZyAGNK2YTD7QvPU84AFgyc3WCDgsnmc3z53M+rE4vPmUaIyOAlfd3TQpQKKfNh4kYq2nyZ7apZQCKGQSKxx12SSuelTDO7Bm+TMV+JLF2R1NPVBIT6OkO+ghxO8DILDDvMBS9XkZiY8yBgCI0VLFOJe2RtvWXQ2OK8IEngbxjonffLuVF5tSBL65MnGn4PL9/k+zknkZcAOnbrIYYClAGcSrgU+4eH+UiVFlikX0N9LaDYiSkXB07UUXlMlVamg5Mku8QNruDy6odAUsJvvmhewauDj+Q5YVXCb+B50GlyPTe8T1618BQC3H68UlgaztfHJMvj20rPg+zJ6HVEe+s91jt5TmgeYoyfO7nMlC7PwtrEzQ7o09WcgW+aGBGxtSMnl1eqWKveP/d8LeaZnh2Xh68gpEGZeZUYbprpaLiFPPqyo8zxGcruYc9RZz0x7tEmIIcSZaTbkZq3TvfsXUlNjH/HPijGLFkxSxrWQ1DDlJoJkvH5NX9VuCnSf+EgGHg94QqP6w3UFSkT3duh89sECCyPLNKdDAQ4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fdx2eIM34+PE8hFPYOyl+XOCxiwbTp93rIhwolXWMpEqyNCS0I9U3NrQdECYCO6K/1z/ss5SsNDQO100ZFtyA4KuT7LOzun+l9uMmZN+TIGve+UCvsE4kKEmA3TTHFqSOu+mXdZ+kBLy1iK0RGgZfZO/SlEhZuDffjxOEpDScsZc1OcvhfN4v0mW/7luF4Jv7VUji9roA436p8Pi5nPcaHRZYkamWXeHoTsF+cB/U5K9tq4SbHhgKAqRr/kCifiBRsXpu2CIU0s9oqWpXqK36YwkX92jZFNwcf+AmYMyr9+VeRrPin0rcA9/CCA0v/Q7lYzfwXK8eCATLIg3tX0Y8w0r4stZvLA6TE1IqK7zhv8Zs7YgsvnGKYqs34gu1rrTmAsUe1J5MqydOBBBonAade4HeZsZ/0Cszr63+wLO7eCxV9oQjkad05pe+RGuoDem
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:16:26.5877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af457d8-8010-44cc-3ff2-08debbaf1a3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621

The remoteproc framework has capability to start (or attach to) the remote
processor automatically if auto boot flag is set by the driver during
probe. If the 'firmware-name' property is available for the remoteproc
node, then that firmware will be loaded and started during auto boot. If
the remote core is started by the bootloader then during auto-boot
remoteproc framework will try to attach to the remote processor.

The current architecture allocates and adds the remoteproc instance before
all the hardware such as sram, mbox, TCM is initialized. This design has
to be changed for auto boot to work. So, rename zynqmp_r5_rproc_add()
function to zynqmp_r5_rproc_alloc() and move adding the remoteproc
instance at the end of cluster initialization. This makes sure that all
the required hardware is initialized before starting the remote
processor.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v3:
  - add more descriptive commit message

 drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 45a62cb98072..652030f9cea2 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 };
 
 /**
- * zynqmp_r5_add_rproc_core() - Add core data to framework.
- * Allocate and add struct rproc object for each r5f core
+ * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
+ * Allocate struct rproc object for each r5f core
  * This is called for each individual r5f core
  *
  * @cdev: Device node of each r5 core
  *
  * Return: zynqmp_r5_core object for success else error code pointer
  */
-static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
+static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
 {
 	struct zynqmp_r5_core *r5_core;
+	const char *fw_name = NULL;
 	struct rproc *r5_rproc;
 	int ret;
 
@@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ERR_PTR(dev_err_probe(cdev, ret,
+					     "failed to parse firmware-name\n"));
+
 	/* Allocate remoteproc instance */
 	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
 			       &zynqmp_r5_rproc_ops,
-			       NULL, sizeof(struct zynqmp_r5_core));
+			       fw_name, sizeof(struct zynqmp_r5_core));
 	if (!r5_rproc) {
 		dev_err(cdev, "failed to allocate memory for rproc instance\n");
 		return ERR_PTR(-ENOMEM);
@@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	r5_rproc->recovery_disabled = true;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
+
+	/* attempt to boot automatically if the firmware-name is provided */
+	if (fw_name)
+		r5_rproc->auto_boot = true;
+
 	r5_core = r5_rproc->priv;
 	r5_core->dev = cdev;
 	r5_core->np = dev_of_node(cdev);
@@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 		goto free_rproc;
 	}
 
-	/* Add R5 remoteproc core */
-	ret = rproc_add(r5_rproc);
-	if (ret) {
-		dev_err(cdev, "failed to add r5 remoteproc\n");
-		goto free_rproc;
-	}
-
 	r5_core->rproc = r5_rproc;
 	return r5_core;
 
@@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 			if (zynqmp_r5_get_rsc_table_va(r5_core))
 				dev_dbg(r5_core->dev, "rsc tbl not found\n");
 			r5_core->rproc->state = RPROC_DETACHED;
+			r5_core->rproc->auto_boot = true;
 		}
 	}
 
@@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	enum rpu_oper_mode fw_reg_val;
 	struct device **child_devs;
 	enum rpu_tcm_comb tcm_mode;
-	int core_count, ret, i;
+	int core_count, ret, i, j;
 	struct mbox_info *ipi;
 
 	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
@@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		child_devs[i] = &child_pdev->dev;
 
 		/* create and add remoteproc instance of type struct rproc */
-		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
+		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
 		if (IS_ERR(r5_cores[i])) {
 			ret = PTR_ERR(r5_cores[i]);
 			r5_cores[i] = NULL;
@@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		goto release_r5_cores;
 	}
 
+	for (j = 0; j < cluster->core_count; j++) {
+		/* Add R5 remoteproc core */
+		ret = rproc_add(r5_cores[j]->rproc);
+		if (ret) {
+			dev_err_probe(r5_cores[j]->dev, ret,
+				      "failed to add remoteproc\n");
+			goto delete_r5_cores;
+		}
+	}
+
 	kfree(child_devs);
 	return 0;
 
+delete_r5_cores:
+	i = core_count - 1;
+	/* delete previous added rproc */
+	while (--j >= 0)
+		rproc_del(r5_cores[j]->rproc);
+
 release_r5_cores:
 	while (i >= 0) {
 		put_device(child_devs[i]);
 		if (r5_cores[i]) {
 			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
 			of_reserved_mem_device_release(r5_cores[i]->dev);
-			rproc_del(r5_cores[i]->rproc);
 			rproc_free(r5_cores[i]->rproc);
 		}
 		i--;
-- 
2.34.1

