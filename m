Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515039;
	b=PZetXqiR61lx3So+Fo77lM+m3BVs5BSpVZ+ZpLwOZRPXjWrWllwA0tdI2pixrB30SI8h
	 di7MC9nCv3TC4ZQs34yNLTM71DA46Yn8LN3W9NZJjkILx6VCO2vnLf3MTzR/x4zMZ35Jj
	 EXygm+b26vvPWSbzCazKYHQ/gwYgn+zPHTIJ3GCzB2Yy8nHXujJg7YBz77agVlgScxizf
	 kJMuscFTalEpCG5vxYE32fyTwi22QtZemveI3RB3sqVjc9CLTXdri/RjSYGE8Z/VNcTFt
	 aSYhPiweZpgXe7BqLiBtyw/nY6D4D80nbYNYZpOloOgmbSFTnuL385L4JSG4sNVLH4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515039;
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
	b=jXJpVvJD1C4ayA4F2J3mk1WAkcoyNFu+CSqSt74ZTISpcF3pE7na6usXeR8TuoVSLI8g
	 bAYSeanwTQpBxe9qLy7FvUXpevGItHV7gHnrJgAgfI2xUqWiQVORgr4xIp7CVUVX9vEk7
	 W9sloK7DJLhNdHg3joh6ghqHTzDsFwW8hJ3mhqN1SBVVadLUPCgUfcmevY3PagTj/ao3Z
	 W+4yQS47tZD89KNd/jMk9qd6/jIPVl8PFTcm9TABcEzMvb+toKxMU144f0qiNnAgdlxlh
	 Orc2g5UXhEvi0mze7/fADZmK/zGX9Ha+r4fh4CimdpTlcy7Nb7pc7/FH8mtlptnYdvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bqKrYC6e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.65
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B360A2604;
	Tue, 20 Oct 2026 16:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35B360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bqKrYC6e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiB8hnm5CmYGQCdXpnRoOsgNh6RC7/uAutz7ulh5oH7+mYUXXSc2r1pK2mVK8+KK56XB7hOZgxzBolA8y32wiG+2aoVrQz6IcQZXDdHNtxW4ndft+PkBn8RVdW3H3D5ZUH1WYew3WkJ58Nc8kazokpgmqkVDttVqYxc3O/BDmm+v97Z5qG22LZF17PX11Qu5VSJycj2hL7iBlsNww1ASmIUdvLCIIcB4q1v9UHwRpPfY/PYdiVDPGMhoyTzL/ZgBMgbfM9amEqk83LOoMvJKozkQRpnXF9cCr5d+OO+TEmnrncRCO1iM5n5smno5wCYSPYA4UmWrHcuTdZ+YgiptJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9pkSi1/ZITjvZxsQSvpgjroTlN/YDWl0jjMq1tohaw=;
 b=tM+eRMgZOQY5D69V4znCUipm2/ch7CiD7Z+O1g9TJjOBUo9XaMu99GM97D22S57Yhu5XREWxzeCi0IHJJVod96jcTTMLM+vcttWYAm9vCZ3q2n2zwCKtJepxXoWqLRAY+5GLgpfkwOEdXkqhsLYlFOeWuNLRDryO8AbikCFPVcUTKzJzy7M1sJ/lV/sHBzufuKQw2opRC3TMiB7jhSjlXOlsPewbw8XFygt+2ljG31TddZ3XlZGTvHaY3PHLcmRHLE0mjx11e5k4mWMK0wQYPuh8ftv7wMvRVngbZj9GYiZXqreZXDgL82KBIBC+Jrlcy3HPqhsjEIEIKhcpt2y6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9pkSi1/ZITjvZxsQSvpgjroTlN/YDWl0jjMq1tohaw=;
 b=bqKrYC6eMKOFYQt2TLuPe9rIy49tLSzYoxzCr6RDnnyrr2hDa/X6swBNKBlWAKrmuT5C3GQnwHJaDai5cKcaANmtVmTIv3a1mQ0jvENBdvHMzCnv+MtJ7GXMLxrKUMCWlmnAXPfhnRvsj/VMSq6k+/TilRUsW27w5eANQO277uLmGPLdqa+YNJLLLeHEmqTzFOpb3S4JJrEpkUt8BVltdn1YmU7IhGISvHNaLUWbM2qwkUyyRpwN0qYhENC5bL/Yyr91TSZ7qA9rxffkpKUUhRpo3SFo7ePb4O6zMlbpVpQWl8g24SuMuDBeio1rO4LiAbgmJ2dZtSu/MlINde7Nvg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10341.eurprd04.prod.outlook.com (2603:10a6:800:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 16:50:35 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 16:50:33 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 20 Oct 2026 12:50:21 -0400
Subject: [PATCH v7 1/3] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-memory-region-name-v7-1-1413d5928340@nxp.com>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
In-Reply-To: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792515024; l=2458;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cGXZRz5QVBQQC8wkK29Ho/Ws98JAAk30YOSoyuCVxrk=;
 b=e1GocIOLj/1eIBcDugMo1e30iv1+QVikHJbEItMErx/Nh5Y5NaqmKUOSvWZZEeVgB8gNwGGEC
 +syFx7JiCENB9BajDbXY2DQ9iScs/KDrq8klKmzC9p6dd0OIRBTnxjA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10341:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0086dc-e1a3-4884-b96a-08df2eca41cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|56012099006|5023799004|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/rVrt7VGyFsuYF//q0JIZNzMGP2rwgOSvAsjKY/pggOP6cJMEgHv/ZEn8sTNbVnrOapi5iPDjRGOeh7C5UV33sbF5/AnYdTC11J+7zCAIRlVAVSpAPQyyjsGXUiEjJcoBdSavMYtm/E5XOR7Li1ypvqo1za3RqXz9ztTXDRXI0ZzP6XCyeTLLQkZtJt4wXiUC+PmIY/CUdDcaBSfrGUFXzAJEYWUQN5ERBPuKrsQv6hbt6MhUZLSe/EU0QfsdIeNdyhHZFYGoAB1qMVvkDB5fPgURmZz3yIHcHwviIr4+t+QJOJmG7AHiw77uJt9uWASVLhBjqHYRiBF0WjydEA9EnFD0TyIowVaIZW+zisBFLLPnKopbJKi45j32zeG0rDCA4F8PhthBPKXseKWJNsc/323LsQ2My/bH3sC9jicS3hMGwXtRVpHAdkTgcyzJgiTh6iZ7pFi+s1TYQPUkSj/fFd5JTvXaikWFd7QkZ50afbVP6tUkr8tMCxTsfWQYDsmutNCLhm2sirEd1veZhCosQtqHl2u7mp1WBDZER8vH2t5yZBISIBRQlNfYsusb3W6tg7pA2cH4tVvso2vvpfdgEHpE+BCs6kqlH27QLZzeLRh9AtLmWaqYf0oarfztzc8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTZ4STA1MWV0TGMyN1hwd2h2bVJEOFluZWdjNzBwZmRmc1o0alBpT2RjMlRo?=
 =?utf-8?B?dk0reFp2Sm14MFNOOHlBeCtZcWtDTmJVbmJMK3E4WThKdFhNTUNJZXlUaDl4?=
 =?utf-8?B?bldQRmpWQnNiaFdYSkJzQmZsSVAyc0I0QXg5MDM4Nm5rVzVzamJIRVduVU1l?=
 =?utf-8?B?R0ZiSVJKWkVPZjc1eVdzRGIvZXhwaDkwMExuYlB5SDdEaDl5cmtLTE1hS296?=
 =?utf-8?B?S0lZTjZyQTNYTTc3MnZYNkFlQms1ck5TQlozZk13dS9FY1JoWDFGQzQweW5L?=
 =?utf-8?B?ajV0bm41OG9kZllZdElDNytRZHVsOXFOQ0M3YTFGcWtqL3BTR2poendkb3hm?=
 =?utf-8?B?R2d3RTBxeUZ2KzZXaXZnV2w1Um1LL21zY1UwNVdHNEpEWEdtY1RzcThNcmpp?=
 =?utf-8?B?M1VqclhlNEJOc2V6YlkzVk9SVHk4VUJoSjRiNVhTclhkd1NiNjlDT2dCY2x2?=
 =?utf-8?B?R3Q4L2NmT21KVDk5OElQajBrMms2SVF1Vklya3ZXdS8xY1hOL0ZUZGFKNlgz?=
 =?utf-8?B?UVE2NkF2U0R3MzlDazZUNVVURjRsNkhHM28zOW84UTdGQjlucmdvd3h0TTkr?=
 =?utf-8?B?NUs3RUhma2tQSktEYUhPU21RYjQzVXlZZkx4L0RONzY2RDNYYUg2MzgvZTRM?=
 =?utf-8?B?QmxHcHpSTzRJWHNhQTFvS0RzK1lJWlI1Q3ZaMXgyZ3VRdy9oOW83emJUaWhH?=
 =?utf-8?B?ZHM1SnNQbTNiUVNrT29VRENIVVZ3bURLaG9TUWJvK2Z1TFVFUHJEM3p5MDFo?=
 =?utf-8?B?c1BKQ3Vya3JOWVJIZnNkVGJDcWR1b0YwU2dZMU5oeWFDbWFoY0cvbDhvMVNH?=
 =?utf-8?B?aStWNTQzenJXZGFQdWJuR3A5R1NNcWpzVnhBTVFRTzBDUjBFbWMzT294SGpi?=
 =?utf-8?B?bW9pUnUwYTZyV1IvRTNGdjhTQ1F1MWZwOUIwZXZIcHlTaTY0UEczU29JNFdw?=
 =?utf-8?B?TWY2cnMzWlkxdC9iV1hUdk1YSk9SZlI2VHNUWkplUjdKdjkrMjRBdUxtdUF3?=
 =?utf-8?B?MDc2VTR4TzVFaEFacnRTQUpTb0ZHR0N2UDFOOG9xUGN4NEdaTkdkeDdxZGpl?=
 =?utf-8?B?cGU3RVNEZXBsamdpWitybjEzWnhtWm1nMEpDN0Q1Z1cyYnBySEI3MUo5Vkho?=
 =?utf-8?B?MlpjRmZjc0FsOUtLZFVQOURvMmlVSDZRRFg0a29EczVLMVlHeFFPR2dFTFMz?=
 =?utf-8?B?K2lJVzl4SEp6NDN6blJLcUM5emN5RDJxQUJXclc2UGlzMzR2d1ZBNDVmZ3c5?=
 =?utf-8?B?Q20zUFBQMWg3d2QybTJqaENqL0lqVjBSc2pkVVJLdEoxSFRqcGx4ZVRBZ0kx?=
 =?utf-8?B?c0kvRFlGWFRCRDVUc0ZDcGxrWEcvM216ckNZK1c3U29UbFFHemUxUWh5L21N?=
 =?utf-8?B?M0xPRE8rSlJIOUtiTjhmSStOMW4vREJHVmNXZjFRNDYyZEV6djFBTi9LSitK?=
 =?utf-8?B?dTdNamwwWGVrYndQT0g5Yk1KNDA1bGNpeVdBQTlka1BET054b2VCMExFTGdB?=
 =?utf-8?B?K1U3aWJiNngxaXBKTzl3Y1oweFNHbzRHbHpvWDlNcGdUYmpNWDd4U2VGQ1RL?=
 =?utf-8?B?ckdKeVBzTWFSTHNVYnB0cW1SNXpDWHJFeEcwZkNxTzBOOXEvZE8zdnFRbTNI?=
 =?utf-8?B?VlkyYllIS2VQZ2RHcmRIYVRSWmkyTSt0TGtpeE90WDI0QWs2WkNDclJzeWpW?=
 =?utf-8?B?ZS9oYnZuSUxZWVN1dlMyL2k0T1RhWHkvbWV5WUg4NlV2S3lKc3c5SEFoVDB0?=
 =?utf-8?B?MHgzdjM4NlY4c1l2R2pYbjlWSHhoUDBWUXNzUVhQWDN1V01mTnk4VHFWL29R?=
 =?utf-8?B?Y0k4RkZKdDlvNGRXazk5Q0F1OGg0VkNNUUg3ckJyN0NiVlkxcGVHRVZ4TTIw?=
 =?utf-8?B?RXVJVzArd2ZqUE9QM0RTWGFpRjRZVnUyb2NpVU82aFBWcWsrSS9TdWx4VXYw?=
 =?utf-8?B?cnBRaVhIM1dhZUJzc1Z2S1dTYXFZc09HNlJZU212Z2cwUjdhOGdzOFE1dUpY?=
 =?utf-8?B?Y1NHR3R1UFNZYXcwUExYbHE5clBqcktKMHBneEo3NTVwcUtUNW4zeGZsNkxM?=
 =?utf-8?B?aFhwTzUvN3NwbGcxUFMyOGduMldBaUZsQ0FmT1hENnppanJtRHBwdGtiM1NC?=
 =?utf-8?B?SnNsY0xZcURqS3E3RTNtU21ORUZnMWpuR0Z0T0lRL3AzU2Q2eTMrdjV2aDhI?=
 =?utf-8?B?QkxYMjNoT0YrVHRDSitUVzZ2aEZEeVpqNjFOd2JocFFHcnFQRHgwb0l2bmM3?=
 =?utf-8?B?Qk9lUHUrcUlhUkMvMldPdEhFTjVKby9aVThiRWo1VllmdU1PT255Nm91YmZ1?=
 =?utf-8?B?MEpBMDd3K0hKZFhKSXBMNkxRcHdqWGRsbUIwUEJFaVEwOVphTlRyM0RwVldT?=
 =?utf-8?Q?eDTB7NjVcj8Hz+xR5UOq+Z7L7VXg9u8AU8VJJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0086dc-e1a3-4884-b96a-08df2eca41cb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:50:33.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+6tNWso36O11BcliEfT0HTDNLnGnz4vfRqqBNuZDXl4t2dVYvmuJKh3wjT9xUdGuYXTBCOoPMDp/NrFP7OSl3PMHRIoUCF3mqzDfMEAIcIDCfcRzFyvPNniIffwXiMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10341

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

