Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1609123D29B;
	Thu, 10 Jul 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149435; cv=fail; b=YlvZ/oCICAxvnZYd4ZUdZLlFeQHhkDwyT++/6nmCAXXNs3CijMuj1jKLXCL9Js7+0NrYi2bYabzEzYo9qm+gjt43Cy9Dd9c5zVl9Ni8JSsravb9v6ciDjVr083rhul0KHL65+iRVoevnGQXgvVA84lznVnOR1Lx2lTzHFOj+pfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149435; c=relaxed/simple;
	bh=CicjViLT66rrhmAxWi+KmF/tEAjr31uFBtFHkL8wA2U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RJPgSsZ/e3PtAOWZ4rMK9ilg9zD/oBxnHatvr4fmRVjb8/i0IS116VqMDtAmDPvDPvdc1BVFPaq1H1p0aLUhI1xQ1TFEOYvuuFH08moBF4IgGT3n2MwfttCoiCotlOemZydu1MuGtT0QlpmM+HI+gre8VVvKsiQ9SzReQx1/Olo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Da1/+Cuu; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Da1/+Cuu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn8WfoeAiY0iqkFaCiDvDLcIEJHxVb2GsjdvwZOTbb2aZ/HdKFHIqX0WfqDjrZsx79MO6AAr0CLqVLxIj3SR6iRFAcozuT4pwYpz10lKBwykXQ4fLp8rsf01ytXKM7nqFISfbM2rhIog1TWGFqodH0Hkx7+2hGSBx9bcDjz8/mVUFdXrO10qEk/y/dCMpEwb8uSX/fwxv30WKor4KivF4UtgfBMIvTYTB2eVLHLLrJ6VXbBgK2ve6M4wt64kNGF6SLgZ0EVyLjssXWxLzM/QcuOKRRwDQwvWhSRDd4Qcuk2fKLH13cneQsbC+B8M8n3A+MGzoaj5tao0UGnMazp2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nc8wsytQNr8zKMw38myME0rApGJe8CLREDAPMeC+AY=;
 b=rTKw8Wv5/dqJfJX5Xh9QaZrg91i9oP7fmhRXVmp5Cv/8cMJJJT8F0b/8hH0xkmzu4qCrY/bYep3eKbE0v5szfcZ3mE5B0Um+/r40UZfrBHHAgXojP5hQKfm7OOC0D6Z5Xae1ZAZ7joZZGwhMG7CBH9p7TeIVo738T1EWbVYHFU1C13gOBvAIIVW2e4jfjSl/tWekBtIVfKVsZgppf+vYly6HU6sRmGsPkDMr0xn2IZM+dGsrFrj6urlZX80cC/QOO+dDy5C+lTJQV85EIHj34ta3reWaDjwhs6Dl+AQY66/GYcg3rKr/V3O5Fb1YDUNG9nX5qgTlu0hNwGaL59UGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nc8wsytQNr8zKMw38myME0rApGJe8CLREDAPMeC+AY=;
 b=Da1/+Cuua6VsOuHbgi5EL8EFNdhJ3dqOq7aWcnx0EDd8ETobyd1D9YVnMFP8uEL2sEd4EYH4iFgsryQB/eiDOer25qNfNC9rJx+Ww9uikIeQmzJavX9dRBGSUnfl81b2pmIWGfIDtsD0j7F9/BbHGFCerfCs7hK5raUJdMGv/yl2SU1DHl5NQDPL20rSEf91EBx8zQPoN5SZxnD31jj166vLTihMgIK2WcJq7yJswnPqZDVd8QLhF/PoeufPT2XZnvNr/dKorZ6I/UTKMfwCoWyBazLWlfRMqtrOYG46T6DMJBzkK7E3tOJ8Kc2S12NNc9GalT9c4i4T7Bfx0Hdkug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7983.eurprd04.prod.outlook.com (2603:10a6:102:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 12:10:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:10:30 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:08:05 +0800
Subject: [PATCH v4 5/5] arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev
 related memory regions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-imx95-rproc-1-v4-5-a7123e857dfb@nxp.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
In-Reply-To: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752149291; l=1709;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=CicjViLT66rrhmAxWi+KmF/tEAjr31uFBtFHkL8wA2U=;
 b=rB5ntz9NJ6x30LTsheJ50SUvpviC+cZrxRcBij6n/18MYL2AwycrQ5bSUjtb1lczBBpbj1RaY
 zd/pujLOA+oDkBRNVASxeUpiLzpskfRz2L+iDtWiJATTPUiw5i77qaa
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: ca83ef2c-e7a6-4611-8b11-08ddbfaac3b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGNkM0dydTNMQ3hWNGxmZUhyYi9la1VKeXRiQktEbzVhVFVrN1NEZU5kYUpa?=
 =?utf-8?B?RkdaN1VMTE9VSVNLdVBGeHErd2JHMTVXbmZuNzVucEp1MGszWEZqMi9vaDg2?=
 =?utf-8?B?T2p6bUI0T0l4SVJFaFI0eXJRU3E1VUJ4TnN5bXNkTXBYWGYvUW1meFJMYklj?=
 =?utf-8?B?MWNsNktYbXMxZ1JOWG1xdkZaaDIrUFhxSVE5TzhjSlp4RGd2bWFrVzY3bG84?=
 =?utf-8?B?QkdnbndpY05zU2ROR0I1dHU2L2l5aWMvT29iaVdDcGRIUENJbXllMGhSYy9G?=
 =?utf-8?B?RHlMaW9GNjY2YVVLQWpCY0FNRHRUZTJNQWN0UENXVkZHR0JoZFY3QjBubVVD?=
 =?utf-8?B?b0J4WkpieUVLOFFkMGVvdDZYRUFJQWI1VXJLSDlCY1NKSktJUHNLRUZvL3oy?=
 =?utf-8?B?Z3BtaFgvWHphb0dYVUpNcE9jVU04K2w5RVMzWFhlUnlScmdUT0xHYi9KYmp0?=
 =?utf-8?B?TVdBdTlXOTlkY082QjNDR2NQRFNwT0V6dDkwcGZhWUtINXBoTWhJaHl1akZZ?=
 =?utf-8?B?T2FiSHIxSy9LUWZ1N2J4Tk9VVkE5bUx2cWprcUk2YWlUUTBYWVU0cGxldXNI?=
 =?utf-8?B?THBBMWhmWndkdUhiZUk4WEtldmhyZGNVRWk3M3pFNFMrZkpEcHQvZVB6K2ho?=
 =?utf-8?B?UjluQUJ6NnJwVVBlVXBkdWVDQ2h0bDUzeHR2OFd4Y2Fsd0JwSTJmdCtmNTJ3?=
 =?utf-8?B?YldiaUthemVEVHNuNGZtMGNLdk13YjNycWIzUmVHWGNNZmh5T1o2dmRqZVZB?=
 =?utf-8?B?VDJuNGRPcTBEL2QyamR3TGMrNzJnS2NxWFFOTWk4c05RMU9iYlZib2ZIOW15?=
 =?utf-8?B?cTVGUjhURXJKRFIrRTJ6UHI4ZDc5Ty9MUFNxYUNremRuSC9majJQSEtKZ3Zn?=
 =?utf-8?B?WVZtdyt3QUxLU2hjejNnTmYwV2hHalNTTU1LTFBqdHVGVkY1TTJvZUloaHVr?=
 =?utf-8?B?NVhubnZIY2wwcHpIUDd3MzhweHN3NFQzVno4eE45ZjNKZEI3TlpqdkVBNGZC?=
 =?utf-8?B?bElCaGFSWG8rbkpxL0c2cU9LcDZaL0lEMG5neVdwZFZLNWpCd3NVVnpMMlVE?=
 =?utf-8?B?aWpDLzVIS1R0UnZHbWN5eXZTMmpLRXRhZVVqcE9rYm9HWDUrUC9FM1hMQThQ?=
 =?utf-8?B?S2NhNFRHVGprRjUrczNLYlZoMENicmVaNkE1WEhSc1JnV2F0enNiV3dxcjho?=
 =?utf-8?B?cDJ4eVpCR1lsN2JjMnlEd3RGQlBWMXJUNk8yYlNTR2huRnJ5SEdVMlc2VnVi?=
 =?utf-8?B?YkRrSjhOVktFMUlzbmhaODZ4dXpJaVREeDJBcEtxWVh4M0lUamxiamdlUkdZ?=
 =?utf-8?B?dThLdzUzZE9uM0kyYmRZZ01MUmFsTERkbnJrNjN5b3Y2NEpaTVgwbys2d1I1?=
 =?utf-8?B?ZXExM3o3Y0NlaEhGWE5hbjRJTkVRZ1ROTm9LMFF3R3QvdUluR1QrNVUydEdJ?=
 =?utf-8?B?SU5xTnNzSDlXdGFmNlN6VVRSckNwc2xIMmR3anV1NmIwTXB3RGRhWU5Ndzg0?=
 =?utf-8?B?UnFHMXZFTVZQb0JOdUdmck9rNnJrRTlvVGQ4bERaNXc3d29rOGNPY3laSmxv?=
 =?utf-8?B?cTFUZVpUakk4OG5tM280dm0yNWhESzFmVytROEhVZW00L0k4UVBVU2hka2R1?=
 =?utf-8?B?aEhBTm82OE1rWjA4Y2Z2bll2VDNpODVqZmRFN1MrT2tuNFM2WWdlZlZ4WVdr?=
 =?utf-8?B?V3VPbFhlS2lLSm52MFhpdGxxTTdhK3NNQkxyb1N2VXpqKzhldHNPMnZOQk1K?=
 =?utf-8?B?ODYwMDhYM2Z4MFhIQnZrcEZzSnVlMTRZUkZWS1lLNzdEelhFbjhxMlQ4T2pw?=
 =?utf-8?B?N28wZW9IQlJMbGlTQ1JOOWRzQlh0dy83dk90SWdSeW5xeU1pdUVVdkI0dERG?=
 =?utf-8?B?VXFoZGdHRHozVlpzaWNKL2lTWXhsQTB6bE9CZndyeDBJLzlkdXVNSGxmakhr?=
 =?utf-8?B?MXdlc0RHZE9FbXFMTXdIMUxKUVF4Y1pVUjZ4bjhQbXFZQUh5VUM4WUdCT0Zk?=
 =?utf-8?Q?P84tgtMeM8yDeuwzun6Dk0yfrgC49I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alNZM2Z2ZkpoTlZzanFUSkNTY0FiNHZmeGdCUjlIamp2ZEtwZjdPTGNnMktC?=
 =?utf-8?B?ZndmL0NrVDRaNDBQeEdUSjdISHJua1BVUVVOZSswNGUxbWM4azF4OWV0UnU3?=
 =?utf-8?B?V0JpVHlvTlg5VnhreWluMWRUUXVQbXNBTDZoL3FzdVJvZ0dvMSt6SERwTFhI?=
 =?utf-8?B?dmw4Qk9BcFBpYXJGRDV4RnhVcVhGVTF2bHBCaGRaVW96bU1paUhLazFOT0lM?=
 =?utf-8?B?VDJaVnFGWGUzNU5hR29RMzc1Y0JmR2ZRZHlZK3NVQUh2K0pPakVmK2F0Y21i?=
 =?utf-8?B?aU93RXhaME5tYTM1M2FmbXU1STRNTUxORm5tRnVqV29vUHFxZG1OdmJJUS8w?=
 =?utf-8?B?SWV6L3JPdVQzRXlQZjMvcFg3RWpSL09TdHVsc3RKN2prK1B0VlY3bGRFblE4?=
 =?utf-8?B?aW5vSm50TVJHeXNLaUEyTXFCMkRObXJGWklHTjRsRHVvTEZyRWsxNGdiWnUx?=
 =?utf-8?B?UXBwemFzZm9OTjQxSXpld2YvM0YwaHJVTGM1TjZvNW5qS09oU0NyVjNOZTBo?=
 =?utf-8?B?a2NBOHJpOVV4QXI5c0prOGROUG5QQzFrZGdxK1crOTJmdVltOHoybGRMZTF5?=
 =?utf-8?B?dVM2REM0TDdoVnIxQWVCTGJBeDNtNC9wNkEvZkpneXptVG5VWlltRVhRcjZz?=
 =?utf-8?B?Zmw5ZHR1cXdDWHJVdjZiaDhmRm9NeUZUTzNtZHRCa3V4MUlDMFFkZXhLbjg5?=
 =?utf-8?B?Wnl0V3poc2c1RXBsNFNzcDZ2QU9jTGdLekRmeVJVUGV2azFoV2RRbVB1TVhU?=
 =?utf-8?B?ZWNiZEIvZHdrNW1kMGNsWVFWd3o2OHY4OVBqWGVoNG1pamVxSktESzZQbmJP?=
 =?utf-8?B?Zjd3SXc4RUZlUmZXRTlqcFJGVFpkeGVET0dETFQvM2FQUWtIT1Jzd05pbnVj?=
 =?utf-8?B?WnVVZVAzRkh3NURjR1A3VUZ5NlE2Si9BSU1JVXNpRlZXbUxxVzI0aEEzcHEx?=
 =?utf-8?B?MW9QL1pQV1EvbGwxOW5YVktVZ0F1ckd0YVprZHRNMFQ5NHErc1Nzc25EVjZK?=
 =?utf-8?B?eHhOYUY3ZWJFdVg4U09hai9QcjV4SndFa3BYVzhSZGxNbFhvK3hvY0dxNmcr?=
 =?utf-8?B?VHUyRENDdStHODB4MjA0Z1FqeEJqTDRPallkeDdsT1BwWjRsbkhiSk01NUov?=
 =?utf-8?B?WGZPZytmUm1WOG45VWhYWXB0amJEeGFRak9pcU1UYWVjYWVqSUl1cStIRnVO?=
 =?utf-8?B?eC9FOUlHUFlFV0pLbW5UVlFNeHFCbFNEOThkczhsNXB6RUQ0WExDRCtJVk9X?=
 =?utf-8?B?R0hBMklwQ1lReTdLUEppOEZzNjVVLzZxYUVYUUR6eDlvVXZFRmhGMEN3YXJu?=
 =?utf-8?B?aURIcGhkUHRQU0ZlNGxQeXF2U3hHTUl0dEpSdnYxcDkwa1NiQW9JYk9yZGEx?=
 =?utf-8?B?UGVSNUE3ZjJQcG5Mc003S2ZPMTJyR3NaTFBZZm9lRTE4QndlVU5LNnRlKzI5?=
 =?utf-8?B?R3lZVWxRY3Y5OHRyTWpvaGxTM3U0a2Q3MEkvMTgwNGl3V0tHSExqdlZMRjJi?=
 =?utf-8?B?UFNBcEZqdGk2WFBsbVhsYjZHRk9kbzdBa3lRbnVsdVhZRnVTaUdiMUQ4S2ND?=
 =?utf-8?B?Wk9hZ0UycWhTTWUrRzNwckF2OTlFSTd4WWlCOUNDY09Kcys5eDRKdUJoSHgz?=
 =?utf-8?B?MmhXelpEZmlmU2k0S1hzRjdQMVRodjRMR1dkUjJjUUo1aWhKQmNwTWFYMlh2?=
 =?utf-8?B?ai9RSzJCUDNxVjFvMlYzVWhabjNpdGM4Y3VhNkdaSzRGNHh5Z2h2MWhOT21L?=
 =?utf-8?B?NllrckxVcHZZcFFMNi9KcnMxbC9TMm92QXcyNGV5TkRhWDZ0RHdzQm53SE5Y?=
 =?utf-8?B?WTBzWjlqOEhwQTM1MW5qZlZRK0NjWEJMb252aVN0ekEzWSs5SEZIV3hiL1ly?=
 =?utf-8?B?OHBKOVVNOUNhQUFZVWhuQzkrUzNjeWlIRlFtQUY3L0dEUStYWUpXYzJOY245?=
 =?utf-8?B?VzIxODFXRTdMeHpteUx4QWQ1SkhPQ1ZJcVpQckgxK0Z6U05TbmpJN0d6WDBk?=
 =?utf-8?B?S09BTDdhcXp0QVRBQW1zOUpDQTJoSEp0dGdYTFF6bjF6UVRjZkhXcE5yS1JG?=
 =?utf-8?B?YnlvZGdWOGdhMGV6cUdsdE85endoYm9LSThLd1J4bG1saW1yMTIrM1BNd0FJ?=
 =?utf-8?Q?CRwDAyDo7FhQZ1zyRtIQ3K1vS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca83ef2c-e7a6-4611-8b11-08ddbfaac3b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:10:30.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IerD7GNAlON4JDhDK6IrGtXFR++YEJ+KRZxBRcIaoqpP4dVjYhLJy3mZojeFROobwaasObUReGzOVIBTL+KCNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7983

Add CM7 nodes, vdev related memory regions for remoteproc.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 2f949a0d48d2d8066388884703c3b3cd678f16e1..3f047cbba29671fc31c9048a3eb7f0dbef4af613 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -75,6 +75,37 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -225,6 +256,16 @@ sound-wm8962 {
 				"IN3R", "AMIC",
 				"IN1R", "AMIC";
 	};
+
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1>,
+			 <&mu7 1 1>,
+			 <&mu7 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	};
 };
 
 &adc1 {

-- 
2.37.1

