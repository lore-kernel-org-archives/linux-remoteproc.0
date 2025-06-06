Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACF21B4F0A;
	Fri,  6 Jun 2025 01:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175027; cv=fail; b=m6C2Cz0FqOpmZ02UggySx+y/sL8CBlDVwGL54XatPWDBYc863nzuZAMTGpNBxSRD1+YNwa4te2iqlLuLw0oP02BSywXJqwR4MsBqg16Bx9hkGkjAcrjgfUkJfRR/hw5ALx1i/20UyPlqVmPvmMKuW322pgX4y3QfxwcvRMZ/xCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175027; c=relaxed/simple;
	bh=KEqYaBi5LdRI3lcshxieiP/JWF0OLkSVp3DCvVjxMsk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nyCoYgzUnh9TikmYM8sLtY0KbZOv8oFAVHLliKY6DnYjJUIcPkm65mco/HgkQH/sOTmYJlrKm/tfn/VABRH0c3urT0yrI2EoHLEj8sXA1EE/ueXAEslX+EqxJCYPDqm50w6eSPnopaph2Al+4GL3olcCNSmmEmNRi5g9k9T+3Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UL3iinvQ; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UL3iinvQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dp1yy68WAZlkZx9pz9RQVqlKlhhk8eg+OidZ9hhW+E74AGkw51B9gZbHC2bIQ72VH0YOohr5C97lGPo/wN/dAworSvylraLpFnV98c+d7YIXsstV+zXqcehA1Ebj94EFlB8erRIcnhf9yqOO+8ewPIDYwk4TIMPsLGdDFieAbS4Hal1c0IjLvEPJLXn4CtgR2IT0KPNZkg5C1R6lIEEJ5X145mjzSIjjeL0E3GTLznNOxzE1UQCs4aJIfS6ozf1np+rDkwA0nCe5XoYLvkGPOQrnr5Y6XZqH9msZWxV1nyfkkO2wmLI7TtnsOZhZ7xkBLx4T5IPntREinvjQIjbbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRm3/j0sh6nhYLUolpAzJpqqQAw809cgEJ5d/LlYDQM=;
 b=R4m1Vlj1sB9B0dJsVgLBFhbFSVAr+K7RCquOfdxcViXG5Cy7kuqX/TX5JQamPruA/VJnulC1ltggOXpV93i4fZ8N6sxA5DDU0iCkWubvu2DrwWsbzZATtCh0P55lxCxIay6xXtpVcC7glK2Wyv1sLP8aLSw+sPlZ5nTePJtPeDIU1hpr/9mOBO6E9nZDxbJBHJUEnGIYXlNVltPKEZf1Ew1lnkAs7b3uADotrWZWR+NVOeUd3eaZ4EMR50pA6Sl8Jjq+mZ0oQZ5Kk9RulsWAySajwoNZJGIp+yzauKXUoYHkB/tI6pfbjIpWYO2QJb18+tYJmsKTOlenjqNklKG03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRm3/j0sh6nhYLUolpAzJpqqQAw809cgEJ5d/LlYDQM=;
 b=UL3iinvQzUu1rNhxe9/nkTWQt8QmWAkHsofjy65KqlpoMAlXhZoezAssBWm89oxw6QEiSa1C0yRJOy0JaCTiLwZV5l9/Xjl85VrgH4OCFIkhRnp9rz3DRC+wSwrnNf977LNliOPJjgIHopfXC3FN9c1+ZCWDAfHI6wST2fzhMe658XShbN1iU7x8zhzy6NC6Eok9sgZjZlqG1m6N7M5WikNMSa++ESa0QNaQIwCKCdGMjjoa8oAAaU8tBIgrluw2z797rJBOV9D+zbBFd2QBT7SanBXpoI9ezbeBxUcCrG2inHmjWBWw+aJqnT3e4/6cMphXuV06BlIPUgTRJVJweg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.39; Fri, 6 Jun
 2025 01:57:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 01:57:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 06 Jun 2025 09:55:13 +0800
