Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4117A309;
	Wed, 10 Dec 2025 00:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765326284; cv=fail; b=DlmFph7g7cziVyB774G1OJfuZwC0rX+m7g+z9aazo+EN9TE/8bdnq8Pkhn3+RvrUQMBd34Qk7OKdiSeeVf13KkycJJjghRbzFo0/NNxKR2k4qYVwCVCPv3+V3TU81T1qY0Nqz9+iOYCR7rUIA1vgW4LzxEUtKKS/bMV5l1dNq/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765326284; c=relaxed/simple;
	bh=yUm6qPTkBfrTgdNRv4zF+gcPFisi/MwdA82+gFrlxqE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jd40+nAGtMVznUpQzjiab4NogiZ+g/XcwLhB7haPGKeztDMrk2QvnAJcuElBTc83l5qePYj8He2Im8NR06yWrQU/J/D0xp0nxKxuGkedB+QZOF5GC7Wb9sZ+grV2+zaqre6u4hhK+dIAuIc62Rm6YXhWW5en93ello+0jxdlPvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n7Q9GV+n; arc=fail smtp.client-ip=52.101.66.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n7Q9GV+n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NN16ip5eYbZGm+Tha9SNJYkb1OEu9v6o+X+X21DOIY34xESCA5uIiRINOh3v/jn8Wx2q7uHp2JDd0Uy7onIru0cXyBrPuG+K7yxvNo7V5paquj1A50md45dmrtp4EY00UA4W29JFiGH11OvhAg2m52Q2htKThFVl7A1y+nhbRhRDmKBIGdXk0DFXr7G7w/r5x/GAQEbkePdNdkpSSOFCOoQQo83a9IBX7sVQNoK+loyL/oEh/A5FmFMgh+zNW8/BRZQig+AS+SeemJNCbxjAaSB12qRxxArFKwJDYzkCsd0NeJ3EgTxNuTWEllToJiWXHBSLuP2nZ0wobK6wzaYkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK6bOaKu1qT/CQhXKcwlCTRYhysyGD1Xb3NwvYYLtOg=;
 b=vxSwDgX7L+9e63XgNW60vu1qIaNyjFD72Ha9E+Pizzm3Vemr+Jqnde+I3FxM+DDqmyUYsvuCNm3qzl/JzmZOiaMU1NgyJU4cAeeW6ze22rhZGhSHY8BPjmv5AH667N1qY12oLZT+QthjmhBsJbNUCg2UBARlt2IiQ4GVkePBM5NQMgOtItiBwi/PiYO3eHwRm+VHAdOaKIbwskLh25buv9Pp4SYtmEy7TGLks6CzYxjSe6fpjZ3JVbpZB8yqmawVBEGN3rg5vsRTv92W7s6/bOZObgPZMTnCKvTcaIL60vkNFQQarCxJ93Do8pqJEgYUMVxSH1ZVYpO5BsTGQieqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK6bOaKu1qT/CQhXKcwlCTRYhysyGD1Xb3NwvYYLtOg=;
 b=n7Q9GV+nZwCf0do+VGnj13Js//1w5HTVminYpSUjntGF4oDKgMBrv9fOq+IjGMhnBW1g99xnEugjJ+EBtbUfceYP3eIEzVTWJajId++9FC2/NvP6EZ/1RmZ1R1XxifWCG3r0o9SJlHxcmnTJvzLKNFyhY06j4vmuXKmKIyRZjDGX/AaZ/zKoyhTL8zBvqlrBspy39Jla25FQBYbsc2pnUlalI9ltEdOJFddCkVBmgcB7UrA8PMNpMwvzG3AH8V1PmM//BxFs9GrNvi0Xb0KOQNKGMy2Eg5RzqDFcpB8EYjuuZn53ONHXJwqD3qLaGao3ZyQSUIWNscxmfQO3aJ8EDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by PA1PR04MB10891.eurprd04.prod.outlook.com (2603:10a6:102:489::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 00:24:38 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 00:24:38 +0000
Message-ID: <091a4f29-5435-428a-9a1c-ef82465211cb@nxp.com>
Date: Wed, 10 Dec 2025 02:24:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] remoteproc: imx_dsp_rproc: Fix multiple start/stop
 commands
