Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2AC1CBEA0;
	Thu, 22 Aug 2024 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334026; cv=fail; b=FWJuB7ga36Z3ZWCQv62ghIaelL+pFIvb70Eug1hKftqXBC7beJu9Ve7jOoGMMjxJVcsIAuBayMkGualki9rUZRPjbU3Dgrq+gw8mwEmFk7GFjJHHIdK3YhnyvmJj9WeMMlpOgoapxWiQhyUGkEfNAT1rLpUvtArZwEUBJ8iEyYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334026; c=relaxed/simple;
	bh=w+TPPT45cb9WV15Y7zDr9x9H68pC59Lum7yjE4ZAfys=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Wpe1dNTPsbQ5RmX4mjcFic1PSWUFLkNDKQQHdbBEiSunZA/CupIY2+FP71mDN9VNipu7KgRtxVrlAwiBo7H2tsUO1KwBwTfhDQCnUvPdJBLhp+fdplOfqzI4HNU9fyetdC0USeS2/lqXfqiVmK7fYXig6eRuqx5qlzFqu0LUUBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Frvwsf3h; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Frvwsf3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjgj4ZWc4+Fou4zaoesShcwvFRIggk8T+TdM2UKayjhPxaAWIZD3uNtH8DNsL8g/7o6Ac1zOhPhrr+rKCQEWrUcDN6rSnlCc+E8q3IIeJbyUYusOc5MIgthCc7Perwhz2mnHUH9ulUxjBPjXv4AjfiRQOLmFIxr4DX9wN/ErxYKmg/5lhqCO0F05qIGbADSJxGjmOMrHKiD+YWfj2NKf0xk3msIxbFpckkfeXilaicpcQMsWzlqF9SroEUW5y+ePX7u0rMxd6hYOmBiAR0xJGYFDLLhM+ntCZBFLnWabSjV/4MsnGrz3lYrlBZzSJ3o34LSpjcuhQz6ewVQ8wWti7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwSo8qLVHExplBhnhsSjw7wuPhKRRWPn68FrIT4/cMc=;
 b=pM24E9TLx42FzQn2wHf+8E6u3laRmYDa+eiAseIBLv0PFbWtTusbIlpBtAnnfJEYcZbkoFTLvxjFQwl5MxkGVYaFg6tYyZZOsCP2eCNl/U3LNdt+D3r8U4Y+XyLrw5b/uOtaLhyLsFQnMglCf4Cwv5IbyHZtOHg4tqo/0Tjm3sKDyuCXN5BcphCV2JrwZkyB7Y0ocW8G1ktAmIV5T94UKPw7e/qgsJjp3e+jJ+tV4Fm1m4C2TljeTsqHV0/hoGcMq/vmdjfGJdh2IA5qy6oDFo4b8UyEq654IB5KzIFLe2LyYGTpHqs1HfKySpUxVsGCWzdB6wySiModUCyMfvfuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwSo8qLVHExplBhnhsSjw7wuPhKRRWPn68FrIT4/cMc=;
 b=Frvwsf3hWHuW3DR03uVdjTfWGi4eRoX2EwOYxHdraWP9gWgU1m7bCCIvIkhV7Am69JDd2VqOxUEgerUaVFlPKoNMplr8r0wDiZNU8DY3dxzj0UwstIq5qF+m2ooB/WFfiL7mTe/SAcAiGUiKQ6s7TcfpqmgvsDeBN8eS5z9MT4FtEa80ZP8Fkjkus4W3J22UIukq4VI79WxrjzTGWumehK71i0bJOJu33g8azKX2lMZpu9uKnxzC/64c3p/WqRDciEwEVOfajGUXvZ3LR6H3skkbd2NSYi4aCToC8WPLVC2564cQFwgZxMIDzmhJd/JuW49Su+sK3VhxXLXCvngE8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:407::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 13:40:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 13:40:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Aug 2024 21:48:50 +0800
