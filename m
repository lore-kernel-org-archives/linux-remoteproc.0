Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BE235B125;
	Fri,  9 Jan 2026 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960518; cv=fail; b=qF+P/XdJHlyZQRe2Jwnq2lMccOauvIFaDFQnvG6QejHVv0R1XW39iEgTuPX4MURSM8hswqPEg/5z10ZNi0VTg/XPxxhTVtJQyk0QTCHT8rI+oha9v3E7KU6pMl1aFYLSVIjbqrshsIS+Dcn/68LTtHMs3SwaTborkiHCCY6n+4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960518; c=relaxed/simple;
	bh=LLc6Ch/I4ygITgQCVDgtx1leVb8sfB5ofRtVEf8N9m0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WNOcC5L7lJJnf59Cgs5BS+wXivoc4eKKsUyrn0w68R6Fo7Tnprl95wDdIg/mp2dFac5LRMFOteIMzu62zHAY3zI+8V/4RE1Pecp2eFJDF3cWWRfQLunQgY4SJHk5TftGYULdgyOAzTF6LcEiQ7fEwLQArvlpmAgtE5b+O11Flt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nDmd1um1; arc=fail smtp.client-ip=52.101.83.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nDmd1um1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjTWr0XbyyMWYgQEmVFr2uup4z+p6XGj2rUZzrx1IgyTBZq/yWa3s7UXsTRIYGBquVt3g13PPqYo/OAychDTlzQ0aS+Vta+O6rLwQH3YxZXEG3Gv9BmAddaygEQ/YZl8TixN6ZquLH6v+aZxhDd8OxsiKMzSTdI7dmIg1Ww9EHN6xJan2n6d0NNObWc854D2DZ4iS7GNcJazolcljvAQjW5I1WHJSdxv9ImOaJA+TeLb66Ia/Rht19E0DLYG45tggrUulOmQIW3TUBsu1Qzpw40aIKsk1hnn9wiOEg/iPa6baXzVPBq41bLQL4Lapbp+Rmhr2/1/PLjjDMntQ1DylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ1ZL9Y4le4+fxs5FMQnP45TksBtmC9FytXurOXY4xE=;
 b=MimtdEwV0gzBjPXvkLCa6mTfwoc4B0NA00Nu9uRQniCQkhEpBP+MY7L06dARcqgdTUglXutKkcwzuRkP0Pyljkapb6w+H7Zk5BPibhIbJlNOyOMFCHP9kMkRUmuXgOKNJEE86ElErFyYz0crT2kogoYV2GZe83p2o6nv2d0WQV/E40e78tCgdDUaOKuFqHMJjlBYEPbcfEpfMMXz0howdD9JoxER9FCoFw2zU2zoHv+fylOY/620y8WhWW3Q0eAe+cYMvgejdT6QPFTJ6RqP6u+YPmUJCPKUYwxZTQbD7GESwNuKNEFnyxSKbAt5ZKPPnAlmRrwMgCNJjejhxY9Exg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ1ZL9Y4le4+fxs5FMQnP45TksBtmC9FytXurOXY4xE=;
 b=nDmd1um1bhb2RHDN2ph8VbtvU1CiIaFVta69Uf9OS80PlBO1Q29uxsycDJtrFAxj5DaK12ac/5RIff/6Xzug1Bhr7ZKef433MZrFxlxfcTiL315n9g/ji1abhCMX+/Cqa36a1XtbmmynxRYLofOwXXzOta4zFBw2HnjisML3HP64rlx6f6IAJ0i4SyDczbgOEFoPY533tn+zCRdLAQGkt8jxNUkoSkVNnZNykPjC2q8mLJzvGzIpwSzvfqRMbD1Jc5lQobiqP6Y+ar10IZKfX547XDODksz6By/yWy2wJpZrNQcZJMmOzr5hCl6m7WfO8IbIonWpOH4+Y45/teSlqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 12:08:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:08:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 Jan 2026 20:08:02 +0800
