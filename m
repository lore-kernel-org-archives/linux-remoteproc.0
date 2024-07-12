Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661AB143758;
	Fri, 12 Jul 2024 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772774; cv=fail; b=I59k79oBR6AekQDJA4ZcLqyoAsdq72eRiCtDJ4lOFOgEZOJvFE0NOO1GoaN5m63XG/rmj3ZzM9FoH5coRIYsB4UeeSLpBR4o0RIt9xrbeZlN4RkP2zZWe9AZyg40uxhZfsxMWUrqp45TzIR5Hw+71XJR7mKl3rBYhhkkjxTwFDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772774; c=relaxed/simple;
	bh=YtyxW0v6xd2Oi+TbQ8vQLzd1o6q+eAQL4yq5VB5TBF0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WP9RxZzdyEjlhSZ4e+smK8bvWE4gX7XUOvQa6cLuTE7qQLhBVPlFbpM6Dwrg+RPLkBYqcsDgFQZIu7XmHS/RY9jpOJmbr978TromnFViVavvl7jbQpohHHL319dbgQpVwo80VR4oWxydXkYrtP0/pqP0IyiMJkyMt+DmUaTLD2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gKMpYrBJ; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gKMpYrBJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5HKPn7Lc1PEwsRK0dECs1T0/9qCWQe6SsT1ObyTwE+oHyCGGoAe+wmw2iZY0N/Y1fNFJyTKBiKcmXBnIWuikc1gkX7RwLGP+0ryimtvo2v/4sFMV1ZtSSI8JYsvq0fjIr901NaeWQ7RrCocXWyGzvctMlliJ/22akrrlSAAl5ijc6X/G9fbRQMmTmThEllRYuaO5DN0ifGmuVHIyR5eUWP0IBHZEs54XqpuzF9WsouGFz72Ka5OxjUzZBNPoVtEv0uC8CvpnO2IaMD89MsbpI+L27mLDgiMZdYJ6L6TAEi53M8U+n5wR9OX+WIP7/unLfwlaMgUF5/UONhWhebjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oWHKCUVfvrNAzxd6DC9qQ+keZBb/vPFAM96MmrhN6M=;
 b=XaPDaKBrlGhQhZIiOz2sU92hNDaXoKitU4sllqa32fcU/mDro0DWgi2B1M1jweNXZMC6p5NDp92tEtataGYCD4NgeFUhxvaiz/5Uit+i5bJqiOwhdsLuCXtX8eC0EfFOhA+I2nchLapGNhBYkxic1wE190XXV81ZbdHj0Tzb6SPmm7zA0pCcv6gf4hl5UtOGUNcVoSjS338iksebnUTgpvKTWHUEIweLhHXorkDYa+uwzCbf83Dc3W9p9hjo/eB6I2UPxRKpNezISrE4iZAWCr7v7jGdcp60ECkuOLwsFqcudRc3gEbSlQonugDdRlDBztbnTQGlkKId1ASKANWxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oWHKCUVfvrNAzxd6DC9qQ+keZBb/vPFAM96MmrhN6M=;
 b=gKMpYrBJ8SAWNlUZvNs21utDcOC3eRQ2YwKnAohXI0d+TJvWDhOFJXvWSL1Z3oP/TiSsowX1XRgu6XHP5AvxME0/M67qw191v0hQsFeXdHyz/856h9MO8wE64K8hCuY96eu8BaB3Q6IrxLapEq/NLSz46sj1BpbNBtuDBEVvYrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 08:26:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 08:26:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jul 2024 16:34:56 +0800
