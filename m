Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98C21FF45;
	Fri, 20 Jun 2025 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449466; cv=fail; b=Devwy58PGz+lokQA1RB3LH4WolGB6CnfiUoXay3jgr5L0GKpq/crXgf4NkULw7TRj3Z7UZw85aBSoBMznIJPF0co0cfQeL1JY4PNANIh6gmWUfE69gX1xtxiND7wq6of7UOMGtrWITF3NYl1YbFypaOsQ78V0TIyhY9Tul9hBWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449466; c=relaxed/simple;
	bh=8Yuw8gn42ZjuXRhKuq857gk1RXYKtITMAE12G9DfGY4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WC6ATReTMfk5aA7KWV1VKMItbHlHqqLBWH5ZzY0KHt1ZGkuqUd3RliJrDJ9jPUqdXrSD7hFpi+3GS1WUkLA55XVjzh+FyBbDiw2K+suN/rRpBqFspJDBwIocoRbMGW0J7ZeTJMXdmFCtv3Q5EVm5/uKPuDGCzohNPDKh7w1197o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VQVPixsz; arc=fail smtp.client-ip=40.107.93.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VQVPixsz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zM5aYo+RbIlhqKx0u2GHL+d+PG9hh0jWOSVTw04bxE7/nwC4ZGbNE0CUBmYasLQww4qUH6SXhXZIK0MO0e79o6nXB/tJ/IOKWdyvs4WTOwN2ktisth5xyA+TqldnSBLT7l6znLJ9sYOzXSEcXashg1ulD75p2B47RWW+i46/yo7BKShRC0bTX+Rhb8a1Ky4rwGf1e6ilaDQG0YuWFCyL8MixPhkDVLhnkPWZ/puTevmD9A6PpKAvdxeRFSL95mU5EuSmGkDZjDPKIbWtODGLGy1eSJGb1ZQsphLRi9KAxg6Fy3057g10XeVMxvjhSsz1L1wlZ1CyNjggXiVimLoXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdLm2YnXuKwyO4SLRLi1J1oqh9mMbfA6wew4BPkfO8U=;
 b=FFj+3ntnjbs8BbB/j8VPEsMaFjzhofFC5TX4kAYIkmys+eRJRjUmdhQalOy/1Q22F7iwb25RxkbpJM5jLE3xZRY7hOrfpS81z4gYQj+1Y3DpRMolBfdaAOW/wJUlj+FbJV+bEVgu+a0/hTFli1Tnn8yT/TZ0jLMaiYDL3jP2DK2uLH/xyLEKoAbnxIEDjZ2UXqAEoobMy13hQAsG1qwqwQTnzQSxbGgbhHT1RtGQxtimzuCOitUYNfwXn6yDDni1fETLMgADltN7pNoWhXX7HLYklURtsPEFqUJwbiJzKg9j+lFHiaSIiUoM7c2tqFC0cj0RNWXaAwcOoil32LT38g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdLm2YnXuKwyO4SLRLi1J1oqh9mMbfA6wew4BPkfO8U=;
 b=VQVPixszYmwGdjCfCjOMVLM5FzL5xfIpix+kYJMazuKUeRkxeuYDpTT+Ab72JOBETsogjq5sHw82LO/OWPYlkB8wTv8CY9mUU65JBeB34VFTBBw8aBTJAX32NpYQTjoysvVvUBa63tcGaUEIiwj3VC6lA+lkdc+IpX0pvcD9VFU=
