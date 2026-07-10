Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011D4380FC0;
	Fri, 10 Jul 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711724; cv=fail; b=IcxtBgLzSbn7hauf3O7m2t8lceiXFEABnwvArMMkQjzqSFZgRZEMvyxmNjCmEdZ5JhfH+JrOOB7/O4CjIsg8Y7eRIj6RQl7NkzMmiF6JYCKOsq4JmCfS3t5Pb6ahdUXqox1KZC0vTiw66lAy/h443mCBIAlYLmUMwxmS7WvxxVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711724; c=relaxed/simple;
	bh=uLnx/0j5TTq/y3THFD8oaPgZJHYqx8MSalhKjEkcG2w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhAC4+btDLlNdK0z10KxyjiLkzZva4vl2BdPxw1sO+KIF/EkNbMJlXD/wHPr0gOsxt0QMPAQ2oC7j490lFBx4yHSvWELQn348Uu3C5NR/mpabZbCc1nx+zaV21OpdMrcO+MUg8IfxaMIzllttd+92jLsoOWipaPrGsel2t0XDOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yOD4aIXt; arc=fail smtp.client-ip=40.93.196.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yOD4aIXt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQ9ZWvcQou4RdHz79cXvUrSLn6OKRVASF7odo3wxu1grcwBupY5aKJUgOvr8puYsUL5P7JtdLRgISKGW374YintJa+gDgj0mJ0xwZZkhf1BXKZsNACZGBNtDHsVj4O48xYBrg4GLAB5L1oIFeqm1S805bfKfEZQgJJj5TEfgcqNIAu8/JNjdc3kO0C1YjkDxK1D/k6OYTGN2+rVUTtdwbtIgZX2HsXKoGPOrJ/BhUrH4pfcg97w265hx8Cd522CKaVF60Fg2wKAAR0dG3ejCOWAgNgR4zpE5HC46nRlHTw/ov4WFhNWRSOICtNigkQvRqrVilhvzEEVQzR6ribYnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI9wv2ahZNjFCjouiMPXlTZh+LLMPE+llezfllDpAMw=;
 b=AZt1978z21OtxGYwKpjdM6PZowfnWaGBQSTJrd5w5ebmlX5roJI5hRzryARn9aw7u/Usc/KwsydbcPDWOoAv9nj0YamIbPXDKgsb5JQAkwG1C79UB+pYaEuzw1Ao8koAe1ONvI5jB/NePzsgaJIrNo8yg3NMWmgeFI64Lzp4e0n9aEYZJdHjz4vDRWcmt6NLGuuqVkpENRUTqNki/fsNfKwiS+D+z+kHdt/IVt+dwUyPnUXYISL+Kax9D83ZabYykbEgHENEz7SozfenN+C0jMY0ambUMp/9xvjoF1gwIIayuFN2ew076wS58V8swWeFn2y5u0bR+hXvdCenQfEZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI9wv2ahZNjFCjouiMPXlTZh+LLMPE+llezfllDpAMw=;
 b=yOD4aIXtlUASvyz3C9j8Dp3cZlvXLEYut15VLfx8h4CNy9/LI3yi3M/3CHUmI0Sx1M07GNu/jBVgTRVIA7duWx240T2l5AvH84rZJsVwgiQR9Ovc/ekj4RvwmExINj63Nuu9e9LuIdzYEi9iObpTvh3GtmZbn5Ip6dxBGrqEMBk=
Received: from DS7PR03CA0279.namprd03.prod.outlook.com (2603:10b6:5:3ad::14)
 by DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 19:28:37 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::5e) by DS7PR03CA0279.outlook.office365.com
 (2603:10b6:5:3ad::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 19:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 19:28:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:36 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 14:28:36 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v5 5/5] samples: rpmsg: add MTU size info