To: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: m.szyprowski@samsung.com, shawnguo@kernel.org, kernel@pengutronix.de,
 festevam@gmail.com, arnaud.pouliquen@foss.st.com, robh@kernel.org,
 geert+renesas@glider.be, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251209140425.766742-1-daniel.baluta@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251209140425.766742-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::34) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|PA1PR04MB10891:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e66bbe-51f2-40a2-4f79-08de3782811a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ei9ISk53NkdLUHppU1I1eHRxMmtDSmVmVklWRE04OVF4Zk90ODBRSlZVcXFN?=
 =?utf-8?B?UXFJNHJmeVE2dlNpOXdDYWNtaDdweDVwWU5IeU9kWFRhc2hET0grSkRTQ0ty?=
 =?utf-8?B?c29FWEU0Ky9LekpYeUlVM3daOThqb0lzQitUUTBBMXJuUVhORSt4WjZIYUN1?=
 =?utf-8?B?N1BDT2JEcVZmSU92dzlOaWQ3Wkp5ejhPL1ZNNEx0Z1ljKzFTbm5iODlvTTRX?=
 =?utf-8?B?MjYvMmUxM3RlL2llZElwcGVzVHlndEV5QnJ1ZENYQWJRZ1Z5cjRtbG1oakZ1?=
 =?utf-8?B?cmlkQUVkU1NCWkNRQUs4UUpsR1l5N1JOZ3BVZjJ2WWEybmtFOWNHNGVEeGRl?=
 =?utf-8?B?S3dtc2pzVVBvUSs5dWpxMG9IVS94dXJtWkt4ODBhVnhjT1BDVHNzK0I2NUlV?=
 =?utf-8?B?MXRiR2JTRlJDQVlwb2xoNEF3TGVGTWRLM1B1VUxCZ0pYYlZEQ2tzd0RUWW1a?=
 =?utf-8?B?dGV3WDFvdlNUcUQzc0grK3BXWDdDRlp2VDFVTGZMK0c0enR6S0lmTUNWM1ZS?=
 =?utf-8?B?UEg5QlJpSEZ1R05UVThQRHlUcUZ5bUErNjFxeUt5NXF5QkNjRmtFSDZiTHUr?=
 =?utf-8?B?dTBZRTh1bi9LamhWOGZKemxnRmlRR0lJTXdzdjJrSFI5eTZQYVRMQWc0ejZx?=
 =?utf-8?B?dnhRWjZlYmc5QUNodHRSZSt4YjloV1duZTR6cjlDQ0Fkc0Q0WmM2cjZvbmtz?=
 =?utf-8?B?UWI3Rit3RmdiaEZiM2x5S0JvOG5zajlEQnNzR1VWV1pLWnYzQkUzUmUrVy94?=
 =?utf-8?B?aFp5VVpydmpoemNkZWFrc3hBZ0ZDSjQyWmlCajJpRTQwVHlzT2JXUnNZYzQr?=
 =?utf-8?B?VjUrQ3paRjEzRGRQQi92ZG42NE9BN0srNFRhb1hwa2xITlorMndtb0IrNVY4?=
 =?utf-8?B?amVORzh4THpUQzBKUTBsK1ZNaE5vZEZHWXlzbms0SWkwRHZMOHNtS3c3cWpl?=
 =?utf-8?B?eUlCOE9iRGVkN3RscXRZL3RCdldNaHllMFowM2Q1RFBiSTYwTyt6UHJIOHJw?=
 =?utf-8?B?cGVBZi9zZHdna25BejBlQy9WMENXelNFaVA4V0VZUEpmVlBCK2w2WUZyaXBj?=
 =?utf-8?B?SVFCckJTcStLaTZlalFvWTVNOXNrc3N0N2syazE1S1EvMUUzaXk1UTFkNUZL?=
 =?utf-8?B?cUkwVzY5N2xsVlQxTDhsZnI0SkZtTllQaU9EenBNeFZFUDFaL3B6alVpMHZk?=
 =?utf-8?B?SWlhMzBScWhzc3BNTmtwZlFOQmVwaXBqNENsRzNsc0xHNStzWTBOUHRFWFNU?=
 =?utf-8?B?aWJRYTloWk5qSXRsRHAvaTJyUHJtbUhJWXNkais5ZytUeTk5Ym13YS9MYkZG?=
 =?utf-8?B?WkZuaDNzZDNhSFVMdEV2WS9JaWFkQm1kTGU5Z0V5TXR5SzJ3MEpDSWVEOUI2?=
 =?utf-8?B?YUs3RmFibk5qR2JBTTdVb1pLVE10dFJBSHZUTTYrdzRqYjl2N2paZXVuODlw?=
 =?utf-8?B?TERPb1loQjNxRXIxVkNVeldLekJ0ZGRTZitERndSN3c1bG9hVnB5RmdaTklF?=
 =?utf-8?B?TkFqaU53TmZKUmFneHFLTXBPWCtTbnpjNHBzeE1tZjJrQnNZTFRuNDI1TzFE?=
 =?utf-8?B?R0RWOTNGdUZYMGQvRXBIelg5bFAxeEhhTW9PUjVzbXhpcitlbm5qRHF0M28x?=
 =?utf-8?B?aGk4K2pUMlhibmFnMzV1ZGtKM0IxZGtzSjA1cGtBWi8wRGdEVkpCdU10OVJJ?=
 =?utf-8?B?UE1nTzRyWmVoS2ZuT1FiSW5zUi9iTW1VNVlwMU5TTlpweVdYTXZnOXF4Sksy?=
 =?utf-8?B?NFpKaFI1M20ycFNncCtiZlRaVlYya1Q3WFdrUFJiNmprTjRXeGJQNEhVKzR4?=
 =?utf-8?B?Vm5wcjlQNXczWDB1Q3VNamFRUnh3bVRQWGVPNGFSMEhCL3JFdkNxSW9NQjZu?=
 =?utf-8?B?RXVTU2llNlJla0pMRmFRT3ZFZk96RTBvWDM5bkpWbGgrYUFoMU9PSnZuVENK?=
 =?utf-8?Q?tNQHXM4Qijp9sH0C3HMi5IrjsQQA4LOx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVUZnBGTS9nbEVYUjBJVjVtYkJRTS9yQjNvOTAxNkZuWDZDWkFRcjBudFRF?=
 =?utf-8?B?ODFTbXRMV0xiOEdQYzFJQVYyVHBNa2VJOGNUbGZNNXdiL0s5Y1VSVWg3YnFz?=
 =?utf-8?B?eVJEQnRENkw0RnI1MU0zMnFnVDFqd1NzWUFQclpDTkJEUCt4VWxEVmVUeGU4?=
 =?utf-8?B?eXF3ak5kQjFMK082cDQ2cWdNTlZpc2RlZkxvVnJQUzR3dC9abFdWemhTY0NE?=
 =?utf-8?B?cEorQWptV0hvS1BUcmwvRzlzZEVTYmNsMUFnSk9lNG1Ib1dBMnpEYllCUkxz?=
 =?utf-8?B?cnhNVzJXQmdWSC9MRHRabDRPMU9vZGVQcEg5TVVoL2s2Q0hCTThZTE95eUEy?=
 =?utf-8?B?aE4yMmtyeUFXNjVtcTVGWDZNcEwrd3pHVU5UV3BzQVBNU1Bwci8zdmlvL0RM?=
 =?utf-8?B?Q0h3N1g4ZDJudWZpY3NMdHB4NW4ybDlRR0lHSk9VT3FoY2dWYjZOSHNvRUNV?=
 =?utf-8?B?ZEZ5cFZoUUdwUEtMT2pQV21FRE1mY0RiQkJpZ0phakVHS0poTlAvbXNrQTlC?=
 =?utf-8?B?QVE3QUd6cFFIREJ2Q3NqaEExc25NSm9XRUl2cHFKVE5SOCthQ2t6bGUvOEdB?=
 =?utf-8?B?a2tUT21wRU1KMncxVDdURUpyM1RlNzBHZkh5aFd6UHRSU096VmhrdTRJREx2?=
 =?utf-8?B?MFlycWJDelpPaUFOWmYrdnZpRjFwbklDYkhOdElnL1ZHMlRVS3E2emNiY2tT?=
 =?utf-8?B?aGRUcWdSd1N3czRlZ2dFYVFwdzNnUFpydVVnN3U4YjNtbEdmaWk5ZUFsVEpD?=
 =?utf-8?B?NUZXUmZmdkFxTDFNaEtrZDFsMmxBSWRxajNua3hOWkFMT29makdLUGY3WGN4?=
 =?utf-8?B?d0hHSS8vcEZFZ3NzTEI0TWl6dDkzTEhnclNVNjhacCtZZHdtNGEzQkZubTgx?=
 =?utf-8?B?NFUxK3BkVzJENkU5dkdVc2ppaW9EUEhJeUUvOVhkUzBpWTYzQ3B3NVdHVE1E?=
 =?utf-8?B?dUJzVjMxVlRLdmx5TEFoamRwdzYvL25zR1FRSS9LMy83NnBmdk5JQ0daSS9p?=
 =?utf-8?B?bUUwYWNRclhveWVFb1NlRnNBcFp4ekMrYlFBVEFwT2UyT2FmNUNHcmtKeHFY?=
 =?utf-8?B?U0t1Z3cvVHZlQnN3M1pFbEUxc2ZQeWFwZHYrSU1yWXRTV0locFpuRlQzMERt?=
 =?utf-8?B?M3VUMUJ6REI0KzJTbmRKVnpGTWZobzlsTnhVWExZRDFXTDVIcUFWKzA5VTF3?=
 =?utf-8?B?Nkx4akRQZndQWnY0VWFDbTNKdmZHWmgwSVJkVWd5b1p6eVVlc1RwRTI5cmxX?=
 =?utf-8?B?NWpVbmZKelhLMGdYbzZDTFYrbWcvMFA1aUhyK2RJM2k0d3NuQ0w3M1lNVVd0?=
 =?utf-8?B?Z1Z4TjAvTHNaeUhqS2FzWUVDTjgrSUVLdWZKQnJOdENIWEY4ZitKMTViQnB4?=
 =?utf-8?B?SFcvVXFzckUycWRQS0p3OXQ4eTlmZGRYMjR3RlY3NHlKK3RacVBLRXBWeGY0?=
 =?utf-8?B?dFdoNUZ3QjBhQysyTXVsTCtGZHNidmJjQkxUa05udUtGeE81OFJiVFFhTlIw?=
 =?utf-8?B?dmV4YjltOTBEaS9HYS9SQVptZE5nTE5KdXNnMEhuQUNIYzk4cmJuUFZpSWRp?=
 =?utf-8?B?MDJuZG0yOTR0YzhwZE9VanplaldkWWxpRjkwbUdweFdNL3V0Y1Q0d0RqL1ZY?=
 =?utf-8?B?bU9oR0VHRDhzSjhNQjVwZVArdFVpNlFmQTZQSTdsY3R0YUJRT3o1Zjh5MC9G?=
 =?utf-8?B?ajBiU0NlcE9OTk9VRlVZcUw3Q05EbGU4STU2YmRUc05jR2V2cTd5UU5hNkxy?=
 =?utf-8?B?dXpydTV6M1hkOVZIZzU2MEwrVUIvNlViL3NneE5WWlpNbHdLcldUZjZBdjJF?=
 =?utf-8?B?YllHbUFNUkNmS1FRODZ0SFR4cjY4WjRWVlJDZ0dZdVJoTEptMURmWTBhQk9p?=
 =?utf-8?B?dHhuL0RFVkg3VHIwR0ljYVBlSU9KTHZqNVFRV2hOQjhWUnM4bzJPc3FudG1P?=
 =?utf-8?B?NHJZUUxMSW5WcEFhamVyOTc0QXdFdUFNcVFlSkY2Q0QyT3VKSDBLdDVRR0NN?=
 =?utf-8?B?WTBKRDNxYUF0Y3E3TG5DY0dGMkhCTThFRUtnVS9QNVJ4MnpUN21jVDRLcThj?=
 =?utf-8?B?Rlc3WFRod1FsUFFVOGZBZ3BPSlpjMmM0cDRsWWpKcWppM3FsdWF0M01ZV0g2?=
 =?utf-8?B?U3BvdUtydERXVExrQm5uRmlKVDkyaXNNOGd4QStwenJsU1dlZVFGZDZuRTdJ?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e66bbe-51f2-40a2-4f79-08de3782811a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 00:24:38.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2xaUefenZ9GtCeOs5nqJg3OcLyudBtV9JPsjDXCkpUQbnjjmPDhBEVlCSbetvM3/RhLXtte7eENTFEd2034Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10891

