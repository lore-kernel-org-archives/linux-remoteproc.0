Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379241C861D;
	Wed, 25 Jun 2025 02:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818343; cv=fail; b=oZfigy7dAiNIf5JbCz0+F6hm20U5BlOn/E6LPZe5+o69ueg8f8ZlAAXOR2sGa+avWDp/OeC+shvaY9mxuNml6s0uMs8YcsQgHSBeTshWrf3dIql925Q5tepdJvGH0juosG62JZrAPvC3yeANIVMhexhekVITYJza7Rd0cxhXOkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818343; c=relaxed/simple;
	bh=Jv+POslQGIot5t9A1IdSkoxuxcBE4jlcAGh98G21Gms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=O/kF3G6IA2RKqEVI3TX46cCqvW9Uhrq8K93syF8egJdywhoFqi/L8mlhiMLDKPUdYBhKJhtuJnAgmaLO6w6kltG3LmKMFfO2b4mVpaL/9FZPrYOBxkWV4oxi7hW5rutoCdDg5X6lhB9JRHLeQvfChiijMPLxq09r7uXdSvivIiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SEp+IZvn; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SEp+IZvn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nw/bkdBRfHoU+/eMCogG9/95qh6e44XgnxQ/ESvd2kbIM+6PUTQ5xZ41LvOGRtWk8ZhE044WoOKH+yWrflcg5mb67FZEYt1/qUUXQU6DsEkNqJclCqNQT1znFnB91vR2iHLUAi7OTpn5z2yYUfwkvl/zyod3cJeGI+9fkHmgrZqyYNyZn0EpO1vb6hv8+V783eoWx2FaOf2aMxDJn2+hHXFdoE9dAIHG31/zJynEnXMh4r58wb+RledV1O23MIfKUm0SNrfneHgBUFglzzsG5WcMX22JlU4ER3ee1AQK4pmA7if3cwu2NyAMGTSx/OX9YW7F85ise/QnLmbLoiIPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlOx9F6bdGCupcxIDFr5IBJMOtKDO5MGs7yAjiMn/Q4=;
 b=njwMcP32NmWwvtJZE1Z9MWWvEU/o6K5zQr7UOgUY3XFoHhKxsNdTA8/zHy63YaH0Vm6CHQ7PogPnKYnBCikG+N655/VaURAUSVc+/Unw1/eElAIEfZ2iG1DqlnzvmSM+Uei/6TByOZjOWYtvrrH4AGROn6+vsAeZt8u8iJwhplJ3xkQuDLlgfn+Av9wUWEwxoxG88PDutUpUdvJUKc9uIGF4oIBKaCnn9l8mQqqspFAEzFD4/QnXVu/JmAkUM01LJcZz2LnpOfeaAP4wA9YGzcgmaiskjjCB8FKndsFMz4RQNpAPskC+Fjtgv8Xgl6/XXCbWGp1NFn9zNSS6FpxtZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlOx9F6bdGCupcxIDFr5IBJMOtKDO5MGs7yAjiMn/Q4=;
 b=SEp+IZvnBXG9m3xGZtiWZkq2TU5qZAd0eo0y32botXW0h0Geg4vEvyrsH5CXwCE7E5I05F5B63owxP0LUGfP4ohlayGGDmRHm2XCshK/MKQdo7VHspTfgntzK9Q3t5A39QLml853cNngAZMf/296yZDwL5zO7kguhljptlMhYsXXEZWFpNtWBUq7eOKzl1C3h+LHHwCk6/jDgS8S2kZpAbVCV6WSXIWvwrgEfbW69FnAnvvk9Ncu0NJAul+xGc+j1GNlLPJhbUTvlO3Hwi1Mp8JMgCEhZ93fSQd5tMx0RCv/502FSAOFLEnZCwoFpvsfwVW648ydcDjEOobHJfIEmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:25:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:25:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Jun 2025 10:23:30 +0800
