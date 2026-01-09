Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD0D35A948;
	Fri,  9 Jan 2026 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960525; cv=fail; b=GcknCLe5dTTduALU2BFig2dsCyzxqPytB52t5L/3rPOcXEziVbv+k1nmkTf4yJsbwxKYwxGjsqov2oYrHASJQ2Gc3Q/KYAAnWxE6gm4dqGHfBWtSEMQzY93Zqa3St5Z8AWMjKuf089rGI7BJsEoO9SGn1FOAjjau6DcRMKqmPIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960525; c=relaxed/simple;
	bh=sKWY1neH+hf8T8f4Zv88HE7fld1YZoTuKauubZydgmM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=I9M8ld1Z8VhvvY57vKWLO9J5dYmxxNC7vnlB7rGfAlza8XGuyFiQhSLFN/UX3UVOLxopyc5ObAfgNhfGis3zGIzWjdHBRsyVCQ8gOob42b7bzF3acAcxbCEeqHtVhDTMJfmZTqYUvaioXAzqRLcitNBt3vxhQEqeoFNrWPBg+jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cl/tUYUG; arc=fail smtp.client-ip=52.101.72.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cl/tUYUG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqVIL5Ffy16isAa4d3BxeraCG9gWsOtSb9E+tCNuzgSY8gS+zvmXOpo9UOhSz5/thQ/5d13jEzj8l+otEnP5ZGzOU2T8J0TMb/10NmMSR6zonzurJDLYOscuV33MNPkrnG95szsiSSN4iFtyNta7ArnH8h1heZC9KdG+w/NwhGzlE5vka2TOgBmOpsr+G6D0Ut34Ya4cN0bw3PeEkRSd7c9WpSBmtybiIJDhxmkjZhiJpefsvNqlQcu+MKyVSS2fCvNBOplLnTzGyLH8NCIWTO33fVu8+6FkqBe6CPe77NBoyiObuz/nraFuHHeIKVC1MYY0BZwAlJmFDFm/qE8rNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cG8sTmECmyc4ir+5XOivlhebh6o9hPtcBqgFFDkmnY=;
 b=WU6ThQ6BzybrPuTdfbrt2tp7cnVTiXMRymt4npBOyLfsj49epJuyxw2EQou2IKzwrsKlpY22J3eX3Ga/S66BnZf/xzqTdknViAf8yJTnK8hfJhPYzSLSzxCUEu7jBHfd27TUQ1MEX1v/h6TMRJ6xtWIf4JkWps6xHm/wLV+TY8FN9xulwhL107oHdZ8AWs7vZ/grNIc4nXM13ghIa45nP9fcjBxO8+YT0HdOsrYf65thR36FWHCNbMADsvWvJT3HDjxAJMBgTPeENshAI378JjQ2PjY6XlkfPcZsbHjvFajT4hyiD6jbgqPCvZuZ531/g9FYfn3BEf1zC+x10JDSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cG8sTmECmyc4ir+5XOivlhebh6o9hPtcBqgFFDkmnY=;
 b=cl/tUYUG06KN0azrNU3XOJMGOQeamBUDGewREwTQ6tbOsGmp4Pu42W/KWy3gNzOdBvLsdtXlEECOgnkdExJq0HaAhgGi0+K9nvGp5l+k7RJ3B2zbchlzOc7W2n/oAp2oPw4jgZCLog1o8JM+ydpGt8BB3CSMwTig8Tp24p2ZBzQXCf4O0YdnWnQ4ebniNsWQMprgpP10pHcu9p19WCibHHdm70OohcycHIEY1IRIjT6NRkf6QkZcC8iVAd4TwRKRWwgTaY1qeZ5NpKSE5cMijhXZurJC/fg4ESOIn18s5X2CwbLeJ7f0iaXnRAvNzZbg5Fc9bH7CD51kLG3Hcm7Nyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 12:08:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:08:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 Jan 2026 20:08:03 +0800
