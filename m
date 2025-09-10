Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013030.outbound.protection.outlook.com [52.101.83.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F9E3090C1;
	Wed, 10 Sep 2025 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488350; cv=fail; b=fuS5wDHO7T1XBT7BEMzjoZSq8uB/yDVzlwv3JW5tOtnGI66obNYZGYYstCMK1P9cO0hksepfi2Wgk4y8sicaWoP9B/WI6XDClRwAcoTJTOOO9oHMPhqET/xtHgj0HgFypD5o1d0l1dBib67yTwuI8OypxMGgVvn6QtPXAiYoHwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488350; c=relaxed/simple;
	bh=1uFIwURMmiAR4CvvGclzmBrRh3oZCC+95uxrgqJn4rs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=theaZ6yuL7x7kqNV/3i1mBOfkqV6x8afEnW9aDm8fye1ixMX01Gnn1xb2yZpAZnSQD8F7cYkx4KxsJCr4213Psls8qEMK2LuRdowoksFylYj5Z57eZg5yUd0focIOj1YZCQ52/7IV3EhmY/DUDElUe7NjiyDQRsWmcFHhSlaR2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M04i48gU; arc=fail smtp.client-ip=52.101.83.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M04i48gU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcJD+uCijQH0ZH7f9pDXsEoWjBlbcLdudPD65aNS+itCmkLjj/a6bm3UIHh8wclrc7OAEF6OGzjTBCXBo8gWVJZOD/G00+cFTlOYwELvPgJIlZAbxubruOXgurDbGBWRDbhU/PgknDbPUC+uLW0K/WUhLXsEVA+vdbY8Q6ORawKKgNV4F+6akg/+pwL7yHWkrAMTZW3VfpMvfWPdUqLNJLgl/VEhAMOKjqIegdd5cSy2RfRuoYbOem6q816UOYPPae64XgLrCKd+f0C9CMd1OWpppMtUxbkToVfHIqwIc0xx1URlk5kAN/MBzeCebugoDalcrJ41y9zHED3FenvMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNk+opEe21BYpBWRaoyyYUV+dXTZUlyuViIL1zdiPuE=;
 b=AkNJwZJmaCQI+tQ6OcHWI1nHmdvMVRHDbp4WCpmsx/Pi0Invfy/wLFxNFg396KtxBMbHwFZOY/JLV4T9rDbG9vgdzT+zMIi4r8bfn0UcZQvR7Rm+iwMePxyooZX6xp88hgVQHA77e1MdJvJikOIQ20cF2UR5Ag7GIwmdLYanFmoYAmSpqUjbmNpjBEQSPJKVVoRT7mYgtCiL/nUWTxrhnUVe25k3hEQrZY9FgOFjsU2VfY152jjs8Mr7OICn9hAaaQeUo4erffATq4pYlwzO9IRDLnCDOxUkXH0O1mv9LsrQ0huiRCH+iKljnLjBd008Q/gtJBdLiJ57U5puUMCS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNk+opEe21BYpBWRaoyyYUV+dXTZUlyuViIL1zdiPuE=;
 b=M04i48gUWBeDAkogl6FQ2IjF41H1ii2d1oUsn8yb7AXslCPTQaYraVLMOHthIA67k35aJiX9RpteszjphLlxwHWHth/HnFWPJE/trq+N/BiHMlHMiYWHp8Rd0b0HEIsIVwYP7rdG7MN4ffuQJ/cksexh3laZHHOJErLZ/oQf/B0/ajmORn1YiGDVECD0vYT0AuTqbQtbtAhtth2sPidYXkjBK4neh4YFJJPGZLhmjHiebaD2EOSjtku/XHu0tQ2BYMbXFFd28T3lFiFgQLmqab9XZWoTSJiU79Hr4BfD+105tPVWjkFkVDBC9x8mhNsUdgXLAwRCKWuDqeFkOBjI3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 07:12:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 07:12:26 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 10 Sep 2025 15:11:48 +0800
Subject: [PATCH v2 4/6] remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API
 switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-imx-rproc-cleanup-v2-4-10386685b8a9@nxp.com>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757488317; l=7616;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1uFIwURMmiAR4CvvGclzmBrRh3oZCC+95uxrgqJn4rs=;
 b=z/Pvf4GHKdwk73vSZYVkwPPoPYUFGZNtft0BT42sm4n41Pd632vgJQLuCgxtaBMw0N0LH8K+y
 Mh4P7rDnhNNCuKScnAylswLnzyR7IMQrkkUoVXSfJBv+1YrFj405wup
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9526b1-5273-45eb-302a-08ddf0396531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE1JdWJsUytFVEdWSG5sQlZOcDRDa2ZBczRNeHFvZ0taSlpNT3p3NkRRd1ln?=
 =?utf-8?B?Y2VGdVlzVEUxVGNSZzhYWmYyMTFINU0zQWVyREFrSGxCOE0vQklkeVI4bFRU?=
 =?utf-8?B?WXdtVzFoZWltcnRGYms4VHBTYkZVZGhZNmVVME5GaDBmdThWWDVOc0MydlFG?=
 =?utf-8?B?OUc3K3Z6RWVvMmVqN3ZmNTJtblMzTW54N0NmQUFyR3lkeU92M0dZcDlEdk5y?=
 =?utf-8?B?Mmo4T2VyUW1FZ2FITld5TWpsVkVwWkRQaEpNdDYzbThrbzNscDc3MDFVMzI3?=
 =?utf-8?B?ODF1ajlJc2hDbUxFRHBTNmFzZzRqKzI2TVN1eHFzMnBmQUoxUDAyZEFaMW5x?=
 =?utf-8?B?b01UTmFJZTYxcExpK1F4U05pWkVYZHRBQllidE5zQVl2QjF1VEdCbytReC91?=
 =?utf-8?B?cWNDbCtoWWxKcDFuWDBSakw1S0VOVG9oYSs5RUZpcW8xcDR1K0NTUzJKR0RG?=
 =?utf-8?B?b0xPU2ErNlJqa01FNEdlWlVqSWczV1licXhpWEt5eVZHVGVZbW9qaUw1bi9R?=
 =?utf-8?B?citUUi9BRzlkVEY2WE9pbzVFNU55dGVqNnlGeVZDWDlVTS9WLytWcGNoRXFp?=
 =?utf-8?B?eHZQZkh1Y3p3WlZ5ZElDbTVMOTZKVmxpUnJYU3hnV1VBOGlwUjliZHBMa0I5?=
 =?utf-8?B?Mlp2ZjArY0pqY2xxM25IL1czMnpYZVoyWmdOR3JDS0RBM0lQL2RWNGpyYU90?=
 =?utf-8?B?blZyUU1UNGZBUk5rYUhHSHY3dlVhV1BIZGZBMjNvL1F0UGxIQ1NSbm4xV3Iz?=
 =?utf-8?B?WkJOZ1NHY3BsTkFzaEhQV09zUStmVlkxYmlHRTJoakNMRk5Ydjg4Ynl0SmRN?=
 =?utf-8?B?bkRUK3gwVDZ0a2NPbjRNVzJNNnQ4TER6U3RwMVhvNjhBKzhjakxQeElHUnEv?=
 =?utf-8?B?QTVHUnYzTlB6OElSTSt4am5RaCs4ejd0Zy95dURycUw1WVBhZktYRlpkdGZM?=
 =?utf-8?B?Y1lyWlFDWDFlWW1QWHVQbTRFV3l4RUkwMHJOdDFKbDRNWGxnTWRmVEdEMmxY?=
 =?utf-8?B?cXFkOXRYVUhDeXc4c09iZ3Jrc09vT0d1UWN6N3VBekF6a0Vpa1BOU1JmaTF1?=
 =?utf-8?B?V3ZaK0Jld0pqYzc5YWdQL0h4VFZnL1ZNRnYzMHVOdTE3WU5IYmdLMm1pazcv?=
 =?utf-8?B?VkNwVFI0bmR4WStDdUYwQ2VRektZU2Y1SW9EdW43SlJVLzk4RXJ0eEdmNTc3?=
 =?utf-8?B?Y2swd244WTJFbzVUNnFIdEpDK2RSbWFrOWg5UHNuMUFKNnRtNGI2cnVQakpV?=
 =?utf-8?B?c2g4NDRiTFJ0ckllNW5sSFVoNTNqSDZmcVZXQ0xtT2ZPSlptQW5jNitnM1d1?=
 =?utf-8?B?MC9kZ2w1UzV5bnZJaGdXY09MazNGcVhQQWdBZFRSUVIxZ0lSZVZDMjhFZXlX?=
 =?utf-8?B?b0VGWmVRYzhFbjJsNUZrT1F6aGRDcmNNZWdSZHp0TDJwekR6dS8xNmJ1VTdk?=
 =?utf-8?B?cWJqaTNmREFiRnYwV002V1FUbVBFNlczaFlVamZ3cUhRcjdOeXNtNittSWRk?=
 =?utf-8?B?ZFpnbE5RTmEyWkhIbEtGSVRER1pRaFZmT0lnNHJDZGJmSmFOQzJOMllRVVdy?=
 =?utf-8?B?N2VqVHU2V012UXlIa3NNT0hzZ0xoMGFmVFY2K1F5UlpTdVlHa0tHYWkxNk4w?=
 =?utf-8?B?dkNjRnZxYmZtcDBBUUl4andEb0dGbGxhWE12OVNxeC9kc2g3Rnl1d2pXVGQx?=
 =?utf-8?B?K1orRGUwTjM2ZVcyd0s5Rml5b1RBTkV5THBEaDBVTVVGQVZpNENhb0hGOUlM?=
 =?utf-8?B?UXZlSW5lUXhiMFczZ1Zwc0tMSVV3MEEwRDc0bC9Nc0xBbHVmejBheTVYYkhB?=
 =?utf-8?B?d2sxOTdLSC8xRlNrMkx1N1duU0k5QzdIVUdoeVlORzRiU1dSS3J1SkpYREc2?=
 =?utf-8?B?Q2pTNVZuNnhnSzAyUkhZa0g0UGF6NEpnSHliRDVnU3ExQXEvNjFEcjNBb1lF?=
 =?utf-8?B?QWF2T2JLYmdOcHBQMzRqV2RBdDVMaGVVSTlBbEZvRVJuUE8vQ3dIM2JQeXU1?=
 =?utf-8?B?L01FNkNkbzJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjErcVREa3ZDNHRwc2VrZXFLb3VXMnUxdkJVK0EwUlRpK0VKNnVRRlo1Mzdm?=
 =?utf-8?B?VXhYa3cwWHRaWDZMeU8wQUJVTENnN2NrWnBubFVGaWdKZjVqbUU2N3RNazE2?=
 =?utf-8?B?R2o2VnltNnVSNXhSNWpXZGZyQ2YvMkduUlE4TGVPdC9lS3BPQ215VUpyNEVn?=
 =?utf-8?B?VGFkY2NNN0hTa0dTQXZjYkpNaUwwUzJtL1VzSU5MS2VPUkszT0FmYnkxMkFN?=
 =?utf-8?B?dm9GYmNWTDhxZXRnbkh4bzBTVitNcUxwVDBsMk5Ma2NaZ0FaQXozUUgzUlll?=
 =?utf-8?B?RnpTSlNnb3VuVmNKV0ZhTm84bmJXaUxjWkhMWldDQzdhTXlKZnVNNUhmTzk2?=
 =?utf-8?B?bzI0MFpBTW5mTVA1cTlucTV4ci80RzI1UHRrZ0h2VENma1MybkdaZnQ5VDFx?=
 =?utf-8?B?TTcwQ1VVMzdCb25vOUNVRXdyY2NUTzhLbzFIK0VhUlNKcmM3VytxTWpCbUJM?=
 =?utf-8?B?THArSlAzMVkvbjFyZDlmNU9jRURobFY4UWRuQlZ4Qndwakd1V1RGbVc0bk13?=
 =?utf-8?B?cDM1c1FTWkpGamRobXpMb0J3RHBJOUpiUmc4OHViNE8rQk9TKzNuMmcxK2ZF?=
 =?utf-8?B?ZU12dklIZDQyOHJkaWg5RUZoU3hPMjFZM0lCMjlESVBKK05YWjdoRXZzdUtv?=
 =?utf-8?B?WTV1NTNzdEl1SUZZSVZNc2tFMjZlSDh5OElWS2p1Ri9RSE5hZ0RET0RiQVU2?=
 =?utf-8?B?b1lwNFNpcWgzWEpQZ2JmVVBJUnlRd3I3SjJwMUJwaGxZb1RKRkxUT1VLa25B?=
 =?utf-8?B?SE5QMWxpeWtoeWYzZ3VrM09TM2dxdFZQdlZuaEhhZmRtQnJoMnpVVGJQUDRE?=
 =?utf-8?B?S0Y1UjRhNCtXUzBZclhHd2w3c0YxSkJaYzcyRzFIWHEyT2JmbkozWFRnVHYw?=
 =?utf-8?B?cXJvTDdTdVFoZ3JvS2MxaEZ1MEZJem9CNlk2RVZQZ21hdVNPdS9SN3Q1ZGtF?=
 =?utf-8?B?YXdpRkl1eTJQVkpLQ1lZVkloUkJsbGRDTDFmV2NCZHF3amFhOXZKYVdTU0Z5?=
 =?utf-8?B?d21jSEpINCtESUVFaHlRZGZHVzd5NVFsYXVBS1ZmcEh3cEJmTXVhVVpqbTZh?=
 =?utf-8?B?eVByclNBOXlTdjFLalEzUEFEZnVoNEpjaW5WVTIzN011YlpDNGVjNFJMNDJk?=
 =?utf-8?B?NVZxb3JCRVVwOGRhV1VDUzFHdndMcXpTTzY0QkIrYWtuem9nd1J4ekwxSVNT?=
 =?utf-8?B?M3lBeEM1MGtYalJXSXVMQ1FpUFVFQWRtbDhncERscmV5amNEY0I3VnI1UTAw?=
 =?utf-8?B?emdGbC94S3EvLys4QUFMZzQ5am5nQXpBOWVRQzB3VkR3NEhzOTE3a1E1ai90?=
 =?utf-8?B?MU8xUlhlZ2crWk1ndk0vajVWWVVYM2tyamd0NzFuQ3NTNkFkRzh3WEc4UHQv?=
 =?utf-8?B?bFZ1UUllRm5TbCt6ZlI3bm50dVk2aElCOWlZN1RFVTJoZ3NrbUkvUk5GOUpX?=
 =?utf-8?B?QU5lMFVFVGcvODJaVXdjeDFpK1hVVE16SDBBN0ExV3JrZFdCWHdRSnlEMFhy?=
 =?utf-8?B?SmhWcXR5MzZhaDl5V1RGVkY0RmxwYmdDbVVvQ2dwMEVNeEMrVjMrQm1UeWM0?=
 =?utf-8?B?VUFwK1kwclJpWm9UemlDSFhhRTdKeDh2WDE2d2thRXpkR21TRzd0YkgwQ1Fk?=
 =?utf-8?B?MmtTQ2p2RDBSalV2eENkZkUxTUlFQmtPenVUYUkwZjlKZ3NXZkZLdklHK0cr?=
 =?utf-8?B?SjVUS1hKN0xZOFMwdWNCRzhmcnlyWVBTR3ZGdENPRURKbHJRMEk2NFZycmhz?=
 =?utf-8?B?RDZCY2VzTVQzdHBRdUFWNlFjRVYvdlN5SVpIUE00M3lQSG0xU3lnbEVRZzRO?=
 =?utf-8?B?aEJZZ3h0dEtMZzQrODkwSmhWU1N5cnZBdys3Y3IyRVlOMGFXK0JuMjY4UEt1?=
 =?utf-8?B?MmxvQW56QWhWMVVMQjhnUXdZL1FwK2lRcTNHOVRKVzcrbklzL2UvakhDa2hQ?=
 =?utf-8?B?WlZDL0o2bmoyWDNmdFhhbGpHT3JDWHRheDNla2w5MUkyM2k4cERid3lRaGtw?=
 =?utf-8?B?QURtcHdoS29VdHAvMExCeVExUDBqaEUvdmhtSDdrL2p5aFY2ZkJ1WmVOeXhV?=
 =?utf-8?B?NlVySlpQa2J6cE56d05udVVwa2N4V0Jvb2h0VkhoSEtOa3FmMXl5UzBTdlZi?=
 =?utf-8?Q?oSuX/GQvTe1bpwBZr+Cpa9mu3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9526b1-5273-45eb-302a-08ddf0396531
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:12:26.1973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phQyMn30P+TBlTtt82SK9TCNuoEm6dITTyV5wvZhdpLBCoeknZbIPCtvYkH9n1aqi8sdBD7DkwUflsPPmv34iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358

Introduce imx_rproc_scu_api_{start, stop, detect_mode}() helper functions
for all i.MX variants using IMX_RPROC_SCU_API to manage remote processors.

This allows the removal of the IMX_RPROC_SCU_API switch-case blocks from
imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
in cleaner and more maintainable code.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 149 +++++++++++++++++++++++------------------
 1 file changed, 85 insertions(+), 64 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index c37dd67595960f08fd85c0b516d0d03855cec9fc..ea34080970c6a5a9b035ef0d389014b8268660a9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,6 +296,13 @@ static int imx_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_rproc_scu_api_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -318,9 +325,6 @@ static int imx_rproc_start(struct rproc *rproc)
 		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
 		ret = res.a0;
 		break;
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
-		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -349,6 +353,13 @@ static int imx_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_rproc_scu_api_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -369,9 +380,6 @@ static int imx_rproc_stop(struct rproc *rproc)
 		if (res.a1)
 			dev_info(dev, "Not in wfi, force stopped\n");
 		break;
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
-		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -907,14 +915,74 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_rproc_detect_mode(struct imx_rproc *priv)
+static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 {
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
-	struct arm_smccc_res res;
 	int ret;
 	u8 pt;
 
+	ret = imx_scu_get_handle(&priv->ipc_handle);
+	if (ret)
+		return ret;
+	ret = of_property_read_u32(dev->of_node, "fsl,resource-id", &priv->rsrc_id);
+	if (ret) {
+		dev_err(dev, "No fsl,resource-id property\n");
+		return ret;
+	}
+
+	if (priv->rsrc_id == IMX_SC_R_M4_1_PID0)
+		priv->core_index = 1;
+	else
+		priv->core_index = 0;
+
+	/*
+	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
+	 * and Linux could only do IPC with Mcore and nothing else.
+	 */
+	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
+		if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
+			return -EINVAL;
+
+		return imx_rproc_attach_pd(priv);
+	}
+
+	priv->rproc->state = RPROC_DETACHED;
+	priv->rproc->recovery_disabled = false;
+	rproc_set_feature(priv->rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
+
+	/* Get partition id and enable irq in SCFW */
+	ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc_id, &pt);
+	if (ret) {
+		dev_err(dev, "not able to get resource owner\n");
+		return ret;
+	}
+
+	priv->rproc_pt = pt;
+	priv->rproc_nb.notifier_call = imx_rproc_partition_notify;
+
+	ret = imx_scu_irq_register_notifier(&priv->rproc_nb);
+	if (ret) {
+		dev_err(dev, "register scu notifier failed, %d\n", ret);
+		return ret;
+	}
+
+	ret = imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_REBOOTED, BIT(priv->rproc_pt),
+				       true);
+	if (ret) {
+		imx_scu_irq_unregister_notifier(&priv->rproc_nb);
+		dev_err(dev, "Enable irq failed, %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int imx_rproc_detect_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct arm_smccc_res res;
+
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
 
@@ -927,61 +995,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 		if (res.a0)
 			priv->rproc->state = RPROC_DETACHED;
 		return 0;
-	case IMX_RPROC_SCU_API:
-		ret = imx_scu_get_handle(&priv->ipc_handle);
-		if (ret)
-			return ret;
-		ret = of_property_read_u32(dev->of_node, "fsl,resource-id", &priv->rsrc_id);
-		if (ret) {
-			dev_err(dev, "No fsl,resource-id property\n");
-			return ret;
-		}
-
-		if (priv->rsrc_id == IMX_SC_R_M4_1_PID0)
-			priv->core_index = 1;
-		else
-			priv->core_index = 0;
-
-		/*
-		 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
-		 * and Linux could only do IPC with Mcore and nothing else.
-		 */
-		if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
-			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
-				return -EINVAL;
-
-			return imx_rproc_attach_pd(priv);
-		}
-
-		priv->rproc->state = RPROC_DETACHED;
-		priv->rproc->recovery_disabled = false;
-		rproc_set_feature(priv->rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
-
-		/* Get partition id and enable irq in SCFW */
-		ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc_id, &pt);
-		if (ret) {
-			dev_err(dev, "not able to get resource owner\n");
-			return ret;
-		}
-
-		priv->rproc_pt = pt;
-		priv->rproc_nb.notifier_call = imx_rproc_partition_notify;
-
-		ret = imx_scu_irq_register_notifier(&priv->rproc_nb);
-		if (ret) {
-			dev_err(dev, "register scu notifier failed, %d\n", ret);
-			return ret;
-		}
-
-		ret = imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_REBOOTED, BIT(priv->rproc_pt),
-					       true);
-		if (ret) {
-			imx_scu_irq_unregister_notifier(&priv->rproc_nb);
-			dev_err(dev, "Enable irq failed, %d\n", ret);
-			return ret;
-		}
-
-		return 0;
 	default:
 		break;
 	}
@@ -1163,6 +1176,12 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
 	.detect_mode	= imx_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
+	.start		= imx_rproc_scu_api_start,
+	.stop		= imx_rproc_scu_api_stop,
+	.detect_mode	= imx_rproc_scu_api_detect_mode,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -1197,12 +1216,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
 	.att            = imx_rproc_att_imx8qm,
 	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
 	.method         = IMX_RPROC_SCU_API,
+	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
 	.att		= imx_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
 	.method		= IMX_RPROC_SCU_API,
+	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {

-- 
2.37.1