Subject: [PATCH v3 2/2] remoteproc: imx_rproc: Add support for poweroff and
 reboot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240822-imx_rproc-v3-2-6d943723945d@nxp.com>
References: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com>
In-Reply-To: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724334552; l=4226;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=HUszYL2Nyr15Mk1+3EqrILWezvor7LPShO2UpXI1BSQ=;
 b=42FEQh9UatXbDWHWlKEI6BQYTDNobEe1Nu8cnk61kVo5ufkaadnEQDc7dyh1/6/IQFquLUxCk
 rNBc2gaKHjmCgLKq5tqssvdn9PcqYGM15+yHAjisyxTLfJYgk01Om5H
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 0055b7c4-b99e-45a5-0234-08dcc2aff77e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3g1U2RpMTcyU3Vid3R2Q1BhTmVkTDVLbXJ0ZGVVZTZySjhJR1JmaDNoamQ1?=
 =?utf-8?B?NEE4MTF0NTBiczVMU2lFLzI3djhmU3ErTkk2S2xqSWtJY3M2VStURWxRYnpr?=
 =?utf-8?B?TzgzVm5aL0JwL2tOciswaXFUSTJscWRnQlJtZTNFTU1qTEk0M0JpdDZOZjRo?=
 =?utf-8?B?V1h3NjN6VWxka1Jsd0hOaUJSMTBBaTVmbUJJb2FJSHQ1aHJVQXB1QzF4dkJM?=
 =?utf-8?B?MEZPc1hEc01YbmpXYkZuREZnOEVWV2Nwam0wUGxXR1NkY2FRNUxyb0l1SE96?=
 =?utf-8?B?cHdDMGxucjVTNXJWN0R6SW9qdE9ITDdtVW1IYWFmMEIzekhVaU1heG9iVnhx?=
 =?utf-8?B?SjZtQWw5d2FFaWtaNmEwcTJyK0t5MCsrMk1aUjh0V3RZa3lRWTNxRlhpR3Rp?=
 =?utf-8?B?aTJ0eDZKREZTQm5UcGpBMit5cUtxTFF6aE5sRi9aVWk2cDlKUnNDWC9laTNn?=
 =?utf-8?B?UjNrbThHVWtERERrZDVPbEVFbGJKYVNaZ09zcmtMbElPN09tcTcrbHo0N2JQ?=
 =?utf-8?B?WXUxN05mdUcya2cwTUtNaE1WbUNmWVc4cnhpZjNZWUZMNDVrcTRmQmVhcTMv?=
 =?utf-8?B?V2Z1a1QxNzNHdnlQTkxYVUpUUzgvQ3V3dEt1c3UyaFUxSmVnUVBhaW1mVWZL?=
 =?utf-8?B?ZTBua3ovNUtyRkltdFg4NnduQXAzMit5OUpqZVJSaUJ1WHQwaTE5Qlo2K0RK?=
 =?utf-8?B?THY0K01ESzJSZm9vWktwU0l5a2lmcmhWNGRCREp4ZC9jK3MxMWl5TG1xbmZ6?=
 =?utf-8?B?a3M4ckpxK0MwbFBBWmE3UDRtOExNa1JLc0duTFN0a00vOGdOU1JXb29IN3pO?=
 =?utf-8?B?SFUzLy9WTTlvSzR6Qk9aQ0tlbm1sMGJQUjdlbEJKb3pKZllNTTl4Mmo0NlVa?=
 =?utf-8?B?cStIWUpUaTd2R2RFL3B3Szh6K0o5WTVKQmNSUjY1T0pEdWwzZ1RPdEQwQ1FY?=
 =?utf-8?B?andZa21jYU5wc2ZQSE1LTzZrMmpWVnN4b29Sa1kyeDd1ZzNBRm9XR0NCdmdR?=
 =?utf-8?B?cGxOYVdzVDQ4d0djSGFxWEQ5VytjdGY1aVgxS1lEMWh2UnVGc2l2N3lUVjVa?=
 =?utf-8?B?eGw4V2JOWGZOaWJWeFB0WFFnU1E2L3B4eC9xeER0OFN1Rzl5enl6MCtIVldm?=
 =?utf-8?B?b1h6STNxRSsrc3NGd0wxNDB3VC9oektGZHI4UnJwbFprNGZ1ZXJZSXBBUkpG?=
 =?utf-8?B?VmszYjVrUTVWK0l1d2NYZ0xBRnEvbG1Ydkc1cjFMZGVKOHRUR0xaQjh4bkVE?=
 =?utf-8?B?VnUwTjR1dFdKT3dsaE84dnpSQ05vVFlqS2UxTHJZM1ViTGdrZndHN0ZkSTFt?=
 =?utf-8?B?T2VxcDh3Y0s2SkFOcmVsczU0eGZ0eHZzTWd2SldZaWlXQ2FJbGVNM09WTFBs?=
 =?utf-8?B?amZKK1I2TXk2Sm82TXFUL1RsQlBRNHdpOTRQUHhhUjdvVTh3cVQ1eGtCV1B2?=
 =?utf-8?B?Yk9FeVZSeXU0dkdraXp1d1JOU1JFM3hGZFR6TTZzNDdpUi9hdnNFMC8wNkZ0?=
 =?utf-8?B?c1AvVXltMk1HY2hLZlRaVDBJQ2pUdzMvYTZ0OHA5dlZvVHVjOGFoWlpub05j?=
 =?utf-8?B?M2xja2s1UVFySVZvcjJYaVdZVjNKL1pMN0ZKV1cvK2RFVTJXYUxnNUF2Vjh3?=
 =?utf-8?B?aUVQd1VaTFBVWUFvRDNsK3NyNDhqUGpyYUtjQzJiSTh5R0lPVXloU2JTdUg4?=
 =?utf-8?B?Q0hPdjFEQVh6RjlMWDJ2NUFQd0RHUFJxR2JIMG1CS1J4ZWY5dUJhbUg5YXpk?=
 =?utf-8?B?UUZXb2ZJQWg4Vlc4ZzdTTkdTY3VqV0VUQ00raHRYREZLUFlWSG9MMjgxQWpZ?=
 =?utf-8?B?ajA2a2g2U1NLa3dmVmZEcXNkd3FFajZxVFZqaTJESzFBYTlyeXArT3h4TlZV?=
 =?utf-8?B?VmNJNjFRV29haG9HYlJHc0tQVEtJRkIyQ3FnZUV4M2FhSGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlU1b3FJYXBxY1I0bWZ6ZCtueWdFM3JZb05VUExTWXRTUDFTdnFiWTJ1bmxp?=
 =?utf-8?B?NUF4YnNVYXdLU2xvaGFYZjZNRjBiKzBLMUhsbTdvTjRpTzdneUFHK1dySDht?=
 =?utf-8?B?YXVjaXF5SzZDeWhuZ3F5Y3pBZWU0ZmFYWjZiYi9XZkZaTkx6S1c1MWJGOGNM?=
 =?utf-8?B?amJEd09NT0NQUU1qbHBCTmxPK3pzSnhibWorYzVKeWxhTlhjS3JuQVRTWE5r?=
 =?utf-8?B?UG5zOEpxdUhXcElET0JpVTV2cml3SHltdGNxWnJCeHY1MU5vd0szVnR1SFJi?=
 =?utf-8?B?RGlQNDJSZVZtUWhFSFo3QXZWQTVqYkp1a3pEOVJyeVk5dnFUd2ZNck5pQUNY?=
 =?utf-8?B?TUZnWnhWRXZwYVl3UllvMml3Y3VXOU56SVdMdWN6aStzdTRxWnE3dERXWGlJ?=
 =?utf-8?B?K25UUzZNZVR0bTQ3MnRqSmNxL2JhY3RZVFQ2aFpvcG1vZVpmeGg2V29tZnc5?=
 =?utf-8?B?QnNKdDN3NFhuQnlJM1dldjRlQTkwaGVZMWVKYkpjbnNNWU1qb1huZnU1RnZa?=
 =?utf-8?B?bXA4bG45cFpkV0ZhL2UyR2tLSU5oUzBaRTIrblVLcUJaZnorVk44Rks4YmtW?=
 =?utf-8?B?dm9senRtMG9FeDNaMWtoOFdZMmI3QmhMYmp2WHFYcHExWWVNTGw1YW9kbEFB?=
 =?utf-8?B?K09QK21pZlpjZTF4NEpHSlJObEVyVUxqSHNhclhxWEI4N0NTaEd2NkZpYUVm?=
 =?utf-8?B?SkJhMTloSnY2QUprQ0FaUENWczNLakUweWFiTlU2V3dQM0pIbVcreVc1ZC9s?=
 =?utf-8?B?K0JJYjRkbXpxNEVtS2xreDhJeXpzL1ZCQndjN1pJck9lWTZrdkFPYTJSa01v?=
 =?utf-8?B?MFpGN3A0VVBjUk4wbVU2YTVMTXBIMnpVWndkbjF2RitoUGtudzNjclQ3OEZk?=
 =?utf-8?B?ekFBWUVocWNwQy9GM1JrcG5kV29tWnAySzJ1a1g1a0xYQ0Nldkt6dE5xTkJ3?=
 =?utf-8?B?NkJ1RC8zWS9hRFBnV3JhUUNoS1pLaUpGNzFMM1pVTlFPUE1Na2tpZThHZ2hy?=
 =?utf-8?B?cXRtYmNwT1VsYmgrakEveVY4MVFNQ3duaXFWWEZxOVBJZDRvZXJYeWxYUWdm?=
 =?utf-8?B?SDA2ZmM4NzcwbGRzam44OHhpSDhIYzFCTWR6MzNZckJ2dzc3dmo0bHFRSmR0?=
 =?utf-8?B?bEpZWmRIcmp5Lyt1TmNrQWZBeVEwb1JYcGtpMzBOZ1NYT0FGR1ROYnJvRVh0?=
 =?utf-8?B?d1k2RU16aCtXVzluMjQzQm5kQ0J3QmNZekNhWXNRVUpLeTltYTJhM0RoSzdp?=
 =?utf-8?B?VndmSVlDYldydTIrWC9QMHg4ZTRzdEt0Y2szR2M2NkJNakt6Y0UrS1pVUkJ3?=
 =?utf-8?B?R1JmZWgxa2VhYzJ2S2ZSc2oxV2FqMkF5ZEU5OVN5aklQd2JOODRHczNaMklU?=
 =?utf-8?B?SHVLSFRPdVZuaG1ud1NlUXFRVlVNOFZ0YTJnak9OL290dUJLMHg3NEYvOVZa?=
 =?utf-8?B?ZGk1VEhpUmlTK2xDU0daOHI0cWEzTDM5RUlVckRSSU15WjdWbUUvZ3ZzQlNF?=
 =?utf-8?B?WUp5VDdBMXRoeGNmcGcvOTR4bklsL3VOc0t0N05YdFl6QWYzOWo3KzJJaUpH?=
 =?utf-8?B?MHNyZXE4eHdxSTVyYkxsaUdQR3pERTg5SVZsbzJHclJxQXV3S2pXRGl2ZzdQ?=
 =?utf-8?B?c3l4ci93QSs5blV6MlNrNGlQRDUxVm9uWDRVVHJ4WWNBQnJxdlRSNE04ZGZK?=
 =?utf-8?B?aFdtTUhMMWZ3WXJQbitUVndwcWp5YmFWYlg1Y1IxcnZuNkliODFoNklNekpn?=
 =?utf-8?B?ck04bzUxUzFETFVsZC81S3gzeG1IY1Z3U0N5b3dvcm9jM3JnUjZKVVc0ZHFj?=
 =?utf-8?B?c3QycVZOUDN3TzlkelBPajNORXZucEJDTE56Z2Y5V2ErbU1neDhyVzBVZ3Qz?=
 =?utf-8?B?QUxCOFNaUE9PTHdxSEZPNkFKNDNFLy85NWduVEx0ZW5tY2x4TkFDVDFzSmRn?=
 =?utf-8?B?Z252M0h4R2NKWnZqdGhjVXhMc0UyWEYwa3d5MjUzaDJmalRkQnNYMEhIeEhZ?=
 =?utf-8?B?TVdyNjdINGsvdEV6NVJzcVRpNDR1bEs1L0xBeTI2SzdDci9heWtsd1JEcE8v?=
 =?utf-8?B?QU9LUmVMTEFPL3pGWlRYZk5vaGh4NExhb2VUZ0gxcm4xY1pIWjhPd3NPUXg5?=
 =?utf-8?Q?38vlfz7J3zHYGjri3W/2uDcdt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0055b7c4-b99e-45a5-0234-08dcc2aff77e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:40:20.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dg/dNBUANyDjlrLLlWuVz5DPYoIsusEF05VgZcXXdBDurLx5SZ+P3p/o1uHWKCQVfFQEKKgTag+qgjHNUyLyBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449