On 12/9/2025 4:04 PM, Daniel Baluta wrote:
> After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> functions for "memory-region"") following commands with
> imx-dsp-rproc started to fail:
> 
> $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> $ echo start > /sys/class/remoteproc/remoteproc0/state
> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> -sh: echo: write error: Device or resource busy
> 
> This happens because aforementioned commit replaced devm_ioremap_wc with
> devm_ioremap_resource_wc which will "reserve" the memory region with the
> first start and then will fail at the second start if the memory
> region is already reserved.
> 
> So prefer using devm_ioremap_wc as there is no easy way to undo
> devm_iormep_resource_wc manually.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>   drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..79d5c15319f3 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -709,10 +709,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>   		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
>   			return -EINVAL;
>   
> -		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (IS_ERR(cpu_addr)) {
> +		cpu_addr = devm_ioremap_wc(dev, res.start, resource_size(&res));

While this patch technically "works", it’s more of a workaround because:
- it removes important resource protection;
- it doesn’t address the root cause.

The real issue is likely that:
- resources should be released on stop but aren’t;
- or the mapping should happen once during probe, not on every start.

Better alterntives:
1. move the devm_ioremap_resource_wc() to probe() and keep it mapped for 
the device lifetime. This is the typical pattern for remoteproc drivers.
2. use non-devm versions in start/stop callbacks:
/* In start callback */
cpu_addr = ioremap_wc(res.start, resource_size(&res));
/* In stop callback */
iounmap(cpu_addr);

My vote goes for option 1.

> +		if (!cpu_addr) {
>   			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return PTR_ERR(cpu_addr);
> +			return -ENOMEM;
>   		}
>   
>   		/* Register memory region */

