Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A7B3921F8;
	Wed, 15 Apr 2026 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239329; cv=fail; b=PMJEydsBLrmEZe5RVZvrklKoRo6yeFKJZiIy8bA51pSKSlPUxfCt+zmLezn+u+GVMRHLMxH4qWkhXl4kcSkkPCHFgTQvdVxXKfRfXwDFlxizxSrL0SGjX6PEim46uDFy4/BT7uw7vb9/L60/zQdIOgq/lz7y/N8gkwj52U4y5Q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239329; c=relaxed/simple;
	bh=/m97GqdIwt29WMWJIH+hd3nn5R46OEafhherGRzLWPc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gMgD0KiPZgNoFbCnBcCoWJkpvZgLkU6vMLxsBEh0oj6LgNPVvl/57UTKfxZa+K1Q9mqnHuBy07/+T+uIfabR1s3BAKU75oxNgqa9w7INMtT6PoB9iBFwpTKtBmTdsSah08OMmQqRSdOx8nYEEFxtTgDCHOI1vtoGnkuzCGmG9Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t1hWa26q; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t1hWa26q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSJxx1OV2mGzYY7RiKzk9u9BFtD8DVvW9v+HHAX7TrnnaB5INCjnBqnuR+2zXsO88ze+iiK8adPToLmKMNgpdOoI7VfJyNdIj2Zhybnfoq0LcdrYVTmbG6B01fEA+G9RNFLCgAfEK1T98vXm6q/8IiDzkZMnks4ZtGDYnD7hb6goNVXzYfkIje1kgnZhi/GsvwJkImcVEgRUTQRRvyWHE5xnc6yu+/pqCiVaZDCn2fCr44/1zm+N9rj1tXxSDvh9b+CIp6OfXDSICz5rqqB8nXdDPLoJeN2rAQWZnDaGipXbckJvb5Xb3PyJgjA9PoCSQvA2Fpz6c8L8CIfCL7GcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ0nuoIP6+q1zpHqviXArpNnedMN/7Gd1F+BYpJavnw=;
 b=YVNy44q+9N+2Ky8TkVEheSlELevrk6qY+7JEZdU6uzopNd4b6lneFPGUAtaDFJ649YX5h2F2Qb4KmuX49LoTXPkssLE4uZbIW7nUBemWM004LfJF4UZ9JziwPvuuYdlfRwnTVO+WpL1MjAC+08ltcJ0mB0k9NWOD20S2YBzFTKOdx59oLCF7yZdyQ6XWAY2Cn2rvxHRpD0T9yw0FCf6qOFlCvQtS8PEgU3Jg91q5tJAKzTjXEn/WvwSCGAq/7O9r+qDpjiSf5DiTuQ66iKsCuKF4UN1vJzEG04NAL4iFDL5ntLjz32MOJnfNppoz1MBMcWIVcK1eRMrfmhBkg5HKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ0nuoIP6+q1zpHqviXArpNnedMN/7Gd1F+BYpJavnw=;
 b=t1hWa26qDKZeLLr0ctLWwyVNTmp6p/rle0v/VfWwdGBIANlPyzNlBsIrvdfuJwua946jaSAlhJ2ExcC9VdI4gtZStMI/qK6CweiB5bInpO5/9hRx8Tsy62EC6kH7LUDRg8fF5tCg8QOxs5k05GlmVXNXgmDPfpVlatggryBh1CQ1WVh01hZ3TlhgL/Xp/cAymAetuFNU9mrDz1qxyszFcQBcABM3mL/cCxP1U1CdHdvxgX4ZgaSidi59MbM1GatrUa19a56oHwXiIvtL/uIQngLofZoq97DPrysLNa2LpWH1K0NmvCWTbcmDP1W04fSn54D0QE5/SmQ1WlMFBlUIcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 07:48:44 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 07:48:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Apr 2026 15:50:38 +0800