Subject: [PATCH v3 4/5] arm64: dts: imx95: Add SCMI LMM/CPU nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-imx95-rproc-1-v3-4-699031f5926d@nxp.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750818218; l=840;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=pkfpxAZWxSPd8U5Z1mSA5a5tnRsHWNA13WJvXoAAKgU=;
 b=Ppu4gUZ+1EYVTqcfc4c9m3xnlqB+XL+YYqOikqOxFrZDiGpCWlT0jLkStMCjuN/7Ps7aYlVUM
 NY/6paZs+gXDb5XCzbDyM3tcB6dSu+XdF4tBAYIuAXnFwM8a2suMqar
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 2764492c-ac42-4d1c-bfe3-08ddb38f9299
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1JUQk82bkl3K0o5Q00rWll0MTM1enh3OStLcmZQOGtEMDRnZFlHT284YjBv?=
 =?utf-8?B?S3U0K2JnNFVTNUMvNlBMOWRHUFBKTWJ3dmlzVnRUYWVNN1o3ZSs1eXM4dk8w?=
 =?utf-8?B?R1ozMEM0OUc0RHBzSHJhSEhBWVJWWFZSclpnRTNDbmhsYWhhY3VOYkRaR292?=
 =?utf-8?B?V20rdWdTb0ZDcy9vc0pBRnZEY1hEeVlkTTVwdEF0VFpaaC9lN0M4R29Qb3hr?=
 =?utf-8?B?M1VqTFF5alNPT1hyUUpEa1p3WTFqbHJIMk9CY21paktVcDBaRGhmRFI3SWxU?=
 =?utf-8?B?NFVZN0FwbUpVQWlkWGJNYkJaZC9yeWMvSUl4NWxGQ1U0bVBNYmpBdVJyOHp4?=
 =?utf-8?B?dFplQi9HQ1BoSGtxdU1CTXROa3hVMjF4a2FXQkh5RyswbnNvTWVlVVd3dk1T?=
 =?utf-8?B?TmM0R2R6UWRrczJpczNWcm9MelRtRk90RWkvMmtpdjN0NEdhUzJBK0JhTExI?=
 =?utf-8?B?MmJlZnJRdVMrK09jWVpjOENOR1I3N2dBdUVHdnArQzZSVnozMFc1aGs1a0wy?=
 =?utf-8?B?TzhUMjBBdWV1OUl2dkVpR1A5TGRpck5xTnB5Y0xvV0JkZXJzZzZGR29DZFdG?=
 =?utf-8?B?aVU2b3BwYURkQjVOY1cxK3p0S0trQ0NJZUIzQXdQOTRsL1dlek5BSGtYM0tk?=
 =?utf-8?B?VEV6YWY5ZFRrU0dWNHFmeklnWHRBQjZFeXNEVUhCOXlSakdkZU1tNG0vTEVI?=
 =?utf-8?B?V1JOeDhpN1pRSVpxWW9OcFJtU1N5WE1FTzhZSkN2RCtFbmdVUENCOXZtdVlE?=
 =?utf-8?B?aHVheHh0a0hzdjc3cTNTeCtTYXFLOE0vT1QyT0l1bmtVRjJ2SjVHRE9rSlMw?=
 =?utf-8?B?aHdFWUdzWnByN3VjakRQRmdwVGhyNHhTUGUxTTMrbmFPc0l3c0dhZ1BHcVZU?=
 =?utf-8?B?Y0tlSUM1VGhtNVlNV0k4NFIvWGI2VHlRMHQ4YmJVNElFOVgzcFJySkhtdVkr?=
 =?utf-8?B?R0FMaTlNam55RXpnWFJWeTNSUGoyLzJLMStPSWlZS0NOdm0zdkpzdTJiZlFo?=
 =?utf-8?B?ZU9LdFpTejU0b3l1S1I5RHRCNDBvRzJocU1ZZmF0anFQMnNRdVlnRGRZSStU?=
 =?utf-8?B?RzlUNXR5TjhHWW93YUIyRnUwdXdjZWRYdFIvRzVMRjZOcUY2SW96MCtCMDcr?=
 =?utf-8?B?eFB1R1dveGdtbkczbTlBTTAvNFBWT3FpVkIxaDZDRW9NRmV4ZS9XNlBRT05h?=
 =?utf-8?B?V0s5ZENQSWRVdkVBWWRmK1EyWVJvMTlRR1o0Nk8zSWozdnBaSWNaN1V5U0pn?=
 =?utf-8?B?SThQMGdrL0ZNWVYxanYxQThmRnhrS0duWkxlNjFPaWlXSWdMVlA1Mkk0RUFy?=
 =?utf-8?B?SXpJdDhNb3dGeUtCbkZPTWwxSTBZY0pWT2l2YVhZUHRzLzY3TjFQZml2NE40?=
 =?utf-8?B?Zkt6RGl4OUc1bzMwMjM1NzVGR0NzSlY5UjZtamdRN3dlc0ZKM1IrTE12RDBm?=
 =?utf-8?B?M3VhQ2lTMWV2SXhKUG9vL1dJWWFReDJNZC9RKzZjSFBhOGVsWEExU0FaZjhY?=
 =?utf-8?B?ZXF1S2U2eUlURlpnTWRScTkyVTl3dHFUOGVYc2U3Wll5cG1ZWHpkcTA5WXlP?=
 =?utf-8?B?Z0lNSUg3REs3MWtqZnZzRXF3cm9La05xYnU4aThIMUJmSHY3Y3ArU3R5eHNa?=
 =?utf-8?B?M3NMNHRKSDg2alJ0NkJZN21WRUN0UmgrbDhPY2Uvc2cydGFHZWVuaU9WRFlx?=
 =?utf-8?B?aSsrOTBxT3FvdzZOMERhU3l5MitmNVhVUWFzUjIyT3lSWnI0Z1JEUXhuQ0dH?=
 =?utf-8?B?RzJUNll1aW9YNE1HR1B5eTZUeFJKSVR4bWZ5TE44WFVlTGZGWG5hbmwxRTdC?=
 =?utf-8?B?L0VOLytwcmI4RFpGVnc5eStVYmxjazdESVo1RU1TQlgyaU92eUx5YWRlT0Q3?=
 =?utf-8?B?QUdIOW0rODM1WW9rMVlZam9JTE9uOFJiSVVaT0VmbXYwZm9wd0RrVmgzWi9y?=
 =?utf-8?B?NTdqZE0yVnJVWFFjNHZFenExWW91MksrVTA3cVZPVXNDV2FPQ1Nid1IxdmVQ?=
 =?utf-8?Q?wliYz5hacwJHiuM5cbO/V1xA1dRuUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVZIcnhXelJNRFh4WnBsTS9veGZKRzBLZGJVb3FGS2RlTXoyZE9sMzdFaC9H?=
 =?utf-8?B?ZU9QOTBPOVdVV0wyUU01UjNMSENQbWlYSmdidGJsSEFiN0RqMnVWdnJiTzFQ?=
 =?utf-8?B?K3hET2oxWnNlZWEvVGtLSnp4QklNaGs2RVp3Um03Y2V3YVRjNFY3cC9nQXpw?=
 =?utf-8?B?NTBKaWgxbUZsekpPTzZFTXJNYUJHOGRqNU5TWHhOL2ozTzI5M2d1YnUwRWFj?=
 =?utf-8?B?eENFeVMxcTBvUE5aQ24vWjl6OVk1ZGFldzRWRFBqY2d2c1pSKzY0cGYxNC9m?=
 =?utf-8?B?a3BOdmxlUlNMbHZSR1FYTVJ3ZloyWFF2N0I5QnZhZW9oOXduR0I2d0hzNGFp?=
 =?utf-8?B?V2wzR0pURUNiQzBCTGJaTnc2RDl2SFFKcmFJSmdqN2tGTDNDQk0zSmhGdHp6?=
 =?utf-8?B?WTQyRWdBemxjT1ZVUFlxQ1NvMmF6b0hraEszSkxrRTlqQy93UnNSRU1LQ1J3?=
 =?utf-8?B?dlE5M1Q1aTRCS1ZPMU55Smg4QWFXbU1MTUh3SnhQMFlYR0ozZ0tvcEFxR1Uw?=
 =?utf-8?B?K21KR3NsSGdCUEMzbndOSDhXRCs0QW1rRU15V2ZtRVZiZzdoU0lRSkRub1pV?=
 =?utf-8?B?K3BTaEdXY0R6elp1NWdwdEFSbG1IeStSVkpWWVpheGdrNlNzSXVJMGFKZXRN?=
 =?utf-8?B?SCt2UG5aMzh6RDRrUWpJeWJqTWZQVWtqMHo3YVZCYVZXZkxRblJjSjZEc04z?=
 =?utf-8?B?aHp2eU4rRCtxd0t4bGQwTi9UeG1TN3VIQkhwK0NkZUNlbjQxM3cxVkZUOHg4?=
 =?utf-8?B?ajZVQTZhb3VJeVRPK1FEYTM1dlJBSVFvSlNEczZlVGs5aTdVM3lRUk9GdDNZ?=
 =?utf-8?B?WnhtSDVwVDA0QXpnZ29FSjV3OS9SWU12RkVOdEVuNmhiNW92UGg0SEoraFlx?=
 =?utf-8?B?YXE0MHVKdFZLKzgvZ2dlN24zNkVveDllSUxocTIvR0kxTHFvWVBSNlpLMjly?=
 =?utf-8?B?dElqUlJ5MlJnVlEyNDZHWUMzWUJYbHJZd3MyamUzMnV2aStrU0VYSm8xQ3E0?=
 =?utf-8?B?TWN0cjVBRnp1bTFOT1ZWWnljNkloYWRmMi9YaFIzS3J3cThiU0FlOGg4bUFr?=
 =?utf-8?B?SVJ2UTkvM2F4MDFLWWlOaGczOVV3RUtDMkVYZWNFYTlNeGhZQktubk9nd01N?=
 =?utf-8?B?U00vUThNNXlqTC9MM1h4bkxNOWM3Z3ZtLzZtUzlGRGhGV1MwSGs0MkxhMlg3?=
 =?utf-8?B?TDZVajRTRHE0LzVnVlhRTERPd1E2SVpjQ1JWR1YrY3g5TVBpRXVLRDhrazdZ?=
 =?utf-8?B?dkpSaW9TQmlsbldpZnFnSVc0M1gxNjJqR1ZlcDlOMXBoYnhiZFhvSEdXWmd2?=
 =?utf-8?B?aHRJN203L2Zrd25QTlVSWG12TU9aZU1lb0lZYzFqeXp6bWdRbnp4M29ndzY5?=
 =?utf-8?B?NzR5ckNWUGQ5cXppRUdnaWNuMW1JTnliZm5SWW1KTHlhczA0T1hZc1BOYzdB?=
 =?utf-8?B?VFQ3Q0E2a3FjM2t4eUoxRU1qa0lkbENxeGFPRGJMbFdRR1FhaW10YjNVb2RT?=
 =?utf-8?B?akJUdmlFWkpydEJFVXlxTUYzZHA0azJQakdJWG9nNmNyalRDeGVFeFU5Mzk0?=
 =?utf-8?B?S1g0U2ZLbFBLajBEM3ltOFhZSUUxV1VocjNQZlpmUUZZeHExU2wrVjFMS3ha?=
 =?utf-8?B?UFQ4cjhScEhxbUdiVFU2R0xjQXJNeis4eGpHTW42RlJ1QzBSRVU5bUJIR3Mz?=
 =?utf-8?B?ZEhBd1VlSSs2NnNaVUEwMXg3bk5FVlFXeEg0aGxIcERhY056dzR5STVlekgy?=
 =?utf-8?B?QmVwcXVkcnJMMmdNRkdHcjJWa1VSQUpzZjVKVzBiVFFlU2pBMGNzRnNVRytM?=
 =?utf-8?B?bWd3YnVsWWp5OXloQSs1TmlmYmNMa2Rrd21YalUvenM4cjR2MWN0Z0twUTNM?=
 =?utf-8?B?KzhneFRaNG5zM0VESXYvWXMzOWUxVTdTR2RLSjF5UEt0VkdZbEdEb3FJTFBK?=
 =?utf-8?B?dnorSVNRUTl6Rmo2V09SQ09BcWpLdHpYS3NzSVZLV1ozcjF4U0kvWjhtVzZv?=
 =?utf-8?B?QWMwYmZoaTQ3TGgvSDJNQlp6aDFMdjRiVnZiaUE5cHMveXRjYldMNmxLY2VB?=
 =?utf-8?B?WTJTelA1L0NZdmRpL0c0WnltQXhrVDZkVFhYZHBFK2FqUTFKUWsvOXRpTWpv?=
 =?utf-8?Q?J7g/vIepPoKG1DW2YY3ju1MrT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2764492c-ac42-4d1c-bfe3-08ddb38f9299
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:25:37.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1W7dLOyPAAgkoiV0UETFdL5kuiNghSN4NeLgDhmO7uLjJkeN2Rqt+bsb73ZzUdrOLAiabMp2aeAihUG7cDp6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

From: Peng Fan <peng.fan@nxp.com>

Add SCMI LMM/CPU nodes which is for remoteproc to handle remote cores.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index f142c743f786fb5dbd67f8e52c8061bd2815a492..45b5408cbccc1e17240839c3c0c81ac3399a44e3 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -350,10 +350,18 @@ scmi_iomuxc: protocol@19 {
 				reg = <0x19>;
 			};
 
+			scmi_lmm: protocol@80 {
+				reg = <0x80>;
+			};
+
 			scmi_bbm: protocol@81 {
 				reg = <0x81>;
 			};
 
+			scmi_cpu: protocol@82 {
+				reg = <0x82>;
+			};
+
 			scmi_misc: protocol@84 {
 				reg = <0x84>;
 			};

-- 
2.37.1

