Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1122A2F290A;
	Fri, 10 Oct 2025 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099107; cv=fail; b=F/8QdCm/Zd3630Pc4cxkDIoO/9dGaQeb3ygzM7QRrADFkgcY4WCttE5ARe8suFMoR00784AI4GCkRe5a/3BLoBC3FHdYEV0Ys3nEloBKwrErFosPkPNMG5+ZmF7D5Vb6DD6Y1mJWePF0Co7lgrMbPg6c7YFH+clA3O2BPpGcOrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099107; c=relaxed/simple;
	bh=u0I9HnKhmATwQND0ngMpUwbnylSsoi1syJFcCpBLHew=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Oszu8VRGk66fSzlPZxaoACgGhg5FnkfxiVEvfEmI0imK/ntnDWJXlRSC0UGRFwOMsEBgo/R0a+FLgOCFI2KjBO6BEfvGm5U9k5IpFXuj3xexfDYLuqOrf1EhPNV0O/t0irxCo9II3ris6MnP9xZ9kM0pnhjcNlhn0x9kOZz34Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NLdbpTFa; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NLdbpTFa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byZfS/K2foYG0DQhQvyW6G0WIzawyp5BqTtNSGt0DT91WZmfDYK6Zv0S7xE0bLBKmNeeaUjzOTntrZELsUMxVFbjxVk7RL+dQJKu1ugYrY792ovo6vo4kxn2quw2qO+TLaaigd7h796GAdgOktwzBz97CZWIybHnl7bqQVbp2fNm+rbd96gEjC1wYjP0chnKZW2SsHyIGZoOKeCbAoSzTiDVcTtph9k2MuWL/mZsbM7FaNRlOTg+lNCFhO9IawD5NqywGvWV2kKu+y3r1H3DspgkbB+DsT53+T+jbbEBi8IpZueKn3FVV6EkIGYBBXdTGKW7b/36qIcr7dGwkLGExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAzS0umrcJwjIangRZ80uucUKtpmO90IGAr9mj7FgRc=;
 b=b2rK33/zg2Ao8QF475h5o8PatByH/0E/BRtuIzEoFszLz7bjojcRmPWquCLeczHc54ndGyaX+sKkcS6ux//LcS8m/L4DdQ7A3ZuYZ+gyCN4ooyEgyomHQg8vMnobmJDwNXVnvkeaOo+vm8zCMVbj2Ndn66A3NON5isdvt7pKUsIOuySbFyg5LtNwyOf2MtJYCWE81iCd8NW6I4FqrT80hSNKCt7c38YsK9kww/WgSlXOLkjEopJDHIz4Dh3eG1eZMFwQYGGeE0pGROd3gp9lLjsOtO6FWezI/JMGkxdRsRvUpHat5Vr7e6xyQw0+DJdjgYSDK1WveShCIqjme1tcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAzS0umrcJwjIangRZ80uucUKtpmO90IGAr9mj7FgRc=;
 b=NLdbpTFaT4sNnXGjnRckowH5vlVlvAH5DuMSUWv1hu5vszxkBwUXP8I31+D6qq0Z8mowVFW8H9xeSiCAPM/14vOPAOkbagbm0lAazwJcDxPehBhXmzeOnk2HTOVALAKPeeNGAHtwqwxElrw84vZ0DZiDD7BnfMREVN+f6a32d8+0bqGvoYWgcfYs8yegPESOrMtcp5Ds/XRqPT6E0E/r5JkVajOl40/HGQWOjh2G+/kXWoKDH/QDrpqNR5MvCDkLg+5A5sqwqe/q1d3fbES5MSWCvtObPhpwgFrmUr70A4tnzGTkqkD9Qm3AcKwWJvuo6/828nM9dgh691DSR+MQPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:25:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:25:02 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:18 +0800