Subject: [PATCH v3 1/3] dt-bindings: remoteproc: imx-rproc: Support i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-imx943-rproc-v3-1-9fa7528db8ca@nxp.com>
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
In-Reply-To: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da09294-6893-47b7-7b8d-08de9ac36ae1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WrdzwLG1amrWDot8QYw4PJtcwPgKW57/QAaMhgvwc8r7d1a28XfKsrq0Hb5n2Lrhvu5vJngS12GBIde+4vg+eAMLtNvtoZcu4X/aQr5M4Thng9SdazWg6ez5tM8lamUqXxQiMfdY04kx+znZYviSmzGqFVLQj7xrnWquMThlI9XeBGuFVvPkNwc1t95JEzdyjMa2dFRTMe+PtR9aokI/AiQ59GOnqxFtjPJmXSg4B2XkshHRPrKr0fQHMHfUN8YEPaIKd0GX0ouq7hDN9PzW+w3zAAP/9Cg5bGrtOLYizEbYnRGeHYkqwltLlcGIHs97/pwvjQ18RuAB9gNvCZ0iPifsBJv3Y14f0FPgfgiZ1xweFOi0xjXCNNCjGFPM8WUVlAiPo8anZTJk0ZZ1oYfdRbn7WHE4p1VXHN/3jKrva4CFm/I2IPyAeymqEV8HpEj7qSbMfmY6V+oS5o2mNjN5lc1GMxzPRcZk8TtUhSEzqXZH1TrEr5fI6cfSxgZ2uxSTDlaivLqBRcb0T2Vlxa2TsCKDvpoeNpMAcV3/2w+0sg6zhkFEHJhBkrKP67ce6g1cWdIXPo9C/k1SpTcmS72f8ZWSynfk6JJbKY8xptFRsLcD6GF8oQk4TJ548HKwB9vOv3oUi/P53OPJattxgABGipIaVW1hdicxy6G3ch2JgK14+8E0XrCRZh2u61EFm8aV6biCa7Fk0RqPnApZ0toA4zYNt0T0HroKDvwCZXWip4YmuVH0jkwq4hTKTfRDU7iAQspq5MbqU5FzVK08Gx6OMkmbUahrssqEE4azQrmmFAuZczDKdp/PApg00G14BeHg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWJCdjBJdFBLazNvK2x3Y1ppZ2IvZ3RZaTdiTmozZ1BHVmJkWXh6d2xzdm9Y?=
 =?utf-8?B?dTNUQ3pxWHhPM1BIM3ovZHA3R3FWWkZmNFcwRzA3ajB1bll3M3U1Y01KNHN4?=
 =?utf-8?B?d05xTjFjWW5ubHBkeTArNmtJaEJKa0pnWjI4cmgwenNBV3k4Ty9GYlBWVG5i?=
 =?utf-8?B?KzJRRTNCdndUTWhuWENhMUlXaWVrSk1aMVJvZG1IMXhCb2dnSWllL2hSN2pn?=
 =?utf-8?B?M0ZMSjN6MFlyMW5LNzNrYlZOVjlOdUg1Z0xUa2VVbW5XcTR4OUJCdWNJYmV5?=
 =?utf-8?B?RlhmOTdSVzNrMW5rK0ZCSjZaZTY3NTJiTU4xaU95RG0xQnEzTHNHS0x1OEYr?=
 =?utf-8?B?S0lJYjNMQXpDYnVWNXRHd1FFWmlSb3lPODkrNUdCSTdWNFhZZTYzM2txdFpI?=
 =?utf-8?B?N3RpVWpTTGYxdCtiSVp3S2VLYXB5elR1Uks5SURlaVpqVU01NnlabFJ3ZGNJ?=
 =?utf-8?B?dSs5S3BJbmtGNGN5Wjlib2RJT1dqbGFmbUlBTDZaWWF1MFFTdHNFekc1a2lB?=
 =?utf-8?B?dkoyNS9qN0tLOEdwclNZQ2F1aHE3T1R4M2dLd3hIODV2V1Vta0xJNWlhelkw?=
 =?utf-8?B?YXJUY2F1QlJZTSt4NmgvYmJibThtcXFITklDODlDYUlzejZGZExSaWVnZks5?=
 =?utf-8?B?WnIxMkJUOTQwNm5YS3lFRGVrdURmRVJvUlFkTjBYL3ZMMVpVSk55c2tUTExI?=
 =?utf-8?B?QkxPSmdNNWhONkxybm5jTVRUd0FCSFpCbTJwTjJCbzVKdTV4a0lhZkJNSVpQ?=
 =?utf-8?B?QTFMaXd0N0E0R25TM05CWUFDNHA0OGpneldRVm04aGw3dWpqNkdIY1ZuRlA4?=
 =?utf-8?B?a2g4QTdMRFhGZVhsUkdUK3ZrcTNaaDhMSlNkT3RZWEFERW9ncVd1b3I0SGRp?=
 =?utf-8?B?OGUvZVRXcC9EeHkzL1F1SHZRbEdOemNNR3NFanhxdFpYMWovdVpUemFhY2pB?=
 =?utf-8?B?QXRoeFNseG9YZVZrQndNeUpxQ3RBOTMzNVVCRUhpek1uUUphajkzeHhDT0JL?=
 =?utf-8?B?MlhOWVZaVmJIRUh3cSt6bHBPK1NTSkVHcnVmUEpEQ3llRDIrd0MxOThnOFQ2?=
 =?utf-8?B?d3ZCU1BUZ29EdHNXeDNNNFR2UFpSS2NHbGE1SmFLbE15a2RqNFlPeHNrS3hx?=
 =?utf-8?B?c1BId0NFOVhvaCtiV1RXOEpURmpSK3k5TUVXaGw3ek9DczBlTWZtWGc1RUtj?=
 =?utf-8?B?Qzdvc1pSd1lDdnF5R3hzSGg3emZmQ1R5dERCSktXNkxyRFJYZTIyV1dpRi9s?=
 =?utf-8?B?KzBkckZ4Ni8zZVA0REdDVU5JUlJ5U2xYVDg2aDVrZURHMmpFeFlvT09WRmdD?=
 =?utf-8?B?Umxhb202T0VwWDRuMlMxT2hNblZUYzVTMXlGY0hDNXVZNCt1Z3A1T2VNeVFG?=
 =?utf-8?B?SURkK1BRNXExamZnVmhBaUZONUs3dWRzQ1BWV3BxVlg0WlFHYVYyMVo2cW8z?=
 =?utf-8?B?UlJpY0hQWXc4TTNzSzZaNFF0OEUwSWtZakdOV2lTQ0ZjakhOZkUwMytkV3NF?=
 =?utf-8?B?bkdDSkNaUk9QdzlwWi91NThkUjJGaWFXQ0wrN2pUcXhZZHZpbTBMbUZWOG5Q?=
 =?utf-8?B?NzB1NjkyWkxoa1Q2ZTk4NzJUcnBQSUlzek05VWNQRzZJdGpyUHVObnRobGJp?=
 =?utf-8?B?c3FGZHlVLzA5VlpScWk0M3l6L1p5cnJ1WUx6Z2pGcWpoazg1V2F2RWxBQ1FC?=
 =?utf-8?B?Z2FySkRYQjZJczFhOWVqNG0wWUJDY3BaTVp0QUZuVXBiczZRaVdwUGYxb2tt?=
 =?utf-8?B?UzN5c3pFR2NlU3Y0TGhnTVlCN20rdkM1b2JVQ3hpV2pIYWY3Q2xOUGZFNFYz?=
 =?utf-8?B?MVMyUDVrd1ZzTnpwbGowR2FONGM3U29mNXBDbldNRkh2MWZIbkh3UHFKbFZu?=
 =?utf-8?B?azlQVGVTcjY5WHY5a2ppRWZvbG9FUWFRbFUyRXd3b2h4NVJIajh4Q2xSQ0hX?=
 =?utf-8?B?eXllbFRnWnhaSi9MR3JsQ0ZkY2Y5dUJUS0o0QWM3eUJnaEdjZUZSQjl5elh1?=
 =?utf-8?B?RlRBdFgxckw0eWkvbStvc3duWGtlOW0wRjJWbFJqQWpVWFdrY21oY2VxN0lC?=
 =?utf-8?B?VzFRMjNGYWZ6ZEcvT3FsZ2x5VU5neXdCY2Z6dlNUaVVCQy9tVmR4d3FHeita?=
 =?utf-8?B?RGxpQTVVZ1VHcFArbGdRZiszblRISVFESVBscFo4cklJYVZRdDRtM01OYlU0?=
 =?utf-8?B?RmdPU0tCLy9Ca1VoaUFpelljVGxoUlRLbWlJVUZ5Vk5CODdxM2NyMGR4SEpV?=
 =?utf-8?B?c3BVS1N2VVBBaW14ekNQbTVFR1JVVTZwZElGSlVEdDc4MHlFbUxBR3pxZENv?=
 =?utf-8?B?OHBHSTBhWTUxeVRBK2pZcGR2aWM0L1NzR0RNd2QwNURHWmJXZDlYdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da09294-6893-47b7-7b8d-08de9ac36ae1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 07:48:44.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPrPp2J8sdiAdh8uTj83lcIv3vY3A8n8Vt7/MzXTamiI4gKL6a5/YX0sBStgqW8l28hcLhPDTEW/dskudsX8lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for:
 Cortex-M7 core[0,1] in i.MX94
 Cortex-M33 Sync core in i.MX94

To i.MX94, Cortex-M7 core0 and core1 have different memory view from
Cortex-A55 core, so different compatible string is used.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469c8fc0979a192b6e3d3a03108d7d2..c18f71b648890da9c25a2f3309d8dbec5bb8d226 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,9 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx94-cm33s
+      - fsl,imx94-cm70
+      - fsl,imx94-cm71
       - fsl,imx95-cm7
 
   clocks:

-- 
2.37.1

