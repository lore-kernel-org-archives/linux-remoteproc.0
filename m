Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D8C7580A;
	Fri, 19 Jul 2024 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377647; cv=fail; b=LnYcbaaGogSnzqeIDHc864/AvrR5odOQM9xj5i7QmW2y8jtE0enL6FKL8aXIPns9A+8EjwQQMQuPfpdfWl7bejRDhtsAbnioGu4fK0xTXxmUPjWQk3bifqIJZKZ4dx6AAT9kpdxqCxYqTbKUZDd0AxTxE23Ah+YRcFHfynS/ihw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377647; c=relaxed/simple;
	bh=R8aBL3QPkVrZdjeq8x9uskqcqPl5jnlhX5VlNA58F2w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W7ySQyVoYlPFWB8nO5Z5Na7qQY8bczgjLVfFIocXFTRqSQXufnxbsnq/vBs/goM2Piokwitaq2GAUQQh/zUkoKmMMMeF12ve2Jt8CcGnFMbNTcnwvuRhiMMceHRnrVwc+CjyENfMj9Q7ZWgDbRPmM77Gps5ttRBG8RDV0XaY3Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GcRAKUfl; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GcRAKUfl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8mdILnsZK4kGX/PaA1KvFYH3WjkjfMTQOuVPrTej7bTbe80ZIgKRkxlMeSyNTCAaQlhpj4l7Tyk847tJNwR4KoyXUaqEb3Jw1GxmxM2/cuQhH4m3nfpLRW9HyPCXurDIXr/bcP6aackr/+qLWPCWyXoqMsSsGekYUJeiu6zw+SIAE8JBqsp6NZOgvLcM+JX8L6xxJpke6YWrfU5TKdTLb+1f+8O2342FS3CHiHjCb66/iCDK1b2arhNVst5DofgK/ZE2hjCqcng+5JlNvfWqBTBGkA+3Ta/mrGlmJ6ofnv1NWotLO/3i1BlQwNjSkZU95gm3ByYCZKx0ozJzdScmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KGp9RUMuUPxnlpT+PWpHyg4BDIPCIdKgksXXP3LlOo=;
 b=NFE+kHXnzIGN3kob38qEgCVzT3m++82wl/+AcXQU48wsxQAkyvEbuL4WLakApW11ZB1Z/nB53O8TirpaH2dtGvL3JD+YC50hwjX2PBOYnvZ602JwpCU+nuUtA1gOvaw6+F5K4WGxDqxP0mmJGPVNzGqNqFPOyNhsPMbU6gXj1InPEYM/tAQsAzWfIrvWltdirZwPsIINmwWlEXXScR5v8PFZr7kp/bF4YbAX2pj5Ke0+uxujNNB/MYCzOZvGq4suSGQNQ1mOUKVhPRUvzre3L8hYUenmrYAZNmj/qp1FDCYugq/ROdIVR5GOIn/ANZo7rllCNiueiprQq4H/r+GyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KGp9RUMuUPxnlpT+PWpHyg4BDIPCIdKgksXXP3LlOo=;
 b=GcRAKUflwcQOq/wz5DZZnv+W5S4ZR/yFgSpOROZhLunL+yt5kUmvgSraABTWqS/hT1mzYPu43UKilOA5YtEi4GL0kT5gUMgy1n8nHPiPDnrT5ytRK4YazXIV12zh3kD1kpQx4+nKSdQG7eRdOxEQWGnXx2u2ovkbAM32TJmc1As=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10993.eurprd04.prod.outlook.com (2603:10a6:150:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.31; Fri, 19 Jul
 2024 08:27:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:27:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 19 Jul 2024 16:36:11 +0800
Subject: [PATCH v2 1/4] remoteproc: imx_rproc: correct ddr alias for i.MX8M
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-imx_rproc-v2-1-10d0268c7eb1@nxp.com>
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Terry Lv <terry.lv@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378185; l=957;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wWEx2McL2LONXCkf0QOrfTTU4C0iAcwUurLrnODylhk=;
 b=hAP2tWcq9bN6KQibdznZjlzGZ7u4q9DcG+ZrcJbXbbPYeHtpr5g+i4SLOEH5vlH4Tv3x4Jq6o
 DVwEUE/U/p4DfXNIJhuSYyETkzaaNihMJFxJ4Fe5nx8P5jT55dwFw3E
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: bddeb0ca-ff14-4f2e-0e33-08dca7cc9cc0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFpvRHY1MDdkTXBzL3AyeU0yTnFmOE9WVyt0azN5eW1NVDdhblZQSE4zT0c5?=
 =?utf-8?B?UFptdHMvbXNjZXNhb2s0eWhaUTR3by93dlFaTnYrSlFkSDRzaUphZ0g5Q0JC?=
 =?utf-8?B?cmZsU21MWHhOL3d2TnEvMXZRdk5sbFRuN1JKWVQrUnVYcmRvVjVnMDFYcWhD?=
 =?utf-8?B?RHJpK3lReTlOVDdNUVk0Rm5sUE1GKzdMclVBWWcwZ3BTVW5vem5GRE1GY21x?=
 =?utf-8?B?WS80MVcvUmdrWjB4WmcwSkI5VGR0UDc3M095Y1BxYjl5K0xYZUEybzU0TjhN?=
 =?utf-8?B?K2hXc3hmc3B1bFJLWTRVR0dGTWYxN3VnMVVnMzVzdUJCOFFCVUM1WkVhZnMz?=
 =?utf-8?B?V2xxcVF2aXk1S3ZZNnNjTW11K3JNMFQ5QkNnNTVoajVPaXptMkZaUXllUHpQ?=
 =?utf-8?B?VG41cjhYc3owMHJtb0F6L1U0WnlZVE1wTXIraEhjUi9NN1dUaXh3WUZKUk9j?=
 =?utf-8?B?Y1pEa01KaXVTTlZDZTYxZ1hWdVNJL0dORGhlMmdhT3JoNS81Z0dLeXRoMldm?=
 =?utf-8?B?amhyY0xPc3hKV2x6ODZlUTNIYjdlbGZ2cmkrdngwZ0ZHMTFVSis5dUVFd1I2?=
 =?utf-8?B?YngzOTdZK1VEdkRnb1FYNUxVem5PNkM5VThIZGdmREtaenpVd1pvYlp4MjJN?=
 =?utf-8?B?UXhVempyNXdLV2NseTdnK3ZpS1I4Z09XQTFYTG9kY0hsYmxQVUI5eVVyRlli?=
 =?utf-8?B?SUJ5MXRRa3MrUHo1NmYwQnhoaG5mWHRkNC83SGlodk5FcjZLbElxcmRud2pU?=
 =?utf-8?B?TkxmdUVvZUliK0hiK3FyOGZXNEprckNxdHJqS29EeDNKVkVoMTZZQ2F4b01Y?=
 =?utf-8?B?T3BHek94Q2h3OHZzQlU5aDRzNnoyMlJTRzhrS043eEx1MzJITTV2b01CRU5t?=
 =?utf-8?B?WURBbUpmN3pvVHlkNDAzSnN0a20vZHphSVUwM0Q5UG5lWWdEQ1BLVkpwU2lj?=
 =?utf-8?B?dGllZXdZMEFvOWdaaFRER2ZOVmJEZkZBNi9tNk4wdHdqbzUvWk5vYXpRUGxE?=
 =?utf-8?B?NFp0dUYyVlk1c3Q3eUVvOWMxTGFFbGhDQk9RNDhkTktRZlJsS2oycWRiVVRS?=
 =?utf-8?B?citjMm9oTmxxdWlPZmlzSlk3WXIxQ3NnU3FuNzZuQTdYbDlWRG5LZFNUYWIr?=
 =?utf-8?B?RUIwZy9xcFJoaUVKeWFrN01GeSt3d0FMb2ZrMm9TL29FNFB3d1FhMC9pRWFp?=
 =?utf-8?B?UitDa1hTU3YrUWhUa1ZaVGluekU0NXllazNlaE1GVlFTVGtzdkFmdGlUOHRk?=
 =?utf-8?B?amoxUzlmM0lsMFZMZXVZakhYYWNIRnBSUjVXc3duWkt1Yjc1WS9SQ2x6Y1Vw?=
 =?utf-8?B?bzdBQjdjQ2hYZS9qM3NEcGEyZitZR2hFRE53Z3NLZFN2WmFMSlBlbmVONHV2?=
 =?utf-8?B?QXFOWFAzQnZtVjMramtjdG1ESjIrcUxxUHQrZXZMdU9pRXBsUnB0cjR1UE9R?=
 =?utf-8?B?b3lLMHBpRnFhUXFQWTRYWURZNE9YS0h4TGpXWTErUlA5WEwyRmFwc2xEWjVT?=
 =?utf-8?B?eVNiOUZzakt3WUFVSU5BWFZzMGo0UFlaMnBKWndLSC9SNDEyZ2tFRW8zYzdZ?=
 =?utf-8?B?OWpHdkJZQUZlcTdhYU9GNGxUdTJsaThmc1g5UUpubmtVTk82Y2RHczVmVllv?=
 =?utf-8?B?NmVjK0t6MDBDOTNYL3ZpcEdtdHNtdDJhWEovRzVpL24xTHpzVDErNmlWN3hn?=
 =?utf-8?B?VjVyQjBJT3Vva2pKNXAvNkxUa1d3YVlTQk93NWRIOERhaFliL1N5QVA5eUxL?=
 =?utf-8?B?L0NlY052YTlKOTZjS09EWi84MUVwVGRoZzk5U2QwY29pRllhazJ4MDRhUzd6?=
 =?utf-8?B?cVlBWlIyalhzUUxRQkJ2UHV1MDJFZklvRkJobWR1Tk4vS1RVUFV4WndFSVNN?=
 =?utf-8?B?V1A0OVQrdWF0akY3TWNicmVTYWlJOXd3c0NHS0JUUVBZMmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3FKM2J1MUorVWNJbzZqTkcxRDVQbUw0U3VEN2JKTTBmcnVETUdJeC8wQzNn?=
 =?utf-8?B?TFFZRmVpc09OTlo3bzh6OHBSLzlTSUlYdWZJRkpadTdubzJuY3JlK3J4WnBH?=
 =?utf-8?B?VTIzZjgrdlZ4empURS9xY0lZbU1QOW8yRSs1ZDR1Sm15anQ5TkRhdVlaWDBP?=
 =?utf-8?B?V3FpQU1KNW9jUU04UnpUamR6RDlKYkQ2Z04rd2ZxYzNnZ1FZdE1JRmQ5UEVH?=
 =?utf-8?B?MW5OUUY0UEFQb0hmSEFiQVdIVTlBOXpMWHhBU3NNK3MwdFV1a1A3NE1mVEQz?=
 =?utf-8?B?NFI1ZW1oYjZBeFlsbUluc0tUR052U1R6elJFVithdFVvcnJBQ2R1L1NVQks5?=
 =?utf-8?B?cjdJazJxeDJuT29MdFlEUTFSY0hiTHZUTjZXUWNkQkRFeUlPN25maTVabVJo?=
 =?utf-8?B?dEJXRUhPTnRxQWVMeDNseDQzQlhFY3hwaUVFOHNUQVp4MmFJLzZsdjUvOVB3?=
 =?utf-8?B?TC80eVV4MS9ZeXJvV01hL0ZVU3NhaEJsR2VxMnFrME0xOXJab3pwakFUTkRv?=
 =?utf-8?B?Y0JBYkEySlo1eDlGOFBaK0ZlbFIyMFVZQVBYaHErZ0gxeHJYeE1jbTJtNlFs?=
 =?utf-8?B?cTUrZkRBRmE0UDZPQnpmS29UdmlWV25USWYzOUIrcXZwRkZ1Uks4bjYrdGI0?=
 =?utf-8?B?Nm9hcmVpZEpMRWxvajg4NlNRZXhRZFE0NjhwT2RScWM0YnV3a1o5Z0dsUGps?=
 =?utf-8?B?VEgwd2RJcWxPN0ZtMWVFdnI2YXJ6bUhNY1ZLWHRIbDVpTzE3dGUzRzZBUm0z?=
 =?utf-8?B?Zi9lbTZ6dlVPNHNxSHZDUkFvSU85QmhvTFRHdE9tWUxkcDRqUnRoSnk2WCtP?=
 =?utf-8?B?V253NmEzOXlWODUrOGtlTlBxU3VacStmSEhna0wxSGVBRjREYWZrSFJrQmxG?=
 =?utf-8?B?ZWR3S0Q4b0FQNllVYm1Xb2tEOE11SDdwa2JyWWdJL2NiS0ZIUXVBZ3JWRWY3?=
 =?utf-8?B?cm9ZZlpoUjdIRkhOcEVkK2hna1J0alVzNG1hT2J1M21XbWkvNEplMmhlOTdx?=
 =?utf-8?B?Q2ZPVWhsWFF4SlB6OENOZ0JnaGlTdy9UeHJjeEJ3aklyRm5XcGE5c293YllW?=
 =?utf-8?B?M0E0aVhoRk43alc3VTFDTDVsZ1M0bkdlRGM3aTRCd2RLSHNHSklXQVAzUWk4?=
 =?utf-8?B?VjhoZDkwcm9sUmY0b1hYbjR0MUI4L1BHbCtBVGNoNVdKemNSc3d5MzlpQUhl?=
 =?utf-8?B?K1JwZStvYWZsRlJPZEhvb2NqdmJhZk92MGhSQkNETTJ1NDUzY2RMZ2dUelNx?=
 =?utf-8?B?ZWNGbnFCVEFjRzJMY0N1cUNGdS8rRFRFaUlJeElaL1B2b0VnYUg2cFFOZHdT?=
 =?utf-8?B?ZWZnVVBpM1BwaGNsbXNFTnVwQjJPQ1FRRTNTb0ttQ1hWeC90aFNYVXlHbVg3?=
 =?utf-8?B?M0NXY29GOW5EcERxK0M0Y0w2eWdhTjV0S21oYXpoZExmbGlKRTJ5WjFFRnFp?=
 =?utf-8?B?T3FQMW1ua2tXSm1DN0tjNFBvSno1M0pxYjhPUHEvM3JsdmJlK1l0a3dSZ2xM?=
 =?utf-8?B?RTNBVlRPRG5sVGtEZUhaQUlwRzZFQWRBTk10MGpCZktCRWRySHpNbkViaXFN?=
 =?utf-8?B?YWlPejNFcitmTDhZK2gyUjQzYVVic0FieGZFM3VqL3JWL3hPRFhKc21LODdY?=
 =?utf-8?B?bDV2ZE1ZMVhXYk5KU1ArUWx1K0ZUL2JUbm9STEpXQVh1cEY3VnIxVitYVS8v?=
 =?utf-8?B?RU1oeWVpQ21uZXRyUDJySmFKbmd0b1k0NldFU25WRWtsYit4dGQ0dVcxZlNW?=
 =?utf-8?B?YzV5ajhRaTY3UmFyQXlRbFkwM1N3eHJqWGUzTUt2a1FnbUFvT1l1Z0EzOTFX?=
 =?utf-8?B?ZTlxSTY3d2YvUFJCV1k1Y05iMFdaT2V6bm85aStKNTR3ejFRbnRWRVhHd2tj?=
 =?utf-8?B?bXU5MFN4OHZacnpRUW9vSng5NUMyaXhKVWhnWkZ2aElvbXFyVFJqRUpWMlpW?=
 =?utf-8?B?K2g3ODlKenFyRUs5Zk8welkyTVlvUThyMXQ3Z29PcnJtOHNERFhtYU5rYU5t?=
 =?utf-8?B?bUZzOHpSL3RQNk54RVoyb3dVNG1mRlhQcjNMNlp4U3NIUmlxZ3l3OFBudFVz?=
 =?utf-8?B?TGZ4b3JpYUdSUjd3WEdBeHY4YXBnZHZLTm5xbzZXKytKVUU2Qi9RZWRBZUhi?=
 =?utf-8?Q?oQVseNcdA4ONDHeNqajGnVlEh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddeb0ca-ff14-4f2e-0e33-08dca7cc9cc0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:27:22.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+nTEAsTIF3PwYeLlMMPV4pO0F7uoQ9jxMv5JCoLDxmh6u+XFHVks1fURngsx67UooJvoNU595TESQnlBVRJaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10993

From: Peng Fan <peng.fan@nxp.com>

The DDR Alias address should be 0x40000000 according to RM, so correct
it.

Fixes: 4ab8f9607aad ("remoteproc: imx_rproc: support i.MX8MQ/M")
Reported-by: Terry Lv <terry.lv@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 144c8e9a642e..3c8b64db8823 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -210,7 +210,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* QSPI Code - alias */
 	{ 0x08000000, 0x08000000, 0x08000000, 0 },
 	/* DDR (Code) - alias */
-	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
 	/* TCML */
 	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
 	/* TCMU */

-- 
2.37.1

