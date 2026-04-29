Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970953FFAAE;
	Wed, 29 Apr 2026 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479210; cv=fail; b=SZfdNUZ4cV1vRsfXpUDvbWaxo3pO7FzcyC2PyGCFtNd3XuD0J26egIrI1mggf2530UOcFWJG/yNjOydGHvK2bJH95KIeuuYBHfGXRoU33PjbvHP8foMaKz7Y9SvdA2H/6VdfAKl2WxcFPYryYAoxwJi0oSGlVszjSJIGZmOdHQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479210; c=relaxed/simple;
	bh=UM4H18OZq5IK4qHPjsev8uTgZEznWIihMtnmWU4QKy8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BcNAiMLeRVhzJZEZF/3r3K/9cZXDOFos1tB9q01dgY4VkKzxTxD2rA5c6voC82wl1GSlUih77JSXrnDBFrGr9AsUG/0WtaSynYOZV4ppclDpKxM5cWf0PFbrv0PvdMB5vT9xGW3C3mzrhySwveeo5luhpO/M7fwNiETWYqKxU2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H098/Kfn; arc=fail smtp.client-ip=40.93.198.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H098/Kfn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhYS1QUPTvtz/lNOTy5MXgl4GvXw1uvL7HoKf0hlaIUDBf/e8eOU66SnEvOHelzd9UrriUc+SyKbDaL2r9noXFVnSlrWfWY+KFXecH8ErFHfuFwFRA+RMhepARJ+2/jVJMTf0VMhu5x03VJjncq6LD+k3r4fIzjf+slWPuxrzm+o9d6ru/OeyZp99sLyVDtQZ4XgHsZsv26gBB8dUb3QqQYlVu3Lputbfyf/9jzyry5pJ6fA59Kk7kzQFVYoXMORI3qFyR+89YUupCib5XoWAE+7Q5sNgGi91kz2NsnjP7XHL8N729IvfaQbgzY1x0Wwlz6BsawpwsErzSB+5lpG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyCEtT9uhFJkkzjTWZYQgr9lw+E3nuDO2lQDpHkcgUc=;
 b=qzKb33Z7vn0vGKJmNlrun9obz3xwYBts/QXWHkIntnRgkGSHXN7filHVzqkanXl/SEK6yr0Z9IY7Gh2tqFLZsrpW9igH9hYXkruYC5HsyMuBZf7XJs10TZ3d2nS3xuYXmm/u0dRQu/BzXnsyUT4QqzIO48bL8uFgTJ5EgWr9Y6JDFYFUYGRFQozh/IRKGhjjWWqCHe2IgecU+BTTWT0V3jwkzz9SlqXaqoaoHuVMeXJZBe+FUtszMcqcb+BmnJl98Qm1aocATzsokIXboU/c5P1c4WwrBuSNmbWcLOg48cSMEJBUU83XeW5kLIDxW/FAYMQ+V/Os3i9+sdhbPHx09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyCEtT9uhFJkkzjTWZYQgr9lw+E3nuDO2lQDpHkcgUc=;
 b=H098/KfnczPmu/A5mc+5tnGWgxsOL39j3CvUcCGmtKvKcfQC25nVhzAN/dtZB99a7QKhBxoCnxHscb961GgngMnPFBK6qQEhI0s6ZWazrcrfSenVbJQkPNJeg/mt4WN15dviqbiJwbsaYhhvn5RFY303rgtxKlMidK4FH4njG/4=
Received: from PH7PR03CA0012.namprd03.prod.outlook.com (2603:10b6:510:339::24)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:13:12 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::e4) by PH7PR03CA0012.outlook.office365.com
 (2603:10b6:510:339::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:13:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 11:13:07 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 11:13:06 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v2 3/3] samples: rpmsg: add mtu size info
Date: Wed, 29 Apr 2026 09:10:53 -0700
Message-ID: <20260429161052.528015-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429161052.528015-1-tanmay.shah@amd.com>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dcc655-7838-4fcb-702b-08dea60a348b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	soUF7IgoAboyuLdvJ8OEQKhdFG3PnqNMWy0AS5QwP+Jbb2eG0Cf7p0NI0UHNXXqAg+xPo+4n54tCET++leZ05IZiaXJX9WxZ3xLuwvqalYd7+LgzIUzrUtrLnu1+eqLcVUnR3LJHRPtpO+raOPTaNxWZI68/2r0AcbYNmMykCgKLLRD+UlrPQNoAJ5FzphKcAbHiatdSb2Mi5R6A+KtrPYbDjZFv3HP+vNmwctr11Spkbs3Nt3Zowhuc5nKuhY5Is2FEXVj52n8NxBbAw9jG/EgO2n9MzwvQjNKSrHuEDlHHQ5RtqAwPk1fpnfLFOg43I2d/ryf+h+2oaqG3Nj3SmfF7GeUsKDcNEILrYNsp3pIbkPBcM4ChEypz7KH25aSYjjcP2Gs80nNa7QMmjjBWgB3lrGyTILnOdPLIr52k0NMWVugx8wHsdLZqmFm+qjVGR1nfywyI0DJxBi57If2yNJmtXv8ioQ77kBj2ShokTQ31fNNeALKaHzyYd5CIngqdHoNRkIpO0qiioz37srcPw9E94W2COn/jLbnfkvU5Ke4QbvDe8swAqsZZPvf1Z9UgiQtRIXM7zdpBO37/geWEw2q34KlmSbk3G7kqoio+/10sBRojObLIZYYDaK2PbrhZ3yF84SiSQ78JrjUBpxss6lBsZXSUryMjeiQGEdFzymTsj8MiBgqH0rGPy12kRlawfTAe67oyJ3vjTGUBr9roeho/Mu1IgDKWX/B74tyGNGFaA2vcYG3tslIK0eaXsSAFNvHxH99XAA7zkVxb8reklg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FdKjALknehlABFhB2BlW/yfzTXrSkuK+XcXvAKZ1TZm8cDLBcBkhY0O1kz1ZkLiwm9t1TLP3o+pcIgJEPikC9IHX6xocsH1/xL+rxJW7nQze17FW7QlnsH3eqT5TdnJo7oZknzViNpXWnMxtlnMIeHtPTP6BXjSXoPqEmkdWJ3sjZNPgIGW57l/gEhcEDnIbsyoUhVGx1s7P/pKQ/2A7v7r0i0joqcT/Pfq3umCjO1QT7CKkGsnwD5q78Ell33GDC9Z+o6EIl79DZhfqlVFnlp7Fcag1RPuUJnzjFOLDH349BLKfe9UeaUJDSjIdcq1jBQpo6q13vHUPQVf4AYDtsMcgRThk7VPyXTX8zdf/0cQ77BhI2Vh8SGqBuGG1r6/uB+HTrQt9R/gWotx585ggB2yt4pRMVMIwKMCSMhKi/uXMga3rQE2oXErcTYHNjaNN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:13:09.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dcc655-7838-4fcb-702b-08dea60a348b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861

RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
Add log to the sample driver that prints current MTU size of rpmsg
buffer.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 samples/rpmsg/rpmsg_client_sample.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index ae5081662283..bc6d16e81d69 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -62,6 +62,9 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 
 	dev_set_drvdata(&rpdev->dev, idata);
 
+	dev_info(&rpdev->dev, "rpmsg mtu size = %ld\n",
+		 rpmsg_get_mtu(rpdev->ept));
+
 	/* send a message to our remote processor */
 	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
 	if (ret) {
-- 
2.34.1

