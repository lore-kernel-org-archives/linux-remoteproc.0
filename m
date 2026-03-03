Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B48C375F85;
	Tue,  3 Mar 2026 23:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581910; cv=fail; b=XF8QrYsHSRDwIMILEU7Z17bQ+RQmKALJ1vQ4b9ZMuqRzQyDEbQoQ8SC96y1u9bQiG9Jcx4VYRldKmoeR4ppWp3Az35J0euJXnbtkkG0k77SYjrU7nDFYsNWa/XPOmkHCIGN3qmns55AddFnLxf3nIutlbeYj9yIdTHOJ7OQ9tH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581910; c=relaxed/simple;
	bh=xarvXNmCGO4tSEvjq8DgtsC/UXMCKkmB56nHQ+M2sok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHf/ZyVWOY6DRHeIDaCKdwJb6qrhy8t6kHrupXbLOMRifiF/EKGgHoQp1TgW45Rsq9XHyidnvjoOJt0bQkf0Yd7tTJgY1EXHzkmlFeXidtjtJ08lR+gpIUWa27Yv2DPhSAKCkxy5LpvFqa1Tt93vOpoxCQA/XV8e/MpTp9dEfSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YCKx30Ll; arc=fail smtp.client-ip=40.107.200.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YCKx30Ll"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbM5PcLvnG4/vVqk8cV/ht3OOpQOfdcjGOZ9NEJ92C0N/ccvu9Y7YWxBSz3o/p4GRfIOaE41rSRKHmFSpzERRfoBZgnQxFK/r6HeAcwsYQIwLmWVcwPXmWS1HhqsArTnck3Sv7LHe61dVFpb0oxL/5s6ghk1SoCaSyTr5jXrPUg3v6256RjWLf8/l3F4fAVUmh20KWb0s2cjsaco0sVCK5z/CJk2Ei91mcSZ0Tg9nfk83onnokYx7OvbWCmdDy5pmdk6uxb90IFQE/KCTUicxCc4sjWZrPwGJPc+Icevgz3nsp0XGrpnOAvQRHtIdm9rnwwlG1cc/P0RXHbGBFYGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaVA1qoW6naUeW/AxX6ZeXVo948/yLAYFtRNhll8s1Y=;
 b=dzGNxnGVGsa0ckKW8YuaPjhO5yk6tbyowuUSpyiDrsUkDw8HqNjoGJ9OJbrNKvpOBRBwtyUvkl8zGjAhPgZsgV1HmVE96yM7UY0gLkiZkDI52pMhCVg6nLPNTjl806Y6rOIzat32wK7ctnxrOs8M49rME9gYaUTTup7rHn5GyxM4o9EPBzTIgJQ79ybS3eLCyv/PLoap0wwOdws/QN1CyaGbQYjFKdnBVvvvEmCzpAKQ4TIKgN03eLT+FQMxTS/t1j/YiBkMqffZP00+m0SvnVtorRQIHK5/K4pC7WdiNrpEsbDi/dciA5QjfvPHd4QPQAIsnSI2U1rEG//erxLatQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaVA1qoW6naUeW/AxX6ZeXVo948/yLAYFtRNhll8s1Y=;
 b=YCKx30LljEMnntE0TdxFnTUViyA3aOVDyhJJNsxQNiSccNpzNeycCnek60y2ab+WRNJyObVyO1tv1G7qllzc+rFQQotCg5/ipcxfcd7SABq4d5Plk4IhjeJuCdef0lcaFcc+ZRRl6SaW8tzIFf2QFnsCxBQkwRIpyQBb7uDwP0U=
Received: from CH0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:610:e6::16)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 23:51:46 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::19) by CH0PR03CA0281.outlook.office365.com
 (2603:10b6:610:e6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 23:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 23:51:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Mar
 2026 17:51:45 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Mar
 2026 17:51:45 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 17:51:44 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH 3/3] remoteproc: zynqmp: release mailbox channels on shutdown