Date: Fri, 10 Jul 2026 12:28:31 -0700
Message-ID: <20260710192831.3440427-6-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710192831.3440427-1-tanmay.shah@amd.com>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|DM6PR12MB4267:EE_
X-MS-Office365-Filtering-Correlation-Id: eba93c62-5d48-4ee0-66fd-08dedeb9708f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gcuzpEGY1UtHsUZ3THIO9jhCx8qZksPdQGxDauGt6M8Nv8NOiMn9Cm4RnWTNcL9YqNjjP7GGczXJIS9kF+dufo10q2CD0oZqZByjxsyJgk5A/SB3AaUXujHv1ZcUzkDpeE3OxG4TOFptblozkDjpKGZesUMrlpPQO5XrZM8V6yOfoZwwgIha4Pop1K35tUOIuPUaLbX3Ow75CwnCDNivEKe/8GXcgI0wLnhV3+VTgPduhXbYiv/PJEvHNkOhdv83XQwPoRTJdjDJHDtnnceiK80xHXuLfERPlaSSPNVQIhFrORMeJmUlL1GtjmNWbH54ICN5kgEBmxAxFbQmij9djVFAppkKkNvJbRDpG+1GfGXltpZOkxfOUUgpQSU1mzorkwgp8vpHURbl9/RKmzn8cARKQ/Mp2Xo7BPMMpO1XVQonHskWasJBc3HK9jLOTPHQNEiZs0paNXsFb8eZeCGxG3bb0PFnKXPCjw+zxhBVBYB+bdHghKieLS16Ix+Hni5ShFrVXtCETTYs0tBmsn4m+RFAkBf2GBwUhfdlpso1ymO7fzyfAuEuQ8SD33GKfRKp8g5CGy/yP3n+l+g33B3DhU2Py14ahCRxIEdwS/xGKQRS+FUouwqhmg7NSedLqVWsL71mL8qigzW9nN4cZCI6b5n+Hvp0LPqxWBAQIccbBjmpEvKkVaCAFY/SWRKH/K7l7uMJNpre6ZNl5HwRG8JkRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A0hfv2E9PnPncNEtb5U0AkFAHJfwCPwRgz86QfBF3IR12YvTpmB+NIQ2XhfFX5YqTycvgMLPaYYusIEKxqgvgnVoP5wBDjzc+LQZW6UlVr6ZpTANL2Z9jy5cF3t2KzwHxQ0uAxEipyIrki/yeJViYZcAGkkmaNA3a9R3pQSZqjXn+FI9dKM4DfcWtyLZzRw31O88KnleAuxQTA9MCBTiah5jNeP/URYVlTKtwaaW+NZiaOvnuOzIwfGsJC5Cb5ygxlN7OTMjFIrFkB/bkQZodeH+zs7R0OAS24SDDhAmdDMHLIwS5jXsnsEgFRViErcjdbyKbo0fDU4agq3FkO4ETwh7JOc73sxgucxfsMK40zKisOU2t0WjECuhl24qRylRXG7Q24xK/NrfdGeVdPixvGePKlDOS77TC2sxen6vckfvyMHEuUSjnP0HQW6qe4cM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:28:37.1140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eba93c62-5d48-4ee0-66fd-08dedeb9708f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267

RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
Add log to the sample driver that prints current MTU size of the rpmsg
buffer.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
Changes in v4:
  - check msg size is < MTU size

Changes in v3:
  - Check for error when retrieving MTU size
  - %s/mtu/MTU/

 samples/rpmsg/rpmsg_client_sample.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index ae5081662283..4c43436aadb6 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 {
 	int ret;
 	struct instance_data *idata;
+	ssize_t mtu, msg_len;
 
 	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
 					rpdev->src, rpdev->dst);
@@ -62,8 +63,25 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 
 	dev_set_drvdata(&rpdev->dev, idata);
 
+	mtu = rpmsg_get_mtu(rpdev->ept);
+	if (mtu < 0) {
+		dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
+		return mtu;
+	}
+
+	dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
+
+	msg_len = strlen(MSG);
+	/* make sure our message fits in a single rpmsg buffer */
+	if (msg_len > mtu) {
+		dev_err(&rpdev->dev,
+			"message size %zu exceeds rpmsg MTU size %ld\n",
+			strlen(MSG), mtu);
+		return -EMSGSIZE;
+	}
+
 	/* send a message to our remote processor */
-	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
+	ret = rpmsg_send(rpdev->ept, MSG, msg_len);
 	if (ret) {
 		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
 		return ret;
-- 
2.34.1

