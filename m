Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B02DC78D;
	Tue, 28 Oct 2025 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639532; cv=fail; b=mBvZlC1Mu4D3XbwebcqpfmAoNmHjow9j7Roc/qhMH3QpQ0vfaIy1Z6HOBcFOWSvMRrnaddUAMogyz9qUtKSFrwlmCi5XGhZqHTqryDtLtIEHj/zN9gi9iqIgPtRW+B9wGRjmHqHXISjM0F//E0iGiTSzJfhNXtOFY+S7egLATZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639532; c=relaxed/simple;
	bh=b30F5pNFs2cO5PsUBT1ippdPdIvYFyO9Zhu20SBR0As=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EdWRoCpF23jHmoOMrZdEM4EbSTz081Z8S+ojHcnABIe4TqlKwrODw6qhedcfjgpCmNV6qx3WVaNOnbu9O8RfWdZVbF3nctjDHCRT+az5rfHLTuRlbW0gbv2/iIjajvuZA5pH84pJDNvJzNvhaD4Q9vKt5ac81m2KiKkFi5mHaow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X6/5S3t1; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X6/5S3t1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAyYDPZLIW6OOS7FewniPRo6EzhnmbdxWvTvvjcp83Re0AqKIt4lSH8mLAh68QNHz7camwATVbiKroguEe4l7K4LfvfXZHE+mvPnh8bDl0/+AKlo5Rj6T4/zWQW0y82HEJ+csJHnhavqlF3Bre1vWR4DB1hbLoA/0VO+2Lc0RYKmDWPP+r0dOzPmqXZ5mxbU5KfEo42S8wvsaBcLyvidI1XXriJgCbb+HeLh6qACbbx++AAAv9kenTMxDdSMReSgyyKDNQb/SQdWEPIcoGoARpdOXM86yUEYS1ddd7krUMymI3RNrLa+IOnVSlO+IzfepteA0M3nOPmZpGKu7hxV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWTbfLWpW6s1xjvVo8haIraYMLeroqPRPh3QGxjz64A=;
 b=LeQnD9hCS6SQbnjS6S+dHcwheXNMH6Ud/WqtYxs6Pn+BruGbLWqs9EKCO+D6Fv6ThaHEquVmU3SDboHnsFaOqiKLBRtkmZ6IMICWpc53TfC6XoCFSgBNL0mgmb6tZaunkyRD+2BWBlfmHS6oHw7MqGifRrZLhC7oKSg5LIRaoCZ4LU/wyzMp8PrIZMdOjUHGAZgs1YLqRyYoqcJrxXW4BkSgq6IqtQ7rL4A1/a6a9Gwz4UQJcjSMzHTnx0r60jk3KpDYXuChhQfMWeiVHBrvnJn2abO3WpbkIS9NfNYMZM5SaF0LUuzuCD3QIkrLM5ahymGqsBTBtApqbE5zVwp/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWTbfLWpW6s1xjvVo8haIraYMLeroqPRPh3QGxjz64A=;
 b=X6/5S3t1uApu4fa47K7UtqEqVnug04w2j5QxH5ZO/P5B5qenNctqWYSYVcnC3ijXPA7iZiwTZ3Il+qPv0hgHJih383l84lCxtkMy6KmITPwjTQe1tdYW2UPYEZcgilhuOf6lgX2ouXFy8a2fkeIM5ZgaPJcOHgCpWk1+b+J6doTUlBb33qID7TMqk3pNgsZRa+GiLOkoPTXC+YV196Nm/btMjbrr5xcv+8gL6q/tgcLli1ZxefLLZpgay44asn+NECaSkAMq5fmFWx2JBL44hT1YBSE4Q3sZPxG2Y6GVKtq7O8b9xJ6/Chze2yZ+zWG/z7PXufKhjFo6zHVzCbwYGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 08:18:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 08:18:46 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 28 Oct 2025 16:18:03 +0800