Subject: [PATCH v2 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749174921; l=8926;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=YGXZcv1+U7zlM+tjW9LHrJP4HmhkkwF8BHMQovdiGRA=;
 b=wivVB+E8YjCYPP4LxDZnf6rDAmM4WcPo5u/zc33CiNehWNqMoZQPzyuwgQtP6eYYmuUZcKm+7
 TU80UL/iPGDAmmYJ+uW7jk+cabczPZrjNVRo7kmOgiXpClmpqkbdqTv
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1116cc-fbe9-46e2-1246-08dda49d6d73
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVcwU0Q5aUFKRjlsUm8wcEZyV3dlSzlPeC9SQ0lraXF3dllRYVpPYUFSaDhX?=
 =?utf-8?B?bU1ERkpPQ3FLd3o5UUh6ODRQUzc0UjJSUUljMzVSeThQSkJTS1EyNmhmakow?=
 =?utf-8?B?aVdqRjIzY0x6TTdnRDNQSThFUFRZUUd1VGJsTVIwS3pMald3WHd4STVOVW4z?=
 =?utf-8?B?SFIvZW51enRGSFlZRGpxY3dRM2hoQVdpSW8zZG1udG5SbXNRbUQ1S0ZzU1JO?=
 =?utf-8?B?UDlLWU9OTFJPeG91TjZJaXZuQmZsZDlHRXRJT0todE9SVnFjUTNibXhYamdH?=
 =?utf-8?B?S1dlTlk5by9yaUg0OTBzd3oxMVBrR2ZkR0lQbVRaeEZ6TW5aRExjdDFSMExu?=
 =?utf-8?B?RVBpOVpwZFBDM1d2cHdBa01jRERVeks5RkpJTWV1Skhia0ppaVkwd2g5enBD?=
 =?utf-8?B?OUMvUUd1YThpUW5KWkRuZzBXdEhtUjdWUkd1QzArdHgvaFladmZmYXhuQS9T?=
 =?utf-8?B?ZnE5a2RnSk9xVDRiQmZ4eW1velYyeWRURnRMQVdzYjhVbnhFY2pMOVc0UUZa?=
 =?utf-8?B?SS9yMzlGREpLMFFvV2N6RGFRRVNTYWpuMHFGanZPV2pISE13OTFhR3NhZXVv?=
 =?utf-8?B?NjBkaWdqNmZHMWovR2RUVUpWMHYvZnJwYjloZ25UQjhXNmM5RldKckMvQ3lt?=
 =?utf-8?B?VHNwa2VzVDlPRCt1MWVBS01UdUlYb05VVXNVVFFhekh2bVhiRmlSSGFsc2tY?=
 =?utf-8?B?VkhKOGNjM0tMdlVqQnlMUVNmOFBnV3grWUg0c05GVDBoWHZkeXhJbkIvdk5w?=
 =?utf-8?B?TG5MY3ROMGFUcnpZOHZ3blFid25TWmxReGx1WCt4OS9GcTNVaGhmODdmSzB1?=
 =?utf-8?B?UEt6b1ZoQ0N2WnBWcVFJTjJTSThWeElIeGdraTNyN1h0TTVza0phOUxuaDBl?=
 =?utf-8?B?ajV3dHlpaHVHeVM3UjNjbnkwM01PallNTnFHRFVGcHVDZFU2dlBZUDVKQ056?=
 =?utf-8?B?MWpWNkhIaFFySXorZzUrRjlSWnRDQy82K0d6c04vQzJpWVNRdkdDOVYyMG54?=
 =?utf-8?B?ek1wWW12T21nbGVDN2pNTU96Q1JwZFN6Ukh3Ny9VMVZDVXRQamNIaDRiMjgr?=
 =?utf-8?B?d1JuYkpERkdPK3k0MCtySHRjNm13N0ZBQUJSdWphRW9lcHg5Wm16YTFkb2k2?=
 =?utf-8?B?dUN3OHg5Zm9aTzNTNUhMY0dGbXJEaWsrU3g3QVNwN2xoZW1mSzBzVCtDNjBk?=
 =?utf-8?B?SmhzMWM0QklkYWZNaENOYUNlNFNXTXNSbkV1b0FQMkllTUtDbFY5RnVDQ005?=
 =?utf-8?B?aEk5MmJrSi9kaXpWSHlvb1VRaXJKWFRwby83bFBBVDFUWkxHeC9PZzNSbC8r?=
 =?utf-8?B?cUk5NnVvZlZ1aEVZQ3ZiWGJkeFcyZGplSUozeWFZZ3ZIaDJoQkYvT0NhN29N?=
 =?utf-8?B?UWtuZktiUEtKU3h0d1I3OGpjUEFkenJaYkZMNUZXMXZwRTZMZktWajBVRzdD?=
 =?utf-8?B?RDhML0cyMi82TU55cGd0Qkk1dk02Smx4Y3NNTTZ0c2kyaVdQbHJ4SDJ5UEJU?=
 =?utf-8?B?K1NpZlgwK1FwbkR0Y09yNUlBQ3J0b3hJaXJDRUE3Y2ltampwYkxCenQzSlBm?=
 =?utf-8?B?RnlVZEdRcTVmNER6U0YrbXRtZVl6MEk5L3I1WGVvRDd3L2wrNWduZTJVRTJH?=
 =?utf-8?B?OVJWcVkzQnJsZXhmdzBUVkxYVjhuY3R6ZDU0eHhVMlhEbTk0emk2aHhYdFlo?=
 =?utf-8?B?YU8wZDUyWDh6T0MrM0hxSUNrSE9rSFhxQ0lZOFZtT0l3N1cxdCtnZTBDeHVt?=
 =?utf-8?B?VTYrOGtHbVJLWHlPV1RxL3hYSGRpdEhQVlFCU0tZN0FOYllBdy9oc0J6OUFn?=
 =?utf-8?B?clA1REZJMGxyQUZrZUJtNDNOYWx4WW5YTk1UeU1oOUhTM3pocU02bjh2REJW?=
 =?utf-8?B?VkZMZWc0aGJqN3JObEQwL0Y1Z283NnY3Y0tPSVdqc0gwUmlhUXdXZFdNQkNR?=
 =?utf-8?B?V29TV04rNEZUM1ZsY0F5S1JLZW13bFo0THQ2SDZrUXhJa2hlZ01lRFRoNk5U?=
 =?utf-8?Q?BCTL86AsdnjOMiEtwkrUGrL28JjOmY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUhFc2NnaEtwRXpLRWN2QkxsOGZmUWlzYjNxRVhtVkFjbnFlVGVpdzZBTnY1?=
 =?utf-8?B?Y2w0bEFtczY5Y3FWVERhZ0N4dE8veG1KNUhpRWgyMVFsMTByc3NvZzhLZkFE?=
 =?utf-8?B?ZldJMll4a1Z3ZUs2T2Nsd214Yjl0WTA3dnIrSFhxQmJtQ0k0cUFqWno1UmZp?=
 =?utf-8?B?U0ZsZnpUZHpSdnEwY3BkTXdMdzZlazRzSWZBYVVBVlNmT09Nb2NMeWdqdDFT?=
 =?utf-8?B?ekdVQXMyTzlOUTV1ZENDWFNnZjB2RG9mN2FFbHB2aUFaSkZGd3dwdk9rTWRz?=
 =?utf-8?B?T0JqZU9OMGxiY0lwSFpuYWtzT1QzUlRuTW54a1RjZFpkYm5NTVozUk9qN09i?=
 =?utf-8?B?cGNKS0JmOXM4N1VoSHNoVFlVUThyZWZ4dHBXSS9tdGFNU2tITzczTE5kNStw?=
 =?utf-8?B?eEpCa1VSV1lCbGM2emJ0U0Y5Z1BPU2RMUVNEamJOWWhBSGpRS0pYZ2Z5UkRI?=
 =?utf-8?B?UWRIVjB5UFdJSHhGS2lyV3lnN21GWlhYY0l1bE9qQUpFM3BacS9nMjZrWHRv?=
 =?utf-8?B?b3cxeFJPSWtqY2p6cHVjUmJBRjVOYXhxU3g2M24wMFo0UkVNbGtta3l5T2hQ?=
 =?utf-8?B?QnRPWWVKUVhIWWNDdmhBbHpDOUZqR3l6MUlySzFqY1RJakw0UlRSY2hRZWNV?=
 =?utf-8?B?UU00UkJkWENQNTNNTUU3YWRMYWNqT0cwb3YxcDU2NC96dlVtZ0M2SERWMjgw?=
 =?utf-8?B?ckxrcE12WnVZU0FBMEpVVUpJYnU4eXF2bHRySkUxaXB5ZjdJMHFPVlVmc1NU?=
 =?utf-8?B?OGZWSmVpSmp6SGlERUlVbnljR21rMFVlaWJYSitTa2N1VGYvSVdwVUdtd0VR?=
 =?utf-8?B?NWpxQ2dJcGpDcWVZeUhubHYwZlcrQUJoYWM0SVVvdmU5Ni8zdUtYQmErdmFO?=
 =?utf-8?B?ekRsT1VSMXdGekRiVnFBQmZMQStQS3F1VVMrUDg1b3BlNVJsN3pjbmQzeTJW?=
 =?utf-8?B?SmVXY0ZtTVkyMmxVNWQwVUlQNHptSldIWEc1b2RaWnhYWGpJQ0gva296aXcr?=
 =?utf-8?B?ckFzTGVrZXZkb2JvWENuamNqTzZsNEJaZldFdWljNmY5c2FIeEFJb2F2OHdE?=
 =?utf-8?B?UVJLMkhaSFdQRUJ0TzRkejJKNTZOWDcwNlRBSERvSG1RUlJwSXVaVFlzemRL?=
 =?utf-8?B?dndlWHFBbXFZcCswck9UbUlia2tkM2poNXJhSTdCc0FERmtYdGtnZ0ZyeHpP?=
 =?utf-8?B?NWJyalhCWHBLTENzWjN0elJadVVTRUllbG9xdW4ySFBsU09uUGdGZnVlK1JI?=
 =?utf-8?B?a2FvNCt5YTdNUnQraFl1aWpFQXFJaTMwK1h4TC9nbnpzT3Rwd1JOQW9OekhI?=
 =?utf-8?B?MlZvVXlWOHZlNncxa3p4NHVMR3NBQVc2ZFFKZnhQc01zai8raDhNSzJIeEg1?=
 =?utf-8?B?bGZwOVZ5WkU4enZkNHZ3Qmd6QXo0M1gveDU4enJqMnJkMHRUWFJzMnVhVzhH?=
 =?utf-8?B?QUNZdFVwcHVQaUpleFZTRy9GaVNXK2I3d2pPM0xLNVV6TnlMdEE1SjhWT3JF?=
 =?utf-8?B?Ylh6Y09HbGR3bjJMa05ZUCt2YUtValNJVlBiR2pxRE40STJYOXNzMzNtY2ZG?=
 =?utf-8?B?TnoyaEprZXZnOHROWDlIcGVPRFVZOTBmcEtMdXBIMmVqekpBaHB6Rmdwd2hu?=
 =?utf-8?B?SHVNSHFHRWRzckx3S2U1bHVOcmZEd05JYTZ3SWZ3OGVERW1GNitEd016YXoy?=
 =?utf-8?B?UUJFNnRLdWlHMm13NTllQ2xnaWtPZVoxc2gySk1wZ3ZtSXhxVk53Q0VMV0g3?=
 =?utf-8?B?L252eDAyUnBHTHo3N2RuL1RIUkxRcG1vb3pYa2I4VWV4YXRNdVBrZERsSG5w?=
 =?utf-8?B?UjBEK2hXS2FZTm1mNURLYTlFNG9JSlRCMjkvZ1VuTlNhUjV6cHNkbnN2MUpa?=
 =?utf-8?B?aTNuaXNUeVVqZTA1L2lmZFlMaVlKN1ZiZkVXNG91Z3M2SHhaeURseC9DKzk2?=
 =?utf-8?B?NnVRNUFEbmtmamFUNlFYWTVTSXhKaXkzNHNhUmQ3YW9NUEdZRWZvWUpsaHZi?=
 =?utf-8?B?MmJVSnFmUCthd3VnbTluWm90R01rS1VVbDVQL0Q1b2ZsUk1DZXlEUjhuZ29B?=
 =?utf-8?B?dTF3ZTk0UklLTDNVWnBHUFFBZmZ3YXkvMmR0dExmcm5LVUs5TWd4THh1Z0tt?=
 =?utf-8?Q?mrERwTplm6Xkch+IlrWM7F+4a?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1116cc-fbe9-46e2-1246-08dda49d6d73
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:57:01.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dyCbSl+GWJb4lZVfrImgBias4fjdfoLZo0UjtkY+sVLMPjQ6S2qo6FG8PVihfhquXPtIbEr2LuwDEij2oGDDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

From: Peng Fan <peng.fan@nxp.com>

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
 - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
   has System Manager.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
   from DTB), if same, use CPU protocol to start/stop. Otherwise, use
   LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 127 ++++++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h |   2 +
 2 files changed, 127 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f10a0db794de494c52304b2323b89f..8fe3c76c9b30ed9e66d4e8c8e2e178a21f3b5bd2 100644
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
@@ -21,6 +22,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -91,6 +93,11 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Logical Machine Operation */
+#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
@@ -115,6 +122,10 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	/* For i.MX System Manager based systems */
+	u32				cpuid;
+	u32				lmid;
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -393,6 +404,30 @@ static int imx_rproc_start(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+				return -EACCES;
+
+			ret = scmi_imx_lmm_reset_vector_set(priv->lmid, priv->cpuid, 0, 0);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+					priv->lmid, priv->cpuid, ret);
+			}
+
+			ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_BOOT, 0);
+			if (ret)
+				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, priv->lmid);
+		} else {
+			ret = scmi_imx_cpu_reset_vector_set(priv->cpuid, 0, true, false, false);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
+					priv->cpuid, ret);
+			}
+
+			ret = scmi_imx_cpu_start(priv->cpuid, true);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -435,6 +470,16 @@ static int imx_rproc_stop(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
+				ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+			else
+				ret = -EACCES;
+		} else {
+			ret = scmi_imx_cpu_start(priv->cpuid, false);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -549,9 +594,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
 	struct reserved_mem *rmem;
+	int ret;
 	u32 da;
 
 	/* Register associated reserved memory regions */
@@ -592,6 +639,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
+	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
+			break;
+		/*
+		 * Power on the Logical Machine to make sure TCM is available.
+		 * Also serve as permission check. If in different Logical
+		 * Machine, and linux has permission to handle the Logical
+		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+		 */
+		ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+		if (ret == 0) {
+			dev_info(priv->dev, "lmm(%d) powered on\n", priv->lmid);
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+		} else if (ret == -EACCES) {
+			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", priv->lmid);
+			/*
+			 * If remote cores boots up, continue the rpmsg channel setup,
+			 * else linux have no permission, so return -EACCES.
+			 */
+			if (priv->rproc->state != RPROC_DETACHED)
+				return -EACCES;
+		} else if (ret) {
+			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, priv->lmid);
+			return ret;
+		}
+
+		break;
+	default:
+		break;
+	};
+
 	return  0;
 }
 