Subject: [PATCH v6 2/6] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-imx95-rproc-2026-1-8-v6-2-d2fefb36263d@nxp.com>
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d62bb75-ade5-467f-78fd-08de4f77cfa1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|52116014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUZ4TkM1aHVVdUpCQXVsaGZPTk5TMm9YRDkwRWx0Zkw4QjM3cmU5UzczTjQy?=
 =?utf-8?B?Z0J1UlBvVXprNk9oNUtIeGFnTzlvMmhMRkEwYmZVY01VQzh3b2ZsK2lDNDhj?=
 =?utf-8?B?eC8wckhrNzhxTlFlT0dJV2EzcDV4NTRzOStlTEM1M0tibzFFaWZzZFBvK2Np?=
 =?utf-8?B?T28xQWNXVTVGV3BvZ0NrYWZYZnM4aFMzWUFIazdlQURBZXVmOEswNlM2ZERC?=
 =?utf-8?B?ZHZEMG1hL3BXcEZZRTZOWEpXK0VCVGJUQ1dmcHU5cHNUbGh1R0ZmZ3VKWjJV?=
 =?utf-8?B?eE9lMVNKMnpWSmMwRk5BNjY2N2J6Q1pGZXNVdUE0TlNMejBNc3MxWUpmN1Fy?=
 =?utf-8?B?bWxub1BTcXp0SW15UkovUTc3S1N3R1V2Uktod3h2cUpJU1pmT2QwMUFsNFB4?=
 =?utf-8?B?U2pJc1RvTms4NDBsTUc4bzhmUWVkVXVQYjNKREVYWXJqU2J1U2NYZWpaTlh0?=
 =?utf-8?B?YkJJRmRZVklQQ0cyeCtIZFdTeHJZZERQVmU1SjdsV3NkblY4aGlFdThPMjI4?=
 =?utf-8?B?czh0RXNacG1EeG8wYU1EZE9PS0FVd3RRZ0RQa1JlYXlhRmY3ZGJYWUR2Z285?=
 =?utf-8?B?RmlIZ1NLSXMrSDRuL2VYQlN2blg3UlNudDBtaC9UNDJqR0VERk90T05xYUJK?=
 =?utf-8?B?NEV2amxWUmxCUHhRWWphaWo2ZkNPdzdBcDc5Uk45UUlqbTdmNzRDNHZFSFNW?=
 =?utf-8?B?SjFvbUdGM1FJc0IwS3VMYmJGVjU5WlNpVEE0cExseEhPL2hlTVREUUcwZHFD?=
 =?utf-8?B?NTJtTmZYb05Wckt5b2w5S0pnTTVYUm00Z0grZ2E4OFBJRnRlRi81Z01LZU5x?=
 =?utf-8?B?NmJBNFBLd05objc1cmQ3QTFpU242UGM3Q24xdVZsL1BLWTd0RFZLSENCMHVa?=
 =?utf-8?B?WWxWR0I2ZVo5UEx1VmMzU2V4ZERWUUp0UCtVM0V4OTBtUUsxU05zMEhZT1R1?=
 =?utf-8?B?UktsbU1KRThiRHd4aDhQS00reDREbDZ0WGtJZXY4azRsTWxBZC83ckhXbEo0?=
 =?utf-8?B?eExUNFVtdlFiOFFxTThBQjkyRDZocTF2RDluWmt1Y3RuYTZTUmo5TTVUM3Iy?=
 =?utf-8?B?UDN3Zmdrb1FNdngreWVKajNPVHpYdTVoZk5Qb0NCSk5xWVNFb3JXVlE4WTFE?=
 =?utf-8?B?U1ljT0UwbDYrU3duZ1NYOU9oSGh5eVFKWEk5eHhNSjFmRUZOQ3Nsa0dDU0JC?=
 =?utf-8?B?RXpnN2lkTkZ6VWtSSnlvWHdlSVJ2aTJvRkc0cGd1eDhMSkphL04yQ1ZCK2sw?=
 =?utf-8?B?VUJnZVpXRlUwT1h3UkpoWjZJL0RJYXFTREFTYjlTdFJFVS85UFljdGJ2VWlo?=
 =?utf-8?B?NkFVbC9UazJmN2tCaVUvSnc5SU9wQlJaTmpLWlorbUZnaFlOTnFTYjlJWFFX?=
 =?utf-8?B?SFBDeTNkWGtXMzJRTHdCUkJvT3FnMSt1bHE2UlZZQWlEZFJqZkNyK1dlTE1P?=
 =?utf-8?B?MTBXODBaR1l4elZ3MkZRSGt5SkNjT0ZIRmZ4ck9ZRHpzaDJ5WW1ZbCtDT0x3?=
 =?utf-8?B?THNTZUxFWnNRUEc1cDVCenRyYkRINk13V3c3RGh1Vk9HQnpoUXV0NHI5ZHlw?=
 =?utf-8?B?c2o0SUxrTXRTVkpYZHR3aGYvU0JaaTRXSWhTTkc0QkpLMHpHSDNwWUo5ejJJ?=
 =?utf-8?B?S3lkeTArRDlUblJJM2RtdVIvMHd2TU1HRlpKQ0l4STFsbWIyZkJwR1IvZVhG?=
 =?utf-8?B?VzdabkJHSW10WlJUaFdwVC9HZHZPand3dDZBVnlFWmU2Wm4wWVpWNEIxYTRG?=
 =?utf-8?B?dEFtMFgvWTlpY2tWV2ZrWnNTU3hvWUg0MHFZNnJ0YzNVelFGVzUxaTlOZSth?=
 =?utf-8?B?VHRUZmZRWERBKyt4VnhBTk1nZjZkeXNDOW9GZ0V6VXRLUS9KZ09UenNUZjd6?=
 =?utf-8?B?V2xhLy9qTUVSYWtlRUtWM1cvTWU3YmRwS3dmaHJ0cFNFODRFMy9zMWh1cW5w?=
 =?utf-8?B?dE9JazNJamJKeWJKaWswZGQvS2lTZkRnNlFWU2w3WlVuMVFWNTArOVJVK2dT?=
 =?utf-8?B?WktvNzlLeElWdjYxU3NmTGRIUW9MSDJnbERLZ1JQVnppYlhCT3IzTFBSb3JQ?=
 =?utf-8?B?QVk3V1N1d0xGU2ZodldXZWtmNUU5WkhXSTdTQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFJVVE5obE50cjhuS0ZvbDVBSzN4VTNCenRFVHNLL0lZckZlQ09qNnY4b2V3?=
 =?utf-8?B?SHllVzI2RkVMQVVLZjM3Y3J0Syt6MTZ6UFF0RkFiY0hUS1hYMjBJall0am81?=
 =?utf-8?B?bG9NNk92K2RXUkd4aU10cXV3ekU5Q3FVdjV2cXlJbkl5YkRDVmpHQ0QybUhq?=
 =?utf-8?B?RDJBaXJQTVRNZ2hSRGR6bGJPT2EyelRDdzEydnlYemcvLzJHR2tJaWtYT2JU?=
 =?utf-8?B?VENKZENhcURTZlFXcHB4WmMrYktGL2p2MStQbVIwejFMWmZqY3hhTlJ0M1k3?=
 =?utf-8?B?R2JCczltaFJBQ3hFNG1vSzdHT3NtdHZuYk9BcTBvTHltbTBXeW5QcTBDcFZz?=
 =?utf-8?B?ZGVFTlROM2RBeXhLNlVSTEdSUUg3amRMb0k3TlBDa2dGV2FwanFicjhiQmdY?=
 =?utf-8?B?dENuMnN2NVVjOXp5UXlYdldOOGowT2dRV2hHS2pnS1U5UVlmVHl0eng3Wk1I?=
 =?utf-8?B?UnBZY3BFK0JNd0xYRUNZU3R3Uk9EWXNGNlpVaTRnUHZ4dFhTdFJZNE1pdm0x?=
 =?utf-8?B?SUZBTS9Bc3h4ZmlHblZ1WXB2OWpGMEdwaWlmM1lDUGE4c3pjcWl3K1FqOFJx?=
 =?utf-8?B?Sk8xdXFUS0h5SEozMVpiTDJlZjVZZTI4UDhDUUJhOFRGbEw5NUgrWldnT25q?=
 =?utf-8?B?M3hsbHcwSk1HakRnRHJzRHE4cE10ZDcyKzRZSFowU2E1S1ZNRWg2Z3B6REFo?=
 =?utf-8?B?TnYyRzR6cEJ4TVQyVDJOUHljTU1VbThZckR3Q09DUGRTYkdydHF2TGo3YXd4?=
 =?utf-8?B?bTIvb2xDd0FxYlpUbCtnL2xKR0JNeE1JNE9NV1BBd0tReDlMUC9nU3prMk5z?=
 =?utf-8?B?TzNGUTJzWno4Y0YwRUY4eXQrdGZxc1ZxZnhvb3RvaEQ5VkdzL0hhVmIvK1Vo?=
 =?utf-8?B?Z3YxTmtXRGJHU1hZcHVkOVo2S0o2dEZCelJ6SlcwdHdDMjlqS0VUWDR3Mksv?=
 =?utf-8?B?ZUY1dmJLMjlSQVVQYnErWXNyZTlLZTFtTTNTdThxQml6RlJrbE43RDNydVpM?=
 =?utf-8?B?T3lrenFIRXUxM0FoT21BNEJLWnlrVkY1QW5nWW1nNUFYdkN1N3JHcjlsUWQz?=
 =?utf-8?B?Wll4N2JJTGJlNUhoRXQwbnhyYXhLSEorb1lVWmkzTFJKbFJpZG9tdStvZHpO?=
 =?utf-8?B?MEJjZm5HYkZIOVFwT0JOQ2x3UHFXQy91TloydzNlNVJXM2JwdWNBT0IrbEZx?=
 =?utf-8?B?VHI5ZkhYYXJKQXo5ejZNcjgyYlZHOVhXd01mU3BXVXlURk9uNDJrYzBaSXRK?=
 =?utf-8?B?OTYzYUY3dWlrU25YYkVWVEg3VDRUZG1kNkRIWlBuTlFDUmNNRC9uU1p6dlpq?=
 =?utf-8?B?MklyVjZjdEhocnlENDlqTG1wTCtwTmN4ZURldUU5RzE3YTBwN0MydlR2dW5D?=
 =?utf-8?B?akMyUEphQ0hMT0pHZHk5Q3hPVFYvVGtNM2NDcU4vZm0wOUk2TVdaUWh2MitM?=
 =?utf-8?B?Q0s2S3Z5aGE0QkRIVktWaE5IOTFENGVqK1ZHcWxvOW1TaGsveVl6Yk9rWTlF?=
 =?utf-8?B?QmxyeHJWK3JOeFdYbVhXSDk1eVRJeVlJSmJoM3B4SzJKMzE4YUR1YW1ERGZ6?=
 =?utf-8?B?Z1dIcllKbGtqbGJnVWxyWTVCUVVXSGE0NVZZcEdXN2w3cDVJK2UwYTArVkhJ?=
 =?utf-8?B?RFBBZitGYkZMaVlqbHV3UTVtZEFvOHNvM3dCcXArMXZlNUNmUWxUVFU2Mzli?=
 =?utf-8?B?Q2dFSzFJTkhzdjlvTnRXRjFNMlVGN2VRa0RSWm9KbUVvV2NpdDcrYjRsQnpP?=
 =?utf-8?B?enVRbk1PTDhaRUJ2MHhPci9DdnBiTEpORFNsMGpaOU1tZURhOGI1aEhwZkpk?=
 =?utf-8?B?OWExbzdVTVhTWk5YNUxCVWJacWVYWnVQcUZSNlBaeWwrQkxRbUNENU4zL3Zv?=
 =?utf-8?B?TmNydE52MlRqTVhuc1RJVml5djcwQVB1N1d2d0tQeDViQ0lCZDB0VVQyR0hz?=
 =?utf-8?B?WjNUcjBtRDQrMEdMK3lRenpzMkdiODcvdmZBRDBuM29veDZTU3paS1NFeWFn?=
 =?utf-8?B?a2ZhZ2YwSzVidjU5dlozZzZIeGQ2ck1zSkV4NDJCZHh6UmthQmhYNSthMmpZ?=
 =?utf-8?B?WStWait3a3owTHJyM0gvMHNhL1JlQ0JKQ3QweEJEcUE1Rlc3eVhVcVRxcWVC?=
 =?utf-8?B?cGZzZzlWUXAwVW01MHdhL3Z1eFQrejNlV0VSc0pzMXZESUh6WXJVNGNHdnBv?=
 =?utf-8?B?OFZqVW9QTzRPMFpuanR6S2FtQ0lpRW10Qk1FUFl3VmxzTitxU3Q3MERyNFBK?=
 =?utf-8?B?aEJGemZFa2NmbFNTc1JrVFg3ZFN1LzFRNXVTOFEvWlIxdHlqTW5FbGlGOTRh?=
 =?utf-8?B?N3QrZVNZY0ZiL0Frc3lwMUFmYytCMk44VlBpOVFGRGd5Q1RPSjBxQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d62bb75-ade5-467f-78fd-08de4f77cfa1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:08:33.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e27I1rHxdQqN9FwM7p+ySsy1sboOXNSwleJ2dVfN/WHw3Mmd5kgsewVgvRQSlvzpKwsldCE0I9NH9wV+cGZO/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

