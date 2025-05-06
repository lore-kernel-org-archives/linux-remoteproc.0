Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C57261B;
	Tue,  6 May 2025 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550801; cv=fail; b=PTXCHYkQYsH+6Z/uaK0g+b7Z0vC7kPdVxL8USlBgabAEvGv4g0RbGklpVy6vP+YqrpiZaV11y/bdu0l3bgLQsU6LFTuLyM7CQF/nxTVncWOzzU+Zd4pN67wpjqjSH3RhX+JNBBX1N1m6Lb5yw8HMjq7WAhCv5KSBLPJdf/gr1Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550801; c=relaxed/simple;
	bh=iGWdPeBYuIDUZqemu03SRVRCP6cP8U45b+aqkcq8CJU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mv6mwkYo8ngXIhpKEDyvKm+vSIyoHeMZj2eN0FdJCW5p/ESTcI5ehgjkxkF/iNPP6Y/V4sUM6rluhRFiM7Ha0q8Wvr8Krf6YQA0j+jN6KtfcaJ2Zkqpo/6NuNu4zUg9eUIvd6oirjCuhFZ25c9zDhIoRy3LYJbkV9prgFBVPKFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eFn2Jw3i; arc=fail smtp.client-ip=40.107.92.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eFn2Jw3i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+5CisLGw345lx1eBeZIdtJTyQWR0Kn7N6Fx/I1xVn+JnFkM9GKcvhhAMFvMsi/+iTqbL1rDUhKZaqf7PH7u97fq/gRlluJNNJ4jHJJHiwpXPatxDNK/KBM3kXl6IrFrZ0K1LmbXCPvGDOn1htxvueqy3h0t1Z0DwD+s5fSoPqh3K8Jhg9cxt8c+qn/0uyaphYb5qAmsiJmYXEGzKkvf3oqNyuDiGKFK/+LKtsuHcmVJ5IqKWxAOd3H0XR87857vObynrBMa4Sr8vrs/sZf4Z0zpA+WH14J8n6UM2ldvJ3VZo5PQFfGbEA5gA7gWA2r32BgsbRvGhsYSKKiAAvElLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CDYM+zPO9fGqQYkXmI15mnYFRclMiLIF4QtFK0k1PE=;
 b=FyGPV/o/Hs0S4cTjqlPDxF4Pb57mF9UQgo3V552fIEHRCwjpoz6uvLMvUaY5wf9eZdyhnM5lu8shsCZwaxJHF/WbnNqxvnyUb3+HGVCgpXrR6LCrd16YSuGxbW1JdtidE9x06X9S0Pjk804+RGrw9FzrfIRg2+cl3ga+lmTQrn8pcRdmR7gfcyULfyHxkaRayr3BHMgV0cPCyGw+gBUkb+Er2+HiLwOY7hc8v7KvKZB+xmoLGZJJIPw3gmf4wQe4BsTPXNRZqVxZ2OzRbX6UaOF5jQr97ocGZohgaoGgs2yw5gkZnKsBKvVuMk1VfQcw0QKvTlNN+oXS5uDx2C2VFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CDYM+zPO9fGqQYkXmI15mnYFRclMiLIF4QtFK0k1PE=;
 b=eFn2Jw3iqrZ9PORIhNEOCICnDnFxkaLpxJsFKEk32o84WoiaBOhM8vka8LOQO4/iAXLEhq+OW91O59qzsNX4kytYSaRKKAM+wJeXt0Rx96EVDQdeHIbc379ZvUqs7+u8UaqcnWYNnF/4CfzF+CFvH8vgNnaSwIkRWvBCEnELA/U=
Received: from SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::13)
 by DS2PR12MB9709.namprd12.prod.outlook.com (2603:10b6:8:276::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 16:59:51 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::1f) by SA9P221CA0008.outlook.office365.com
 (2603:10b6:806:25::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Tue,
 6 May 2025 16:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 16:59:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 11:59:51 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 May 2025 11:59:50 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v2] remoteproc: xlnx: avoid RPU force power down
