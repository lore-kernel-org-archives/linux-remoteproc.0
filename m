Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E063B637A;
	Mon, 15 Jun 2026 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554827; cv=fail; b=EUtcgIjBWzQtL6vABk4itBpLutSBHc11+6g86yI57ns+NRDRWBT5O2b6vZtC3cRRJdj1SU5QrC8ze0WpUynDLFzf033l4mM5lEiwjL/sqW7IMmwDaZsJ9JwtIUqdImeuHDXziV9hrUYqBRsJz89Dw22LB7NNeb3/bkG6r10V9SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554827; c=relaxed/simple;
	bh=GEeDQ2D9UsljkK0nfBg45gSecv9BKVjEY5KPkAlr3ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RnERbhZAFbCy23P23hn0QW0CBJ87yLHhX20TDFrcoyeOZFKHDcofEbRpQP128ENKMG8cmT+FkdFwE51CpBQ7spg/oiqTr1GdzRbvfCsTM1YXQTGABHR/SKAYC6fpph98aVAkJjuBUcMg/K2aGPlgyi0xOjf+UPvzvLMC3v3MQKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u6rlRnWD; arc=fail smtp.client-ip=52.101.48.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u6rlRnWD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opCcTAtO+BUYcdrtyTWmvBt2bwJhnN8JrCjkyu8/HV5oQsi7kAUnH+0Vb1d2BKzJeQM79F52FAgkdauJdpNO2H4Sz/dMpHPXZWypyT7i+fqaVKJINx2BbsowW8ZLKa9kpbRPN6ErhIF7hA+y09bTREvAYRVhWvF2KLt47fY1+l9iweEMJ9gZSnetDeOq8vZwKHdyQddvs/BqKdQksKdaF5wJ9I5PHsPOSVK2xcyD4dmKKjd2o3hW/qylDtxPV/ucg3VbpWqVc8gM2pB3DfGMjGNkNKx+V7YVqX1iFri19qoQ2t3NFIxaev3NJuCvXhL9frjT4mefEYZyOOhkFGT+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0exUdRUIlW+7uMJydsGY4OeGD1+Qxf3hwaFoc5ngitA=;
 b=cTkrjXhQb2/HF1wlSuCe0CGEoJY9hQmJzn4K6uNqx4BnVu6Jt8YyTAiM+j7IeIheYrtuI7yocdbsuPWq9KVGNNAcnOYlNOEkYPy3VEuq9szCw3xA2L7g9ROjwLqgL6Yaa9tiH39ceylODlk1gtphxKymUIqbmOoltwi6FwgzOR6aL9Hf67iYsVr4fa6pH5vXq9dyaIIJijnN8/Z6x8FBhviibLkE7T7h7Hby3ECAifNghui+hYrwu/Dce3HChGokTufLcBi6/btgXC0vC1uSrVbkRsAlYllUyj1rAK4283vWDoO7kpw7Cx+lC8Qgafd3X6HeJCiR+3Ah75WIlFybzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0exUdRUIlW+7uMJydsGY4OeGD1+Qxf3hwaFoc5ngitA=;
 b=u6rlRnWDO0Wj49myeLem65LYZmzDJmR1BUZsQjmXHDkkjUjZrDDTWHhcTikFoz8d/afwScTLzJ9nqGuwWnjO2srWNriThpNXs0hLEdWv4HRJqmN2GZs1sAN9jquibqsSICqNwh4BcpgI4ddDVPQBn+Ehz/RhxRhwIfmwj78+C6M=
Received: from CH2PR18CA0044.namprd18.prod.outlook.com (2603:10b6:610:55::24)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 20:20:22 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::5c) by CH2PR18CA0044.outlook.office365.com
 (2603:10b6:610:55::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 20:20:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 20:20:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 15:20:21 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 15:20:20 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 5/5] samples: rpmsg: add MTU size info
Date: Mon, 15 Jun 2026 13:20:07 -0700
Message-ID: <20260615202007.3484668-6-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615202007.3484668-1-tanmay.shah@amd.com>
References: <20260615202007.3484668-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|SJ2PR12MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d220ee-230c-44a4-95e9-08decb1b867e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GQHQ95Qh/Nsg3tZV9zOrdWQFHFUnXkHSQYJYS2Fveq8dR0XJSU4wmh77eNxrMEPmempWxHcQUDSPLKZy1R6GCmvhaelNpLYKir55uveYvLgM2kNEs/YICQhX77SMf3kDbyPYEpL552rBLiJtAcI/dfhuySN9ezAsW/mq3vAk9l+vwkBt4lu5lIjnn26FSjxBVpk+yjS7Qn6+nDjaExMPT7K+LeaI0LiBbZCCCLaYqXjRNKXwBCdExwGZ7NSOR69bnJdzRWeANHX/K7P6Oi8Isds7tZHol5sxJb8a25aYiiCqJFkuCJ44rMi20AO5GiWKRp4l5mf2ibdHwJmLOU/U3Af0igZfc2PKddve5S2EOB9miAvrQDXc7DSOaWpv6Lki0K/3lNniJX+2EmysKiPBobTbhQCQfwPPDHak7szDDFkBE2Bo5o5kAoyVD0qWpgwBA7Q8mJfJC4r/MJVjdLlnG8/12sRpEh+tvZr7sPfZJfuItALeD5XkJWMLNBAapjY0m9jwB8vsszgdkEFgMhNZ3YMYUHcTkot9Jy7Dwu4WcIskl8suAm0qGquhgWbfDPCn603Z9eCQupUMVnlL1MDXTz3kcjycMYQPEvPnm+OgnWwW9CTvEdrJa3SSvc2pMxuoepoi8c3nwk4Tm/OwOe7FtJ+vSjlIKeR9HLMjjdjv/QmW4CyVv5z6J6hx/yTFeYJMbQ003M+2tmeCTjFjrYjbhcTK4zplqirhxts3i7qWNrY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9Gfve4+sWieEW3BlbAEX6AP4wU67ZnhD2Gz0W38p8eiSpt16q2UL7Ypc7ppob54PNXMCIpTnHD8zQkQMWSzFJG5EFLJeTQOrPVBtuQPZCcU/MunwMw8ZiRSfZl2K04Y8JScW04Xr0RmH5JpGJgxggdJDZdiFcv0da2klEI+iyZ12jVBHPmKu+ULSNgd5ou+BipmIiZ8J8O/uzq2DxzSj6q49orRlx719JYXRPw5MkS6u8+us/oHFeGV2ObVDwufcsSOh/r30X14Pvi8+b3BT1DSUyBuWuq7IyLLDlhekyQsBLiNU9v0Zy2Kyb0H+OVInM11XL8sPuilPxF1Lsc2l2kV287yFAhjWKOwGKKAlCfeSPQbjckc6inpz9DDLxNdxJjLr4leKu7Y4t6tKE6CXqk7v3ZaJ1pGxE2aRaaAEsl76dKbMrej+E3faHVgYEHdz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:20:21.3808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d220ee-230c-44a4-95e9-08decb1b867e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036

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

