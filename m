Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C014A3F7A82;
	Fri, 29 May 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073037; cv=fail; b=Txtmypa/aAJJVkZh7DeCYgPUOAIupdzrbZxyW2U1EBkyi3zqndH926tgUAFg8aUzvvdPMw3JV2596dRPscZ/eXSocBxzpf+QWufMGLmF/7PdB1CdRDoIlk1PdsOGTMU8UWLYWjOMgGgWwRo18iMi39+5yqlnuDEQxDbQLZRAwSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073037; c=relaxed/simple;
	bh=CywmKuSBN2/UBdYt7rYK4mTkiPfR5yfuzEVaYbmw3ds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLV+mEwKP3eT6kTBRE5eEaNSrjvXqREPuwxK7vVlZUkL43eWzhpbAbEAaf3+PlBO+Xprv20CJ/uTIQFMWIDeOHLUYt1JXOqcPPQ6T2WkCgWvjQRb6p7wwdzE3i4vEYHAIpP24YfLf7TrGUoSp26ygcGniqJWf4M6XD9fbuS6tLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X1T22KoJ; arc=fail smtp.client-ip=52.101.43.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X1T22KoJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO9Z6Shu9CeyPFNKAmjMozdJwjovbxtMxe/k210UltRQrQeOFG7sZ2A/yPyGGTUAs7dcVhghfSaqymk3ZWst3FYnYbphIZKp9OEV0QKmJ5u7dhBQ2n6e1LdztAKp9ebmjxARC+elcA3YZB7YZCqcuxRdclkyMnTLxCuRcaHP0sWLmeiPdf90rdSDtTS8yH8z/y/BHP1zDzhuJczvpz/5J9ZK36a/4ajn0IAeDHA5QsVHViK0qyWSrnCHYlZ6W8+3MpMKPGl+RL6zjfpJE+fwU/Oo2KoCarJJv7kcoLksOGDTjHGFjk9eCcqN55jglflK0wwZvYcyhtaKsHYOTm5yVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYDaPjU2LfdPbC/6ZCujTEDVKzmwX5Dul1ysRjZ1Vf8=;
 b=Rs4LtLWrOjqIZB+kKFGVEFT8p/MNdrb1jms6/mWY2jHKh/NT7k6XRIZVGzXYs0FLahhmMFqtDvaHFpkYD4CDa/CsdgTVnOgqbYTw7X5DmunhBdvzKr0dtczPB5EkCt6g00CgYu+3VErP7V+TRlq7LrQyhXd4a7bHSxB7WCosqLH/SpAITB42ig1q1YaY6UtkBSMibcqcSi9SilHrAPNMcCmSDAOdtjBB1qqk0PzMWUAW8raLYF/OqWQSEeeNlRoP4kH/v30qvnCbTPlv2S12Q7uAmrJI04vXCSbx3N2u9qKYG6wAq3d8CMnpSeYf3xy83JZ/bTnwVyY56chYQlbRwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYDaPjU2LfdPbC/6ZCujTEDVKzmwX5Dul1ysRjZ1Vf8=;
 b=X1T22KoJV7q/mxfFMIbWYb3LUt4MW8Fc7CK0VQRdxTJdN6NvNdciILcSf1Ir0qA/LQNEkpCGPmuaskuYHtQyEF9C6N7ttSeGrGlSZJpQtYx/aE0m/saFyVuqvay2Z/aO2wq1//UksWmE2HlusaUeq7njpPsklbbPCsHHbJqm6dg=