Received: from BN1PR12CA0028.namprd12.prod.outlook.com (2603:10b6:408:e1::33)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 19:57:41 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::de) by BN1PR12CA0028.outlook.office365.com
 (2603:10b6:408:e1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.33 via Frontend Transport; Fri,
 20 Jun 2025 19:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 19:57:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 14:57:39 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 14:57:39 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: add shutdown callback
Date: Fri, 20 Jun 2025 12:57:28 -0700
Message-ID: <20250620195728.3216935-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: d944310d-ced8-44e5-387d-08ddb034b66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cqJX7cPBnjzvRLAczaQ278wfhAn38tJSRftzp2xXJmsSp/MMkuMZM9J9/8vF?=
 =?us-ascii?Q?4LGCjzJ37oF2xZUtgOJIY0RyevzagJnd55I/BS8DsXhKln0+lamykfb+7vKK?=
 =?us-ascii?Q?9AvRgA2eAqxZ0FHeAEGLerwTW+AulCA7gjc9Q0BOPHEhH2VjXXUtAMJPMa90?=
 =?us-ascii?Q?iHYWYyJdxtkq/WIGBBzOQ+fSSZKZeYuFdixzjpCSOd52jXLxn2DwoiWQtoLr?=
 =?us-ascii?Q?S/9l5Qcnr/ALV/BGdQxxjEsYA4dK2mixJELC0mgbrjqQMmUGP4EvUOV1RtyI?=
 =?us-ascii?Q?886YiZfgEjV2h9+/8tY+gwEPMtbeZmA6OXQi0lGipznLYA5uwV66jJZNNLrK?=
 =?us-ascii?Q?oa4ZmavBTH5XzUnIBct36UQU2oQHWenUMk2N96lduGJNndHUMcsHEjQiyZAh?=
 =?us-ascii?Q?TzFqa8PSZclCK+dmYOgakgonAbANYJnNVvdVkwzhyWS8Zngnl/H9L55bO4fu?=
 =?us-ascii?Q?/2qsF3CAUFNuBQBbKMkWOHQMPJKZSJ9Jz1gBEF5jVFIpcnsUKnDvxe2q+2iE?=
 =?us-ascii?Q?qTI0TYu71WAJYUf+YRzBvawvULRKnEIoRL+Virpxtr8ruGhjvsudgtChvOIR?=
 =?us-ascii?Q?5PqEeJOAKw1hzynRWwJqjx7e/O93GrHv5pMCBQtdBEPDMmnYCqLXNo7puYaN?=
 =?us-ascii?Q?Nk4piKJQ7vdQZo8dXu3QneNEHVuFtyg99BQ50D5Sv8BuQrV3ran7cjvYOonM?=
 =?us-ascii?Q?78bo1kYKpf4/bYX66EivYYOAf1U12jRNmYIr777uKKTt30KbJukq/Z+sCbGa?=
 =?us-ascii?Q?RAp4APs1Jg82Ccx0qa1kWd6pYfNq6BTWKa9N7pg9BE7xHXSubblAeY2yo0uV?=
 =?us-ascii?Q?2N3681I4Cq3MlLo+uO1N91HO5+qvaUzJVtTJ4u02cnUmLMBiU0hpBGHjO57N?=
 =?us-ascii?Q?rtISiTgIvTiTRoCbKHnXGKrP+9Vn3tWtZqfZWFf0SSTYV0CGEZdrV7iAi2hG?=
 =?us-ascii?Q?jOQ7Lk2tTU2XXzbaFdrMPalD90Ju0qOpPixEG+B3mjIRbKGZX+5uZsYCcQFv?=
 =?us-ascii?Q?TUrZn/RJwmJbu9kiVBKrgbIZWvcjvVpRt/3vPY8xkGDHDO48tRiFCJXAEcde?=
 =?us-ascii?Q?YnvWLDDkDn3aZ3cPRUfFNMFKCxFYFKS8jlHM09BCbMk+DW8morJbpOzqRY6Q?=
 =?us-ascii?Q?dmxqdscm4ylVBqn6NLrosh/qIu2dtTN1yWPpUlC42sqXflizRfhUQPwI3Ja9?=
 =?us-ascii?Q?Iy4BMwEQRiY4o0yBZv52QL7rbLc15Mm5AiEVDPRObd+VQ6APu+k8e/lyiMl5?=
 =?us-ascii?Q?HZVxccGzQ0yYbOWirtgK5vXxAnMxwhv9xEFaVg9rZJr+ZFTiiptYqo3dfwnP?=
 =?us-ascii?Q?6BEtsNu16Ww4hlvuV3wDYyPHyTA9vlk0v4WrR4zXmucm9989rBSdj2sAN6Fl?=
 =?us-ascii?Q?nKGk//rRxvHwipvp8pmEB0wiYCczhezj7eat86zhrNd3503ssWVRhQMrT15V?=
 =?us-ascii?Q?OIpUZl4/RzWaB6z9Yba5fRnEkgMDQZESEBNy1ub7jROOKmOWlFHZ/BktPEZO?=
 =?us-ascii?Q?u2kAGVeURPWyawibsQfCZHLsZmrOUb+d3qUC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 19:57:40.1528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d944310d-ced8-44e5-387d-08ddb034b66e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730

In case of kexec call, each driver's shutdown callback is called. Handle
this call for rproc driver and shutdown/detach each core that was powered
on before. This is needed for proper Life Cycle Management of remote
processor. Otherwise on next linux boot, remote processor can't be
started due to bad refcount of power-domain managed by platform
management controller.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 40 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 1af89782e116..30294e7fbc79 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1463,6 +1463,45 @@ static void zynqmp_r5_cluster_exit(void *data)
 	platform_set_drvdata(pdev, NULL);
 }
 
+/*
+ * zynqmp_r5_remoteproc_shutdown()
+ * Follow shutdown sequence in case of kexec call.
+ *
+ * @pdev: domain platform device for cluster
+ *
+ * Return: None.
+ */
+static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
+{
+	const char *rproc_state_str = NULL;
+	struct zynqmp_r5_cluster *cluster;
+	struct zynqmp_r5_core *r5_core;
+	struct rproc *rproc;
+	int i, ret = 0;
+
+	cluster = platform_get_drvdata(pdev);
+
+	for (i = 0; i < cluster->core_count; i++) {
+		r5_core = cluster->r5_cores[i];
+		rproc = r5_core->rproc;
+
+		if (rproc->state == RPROC_RUNNING) {
+			ret = rproc_shutdown(rproc);
+			rproc_state_str = "shutdown";
+		} else if (rproc->state == RPROC_ATTACHED) {
+			ret = rproc_detach(rproc);
+			rproc_state_str = "detach";
+		} else {
+			ret = 0;
+		}
+
+		if (ret) {
+			dev_err(cluster->dev, "failed to %s rproc %d\n",
+				rproc_state_str, rproc->index);
+		}
+	}
+}
+
 /*
  * zynqmp_r5_remoteproc_probe()
  * parse device-tree, initialize hardware and allocate required resources
@@ -1524,6 +1563,7 @@ static struct platform_driver zynqmp_r5_remoteproc_driver = {
 		.name = "zynqmp_r5_remoteproc",
 		.of_match_table = zynqmp_r5_remoteproc_match,
 	},
+	.shutdown = zynqmp_r5_remoteproc_shutdown,
 };
 module_platform_driver(zynqmp_r5_remoteproc_driver);
 

base-commit: d293da1e4dbebb40560e4c6a417b29ce3393659a
-- 
2.34.1

