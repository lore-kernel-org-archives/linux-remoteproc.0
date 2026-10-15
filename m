Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB43D3D09;
	Thu, 15 Oct 2026 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075187; cv=fail; b=SfoQWo7svewBX/vk+HpeDIY+GjDviqKB/HqvQPjdrO4qNba1YKALhwI8GQhGLAg3JKC3wP+IcUNMvI2bhC0ghYYFwKSBLuUGcaDZ4Q6Kc7VKkR1y8lZmyf84pmFdOfY7zLscqa5SqCtxRnqlARInrYWViZrTrYmitn1GKhPRKAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075187; c=relaxed/simple;
	bh=R+MqEEvNTvn+Kt+L8e1KbnRAQWJmwshEG5xm6kL06co=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ua20ffyXE2KShhAmQ8XrcXDoKTAe3oCLi5xxGVpZkmNkRhM0CYCbGLk8ZvDvB1IuTXS4D/TctbfV2cXyKBcLS2tdGeIfqIn1976EMkzInUp+ovE4VONC23Cd2vHKJm6fKGgPGdDtycS7yFtD1ojPsq3Yy0j1HNmFkUwHjq0ny+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pfa8HuWk; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pfa8HuWk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7sVL34F+Ggm0m2W+C2C39r1J3wuM+DIPsgrB1Mb/S+N3k/sJfK3K80/8YcWJJ0bT8ij4bY9DhxkiRb68mrk6LCyI75MZKx81U/Ay/heiziBFuJqxjX2kdQ5RsM1YRWYYG3I9Pbifq9L4CJH7sUIN2BlSnEteBalWJv+5e7OX5KRmAO0KIBS90Q4nWd1Y8zcSbCXggEQmGfZwF+tyjLN6uJQ5KLMyYfwDkZNKYj9n8HUE6FZIQH0BKcEPD/dPgamJp73bU+h0DgrfAYOgtnjNgX4RQ3WoRUp/mVlGewnFmBnHxnEnwaw+n4vgOcGSRChn1zMdHY3qQicIUbjo4AB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLP0iyCsDxfhg8nWf11hWSqAnO6+CyJXB9U1kIFCLU8=;
 b=sCwECB1mzbPbi193baDLqF/L7ug4VZEcvBK18VYoaIi8L9I3CQ3xFsmkLvKkx1ihmD0Pbfrq0qIphvuMC8Uh9+GwGJVc1bmlzCgNsaGHbd+jqQOViZSSEgKS2gL6Z8DQyUdDQJe7aK9bNkBjZYLbAsCFG2wdHKui4crDxsUolngYDBMmJfTy3NZy6dByugURQIi6MHChaNsZ+RlGw9ysNdZkv/Boyu1XoIanSorzwSHi9XViKEwnL0UWzzOwnhe7r2K3rXQ5Vo4Jz0uELzbNCB9LDAq0eA/tVlRGa4a5ksUVxHapX3gCSl6wrKUtPWW1ROM++SgOgt/E8+nvksumtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLP0iyCsDxfhg8nWf11hWSqAnO6+CyJXB9U1kIFCLU8=;
 b=Pfa8HuWkWRKfMPlMk2rhwTCNALKnI781vkIx4tIQNdBhADi6EqkZQFe3HF4SyARZN5O7YeIAcHOfpRpmNEnduE/tzOAVvBf0N/+BOBgdVbouEUC6oWIToamDRu7byeVavNhw+ufxPTU8Or27KU3GsCvEnnU0mP3qUJf2EPbhny4JJlVyz69/wjKPu7eBHFU0i3jO0tw0P6BXDLnyb5T3eByAgbj3KS92ezB5l7Ef5XWL05w9og/lBkFmuhCKCLDNXtluSim63pikueuvnTrN5DFqVz016h8VZr5HC39eIOcTvQGHrmjXyza/Hdzdbeq3J2naP6uRyz+G4B9xaUioEA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7676.eurprd04.prod.outlook.com (2603:10a6:10:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 14:39:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 14:39:40 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 15 Oct 2026 10:39:23 -0400
Subject: [PATCH v5 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
In-Reply-To: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075166; l=3094;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=KeHQDKtb32N839q2vs4xBvoi4TBg8ID0gzhqPOEx7vc=;
 b=6Lblc8ehTZntn8HXmkKw5ZndUYVRXQWfWuS77lQFsN1k+GaTSckON9q/pOxclYR4Ga3FsKzxo
 /iiT091pWBDDf5Z1SlFKC1rJ4DzkNuwJpQaUAvbl7PdHmnHNlcIvXjz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fc0f95-ad12-4bcf-19a4-08df2aca2549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|19092799006|366016|376014|261009223027099003|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	79MdR2d/DayscwNKG77KuNpHmS2vHCP5bbaCWAObFChgyh8YuJr/D8Og7d6xsZ5oD9P3CyOoO1WiAYh7UUJyhRliEKpfo5y7ZITHBQ4QLwHw41rNzjueQypCPW81dBp4IGqtoFhlVXzZsrMxG0rI4PqEDNx2rtwL9EdmoXi8r++2870G9SJFoL1OTRsTwx6RmqEZWjSXekZCRU09b3A//0FPGgYmmSiB+76FCOLKz0PUUZlPm5m43tWBXBXNlN9nhiU5IVvYheLGibMXzNxmcEk5Ub4r85mDG297Sxw5X1aErgXE9mbzoLd/yTpM60grpiSUvRn0pSZ6CbOGNEAFmuUVgslyIPXzuJBRrXiLHDJSJDEq8EudDizOUsjbnxtQl78AAVABrJRhjqMmM8+SEcIBTwiu3lSqeZWxJFHxiqdF9Jm4Mx5ZpGQswmcgemwm/wA3gC32XbuusU2+KHd8RkVBIVcYIrlnaS9lDQtVveYe2ag59L3lTHY4Z20dsyZwdx4kzDsrDad++ct1nams0XkQdmbSf4oV5oQMwLLUFPHjRE8NAWVB+47dcPi2l8rvStLUiYQQ4bQDWCBmh3ZO4g2PUuF5u0Cj++k8vn3+5Sva6yawuY6YtGPYvKsqK2Er
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(19092799006)(366016)(376014)(261009223027099003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm0vS2pZNnVmcWhrQ3doalR3Nnl6WnBWQUtXQTBlZmFsSkRQV3RNanNOU051?=
 =?utf-8?B?cmNvZTR6NEF5T2hxVXRlWEVqNkk4SzB2SnFrS21ObDlSUDA1ck1RcnNsOXhR?=
 =?utf-8?B?VVdIMllqamJrcmJCZ1JnL3lnSXdBMjJ5VzFaZ3l0cXJ6VWV1eXA0dFhqQ1Jx?=
 =?utf-8?B?cHRidHBXeXBVR3p5L2d3QWhsZUl5OFdwVjd1OEppUDVHanpJQzNIQW5CNXU0?=
 =?utf-8?B?T0VRRlRORDk3Y1pqQ1NzOXc0dnc2dWxINnNOVG42YjJoMUl4b09jWVdDYkRm?=
 =?utf-8?B?NHhGdlMvR21VOVJsdzllQ2JSWHpHUmVleUpENmpnbmJpWmNBT2FCNHBnVmhm?=
 =?utf-8?B?bWcyT2loVDZwVk93c09GM1NSNjZUQ0t4VU5EcEUwYXJEZDh5Yk9KajRibGVs?=
 =?utf-8?B?TnVPTHVkc29iNHlsVzlzcDlGRHdoL3EzWUJ3TjQ0TENxRi96MHVsTzJ6NHZV?=
 =?utf-8?B?bjExNGFtbkh3RHFETjlHcE4ycFFCZ0ZkYmNhbmo1NWhvSTNCeGtuZlRhaVgx?=
 =?utf-8?B?YmFjZnpPMmhzVVdYL3lQeE9XZjhMS1I2aWRDNm8rbE1RaHdUSW8zZnVlMm5Z?=
 =?utf-8?B?VUFmM0Z5Rmd5Q29ZbDlDMTU3OGpzMXRHS1BueWZtQklMUWYxUnh3ZXlwWm13?=
 =?utf-8?B?bXFEUnRZa3dYeXNkcXBMQXM2TVMrSkhkMGNoNmE5dm1ySDBwek5ndmlSMWVX?=
 =?utf-8?B?MEEyalFhYm1ndXR6Nk4vc2QwaFB4UlBQNytXNTFuVCtSb0tkOEwrMExJbDJL?=
 =?utf-8?B?SnhmRWRMV0hVaGtxU2hOR0FhNVA2TVV1RVlVYjY4RVJXYXUzV0VLN1k5WDBJ?=
 =?utf-8?B?MmloRnB0ZlBOcllYRUgyN0dzSVI5OXpmKzRoS3YvVDlTR29GczRJeWZWREdv?=
 =?utf-8?B?UnY2MDVKRlFzOG8xRGIyMThpR2NHaUFuQmVyQmJpWGluazlJdXZobkFjWlRk?=
 =?utf-8?B?dU44MmNXYThISngwQmFaM2hRMmRkd1hGVFBvUkJ0TVdDY3VYMUlIVmg4NXZJ?=
 =?utf-8?B?aThUajFKM1FoV0RrYytoSDVxN1dVR1luYU1uTHRhZStncC9QZDRjVklHL291?=
 =?utf-8?B?Yk13ckIwTDZNM3Q4M1l4K0txeU1XQnp6b0tqbHJTV1JBV3JackNja0x4NUhj?=
 =?utf-8?B?L1FOMXBBOFd4bllFKy9jemRSOUc3V08xbTZGb3ZVMFY2MFRkZndNdHJXZmhH?=
 =?utf-8?B?K2lYS0hWU0Q3ZmptbnlKditSK3dmVERJTEpiYmh5RDF0RFNhYjhSaCtrL2pP?=
 =?utf-8?B?M2lEMDZKdTBwcWtzbE1TeVROZHNkQ1VWVHVMTmhuSDA0TWt1WTFyMUpzTFB6?=
 =?utf-8?B?NUpGODlGUjgvcHNHS2g2dDZaMncwM3lDU0JKWURGSGRiSzd3UHB0OURubTZR?=
 =?utf-8?B?dVJQL3RFakUybFp1aWRzWElzblpEWkJWVUh4emNWenBlcUtycURWQkowM0Nq?=
 =?utf-8?B?R0R0d3pDMUh1aHJMRTBvL2NmYWp3czBiVE0yRm4vNkpObFlZd05DdC9wUEtT?=
 =?utf-8?B?UWpmbVFIUVJWcXBnUi90Z3llREFEbVBVdWJYNk9tU3hyNk9kL0lyTm4wZEdh?=
 =?utf-8?B?SVdmemM1YXlVdmNyMm1pVnZpQ0dkZHNVS0FZYk9CbGV1M1Bsdzd2KzZpbjZr?=
 =?utf-8?B?K20yRTl1NmYvQnk5NTRuVytKeUlvUTlnTGZLUnd6WXp6eFVyZG8vQU94MzIz?=
 =?utf-8?B?blRiZzNqczRMbXpLWThmZ2xlSU8wenB5T0VUb0ZEcFIwR3NPSWpYcVJ2eXd0?=
 =?utf-8?B?TlprWFRPcFQ0ckFzWUNCSkNBODlEOUJ1VFgwSmFmd0lwNlYrZUk0M2l4S3ZR?=
 =?utf-8?B?UHZyNkNDa01YY1RINm5Wb2JuMHJ1QnY3VWxVQVNLZmQzRmlTMUtZQmJmbXYw?=
 =?utf-8?B?L2FBQnFPeFpoS0hmcW82Y2dSMlV4VXpkeHphbm9ta3lTZHp5VmNwNmZJYXpY?=
 =?utf-8?B?MkpZOGlxYXZ1d2RlNjF3cHR4R0JpQXlFams1anI2Z1lMQTd1eCttWWlPU1pr?=
 =?utf-8?B?MEN2WXZXeU9SaC9BTkRnczFMSXZKZThKbXR0T3BoakxYWUhGbXpTanZIZWdz?=
 =?utf-8?B?WmozbU10cFpObWZMR2dPclZkNHpQMjZ6MjJ3NW1VeCtRNzNVREZOaWRUU2Jl?=
 =?utf-8?B?YnZWK3JOS0wzME51RzlUQ1ZLU3Q3Z0V3SEFUNU9aTW9KaVg3ajdudFZ1YWJX?=
 =?utf-8?B?MU1yZHJWem5tcU1sMHUrRE95bS9kUGVUenBINVY1SWwySVgyY3NSYi9WMGcr?=
 =?utf-8?B?d2V4ZERwckt0czE1RjR5alV1cWZqYUtUdGsxNkEzZExZazhYQ3BZbGo2RkFa?=
 =?utf-8?B?dWJyNm04QTBRRTFJVHYrRDlFSEMxeVlHZ1lkZllJbGxQR2ZjYWxMd2pGVU8z?=
 =?utf-8?Q?xLnfYFbPn6Z63a+NKZO8sCfPVQpXDAfTdZNHS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fc0f95-ad12-4bcf-19a4-08df2aca2549
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:39:40.8865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiD0iExCJE7o9vdY49KqbPJhoEMoc/2HLz4u/bm10J8MUSxbO5bxQAbJQDSthlsJ/c7kB/vhVgKqfVv+wn8t4WCDSDo/hsQveks9cOlJfMRttDlYkPbhYXQG1LHRM1hU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7676

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Parse memory-region-names to identify the expected memory regions and avoid
relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
 drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893f..63a1a6d87141a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -648,7 +648,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -823,11 +823,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a109..3632bc375c711 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -7,6 +7,8 @@
 #ifndef _IMX_RPROC_H
 #define _IMX_RPROC_H
 
+#include <linux/of_reserved_mem.h>
+
 /* address translation table */
 struct imx_rproc_att {
 	u32 da;	/* device address (From Cortex M4 view)*/
@@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */

-- 
2.43.0