Date: Tue, 6 May 2025 09:59:44 -0700
Message-ID: <20250506165944.1109534-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|DS2PR12MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: c061f13a-3966-483e-85a9-08dd8cbf6ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lXPqyUMkLXy/UtWrHOxcJuihq4ycrDeWNaMwZJv7X/hUWjjNiugGm3YTsHNa?=
 =?us-ascii?Q?kY+Qk3V7wbnzJ1smi/2SlOG3l1bgWuWxBikG9jCO3JwY+PdVCBAygMbUMiG1?=
 =?us-ascii?Q?BplO8sD6H9rDik9eeCWJaDg1Jenkz1NA26cLYEBYREYCkF9qsx2ERjJsqLel?=
 =?us-ascii?Q?Cbcosun4RERWQ7lxdBFSzbjlfsB1dVAXXaEVlOXfPnc+4cgEc4Ayqwq/OXBl?=
 =?us-ascii?Q?isaTpRB0i+NGbYaO/BftJTeSA808pun+OlUDEmbMuAUVYA2+ECkjtuzoH7Mf?=
 =?us-ascii?Q?EstWqwBBaFskum8SyL58415WQMFAVq4F/Wc1kGhYPxRFa2MR4XYkOKbWGIiG?=
 =?us-ascii?Q?jbulPPKqpIrpq76fU8Th8SkZXWYVtcvC5doizMcLzufjPXOHhsIJwy0ULZzC?=
 =?us-ascii?Q?2CPObf2z3UAP6NdCOdCfVv0tdNpgmXOpNJ88xrroQkI+LxZ8bNT7NxX0o2xl?=
 =?us-ascii?Q?+jBCQ50Upr8ZTdzsC5itQAuzFP8WBCSF288nEf/TA+KaQ0MQUvlz3lB4U9yo?=
 =?us-ascii?Q?eoFHAG2bN4+9tbCh9srDBHY+TTtGhQpyDPHx1eielU+eNwWnHgMfzk4/FstQ?=
 =?us-ascii?Q?nxF3VtI6IJ5Mu3GDmjr4B5/1inmE8PBnTIym+K0gf2k+nOE60XUj1clyLnrc?=
 =?us-ascii?Q?1tuukhpg50dEuYguu5uOvHtZmPJttccDsv/IVS1tGfhdCFzycZK+y7AMP8Hu?=
 =?us-ascii?Q?2+uMlJJcTGdqgF07j6fOoHtNlfXH7Becuhg+tEZEteVmWWwvZ5hR43TSS/pn?=
 =?us-ascii?Q?yv29GcbPsXJyJ+S0YbrvS4ThgEEnahxKTrXG/qsRYWqI8aMhGZeAgGwVfvrt?=
 =?us-ascii?Q?6U8z+QAe4vL7j6jD2kWGmtlcE0WjCmfe9ssAuPSBgkFw+TiYGyTl1R2Q8ArN?=
 =?us-ascii?Q?w3uRnFW7UAOsn1Ct0LXZ/MatfOoq/w75P0A7RO27Y+6kqPY/NME5UBs6wTfe?=
 =?us-ascii?Q?a+4pkt6E5mTS60zBaJQU4GzS6M0f4WBqhw1wkxCo3tRM2zJzhAUPavd9edJO?=
 =?us-ascii?Q?8ntBK2kQz4TyPAcKz7C5OdShxLws3LWFLzuwZputdC89FZxfADRJ2Wlm9Kh4?=
 =?us-ascii?Q?6bg/JE2q/GGceLR876FMSvyXRTlFwBILfh69DzOi0DZ8mZJSwDuukwp8Sekm?=
 =?us-ascii?Q?d/su4EXJ0OttS+/sUyWVh8tsysxjEW87jAiMXRD8qNKMu/eR+TN2mJ02EnN7?=
 =?us-ascii?Q?L6M7IZsPSxB65hQHyKQ+0Kap9MR09+/gAbLmyM847nOipriisecz5vOBeOU7?=
 =?us-ascii?Q?LekUYVN57Q3J3yoNfNeioKU7WwcPH641TuItrxSpcX2/M8yC903TSOic01st?=
 =?us-ascii?Q?I2iAKBVnjih9+uovOE3uVKj1dlodw3uFr8ftn/srcMGt/inA+VWHIDOyPej3?=
 =?us-ascii?Q?RnzOY9opQ20FKzfbQbE1iUXUM1JVbPOXE3Qp3rDLS+5eUTMtBQhwp9JBC769?=
 =?us-ascii?Q?fiD+yrytzm8X2quJrtND0xBXz5oyxphWxw/OB6o/wZMuvG5w3tQlxvum2k1h?=
 =?us-ascii?Q?MrVgIJsHfIYjyToVvXH8rStm18wmY86hZkB2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 16:59:51.5121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c061f13a-3966-483e-85a9-08dd8cbf6ad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9709

Powering off RPU using force_pwrdwn call results in system failure
if there are multiple users of that RPU node. Better mechanism is to use
request_node and release_node EEMI calls. With use of these EEMI calls,
platform management controller will take-care of powering off RPU
when there is no user.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - Add comment on why version check is needed before calling EEMI call
    to fw.

 drivers/remoteproc/xlnx_r5_remoteproc.c | 34 ++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5aeedeaf3c41..1af89782e116 100644
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
@@ -401,10 +413,30 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
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
+	/*
+	 * Check expected version of EEMI call before calling it. This avoids
+	 * any error or warning prints from firmware as it is expected that fw
+	 * doesn't support it.
+	 */
+	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
+		dev_dbg(r5_core->dev, "EEMI interface %d ver 1 not supported\n",
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

base-commit: afc760ba751c289915fe10c12d836c31d23f6ddd
-- 
2.34.1

