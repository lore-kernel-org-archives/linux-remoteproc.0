Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70D33148B8;
	Sun,  8 Feb 2026 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770550157; cv=fail; b=GmY/2SIECElAAa8mwWn6AIjH3Rc/Z/CoVe8Y/NlzIP+OHoIit1uHjzqTrUVbyzIWSqs/4cEgDl7w1+Xms4Ya9un3bEnfm/RyEOf01pcFFnw2SZ7t+CFDhXt2fYcXrL0BHGKJzNqikh63OPniPv2cZPs+WeJ9oGPayG2XSfCvjYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770550157; c=relaxed/simple;
	bh=HiAZxgmifumwxOBdxM8G5PPeYYNWf2tLNtNK4+MPBSU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=fjGcewtO6WzEIOjZRUDoNIBAtCE/LPhhfIURaUXcuy52RV0yCUQgYCnQPCpbIsKmhAU6PMMVWmiJ9xadoUCQkXYEZF626bZrv57skWY7XczaAPYLxhIgBywg3DmbiM6LqBkoKwHGvfiWQXzoY7CGlbJjKnuMpIEcPoQHDJWj5/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fWy6WcqW; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fWy6WcqW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Shij127yh2SbMHpo0n3P2Ol3ICj7Fbt449+ddhx/VBQEVF/3MaLWc+EJw17D0FtvV5oeUlgPJpyc7ZfzdyeRkIQMbp1ptm6CopS9yPcPvYly7f3P2QhZ5RHdcTAVhhcCwbwPvgzY6YF+TniuvmoOoTU0I6uyjAq8QLqzvOcGcRrteaEJ8lFeYUms7Luri601qXyLCCxxTAKsYL7EuGwfmyHtmsl9737UbLlmPbAduiTJEFt/zFOTL98kNpyAnK/cklZ0C+pN0Or9q2s49jwpuQbuPlRtRwaIxbLlQfd1F0lNT4BJDRpqEN6kTorrG/J8HVn4IqnakpK0rQuOsyht9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s94wl0BwpsQXENlST+PUn223scWPukZ70OpxfF3inQ=;
 b=r0+qlQ0GQWf3QxWopT0UZYhBizgYRbaFUmC31c5fYmugPx6FE4HOEE1oS9B7p0C0VgxyBxiKk2JMWyL6Vj8j6pvP6nb1RcsSds4GPcYRj2xKdOzGLEz9cODbuqSlgt1cbCpp7X7k0hI8JALT1MvmK+xzc2Bc3Ij3L/pp0P+/L12bAl60D1iTbhFsFGelpdAvkDInXZQAAO3IewahvxFu7BjSo5fIhqZCzawmhG2LCG1ztgA26G5zRum0oBrYukV78WPt+jnqxS1SkFE80K3fn/zKrcS7Hh7TO5FFrwfQwGRrPrI25UHLyC+fRAiDskx3UrcKdJo0QOScN5zL5/PSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s94wl0BwpsQXENlST+PUn223scWPukZ70OpxfF3inQ=;
 b=fWy6WcqWdnL84WBSQpMHaxl/emAFS7e6Hey2CGe0XQ5/ouamNN42vM8S1iQ8Q/h0lx7cBJw+h6AfW3rHYK0iANBZ3yIZOyWX2UmNcuRh3cBiHdkOLEAkBUa2TD2rF85dxbyoP94DA+Q/W5olxI43k0N2opxtMh21c6v9QzTLPtRjWNGyz9K/MCLY4sjIApnvYlq7xsbpe50WWDbnb0PtI5GYz0vO/fpVkB5taw3Z00Uh3l7FRV1MtMRrFmRTkd3mxp2OQGOfCijVpo4NyqK6RmsCNxBZPcCjsQUZVxzfJB13wnO83yGCB2OefNxx577I5sPG3ES6V3pI8LW2RrZdww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 8 Feb
 2026 11:29:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9587.013; Sun, 8 Feb 2026
 11:29:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 08 Feb 2026 19:30:35 +0800