Subject: [PATCH v6 3/6] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-imx95-rproc-2026-1-8-v6-3-d2fefb36263d@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32b36073-e195-49ce-23c4-08de4f77d266
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|52116014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0VJVzRxaTVNdVFoOWlab2VKZDdON05lM2k1NHJNOURGVTRydi9lT0svcWt2?=
 =?utf-8?B?Rk1ja1pES0x5TjFOSGhWZXorS3FPck8xZ3V1cDdReTFYSk5YYXplaXh0emJi?=
 =?utf-8?B?NDQwVURjeVQybkJxa1FsU3UyQlVqQ1dCb3N0ckh6aDBISlZNTHFjaFN0ZEdN?=
 =?utf-8?B?RllRRWhGNUZob1hGVHF3TW5JQWhxR0tLaUJzZVpOeFV4cjlJcFJIQ1lNcWd2?=
 =?utf-8?B?UkJzSks0Y2VyLzRhRUhRTDVTVllGVHgwQytVeEZpREFmS0dVMXJrdkRWUy9K?=
 =?utf-8?B?V1kvQUxyekxIL1F4aEU1MnI5MXdSVlFKSDhieVdJOTR4R3lVK3V5a0JodWtE?=
 =?utf-8?B?SFVqNFEyY2dJVFN5OXQ5QVBZZGJocE1vUWUzMFdxQVFzUEkvbXB1dmsyUE0v?=
 =?utf-8?B?Wkw2a1BwUjdaNG11SFNISEpQSjVvbitkb2FIZEUwZHNsLzlTVEdVTDVWazVy?=
 =?utf-8?B?Uklnc0R2S3lrbkhDbEJmU2FxcllVb1NCbE1tS2hTTWtPb3FRUlczZFk0NXN3?=
 =?utf-8?B?QnpaamtKSjJ4QmNERkdHcjducW55M0M5dnR1aDNvMlF4RVVFRGpqMDFFLzRB?=
 =?utf-8?B?WkRCVkhmTjVmcnRnaXdpZk9BMytNMU1FVWNzanJXK1BEMUY4L2FGc1ovL21U?=
 =?utf-8?B?WW51ZUU3RWJBQkxHSmw1TmNmZjdlaUVnR2NjK2Zsc0V2QjIyRGJBakFpaWVM?=
 =?utf-8?B?VUx2ejZVdzBPMkY2VW16US9QTzE1YXJNZFZYNmhEek5PT2xOSjhHOFJHNXVt?=
 =?utf-8?B?MU9EUllSWTRKbS9jNnRTTkw4UlY4OUlCWDQwK29pbGtlVE4vclZsdERweHNs?=
 =?utf-8?B?TG1BNjRhajk5akRPWlptWXV1RjdQOEIrT1lFQi81amU1Z2lCMnJVQ2pFY2dC?=
 =?utf-8?B?OGl4WEdvWjUybmZoUXJqOVRPM3hmcUd1QkhKVVJyV0xqUllIUVJqVHhJMk5Y?=
 =?utf-8?B?andRSWk5Sm1udlZ3WWRFWEMycVZvVzNNMEJUc21hemFKRStGeitjZEk0d1dn?=
 =?utf-8?B?UWlvNE1EU3k0TWU4dm8yanBPQUJZZVF6RzdTV3ZENUpLSWN0Vi81TnhiYWlX?=
 =?utf-8?B?VHA3VUErQTJFK2F5enlPT3AzRmoyUUJuRElDeGo0ZUEwV2trUndZTWRUR3Qr?=
 =?utf-8?B?OVh3S1ViYzE0V05TMmlFSEdzeS81YTFRYXZqbEdjZm8rS0ZqQngrODQycVVS?=
 =?utf-8?B?SnFEaWhkL3NlRUJTZk1sV3pBQUIwd05DK3Yrbm5jL3hnaWs4MS9sRVFrbFhI?=
 =?utf-8?B?MW00QlB2c0tIdjNFakhMM3Z5eGVZMGQxQmZwU0VJd0FkSTdCMjVtTTVEaTlj?=
 =?utf-8?B?Z3BGdU1iWHVOOEtxNDVJNWllNEpOb2NvNkZBdUlrU1UzaEtYTjJvK3RBa3Rm?=
 =?utf-8?B?a0VtTG13c2F1NjdFODdXWVB5cy9ralFMcllXWlJSb1lJdW8xamU2T0tVR3BM?=
 =?utf-8?B?ZHJ5UkJ4K3lQZFdWL2lyMU13YlNrOUxhV2EvMy9iRVNlNm5Vd0RjRmFiOHBa?=
 =?utf-8?B?MlM1dGpIdG1ETmMzWGdYQklnaWtGUld3R1cvWW5BbmdPd0JqUWxacXNkM21T?=
 =?utf-8?B?SFBZQzdGWXk0czJ2SGw5NlhkSGtyTjhCSWpYdDVjTC8xRjhiWlZGTkd1ZFVp?=
 =?utf-8?B?Q3hiNEp0YXhDeE0rOUp1T1dIellraGVZSXNPaWhib05JdGpaU0JCQ0oxbG5W?=
 =?utf-8?B?WGdMWXUydDBuMUQ2c1V3OHJ5amNhYkkwK0g4YUhOZlFlTnNIeDFBT2R4U3pW?=
 =?utf-8?B?MGJpMWpIelJsblZzbk9xVnpPeWdRL05SN0xxVFcrRk5zUmVQMi8xakc3b1V1?=
 =?utf-8?B?eUZOQ1lJeHl3VVFaZGlNN1hSS1BQR1RlZ1ZPeEZ1aUM3YTRMOCtlcjVPYnVY?=
 =?utf-8?B?RHhhR25DcGg5RmszVDV0c2Q2N0hhK0xLbVpZMnpvUVU3UFdhSlJnbGRMNkIy?=
 =?utf-8?B?ZnBPZFNIQXBWblNUdmN1WjI4TWF5cUNDMHE0NjRBMlluK3dIeVBHMVl4WHYr?=
 =?utf-8?B?dGtSelBxQWMrQ3piajhCRXpnalJCZHowN3QwakdUamtUQ3UvbmVhQVFpVjVE?=
 =?utf-8?B?UzdKS2FLVVhpVFlhMlAvbmR0WWcwVU1YR0syUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnA0SWVhN2FIVHpTVUJhQWpia1BnM3ZxOXdsQnZrR1FDY3dleDJMcFZydHdD?=
 =?utf-8?B?bTZDM0lQUVlFVEw3VkFqZ3VNK0VxSXhTdWRzS2pESzVlWFVqV1pHWk5FNXJL?=
 =?utf-8?B?M3pBM0tGSEdmeTRVNEU3Wk9uWFNYYjZCSTY0YnpKRjdRY2tZZVg3UWhHaDhT?=
 =?utf-8?B?ZFJMOXhBcWRpbGg4N2tUVTZsSHRpNzlqOTdWTVB2STJpdWZYUy9zRVN0T3k5?=
 =?utf-8?B?d2hhUzIyN0loWnkyQWFBaUk0U0pUVjBBOFJVZ21NWGZublZ4ZVU2RjF0b0U0?=
 =?utf-8?B?OERKTW9IY0ZMWTA1dENaV3RxdHB0czZKUHYwdTBhSTM1cHRUSUNCdnBWUDNi?=
 =?utf-8?B?V3VTRlRkWkhjQ2RPMHFVZS8wSnZDQXBlbHh2WCtJTW1JeTROQUZRdEZkUTRv?=
 =?utf-8?B?MlgzKzRNWFhIdHZFbThqZUpGSkF6Sm0xTGwwNFI0M285OVU2WU96WGZ4Tmdh?=
 =?utf-8?B?cWwrNzZ1aFFpUXVJbmNKR1d5OGVPVlpQVFUxdWFzckp2b0pYWkx6VmZzNWdo?=
 =?utf-8?B?dTB3SDdkWjlJaFNDR3lMakdIeUgzNmtwSGxYUXhEMkExSmVHdlIvdEhTZW5i?=
 =?utf-8?B?QzlrejN3Rjc3SlJGZE9OZWxLY2lIaWRNbVlQc2VXMm11VDd6cUhLY0QyZ3F1?=
 =?utf-8?B?bVIvTWh6c2F0NEtORExxaUhNeER1M0V6OU5jbllMU2tLZFRaWUxqU3NoNk01?=
 =?utf-8?B?YnBSR2NJY2ozQWN0aFNUZWY0TVc4SGpXeEUra28zSEliR2ZITmdzVmNNRFVC?=
 =?utf-8?B?WCs3eGhMUXdBZHo3bFBBMTRGYTNLZnpTQlFKcE16STFhOXFLdXhZcWFrTWFs?=
 =?utf-8?B?T3RNWmlOZ2RpMkI2V2ZsUFdLa2djWFJqeE1rZDhiMXNtK3MvbVNrSDlXcTJy?=
 =?utf-8?B?OCs3VTlpM0N3bzZxcW5CWXpzNko5TnpxRldBVWVadTVZYThoYk1ZZzBCdldF?=
 =?utf-8?B?czJjS1ZXcHhWbExrYUd5Nm1ZWVBKQzkxemdydW4yL2VBMUc5SHdhaVlwaW1N?=
 =?utf-8?B?VVpOSC9FQjB4K0E5M0h0cWRYUG5ZaWsrNEJvelY4UmdVYkg4elZwdE1wVnI2?=
 =?utf-8?B?WkNJOG9CbGNSZDRzR1FxVnllZUhSSFlzQ0ovZ1RUR1AxNisxVzRDeC9PVUlp?=
 =?utf-8?B?OEZMMENUZWEwZGtDZnhrNjdXWXNLNzBUU0xJbHpSQkxwS2xXZEhiSlRtL2Y2?=
 =?utf-8?B?cFBWZkpiVVZYQWhnM1V1dU9GU3NZa1lVUGNjeTE4NW45QmRBUEdOTk1WMERU?=
 =?utf-8?B?bU5xOExKZ3l4ZGoyN1JlNW1pakFmdXpjRkp0SDNES2YveXhHL3FwZkZTVkRR?=
 =?utf-8?B?K2NVNzVGc0tWWGJ4TWVjNDZJSDUxSE5VelFJeWdpMS9OMzZmeFVHYlRVZ0tE?=
 =?utf-8?B?RU0wTC9sd2poZWtsZ2NtWGlZcTh1Mk41RUdjWTgrRjl1MWRzdTFhZHM3Q3hY?=
 =?utf-8?B?ZmUySm1hVURRZzNVYlA0R29GNzRlWTZQcG5aZ2IyUTU2QUJKeWxqUnRYUExU?=
 =?utf-8?B?THVlV25LR1VRYmdxcEZNL3A3K0NOVE9lNGx5bkpZZEJ2ZHR0MzF2Y1RoVy9m?=
 =?utf-8?B?Vm0wWlp3RHdqY0hPYlVIdXVWa3Y1bDlBLytuamp5YndvZkcwWWRCV3ppU3ds?=
 =?utf-8?B?OGhJbDdCSSt5bHFENlhRSXJoeWVzTGc0TlNjMmJtNGs4enRpUnBuQXkvM1V5?=
 =?utf-8?B?eURwSW94VGFPZ0VIeHdVTWllZ1RrSm91dFJ1b1Rwc1E0QjBSMUNKajB4Wk5W?=
 =?utf-8?B?WCtrcXpGTklkc3NKSmVhMzQ2TkNKK2dPL3FQbmNQbW5iNkdFenVZYmUzS2lu?=
 =?utf-8?B?WHZFS3ZFV3ZyY2cvL0lQb1BNTEtzQm9ZMFJCWFhYS2w4bGdEZXYyOTRETEJI?=
 =?utf-8?B?UTJXVjhMV2NMWVRwMEtjKys1YVZXTFFlbGY1SmJTcEU1Um1VV3FFamFhaFh4?=
 =?utf-8?B?VjZYdjhDSXpyRlFqRDd1OHJPUjB5cWdGRFpuQ1A4Rm54Vkk4Y1hYUyt2dlBU?=
 =?utf-8?B?MC9uc1ROc1ZZVStOemJqOTk1N2VTcjVXeThWOGJnZzRPUzNQbjkrL0s2NjRx?=
 =?utf-8?B?MWJXeGJQYkczaU9LM1JsQ3NxZmQ3SW1sUlJPK0VHdWFlOS9WdUFsdXl3NDc3?=
 =?utf-8?B?WFNaS0tXd3hUS2pPZEdpaFpVSk9MbDZXMnVpWER5NUllVC9Yc0xXWGJhNE9t?=
 =?utf-8?B?Q2V6N2trbisybkgvamRmRGE3eU5uZ0gxTjdDUlcrbnErSUxXb1MrYTRsUnY3?=
 =?utf-8?B?TWFZaldzWHNqL3AveTN0YnR0dVM4YTR5RE5TUlAzU2pRY1dObTNSY1BWZDE4?=
 =?utf-8?B?ZW9YeFhLK0M4STNBOWF6L2VRbGRrMWMwMkQrU2dMd1NzK0tWUHhVZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b36073-e195-49ce-23c4-08de4f77d266
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:08:40.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUQerVA3xW9ss/Q9YQxKmlqFtWDRdO8WVLT6KHZFCWdVJFCw7LGKk9zLSwgQi/sRYFZCkC0FDMYwm9D8+j5QLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

From: Peng Fan <peng.fan@nxp.com>

Allow each platform to provide its own prepare operations, preparing
for i.MX95 LMM and CPU ops support.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 5 +++++
 drivers/remoteproc/imx_rproc.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 78659c8fb84d95f3d258c21af76cefea1c82850e..b0857a1a9660503ee7cd5473c06dacb5262286b8 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -527,6 +527,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_coredump_add_segment(rproc, da, resource_size(&res));
 		rproc_add_carveout(rproc, mem);
 	}
+
+	if (priv->ops && priv->ops->prepare)
+		return priv->ops->prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..37417568a0ade2ae4d6a4e3d0f139ea52b185254 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -24,6 +24,7 @@ struct imx_rproc_plat_ops {
 	int (*stop)(struct rproc *rproc);
 	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
+	int (*prepare)(struct rproc *rproc);
 };
 
 struct imx_rproc_dcfg {

-- 
2.37.1

