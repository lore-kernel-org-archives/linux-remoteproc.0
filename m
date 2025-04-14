Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E470838;
	Mon, 14 Apr 2025 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656431; cv=fail; b=rrsY2pxWJbAqFANM9ZSniqjor1weIQZMLpFXkuuIm2OSNEAQvsYV2nXxM4p8HcTXq0hpz0FtJT6q+CLUUR7guUrUxdZ/9tQ6P7JwtEJIod9wjl97f9esY39IUC9Z4Grkk6PT6RP2zw63a0KcttcGNe5JDVdtAH77cj2loiokFmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656431; c=relaxed/simple;
	bh=zH0bGSFdeNX9scBk3GnGH78FankxCX5wqvN8kkQ8IiA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WWBJMYz8uNhQ/9rpg0LHuFBJECoaow6E8X8KF6UycEoqX85o5HEifqkqz3tw3tdwmBE35h8rcyy5h5Rhr3IDEzAAgSq5HOiDA8xi268iHAKwT5C74iPhkWcmezy6k0QqzMBvW53DY8lAsz+YYuxvusUVXvDFBnzUiPEzGp+7AG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yjI9rHHJ; arc=fail smtp.client-ip=40.107.237.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yjI9rHHJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfwiDsOkRv7wyO/e99tX8QSbC4chPIJJQss++/aRAflCXoT7dKe66YBRc4EFXN4Ay9pCaiZJArEq8plpJjlQL6D30CjTEHTb77qL5T8jZehckpQg/HVEYIJMfjysyMS0/u91s/oF1nAqRVE5J4PTCes6kkslMt7F0KtDcQTZ9luxkpZ/SpMYHHjDmYU1astWzcCRMWblEp0YxDnSzvKJq4233LK5FLQD83kuVxczXSkSem7fMSfeu83RkwXzeZuBjzEl/rlZD1UBRgoRCf998G6midTVmzVo99//IkVl6zHg1ipB2zyipV2ZMlRMe1z9l98P/8bfsUf9XArj27gZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEMGS1FvtAaSJBSvMlJ8uslQnrRRHcCIJWFjsrXV46I=;
 b=GQmZt2HGk8sCUPAhpF7DVecG8L8iDqXeaF50E4V9Se9O6rA5gFM5t+G9wFppUZ3PM5BNFJPCCleL7ZoFIOKFIwQ4r2pAloHzm05v0Ppz3ErfUxCP9rUHWph5qbXEueXRvOzw3rrwGxDnqkFab0ACBafJ1xuvO/qRKD084uMJ416kWNfvGbK0+pkdtvswp7a6yPC9GYv+yTZxvNyKgfUYJVZqt4dwEL2RPMn4M67RBAaD9Rg+E3PUrjDN61vE8iKH4J3xmTfXjuR86wMj/vRXih4WUq598XhOEzQiF7GFHjSAoKpbpdACR6OWUgZ5kRiwf9VRBQy6vdGIL95CTIRQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEMGS1FvtAaSJBSvMlJ8uslQnrRRHcCIJWFjsrXV46I=;
 b=yjI9rHHJZ3oRkmAnmuzeI+wE2JSlBYtpk/y/SY9DYU5CQCbSCji/gCnPpZ5tKAwXIBCS8DR7S9VSi1UVz5a+vSoVlWN3Ah6p2fZO7r6/p2YAi2lLUZzo2NY3Qk4Njs9bz7aelEhA9J7ziupoizV2zjSbFrpMMjtWfY7BMuL3VEA=
