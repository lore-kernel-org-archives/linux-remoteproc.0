Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792695918;
	b=HEl6HHNxenI6X9JaiyclUoFgiEjdJtFz3SSAMCkVbsHRaXLEQq2MMVBmmKYIjNf+7MUY
	 h8yreT+EbLIfni0nJ8R0MurF63Vh8jEfcW3c4qF/hv574NspKAf15M7m1/uy9MXH3pKok
	 ZT/T6tZtzGjjWECk6bPygb2yNmiO8No4+LafhiCgyya0Q/ELVIS4mmmDBArOrK//vscRB
	 DIiPoahhy0uI/zjwtxO/dkgcD7wts+3CAh88iLiTI5dfKA5BPH7rZxUcx2vt+/kVi+Npd
	 nubQyXUfRbgTUyt6XOSrqUmp9zT5lxZsNLwZcB40yVbaB9dQ8I60NIZSt92wh294J3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695918;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Y9pkSi1/ZITjvZxsQSvpgjroTlN/YDWl0jjMq1tohaw=;
	b=OekRJpZChfq8vumQ8kJ6C2jbhaeO8xMzm2qPITCTJSttEtuqj8a46Zn5+mHov3y6YHUR
	 H+zLyMXgXKYwOjcBfOd4fg+L1iRJc7j5sWfBdkxFypQKpadsbnGW5Q+/+zo0ar0NU/Xsb
	 6M9/S4QOv7GdWiRu3iJz6j+q6GdvFXUpfbol4epC8cz3A3zAl38i73DOj/r3zo7NpZK+5
	 qZPlo43i7D9qnalS3pcw5rxfDTm0LalrdFHJMuLkx0XrgdwlHGTQ/jECWQNJFigbmGSKe
	 3gmhKMyWaemfrF55LXhuQ3SbZ1UJsWUFgJGuskfKr1rlMVwfNZxoAdkYBRO/2oelQwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cUdWSE8I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.58
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB410606A31B;
	Thu, 22 Oct 2026 19:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB410606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cUdWSE8I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTqduCEoqfVz0ASrkiHH9KthxHcu48t5H7+pUjSxKdy2KC5A43LgfEhrcW4q0RWi4rLonvLCwL6N1nM6vZVq19YCbDYJtZXYGaBXdS4xIkO92gW7BDxyVtQ+gMiAz29a28U009kofiPftjpXSgGnspYLr3OqA9u9GN7gCJb+bEnt/6Dx0lpvUdJC3XbP38MP8Z1F26yw7Q916SKtANrlizpABevPApnVApTtcBRFPzcJM9hhq9shpotfqxjFrYZa5jHxK9hAIwX28tkJMJLdQrEb1Bn3pXrhBU6NspK8ci0oyP2UeOpwuHqCUAVjItW6Aq+G586IIOvwuOCAvlCMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9pkSi1/ZITjvZxsQSvpgjroTlN/YDWl0jjMq1tohaw=;
 b=YhJ8KMJd/1eZeCczZO3OE4Q2RMdv0P1dTyMbRG4rNCkn6GZGh0npM5h2Bsu+MRU1MQfoAlBvey+GQKJjC53x3adFcfijKLErg+srFjsQiHC//kgcSk2w5otMGsi34HWnZkPIf0gx8N9FYt1ncwLXcrJGvhIaEv00yO6xi+BJPDL8je4l5awkAzoqCsiSC/cfDxYfU44vnkupefHQhhjz6NSooXxDdY+/4fbpu5fj7ENO0giConHigdEG/yBQGUq5B6spdOYDUSteOV3eNHobJuB8p81iWrJSAyIGHSmQOArjZf5Gu/MMMlBf2Xme2wntpgVS3mzZahlhjoTg3TDfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9pkSi1/ZITjvZxsQSvpgjroTlN/YDWl0jjMq1tohaw=;
 b=cUdWSE8IaW5sOHD0DHcQjXwEGYjMFW/3e8X5j/C39Wi/2S+BVnO//14OROrvHO+dlVYvEq/0OOGYBAzS4nv0HmfsUfgXb+LRLGIB911nDTtAOR/DdyYpAwdzGxiDyDcippR3utXv6fDKnKFXs6/T4bA2L01yWMFZBy3gqN55ffaCJQVDzioGAad+WMj3dZE0V+1hPqLqBwzHdUXPiL1Hmb+IzJm6cN755sjPAuUIgEyNkTe49T+gEB38RJ8Lk9XsivpPzf9wwbmcoHRQijxsQ8BWIajiXUG8N9mMcOQGiQHpCEk6MsoO5R8pY/Wsg9MWdyrqatvAGEYO4VO0AN9o6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA3PPFDED8D103E.eurprd04.prod.outlook.com (2603:10a6:108:1::b4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:05:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:05:14 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 22 Oct 2026 15:04:59 -0400
