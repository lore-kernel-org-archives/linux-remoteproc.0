Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5510304BCD;
	Thu, 18 Sep 2025 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196312; cv=fail; b=J2L/700sVZ1Utw1j2fBvhptb/NYiOSOeEVko2P5dHcPyfpC2orG3iQvA5it9F/y/oYJOgKeH1SX/cYpiAqzFkpeVe4BwM6fOEyT6x9gkOqyE7j01nikU7E/qBTl3PCmvdB9GiIMYeGhXW82bSwVRK95YvRaPwvLHpgEISEhpqF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196312; c=relaxed/simple;
	bh=sfOgmETkmyP4v2xe8QZK6PC/G3jyDsynTksvtC9253c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u9G5eY873r3Jc+Gz+S8jD8EG99c3QHXsjEqyIr3t0Q89yCpaWDBWbBg6wus/m54sOOcYEw/i3u86KhhoUb2trHmPZ2+fyi8rqgoj7pKhawNhzbo3gLNRsF1XvTajmN7Qmsb6g/Vc610/uplXbJshkVcY7vTk3NEG+RnWH2jmIys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O2MNeH6j; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O2MNeH6j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb51DL2SxydB1SMD28QtLVVLp44dKpbFIDx/d33wd8qj5mKtiE8dhmoNXUCQTPMU4qObaF42vaa9h4Pn5CTmJObil2MNoLjMnO5AjcSVZ2KW0PKCEXHUWcB8vBPdnuBf9/SoCXq8DpS2oNzwVzqfPAao15ZXMw86p7blprmBJSLMHa9ixjDO1IzkqW5EHgGtIwB5N8EfiLzxIZF8FBhf77mLzur0Wudjs8p/vvjwKQ/MECQTn0wD7J+wb18rFbD7wSvlddpw3OpoO9WJQCJCN4tVioErG0SgNsNwmxrKa9h9si6Ng/7Fm3BPbgVXxdqxWjysSmsu5VQ1k3pQawAbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZR9b/Mr6tzjCzJ5KFNw3AfyRg+8dSeXyrh8XQKysFsE=;
 b=xNHTuZq4uIhCPcLhMyN2PlnVqEXAKzQiaeJpDVnadrc42jF3ey9kKxxI/Sxf1Xjj/Vg8Is54ogNtujMW7S/GM0SGlnhXyL3yegbfg0kENFwYS+bsFHbezlMs3bqFDD+fu4A6ZRlbBcz7DhV/rx95BTKDHuu1g5NLe30C3eKU9uXNgEEm2/8ypT9wIs9WKqXcm3+tE7QgvtG5DwoCsafls+kB83QtyHn5xPGpaj+C+3xCuthBMEhI779L09Hiu3+vxpYr+6+TtvywSNQxjNJW1kZ0hkUmEuSDVkjLPuLUXLPyk2bzT+52/Xaru/wkNy0YlAZkf8HP7yx60mmwEwhIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR9b/Mr6tzjCzJ5KFNw3AfyRg+8dSeXyrh8XQKysFsE=;
 b=O2MNeH6jcfCSTLmn9vwaYHU1v4g9Os1Zt8EKj7zrjwyIOlq8XYNbMJ7kmNZ2fk02e+qqFJF2e8AarBHVuFqhwX5/z7j6eeKaifeDWZbyrKUPvTHZ3Vj0kvlfzL0nF3IdlqD1rZCM9fq81o+/kLoxLLNvf0pIFlWjTmj4B1B4YMwD7l9rBl/f0Mu7ihmEnFbfnXZ1p2X1xemVn808FVJByNaC3noUfSProXhA2lgu/0CENb7+epHPcgpbVkEfZ6lnTnHeBO7CTK2cu+2rUNeCpooz6NLJylAsrRlF9e88cfe5n9wFzrRAWDfdmG/+kSor17zYlvqfSJPnTMAPEJLiYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10450.eurprd04.prod.outlook.com (2603:10a6:150:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:51:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:51:46 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 18 Sep 2025 19:51:18 +0800
Subject: [PATCH 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758196288; l=1746;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=sfOgmETkmyP4v2xe8QZK6PC/G3jyDsynTksvtC9253c=;
 b=I4Wdr4rWN1fgiz1+rey5m/4lqLd6kt2BWJUgqyT1WGIeMtX+5w8+roaSf22JHKDtH6MK3R1BT
 JzNpfqi09kGAlkAg+LRztqxSgIiICcTZ/QPGbY5yeb989pOz16s0SRc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10450:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cdf09c-d6fa-4d71-83f4-08ddf6a9be80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWJ6WlhRVGI5cG43NDJVQ25XdTUyOWtleVdrWGVtc0pkZ2lsVW0zaGk5d01B?=
 =?utf-8?B?OW5ySXUyUFNkdkNQTndjb05kaVhIN1RZWHlOeFVqSEpJQzJ3OFZFdXQ5ZGZL?=
 =?utf-8?B?eExSTWI3NHA2TkEyM0U1T2pMZDVoelkzbTVkOTMzYWdCRkhsV1Bzd01MVElh?=
 =?utf-8?B?TkVlOHUxZlcyN3lHK0F2c2pWdTNFMi82VnEzN0liemQ0TGEreFNjUUdnSzdK?=
 =?utf-8?B?QWZqcTlnd0RHajlFVHhrTDhCdWFUdHk3VzhXU2tnaDhpTWV3TlhucmZlU25q?=
 =?utf-8?B?cmkyOVFnK1d5U2NQVzBlMDZaaXhUdW16L25EcnJOSGM3cmNhS2FSdkRFWkgr?=
 =?utf-8?B?TlNILzZxbEU1WG0yYlpyOHFybU1Md1NwK2RCVmw5MW9HTFFIQWRXblB6NjN0?=
 =?utf-8?B?OVpSSndVc1dwK0ZQTUJsYjRQZ0k5U1Z5RjczRTRxNkhyQlQ1dVdlV0dHeElo?=
 =?utf-8?B?YVZBZGFaVlhGZTVnR3pUZENsdTNheU9CZzQ4OXpmdkxkZTBDTEo4UGxuRGxs?=
 =?utf-8?B?QkpHR05DdFhnS3pEUkU5R2o0Q1ZIVGlwcVJoOXlrU0dKR0dlTDlmaDBRQjFK?=
 =?utf-8?B?S0Rrdi9aMmVsbmVTTThDNWhIQy9nUzZJVlY5Zm5hd0NrRzRnOS9kdGZrVXVM?=
 =?utf-8?B?NlVtNkJTYkhpc2VIdGtUUkZjMWhrNDN1N01oeXV1RnB1QVNGekRaa0ZjOWQ4?=
 =?utf-8?B?NkNQZG5jOHlHMmREZUREQlRMMjRlUXphZk9jaFZ0YWFHM0xFMFkvTU1OWm9v?=
 =?utf-8?B?T1YwbGN0NVVsVlIyUm80b1VUeW5FSFFWdjFaaE4zRzNtc0l6UW51QURqajdp?=
 =?utf-8?B?ekh3VnZjcy9aeTEzbW5CbmErSnN6S0JkM3RONUhyZENpTGwrUUFFSmJjeU5m?=
 =?utf-8?B?QUNTZWtma1pvK3lqZzJGOENXQ2kwWWlNT01pcjAxcng5KzdxZXRRRldsRFNz?=
 =?utf-8?B?TVZyck5XZ0UrcGVxZjBJUzNla1JYbXk1TU1iaWtxZmlWQk9xMWplUlVjN2VG?=
 =?utf-8?B?K05rSkQvUDkveUxUeEQyMFNZbWxwMnc5Tjk2OU92V1pZeDFybjZ3ZDRHN0hV?=
 =?utf-8?B?T0xpL3ZZVGhYdURON2JjcVV0akhNeDNjcU1rcnp0bS81b1JpendZdDhxdEhV?=
 =?utf-8?B?TXlOdm1NMG1zeDdwNWRtNHo5OVZQLzBEMlFKa3R3WTNtaXhvY3ZkRm05c21O?=
 =?utf-8?B?aGdwcDlZWWM0aUxPYUU0TjkzeTRWMmVzKzhNSmlPSjVyaFRWbndwS09odWZv?=
 =?utf-8?B?T0g4OHFybEl4MmR1WHFKaEpoUFFnY3hWMHhSTWhaSmZ2TGcwVjFuOFNFTjBE?=
 =?utf-8?B?NW9BZEJ5U0I4Yml1b3VuZHExLzlnK1BsNzAzRW1QcllsUHBjUW5LZ2lkVjZJ?=
 =?utf-8?B?VWhDWGc5Tnl3dUZTU0V5NFdmV3VJOVVmUGRZcVdqTEtZMnZob2pKWnFZQVgz?=
 =?utf-8?B?OWNETTZ3ZFc2US9zM05kYTJTdGg0U28yQ2FOQzlmZlBCWHJwRk1NcGdsWktt?=
 =?utf-8?B?MG1ncjlPZnBWNnFhNS9wUjhtYU1WT0VmV0JYb2tPMWFqc3k3NWFaaDVqeGR4?=
 =?utf-8?B?aG9JTndKWXY3bmpPYStFcDl3K3piOUNQT3ZidXhFYkV4R2oxenVhTTdQTVlK?=
 =?utf-8?B?ZlBYeUJMRGxCVVZzeGNuZG9BN1AwK1ZncElOZzJ2a0ZnK05HdDlEWTNCdWFG?=
 =?utf-8?B?cXROYlBLMjlCZTRTN3VaTzBrM0Y3bENaYmJMcGJNUG5FZk01ZnlNOHBnTVcx?=
 =?utf-8?B?bHV2ZHBucnpYL005UHBERFRGVW4vbmQrS0plZ3ZJM1l1UlYzZzVzZS9NSWNB?=
 =?utf-8?B?QTA2Uk9vWnBzMGZKOTkySmJhdDN0bzVpN05pR3AyOVdtYjFnVis1bHQ2WFVS?=
 =?utf-8?B?T1NMUmV6bnNNNC9lOXUzV3FsYUlkamN0eFdCVzV4WmtrUXNOaWxXd1lSSmti?=
 =?utf-8?B?MTlNdFFoMUFXUHdZaG83T1N3OFVJNUt3UGNnOHo1MzVzVUxKMEJMbjlvejdT?=
 =?utf-8?B?OGlyQ1Nlc0xRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGx5emNPaXNwdkpKdUxGcUtmZTNSbkRaTHBra2RiZXM0cGxmOFFTS21oL1Fz?=
 =?utf-8?B?Sm56UU4rUFNtRFdTYlllTnBPNStUQms5WDhGekFqcjJwaUkrMTBJQlJFQzFF?=
 =?utf-8?B?SnJUVUFTVnkzc1FnQjVkNTY2RlJnVFlSbGIwTVNDeFBQTUF0a2x0bEFvZE5L?=
 =?utf-8?B?Nng3eDZRMkRNcWZ1bzFXbmpRcGpkOVhudmZ0c1RDQ1FjOG90OHNVSVhpZjdO?=
 =?utf-8?B?eHpkQTRLd0IyeWN6Rm5XVSt0d0U4MXcvR1lMRVdVRkEvaFg4R2xGTjFQdktJ?=
 =?utf-8?B?MTNlZlVEQWpqVmgrYW9Zek9TSFlua2VWcE9UVDVBeFhWMEp1dGNGM2FPSXl4?=
 =?utf-8?B?YmtQUmlSQmN1d1kyYnQyMW1iMTgvN1d5ejJWUnE3SzBWOEFENTNXOTdWK0hU?=
 =?utf-8?B?WGlWbHRGUEN6Skp4US8rem5kTTNmZk05NGhLc1NuQWk3VGQ3V3FXa2FwVC9z?=
 =?utf-8?B?VTl1TUFNNUJXVlFtLzE0ZDNmZUJBbjkrTWZlUmZpWDlkMmx1aC93c3FlcWlI?=
 =?utf-8?B?eVRpS2cwd1F1UGdIMTc4RDIvcWNyd1VOSEZ3dmZvSkF3T0xaenA3RWpvWUU0?=
 =?utf-8?B?TlhHT05oRG1Qdk83MldTeEMvVDZOYUhQMjkwcXcxKy83amNxSlhOMnhXY2NR?=
 =?utf-8?B?cXhINnpBTUV2M0UvM0VQeEJVdEJSUElySUFSUk9wbFBKdVcyRU5TTUwva2o2?=
 =?utf-8?B?dHcvenhzeEl0enpRdkluYzZxTkg3TTQ3cDRtK1R3bWZPUy9Ba0NUSkhINmdQ?=
 =?utf-8?B?ZmdIVjNJbEhFRm0xZnh0alVGcFYwNExxUThscFNCVkdmRWRhU2tCZ2dwMENv?=
 =?utf-8?B?b1ROb0hwSVJVL2J0VFFKNkVwbkdQZEZqeGVFbFNaZHpmYTVqZnAyUVM0eXJT?=
 =?utf-8?B?cGc2YmI5L3dIVmtCQkdxUkI3Z0poWUdpci9ZU0JFVzNQVm5vbEVtRENIangy?=
 =?utf-8?B?bzkyWldPWnJ2UFdwTXlhT2IvWjk5KzU3cy92djB1eFo5OVpVcGdCMTRVOGtF?=
 =?utf-8?B?WTJDUUNubmdvRXladTIrejRpL3J6YnVoTmcxVFRaUy9Zc0N4SEFCTW01anZ6?=
 =?utf-8?B?dVZYUXI0aUtDVFpSVjdYNG1IRy9VUVlYVEVqeHg4ZzdWckFSVUFoZzlvNStl?=
 =?utf-8?B?RXJ1Q1lHdmxvU1VmOWVreFltRHllZWtXeU5jQ3phenQ5MjROZFZlWlFpa1B1?=
 =?utf-8?B?VnFibk5tSkpUMkp4QUU0RitxODU5QlhpTGdKOUZtSFRhRld2cTh2VWUvWk9F?=
 =?utf-8?B?TCtiZnBvUGlzMU1KeC9HOC8wcGdSRmdzWnlyalgxb0hFbjBFSm9BeWh1YzZI?=
 =?utf-8?B?bkpNYWE5VmlJeHlTK1RwZjUwWVBtbERneTR2WFlJZlMwK1RaWkpjSGFuWW1s?=
 =?utf-8?B?SlpMRHRUM2VtZXVuck9LVzFKZyswU0lDVklmMEwyOHlSSHZhYW9lQ2NtdFRh?=
 =?utf-8?B?NUdZR25HcVpNYklEYVA1dzV0L2Y2eUZINWRDM1FCbGhsYzlGMG8rRW8zZnVa?=
 =?utf-8?B?aS9HRjJCWU5XM1krR0tnbHhmQzJWM1RGZWhJZFVGMnJISjJ6cmwvQnBlc21r?=
 =?utf-8?B?dVBJcFFsM2hoMTdyY3hET1pTNTNkL3J5NVpvL2tKYnAwZ0FITDNCdEJSVit6?=
 =?utf-8?B?anZwd0l6NFIvYUpqUHhQSzRjN25yWmFWRzBBLzcxczRuL2hIb1U5Ym1xcVlG?=
 =?utf-8?B?eFBlL2xwcFpLT2NuZWZzeXFiM29UelQ2NlRjd045ekJLZlZqMUF2QitNbURQ?=
 =?utf-8?B?WDZGckxqMlNQWDhPc2JlTVdGOWFNMnRQRE9oMzYyekRRUDNyQXZMRGVJdlJr?=
 =?utf-8?B?LzViSk5PNFdSaVZnSS9SQzNqQ0xCVXBGNFVBai9tYk5wVGFLMmd0VDZFRDJP?=
 =?utf-8?B?LzBBZ2F1K1pDMTR6VEVuNUthRkRyOHBDUWJWNVh3LyttOTMvUS93dmJKaXI2?=
 =?utf-8?B?ZkFOZHhKSE9PckQ4TXZnYk9IOU4xbTN4UmgxMVB6SWI1NWUzb0ZMOTVad1Na?=
 =?utf-8?B?Uittb3kzNkZUM1R1eTV5SDZocUFmcjZTblYrdGxxbUJRSDV0Y1I2WGNUU3Ux?=
 =?utf-8?B?bGxDSThBTWc3ekordW93dVhVb2c1b2lZUzVPSytYZUM3QmVJTlhMejZweEZu?=
 =?utf-8?Q?4hvaZywdxXtu2QkYiMsyQufZQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cdf09c-d6fa-4d71-83f4-08ddf6a9be80
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:51:46.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t38Obovl7iTLqa75fHnfMA8qsJgf+rpisjZtFYU49xY3eXed8YlWEi5u2rGNpZaSq9K7U9iD+WyQnhVJgrp13g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10450

PM runtime support is safe and applicable across all i.MX platforms, not
just those using the SCU API. Remove the conditional check and enable PM
runtime unconditionally to simplify the code and ensure consistent power
management behavior.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74c958d44611b66e024180d69d71daac5a2f9e76..69b57cb4b251d9fb65a23e139a1960bf29c175ed 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1123,19 +1123,17 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
-	if (dcfg->method == IMX_RPROC_SCU_API) {
-		ret = devm_pm_runtime_enable(dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
-		ret = pm_runtime_resume_and_get(dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 
-		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
-	}
+	ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)

-- 
2.37.1