Received: from DM6PR07CA0042.namprd07.prod.outlook.com (2603:10b6:5:74::19) by
 SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.29; Mon, 14 Apr 2025 18:47:05 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:74:cafe::27) by DM6PR07CA0042.outlook.office365.com
 (2603:10b6:5:74::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 18:47:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:47:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 13:47:01 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Apr 2025 13:47:00 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: avoid RPU force power down
Date: Mon, 14 Apr 2025 11:46:01 -0700
Message-ID: <20250414184600.1166727-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 4749d85f-da55-4be3-bca6-08dd7b84c016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WfqWg3hnSuQeDo8oEp0P48e/gxaD2sagEaEWnccVAdXGUkP14ptHhIvZdJ1D?=
 =?us-ascii?Q?EzJy3F67o4AEwv6Aq3N2mJvI10vHf0VkNqOUZt5+OobyyV9E/xr5VJewTQoT?=
 =?us-ascii?Q?s4pCOjCBEsn/+LXbEmrFg4XvhtqzNi/9k86kzPDYHaUjIsS05DrQq8hxRWcm?=
 =?us-ascii?Q?Tqh74TyeQLyZEaH4x0IOG0mqgfud1bOhzkuUI50hp2D6yIuwYLtIGsOr+5jB?=
 =?us-ascii?Q?/ien2e9WSuAi91+Qt74vrOtrmBtvouNNleOoEC6b8+WXQnitqBUKUmvhjxU0?=
 =?us-ascii?Q?1Cv+4Qs1LGZyLUmtJF76OECcLErNxg49KUYrWBI44Fvaw3mtJKq1f+nTZfXu?=
 =?us-ascii?Q?YZGWljfsqTjW5EuN6lQgEwDDN8u2CuuoJmk52sL7LVUJlDd+oCrcIfFgKCwX?=
 =?us-ascii?Q?YdaGYwealH8kx9fVpqYJY+XD4bKE3by5oQPux5DdSBvQKB8HfX9Zn/r2lzy+?=
 =?us-ascii?Q?rgWXf+bIsixH7cpRn12StFWIOA2KSkGA/xRdlQpHlbeToMrSnnU8yaD5GUcR?=
 =?us-ascii?Q?iM3xjcLGRot/VWZhgz2XbB59ckeQAxbRAmocw+MJKaxeRDUsNZ6vJvwfha3s?=
 =?us-ascii?Q?CEYB/ONPMje+//V9T4TCLH3QON4k7HHajCOkCMiMXaFQZSE4oM9ijqsIf/18?=
 =?us-ascii?Q?yjVwmHtW+tNF9rUGCGGOeAv89NlV5SZd6fzgyQY77vpcZ0AXjIi/6I08jnTA?=
 =?us-ascii?Q?LyX5mxkMPWHju4DKqcQNRJZpjBSmVqzdQgraYl/mZBG+cUHASHGmfs/YBg0F?=
 =?us-ascii?Q?0uUHDYqBgv7i/vq125Q77jgXaz8bCtX7skDFPr3GJqVjq907JDYCVdt9b0mZ?=
 =?us-ascii?Q?w1/nKJCltHA3iz33tOiKURUf8VS0J4XCwfaZZtvIPs9LjCUKJ+bK/+EsJSwX?=
 =?us-ascii?Q?vh02sR+9pKtnapuNY/SXfNrERwcGAssAU8y0vgtc5RYQBTnXqKJF33DQvnMz?=
 =?us-ascii?Q?ibYEeBUFqU9MUOgPJtsF4c4dU3YdULrO/rEidiYBxxHhrWHeq11FGLbcjavy?=
 =?us-ascii?Q?e8jYtJwK9Kig88C68CHWIivp1if31wfaEJ+fs7WU1BAa/t/xZrGXt9Y9cu7x?=
 =?us-ascii?Q?uSm7OAPflMhRZF+lNQ1HZrmFexb8hBUiYOCpUIF0pHcqVGVQSxWQGwrMcWLv?=
 =?us-ascii?Q?IhINoscG0Dp32tJQsC5m81sCD2HntDFF62w4JcNmbc6WGNU5jGxkRP2wELcc?=
 =?us-ascii?Q?n4tuIpO7N2b5XxUfvOtR2AYzBu1PmKXftLvEKgzCFYCjfShi7VBd3wz5+XU/?=
 =?us-ascii?Q?OOYrFktgu7QrqB0kD9SmRGqGzEf9xvFr0xckA77r2ZxOpNM6lKgUNCL02Nr7?=
 =?us-ascii?Q?pcJCb55XCb9BAmnfMzJtuolzYrO3VmyriQOb3nFJXx9WQ6Z0FClpkYgY0eKQ?=
 =?us-ascii?Q?c/WYZTrP9l2mz7kAgDr69LqXmOIh4CjWJWm2qZd6uZOeRxLLKWCQhNOt5rUq?=
 =?us-ascii?Q?88hlSBzlUCfiD0Zv3QKjC1hpf9zXrtbMc5FoHL7nDh36njEKyYBJJ64oFyHo?=
 =?us-ascii?Q?xG6ywNynqYVOGgdvYbR9dqRCFZaDq29EFNSK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:47:04.4156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4749d85f-da55-4be3-bca6-08dd7b84c016
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

Powering off RPU using force_pwrdwn call results in system failure
if there are multiple users of that RPU node. Better mechanism is to use
request_node and release_node EEMI calls. With use of these EEMI calls,
platform management controller will take-care of powering off RPU
when there is no user.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5aeedeaf3c41..3597359c0fc8 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
 	dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
 		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
 
+	/* Request node before starting RPU core if new version of API is supported */
+	if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
+		ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
+					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+		if (ret < 0) {
+			dev_err(r5_core->dev, "failed to request 0x%x",
+				r5_core->pm_domain_id);
+			return ret;
+		}
+	}
+
 	ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
 				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
 	if (ret)
@@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
 	struct zynqmp_r5_core *r5_core = rproc->priv;
 	int ret;
 
+	/* Use release node API to stop core if new version of API is supported */
+	if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
+		ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
+		if (ret)
+			dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
+		return ret;
+	}
+
+	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
+		dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
+			PM_FORCE_POWERDOWN);
+		return -EOPNOTSUPP;
+	}
+
+	/* maintain force pwr down for backward compatibility */
 	ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
 				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
 	if (ret)
-		dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
+		dev_err(r5_core->dev, "core force power down failed\n");
 
 	return ret;
 }

base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
-- 
2.34.1