Received: from CH5P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::7)
 by LV2PR12MB5799.namprd12.prod.outlook.com (2603:10b6:408:179::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 16:43:46 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::16) by CH5P223CA0009.outlook.office365.com
 (2603:10b6:610:1f3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 16:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 16:43:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 11:43:43 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 11:43:43 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
Subject: [PATCH v3 4/4] samples: rpmsg: add MTU size info
Date: Fri, 29 May 2026 09:43:28 -0700
Message-ID: <20260529164327.1827121-5-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529164327.1827121-1-tanmay.shah@amd.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|LV2PR12MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 3019679b-75e8-449e-d199-08debda1738f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	11z82bDdLKy9VLL01eD+3fVZmM07pSEptsM7fW9itAYWz57Ewg7QVYzl0ZPR6mTJAjedb2zuWlCu3r+SN1jTmdhu8W2Q0i+XlN1Sntu/Iw3WZeiZfy4xCI4zZq5cu/vTaHNPFYnfH0dtbqhYn+LvzoenUKrv+yNsEwzBOPxhENa9/d/tzsIRVv/9vNJt2qh1H75VyH5L0tHpBEKEW788HA2G523sxzzwE+Jhdn0ZLC5VmmfiRH5oy/BKL6KPze2Hkjv+4Tc/M3e9eZ9RZKpAEiC3zMW0Mwjp1BryHe7uPu94RTmIVj8dSDfbLp3myvg/to20SZ8s7sDgGRO/0/1cmjMxeUfBHlepjrAmoAbkCZIQMag6h9VSRucy0J649Za4kaxYZKb5do3E2FaIVsHEVA1ygWYfFNoZUtF5yn3BJcvlXnzc2/tVbIH5o0CSdhbxxUUYt3qaGFHfskxCuf9+erZsKdWY0G8yZuh3/CkL2ewHIFXwPMYxfI7yTsxlISShcGbfR+F0hg+0jgkmk6jAXe/d+uRbr7RQxCGlrydZLSzQVfFBNUBFZWzc7WV07I4UlIjl9jXwrRCOXCvc7dk8nuf69a+fsfIAjFc7QFq3v7Aftl1Nkv2Urw8wzdzsTdfybwy1oSgC6+8ruDQixbMfDTSgmrd3zAecoKpSUnniiIPzrdHfn5weUzhqwLeOWaxFnDdotHIzxAIFGChJIP9jcRySgjt5G1v7ck84wfQFEVA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iDj/AXqPDJNzSwiO5cIuMh0ZQkVfiK+rD9jau2d6INifpdMY2Vrv/hvi4C7Fw5CGMb2+tQrkXzj3r9y+sH7Fb3huiKFXzmyppuDM8nEvJUMcwLhPDARqZvq1uN6PcQpXtKr4UBWzSwpyxHcpDdbCe/57Gqy24u8YXNSN+XFG7OUG/sv3y9lCuXrNWEqBk9gWbYUXiqnI52h2P9DTfBiV7UKvXKgBXimZEj/Oh19qauUEqhRoBmgYVcriwl+1S6E7oCsUlchlXdOIjXMTAAkbM3UCkT45c+6PsddWiTICCWLyCSkWzWCVsQaUnWANAXIZ39XeSJ5z+XcW/Hi6H6A+7e1qVq5PConRHF15DVQsJEoKKGwUL5Eyvlbu8SCbUtfKExeqVp46PgbHuXcO7diexapdV4PxJ6pPApk2PjnBXkVtiGSYWiIO905+5RFFstQt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:43:45.8632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3019679b-75e8-449e-d199-08debda1738f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5799

RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
Add log to the sample driver that prints current MTU size of the rpmsg
buffer.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v3:
  - Check for error when retrieving MTU size
  - %s/mtu/MTU/

 samples/rpmsg/rpmsg_client_sample.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index ae5081662283..55afa53189af 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 {
 	int ret;
 	struct instance_data *idata;
+	ssize_t mtu;
 
 	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
 					rpdev->src, rpdev->dst);
@@ -62,6 +63,14 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 
 	dev_set_drvdata(&rpdev->dev, idata);
 
+	mtu = rpmsg_get_mtu(rpdev->ept);
+	if (mtu < 0) {
+		dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
+		return mtu;
+	}
+
+	dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
+
 	/* send a message to our remote processor */
 	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
 	if (ret) {
-- 
2.34.1