Date: Tue, 3 Mar 2026 15:51:28 -0800
Message-ID: <20260303235127.2317955-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303235127.2317955-1-tanmay.shah@amd.com>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f63db3e-60f5-4523-acd2-08de797fd40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info:
	kBAr7LjZEGiMCMp3PPc5U7slI5EZF3JRZTqTUr8A8fLhJRuSr5/NpLTUxBoXkzQLpGD/CFZVQXvHHuFRaOjO5LA2CDhD+aIZC+R4pdWsJ6f24s1N3/7fY8SMuYgyuSkPrB5yIZ4A4UYpIVH3N+EZmJcEyrp8GufmbuSoNP571uqOYj9dPO1HcR/vH0iSsMBgfOVZuTtJPVSNv3Nd5gYkaRFU8ga6O2MF0bzAEw4iJ92bgEwxOCl8tl89bBRMidXjWFCzliugBznC6vRdtRrd6tbhe5hkw5SZr3GnYRBAbsHdzMrCv8ICKBncZI/35sPW53oJbQN93vnBgcuH/oG+EiJleNNeson4zVSEtXQIZYTny5FXFaA7uSYKkFDgRqcYQ0OqMGohNCNQde5VwxplXunJEG9C8aI1dn+2nL2XBUsXu6vufgM7qUq34MsDnEvV5cxMXpiJVeUfeBhPNDkok9IRLWWA0K9J+fxyp2J5rmvywiK/hcH3xYEmsvUb5OuETeFaBFiU6Q5+lqH7/ISr8D2g1er7HcQyZT2RFi4HI2NO4HBTaex/qwIXUozPQKIvddXVKafDlI6Td8cOtPO92LRuKDbkyV8gOGfAVSi+rA0Zc1db6JkGBy+He96Ef3tsMEVwPdOeQW6q2jCdVvgHG/3QFETd0BgERNGJUMuNpXgANV7ZNNsOKTAUL2ihAicWOXunSiRUPBkzrJYGUnQ6e5JHIIWdjM0uhz5d6JsMp1VXUwGFKM+mnzdKVSPeDtA1N/KSwnLZt2aoylQxy08sng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+A6Vx8kS9zhxB+gn2lRKBhUMIDmcH1NKBGwI7L+GGxknMzRAWlDD4lAmjvkQFSA2a1Ugtrvilv2d37fg1vqD45Sf2JOMZgES4sIUw1lFhy3P5FV1/bq/2NxFzvMBxqRFLsiuIGv6H7aJwG65xB9lPTZfxbAD7locVT4GtUa1mlZ+SqV5OF2VwimLlfmHiopOIr7e+fIIWV7bTOrzBRu6kPq8tnUiVOahZcPrlgjhQ5h4jDjU+R6dgHudc3Qh7iLfCvfSZlvgpQHtkqFtri9g2my4yPDo+QDwIuuN7ZAivenX31QOmcd8rQsStzgK8hud0eoTInToydP6daio7FfiFiZ0lcBYDQ+5GiMgs0DcNa3i9UPw/8BDkYEaHzSfrmSh1pccdn3v5JgMZ8qw3kygwa1Cw/qEgiOspGi5ixm/i5cLoFShS25uhXjd91OPsUQg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:51:45.8117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f63db3e-60f5-4523-acd2-08de797fd40d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

mailbox driver can't introduce shutdown callback, as it might endup
closing mbox channels prematurely. By allowing the client driver to
manage the shutdown process, it's ensured that mailbox channels are
closed only when they are no longer needed.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5e92dc51f1c0..50a9974f3202 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1490,6 +1490,8 @@ static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
 			dev_err(cluster->dev, "failed to %s rproc %d\n",
 				rproc_state_str, rproc->index);
 		}
+
+		zynqmp_r5_free_mbox(r5_core->ipi);
 	}
 }
 
-- 
2.34.1

