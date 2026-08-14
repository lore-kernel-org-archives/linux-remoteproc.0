Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44523515E8;
	Fri, 14 Aug 2026 04:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786682586; cv=fail; b=idyDnZjr+0VfKVNp9P49pGFKwjmH6eraSrQr8aA/g7Oc7pXXAShbBpLmf/awXUdia30trtaAozTAdPZUs0ZoGDL3xC0ldNUwsn7FMJligGWvpoWUuPkyBhoLeLkOyukBs0ouKcfhTT+Q+uPGV+k8RRP2XY3ggpq6z1rOhMbnKEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786682586; c=relaxed/simple;
	bh=+vupov9E+D8f24SNM80BoXmnanpVPycE82jyQc+Cfkc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d7nmkCLi0vP3OxS6xfkZQv70NvRF8YPl8L9s1efLjE8iJDohmxd2CoajJuDpIysttxfXXPoAB0ociyPzO8jIhCy1+auPOH1Ubw9pYjhoxqFb7p6aMPwMVy5Khqujy7AhDQMbh6W3kWqy3zbGJMeq3n5J1GaIDXmMeILYN5okvbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r5Ww7gNE; arc=fail smtp.client-ip=52.101.62.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r5Ww7gNE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPeSyYoVWN8Fk511+2O0056uqsevQ85iX2c9NXMqEK7/7Z9vrfteYRlLxjg88gQE0xvtjPYxAXJ+56P1GCvm7Jkns7WHigFPCFuDmpBe5JQYBUuuzKbza8g2N4VSEtWxF5o6V824lcNSegbaSEcmlSHcQTj7w5VfxspHdgnH5tDbod2EtNdqUjc61gQ8EGvr9qviZqfHhEPq1woCpSHTTnKOAMjt5X9MJKfZpQW3mqQWiuJDRzb4e1ZJx4ctXIGSq7E1XVC7t8pVbV3hZo9tZM5r8d3TGu5FmIx5sCk+7S79G+f2HbwnpP5J8fGU684p37p6rghMa4dwx0o1fnyKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJnAtYGoBsdjUJmCLRC4/JQt+wKWZlpAjnVjLmZbPwQ=;
 b=vki7NtfYoKmGm8rb+GyBoUB7w7IYix8XHi1o8n3vJRQiY1Im3boLgRScvWX4OGM/JRb8GcnJ4MYRcFtff0WKn/pRl5wleAq103HlUxxvP6xbLKnbp43LshTv2COd1t/rHzx7SKM4FZ+QxEACysVcHNXWgCcwPEPajk6zJBWK47slJ5Qsszb4EzXXzvrd3Gu3h2Ve2MKuFrvx6ZLviDJZ2JRj19hLPf3L6No+74nn88oskkRsPeKQiVqm9HKSU9DhBdwPypaTSALJNda45hVtc2cFqMfawzby4wxcwPY0l9q6d+KUsgZ2LHpbdMMyrhsTWKGP70s8fGVlw25mzmGoYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJnAtYGoBsdjUJmCLRC4/JQt+wKWZlpAjnVjLmZbPwQ=;
 b=r5Ww7gNE5Q3t1sJlvs1ijU+bibkdRdzSLYhLgXXeA3GLbbZqR68bd8T/G32lNmZdKoMVsQC7eljZ01OEmhp3Z6W8C5pnr/shKA3p1UCSgZvcrptpXT0DaBKpYchtjD8woWywHp4sAHY4Fg9YaIvyK/CS69a1rEj1jS815z/yyBU=
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by IA1PR12MB6356.namprd12.prod.outlook.com (2603:10b6:208:3e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:42:54 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::27) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:42:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:51 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:42:50 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 5/5] samples: rpmsg: add MTU size info
Date: Thu, 13 Aug 2026 21:42:38 -0700
Message-ID: <20260814044238.518296-6-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814044238.518296-1-tanmay.shah@amd.com>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|IA1PR12MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6e7ff9-6da5-4979-3c9c-08def9be8141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xLaVexhZTL71wZwmJyo4NBY3m+SOYQgcDYAgyZMihkZwIa0lsc0xFBXiRTS776hKBQNDhJRY8yIoDsFy7rumYc47nTdOKM0PIHFplPrCSzVO3wMIu7PYO0o1SXmYRi13Kzh5ADs3+Y4I2uACwk2I1J7/rlCzwrUHt+iPosP89vXWI2AN5GtJq2otnetQJ8pGZn9xeNI2WfQzb9s/05huGm0MyMpTNyvOzLlOYxXzHgSiRwdggJcj/fljM1F1fOTuUZDZPMmtIv9kd0DwcvixTLE/tIpyXHSYe5Lmr4rDEUWenqhhZw4GOqydudW5Oz1ov1wlTsI6/fH8srW4HH1rIfzv6nCsBdxnnHEZiENm9cfmljziljwks7rlSw+SH++vohkWzQvz7B/XQR5Fe80B4AmwluuPVMIbkPreKdJOkS9scJktPJl2HRMrCOyw01kX2s+6i9K9SP7ERUVLJBK+xkmMDvo/2OHbzq99xRfq+SGo8VdvYJL279v7gnZUbhpxN6Z7DwMAZDL9tS+YQBbNmRFTUO//QmFrfMdFyv0IIle+//7SLXaCCgAgqCUJyd0oBJXFYAu/Xth6f/+2HlIzTse6DDmuNr57WfGAesZ/poMZW0VHvd86sGn/z88cLtVmJTmC5aBcY5i6Z2vrroBjmRGS5r8qIVkF+fHI70Vi0gqHfLyyXAWJssui6P3OZaoZxV9IeWHrsdOBAMs22LTxVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8aiK1/sgtMVv32SlhgSLB3wdetHkqPgJLeuEjQP1qT1TJSwM6ib4IzAjJPUjxvaBIwyMkUDjrPlDsTxxyN9ic3f/40e4itGo8cwW/gtqQ1GZF2tps14IL7BwiM4SuVazImzJrsRG3Coz0HhAzL8o7dAw9hgTz08wA6ePyHym5vqcZoGseZdSutxmAok5MKG+PTdOMPbtr9mrQr1BcP2tlNxUUxCIQs5A/Yu4wD3RHB7T7ilCRKTKSjWSoeqK/WEiupHL18l2x2Sq1vG98xgrxjAFTJaSLmR0shIZgPO30aV61W7ptMOt0rbqVLh1wENxJ1pa+3dmcJlZNHZ6u8mAMStB5Pqy3LH3ocNvmR0YCmzYJvDGKJ80YRSqwmQ+pf8btJtX8RqeVEUk2grNwUidHtFhXNf5G5T8EWvMcBGxjYQZRXz22Mzo/diFVYsAXUw/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:42:53.9941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6e7ff9-6da5-4979-3c9c-08def9be8141
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6356

RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
Add log to the sample driver that prints current MTU size of the rpmsg
buffer.

Changes in v4:
  - check msg size is < MTU size

Changes in v3:
  - Check for error when retrieving MTU size
  - %s/mtu/MTU/

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
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
2.43.0

