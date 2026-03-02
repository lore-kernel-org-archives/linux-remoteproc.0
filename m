Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29C48167B;
	Mon,  2 Mar 2026 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483255; cv=fail; b=Qn98QWLiLRzyKPOpn1tIdFtBuPqCBNQZyi0WTvWQNUpuVRwOt88WFUmieg9kJU0uVuASJtr68K1ll+NEritPa0ocxgcQeCrTqL3YClQu5cztW/a6UzHcs0hHyG78JqRgMpBZUJQKDtn8N0tPw8COkVBwfgAegTASQGfR49sy0po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483255; c=relaxed/simple;
	bh=yTy6iIqY3Z0bOIrulTFzwQeyam39UsQkxc06XjqrNKM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fLa2X24LNw+pUYzyJiZGeI8XYgdWtTPL5psLn22PmQKp2Dkyn5xLkU6TghHAow8eaik9RfMCamAxC+7tAyVNkQLxVInhzr7JiFvVdwF6VTFKGjfkRPwM/f9CZlBJwpFftTAIHW6aw47YX5uChDfaoYfQeR3XvOAC55Ow7RekGpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HoEay9+1; arc=fail smtp.client-ip=52.101.48.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HoEay9+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBLa3iG+K2FNAyixE7thaseSya6ubdOAsa4w8mbTC1jwZAnAjQAzQWBNxhFlotwqTSPIHpymGko3jXFqJctu+mQzMg/UXspREyMvfmLkzYwk4JH6S5Y9t6E+tG44fCPrX07i+6l1gJ5IC65v51jiDjrlc79hkVgXm1Hw5IWkygLqOwqZmItXkzs3xJy/Pt+zvuuvULXLWhGkxkwOJvIcoMvM1muraNeksC16qPcaXPIjwMVrJyIO1A8UVwEuQgu43wbWsCIyC3IJEdqZpFPHzJcdN32GKGufW3GD/EYuZ4ovYU81/VBI3ZRRBvEhhH0JxgZTSzaKakl0BP9PVY6LdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H14ofSTClpWAUDptjBViyfMk+XUGbhoMsyz71l81e74=;
 b=YGZeOzL6u8mtiupBUhrRtGzgYJuFzYEh6SC8FZNeJkjbUDNMlVpMyUIUwNV8hF7QFfCpEjpYotAiRWJK56/1H4td/KmaNt3d0SkblhzA2UhuJZP/7THYHxp/Aq7MrrSBjyStbx2R9FYaopRmnS6LE6iSt9X6G7VIUnOcI5/X/og7gjfyFVnEACTaQRNuj74L0b5PJUNHIQYtS6UYOuWVsd9+CHHX9sTIx+yLIuhVUahrW5Q9uDZ2eFc1rISq/Fwpcq6aTf2xlFixEjXrabOfu49xS4Fc9cgHJjxT77BXHVwFL9HLYOBTwkJOFmndrCWkh310jikfNAHpGJDmL1qTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H14ofSTClpWAUDptjBViyfMk+XUGbhoMsyz71l81e74=;
 b=HoEay9+1jSQmvrBbeSpHK7HFCqpSHXZThYPUGVu3j9SsWee9yy0IcUkgqOZXMfnFd91JaKp9d9C8/78MoICam4J9eBNOrCkLLQpdqr4Grbr0L06OPp/rG+Gb1FcOcTisszcipp9Jr4VKYPS1KQxU3cpVaoiwBVIQH4A8tsHu/Jk=