Subject: [PATCH v8 1/2] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261022-memory-region-name-v8-1-ce5ce514a550@nxp.com>
References: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
In-Reply-To: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792695904; l=2458;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cGXZRz5QVBQQC8wkK29Ho/Ws98JAAk30YOSoyuCVxrk=;
 b=0bk+d988DHsFBPyKIjysivAl9xGjX5/0HO4kE3IOc60FAeCTBNjhBBGqkVwvYxnMekU7bGort
 CtwpdIdTesuCvkQ3kIQkrU12/0ZAJQb3zh+LseERZPa6Cl7tHzYXsRk
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA3PPFDED8D103E:EE_
X-MS-Office365-Filtering-Correlation-Id: 7361451c-d5e9-4dfe-4171-08df306f6717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|19092799006|23010399003|261009223027099003|261022105027099003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	yTLwKrrMiylcG6INWSRUyS/AIvR4fqkzW2GuuBCjQ4yfPQykZPURz/hibWg8bmTULL2GYXGaB5l9rjVQB111U51aqTjwuHTbg+PpeIukM0pVaKnvMyk6VcOgxaTKQiXqGXZF30ye5y6dd2USAlxIJSp/EDhEFzMjmrzpl+FgEaS3O2sDkBJxzBAERi1iJpTiXMYcl5jwM5J9ZaFrvqEG/6Yx3Cn9cGh7yANKxC276b06DW8jkm9sv2IC+EhaX4Qg9rzJNoEDes4/mSsXzdcQGkHZABHb3VgiY7Cp+WsqKgFAz254+dCYtBMVl4CgWquQ3tUaDLVhcn/oZR0+96FBax/1MAMuSTUlLxsn2yNQAsjDRm1fUv5CL3cR/Mp4d3ZnevifJouLw94yU/O3wXWuDiGmnD4c+n7BX/71zLMrCKnUIauikhbJXh0GxDcPxfKou9pFwg1pLSIdBnAyecC47d+5XaLNWaMxsO3s3qS4HTu7dqoaRV4vH4c4xQLhh92lbTM7TO7+gkQmhuGFhhxy0QzbPrkun6jHb3vaROYCVE3zsSyvWe2FjzY30xIrbX27fyDA5t6Wphe8kZDGXYW3PP/fk+UKBpe838kkjPRuzmFfAw74WDSZeEwsf9Efeyav
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(19092799006)(23010399003)(261009223027099003)(261022105027099003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXZqRzNEaHZ2V3QzdzFsbXh2MTZZdWxhQklPelZVVnp5TGRBZDBDaVJVeDBS?=
 =?utf-8?B?d2lHeitrd3E1ZjkraFFpZmd5Uk1Oay9QbmJZWGZCOVJaVkxVNXE5Rk1kNzBF?=
 =?utf-8?B?TEgxcDdIL082c3U0VENOUjVqS1Y0RzZnR05QM21jWEg4aGx3eHZnSFFlY0hj?=
 =?utf-8?B?d283WkVkajNZbWlsMnNkUHF1NFhnREhDRUt4QThpSHprMVFuRm0vYjI4eSs5?=
 =?utf-8?B?YzJZdEgxdHhkZnRUVkFVd1hlVW41NEIxY1UzYlY2SnNtMnRtN0ZJaXVOd1Jo?=
 =?utf-8?B?QTZPNVhWa0xnZk55N3BLbjgya1hWa3pUeFp5Snd1TDR0cU1QU3ZRd21Cbkt6?=
 =?utf-8?B?U2RUbUlYcTVmbWE3bytpbWIxK2hDbjJZZ1hRR3gzMVdrUEZrTmFIMXVRbVBU?=
 =?utf-8?B?K0VtMGFYNlNvMi9mM0tpVjJGdk5oVWY5VFFtM2RTZjVOaHRROTAyVm5tSGMv?=
 =?utf-8?B?dHFDdUFpZThta1ZHNUJZcWVYWXZMUmlBb2hDUmhsMDNZRjFZR1lxcTFheXBH?=
 =?utf-8?B?V2E2SGNFTldEWFJ2SE5xL2tMbS9wWXA0Nms1dWFzTVVUbFMzZ3g1VnRlN3hC?=
 =?utf-8?B?UjA4eU84eXUzWkoxWjhoQWR6dnRhcU4xM2pzcWxaSHhUYWlxV254cGlqV0Zq?=
 =?utf-8?B?cUREd0pxSGNReDJPUzdRM2FKOExvQWphcUpLYjZWdkJObnZjdlEwbGdpUkh4?=
 =?utf-8?B?UGxsR05hd3Y4OXliSWF0ZGNxWndjVUxubGlTK1crT2lTeENidUxKSG9uV1ly?=
 =?utf-8?B?QWtoY0JrOVZnaXhXWDVQRmJQYUE1WjJBZng3LzBWSUtObWdMOHlIMG5VNk1C?=
 =?utf-8?B?bGEzdlY3YkhSa1p5RjBTWGkydi9FU2hGYTk1RUI0NGhNei9GMDl3Zm80Njdp?=
 =?utf-8?B?TWRSWjZhT1BYWGFYM2tFZGJDSVBIekIxYVZnTm9SaDc1bUVxelA3RXp1Ymw5?=
 =?utf-8?B?a0lTNHdFUGl3a3BMbEZ6UHpoWGFTa3d3bzlNbHVqV1hjZGNaNzgwb0VCV0xk?=
 =?utf-8?B?Tnh2U3NvN09Sbm81NUdlWDhsMmg0KzFnbW5wVmJwdTZqcTJPMVcwY21uTkNZ?=
 =?utf-8?B?eFRLcHVSOWk2TkhtM2R4cjdLd2pvRXI0NUk1VGJtV0R0N2tqMHkzOWZYYXkv?=
 =?utf-8?B?UWhWNWVGb25EbTBwa1hYdFlRN2IzRUJ1d04wbDNtd0ROT2VqVnNxNUFzRytR?=
 =?utf-8?B?aHVvQ1I3N2ZkSGR2SStYN1owY2RNT0xMbURiTzgwQlNhd0tXei9EamZ6Qm5n?=
 =?utf-8?B?L1dMYnY1dzM2RW5hSmRXY21MUHpvUHkxZzNzTWtKemtNa1BvTlkwRm9CN1hK?=
 =?utf-8?B?RnM3Lzc2aXcvc3oyb2NWaThwbFlxT21Rejl0d3Rtb3ZjcDBMeStvUGVMT0Vt?=
 =?utf-8?B?MEpKeTdpUVhJa3hJZWp5cThrUGp6V0JYWDM1RElnRS81SWRWNmhINkVEZk1E?=
 =?utf-8?B?dGhFclV5SFZDVlh4TTBBUHdWeGlNdVhRY2lPUFpaNmtEbGQ3aFBrdU11RjFZ?=
 =?utf-8?B?T1J1My8zdFBwdThkWjgxVTc1TU93MTdsRXYzN3I2K0gzVVRLVGFULzlkWnpi?=
 =?utf-8?B?cHBLajJjSlAzeEd4RmdReXBjcmNWeWdGZHkyOXc3WSswZU1UbjNKbEJYZGps?=
 =?utf-8?B?djRLblZ1OVlmUGt3bHJxbGsrcWhRQkpnL2ZTSzAvaTB2b05oK210alJNVlhD?=
 =?utf-8?B?Y2FMMnl4a1RHVW5XUFVCNjJvNUFkNWFEelVHem8wNjB4Y0NYUVZKWCtFODI1?=
 =?utf-8?B?YXg1N0RvSzFSaFFoWU85SysrQnhSSXpXQmZtdUZSWFN6cjViVEQvSWRNUFZ1?=
 =?utf-8?B?MUluSFJndm9zTU1OMjFCckpBTzY0aUNUcU0xS080ZmFTYVQ2SXBYWUpsUlJV?=
 =?utf-8?B?eGFrVDErWG5yYldFK2VuaXQyeGZkbDkreStGcVRBLzkrcG9RUUVHMVlLQm5r?=
 =?utf-8?B?UXJIeE1KWXRYSE5FTnRpb1prMzZiUkdVVjhMc2Y1Z09TbklFclBKMWtlcXQ2?=
 =?utf-8?B?N3V3VHdoVWFDQnI5MXlTd1crTnFPaG1ZTUlHcDdFSHVGNlBnZHl1b1dXYUJT?=
 =?utf-8?B?K09RaEV6L1A0NDZiRTZtNFlGK05HaE9wL1VIK1dPSzVza3JZb0NYMUF6SnNT?=
 =?utf-8?B?WWdtK1pqY3ZiUFc0VG5KeEYwSmtPOWRPQm5PUEpOZG5YUU1zTlJzZ3lvSk4x?=
 =?utf-8?B?YmFzL3gzN2RueFk4TXBOMHRUbk9meG91SG8rT1BXS0E5eTgyTEdqVWx3MXFT?=
 =?utf-8?B?N0pqN0xIK213a25mNFl1U1dJMjlSR2RVdUZxa1hRc0EwTHF1ZFUyS043NWw4?=
 =?utf-8?B?eHpDT3ErYXBFMXFFUFlpUGo1RmJkbmM2a2hReXpCd29hazhsK0R6VzE2Uzcw?=
 =?utf-8?Q?NhY7GsvjSdEGSnQCVQI6TM/hfIHykoSKwym+H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7361451c-d5e9-4dfe-4171-08df306f6717
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:05:13.9774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Tgs4An1WIta1+zZKfPh+mXfTO6ianjC0XlfNd8Pt7yOgzV4YX0OeALIpb/KWG8pmHLxIVibafwDHodKsHX5TlS+d1m3ERX6tq9dvIvEVg2O1mriyhskFjJNHRlsIRf5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PPFDED8D103E

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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
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