Subject: [PATCH 3/4] remoteproc: imx_rproc: Add support for System Manager
 API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-imx95-rproc-2025-10-28-v1-3-ce9e7db9edcb@nxp.com>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761639500; l=11367;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=b30F5pNFs2cO5PsUBT1ippdPdIvYFyO9Zhu20SBR0As=;
 b=yP3eN6tlWldNbKvBBrBSZia6Ss32f8kYljMYwBHZGhfDA4cCuSlfKB8wM5ffbLjhcsqRwaE0+
 Y9MJBd54/52AOBiYLkjYbkW794Cy3iqtOm6sMudI3bwLiw57SKhMHhJ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eae76ea-6862-40c0-8562-08de15fa9d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkFEYnVOaUh6NWdOcWRqSGtFZ3JZL1hWSEJ0Z0VLQlpnY3lDTWVDdTVYdVI5?=
 =?utf-8?B?a3RoYTY3ZFNUSm1DYTdGR3R6YWdmWFAzRTJaUGRRVVRuYlBMQlRmUkJGQzAw?=
 =?utf-8?B?TUdCa0dsTjFqVnJVdThJdm52cjRmbnhoWmh4REMxNkJDOVVVcUxUOFI3N0JD?=
 =?utf-8?B?UmIvdWNPTi82aktqelV5eEoyNHptSUhsODEwYUtFdTRKaXpZQ3hVUGNpdjVp?=
 =?utf-8?B?SEN3ejJpK1lXdnVkQ25HU3laZGlXNmlQY2FiQ3BoT1hWeXQ1Qm1MNG9PblFk?=
 =?utf-8?B?cHdSc0xzaWZPTlYzdVZkTTByTEt5ZHNQREZhUEhDbGUyeVlEYm40Q0srRUJh?=
 =?utf-8?B?ZUFFK0dLQ2Q2VEtWZ3kwR2xTR2dXQUlHTjcyZFdKOXNXekg2SU5FWkU4SWts?=
 =?utf-8?B?dmU1bEw1djY2RzhUMFRobHh2MHhoS1FyZERxKzFybjJBZ3ZjNmltMmVTTUlz?=
 =?utf-8?B?OEpzeEpMZStkRTMvbjkxWlg3N1ZnMkNGSXhFRXpEVzhHb2NFYnVQbldDVGx0?=
 =?utf-8?B?djFKbCtrKzBhNXZVZmVWVmZ1dGY5cmtOVDFTUS9SaEZvOEw3MTZBTkxpc0dq?=
 =?utf-8?B?WlpBaUJpK05lZDN5SWVuQ0FkcUlOb0xTcXJPMndmbkN3RzVGOUc4V09wZDUx?=
 =?utf-8?B?ZTJZMVU0UGVuQy9uamxtYWhUU1hlYTZLbU5XSHhYc1ZTUWVEYjJ0TEI5R0Z3?=
 =?utf-8?B?VVlRdTZ5dmRLb0s3S1B0SHhuNGNSUkVkQ3JpSGVhUzlwNWVHM3hkRHJIUXFw?=
 =?utf-8?B?U0tnczNaNmhRaHF6U093ekpxOGdGbnJybW5va3NjOTk2Sno3Mi9jc3RJdHN5?=
 =?utf-8?B?NlBsY2NIYUJBb3E3ZjQxdGV5clE2TTVMSGwweUdtclhJaVJFWkZwTCtRaEtR?=
 =?utf-8?B?cldQdnIwWEQ5ZlNueU8vTWc1UFpRODJOcHNGTEVrVWFwc0NOVnJCUTFDM05H?=
 =?utf-8?B?TVJGU1poZUFNL2l2SEtCWTJ2Zyt5dVMvUkh5Sk1wRnJqdWVDd3YzdjJ4c0li?=
 =?utf-8?B?MlNzazgxY2RSTUxROXJMWTFiVHBCdEdqSVBLZ3FsZVZ3WGt6VU9CSm9vOVls?=
 =?utf-8?B?bGFPaEl6T0k3U3BhK05tOFBPWThOcVh3VXVqRUl4YWp2VmorL3JLTjlQcGZy?=
 =?utf-8?B?bkR3d3FXT0RQQm8wZVJlUkhIVEgrTTJkVmlyTGp2SHl3MVBCWGVGUVM2ME12?=
 =?utf-8?B?aE4rZFVSWkxHVExzb0hDNi8rcG5qbmpianZuQU5TTmQ5cmdOMDd1dGRtemY2?=
 =?utf-8?B?SnZWUkJEMGs2TEovNnFNYzJBNEFYNzNFUXgvUmhQbHJEbnpRTDNVVXVBcHVX?=
 =?utf-8?B?Rm9zUDZSSGxTR0ZaeGZUK0tZem9GaGdEODd1RDhRWVVYSjB5NkRDbndPeFlI?=
 =?utf-8?B?RzlUbEFQTGxqTE5HWEpER0FPKzRHVWluUTJiS3FHbzdHaGMwaSszeXRvMlJL?=
 =?utf-8?B?Z3RuUjdMZGtKRmlCQ291SFlicGdnZFBXVzFqRUNnYzUyd3lUZU5kSkgyRmww?=
 =?utf-8?B?UTdES0NIUlZac1BzK05YM2NSNVZWZ0F2dzROS01jaXdsU09sOWFJR3QvamFV?=
 =?utf-8?B?NFBSOWRVOFppam0yUm1tWG9aVHVKaGtMWXBIZFVxUzNDdnU3VHY0a1VoMk15?=
 =?utf-8?B?K2V2TlN5OFA2TkMzengzNm9MaGZHT3JNdllvYnd0Rm1UTGdiQ1Z1U0FuZVcy?=
 =?utf-8?B?SkVQK0NSbnhobHhPcEhpQWNsdThUWldPNUVLck1xdnA2SVFUZUpkamY0Ny9W?=
 =?utf-8?B?TjhrdFhrc21kcm9rU0FmbHVwdVBENlAvRzRBWmRsbmJod2lvb0o5K3drTk1I?=
 =?utf-8?B?S0k3ZjlMRVFveE1jeGpmZ1RpWkpuNW5sRDBvNFJkZ2kyN1h3VFluc1oxTTZo?=
 =?utf-8?B?cDcxT2FROWt5VW1KN29jUjFmUGFsM3Q1dG1BTkw5YlplRGROZ3dzNWt3clZt?=
 =?utf-8?B?RHYrekQrMExVdFVtYkppUEdscjRmbi9oaFBzUER3eHdsdFhGaWFxTllSQnpa?=
 =?utf-8?B?ZG1aTmVsUWNTZW4rbHJPWG1UazV5RlFQbzRreHM3Qk1mUzdJd3VGZHp6bmF2?=
 =?utf-8?B?TXBsNzFZREc4YXg4eDVacnZ4cXFPeGticTkxQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmMvSkVCYWJqQ2ZqMFM4bkY3eVFQSkFRM3d3ZEZ0WDVKL05sSGtHZkwxZENM?=
 =?utf-8?B?WDU2ZWs1RTlRM1Z1b25xUzc4bjJmNzM4UCtDWEtYcGVqNUw2L0JaTjBZRG9V?=
 =?utf-8?B?eFh3SEdZOTZMcG5rRWxLQnBxQkJCYVQwdW13RmpWR2xnNWdvNE9MdEszWDJl?=
 =?utf-8?B?dlJOVUZHMU9QbCtuLzhJaWlGQXpNejRTQVZOTXZZSkxuNjF0UFJjUXlGdFF1?=
 =?utf-8?B?c3ZhZ1VRcTNCQ0U4clZuMnlkVkVMc3dqSTk2MnF0ZGJYRzl5TmhocFBacVd0?=
 =?utf-8?B?bzJvajZHcnJESTlheGp3NWtYM0w0azBYM3k1SlBrTGY5SlMvTGs2TE4yek1S?=
 =?utf-8?B?WGZyTGlPSkF6UjhFSTU0VEd6Tko4bS9lemVQVDBZMVB0bnN3M0pNSEhhTUVM?=
 =?utf-8?B?aDdITFRueGRWTGQrM28wWmFFSHE1TU5iRWJMSU1wRGdJYWJnak5kNE1oRmxX?=
 =?utf-8?B?elRPZ1hHZ3NCOERPRURJSUkxbGNwZ1VzT2xBejM3Z0ZDbU9mSDhna2hsOGtj?=
 =?utf-8?B?N0hHWGdOSW9RTGhGYUJHTFhoRDFnekxzQVVqdEtOYXF6U0JMTjA5K2g5ZGow?=
 =?utf-8?B?RVZpZ1pqQzFLR29mdHBXZi9MT2ZzQW5tOVphcmFrTE1OZGpJUU00R21iMWNS?=
 =?utf-8?B?R1pqWVlVVnBaTG5rVU5zcnFvMXMwNnQ1d05CMVMxYkFJMlUrT2FtWC9TZmJo?=
 =?utf-8?B?SnR3Qlk0dE5DalFwbktpUHFaQkxBK0twWVNrWkhNOFRIdTY3bGJjNDdLOER5?=
 =?utf-8?B?K2R3dFcvbTZhQ05ZMS9pcTNSTk8raWc2eTBwTHdRcGRET0NPSUlkQ21RL0NB?=
 =?utf-8?B?ZHdEM01reGxQZEJrc0ZZSTllTllHUHpVQ1lIZEVkd090ZUkxNkY4bFMxTDRt?=
 =?utf-8?B?Z3NkeGNteHZlc3lWMUNpNjhUTnFFditNOXVKS1FRVC9yeGJ2dXlINHhIVFM5?=
 =?utf-8?B?VElteGw5WDI0bUdObXFlZ2NPK0dPanJIbThlMnZMTHdWRzNrbjNZSnhZTnZv?=
 =?utf-8?B?cGNVMkRTcUJ2ZnFRck9Ia2x0enNpUkJZTnF3dmJVYXNVZ3M0UnlBVThWK0Yw?=
 =?utf-8?B?WVJVRVJVVUhSaGdjWVNkTlpUcWpkZ1hSdmF5YUlqcHg2ZW9wM2RhOGpaeXZQ?=
 =?utf-8?B?bnVWNitDNTJnMWo4ZGdab0hHMGNFWHorUmdPbEZmd1RWZ2ZONVRzMlRKS2di?=
 =?utf-8?B?M053ZGhUTzJySFpyVkltTWE4cW9vNURMUmQxZW1UVklhTkxnZjExay9WQ2hu?=
 =?utf-8?B?NGFwQkh6REZrZCtPVUJUQmI4bS8xRE1qdGlwazFKQTQ4M3ZZQWpzSW55K0pw?=
 =?utf-8?B?NHBmVy9iWkk1UTMrK0Q0WFVqeCszakZ1RUt6YlZSekJxTEg2b3ZiRDVYZGx0?=
 =?utf-8?B?YUtDODJEWlIrSjNOWTVVR3VQamllY25pbHgrbndteWVhTDFRUHN4MmQ5NFAv?=
 =?utf-8?B?aDBkdDlSK2hJc1N6WDYwNWo3eC9rMzZud3hxRWhCUUpXUU9ESDhhZkRmK2t3?=
 =?utf-8?B?WHRPc2didlY1TCtKbWlFanBsT0QzNXpjL1E5ZGh6UlVsYThWamlEZzVVRXlr?=
 =?utf-8?B?ay9aeHlYWWdhbjh0aTFkeW4xZnpKVVVncmtyYkplUVpkMC9reGhsa1FlQmxM?=
 =?utf-8?B?STdRMWFzOWlBSmQralRYVmhpSmlCQ3g0dWlOc012WkdxL3FFSXVhNTduOGFj?=
 =?utf-8?B?U01iSjAvTm53NzlNSkliTlJnSXFsbE9TQjRqU3RPVzFRdS92NU0vSjhhNGpO?=
 =?utf-8?B?aVNUN05Falg4YWN1dG5BK3ZSbk93aHBPTlFCVnhIMW45bVhuQzRHL3Rqa21N?=
 =?utf-8?B?WU90TmdLSHlOcm1vOFBCeU5VZUFlc29FUmxjODZBVEM0SCtTbWxPS1h2K2d1?=
 =?utf-8?B?aXR2SGQrZk1WemRKbGk2MGRaUEVKWDdDTDZWRzBiL2pLbTlYWG9ydzRldGRF?=
 =?utf-8?B?WnNBZEEvekdwbFNsbkpnMzM5MWQxSVhma2owSDlBd0hLQm1qV0h0TE9aQTk0?=
 =?utf-8?B?ekw4amFtTGMwQnJOTERwNXBpY1dnc2VveGdCSTRRWWhBS2VsQmlUVms2ODdZ?=
 =?utf-8?B?c0VPeVphb3VWbUZORDM3QURrVkhvSjF4VWFnL0NxVUNqMHRVa1dGaXFkcHZT?=
 =?utf-8?Q?8Qib8pjQ2wTvHPFl1N+yx9DqY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eae76ea-6862-40c0-8562-08de15fa9d76
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:18:46.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEcLoCxeicHuHEdY11N+xnGyfS/r64ijXeqwqXtrtnt76IcedDmD1WSHqLc8qDGY6I6vgAFf555n4J9EDFX+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
 (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
 (2) M7 in a separate Logical Machine that Linux can control it using
     LMM protocol
 (3) M7 runs in same Logical Machine as A55, so Linux can control it
     using CPU protocol

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a seprate LM),
   if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
   protocol to start/stop. Otherwise, use LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.
 - For above case , after using SCMI_IMX_LMM_POWER_ON to check
   permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
   the M7 LM to save power only when M7 LM is going to be started by
   remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
   M7 LM is started before booting Linux.

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |   2 +
 drivers/remoteproc/imx_rproc.c | 193 ++++++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h |   3 +
 3 files changed, 197 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -27,6 +27,8 @@ config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	depends on HAVE_ARM_SMCCC