Subject: [PATCH] remoteproc: imx_rproc: Fix unreachable platform
 prepare_ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
X-B4-Tracking: v=1; b=H4sIANpziGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwML3czcCt2igqL8ZN20zApdCxPjlBRDA2PDJNMkJaCegqJUoDDYvOj
 Y2loAQQfy+F8AAAA=
X-Change-ID: 20260208-imx-rproc-fix-843dd1031b5b
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c5735e-d911-4ef7-4f02-08de6705484b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTdQbVg3dnB3citHN0lYUERBTTRLLzBGQzNQL1QvaU42bnJLeHFCMHJhY3M2?=
 =?utf-8?B?azFhL252cnlvc2dVT1FIZCtXekdWUlJ2NXgwd2FKSFZxZ0Y1RlZhMVp6aW85?=
 =?utf-8?B?cXMwdTZtN3A4R0I2dEM2U003R05ZQ3F0cnlaU0tCSDRKdkRKWXliMmNuMTda?=
 =?utf-8?B?VzJWalg2RjFrUHFuczRGMEc2QjZGMCt2RnBmaitxNFNxZ0ZmTUliMTBJYzlk?=
 =?utf-8?B?WVk2ZE1sSU9yQXJqSlpHY3AzN0lWWmkxNnNQRDRBVXBwYkFjZ01NRnY1Sk5i?=
 =?utf-8?B?QnFUemJKM1N1MjVYcWJaV0lyeUZmQmhvc2crTlFaVVdSTTJ1NEc0eDZZSFps?=
 =?utf-8?B?VEtCUlVkeERDK3I1YlhKeitYVFEzRXFaZVdVUzIyQ3J5OGcxejREZFhZRzIx?=
 =?utf-8?B?YjVsNWxQZlJNU3ZyWWlaUEx6ZEJsUG5FUHdSZDdoaVZFaE05VDNrTTN6Q1dI?=
 =?utf-8?B?eDRLTSt4cXA2TzBaS3BaenlUTnk5QmJnYkZhRTV6bVplRWpTUStnRndWOUZp?=
 =?utf-8?B?aGhEcm5XTDZoeWgxeDZoWlVLTkI2dnFGOTdGSnc1Rmw4NVYvcVhFaXdIVDNv?=
 =?utf-8?B?OFVxOXpEc2JtV20xRmc5cmtBdDNWRUxMc0s4bmZXY3M3cjgvMnZQVG15bmN2?=
 =?utf-8?B?L2oyTUxRa0tlWE1SS0tUeDRoNXh3R0pweWwzNW5VZDdZT3Y4bEUwdkJRV1FF?=
 =?utf-8?B?M09lS29kdlJLR0oydGQ0ZncvQ2NNeVdib3NEWjVjakZRY202SE90ckphZkxD?=
 =?utf-8?B?YW9uTDM2Y1Noeml6Unh4L0Z4VzhKTlJRNHRlSVdyQWdCZTl4bC8vSFZsdDMx?=
 =?utf-8?B?QlFnUnNRUk91MTNUdzdHbWxNVnB3NVBOKy8zb0RncjQ4S2NqaFFJWklpZkhB?=
 =?utf-8?B?bUQ4MDNLU3AvSVJqSXprK0hvcTNxeEw3WnI0eDcyUVZ0SmdBeVh2bSthcXE0?=
 =?utf-8?B?Wkpvd2tnbXdYMTdSMHNkcG5RS1VTNWlSeHlnVGhGaTZwUWlPUUQvZXlVUUEx?=
 =?utf-8?B?U3VkVFpaV1dsWVpEd0RFQ2c0akJoS3ZKTzVibklBZFY2RVRxeFJTN2pxeGxU?=
 =?utf-8?B?RXR1cFEzOFRLNEloUVVSdDZDa05SRjdBbkhraW5FTGdPZFdqQTFTMWZiTG5Z?=
 =?utf-8?B?S1EvS3JMNXV4bUxiYmlzdjh5MHJnaUVuVVR2SnBXbDNoUXZ1NWpUUlIzOWRO?=
 =?utf-8?B?RUdJMHM5REtNdWVKNDlRU3JaclgvdFF4ZlVob1Naamg5S0hDVXFTeUZzT2pH?=
 =?utf-8?B?Qm1iZzB5TWpSRmdSV2hkcTFIZmJ4N3hRYVdJdElnei9qaS9RZTEvemJWeWJ1?=
 =?utf-8?B?bFVHSzI5cHZqeFZ6YkFNZXRCRWczc1NiMDF6NGFHL2NVaWhFQkpBMjhDNTJz?=
 =?utf-8?B?enJhU3JOekpGOHhvMWxSYkdqZjBhNHpSRXBHUWRXNVdUUStyTUlmVkRPR1Y3?=
 =?utf-8?B?cDdOYjRlN2xiaUxMVkFxV3hCdDBlSi85WmdHaE5GOHdHeHYzRnVILzFxaFVk?=
 =?utf-8?B?Ty90d3JFQ2ZPMWFVZ2JKeVBXS094WW1rWi9kZHgrRUZqby9NMzJ1OFlpdHhX?=
 =?utf-8?B?c2lPdEk4MkJRajVlNXRwU2tQTEdnYmdVcTdwN1lnK2twZVdOVXRwbzZneGlC?=
 =?utf-8?B?K0JlZWRvL3F0a1poN0U4MS8wVFdlbmFvQjI1cEZGVlZlZExyVS9nb0gvK1VC?=
 =?utf-8?B?M0dEL2NyUjUyTStMUzFrMnBKUHpmN3BXSGN5cUpjMVdBNXhUYm5MV2hvMTBu?=
 =?utf-8?B?YStNTm1GaHc2emltOC9ONU9ndWp4UVFhaFYzVXhTRE1lU0duVjJTNThoRGxo?=
 =?utf-8?B?bmhORWpVMm53QWQybG5IV3l1dDY4blAzYkt0YWMrTnpySnp3QjVzZ1JudjRO?=
 =?utf-8?B?MDJSZG5zMGpVeGF3L01ITnNhTFJldE9RSUwwSWYySWVwRndBTzlzdE5TZGU1?=
 =?utf-8?B?S0ROZzhIMU5WdEI5RUtQMUdocjRObHZEaTYrZXJWU2FjRHhTS0hCcGVTVEtv?=
 =?utf-8?B?U1lnQUlaT3BFOHRmeDR6R2xvc0g3V2dOWElLeUMvMTdBZnB1T3RwdmswaURz?=
 =?utf-8?B?WklyeDF2TXdJQjV0MkxXM2VsQW5ibGI0NlZaRlNyL3RYak1HNnBrSzBqWWtO?=
 =?utf-8?B?cG5VY3RLMkhHb29mQ0pyVDVFRjFyc1o4M1pqM0Y0SlFxK1QvaWZ0ZE15cHZo?=
 =?utf-8?Q?FpFnJ95JtQ3fh412NXMKcdw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWlHN3FCTzVBTjEvRU9RWEdqaFFER1FhQndJUmJsY2h4YWppQTNFTUVaVFdU?=
 =?utf-8?B?dE9xY1VZdnAwV2pmK2hBa2llREMvTFI3cEd1M2tlR2phZ3U1VExEdTBsWXFi?=
 =?utf-8?B?YkU1TnBqT2JObjJUYWdtWHA2djhDditPd2JRR3ZKWE1Fc2JIdXhnUE1zQW1n?=
 =?utf-8?B?S3NRV21MNmdhYW52Y2NmK1ljdHRiKzBvZlcrMFY1RStDd1U3cFArR2tpUkNv?=
 =?utf-8?B?YUJUeHJlbUFUUHQzSjZIdFBUUXRWRGljc2lPRDY1eXN5Y2ZNQWlFWXJ2Y3dk?=
 =?utf-8?B?S0NsY0x5Ynd1Q2NyVEJsWDhzbHBkL3FWUTdyc0lzZ3owakNvUkRhWkt3WXFD?=
 =?utf-8?B?UlBST2hTckJFU2p1cmliakJvTXhiczU2aHg5TU5KYmFPTFpHMW54amFMMmRz?=
 =?utf-8?B?dXRNaCt4VGRhM2ZRNXRUQ3Vxd3BSWFp3S3FMUG9SK3NYcU9qVmFUVE9XcWM1?=
 =?utf-8?B?K2tRbFRtTHBSL25HYVZXc0kvb21pbXg5eVh3eTJ6dm4rNnI1M3h0NERHalBi?=
 =?utf-8?B?dkZnbVRjeitLTENKNVIzaEcwL2pGRXNLRVVPUDlYbmszQmZkZTU2VHV2aVpi?=
 =?utf-8?B?aWZnRGhwQlVTa0hEcjFYNHhlaVFxQWh6dDExbmRnUHJCbGw4WGhEcGZDZVNK?=
 =?utf-8?B?ZEpHcWFWYmVrYStuZmRBRlF6NGRTV1B4RDk0eVR5UFFqR1hFRlVwMzFpK21T?=
 =?utf-8?B?OHIyS3g1czZWWWNoclNaWm4xYlRudFU1N0JFYkEwNVQ2YytqQmdTK3p4a0l1?=
 =?utf-8?B?RXlvYXF4ZUNWQVc3aGhwQWhKZHQzOGNLSW9BcmZBUDlkOVhPbE1EMzVuZDdT?=
 =?utf-8?B?VnpHR3JIZ2kzbjZFMmdXYy9JYW80Q0pLMGFGMHVhZTRnRVp4MDhOYWZnWi9T?=
 =?utf-8?B?eCt4My9CRHZvSXdvWnFNeW1YUkhtcXFWRStmVGpaNDBpTnAvTENXUmRiVzU0?=
 =?utf-8?B?aEZVR1VhK3hDYytGZU85TEpLR1pzTmo1SktqMENBZWdUVjlvKzluczdwUjNv?=
 =?utf-8?B?VkdDaFAwVCsxeWxyMkhzN21BUk9IWHRmbGo5MGFPeit1bnF4QWF5MmxyTU54?=
 =?utf-8?B?bTJoNjduTzR3VnczYkxnWGdqY3lDb1hOYXk5NzgyWHRFNWNQRkN3T3VlMU0y?=
 =?utf-8?B?Z2o3ZWdIQVQ5Rit3ZHNuODNja2hVbjlDSjVFNXhySlh6RGlKd3kzR0dRNFdy?=
 =?utf-8?B?MXZBdFpqc2xYUi91cERhNVNXRWRZR2VVclROck1FczhCbGcyOTRWQkYwWWRK?=
 =?utf-8?B?b1RLWW9YZ053NElNelVtZUNBNG9od0IxYzROMDNPTmtVdDBZWldWZWhxOG5S?=
 =?utf-8?B?RTZRQlBnanpldkRyckVDMFdERE5SOGVwZU1VcFN0WEFSZVVGSFRVcmJSY0JO?=
 =?utf-8?B?Sy8rVElKV3h3SHdIUnlLQ0srVURmVWl4VGh0MFFxSk53MzQ0U2lzc1poMjc3?=
 =?utf-8?B?QWRjakdRN2pXS2Y4Qmc2OVRqSEk1eTBBbzhweFllNnk5NHQ2Q1RPaVk5RXA2?=
 =?utf-8?B?NkE3SHlxNXh3S0x4bTdLOEJ4R0FIRXJvU1dER2k5ak5VdHYza0VoTDBZZ2hy?=
 =?utf-8?B?b2J2ZGNzZ2FRSDFKWmZ2UFY5dWdoem52b3lyaHpaM3JRTTRQZ0NZZTA1Q3pl?=
 =?utf-8?B?bXBMeXJueHc0d1FWNUhCWDM2eXMwcUxlQUJxSlQ3SEdaVWc5ckJvZTE0d2ZQ?=
 =?utf-8?B?RkQ2R2FTNzl5VnFmR1J5UUtHY2lya2t2cWZNbVpNRzh1S2h4YmxkcTh0Qkk4?=
 =?utf-8?B?WDhob2d4QS81YWNWSitwQ1lJeWlIejc1R1dEdjhtNkp6OTZwcXJkUW5veStW?=
 =?utf-8?B?ckVRRnEreStCVTlTOHZzSDI3OTgrbWxtV2hkWCthYThLMCs1Nkp3ZS9uVU5B?=
 =?utf-8?B?SWF2d2J5SXVCcXNzZGttbEJtcXFTKzN5VFI4b0l1M3Z4SUl4dUE5MCthSU96?=
 =?utf-8?B?Vmw0cTAwVFd1MHBaNDI2L3N2MERJa1A5ZnQyMi9nRkd1cVpXNjJiczR5VEdy?=
 =?utf-8?B?MEhlV0ZaUllnY2d2dzBrdTBkZFNOK2lLUllzY2hSVHFoRjRscU1pTElsM0Z1?=
 =?utf-8?B?UjdGSFJ2cTRoYlpLck13ZGZDU0cvbUNNWExoaDV0dEFkNVN0dVoxV0pCUlpU?=
 =?utf-8?B?bFNrbDVMZXVBNDhKeVEzVzc2cTE1OFhCWTRlQ1EyUHNHT1lOM0FjWE45RkNo?=
 =?utf-8?B?SmhnK2NQakxGWEdLYmxydHAwN0IvbGZ1RUlMOTJ3djlWcjhWM3RVdGQ2Z1hU?=
 =?utf-8?B?WDlOZUVGeXhhQzQ3emlncE9HKzJSdEUrZnFtbVNKL1I3NmxPR0hCZEFmdysr?=
 =?utf-8?B?YU15aUphd29PZndGTUdyc0pVRXc5UEJCMlg5cUZZNVhWRU5uSVMwdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c5735e-d911-4ef7-4f02-08de6705484b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2026 11:29:12.0530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6U7xY6Ifpv+0EMFdyzCqBQ0s0rTATcJg172jHol8f5Ts11JOq165kICVZJiNBOdRMuf38fyw9yl1pQ5SZyebg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036

From: Peng Fan <peng.fan@nxp.com>

Smatch reports unreachable code in imx_rproc_prepare(), where an early
return inside the reserved-memory parsing loop prevents platform
prepare_ops from being executed.

When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
returns immediately, so the platform-specific prepare callback is never
called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
i.MX95 have no chance to run.

This is problematic when Linux controls the M7 Logical Machine and is
responsible for preparing resources such as TCM. Without running the
platform prepare callback, loading the M7 ELF into TCM may fail if the
bootloader did not power up and initialize TCM.

Fix this by breaking out of the reserved-memory loop instead of
returning, allowing the platform prepare_ops to be executed as intended.

Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f5f916d6790519360f446f063e09d018c5654953..8c8ddbf995a46b01627d15a2eb3da0b72eee6285 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -617,7 +617,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 
 		err = of_reserved_mem_region_to_resource(np, i++, &res);
 		if (err)
-			return 0;
+			break;
 
 		/*
 		 * Ignore the first memory region which will be used vdev buffer.

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260208-imx-rproc-fix-843dd1031b5b

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

