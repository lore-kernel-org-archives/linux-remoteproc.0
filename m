Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B22FE079;
	Mon,  8 Sep 2025 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336896; cv=fail; b=J78GBCW3IftLSMgSW7bHHxCFkiyLLZEGetN1/myJ5MJ5XMLN91iSjK+QtS3kZkU5jLwQhHdkBl0RaLF+yDZ+7lC17L4czYvTfHpvS7usQwL5rJpsYwyyYr2qmn7cVHJhc0BoJyFAveewLQPrvbS5vUiRkqb/fhdYWW7HmgMUxNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336896; c=relaxed/simple;
	bh=W6LF7/jbabeACDQZKgZCtI6uCkrbReNr+2ou8NCGwco=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Tuv/FKah/pWImxVEIFSgIs8HI6YGLbrSGu9HmAUy1uz8v9MtcPlH1WM1MbmsmC5tBfuhEXz92m+upj5yx0cAH28HwFklDWLCNJv6N/oPIkZA/6w52TZrNmGVINfme72pulwmbDyjLQe/0YhMsOXRkWVryhE61zcXw+uPv13Wk2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F54aaNJ/; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F54aaNJ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdtMBbdnXqPVJAsYjZBSgIy4EfrDnw6afWDxUhPSDfwkcK9O1zGNHXxt5NwFJZxpRW1b2EySLziFFDIhtMP4rkqDurgx+F2A0DyXj5sMINuzBPOd90oXOE95IAnbDTXg1eb+2Hx0bWBAOFu+a8ZRfm/EvdtUIzJFoU8TrFSTGW8Fl+SYwUF0liJO6fmx3skj0+RlHC2xlo7VcSkG7y/8xLLq1WhUzp+UXHJTwl2WBK6YzSphFYl4JgauUdsGdvFbDP4PJwh1Ywx3uo5S52P0Ij88kHDvEqZPjykTe7exgEzpx9HmynPPG6UhwUck9TecFwW0MNS2HS/Fd8BkJV9Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRqMsG5hxJTJ8qceJZjGwoc3/QIW5eEGSdfvgWo57Bc=;
 b=Gjnjz78c/2l9Xc8JHi9L6dlu9bGkE/mNyVzZ9wlxjUPbpcWoiLEQeFPIYP258oKbZbJREd08vbYIT79LM26XouzDD96qOVmQfK5WhgATPOWTO3yBWJNQsqTGh1X/EdbRLP+Esnn3bWeHrzAq0zejI0zX9qMsTCVmFnlyX6SDxjL5NRVJPnFtJqA5DslsNwOYXKgxtztXH6Nm06l9Ni6xjsSUWh1E4u97hwCRoner/9X8wCz/Hia8oxifxD6XN0HeqnpIjJVO20ZYvBV22U+btupQK+n8CBDS+ZRO6BlgerBflLsNNsYBlvUe68NuGL2Hr29TCn5rKDpdNT22zTuKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRqMsG5hxJTJ8qceJZjGwoc3/QIW5eEGSdfvgWo57Bc=;
 b=F54aaNJ/Vpoz0O7Ude8JQkcUXO+Ur9CfkJNyJr3l2cmmAwEmWGYCR6fZ8GXPFm/vgWeaDM3G/mu3dJFb3kJJ7n7ttHxslC6Cvfvz/E1tE9KacZtjBeoeJJpD2kN7LE/eJ8aucb9wsA3/llpOi4sgpMLS62q4Lr+ZZEslh2A0CUjxfQewWuRVA/TSwpTCBwLaibRn/fUGIgqOn7pxzNY6WXgSCes49M9cnZKabsP6q+Yslg5wY94co4YF9HcDT3/p/GskrEEA4pZ0bplKS6v8sz/RKzahXi36GZS8rTzjKpo5UhpN7oEw6HgGhB6QOOkUMJWQjxMEYDCETVsDNYjJQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8918.eurprd04.prod.outlook.com (2603:10a6:10:2e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 13:08:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:08:10 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/6] remoteproc: imx_proc: Simplify driver by removing the
 switch-case
Date: Mon, 08 Sep 2025 21:07:33 +0800
Message-Id: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABXVvmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwML3czcCt2igqL8ZN3knNTEvNICXbM04yRTE7Mky7SUNCWgvoKi1LT
 MCrCZ0bG1tQB+mShJYwAAAA==