@@ -911,13 +990,53 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
 	struct regmap *regmap;
 	struct arm_smccc_res res;
+	bool started = false;
 	int ret;
 	u32 val;
 	u8 pt;
 
 	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		/* Get current Linux Logical Machine ID */
+		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+		if (ret) {
+			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+			return ret;
+		}
+
+		ret = of_property_read_u32(dev->of_node, "fsl,cpu-id", &priv->cpuid);
+		if (ret) {
+			dev_err(dev, "No fsl,cpu-id property\n");
+			return ret;
+		}
+
+		ret = of_property_read_u32(dev->of_node, "fsl,lmm-id", &priv->lmid);
+		if (ret) {
+			dev_info(dev, "No fsl,lmm-id property\n");
+			return ret;
+		}
+
+		/*
+		 * Check whether remote processor is in same Logical Machine as Linux.
+		 * If no, need use Logical Machine API to manage remote processor, and
+		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
+		 * If yes, use CPU protocol API to manage remote processor.
+		 */
+		if (priv->lmid != info.lmid) {
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
+			dev_info(dev, "Using LMM Protocol OPS\n");
+		} else {
+			dev_info(dev, "Using CPU Protocol OPS\n");
+		}
+
+		scmi_imx_cpu_started(priv->cpuid, &started);
+		if (started)
+			priv->rproc->state = RPROC_DETACHED;
+
+		return 0;
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
@@ -1029,8 +1148,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/*
+	 * IMX_RPROC_NONE indicates not under control of Linux.
+	 * System Manager(SM) firmware automatically configures clock,
+	 * so bypass the clk settings for IMX_RPROC_SM.
+	 */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SM)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..e3e851d88fb069a589531ea21a3790fd62fde57d 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -26,6 +26,8 @@ enum imx_rproc_method {
 	IMX_RPROC_SCU_API,
 	/* Through Reset Controller API */
 	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
 };
 
 /* dcfg flags */

-- 
2.37.1