+	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
+	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
 	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 4ffd2415295be5e60c8eb8ea5126b3562bf703fe..8ecf95c81b598bbe38b721808878e5427339a08e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -22,6 +23,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -92,8 +94,16 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Logical Machine API Operation */
+#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
+/* CPU API Operation */
+#define IMX_RPROC_FLAGS_SM_CPU_OP	BIT(1)
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(2)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(void *data);
+static int imx_rproc_sm_detect_mode(struct rproc *rproc);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -117,6 +127,8 @@ struct imx_rproc {
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
 	struct imx_rproc_plat_ops	ops;
+	/* For i.MX System Manager based systems */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -313,6 +325,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	return scmi_imx_cpu_start(dcfg->cpuid, true);
+}
+
+static int imx_rproc_sm_lmm_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	if (ret) {
+		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+			dcfg->lmid, dcfg->cpuid, ret);
+		return ret;
+	}
+
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+	if (ret) {
+		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -369,6 +419,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return scmi_imx_cpu_start(dcfg->cpuid, false);
+}
+
+static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+		return -EACCES;
+
+	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -485,6 +554,44 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
+static int imx_rproc_sm_prepare(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	/*
+	 * If remote processor is in same Logical Machine as the processor
+	 * which runs Linux, CPU API ops will be used, directly return.
+	 */
+	if (priv->flags & IMX_RPROC_FLAGS_SM_CPU_OP)
+		return 0;
+
+	/*
+	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
+	 * to start/stop rproc LM, then if rproc is not in detached state,
+	 * prepare should fail. If in detached state, this is in rproc_attach()
+	 * path.
+	 */
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)) {
+		if (rproc->state != RPROC_DETACHED)
+			return -EACCES;
+
+		return 0;
+	}
+
+	/* Power on the Logical Machine to make sure TCM is available. */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
+
+	return 0;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -532,7 +639,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
-	return  0;
+	if (priv->ops.detect_mode == imx_rproc_sm_detect_mode)
+		return imx_rproc_sm_prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -991,6 +1101,83 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_sm_detect_mode(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
+	bool started = false;
+	int ret;
+
+	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
+	if (ret) {
+		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	if (started)
+		priv->rproc->state = RPROC_DETACHED;
+
+	/* Get current Linux Logical Machine ID */
+	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+	if (ret) {
+		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check whether remote processor is in same Logical Machine as Linux.
+	 * If yes, use CPU protocol API to manage remote processor.
+	 * If no, use Logical Machine API to manage remote processor.
+	 */
+	if (dcfg->lmid == info.lmid) {
+		priv->ops.start = &imx_rproc_sm_cpu_start;
+		priv->ops.stop = &imx_rproc_sm_cpu_stop;
+		priv->flags |= IMX_RPROC_FLAGS_SM_CPU_OP;
+		dev_info(dev, "Using CPU Protocol OPS\n");
+
+		return 0;
+	}
+
+	dev_info(dev, "Using LMM Protocol OPS\n");
+	priv->ops.start = &imx_rproc_sm_lmm_start;
+	priv->ops.stop = &imx_rproc_sm_lmm_stop;
+	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
+
+	/*
+	 * Use power on to do permission check. If rproc is in different Logical Machine,
+	 * and linux has permission to handle the Logical Machine, set
+	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+	 */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret != 0) {
+		if (ret == -EACCES) {
+			/* Not under Linux Control, so only do IPC between rproc and Linux */
+			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+			return 0;
+		}
+
+		dev_info(priv->dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+
+	/* rproc is started before boot Linux, so do NOT shutdown the LM */
+	if (started)
+		return 0;
+
+	/* Permission check finished, shutdown the LM to save power */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+	if (ret) {
+		dev_err(priv->dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	/*
@@ -1166,6 +1353,10 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
 	.detect_mode	= imx_rproc_scu_api_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index aeed08bdfb5619c7afd7201589f417cfd6745818..b8a30df92d3bdeb915e33551235d555b947d0b16 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -51,6 +51,9 @@ struct imx_rproc_dcfg {
 	enum imx_rproc_method		method;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
+	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
+	u32				cpuid;
+	u32				lmid;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