From: Peng Fan <peng.fan@nxp.com>

On some NXP platforms (e.g i.MX7ULP) the poweroff and reboot operations
are done via a separate remote core.

Typically Linux needs to send a message to the remote core and requests
for poweroff or reboot.

By default the communication between Linux core and the remote core is
is done via a blocking mailbox mechanism but Linux doesn't allow blocking
operations in the system off (reboot, power off) handlers.

So, we need to make sure the mailbox message send operations do not block
for this specific operations. Fortunately, Linux allows us to register
handlers that are called in preparation of the system off operations.

Thus, before carrying the power off or reboot preparations, just destroy
the existing mailboxes and create them as non-blocking.

Note that power off and restart are totally different operations and are
not complementary.

We introduce a new flag in the imx remoteproc per device data which tells
us when a device needs this special setup. For now, only imx7ulp needs it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |  4 ++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 22677f581067..800015ff7ff9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/workqueue.h>
@@ -333,6 +334,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
 	.method		= IMX_RPROC_NONE,
+	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
@@ -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	return 0;
 }
 
+static int imx_rproc_sys_off_handler(struct sys_off_data *data)
+{
+	struct rproc *rproc = data->cb_data;
+	int ret;
+
+	imx_rproc_free_mbox(rproc);
+
+	ret = imx_rproc_xtr_mbox_init(rproc, false);
+	if (ret) {
+		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1104,6 +1122,30 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 
+	if (dcfg->flags & IMX_RPROC_NEED_SYSTEM_OFF) {
+		/*
+		 * setup mailbox to non-blocking mode in
+		 * [SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_MODE_RESTART_PREPARE]
+		 * phase before invoking [SYS_OFF_MODE_POWER_OFF, SYS_OFF_MODE_RESTART]
+		 * atomic chain, see kernel/reboot.c.
+		 */
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    imx_rproc_sys_off_handler, rproc);
+		if (ret) {
+			dev_err(dev, "register power off handler failure\n");
+			goto err_put_clk;
+		}
+
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    imx_rproc_sys_off_handler, rproc);
+		if (ret) {
+			dev_err(dev, "register restart handler failure\n");
+			goto err_put_clk;
+		}
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 79a1b8956d14..17a7d051c531 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -26,6 +26,9 @@ enum imx_rproc_method {
 	IMX_RPROC_SCU_API,
 };
 
+/* dcfg flags */
+#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+
 struct imx_rproc_dcfg {
 	u32				src_reg;
 	u32				src_mask;
@@ -36,6 +39,7 @@ struct imx_rproc_dcfg {
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
 	enum imx_rproc_method		method;
+	u32				flags;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

