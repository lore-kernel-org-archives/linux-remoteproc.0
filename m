Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA023BCFD;
	Thu, 10 Jul 2025 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149405; cv=fail; b=Gbc3fbk8oiwnmbhavPVYNc8hI6GrlPqE6mNSf24AM+DybGFSvxIKI6hclkwXcgbRD0BOrApD48Dy/jWZrdgUfjJ6quNygK8AQu4MpfaJK1r/zaJvo85agEkc5CbE5sEnnElEc1eYPdYsOUZxgdRx0/xNDxFdKPz1e5DHyqjI7Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149405; c=relaxed/simple;
	bh=AV3ayQxSYUqLvsZfiHPcCkMrjC5yA6aBeTlFcs0SfLA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=I8AVg+lXAwWHJOcviVaMdiIHKaYbYclGqXjHmu3oBbdogDmnsp524eyDUadNpSzPs4onu0JejXrp0YKRD+VJT9obwHJgS9sKjd22Y/Sd+sJ88qk3Bi9diu7IM5ySaGigUx21rpkL5c4D9EieIHm50W7zpzRfCR24fzfn1HQdplo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CSzuf6tc; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CSzuf6tc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wU1eBQnAl4WmkMf/KbvzfixWXuYNfVSClIPnhPAJ3oS4bXKTqVe09JckWxyLPm16FsUwpfIMZSI63TRr/3eVpXteZcMe8AqKcWETQnr4YNpjv298Vh3nx06H6iKYKZEc483hT6r/c5nglepR5tZPSIMvfTqQVDISbJI7sTaPBnuu8RMljzj1QVcWx7Wx0ZNB78QMiejZnCPq81HPUNtxDbHy1fH1/yMIZQAPPl1daJ6al/la9HB3O9+0yJQM7P3H97fCNWMIZHiHgV5Su157Py6ahetVqohnfJS8xFGxaveD8teFBeT91F83PFjo/5BAC4BUKZpE6XS83jY3d4ZPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4yjRrGCsTXRUEDPiyGLIYzCrOPRJ/twtp/vFWH7H20=;
 b=h3/lCqAAc6+8xMzzrGeztecrjKF02EQX59joJlwhVJuEO1nNFF5LUl7UXx9u0zHLA4Zt8aqEOs3sG+6cW5w/OHu2+qh6n3HUHMlD+A8KnAaOEnGiFKQ3GtPDsJvCURjYZLqbz01DhCylnDyKPa22TCypYHxUPbTVc5JUGRC7NcrJHOelNe8OMVnvgqVoMv3bKzeVBeQyDDV6rxWr3tu60QmGHJTgrUxxDsWkN3hAJEYxHgR8aCb1N/zPHxBGbfwKQy7WDzCBC6lVWvJgwWDulJsKqr6/e3+DWLI3TuP/5sPaabN56RF14vWOzbHBuEvhqsZ8TtKQWd3Gm/JfKqCr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4yjRrGCsTXRUEDPiyGLIYzCrOPRJ/twtp/vFWH7H20=;
 b=CSzuf6tciZ48qumJnBPjHQPYcjmGkuMrSkGEVSW1NaU7p479ZP/EDkL3y/wsSqflx219jUXPbgsb9mDHiOKLWPvAW5p9N31ImYQCpk/lLZqNhtLATK/CR657tt7x6tNySxro0yQuayaDsk1Kf1LcmIliBfSPhNvQkQ87daXhO0bIViNoNUCmdIPXKDq7iGSgYnaHrwQZCgjlTV87myBo/I+EvhQGFa+m96CosX75RICJt8FcCzoQDLU8LfXywj5QK6qZ3X5CRvbBRlb3fUuz4HGU8umgA48/tOo9KW5jfPxTGa5JZAva2eVcbcr4+C66Gx94d2YUF0c95t15Ug/Vgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 12:09:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:09:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Date: Thu, 10 Jul 2025 20:08:00 +0800