From: Peng Fan <peng.fan@nxp.com>

Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
which defines the start/stop/detect_mode operations for a remote processor.
To preserve the const correctness of the static configuration while
allowing runtime modification of ops behavior, introduce a new
imx_rproc_plat_ops member in struct imx_rproc named `ops`.

During initialization, dcfg->ops is assigned to priv->ops.
Enable the driver to safely override ops at runtime without affecting the
original const configuration.

Improve flexibility for platforms that require dynamic operation switching
(e.g. i.MX95 Logical Machine ops and CPU ops).

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 33f21ab24c921135319728ead3d24f1833ea1d64..78659c8fb84d95f3d258c21af76cefea1c82850e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,6 +116,7 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	const struct imx_rproc_plat_ops	*ops;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -315,7 +316,6 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
@@ -323,10 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	if (!dcfg->ops || !dcfg->ops->start)
+	if (!priv->ops || !priv->ops->start)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->start(rproc);
+	ret = priv->ops->start(rproc);
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -372,14 +372,13 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
-	if (!dcfg->ops || !dcfg->ops->stop)
+	if (!priv->ops || !priv->ops->stop)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->stop(rproc);
+	ret = priv->ops->stop(rproc);
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -584,12 +583,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
 static int imx_rproc_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 
-	if (!dcfg->ops || !dcfg->ops->detach)
+	if (!priv->ops || !priv->ops->detach)
 		return -EOPNOTSUPP;
 
-	return dcfg->ops->detach(rproc);
+	return priv->ops->detach(rproc);
 }
 
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
@@ -979,18 +977,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
 	/*
 	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
-	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
+	 * priv->ops or priv->ops->detect_mode, it is state RPROC_DETACHED.
 	 */
-	if (!dcfg->ops || !dcfg->ops->detect_mode) {
+	if (!priv->ops || !priv->ops->detect_mode) {
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
 	}
 
-	return dcfg->ops->detect_mode(priv->rproc);
+	return priv->ops->detect_mode(priv->rproc);
 }
 
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
@@ -1040,6 +1036,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
+	if (dcfg->ops)
+		priv->ops = dcfg->ops;
+
 	dev_set_drvdata(dev, rproc);
 	priv->workqueue = create_workqueue(dev_name(dev));
 	if (!priv->workqueue) {

-- 
2.37.1

