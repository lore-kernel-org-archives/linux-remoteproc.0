Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39FC32D438;
	Thu, 19 Feb 2026 22:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771541044; cv=fail; b=SnenyO9gDa7ffIvgYA+mV/1HgF0GQJkY30jI0v/zL0Ze/Ve0eZvcy3r24sL2I6Bob5m1j2O2j4IJAzL/jef41dRk9M6Qg1X/LDEMauzzWdkJr+xaUaLJCY2MqB36V85RDo2vM473TEf/SZ86NrRkxNodk273v5c6A4VEGJvIBZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771541044; c=relaxed/simple;
	bh=QAHmgvwchNsYmhEMJbtXJz5CwRUEGIo4uxslVDKab+I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fOo+/Co8prbuB8fP2uBrjpeTb1oR+Yef2pnIKStEoyCrGd1o8Q8tc6oc6XhUrLEFK7Ne+lJqCXn1e/RXdp/LU/B0yZAaipAQ9RBPLMXaXFyeFoUlyqMWtW1GqsWFkmPPq0x0b629NN1+t9rbBv1SPVsnAREbGxXb/0MnImwKJiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QKyJ1IxD; arc=fail smtp.client-ip=40.93.198.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QKyJ1IxD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgaho2pZoMNNRqWKVClVzn4Ba8T8a7/0kUUKQvayOdyxhSc/OxdMP7ko8uzwQiWhSIiA9Wlfj1lX4S75Ck1G3G6devXoXM8qUDe4Cqvbo3EgaKcDmc+N2RUU4wGeJwqKPAeF0SufSUF/npUrBsXXX2vE+fga9i/0QZbjdtSkA4L5sxtfO3rKx1+hIwynZb47pLpxlI6iIPgWb/2gmMqU/+6Mk+E1vqTIeEmiPsv7aT78cCFZbzktFW3zADx5RRBpmOLrYe++1IfaER4pqK5P+/RGBTqhlG8vZar7IH2wIoB3uTi+AcRJj4NB2VEfl0MEHUcdNfy5dp2+3ETCkZBaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51jO6h1aoHYlRiBHf2OrAdbrxlU21/Idm85mbUVyaU8=;
 b=fPR9RPsAy0y7EPzb5CVmFxCpFPJuddKBOOz7AjRYHgE9XtrW6MX4hLn4qQ9SDkoS7LD4Vhj1+UkQyh56+KDZd4dmWMRNcc/otcwHTtsR/Hggpa/7Vl51N2kBD391IrfCp86gtmsrOKAx0DUyr+FGgSxof1xystuRpgm//EWgFGD136Yk7SU4nKaHTF4fCL4T7/DKvfK41X8n4E74WGduqW27x9O+tsPwERwRw7f+2SGi3a3ljMJAfG2qpbMgC3cycGCfuzU2dnUOMu7o2mmHlA4AUSe7RvfBfp8MUrqq/tTk1tJuIW4b/9o6ZKgsGDZO8pTROXNHrWnq/Jp17im2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51jO6h1aoHYlRiBHf2OrAdbrxlU21/Idm85mbUVyaU8=;
 b=QKyJ1IxDwLVKVsIixg5NeboSEilEHWZgPiKGAO2X6zDS/Vgacut5Z4bt/XMgxFxTyqklY6yq9/gSNfs+PW1GHF6Xj8zbAWLFQS/7cWBMZW0yuhHQx3+v+/I+GsXx7meB23Fmipek4vP9n7rqRgp4mms+9+g7h8n5JyyvOz0WRlI=