Message-Id: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCtb2gC/23Nyw6CMBCF4VchXVvTTjvFuvI9jAt60y4EUgzBG
 N7dglHxsjyTfP/cSOdT9B3ZFjeSfB+72NR5yFVB7Kmqj55GlzcBBsgQkMbzoJGmNjWWcgrMmFI
 6ZzdVINm0yYc4zL39Ie9T7C5Nus75nk/XR0kx+VXqOWW0Uh4DcigFt7t6aNe2OZOp08PSqm8Lk
 wXjlJRiY7z+tGJh4eevyFYaZQNnJfLSveyqeBr8Z5TWTPCAGtTbHMZxvANO5OjaVAEAAA==
X-Change-ID: 20250525-imx95-rproc-1-20bb74ddc8af
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752149291; l=3619;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=AV3ayQxSYUqLvsZfiHPcCkMrjC5yA6aBeTlFcs0SfLA=;
 b=gIlsuxag7hz72hj1o50xxkHquE4PGYggRGsoI7nOz/2accy1prHjRQXewUKjNe79RN/DvSz3h
 mA71MnJQ1oiCqSGaJL/AF7+y2KBP/BS9QE3Sb/qM6Zx4FP8C6KYRFYn
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c01d41-d785-4052-4b5d-08ddbfaab11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGFldW4vVzZMWjM2RWV0TTdOdGRIVHBPOTFUbko2WXlXWjBnOXBXdWROY2hZ?=
 =?utf-8?B?NThSM2hxbzhPc3V1K293UFNuVWdjMHVSa1pEMUZVY0FYLzZjNUFveTRBYUpF?=
 =?utf-8?B?M25VdjZ5YXdINzBvdjdPWlNDZTIvOVBWTE5TNHByM2NydXQrMG9waWYyMEc4?=
 =?utf-8?B?ZHJMR2RPRXY2d1A5ZndkY3AxQ1creFBlR1luSWllVlBObVFkTFVGU0h5emhh?=
 =?utf-8?B?bXBJVHd3b3ZyQzFxR3RqYzlLWTdtdjVFN1h3ZEtXTFhZNk0zbzZadEN3bWgz?=
 =?utf-8?B?MlJiUEZWUW01QjUyaVkwWWlIUnRGVDhTYllONXg1VytwanRLYVpxalJLeVV2?=
 =?utf-8?B?R3RnK0hoQU9iVTkzeDcrVUhUVVhEbENzTlo2M1REcUFYTFR6dnEyMTUxUmZh?=
 =?utf-8?B?czFJZW1ieDh4UnpYZjcrWDFsRGxRQXc2NEJZNGxRSUJGWFBpTU9EMnlkMjJs?=
 =?utf-8?B?bkNyTFFpUjBRcE9VcWwzd1djazNHVnlzcVNkdnVucnFVb25OV3g2M2RsS1pJ?=
 =?utf-8?B?TVhKUUN3Q1d1cHRLbjluQ2dDdklVTWk5NWtMMzhrOHJoaGV1ZzZLd25GQUh4?=
 =?utf-8?B?NVo1cjBoOHExMERWN2VQeE5FUmtBNityUCtlWURvVmI2RWpQNkFhTXZNQTJ3?=
 =?utf-8?B?YlFFZjN0SnRkUUFZSzVmQ2RMU1JiRWg3aHdCZElGbzdCY2w4c0pRdHlsclNw?=
 =?utf-8?B?MHpUOEVBV1VnbHJPWlpDT0dieGNFUmljb0lOYmhEdUttVytzL21iMkJHRDA0?=
 =?utf-8?B?NVl1OEV5WFFlYUo0dituV3JiK0gwVjBJazBoQTVjOTJHUFhJcGRrWFFxSHc1?=
 =?utf-8?B?QWZxUVNlNm1udUQzVjRWeWVCNzVKRlZaK0lIaEJtS3JPQ2ZGdGhZSUoyTndm?=
 =?utf-8?B?dDc0R2tpa0ZzNTFtZk5zd0ZGQmxCYlNXZVNndys5dEYwaGpYeld3WjBJNGdO?=
 =?utf-8?B?KzMzZU5ZQk9kRXorSk9PWnZqdVNiM3JLTEZaNU9zeGJWYlNYbFhoNlplZnpv?=
 =?utf-8?B?SE14RjdlQjdOU1ZzQVQ3QUtMVzlrTGg1Nk5NRUljMXFKaVZEUHI5QUloZnZt?=
 =?utf-8?B?b0lxWU9kVkN4TW1HSzZFVVB5QXQwVDZLL3E2RzRPdnFOMzRmWmsraUFFc2g0?=
 =?utf-8?B?bnRjb0RucHhJY2xheXJYWFFINHhJa3VlQXFvRmFFcnNSZ2tZZGFCYWZPKzB6?=
 =?utf-8?B?YkpnRTVud1hvOXI1VkhZR3NRQkZIbXZPc3VrcmVIYldCb0pDcEIxdTFocjNV?=
 =?utf-8?B?MEM0Ym42YXZtNldYU003Smx1UzlzNElsL2FkM3ZMUkNBcUNxVlJoNTVXOGdF?=
 =?utf-8?B?Sk5DWjAzWi9ZaGo1akZwOXUzWVNVVVFuRktoUlN0a0xpOHo2K05Vekk4U0Zz?=
 =?utf-8?B?VU84UnN3dFRLTFVoeFptQmY1UkpXYlBSa1JQTU4yWWVISEk1ZWFnN0lEU3Zl?=
 =?utf-8?B?Vkhob1FWTVZQa1Q1UkFBakFybm15MlFwZnI5bXh0MXNtRzk0NmQ4V0VaTTNp?=
 =?utf-8?B?UUcvck1NSWdWOUxhZktacGhSSnBXSzVMV3l0STlhcTRPNC90SzNrK3JiMUZp?=
 =?utf-8?B?S0JPa0MwWnBJcWVUNmMxeDVTRjlqWmNOZjd4dkIyb2lSWmh0Y1c1MmNUQmR1?=
 =?utf-8?B?SHV4TFNGWWx2c1FJcm1sa3VrcEd5eFppV1JueVlaZHJTTE1RR25EODNKVWRk?=
 =?utf-8?B?UWhOZWMrZFBBK3AvZ1AvS3M2aktXV29VVUtxcFp6TkZacFJjWXBEcXBzRnZG?=
 =?utf-8?B?dFJqTFAyR0hUSC9nT1MycmduL2dnRmdBS2F4aDJnYWpiSERUL0gxTW8rNDZq?=
 =?utf-8?B?NVNsYkd5VEppOXBnZmxMWUloN2ZpeExMZXBlZ2F4cmc0TDQ5ZHJGeFJ2RXhP?=
 =?utf-8?B?Sk44cW9nTy9GeGFtRE5aSmQxa2pkOU0xbVVEMmIyQzQrOU1nUCtJOUI5dS93?=
 =?utf-8?B?N1VHN2dNRGErU3JlSFE3WFIvalpWV0ZFNUVmaEg5aEFrcW9sZDM0UCs1VWhM?=
 =?utf-8?B?UHd5UFRBdTZDdkZ6eVhLdVB3KzVwZytvWTNRSXF2UzF4MDdVWVdEdFpRUmVX?=
 =?utf-8?Q?NM8iFs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0czMTBPR3g0aFBxcy9MOEJuMDR6U0pVUE9CeHAzbmg2K0o3d2hLS1RFNU5D?=
 =?utf-8?B?SklVdnVLMlR3cy9hZWhUOVBqUllraEhNS0lwMmRiZi9xekUzZ0gzVFJWTk5t?=
 =?utf-8?B?a2oycmlTQnVkQzRsWXo5WWhwS3ZERU1oVm1IeWxaSEkwN3BoTG1VRWVIVFpp?=
 =?utf-8?B?SlZBaGhqZWE2LzVLdm9NZDgzMXhmTkFUNlBaNVNmTnlxRjFVdlFTMmdyK0c0?=
 =?utf-8?B?YnVobW1hckV1Tzl4NzYraXdFS0QxZlZERzFrYnBXcEc5RVJNMExjQ1dCaWo2?=
 =?utf-8?B?ait5UWNjTXBzM1cxK09VQVZhenJUSnNQeTZzSDYwaU5USlljMTdPWGNCbDkw?=
 =?utf-8?B?U2dNUWxwZmRGdzBZWk53ZG13bVduMWI1RzlMZ2ZMRmNDZGMrUU9qbDMwZUJu?=
 =?utf-8?B?b0M2dFB6QVFVNTVlRVZ5V2U0eG1ZcGpxYmNsZE02b3ExRGMzVjV1R3d0ZVFN?=
 =?utf-8?B?OUVvbXBFNXFzcUVkNHppMHN6S0hJemtGS1pWUkNLRFVGK0Zqa01Qd3QvejBl?=
 =?utf-8?B?bzdCOExMa0VDY3FZbnExSERrWWptUlBtOHYzMHF2dkZLdVl5R1JWUEhvQjFy?=
 =?utf-8?B?Qm5aSGJUandnTFJVRldYUytLSXdkRzJjU0lQZzlBbGtZN2lBUWdQM1hWQnI2?=
 =?utf-8?B?Sm5lU2lQdzdrd1VKbFhlRDBFS0dQcCtpR2VseElzSFZ2VFA2dXJQWUd4dGh4?=
 =?utf-8?B?TW5Qbk5aK3ZxYVYvWTNtblhuSno1N3hLbHVndWY4dDQ0Zk5MQ0k0VGt3azc3?=
 =?utf-8?B?RmxZMXc5cE0xTDhhNCsrNUJUTzg5aEVyNG42OGdMbVF2cXowZDFDd0FhMFhB?=
 =?utf-8?B?QjJGZTlGK05OYmd6YS9YMS90VktrY1lidU5EVDZsei8wTDNoSkRZbE84K3dn?=
 =?utf-8?B?QW54L0drZ0ExYkdSZStFV0tsd1QwcExPdXpSUHFyY0REdDRkMVJPZEViU0M2?=
 =?utf-8?B?N1dpZDk5U0ptSldJclFWM094aTNtaUxneHNKUnJxaHRaZU5KZEwvUURiYlNm?=
 =?utf-8?B?UVhlZmFBWENPc0lZWUU3SHJJeW0zcGtWRmtuWGVPcElGNEl4QXY0anhKWGVl?=
 =?utf-8?B?STdQaXUxOSs2R010WWp2dEpjTmM0b1VJTXN3b1l1Y25jQy9vbzBva1ZJVXV4?=
 =?utf-8?B?VmxURVVhZlpnYzZhbHFreVlzUkU4TjNCK1ZiT3V6T0tlR0tDZnJDR3VaSExo?=
 =?utf-8?B?L1NMWXVXWWxjY1VQbHlRRnlpNjYrMHFkLzZBbzI3VUpRVmdJZ09VUGZxdGpm?=
 =?utf-8?B?N3MwdUNmcXc4NlVweVkrbkhyU2dlWDN3b0ZnaVlrWTNhVG5sRWhOZFRtRDlq?=
 =?utf-8?B?U3NXR1RCTkt2TkF5UExHQVUxNGhxT1JVekJsaFEvQkxKZHRNOFZmRDcyMldi?=
 =?utf-8?B?S3RrdU5yeWdVV0VjdUNZU05MZkFhOVFYWFRhR0NSeXY1dCtLb2ZkSHZaNEMy?=
 =?utf-8?B?M1JxaXRub0YzbndMT0pvV2NESEJUT1pEVEozZW0rYzNWdnhWb3gzd2taK3J6?=
 =?utf-8?B?UzBpQUpSSEE0cDFKOTYvaldiMDlnMFU2aThLVWVlUkVocmJMZDZFakNOV1ls?=
 =?utf-8?B?VVU2MlhNcmpVY2l0bG5JcWFWaE56UGRNRFF3YlVkMXg2TjBwamd3M2ptQmNq?=
 =?utf-8?B?MHNZNDVqUkVqZWJPdFBpT0xVNHNiUDg1cmxjempiRFBxMU9vS0I3Yy9TZXQy?=
 =?utf-8?B?TmNuWjYxZUVkbDNMbzVHUXNDYjdCa0UrdWpmMHJ4WURTVGlZOHg5UjB4WFRR?=
 =?utf-8?B?MmtrN1dnTFVIdXJVUDlXaGY2ZGhUR0g4UVg5VUpJdmpSaW9QNFJsWnZuOUFQ?=
 =?utf-8?B?WlREZUpHYVV2RzBYU1cxRXN0VlpSSlg3L3ZoYUpnUjcrKzY1amNGSjlIVUtx?=
 =?utf-8?B?V1pyOStXRzJRcE1lSkhVcS81T3ZlT2RvS3l2MWlYeUd5aE1mMlNlWEE3d1JE?=
 =?utf-8?B?SFlxWEpzNUlhU2FqUWo2Wi9UZllJODd5bWNpTnZrOFJtUG5iVnV4NGFUbDY0?=
 =?utf-8?B?R0dCT3RDcit5VkdZcDBBSFR1UXF2ZjErK2Z1S3d1YjdOR3BvUzdZbEdVL1JT?=
 =?utf-8?B?MmJiV3hBOEFUZzYzdWVzemRWRzVlNEo5SDhvYjZXLzFlSTJWMnIvakY2eEsz?=
 =?utf-8?Q?U9WVwuXvyMkOwwT/NxL8h3qSq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c01d41-d785-4052-4b5d-08ddbfaab11c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:09:59.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DgEPzBrE9DC36EBkQ7PZQI7NPDVyEA4fdl51NpV0TMps4a1iSpAOeVCG994hPdEau+S3RI22Ifh9ZWe1j/E3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