Subject: [PATCH v2 7/7] remoteproc: core: Consolidate bool flags into 1-bit
 bitfields
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-remoteproc-cleanup-v2-7-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=3014;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=u0I9HnKhmATwQND0ngMpUwbnylSsoi1syJFcCpBLHew=;
 b=Im5O7Hxq5zWzZowvHig4nyvKCocE87DBo3NsxDyxW/0Yh+BG1eQBLVPRlSMx68aHhQDnqkkZg
 sj11Azp/dsCCCmLc3BZZJrOQgZvwWbf7nCtjlXl2Sjn0yIsvNfRSvRw
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f385cc9-0d32-4efa-8a04-08de07f80913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M05zcFBqZkdPLzJGWWhKRlpubzV3UWVGL0tPeHJsRk1FOFk3QU0yTklocVh3?=
 =?utf-8?B?K2RQaXlUYUxpYlpINVdoUjNEaW9HQ3lIblZablE0anhnQWVXQjlaTGVpZEEy?=
 =?utf-8?B?TkNvWG1pYUNKamd3TllrclpJY2R2NUJ3T2M2bGlud3dSNkdhVEpkcXFhWnQw?=
 =?utf-8?B?dFVyaFRsTHJUNHpMaUh1a1l1RkJvVjZEako0bGRCK0d5NGV1V25TNmtkWUd3?=
 =?utf-8?B?N3phcTFCMUlPZFhSYjR1Q00wRXR2bTJRY2Z3UmlWL3FvT0F1cjQxaXNvSk0v?=
 =?utf-8?B?VnlLc1RrdVBkZTVHUDBIK1dCdEJObkZXTEs1dXNmOXRITzVkeVZRMzd6Vkxk?=
 =?utf-8?B?N2pyMzdmTWpFRDBZMS8vb1h0MGprL01DWVBCTXJSWUdDVkczczZHZnI3Tkt4?=
 =?utf-8?B?OHBKcG9FSnMwR29KVnZYa0Z3Ri9nTEd0S3diTXcxOWJiN2xoSDd6MnJGeUN1?=
 =?utf-8?B?TkVwc00vb0xvRklDTzB0SnlwTjNlNUNvcXdvdUtDNGd4SncwWWo0NXdrYnhk?=
 =?utf-8?B?VUpvL2thV2VkOW5qcm4vb25xd2c0ZnY2T3dLNlNReTR6alE5ZmJlaVo3OTFC?=
 =?utf-8?B?TGZsYXJKeFBNMlNiWEh1QVVYN2hZL01ndDVvVWRPQU5FUzdFTmRjbmVnYkVG?=
 =?utf-8?B?SUR1THFkTzdhZ2IyNzFxVzQrWW1MWVFOMGF0aXZBeWhkYVdDTm83b09hNHh6?=
 =?utf-8?B?T3FJUEgwdXB1RkNLUkc1dDkrVkNPQm9TWmFtbzFRN0h4TkJ6S3JNODNJWHNw?=
 =?utf-8?B?NW02ZEQvMHJZTEc0UEZPU0dSV3VXV3hWdldWQ0JFcGsvdFVzZ281SG9Yc1VR?=
 =?utf-8?B?MHlJeWcyYTNDV25JYzZCRGN1OElIMXMydDZvcytvaUsrclNIQUxQeHJQT1lF?=
 =?utf-8?B?cndUSVlPSmhCWmNoNGpmRnVHWUxSWlFmRjdOeXpyK1VzZWhvZVdndDN1ZVFq?=
 =?utf-8?B?S3JTWjhiSjlkOGxWRUkvNzNRVXdLcU41NUhRaXdGRlA2SG12YnZOZUtpNHpO?=
 =?utf-8?B?akJwUkNwcjJ1akdWWTFBZWFJc0xuUHVWQjZpNVk0Q3VlMldWZGl3cU1TazJ6?=
 =?utf-8?B?MXAwQVEyNTFKK01iaUc2bkFzT205RzNrdHlsWEZpcExzcnFFaitHQm91SWw3?=
 =?utf-8?B?eWFVT2g4dWgyaWo5clhLNVVzVE50VmdFNEZyamlueUo2a1pCTnZTaWhPenJs?=
 =?utf-8?B?WkthSEk0NUlQV01hcmJraW4xWUhyeTVVQThleFFRV1NEV3FveWVrNkNTenhm?=
 =?utf-8?B?R1k3MWJYbmkzWTFtRnpEV2ZvSS9QYmRpb1g1cm9sVmVEOWZUa3R4VUVETFdu?=
 =?utf-8?B?NUUxNFE2VXpETTlmVHJLVVM0QlRPRGtUVHZrcXBad0VtV1VpNkFlSnROT3pn?=
 =?utf-8?B?aEdLSEVidjBpMytGV01pNENaalp0YnVhQ1NiN01HaHRqZmpoT2NoNXUrSW0x?=
 =?utf-8?B?T2k0UVZXWTJTanhtTUdadCtleVg1MVJLZzdMUFkrekN1dWZkWERHd2hocnhv?=
 =?utf-8?B?YTRaSGJOWEE0RVN6RkNEMVVuSjZ6MlBBRTZPQ3F1WU5GdWtJZUovMCtwbWhl?=
 =?utf-8?B?TVMwVGtrbFk1cmJ6ZVgzdiswTThXZG5Jb3Z5aVQ0QXNoVHkwZE1XNGF4TXdG?=
 =?utf-8?B?VHU3emM2RFVzMkhsQ01IVTg3SzVPaVo5cFdOQWFjT0Nlc1U5RnB0cElyY0pa?=
 =?utf-8?B?MUYzMFJiMjFsWU1HNmR1eW15T1VZSGZ1WThsYXBtYjJjYmxkcjJYSlJqdU5K?=
 =?utf-8?B?bk9SYS9LVmQyclY3TlJhNFBXU3NTUFJzeXNWbXpEUzNZVkdZMnZaS1ROOUlT?=
 =?utf-8?B?RWFCcy9DZ0d1UVp5M0VSYzZOTjd2R2cwYXIzdDhHZmd3dGtUZlRMN0J4Z0FZ?=
 =?utf-8?B?Z0ltZEk2Sm4yTnJDQ0tGdUpTb3JUK3JKRXZETU5Sc2k5dDJlWUE1eDM3cmpJ?=
 =?utf-8?B?azVSaCswb3hJeXJLeVd4MmRvdHQrT3lEL20wRFA4ZXk0WTJSckZJbU9QMTdm?=
 =?utf-8?B?MXhpM0VrOHBlcmlDaWZGeGZzVUVtUHdYUlV6b0pzNzI4TjdtZHNORExwSW4z?=
 =?utf-8?Q?PBvfsY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGY2WVFFMDJsTlRlOG5JTGpzK1MrcmVNVEVuNEt2QmJucGR4c0lJWTRHZWU2?=
 =?utf-8?B?bURzNzJEdS9yeHRWVDJkT1JCNFVNQlk1RzRJYW05VFZIMnA4c0hmaXBjZXls?=
 =?utf-8?B?VmNQVUF3R21BWHczL3lkUm5TaWR3UUVkMFBOVS9tNUs5dmFodldHVXcyUW5W?=
 =?utf-8?B?TkU5eVlSdnZNVHVIRE1PL3Raa1dOVDdLT0VXRENiUU9OMGNUNllIUDF4Z3RN?=
 =?utf-8?B?V0I4RFFzRFNiVDVEOEw0Umd5QzBqeE9aV2hBbDI1MmZ2a0wraWJuUW5ZTTdx?=
 =?utf-8?B?UjhjV2Nsd09FSDI4ZFliMnZPWDBQcE1iaTJGSWxJUk53ODlhcXlCbS9KRHBm?=
 =?utf-8?B?WHcwSWpGWkNXR1dWR2JPSlhZRysyVlNCWTFBV21LUmVZdzBnMVVGRkFIT1ZK?=
 =?utf-8?B?QWh2UW5OT3Q1TnV2UHRzbzBGSU5Wd2h4bE04UEp1UkVYS205bTY2VW1vWVMz?=
 =?utf-8?B?b2ZJekxDVGV4dExldU5sTlNWMkFvY0JTN200cnJwTlJYNVNJRHkyeVNyWlF2?=
 =?utf-8?B?UHY4NWo3WXdmL0JFS2JXMjZYVTNQMEFzTXlDWGo5WHdBREpWS1IwU2hGUldI?=
 =?utf-8?B?MExaNTdhWlI0T1ZlWmxSeTlWNVJCVURXMUhHZVZiaC9meUtiQ0JEWHNVdUhI?=
 =?utf-8?B?OXFHRERrdnJXY1hONnBEdUR3YlBzYUhoZVRDQXdsMkljR1V6QTgzWUFRWXhi?=
 =?utf-8?B?ZmpveldOR0FaQXNBS0RoZDdvdDY3UW9kQTY5UmxDemd1SFBQa0IwVUN0VFlu?=
 =?utf-8?B?bmx5WWphN0JITjZwZThoMDZsd2tCNlNnYnZTcU9ZT0lzeUtib015NmFOQnZm?=
 =?utf-8?B?WGpZOTNwdHBncTJIWmFxSzZOcnlxcUw3TVN4N2dsY2NUNnNJTGM5QWJpenhG?=
 =?utf-8?B?bzg4Ujg0UUVGSHRtSWI0SVprc1FqNTQrOS9mVTN4dVNhR29pbGV4YlJ4Q3dq?=
 =?utf-8?B?aUxkbXNmM0tGY1h2YXJ2NGNseVZFdmlPd1BPVzN0OTBwTXpQYnZBcCtJK0V6?=
 =?utf-8?B?c3ljQWxnTU5TT1VHSXdkc3pHNHBNS1RkTVJtbWZybDE0Zmo2eWJ1bWFOOFFh?=
 =?utf-8?B?dlUzS0UwY095S0QzYTNSNmlYN2QrRDFTcEM4SHh0ZWpueWpQakJLTCtGYnQ3?=
 =?utf-8?B?UjdqSmVSbHdzYUJCTC8wM2lXZTNIcm5iT1FMVmRHazNYTDlkOWVvblR1MEx1?=
 =?utf-8?B?R3ZURnJtK3NpSlVTY1psclArUGZBdW0vOThDeWRDRUVhaHR6VFUrbDV1WWc5?=
 =?utf-8?B?LzdualBTeWtVYVNjOFNJcmpucXk1ZmZoQk1kLzc3TW1jR1hudklxUjV2UXR4?=
 =?utf-8?B?dmNTSnJjRGtlUndIS1FPL1RubU5Xai9IcitiTXFmUi9EOUVzZHdUV1NUd0ds?=
 =?utf-8?B?OGRGSWpWcHd1ME9nbm1OWi82NjZONnhiWEVLREROVVZqUk9zWG90a0RUdjA2?=
 =?utf-8?B?ZDNPdk5ZUG9XTlBmZmtQMXhpL2pINzF3NmwzeFRWK0VWTWp6L0xYMTZxdGVV?=
 =?utf-8?B?bE1OTmYrblpMeGNleXhJRk92bU54OTFpN1FybWhNalRhbU1GVFdvL1JDUnVw?=
 =?utf-8?B?MXdRUkVYN2txOTV3R3RZVFRsZzYzTW50VW1MU3k3bjA3dmFGRDgyaWpJVUdT?=
 =?utf-8?B?VytWVEVnS0szeVQ2N2ptUUZGT1J1aWd6aXEzTXBNOS9MOUM5RVdZOVZJT2xT?=
 =?utf-8?B?cCtheXdLMDFUcG44UkxiVmhEMjVZT3U1U1dPTnlPS0ZvclhpQXRSU2dHWDA5?=
 =?utf-8?B?c21rNSt4YWVwOUh6RVVmUVV1TDVTQlVRMXBFRTh2cTVMZzgzbUF4STM3MFpv?=
 =?utf-8?B?NXNQbVZZVXhpb2FSbWM2em42OUpUWDJCV2dIcHlhSHlmazdaYnkxUnVBU2xN?=
 =?utf-8?B?ejFIZkxNaU1TZmZBMUVaTVZScGl3TlFWSXRKZkRUSTU5bnY3S2hseVl6YnQv?=
 =?utf-8?B?czN2OXpObEtYVUUxQ3dwOUovUEp5MTI3aFpuY2xYMm5Halo3VFYzSVRQdlpp?=
 =?utf-8?B?UXFlamZQajJ0aWZHUTdBN0UyS1V1RXg5T3J5dEYwYm10MXlsbkVZUUpsU25O?=
 =?utf-8?B?WkRBM01UY013SC91VTRIVWFIbXRUSUxiODF6YTBFQW1SMjNZNXZVTjljeGRS?=
 =?utf-8?Q?OurREFkzT5/QJCfdYU9fjCtdI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f385cc9-0d32-4efa-8a04-08de07f80913
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:25:02.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhinziWHRE0db8oD1N4Sv3fjKR3E0lt65rpOz8bTo9plNhSExncAEulmom9AVZ8hjgZxiQmc6cUt/99tZ3ECLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535