Received: from MN0P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::10)
 by PH7PR12MB8428.namprd12.prod.outlook.com (2603:10b6:510:243::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 22:43:59 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::b7) by MN0P223CA0023.outlook.office365.com
 (2603:10b6:208:52b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 22:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 22:43:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 16:43:58 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 14:43:58 -0800
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Feb 2026 16:43:57 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: do not send new mailbox notification
Date: Thu, 19 Feb 2026 14:43:30 -0800
Message-ID: <20260219224329.3475032-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|PH7PR12MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 84145f43-a928-4153-4077-08de70085eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TSwYnpFMzBJmZS8W9dRvUSOo9o+tP+zvJTsQK3xrgtEdnOX+FT3WsrfV/SdL?=
 =?us-ascii?Q?dZIR9sXf0ZFLxkZcYmxJ03BP1l5AvbkMUt+vKQIN36nxiBv4N0PpUVZ0D3iZ?=
 =?us-ascii?Q?1SL0gjX2BlgutTUc7G8rsNs4aMjZnn03ojVQz/NMUNskoh0gmeSnjnTfGM6+?=
 =?us-ascii?Q?jV7f3bimxk1m0MdbrFDgzwiAPUIstTpk91ql6CBJY+Xps4dmWbOZo0bEKco6?=
 =?us-ascii?Q?8Had9/dKmJEPrRzRJf0L10jdLBS+ZUlYjiW3C/nBTqJgEv9y4gjiAkTfxDYw?=
 =?us-ascii?Q?Bs4C3dPX4MuqKKoNLK9iTnm3YryuY5WVhVn5LEhlHxWJ7+muT7yYZg8YhSGt?=
 =?us-ascii?Q?abP3s2R6tQME8u86yxTmeBTFCJ/Cjx6oDH6S9uKlEifdI+yE2ritIFIxwSri?=
 =?us-ascii?Q?s5TEXRppFY8EYi9X+QBSpnxTICopcE9duj7Yp19xw40lQBo53RbOPgvYsFzY?=
 =?us-ascii?Q?ftjfVe3MgODKns7gnycopxjDI+1xbOrsieV4ELebJ1EVgI/RsnU3oMQ5lFgb?=
 =?us-ascii?Q?kM2NLL9b/iIAkV279UucPwQ/dpyQMDZQ4VmEJLczN+vQEDN3M2q+/IZq3RmS?=
 =?us-ascii?Q?CE7nvd8Y7cwlTDXB91MtCSBRCLoBUBdlT20AkWXVEcl6SGaZWar/8BdIPYD6?=
 =?us-ascii?Q?SYzkIZ0CzdhaReMjhEdak7pQtn8QfpbYKGnh2pCvacffDSD2gvrK8BETM7p1?=
 =?us-ascii?Q?SLxbRk0shiXi3VbkNbKE8yOEgPAgKydxtONt84+8SCrHdfLUq094YzYRKeTE?=
 =?us-ascii?Q?vczMWCixXQ2Vy6dksV6zhpl7MZKigZ8b5yBGc5pVUEP9jB/eFxn0N3bUW02n?=
 =?us-ascii?Q?C7Ds5h9kPEsFmzbAb5Vh8JtEdrQoRI61mEJOAcmng9ybUCNfqZe/Wfcn4ZXe?=
 =?us-ascii?Q?CJUOd9bJMv3/X+knrqNmBUo5GPcrOgKbQ+0C1J1FWmWtZreSLU4uhHoqZPmu?=
 =?us-ascii?Q?Nwcw9Zsmoe8fNueCdq0/IOOAuiB/sK267T7fIYunv6/HeZsUX6CzGoGEhOJR?=
 =?us-ascii?Q?KYj0G8PNQjp9g98mT9m9Z9O2nwkuO5kZE2DAAJVcePS87sJwrch8j9gug8lE?=
 =?us-ascii?Q?JxTy3KvMBXZxF0qQJKQ6LnPaLfMOWiMMeWwSlnRrX4rL0cL56gIMkV9irtSJ?=
 =?us-ascii?Q?Sc71GqjAQwIW/VuRF+39O4ATF259prKYD2hQGQEvxYIwDGXyJiAH8wnDwD2x?=
 =?us-ascii?Q?bGqqOiQ8EK96IrtzmIuYGUeKENeH8M1OVPq2x+imPI9h15PLRbTz/8eUuyX9?=
 =?us-ascii?Q?IkMFpaaYdO2X94R1+rIdpLxmmDNK5ZusHxtyl1ZGdVVxgxad+c69F9sCbIdZ?=
 =?us-ascii?Q?3WHMuElS51HPUbSO5KuDWJeu48Klx7aK/X1t5pcXJ2TQHxpDq26OBPZn/8AO?=
 =?us-ascii?Q?hlfQv1m5SnXdZ9YsnOQl2wYalxENu7mFLePCQ3HsjXVtMjzmqwcuXwEZT1Wa?=
 =?us-ascii?Q?jLSONraTSwlMj/zNafbBkMGKARkjfGIZrOMZjlUsVNlh6lBWpYMXZGQBn4bF?=
 =?us-ascii?Q?r5wRKTVSPn8Ohuvyu164eD1Iaayw+kaffCLH2EBwRfJOySrYuSp6xxhIhZVc?=
 =?us-ascii?Q?kyhlQd4mTipg9Bd+8aFkxXNOGdWmm/z0unGBWGfvxVkTcNb6VCZGXD7O4shC?=
 =?us-ascii?Q?gg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vjFRSREDc9pGzwCJW44w9Lxn+miPyiEs3Ua6O0Z3eC1Khdo+/qQcWGpvSOzKwtTNoHkFvgf1rn2Q9xMkRGZDRcOI87eYpKMmrTb5jHp0SoY/lr4yLfk6GjPxDtPeWGaZBiiLUJidQZkxugDwiD2/7Dq+AbstkpIInvgMV7l6KKzr++D5sHjQZFByD868w+1jyDLjtkOhR79PRyfcjVjePhTCuBRizE4NfzChdeG8kmT6uvpwzD3t8fwR2OqDUD0gAS/BQ5+UdryNEA3Ye+dqJseH9v+vz0/tyhefWVZw3UaFgMlTFrt2nthOggQ0Y86v//Wlnt/ipyCjdfnG96V4qcJHicewz0csOlhqpU6lwYIZsU+MxOWbSPDY2PtWvGMaDJUokewftOfOKpjBJd30edS4VgJCoXlxrih3vxyhAWtiprFHP6r/QkbOZ1/XvbbZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:43:58.7271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84145f43-a928-4153-4077-08de70085eeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8428

Only write a new message to the tx mbox queue if slot is available in
the tx queue. If queue is full, then do not send new mbox notification.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Depends on: https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/T/#u

 drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index bd619a6c42aa..622de733c929 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -332,7 +332,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
 	int ret;
 
 	ipi = r5_core->ipi;
-	if (!ipi)
+	if (!ipi || !ipi->tx_chan)
+		return;
+
+	if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
 		return;
 
 	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;

base-commit: 462799c088e71b2b8a511c2a9649420fcb569ab7
-- 
2.34.1

