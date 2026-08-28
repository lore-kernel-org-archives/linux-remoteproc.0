Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89F47254D;
	Fri, 28 Aug 2026 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929170; cv=fail; b=rjfcmGe8/WEM1AkYpSLWV0Ycwr4wK6D6HfAZ765P5iuhfVGlZXjpNpLScmCabEZnllX3qSMRiPTraZhs3S3DGGxDoATFvQ1726dGcJE5yx37lng6ppZlXnnrL+XZZKwRFhemc4bxmNTWAjonHLKQaWyMdhlAu5gKAiLqW1A5Zn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929170; c=relaxed/simple;
	bh=6FSaRj4736or+Zf8/4PcIrsZ2LP6BCg2fP7s+siedfY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+Eh29xDdnbjp0jwPHmBFmsaeLqbuO0r15Yl/HaRdJCOz2rXj/BbOWboki3REFCYK04nPDFflyogNiTuq+/5FYKVTakRcmHldG0bn5xAAC1DER8FRwLzM6wBbUvrbA4GKZjJew5rCp5CjbVfhBNeH9YZ2ElENuVT6s+qKWTvfW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xjCFvRzq; arc=fail smtp.client-ip=52.101.85.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xjCFvRzq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTrsI+/uRpMYAs8swx6wNpLmPMiuiqoZU5oV0Jdg+5dwpoylogYx1EW+CWHmxn7Tsj4BB3iXnRDpym0canLqAUJdjQgcNqHOcO3OSXkyLWFRNyaUm/ymyGE+sMUZpW75+MDrYvr4FQStDGzD1O2KBUQvSlc+GaXKV3EHq9oak0zCz6bID1XwTJOF2mEfUimZT9VpNYWTBI5bMaFiXFZK34qp3C3JokWmD7ARbwppgiuDrbn3Tc8H9V6j7iOXCTjViQlteknhAwKcJ66lGr2o8ezkjffxd0nt2GvWVEJA3cJY6wKsz5ja0n4gklP8/z23O2MP0sQ5U0O3QnhRQgmOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J769HliW4fxBV194xJirW2tOnrEtylKNpQmkp74aF4=;
 b=apRABBaDup0Y9GbXCMu6hR6gXVotrqiwmW5yjWNTP+kKcXhdDbBYR572YWcd+hDXZDtRnlD2TltdihSpLSkPeprgk3o9gV3BXWo1acjdM61DG0Zc1CnuE1aDl6vCc1l7jsGzVa7Xxetjdu24VlwYKdncWn/QmhBpsvyjEPfP+D76Q+q/PZYVMgzyFm23OYQmG+aXACq8xgj9z3AcyHKtqIqWVMY4sa1s3bn0JRAOHI9BTrNN2E79JQN1UEU0XjnssL5rzMVpd5FiWuqi23Y7x5SNIBUcg8u85XvYkKmhvbS9dSlmk3HCFLWFAkxaXH/txdUeOyyumzEsrRUws/J0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J769HliW4fxBV194xJirW2tOnrEtylKNpQmkp74aF4=;
 b=xjCFvRzqFJTro0F2pFzBcF4UqwVz+hrFfdu4RkKsnIlcxB5rehvU+iqjm/oRsISKiiJdvboiIx3Rcx+YDMMVcj12mXBMuarkcER/Pqs/xsgDbXQPs/DdsLdg+PomKvYSVumUTG9z6eom8/K/ZVKw7R/hys0lFooKnlpd5x2ifMM=
Received: from BN9P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::11)
 by DS7PR12MB6310.namprd12.prod.outlook.com (2603:10b6:8:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 14:59:20 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::25) by BN9P221CA0023.outlook.office365.com
 (2603:10b6:408:10a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Fri, 28
 Aug 2026 14:59:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:59:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:59:15 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:59:15 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v8 5/5] samples: rpmsg: add MTU size info
Date: Fri, 28 Aug 2026 07:58:52 -0700
Message-ID: <20260828145853.2843486-6-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828145853.2843486-1-tanmay.shah@amd.com>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DS7PR12MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: af4d636c-c393-4bf4-30c4-08df0514f058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|22082099003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	YzHWGKvxLLaEKhUJHxHsMIT2O0/sk5fWSm00snKPLzyTIGH9aUgZdimRFfrGgvNkRS+p+AbLNpcS4jpEFWWd7GllYXKJ9f9nz+whBsyH/o96BNnHfcKfW4keCol0MZIWrEKuOWqHwWKl7OKWgZHPukpR5OQCLGuEAlfhAQ/Aw7fszDsq3HPoEszSDo/u58aU00E4LnGVVsmp93ks/G9P7SE4ETxwd0sTmu76xGJ0tOzeirUktf96CQ9b5cCmnUrnJrX9ZWbSafZ6ighNfoknBH02waE2Ujcu5I5/AIPLI27x/gmU4rgzHsZDRD1ExXdLoKaPcw5c+MqWmHciDpal3szJzyzE4JWzXDzmQ2NdHNMg2k+MbNcgeuGFkdQZA3oWJa5/Dk5i3SJPBokg5zSy7gvE99KZer1uak0qJMUrB35XXVjDKD0qrXa7B5gXZcy2CWyUL3H9QweOOT3gE1JhV8se8h1NP/qmhRcd9T+YXkfk1rh80KE6eLeofBUvlg7OC7OfNurzzInZl1DDKLMAfq4tDdqCuQ9h9i7jechXdZW8XP4CQyxsfy0Wa2q1KZmoaH+eS6yDiAOcQBpBHSAqm7QZjulj52g4Nyw5HZFqVPe2+ic2/rmSiVdV9wnuKLbPimFSmPblKQ1dps+33e4BY1ay/B5pIETWEFUrV8+D/unAnvp65rfCwpEyXHbvxs0SEyk0R7Zriz7XXgF4NaMEiA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(22082099003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SYEa0z6NLS/XI+q7m70mLAZ9wAMFbJqjSeE31teDAPqZgRdPVi1UUD9katlo7+DtUGXBoj58naeeQ2pc5JA4URE5FGlStgl414tOVOvOfb0D1GO0vzNnq4rDzYChhtjczcYv/JSbUMP491CO3nrAqg4nobiixQbD4/XI7MhUhBQu5nHWgWvy0OC+f+xU1IEjsxqFFE8H3lyaQoj80rGrZPrBasjH4ZS5jjg4U2EXex8AOCKNwnkXpHCTY30CVe+Dl1YC/CCg4JqzR2GCEZHSLoFvUiodRnGTiBgkNGYJphjd2n9glG21gy+JOUpBm9jW8db4vFja5j40h3aSbZoToF1ZWXe3dk0qen58iLe5c3pw7LAX3Q1Gwy93LkWImW/Ie0xHWBdguYjOfUpnPfiR+u8u6Y2f2e+I5siONBkJN0Y+1sxNgcCv8+8c/eLIY82S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:59:19.9342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af4d636c-c393-4bf4-30c4-08df0514f058
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6310

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
2.43.0