(2) M7 in a separate Logical Machine that Linux could control it using
    LMM protocol
(3) M7 runs in same Logical Machine as A55, so Linux could control it
    using CPU protocol

In patch 2, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Patchset was tested with below boot images when the patchset based on next-20250526:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Patchset was tested again with rebase on next-20250623
Patchset was tested again with rebase on next-20250710

Patchset is re-based on next-20250603.

Thanks for Daniel/Frank helping review the patchset before posting out to list.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Move the lmm permission check code to a separate
  function(imx_rproc_sm_lmm_prepare) in patch 3.
- Check return value of scmi_imx_cpu_started in patch 3
- Rebased to next-20250710 and tested on i.MX95-19x19-EVK
- Add R-b from Frank for patch 1-4 and A-b from Krzysztof for patch 1
- Drop mu7 from patch 5, because mu7 status was already okay.
- Link to v3: https://lore.kernel.org/r/20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com

Changes in v3:
- Drop fsl,lmm-id and fsl,cpu-id for binding in patch 1
- Add lmid and cpuid in driver patch 2.
- Add i.MX95 lmid and cpuid in patch 3
- Rebased to linux-next-6-23 and tested with this new rebased version
- Add dtsi/dts patch 4,5 to give people a view on how it is used per Krzysztof
- Daniel's R-b are still kept after talk with Daniel
- Link to v2: https://lore.kernel.org/r/20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com

Changes in v2:
- Typo fix in patch 2 commit message
- Move the m7 address mapping array from patch 2 to patch 3
- Add R-b from Daniel to patch 3
- Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com

---
Peng Fan (5):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95
      arm64: dts: imx95: Add SCMI LMM/CPU nodes
      arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev related memory regions

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  41 ++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   8 ++
 drivers/remoteproc/imx_rproc.c                     | 147 ++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |   5 +
 5 files changed, 199 insertions(+), 3 deletions(-)
---
base-commit: 78863a3617803fcc11f7f7432efc9f74d4ca3105
change-id: 20250525-imx95-rproc-1-20bb74ddc8af

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

