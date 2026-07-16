Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013055.outbound.protection.outlook.com [52.101.127.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784A4229A6;
	Thu, 16 Jul 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207385; cv=fail; b=BD7rTUw32w3mRwNmZAIYJ4kSL5MytKivTbYzMa7VW802aAogI6CICnfX9kFqKbWFV6QpjfSz60YnvN1CKwme7uXanpXGg3Uah0pRJlEliC3B25Tu0B1qkHzVKV4hidfZ3Idy5fS7294bBiWZ5S8sNkAPGTkG9iVj0YjFrQnTp5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207385; c=relaxed/simple;
	bh=ibNreMuQP0jnbkLvc5HPzv5GugAKY7ujwDOeJXUPHgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uL0dmZMf1LbhGCkllPmPwq88bNnSiPW+CttmhjHt5k52gX+Yz1cKp+3mvWwRi3tVQXzvk80y7rgepf5OLxth470Kj58W6F2giNtSVpIfECO03VFxmTtsy5fVCgVvJuUTDwjj9hHMJADlFggrPTOQoK9z4vyb3AhbKrBCsNx2lcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qIN7NZ93; arc=fail smtp.client-ip=52.101.127.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qIN7NZ93"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFOJQTZXLexF5U3pyrkwKThdvzwi5u80TlH9xCO/zJjYBUrGI1yzhoXfq7qFBTesONIqOu9cT1l2jXHVO5L1ZKv/7LHsdu/sKai6RZNzH4yw+c86iay40bOIhEAGap2Uj7mtmhuWyFuBgUWJ0eAPvKr80fYdxMIAeSDHiTOMHVigsotUeCQAUOQHrtbgw8D/0TlvLbqw3+BVp6HyjVRq3Fcg9UyEBLznsF6d/VcAsHD8mgb1a3Nrd07n0Yocni7EXx9zEKVUv63nYMakLYI/Pj4vJ/oXSsJw3xLztDNdBR3J45irn12ZqCVOg4QFDJaoE1lqFTLPLLpJG0KOz1rGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xizWcmAODdk/XomTUn9veexHLQMRsy3Ag6ncsMBhguY=;
 b=i9mztFnwY/iakRcc6pIEvEzPNV2MMaOPUjeU9dUle2CqAifMlnP5D4nj1/Jf+ETHgF1DUgI7hQPmdrlH/rgsgAWHVC/gupua8tc93jkxFqg90zHbHDMMzYsNPEHYFU1CMNaRI+8Sbh+krL/1gKhTORgrgiwA881gqqOYnzpsy5mDGFkQ2Va/Xuw3ntIAem+utyeCxmW4jGuOI4yro+CLzXG4ZhEQ9lzy1b9YGzGHX3AWsD6NJ0TB+NZwjWHSWFa5YmsNmBH0ruo8SIGJuHlxq5irqneSgF4vEXDGohxzUZ6W0O1oPlydYjv+C4fLQDj2iZRG10ZniltLv8ZZQXeexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xizWcmAODdk/XomTUn9veexHLQMRsy3Ag6ncsMBhguY=;
 b=qIN7NZ93Mm9DIeyw7IyP62sr8y9J2ZOiUgVB70vTKmd9sZ4Nb/1Lhhc31RzpRm7dutIxbhnXmgZ2h9Z7m6CdlBKbD5a5exvfRv6+xE9PuIPpGqqVYyEET6YCPFNs/ho431x99GTJTabINVPBTaI/oHbN2h5RUvoHALi9B43FZziqeFUpbAOiuggLaALeVNqJUoQm77Vb4s1ZZ9dZwtdK3uS1IRcYhVlqLDAZuKRKmMJ9bvhGbpJM6FE5BMNz9Ij5/o/28rNeAa+6XWCWGs8uNoOzKskBnXknaFEgEr9+W2Dl/8zArLobXnRWh8QfQwg7FjaymzD9v9MQNkU7OUWF3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEZPR06MB8885.apcprd06.prod.outlook.com (2603:1096:101:339::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 13:09:39 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:09:39 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/2] rpmsg: glink: Remove redundant dev_err()
Date: Thu, 16 Jul 2026 21:08:29 +0800
Message-Id: <20260716130830.519740-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716130830.519740-1-panchuang@vivo.com>
References: <20260716130830.519740-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEZPR06MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 842f34dd-1b7a-4873-36f3-08dee33b7de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|11063799006|6133799003|56012099006|18002099003|22082099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	KnpwqbSQHmt/LAT5w5G4MVRUhx85YSsCG1RPcpoCQm/rfxECcPPnoEGrTVPk+7JHV/xnvefpJwVFpL+FSgVm195PqW0iPwuRsEiShNeVBfgNfjFvsPRgN8VFn9HdZJWZv+UeItdB0J2DZFyTPkS7xKNBiQrRoGh0UeLYzdNarEi0N2qt3p3H8C71cgQkCIxP/f3Flp8r0Q6JY0B56ZLogbB6saIgpc7BGPNCTyMZMS3uG1bZVJffoKH2aUaWsV+hh5G5tI8XTOZkRRczSHidSW5k1fzChEtf+AFJ4YcG90EjtkZH7axCaXtu3rg1p/0f95rsI8RObV2UH/gMvnGbC7ZNonSyO/GlCL8tsURMIlAbsayR5AUFg4qzalgmERDrZN0OtxFTYc0LcAu30J/6P90JJuEZiyDSnP4uDAsPu3ieSw2TOaT/OPmF6cXnK5IUoq4iN2m+aG1NoTRE45jp32WLU5QlR3Y1vrU/muxrgJBgtXB+ZHPFyZUhskhLipcOLFtoUyyvOychVmzjIjQm/hQafLugl77W874/vMct6/5IUxX07J9tXShYG2U6FQ7OMnE1Ffap/2FeXI2AS9019sB8p51C4oT4sX+3DkXLTxetoKctEC65OgA6RKdSAcWdXgy7A+bpChGxuooZFuNvL5e5rjxZn5wFK5tvGy62zlDTdNMLciUzoz/9a9oNkhAqz73QORb7L3WAHUX+NBx2mspznu2oJe8qzSKFtJEvejk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JCB9Z+zLsAag0AWPma90v8IQtU2pqZ6KZ4X5sCRkval17+a0fLsH9jDzMzja?=
 =?us-ascii?Q?+jRUn4ZKuD/3suxIlnrwKVEEiEg8pvZSMvh+vHmJH+DHLyyDQmhyMavOlQGh?=
 =?us-ascii?Q?P5GU445r1zIXvkYlAdPjglGLvO5yJx3ARlA8JL0fw+JajYQG4JEXYxunXOPE?=
 =?us-ascii?Q?w6hVDnnBMAfdVjiJbCMJ5YvDPvouBTEWt7HzlWLBnskg64O8KIl7AYjAg2XN?=
 =?us-ascii?Q?m9CUV/IWwpBq9lTeH+NUgk5BL6wTL9d8G8xZJ0TqHg1TlOV/rsXZDJu6pExh?=
 =?us-ascii?Q?tzk3B3ZlGgoKJkgYuQVsa9CHgmutOA/E6Hdp5rm/PHfBl+Xuko0j0j93Zmq7?=
 =?us-ascii?Q?RB8h+RY9slyZaNpLGDVvCNeldKd1E5Lq3twX7htCJBMwiQ0jwxIICsQgjM8c?=
 =?us-ascii?Q?hyo+RUNN6G8A8zg20wW7cb9iGIBSEej6b8hjNxtMV8XQFnHKWBtQafoU4w2d?=
 =?us-ascii?Q?njMGff1FLLDnkBl7UyPXPPQ/0CQ5xSF81B9hT7JPh0XMFSh8NVwV40NlvRPq?=
 =?us-ascii?Q?BPtz5fFCiDLRSV4gO9FJhM6BilM5neR1GWZcN+94AuvrT+wVWw5XR9Ncxl5A?=
 =?us-ascii?Q?Vxu136V0HPK4PS+8AJWENH4qLb4cLtn3WP6elkOnQOOG739X8VdbQL1btsgH?=
 =?us-ascii?Q?zZJHkPqVcOfkF2Uwh9Jtn8ArMDYnd80WH+5U56IZAihVOR3kJROosW4BuIpT?=
 =?us-ascii?Q?MwBgUL4Sy7DdxYgFOEQ92NW1ngGsCPnnLKJraxt/I4g5Hnrb0upcjLR+XElt?=
 =?us-ascii?Q?l6x47RCe5QMe7fho8BrRI+Y2a74Xy0dp/r1htFwyPVc1KUk5OLAwjzqhxqrK?=
 =?us-ascii?Q?uvvCkTutn1n2G8dmDOuJFQ2F3kU4BGx163WZscgbF+TCpoLr7GecEcPVVsD7?=
 =?us-ascii?Q?OGyg8VXL6+L0gQG16M0+qs0afCbetV330wYWZItX54MMvNo3J841Owa/aLGw?=
 =?us-ascii?Q?QF7/0JUheWNxS1BnFGV2CMvdWGiZL26t/zR51gm59ZvU4JFf5/BJ7QI1fHfX?=
 =?us-ascii?Q?ylbHo+qUd+/K3XAyVudQDiwFTc58q+E3AkkEkVCHt9rrChPD6ZNXlLmnwV6V?=
 =?us-ascii?Q?xl7j46BsnoOGhKtyVOSUZV6hTiopwbUC1448XMQliDiuNI0adhl82R8whKG/?=
 =?us-ascii?Q?RSLGkbS/aK4TP/zXn0OjULzNDSo+TSyWRE+1uVwr6KbS8vcjKVrgvMjSNzAP?=
 =?us-ascii?Q?TicELpFzBdXeFP4T4xh84Iq9Q+7jFhl69fPoK7Agg02o7dhDmjuTIpAdZTy+?=
 =?us-ascii?Q?stdwCxryx9TQyso493A8uuC4NLF8FxfFKmAbyzeSdklUc7bMJB247dFkdPYn?=
 =?us-ascii?Q?H3EB525Hwx+2Xl8ghByRuT9z6dUao4p+9GL/5sO+FV6GR2HEa8AJ3b70kzs0?=
 =?us-ascii?Q?Q8Rlesp8ndZ/NbCBJkOk7pEdbYO/rvRCw+WuS/cLb6UJyKn4RTn6PZGR0uxZ?=
 =?us-ascii?Q?bzjW62uqKb8DrhgBTOWR5WgdPuHccul2AtEgNO74fLRH/54int9ruHJ8KqWZ?=
 =?us-ascii?Q?0bxAz2GR1yh3dHoxfHLv6XGuCZ0R2gIDaRwgE2Dfcg2tSANf/fxSNpuXqKoZ?=
 =?us-ascii?Q?MzDw7/L1bs2Plw5J3xEs0lQrC02qXQm+A/F3a3I+b5j5ilrF8Up7BjWFOyQM?=
 =?us-ascii?Q?roAhsiOhm7794ityfHUbCWJXr6fNp8o39fxsrDzevh93Fi/OVgZ4Tx8mZR7c?=
 =?us-ascii?Q?AiGBZ+taO+W1gPfDZT4NDIYIlM1zP3tGUPb69cNDcH3E9p++AQULMvkwXc4U?=
 =?us-ascii?Q?0uei3iMlWA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842f34dd-1b7a-4873-36f3-08dee33b7de5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:09:38.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xrRYb2ZWJrxaljXfDm1taxnrmrbN601XStaFsS5/+uKqanGo3ySv9SV/n6QxnghS8ZmjyOuLjgN17thr/bgGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB8885

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/rpmsg/qcom_glink_rpm.c  | 4 +---
 drivers/rpmsg/qcom_glink_smem.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..0662c0668f75 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -320,10 +320,8 @@ static int glink_rpm_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, rpm->irq, qcom_glink_rpm_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
 			       "glink-rpm", rpm);
-	if (ret) {
-		dev_err(dev, "failed to request IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	rpm->mbox_client.dev = dev;
 	rpm->mbox_client.knows_txdone = true;
diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 35bb03e67ae8..2217a1573b16 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -315,10 +315,8 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
 			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
 			       "glink-smem", smem);
-	if (ret) {
-		dev_err(&smem->dev, "failed to request IRQ\n");
+	if (ret)
 		goto err_put_dev;
-	}
 
 	smem->mbox_client.dev = &smem->dev;
 	smem->mbox_client.knows_txdone = true;
-- 
2.34.1