Per Documentation/process/coding-style.rst rule 17 regarding the use of
bool types:
If a structure has many true/false values, consider consolidating them into
a bitfield with 1-bit members, or using an appropriate fixed-width type
such as u8.

This commit replaces multiple bool members in struct rproc with 1-bit
bitfields and groups them together. This change reduces the overall size of
struct rproc from 0x4d8 to 0x4c8 on ARM64.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/linux/remoteproc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2a4e80ccafbe632436c4dfb636a1e..d8468a96edfbd82f4011881c10f59bf7c12e9c1a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -528,21 +528,21 @@ enum rproc_features {
  * @index: index of this rproc device
  * @crash_handler: workqueue for handling a crash
  * @crash_cnt: crash counter
- * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
  * @table_ptr: pointer to the resource table in effect
  * @clean_table: copy of the resource table without modifications.  Used
  *		 when a remote processor is attached or detached from the core
  * @cached_table: copy of the resource table
  * @table_sz: size of @cached_table
- * @has_iommu: flag to indicate if remote processor is behind an MMU
- * @auto_boot: flag to indicate if remote processor should be auto-started
- * @sysfs_read_only: flag to make remoteproc sysfs files read only
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @elf_class: firmware ELF class
  * @elf_machine: firmware ELF machine
  * @cdev: character device of the rproc
+ * @recovery_disabled: flag that state if recovery was disabled
+ * @has_iommu: flag to indicate if remote processor is behind an MMU
+ * @auto_boot: flag to indicate if remote processor should be auto-started
+ * @sysfs_read_only: flag to make remoteproc sysfs files read only
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  * @features: indicate remoteproc features
  */
@@ -570,21 +570,21 @@ struct rproc {
 	int index;
 	struct work_struct crash_handler;
 	unsigned int crash_cnt;
-	bool recovery_disabled;
 	int max_notifyid;
 	struct resource_table *table_ptr;
 	struct resource_table *clean_table;
 	struct resource_table *cached_table;
 	size_t table_sz;
-	bool has_iommu;
-	bool auto_boot;
-	bool sysfs_read_only;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
 	u16 elf_machine;
 	struct cdev cdev;
-	bool cdev_put_on_release;
+	bool recovery_disabled :1;
+	bool has_iommu :1;
+	bool auto_boot :1;
+	bool sysfs_read_only :1;
+	bool cdev_put_on_release :1;
 	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
 };
 

-- 
2.37.1