X-Change-ID: 20250908-imx-rproc-cleanup-6f3b546b9fdf
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757336884; l=1568;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=W6LF7/jbabeACDQZKgZCtI6uCkrbReNr+2ou8NCGwco=;
 b=+wKRQvfRDVlwiEDf7Y0MLh7xkCKhg6Tq5/wP8SIvzO7M3XO7h7sr5y7BbWolJqhdsZDJaYwdF
 DuwVy7v7BHWC95hzlixmSTCIef9xZ9m2OQGKFq+3A4wWaK4qxXVZHLg
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: aba3763e-c916-4c14-a1b3-08ddeed8c2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1YrYWtQeXdOOGZUanNvdm90OTlucEhDbjdsdEs3aGJIUTUrSTY4VUFaTGlj?=
 =?utf-8?B?L0cwK21NMVBoRXF5RUErbEFRTS9rQWxyVXVsR2IxWmprUVdINTI1NENrUGNB?=
 =?utf-8?B?NGxIc2Iya3BoOW5DdEFVTlA0QklWcjZvSEIvSFBZd2JmSFl4NHkwZlpqZHNZ?=
 =?utf-8?B?Y0NXaUJVbzRNM21PclJsbGdLTDNDYi9HUzF3emllOGhsUnJwSDNCOTlIQlZZ?=
 =?utf-8?B?T2xaMnZVRWI4V3cxY29HV0pVZkI1UWxMRUxqK0RoNlduZVk1aFFsWlh5M2FI?=
 =?utf-8?B?WG9nYWpJNW01UXlRbXpMZVBZOHl0NGNvRmdnNDJJY3BBZDlNbDdZM2YxYlI2?=
 =?utf-8?B?UG9nTmd0bWxIR2ROZEkzaStQMGt1Y3JsSU45dTRzVHM1YXY1Q3NJZkRJTndL?=
 =?utf-8?B?b1JhY2dMWEVXc3RNSFFFT1hhSzZmTWVZbFBOS1JwbFBmM2hlL3FYTDJyNFpw?=
 =?utf-8?B?YnRndEcrQ1FJRkRWMzZtQXJWUTVib1czT0syUlhrYTNUeW1mUFNsamlHKzRR?=
 =?utf-8?B?Yi9SZ3B0aWJiN0IrQWN6T3h0c3AvZGNWM2dpZVZ5OGJQQ1RZSGtUV0VjcEcr?=
 =?utf-8?B?UGtGV1hURmU2SlZKRTZBWlJ5SWVQMUVWck5IZSt4bUtrSTdxc21DeVZZSVR0?=
 =?utf-8?B?OHhueDhlRVVHdFp3N1RDaXEzOHdLczNPRWsrSU5GdVBVUzJHbHF4RGovemVa?=
 =?utf-8?B?dWM4ODc3b3pTbXNudi9MMlgwaGtmWnlpL3dkZmFGVGhhQWo3SUhHZ3E3ZHVt?=
 =?utf-8?B?cGZWNGtTeVNJUkVIdC92N01LZ1JWdFROTnJKbnNBR2xkaEFlb21YTkV5d2RU?=
 =?utf-8?B?eUZDQ0sreDU2dFlabXJFeStOVHViKzVlbDNqSWVyV0NiajNENlpaNTFKYWpl?=
 =?utf-8?B?bWxrQVlJa1V4ZEZkeGlwOCttR0J2UXVTaGhKVzBLdklNK1VCV2FnSEFHaVlJ?=
 =?utf-8?B?V3R4c0M0UEZzSUd0a29kMndFa0tPa2c1OUh6SkYrQ01OTGtYYWhpUUFXUXNC?=
 =?utf-8?B?RHNsUGN6MkxvSCt1KzZxLzJPRFIvVzA1YmNMbDhRdGMxcU1YZzBodTN1ZEl5?=
 =?utf-8?B?QXF5OVZXNHMvSmpUdFFKeVZnc2tINHN5Q0QxWklRMEVTREtxT2s3NG12aXg5?=
 =?utf-8?B?ZmJIY1pCTlNSKzV0QXNJcncyVFc5b1BmSE90TXNQUXAwYUNKazFXNm5EOWt1?=
 =?utf-8?B?b3hPNk5GbmNoOHkzeDNkSnZGb1pPVjVJdnpRcFpXN1RqL0FCMUhCYm9Gdy82?=
 =?utf-8?B?Mys0OGxqUVNieVpkZmdoSEF6a1RZN2dxR3l6S290aXJnUXNRVzN2dENTMERh?=
 =?utf-8?B?ZGc2VDBrNTN6MzdPRzY1MnExWTdleTJJTFZmUjA3bTBZeXJqYkZYRmNWTDFZ?=
 =?utf-8?B?MUFLQmJ1OHFDR1JMWWsrdWFUWUZJY2ZFdEZxV3hqd29QUXRRUS8ycXZablJD?=
 =?utf-8?B?MUNuVm00NFh2cXRpeWhGZDNBTUhhOWtiTmRaUTB2YmNETmNmb0I1U3BsTHFv?=
 =?utf-8?B?eTl1Z2JZa1BBd21rZ25PTm9XVnVCTjJ0a1ZZOHpDYThuRDE0KzFKZkxsNjYr?=
 =?utf-8?B?Ymg2K1k4djZEOHJqZ3hpN0lLVzZlQU51VXBZc2E0K3cwQmR6NFRNU0p2cTk3?=
 =?utf-8?B?K2lFK0FTSk5iS2wzeEdQNUFzc1pNbEhaQ0NQdDBlSjNDc3NYZVhPVk1GcDBy?=
 =?utf-8?B?SGVKbm5CdW1HUzh2eUE5VGFDNUVKRnZtWnE4VEllMVhiTjlLbGJrdEh4ZWFy?=
 =?utf-8?B?NmpQcFE3djNhVS8vSkkwZU5WbVM0dWZBNGhLMHhVVEp6Ynh2aUwxQjBnY0pX?=
 =?utf-8?B?Zk02bnNmV1pqQ3ZVWk9PL0xEUkpoVytsTVA4THhxUCs3U0VHWXRxQjRqeVZZ?=
 =?utf-8?B?M2grTkY2c015UEJNYlVwbnowRHhhVVVKYWpMWHVUd0d4ODB3c0R2a1FRTERv?=
 =?utf-8?B?cTE1Sm9haHFGYlpyZENoQm5NWk5VWE5tbHN2ZHVtZlkySUMrTkNES0l2cVRZ?=
 =?utf-8?B?WTV0KzV3aFVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWl4V1UzeXJMejBoVFJWM3ZNZ0tHdHNtWGRaN0xpNXZOUTVrcXpkcGQ4cHA4?=
 =?utf-8?B?amFjaG5xcURULzBNd0VWQU1LQS8zcmRwSVFVWUtXZ1VZTlZoSU5kdzE4Y1RQ?=
 =?utf-8?B?VUxCengyWjlpcDdPRmhxUll5b2g2N1A3cUFQNURqTG42STFYbXhEakZGYTh1?=
 =?utf-8?B?dVppcnNwVXh5QVZlcFpBcGVycHNMQkJjMllTUkVFeWlpVmtqdEhHcVlSc2RI?=
 =?utf-8?B?VEs2STFmOCsyR1lQcEpzNFZ5L1pRU0cyTmdLR0lDR0F4cG1qaXRJYmMxZSto?=
 =?utf-8?B?MFlOTFo2OEY0MmYzbXdSdm8wUStnellUeDh4WFgrQWRJaDN2OWcvckJ3dy9R?=
 =?utf-8?B?RmtHT1orVHJrRnNmVTVEK3EzZnh6MmhmZU1jQ2RCUWRoTUtiaW9zeWtzUGVs?=
 =?utf-8?B?aDErOTRkYjdCYlZzelkxZmtVd3VWSTN5c25Cb3FOb0xpNTJ1S0duR3QrQnQy?=
 =?utf-8?B?cmNNSEg1dmNEMGlrdEVOQU8vKzB6T293cUpudk5aSTlUVkdzLy92ZUhXeU5v?=
 =?utf-8?B?WU9vNU1mb1JUczNhS2ZiaXhQU3Z3N202Szd4NEY2UjdUS3JwWFV1MWx4cUJW?=
 =?utf-8?B?QlVHY1UyVWVEbWF5dnFYNWlYN2gvQlhiUGtndlRxZC9CYlUydi9LSVVTS3J5?=
 =?utf-8?B?RkN1bVNEY0tKTWEzWUY5RFB0UzhlQWxRdm5UbnlxNTJqeTRuMDIyMlFTaUZk?=
 =?utf-8?B?NnZ4eHMrNDR0UjlCRmZNSFdoaVByc1pzMTZTTUN0ODIyQzM0eU1HY1RhdWdH?=
 =?utf-8?B?SFk1QXhNS1EzZ3l0U3djRkhBem50WTZTMFQvYXdaOFBUZGNZQ2NWRHQwcEFR?=
 =?utf-8?B?dTRmaFlXZTRqR0lTOFhQWG9TMlpid2pOU1MyNHdGMlcyVWJZTXhmTHo1NzBP?=
 =?utf-8?B?dktDczJJQlhnZ3BIRFJkc3VlR1ZvZW83aElxbFFjNldJQ0VxTzZSblZMb2dF?=
 =?utf-8?B?NS9kV2NmQ1dTbmp4N3BtMHZaRlhnZkpmMTZrSjRZczZuT1RzbmlSQ0pscjdR?=
 =?utf-8?B?ZXIxMXUyTFZBUU9JNm56S3FuVXE2MXlQSDNybUhMMkdLL3dZT1RKamFTMGdR?=
 =?utf-8?B?WEljNjhpM0Jtbm03S0dSSXplMVAycC9jbTBmWjRHQmZzK0RDdU1hUDJRNCtQ?=
 =?utf-8?B?Ui80MFZKRWJMQldvelRLYmhkVG05cUlCZFVlR3pDNmRQWGxLNkFDNU15c0l3?=
 =?utf-8?B?UFlIQzlKQVFML3paOVJqdEVCbW9YdElqTXljOWRQVEFOWG95cGVGeTN4b2ly?=
 =?utf-8?B?N2NzRG83REVQdzZkMHFaT0ltYTgwdTZ3OEhwcm5tYUFOenprQml4ZW4wUUNt?=
 =?utf-8?B?SUVNWm01NW9wQ2NLOUh0clZEU01UaTdnbGlTeWVOcUlXWUN6VHpwcVlPbEcw?=
 =?utf-8?B?clRkOVg1SXpyOUI5ZlgrOUlSc2JvT3RxUDdlemliMitOc3NEY0VCa29iRG1X?=
 =?utf-8?B?OG1DUUpHMzh1Wk9BeWV2WTIvR0VnaHpOVWUyVUh0Qzk2ZkRDaWhIZEkremR2?=
 =?utf-8?B?a05PUkM1QkVodjZwTXFBOW1qb3JNWWI4OWpWS2xUcGR6cVFIcHFvVzZ2YU1h?=
 =?utf-8?B?MGxPOG5qdG1IREllaHBmelM5U05wR0RlekNLVHcxdWdpais0MzM2TkFIYTFh?=
 =?utf-8?B?REs0SktqS2YrVHdwWTJYWU9ZR29jdEVZTWhOVU1FYmRTQ0phcU9ZdGZ2Q3lV?=
 =?utf-8?B?elBnWXpGL29WdWZiZjJkMGtiUUlPWHYzSnRZT3JTN1ZhVjZVbzJ5ZGRNUTA3?=
 =?utf-8?B?QXRLUVFKVEE0K242Zml4Z29FdlJzMlNtUHlKZm9OczlMMmVlb01KdEg1WTkv?=
 =?utf-8?B?RU9POFZtWWY0eFNvMXViSEd1WG1FUGVMYThVYUtWeldXTUJkTjdDQ1ZQemI1?=
 =?utf-8?B?VkUrZ090bU12blhlRlFaQWh2V0ZGWnVnb3RiREFOSjhScWV0U3JRcmhTT3Rj?=
 =?utf-8?B?enBNb2ZOaFRGbkdsVG5KVmlDQkhnVS8rU3hldHRpUGQ2WU8rOGpEWmtzWm90?=
 =?utf-8?B?d3lhV1JDdE5heENpaGpOdVl4d3JYSWdWYmg0TWJGN2ZKbk1JUjAyU3lVak9D?=
 =?utf-8?B?K2hwWVl3YW5JUDh5YnkvL2dKUkRLNWdrQUVRcWxaN2x4VWp2eHJXUCtkRHFS?=
 =?utf-8?Q?/1s576KRJSIiaSdDvzFUbVpQK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba3763e-c916-4c14-a1b3-08ddeed8c2b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:08:10.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBugyg7EK2wcddkwwEZGhOnRcnQDQ7szyU0tpbUUf59vJ4RMdYu00LEoSfncnNhgNDwCEnXoEUEchuIVS0gGuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8918

This patchset serves as a preparing patchset for i.MX95 support.

The current code logic is complicated, with mix the usage of switch-case
and if-else.

To simplify the code logic:
 Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_mode.
 Each imx_rproc_dcfg data structure is assigned a ops pointer.
 The common imx_rproc_{start,stop}() directly invokes the plat ops, no
 need the switch-case.
 mmio/smc/scu_api ops are included.
 No functional changes.

Thanks to Daniel and Frank for the help.

Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops. For SCU-API ops,
I currently not have a setup at hand, I will give a setup and test
later, but everything should be fine, no functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (6):
      remoteproc: imx_rproc: Introduce start/stop/detect_mode ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Move imx_rproc_dcfg closer to imx_rproc_of_match
      remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch case
      remoteproc: imx_rproc: Clean up after ops introduction

 drivers/remoteproc/imx_rproc.c | 448 +++++++++++++++++++++++------------------
 drivers/remoteproc/imx_rproc.h |   7 +
 2 files changed, 264 insertions(+), 191 deletions(-)
---
base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
change-id: 20250908-imx-rproc-cleanup-6f3b546b9fdf

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