Received: from SA1PR03CA0013.namprd03.prod.outlook.com (2603:10b6:806:2d3::9)
 by LV0PR10MB997637.namprd10.prod.outlook.com (2603:10b6:408:345::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:27:32 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::3) by SA1PR03CA0013.outlook.office365.com
 (2603:10b6:806:2d3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 20:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:27:31 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:27:31 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:27:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 14:27:31 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622KRUtJ1383398;
	Mon, 2 Mar 2026 14:27:30 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Andrew Davis" <afd@ti.com>
Subject: [PATCH 1/2] remoteproc: pru: Use rproc_of_parse_firmware() to get firmware name
Date: Mon, 2 Mar 2026 14:27:27 -0600
Message-ID: <20260302202728.322073-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|LV0PR10MB997637:EE_
X-MS-Office365-Filtering-Correlation-Id: 5348ca1c-d6b1-4066-b02f-08de789a2190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info:
	mrErMI/k99uItTrHaJMcr9fPGFmoeFr1XGQN9OTrl1jSpiAFUv8uKg11uWzZj5P+nEVhz2fnK/zKuHZ13w/QBno5hmQcs0/lcgNlD5Qab7XspHR7oKR3gumk9tu/ThuX2eejM8lLg0H258GBhL4fp0MqOgnE+MtLyNFyg3Ccz4NtYfBuGFknziL4l2VPl2MrNCghtd/wZ3Fl+cA1K852vWSR7wOe9x4x0MUIwtHAJpY36zNOic61dT9TT3pq8opsOfX6qUqpefUFrARY0RRKLFnH4/O7tI8eccWUHAEAgC5ZXsEu1XvEZJzGvxDgl+yyvKP8ZuRYm7glVJvAvqOWV6Fjl9R8Xd281o1+zNdPYDDC6OS7EPaLLgMgVE5aauOtNVpX1al3QxTGk3mvjomQApKAn2G03L/jZR6TB0ZEFsdHustPuyuQIiMrLP+4Kly8lZGRO+ZezwkehHPUWTvPTq6ukVtfaBF4BvB6/knBGQ6k3AGRuUWUXRhzx8UdlSj6NfW6CdELHXcHs55tA+2wjnD2SqyTEz2tglbHkc13znVpp+RIZZCTfeWO5+6g62NwoF73v3W04tNhbEgCQ2GSmAWd4a9gxKx5bNOzZIXohvysS5+jLbH0hrawZlaVR8hMr7lheVI6ml+JLwKf3x5pAIKh3kBXfmoeYCZVFU6sNY1z0BdY+CRfqvMpbtppqzD+uL2Zct/ucqCFhKx92Edq2Ejo1HJwEYysSOmx26g6mj9HifUxqiwoxJUbtNJmeasZgwanTwOtL+heY/fe6KIENbfEIv5F5zstO+B/vzfdi7tydGaYyRmGkAw5y+RtIZ53mFgh9gh1Mv3xEHoJrj0PJg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FNkutKqLOdhsoeN8imnEI+SDH+ob9XpNf2TCZHbRVFNm4CrA2wH92X4gv6cV15F6oBqVwmFh5x6GRIXEjuXla6yFeXFaRjPfpvT+5RChi2yH9lzUuXezW7MatrtBQKkxGy4JoxUTgXRJABU2TBF0yOJER2Et5ioKLosgqiBaBJy/PK5sFRFIJR0VymvHCQ/7BldPIl0P/z0zPWHlaH+IghKMgMO/QlubgipNyeWIxnzRGQqk/0aMH8igIGkDqICPJIcXUr3VWRAun7wh+TDkvmIjQY41Oebk3JLsAKLr8uKIEquvtKKu7lm2NgiMZNKf81XzBgZ3TvKIWIRWayMU62eUZUF0bHKmhtQXeVS+zRiOQvgNu4wPNRX9rTtn9xwPkNBx0qzooAkpJtD/iVFf5NtPmR1UxVXObZi3OnsvSyLr9XnAu2jBRD5cwZ1aklKh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:27:31.5868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5348ca1c-d6b1-4066-b02f-08de789a2190
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997637

There is a helper function to get the firmware name, make use of that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 5e3eb7b86a0e3..19b107d29242d 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -1003,11 +1003,9 @@ static int pru_rproc_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	ret = of_property_read_string(np, "firmware-name", &fw_name);
-	if (ret) {
-		dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
-		return ret;
-	}
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to retrieve firmware-name\n");
 
 	rproc = devm_rproc_alloc(dev, pdev->name, &pru_rproc_ops, fw_name,
 				 sizeof(*pru));
-- 
2.39.2

