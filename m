Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263A3BAD81;
	Thu, 15 Oct 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075183; cv=fail; b=Nm3ihP+VzIzO/YO1/yD6RtUUxE1Fwyp1HpEt62i1nU91PGRz0JvsCNtujLltzCmsmEIKXIl4rXDcBA2pyBivbFlAtACTHaOCwuOX7Q9dZqo9wTNwg5Tx3+EBBDQLqkv7FKlFhP+Lf/gaz6ZsDMf8NQBOT4im+/uuBNvumwZmx6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075183; c=relaxed/simple;
	bh=dHirWTe1cDwuTnVe/N6cg1W9NRYsB4Y6rApbFFYAJVo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZMcXhvSV9fco6c8++2uUv4GZe8M2X6miFaJv1Wd9lzRgNSF1NhDDS2WSymhA5IECpo8Vu7lR+CjnLM0a6Xs8Vj+OHn0KEMc29T5VDKdXy41sD62xETBlspS3T8vh8D+b5u0SRfxtmCtWMPlg9/bcMLWnZm0sbn6mFHZQE97a8E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nLWLvklN; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nLWLvklN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVZhJLxJwv8pr6UPL2cZbC/fPFEtBmiU4RUy50UPGWIOFpxbNEy6hAqySO+aRhmjim4RQA+0oW18x/DSUm3Z/ljIpCO8XWu/hCoCdqBZOO0o7DVIg6FTTpNCbJfNODqAYjIAIhr10kOcmMkeFcslGoseUI4QrGLWdRNOyrgYMdZ04M1t1ClFciZWNtsHtM3TL+I6V+hDSRKWlnXw3GTaWi6KdqPrfXyXHS8F+Alc2OVgh1eg+4LE2O5F0AekuGT7dq8/0AvujuS6O3iKwZMjBRtj/YIbb15ur4Va/B5rFncS7IB25TxTO1TT82byaltxjoxpGmDWsWFcUBumqhhRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md9vLvXaek7OzQzDdONEQNwakiua1fAj5OmQtlnfrbg=;
 b=tInH/GOTPgZPuyCKulf/jnCgW65NSqzmIZX2zMtoaCzGterD+CzqelLLJc0IhKKLVqQ/hDhNfRMdDxIqwzidZXJ+cj+emYvQmZGZD90b0+Ljv0XvC/9Ece1sP+QekjrSzrbY811rs8eFdW3NkQPmRJa4Py+UjNGf4vX2hI3x+KyRyh3mj/QOikE0Us0Q1djcAYWHh3nUYAqiAyomTfxvdksyWyat+BoOS28XdM4HCH2TPgoOdw0Te0Mbh9T44C3nIKl0xDV/9e93Q4GcTz/Y8TVyUecH5s93clp7niZqkbRBdncO5hxM+xtvLaivp6hnx7UEsDleRRUhAxhsozvmRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md9vLvXaek7OzQzDdONEQNwakiua1fAj5OmQtlnfrbg=;
 b=nLWLvklNK6boD1q3DGpTFkxtgVqR3GilRA1QSVmQRIXGaF4OSKRCaVIckoFo1VT98trgeWGfyWrWv5u4z+ThHu1plB/mP8QF9pGTLuQjsm/P5kHSasrsm+FFuGdC8OqSQz10f5OOZ9fEHpJTCudT88QUov5XcQabXKiamr+lAvuUiJI7Ou3ZUxqGrFoLWJdNCOG9BMNDXT8zH7RlmN2YwFbucMOr2DyJ6rOyNky2UFy0Qk4aBvr4MJm8G9pmtuWvqyLUdm7MpBEHCEnB59jrFLxLAzJIlp4+w3k/6/Qlh28SX43HG22L3Ldf4uPnZw0jDldvF65EodJSvPoJ8H7nPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA3PR04MB11227.eurprd04.prod.outlook.com (2603:10a6:102:4ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 14:39:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 14:39:36 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 15 Oct 2026 10:39:22 -0400
Subject: [PATCH v5 1/3] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-memory-region-name-v5-1-abc358b39a96@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075166; l=2366;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JzZnkTESV4a9yPepK5xMcxyGYigJc7Nk68ixwsPOjjs=;
 b=GfrGxSRO2LKR8ar/8FBfMx/kdqkFdKMogYWtCEThID4lS5lQVFkhrsiToa496nID6WThIRg/o
 b9zoV75ZEMwA42KTvetwNuuh2t+nLs8wWoky1lBDXYTCo0gNGdgZDW7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DM6PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:5:333::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA3PR04MB11227:EE_
X-MS-Office365-Filtering-Correlation-Id: 708b4d9f-b091-407c-78ac-08df2aca226d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|19092799006|56012099006|5023799004|261009223027099003|11063799006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MmHOH+Q0fCP6RIYPI+fDxXZIc1k/UGaHdTBqLphh1He4EfJ2TgT9xKuEbjnDSwbHg3Wph35v3nhTrCONz5rVmw6lgI/cK8Ha42riidopG5c5m/MzpYejHgDHRZOJetzxuBbfcj7jf9n1xHtyjcavAtNJ2L6qnas3FSvhkTG2SlQ3uNePrKcUDT1UJQoeClvohZ0XfBcmSEspaasjPKfnNYGq2zuVT4wfYJ+DPkcZ5+L1OsuaJy2kTNw8jfvVmrFdndqeKj6bkluryhWYChP33WA/8zABoSA+XdolLBzEkPl0uYbhpBUfJZLBF3lNyIuOcrl0D1E74aen6ABxMSM4jNoZi147b2O8ziCFtcMCX4KClMmv1abwbYVt5jl7sIpr4OaI/kfMGAVSabivInm3lZDI6s5MzvK7AfcXRRqSuxxraD6QRQb1OLxJ/uvW/4KTIMUU6v6DXkZUkYsQbX0WqTAdWpI4UYAQuMdmouny1+Icoh9ShjKw2tImBwONaIhtdyhn7XYMAIVCRzP5qF0QsGKeZpYVsJo2mfSj0OdgvTfhOwuVs4DFz6TuUcJ5+s5T6q24jYoVFCd6neNVtu/ulEonGbUf7XMwb/yqFhBPyJYGs/LnNd/JvejCwnpLeOi4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(19092799006)(56012099006)(5023799004)(261009223027099003)(11063799006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFvREZjZjFycVFQUDZhUml0Q2tDVHlzZjR3QjVWTURvdW5rQzhWdFdBRHRB?=
 =?utf-8?B?RHBpM050QVQzb0pBNWJPM1I5REtFN1JGQVFJbThneHg5M3RuZDUxRlYyRy9s?=
 =?utf-8?B?NVVpcWpOSHdkNVRYdDZtTGQ0TktOckl4d0tTYktTS1Z0T08vWmNzSzFTa0tp?=
 =?utf-8?B?ckRYZDhOTzgxVGFiaTFNSzhla0l5elRzbjhUSDN3aEloRVI4M2ZuUy9hMmti?=
 =?utf-8?B?aUJsVkJCVkVvZDFKbWsrVzRTaGpQMlBwUk04bzhaaURmN3FTMWFMZW56bHh1?=
 =?utf-8?B?UXZkRElEc2JWUFhMa1NvY3N0RzRtWmFVQmtrNy9GZjZkREFMSXVydVVsU2ND?=
 =?utf-8?B?dXVoSVB1Q1Q1UjhzNXJ2Q09KaldIeTVvZU1YSXFrM0xWR2VwRXIyNW9MdG53?=
 =?utf-8?B?NCtpY2pUeHI2eVpUUUdTc1hUNytWajRXRGZaRGRxdThqWmRoci9ObzI5MGM2?=
 =?utf-8?B?OFhHeFJCdHpNQ3Ywd2hzZTI1OFBxVEVxLzZFZnVBZ05FS3RMNXU5eGVEUFg1?=
 =?utf-8?B?QS9KaTBuS2p3YWxWeGU0L0p1dzNRUnY3VVFTTGNzTFNmYnFRY2hrdzdOZ2ZB?=
 =?utf-8?B?dDRkQUlFSnZHdnBwTEU3NTk4MjFCNEd4WTVTU1FoSFdzTyt6MTNVbmR5bmsy?=
 =?utf-8?B?WnJoaC9oOXJhRjIwOXNWTE9PUWx0a054elpaVitmWW9HcE8xMlc1Wi9SNXRk?=
 =?utf-8?B?UTZTb3JPdm1qSmJMQ3pRaytrdytzQmJQdUJCYSt0cWhPY0tRSzdGYkNLYmFi?=
 =?utf-8?B?dnZRUlBGS1JhWmdGcStwcmdjZDRKQ2VvQ1dCSDRvWXBnWFFoL29zSmFHcXRN?=
 =?utf-8?B?bWI1VWF4aDNXbkRjOGtzTzVPSW1JR01abjZHR1dTWFEyZlA1a2VoM3E2NXVu?=
 =?utf-8?B?ZzNjYnNTcnVVYnY4bHdIM2hpc2dPWTBDTmgzMk9mck5xN25XNTltRG1xZXZ2?=
 =?utf-8?B?bjkrVDFhS1M1cU9BMU85ckZ5U3lndG1pQjJpaWU1RVVWNnFGdExocG9paGFF?=
 =?utf-8?B?VDcxT0k1dFVyNkhFKzFvcndCOHAzTC9oM2FQZEhRL2QzdkoweVpiZG1wN1Nn?=
 =?utf-8?B?R25jL25OUnlvQ0tiQTM0V1pzVHh1UGVmNU40aUNjdUxrbjA3TDRMT1h4S1N6?=
 =?utf-8?B?cHNlcG5Scm1vajhqVUQ4eU11RFJLSythL0lqMmZGcm9nZDZkYWpVZW41ZzM2?=
 =?utf-8?B?a3N4ZjB6Ui82dHFEVXYwLzJIU3NxVTd4V09oUjl5QWxpQ1liLzJRZFhMdzFq?=
 =?utf-8?B?YVFsR3Jydkh2SW9ZalQ0SU15WGtCMmlHNmJGdEZPWllnUGNrU3M5MnBSMEdX?=
 =?utf-8?B?cHhrRjR5c1JJcFROL2JrMS9JRERwNUJRTHFjbkVTRG1QdU9uMWtvbjE2cDhz?=
 =?utf-8?B?RGN6T2g5d1FydU9KeksxQms4dTVEMDA2enJtWjNueXJ0dG1lU3NFc3hhQ3NE?=
 =?utf-8?B?dHNvYVduUmtoR1E5QkZoUjhoaktsRDZPaWxWcDVWUEE0cUt4UGljbTFGUFE4?=
 =?utf-8?B?alAzd2tHd21jZmxkcHUzU1FueGZ6VkJya2pvcmFGY01jTGhFbjNBUXgzdkNu?=
 =?utf-8?B?bWxYYXJZVk1LMW81TmFSc3JheEkyM0x1NFgweHZMcVhlU0VGSm56WEtDYUZO?=
 =?utf-8?B?Nm5iT3BJRUdqSGlDWjFWUEIzekRNSEFYSDJlcVk3ZUZJck5BN094UHZPbkJk?=
 =?utf-8?B?TW5BY1dJRWNTZWZkOUNUd09ZbHJsMUc2SzBWdVBiRHE2YjNLb1lzSElRMWtx?=
 =?utf-8?B?T2FWOWlSRFdNOWRsSDUyV0dDNkN6cGRkNHVqU3pSZkxrRnM1aEtSM0pkOVZr?=
 =?utf-8?B?dkt2bW1JN2lYWHdOWktKY21OR3FWQklFSkVXTlFQYlIraXFrYnBTM01UQUhL?=
 =?utf-8?B?U2pWRHFiK2o4OTBLRStTM2QxbEdhL3hKdldXREFxcDRjM2QydGxSVDJkTUtu?=
 =?utf-8?B?bGpRakNuUGd3ZzNYN1VYVWlwajFRbm4xSm93NDlkVjZzdk1nOHlSdzBodVJx?=
 =?utf-8?B?WTA5QWVrOEtQbEhxN1RyQktxYUhUV0pOd0FDdmtUSzY5blBmcStJaVI0TDBw?=
 =?utf-8?B?bUp1TmpyKzYyaU1pL1RYNVdyQ2ZGMkNhR3JUSEQ5QXpLWGtKeW9lMk5VMTNl?=
 =?utf-8?B?UEVQd0xTbFAyaW5rempzUlhTa2JRdWFwY1BlREc1c3pDeSt6S0V0MXNxUVNG?=
 =?utf-8?B?TkFybUJxczJUc1B6eEFjYjdhMzZsaHF1dVEyNkpiZVZ4SW52NUNvcWR4YzJR?=
 =?utf-8?B?YTR1MWpOeGdnL3cyZFFZTGE0djFxWTc5R2NmQVc5RG5BTU1zN05oaFptVGta?=
 =?utf-8?B?S014eXVWOTVJUG9ndXBmRXlxZlhDOGF3YmlpTTkyVG5HUi9TZmd5QXVuWWtF?=
 =?utf-8?Q?+9c5//q33lYkV+3GeiCOZysW8Qy46PI+o7pHT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708b4d9f-b091-407c-78ac-08df2aca226d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:39:36.0592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xrk8E0LwS+jALRgD7CJTGd2f2fg1IrKkIAQ9w0aBN88y71LmhY2Duv8K9aSFIPLvkzM+e/Q5g82/mixuhgjmkEOcdYBQ2mG0YIBaQnVKA5cSx36pxbKvF4OGdky3P8sK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11227

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional memory-region-names property.
 
The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Add memory-region-names to explicitly identify the expected memory regions
and avoid relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Use optional property to keep back compatible with old platform.
New platform should use memory-region-names.
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b648890..f87036299a7b6 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,15 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      anyOf:
+        - const: rsc-table
+        - pattern: "^vdev[0-9]+(buffer|vring[0-9]+)$"
+        - pattern: "^m(4|7|33)-reserved(-[a-z0-9-]+)+$"
+
   power-domains:
     minItems: 2
     maxItems: 8
@@ -134,6 +143,7 @@ examples:
     imx7d-cm4 {
       compatible = "fsl,imx7d-cm4";
       memory-region = <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+      memory-region-names = "m4-reserved-sysmem1", "m4-reserved-sysmem2";
       syscon = <&src>;
       clocks = <&clks IMX7D_ARM_M4_ROOT_CLK>;
     };
@@ -149,6 +159,7 @@ examples:
                 &mu 1 1
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+      memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1", "rsc-table";
       syscon = <&src>;
     };
 ...

-- 
2.43.0