Subject: [PATCH 3/6] remoteproc: imx_rproc: initialize workqueue earlier
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240712-imx_rproc-v1-3-7bcf6732d328@nxp.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720773307; l=1089;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=30BtbG0V4zrqqgPMiZOOg2E1J67bBTLgehXqosatdF4=;
 b=sPaOPV7FaSLgnsmRzqAItmpVuWs1UFpyRjcdsJmJqR2xWS3+WdjW02OMOo42y2XHPZ35WUGep
 UPBQhkoHycUA8tS0Y0yyPKyZSNFqBPrzjrQ8uuZ6/zkFSgoOL36fq9L
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: c872be37-318a-4c30-84a4-08dca24c4816
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVdpTEM3QVhPNzRGOGRudkVTN3pXUFJCTlpFVDNkSUF2MjFDZE4zZi9RN1Jk?=
 =?utf-8?B?TFhubi8xdG11UForWkpEaThMTUEwL0RXN0VDNk5MZUVyWjlGRjR2S0NFTUNh?=
 =?utf-8?B?a0JVcURlRVFqZytsWmltLzZFQTRkbEcya2tFN0RoeDZzS1lYaW0rQ2RJU3lm?=
 =?utf-8?B?RDNIVkRacEMxdDdDZ3RPRmtUbmRUUk94a04zVXFNRGtXOUJmai9jWTRrTko5?=
 =?utf-8?B?TU9YQ09IcUUzUmlXSHhZc1pyc3NLZW1HNnRkNzZHUlMvRUZHbXJnUnI1RlZB?=
 =?utf-8?B?VGJSU2FZdk5TdFNJYXBwTE96TmpvOW9PY3RFWGJETHlQQ3dGbnVXcnBWSXdQ?=
 =?utf-8?B?bzF5VEZYanYzYWRRRkpxcXgrRGpQYVJmRS9QdnJpcXVyZDVhTXE4bG5QSUxk?=
 =?utf-8?B?QUduZm02dFo1bURSZmw2SUJIM0dqUHhVdEo2YVd4TDRPN0pVTjdIMUtRVEVH?=
 =?utf-8?B?SWhtaG00SUNEM2Q0TGlRajJCRVB6b1haMnY2QW50SmhNTE5IV1RHdHpKVVVU?=
 =?utf-8?B?TEJNUXh2Zjl1bEQwVjNZbmZ4cUMwaXpha2RsQWJvSFZubEZBVXM5dU9FWUxm?=
 =?utf-8?B?UXNSTXVObTc4aWsvVUtGU3NzaktwcFRLeE1Tdjg2ZkZWNnVRRU5IZEJiaGdB?=
 =?utf-8?B?ZlJVUTM0eHZCS1daWGUrS2h2TjlZTUxvUlN4ZWFuZUNEalNjMmllK0VwQ054?=
 =?utf-8?B?bVY1aFh4a1ZCSkNhMXJvRGRPd0lTNHFCUXkxY00yT3BJeEdjYzlwdVoxMkNN?=
 =?utf-8?B?a2dlSDZSNTJORHJOZXhUM3Jxc2hLYis0dmFlZEl6TUVHZ2lhcHhreWJBemhC?=
 =?utf-8?B?K0dxb0FPcEZ0eTJsREM3cVM4M3Z0d2pJaHZQUjU5TDB4VzZhRVRiQmVRcUZ0?=
 =?utf-8?B?dkJrbTdNcFNyZWdxYUhtQXRsbzJUeFV4dDAyeUpDUGdVWE1XTHZRY0ZBSGJn?=
 =?utf-8?B?VHBjS1QrclZtR0FlQWU0Y2Q5RWRaSUNIRHpuUjFJZXBNaWRvczNTZkI3Qk1i?=
 =?utf-8?B?SEdBeWgvWUI2RG51dWY0enRvV0IvNUpYWUw2dWNZVFc3MXBUTHVSN1ZNWVRu?=
 =?utf-8?B?S0hrSHhXdS96dFhVcmNoZnlzVUMzdEFheHlBV3FrQU5LYitKVzNMSFR5dVhJ?=
 =?utf-8?B?OWxqYk01VlZZT3dPN1RBY3Z5ME9tWlc3ZEFhZUd2YmlKaURDRkFSY1hoMkJH?=
 =?utf-8?B?SmU3OU5XVTVNcmZubDNhSUc4Q2tMTFZFTUhLdUwxNzRqQVZQZUVLK2tJVFll?=
 =?utf-8?B?QmFkMktMRURLaTRvSWR3R1Q4c2N5TUZvTmFGdldYVDJxQndUUndHMk82OGNO?=
 =?utf-8?B?dlNxM2k2am84dGFSK2lRS1VCdjRIK2pBYlpqTVRVY3k5dVBocFpvdkt6eGJi?=
 =?utf-8?B?ckt5OVdOLy9tRm04UGNSWEw1R3k4cTFJRlcvYWpKWWJRNWZMT0pMa3F3SUow?=
 =?utf-8?B?VXdxeEJvbWxoN003ZU45REpCMGl3UWgyZ3BNUTh0SGJnVmlLME94TGpUazlh?=
 =?utf-8?B?enN2RWphQkh2bXZWN0hUWVMzYWlNSGgrc0xBZzUwSVpqM0M0TUJTMUMzdm9M?=
 =?utf-8?B?MkluYUJiS3FycFhZelZEL1RyL1I1dWprWEdWUUJ2eU1DUEZaZm9xSWpwc2pq?=
 =?utf-8?B?eWxyeG9TNGVHUXVRN1hKTjZyOWRZOXFXK3UwZDRXK0hPQ1hzSW9RcERWMVV6?=
 =?utf-8?B?RWJrUkkxOU42KzR0UUJmY04rRnBmY0JkR2FPek5QTVFpWFZ4cmFmTWQ0eXIx?=
 =?utf-8?B?VGNpcFZtNUlhd3dmMDdia2lFVWxDUUQvNCtyQnVWb1hDbExKajN4bHcxTTkz?=
 =?utf-8?B?K1ZYK0xlWVlzU3B3SENGR1pPdDZVRWNFcFBnK21jRExWVU9oNGUxVUxZQmM4?=
 =?utf-8?B?K3VYR3pwSGk1RVF6S2E2UkN6by9YUmY0VGRuWUxLWllrZlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJ3bXRTV2M4c3NWSzlVdGdKZEJvdmJ5SE9mdDlhSXZTMTk5eDgxSVcvdXVL?=
 =?utf-8?B?TENLOVZxYzNqQzBaMng5KzhrOUlieUVUVEVzUnVQWmdJanVzZzVsbEg3bWF3?=
 =?utf-8?B?aHg2U0w4cGxEYmwzZ0ZadWU0OXAxYzFNOXVSYXcvblZJbHluUXlCWGNLOStB?=
 =?utf-8?B?TTB2eGlHSkNMNGNnUWI0SXZYQkRYN1lrMFRJQnQ1V1pHRjNiRm1jbm5CdkZn?=
 =?utf-8?B?WVZjYThNazd5NWtWTUtUUjV1bFlmc2tlbDVOTjZkZm9DV1ZKMkh2YUQycnRG?=
 =?utf-8?B?UklOY2JPelJnUW0ybkttUE4zTXVtYi9HNlhJcEFZOVdHVTVSTDNXRVV3WjE1?=
 =?utf-8?B?VWNSYjVVUGViQkxwOWlCNk5EZTRnS0xwZjB1YzhpeXdBOGpDbk94WjBGaElZ?=
 =?utf-8?B?aUtDV2dXUFREaEFmREJjUlcydkNjZ01EaGpXUTg1cU1xQ3U3Q3JTSlhxZjdw?=
 =?utf-8?B?V1lkRTM1WjFTRFZXc1BvSVA2WUdUOUhSbk5hU2RCd000VWxxQW1WZURKb3VZ?=
 =?utf-8?B?MGxlY0R4eXZLTXc3U2ZYSGswUlljQ3A2QnpFN1VLbGk2VTNKZjhSc3E5R0ZY?=
 =?utf-8?B?ZDM4WWRjT0ZIYlJXMm1ZQVY4UXZCQkF3RmZ0a21sTEtURTZFamZyZGNVdjRp?=
 =?utf-8?B?c1loNllRY3Y0S2Y2L1l5dDJXMjZjS1lvOHU1c2o4K2xteFRYN1NrMitSNlJK?=
 =?utf-8?B?VEdoOGczQnQzUisyR2FDKzVPOWdmckg2ZzR1S0pxenVqQ0h0ZHBqR2Rza01l?=
 =?utf-8?B?RUIxdExsYW1PRit0K1owbUJHZWhIQU81VVJRTklUcG1uNXdSUHdLaXZneEg5?=
 =?utf-8?B?RzkwSWJWVmRhRmI1c2xTWkQ3ODNHQnJxenZnQWJqa0dMZ3E2cW9ROVVvR1k1?=
 =?utf-8?B?VGVDWFYyWGd0NmlROVpIM1JjYThLTFREaXVuWXZEQitCWHBUYW8rckZ4U1VY?=
 =?utf-8?B?cndTY3NORzJOcytkendzcjZxYjB5UllpdDJrU1JsTUZVQWl0WG5vemRuTzVp?=
 =?utf-8?B?VnVnUnVBS240d1NsRjN6akVNWUM5R2RmT1ZOeWhibksrRnBNSG5hS0hDT09C?=
 =?utf-8?B?YVBOaEdIWGRoS3l4MEE2RldNVk5ZdzlUZlcwM0hQMHZhQnovdXYvMGg4VW0y?=
 =?utf-8?B?RGx2VjFaOU1JZEtQMU5OMWQyRUpzRE1GRkpoTXBrZU1ENHlqbjBvTlJUNEtS?=
 =?utf-8?B?V2FpQ1hNa294NlRqa21CVnpUdFhDRjlmamNvNEwveDAzQlg0Zzd1bU1XSEZx?=
 =?utf-8?B?cWExN0VodkRBRHhpeWhqbERveUZBY2wrd0dNdnY3dWI4UUZYRmpVeFRZODF1?=
 =?utf-8?B?a0FDSkxLeERFNUFITkhEdWNOZEVQdGFMa1kxU2FPNmxBZXdNU010dTFFOW04?=
 =?utf-8?B?eUlWb0dLTVhRS0lyeHRyanVJUzJVNmU0VTFFbXNRaEZIZ2h6dEJoYU1lbmtu?=
 =?utf-8?B?clE1YmpiSUU4WGtyM3RmWTlsR0tyN1RHd25HOFlyVnhsaUVheGUyTXJFcTJ6?=
 =?utf-8?B?SCtqK05wWXpNQWRwbGJFNEtRU0syUkJSVlF1ekVHSUE3Rng3Z3krYk5LTTND?=
 =?utf-8?B?OXhjYlBCbTk2c0ZSV2pxVFp5R2FPbE51aDRLcitTZ01HMDBqT2NCNW1DT21J?=
 =?utf-8?B?OVVBM3lHcnBSalVpeHhsR05UbEgxMmdNclJwN2txcGlaS3F6cnFqVEpWTnNC?=
 =?utf-8?B?dUFndmtnbVF4VkZJMzNLZU5DMDlRWmR4ZGJUOXp5LzJaTTJSZC9KdGdkVmR4?=
 =?utf-8?B?eFRsRnBBREpBcFZvSHk1UkNtMkxtMytyOVZLOWJSblZQMzh5OFZUMThIVHV6?=
 =?utf-8?B?WWs1akVpcEVvSmgwZ0ZqVHVjRXdTVE55cEdNYTh1ZzBuZnhXMUs1cDhJWFFD?=
 =?utf-8?B?UmtSYml1Y3JHZzBCRnBTM1IwMnhZWUN4aFd6VXJvbWZRWWlqQ0pUdjRCSUxE?=
 =?utf-8?B?RGxBSHBpc295UE11cEpGYkRQK3IzdWJ2ZTFNWGI3Q3A5eVNGQUgvNm5TcUdY?=
 =?utf-8?B?eU9hRzczZkllUWZwa1lkazhRbllVL3lPenpEcVI5ZUN1UzY5U2RZZEZvRlly?=
 =?utf-8?B?aWZBNW4rR1paQ3JzMUh3RVN0US92STczUUxtM0tYSEljL3Z6OURVZEkramVD?=
 =?utf-8?Q?pfdr7KBAeibHuMNfKySakLXyw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c872be37-318a-4c30-84a4-08dca24c4816
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:26:09.1283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/3FsvXXlpKiQ/trTpOcFR4nl3xo863+Q3hCN40j8EtqeFZbOykqanksKYZWDsDXTTsSzcC8QYzTeRWJSrSdUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709

From: Peng Fan <peng.fan@nxp.com>

Initialize workqueue before requesting mailbox channel, otherwise if
mailbox interrupt comes before workqueue ready, the imx_rproc_rx_callback
will trigger issue.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 48c48b53a3aa..9e99bb27c033 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1087,6 +1087,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
+
 	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		goto err_put_wkq;
@@ -1105,8 +1107,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_scu;
 
-	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
-
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 

-- 
2.37.1

