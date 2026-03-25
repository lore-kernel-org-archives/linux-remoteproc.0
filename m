Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACAA33ADAE;
	Wed, 25 Mar 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427923; cv=fail; b=DGmxXlgP1bMWc8UpWBKftmXzDeRmW3Jg9ZKvv06eqxjHETD0Z8kyZxLJYwQ7TgfFEFgwJXqJg1xPDaWYIBQmjZ6ZBiTlFBywxqiVq0Qqg2SF1E4gTlOfnxqHb7XEpg8DCCaRDcToGFbJeUbM7GTsienaGXbqekswo5UzmbbaJ6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427923; c=relaxed/simple;
	bh=DtfpLLKkDJNhENfwYZDjKcbmmDmRcANF2t4zdrCJHso=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ard0iN0bDbXNtZHCxNQAGAY1bvfH4sRq72X8BgsLcY5tlvPOjLuSB+0BSbY9w+NwcXZVdwqX+RQ6bNxpzjW36rLHEhdB3I9v5MQBsKAFAvbsis7Zn3G/IKGDvbkPm3bT+/Q1Cem6z3mHv+LfzQXhaw4d4dich3zLK3v0w8rE+j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qD4qSFbn; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qD4qSFbn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahS/r1upF7jl2o2fbTRmLbcIsUCSSWM4lF7hT0N+RNShuj5cv7mZFrF//7+HB4xqCCE9UoNWZTq2mZcAAMnXS2RhZp8O8PqrqYTxRGutHMrb6bspqTeDyVIuA5g2R6o/LkW8Ek1fLS3B60XE4jtiISLLLExvAWug2lZXKagwV0muBvuNHl/wWqDA5JMN7/OiQ+BOZHB1mSXSXI8h0Uzdg1tve2jGzqPLCjLtuo9qDMmpeMEmGDrfg7QeBQDsRwY1qZ1reFvSTJCehK4HipT8209rmVSC5TsVtO729RTVJi/RtxY4/sSOh1YDW5WF+D9FB+YC3GdmuDOpQjCGfnFF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPzfXns4gRv8hNT634QOr2rL315muN1QSz4pFBtttb0=;
 b=b7vUa6MpwI0qBziH2kl0LH2C4iiHpQ77j/1v9PXyu5Gtc8Wn6SUND3jwdxosQSFURNRKVA9KEVGwmHXTjGRX16gz/vw/SVZ5NA3cZmbmjhohVjbiO0O6NR6CUzpazBFs1SGkz3iHH9RJ+HgTv70zoRG1iNfSk6jdPo37aiG6mupsqxAVsDtEqg/64LVmlDYwoyiuj3zkWsZDDEhHPXlEMzChruEdy29APLarF9QJL2dP+vxJuGETcd4wv7KlB4ewmg4QNOUIcAru7ErXAHXRch/ZzwtDVST/Dq3BDbOuhWn5BM1capfL/K/EmX65xhXZSJ+nKIgUL50sQoZCtBddng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPzfXns4gRv8hNT634QOr2rL315muN1QSz4pFBtttb0=;
 b=qD4qSFbn9n3017dUHBfjk6Atqo9pUsOHcRN5pLSrfySSkZQeVs4KERrnONIydfKGHG/79m04BCPhJRe4DrEq/9kZm3PEJWlaChDZyjTsGmDd2Ou8O8XVm9V+S6KcOwDx50nBFisPXhkBlMyP3JifWjjJo/ruMsu3qKn3h2SrW4xh5C3XESCSkhOaioSoosuhKMyowgM/rUTT2+7KMrIEjQCswIujjnZYfa2QpUl4x5VoAOugHp6pvg74tCndqerRtAlcrSzHL5FP4Yl31yQQOVtabtIEX0Hbkxjv0cpOKBnjKO3Gpci5UJqxYo6mLAQPPp6etAGQYkpcZAVugtcyzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8102.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 08:38:26 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 08:38:35 +0000
Message-ID: <80c7815b-26d9-4876-a44f-3e17b6338dc6@oss.nxp.com>
Date: Wed, 25 Mar 2026 10:41:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add i.MX94 remoteproc support and reset vector
 handling improvements
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com> <acFPGVNOornxsPG6@p14s>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <acFPGVNOornxsPG6@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: e871546c-fd3d-44ce-957c-08de8a49e751
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L5gdAFOOHYiOHV3JLmySnGASiNAEbB5T0ovA9NviGf5t6YbQm+EpFwr0bbmtpNSySx81YcEQzR2DVSw7v3VyPXNvvjcRVCgbS7niKRwasMZRzEIzFlznz7oMeZ0qodpN2ZkJuU9/E7qcaluHA7ZymwNYQukcIXPzd0JLfKSnya6pnxBgJKPDFYIe1Xl0JfzQnWRbnt7uoVUkrVyaQL6HuNtR1X3a37+YhCrMhAe3Vb40JBl6ErV9ka8sZO8eSLYtnXkYJ2vDN0ovGcDuExrbCHVBTNj8MJ1A2itIt97JDWMzy8kt0A+lnWILzIC75E9msVqOjMmTIKpv0I4FRLsz4qcvqbFj33Qeib77+3CtRd5QILnKdcGAvC2jUdNUZrHGlakoXvj0Dl6/Wp5uPon5ikZVD3lJ01PLIQA0CDOAjGmA0u9FN7GWM29KJLbn1FfPi9cjuR9Og1zWvIXtlgo/Wg0Gs91DnTajnowiq0O08x5pKjSDHr0FfYt/Dqmal2JNA8kgGiPmPtD92siSNcuSUTSOmLitsO9gdniYGXmpIPGAb5llXQ8A5XVIIgbWd+wR4CqXnoZ69BzfG7J3FE3vwgo22JSEHUoo4Pqdp27yK5JZJztieu4AAG2vR5x3JuxCVAvvScnhfff3cB3AwACmmSp9MOzw5p9veCZb9fExpHv20gaHdbV/YQ1oLtcgICIu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFdIKy9oSTJ2aHJ6Zko4NEVxTUx0N3RTMFpnaTZTR0dJWENpU0pTRHZoazhm?=
 =?utf-8?B?UnUxQUNJSXJNT2dmSmpvSUZVNnhwQ29XQXdkeTkzWlZKTnpKNGxBa0V4S1NS?=
 =?utf-8?B?VElnZnNWcWZzbFRJRHR5RlVCUFhVY2ZUTk5nR3FCRUc4TnFTZHVoRytOMUp0?=
 =?utf-8?B?andvVmZ2YlQzVkJ6ejcwejAwUHJPMDdhdnd2NitmVVE2ZlBGSHF4QzF1aDVv?=
 =?utf-8?B?ZUtsWUNNWVlqU0l6Mk5yZ0JFQ09IUElzKzg1WEY1KzEwa3JZaUtXZitlNEg1?=
 =?utf-8?B?eWEySENPSFBhMkU3R3k1WXl6VStGeEgzQ3RML2RRdExGY2MwMGFjZngxUnJB?=
 =?utf-8?B?aXNJY1lJZ2RtSTdheTU5TnBTSnZuTkV6STlNd1ZZdE9wayt4K1QweGkxZllW?=
 =?utf-8?B?aHNRaVduVjdZTExFbmRrbGxJcjFEWE1wdE1mL3hHVWFXVUNoTEtCQitNdWUv?=
 =?utf-8?B?Z2JtaTYvWExYSXBWZHM3bEhQYjE4TDducDlZSExoZzZadWRWVjhnNWdWN0Zp?=
 =?utf-8?B?VXN6QU04anRnSkNScnNLZEpmcXl4Tm5aeGh3aEJ2a3NPdHBJeFFrSXZUaHVE?=
 =?utf-8?B?MnliRmFkakJzamlSV1VQQWJuMXlmbVppSWZrdmxJU2w3d3F2WFpmdFgvMmZ4?=
 =?utf-8?B?bnF5R1JSdHAwcmdvU3JyN3QxY2YrcmIzVklFa29OaWFwNGRHQWEwWmkrVWdD?=
 =?utf-8?B?ZkN6L0JNUkhRQzNyNjJVbVFtQms5elJBOWVxelZmUzVFSDM4RkpmSy9ZalMw?=
 =?utf-8?B?TDk4bDNlS2ZEeUZ2cnM0SDcrNCtLWTF4SjdFSnRKc3FGY0dvcjR3MDFFN3R1?=
 =?utf-8?B?ZktCTGpVSEpxMUR4cFlYYWd0VCtMWjhXdys1Vi9yOFo3ZmtBcHpNbzZreFFt?=
 =?utf-8?B?SEhjYlJvdWxyVFF3VDNhUU5oSW9EU2JzTkZFMGxRd1AyUHU1eEZudHpZNE42?=
 =?utf-8?B?aW5ONEh2QzhXdHErcFNwOG9nU21WeTY5eUN3NjJod1BjZ3hqMGgvN0JPSlJ2?=
 =?utf-8?B?QXhNbUwzZk10VG1NV0FKUHNXMHI4VFlEbHlOb3JrL0p5d2FCWGprTVlQZnhw?=
 =?utf-8?B?T25NRGtyY2NEd09CWHdYQTY3YWg2SEk5amtjOG1xenBrQUo3eEszLzN4bFd3?=
 =?utf-8?B?MUZlTWJsVG5OMDErQkhrVE10RDdYcHA2b2hoQklNSWFJdUJpWjVTMUcwYWJh?=
 =?utf-8?B?c21XT2VaZzc1bXVPMzNwT2ZDRFdRczdCSkJKMDY0R2xmVm51RXd5R3JQQkpi?=
 =?utf-8?B?c2EwTDVzbHpNMHJoUFBCV21aWm1KSHBBelFqR2RHMldJZWJqYVBZR3NESFdv?=
 =?utf-8?B?VnZ4d3FBZHowRWUrSy9OZFJQaXdJd3dqekYyUVRGWmgrUkNKNWpTMWw0S1Y0?=
 =?utf-8?B?endCcm9kUllpSXRGZGo0czNITWM4OTBKeStwNEFGVzArNzVIZURmemMrNVdT?=
 =?utf-8?B?Y2lKOXFPNExLcDBTMXNaWVZiVTFaaVdPSW5vSHR5eEwxKzc5bisvaEJyQlJ5?=
 =?utf-8?B?VU95S3UxRUdjamNpei85N0lxVDZvRGI0bG4wMXVKVGRrWVBGMjVwek0yeXdV?=
 =?utf-8?B?NWNCMFNFUS81RWZ5bjJxU3NNWktjNHNoQk5WczFmbzhOajZMZmhUdlovbkQ4?=
 =?utf-8?B?VnZCdUpCZ0VEUGl6T05VcXZSTHZNdEpqRnlLWEw1d2lEYXAyNG5aMDY3SUN5?=
 =?utf-8?B?dGVrcXZNT3MwUU5ULzRlU1l4dEl0Ukh4N3dCS3ZRV0JLNjBmbCsvRU5GVWl1?=
 =?utf-8?B?VTlKNktKeFRKS2RXTU1ycERRbzB3dmNHKzZZS09GQkppTU05V0N3RzR3Rmx6?=
 =?utf-8?B?R0ZyaWhLL3RlbEgwRGpGL1FNWndsbE5zTVZGMjBoUWRVMzU5Y1RKMUVpT2hO?=
 =?utf-8?B?eS9CcGsrZXY5VkFKeEYzeGM0L1BoeWRqOUZkSlNkTjM1V0lPOVlHUm0zZHEx?=
 =?utf-8?B?bk9WVFpSL0hBclE2L1pna3RmMnN5MnNnYlc0d2lWQk5ZZFRlbGpLOEJURS9C?=
 =?utf-8?B?VFRlWkh1YVpjWUp6bGpzVEFVRU1sMVpMUDNTTFJrVFpjTFNCZ0hWSEhkcFc4?=
 =?utf-8?B?YXRhV0l4SjUxQko0QklGd1A0OWp3VTV0QUxJbnhoN2REUGlRYmNKQnRpSXV5?=
 =?utf-8?B?UlRNMENsZE1qQWhPa1lvZzEzcTB5bUlzVS8zbEdZMG8zanZ4SFhVMk1tdk1w?=
 =?utf-8?B?TGxUMTFqYlJYKzFpOTZtNkQ4T0tCMFR5ZWUzUlR0dEI5QmxVUEc3K1l0aSts?=
 =?utf-8?B?dVFPVzVQeDJHdTZibUZXUDBXbE9ackxSenJFd1d3RFMrUEhSRldrQ1lHUjFt?=
 =?utf-8?B?alp5SFZqM2haQ0VJNm9XUFNtSW1DYXpnSzFpYUNpTzVnYThQd2tlQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e871546c-fd3d-44ce-957c-08de8a49e751
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 08:38:35.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vs6yunTsFYr4URzbd8g5OAHv7Cw1OA83PPZC+cNrPqn5olrbZw5dSbwEUG6NVgFYPLHAWaTDr6kqHOr4EuHFzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8102

On 3/23/26 16:32, Mathieu Poirier wrote:
> On Fri, Mar 20, 2026 at 11:19:06AM +0200, Daniel Baluta wrote:
>> On 3/12/26 14:36, Peng Fan (OSS) wrote:
>>> This series adds remoteproc support for the i.MX94 family, including the
>>> CM70, CM71, and CM33S cores, and introduces a new device‑tree property to
>>> correctly derive the hardware reset vector for Cortex‑M processors whose
>>> ELF entry point does not directly correspond to the actual reset address.
>>>
>>> Background:
>>> Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
>>> table. While ELF images embed the entry point (e_entry), this value is
>>> not always aligned to the hardware reset address. On platforms such as
>>> i.MX94 CM33S, masking is required to compute the correct reset vector
>>> address before programming the SoC reset registers.
>> What happens if the reset vector is at 0 and the e_entry point is at 0x800...?
>>
>> In this case masking will no longer work! Can we implement a generic approach?
>>
> I will wait to see an R-B from Daniel before looking at this set.
>
> Thanks,
> Mathieu
>  
>
Hi Mathieu, Peng,

Patchseries mostly looks good to me. The only blocking issue here is how to correctly specify the hardware reset address.

I see two options here:

1) Create a special section in TCM that holds the PC/Stack initial value as concluded here [1]. But this

doesn't work in all the cases 

2) Add a per device data that holds the hardware reset mask that gets applied to entry address read from ELF.

I'm fine going with option 2) and that's because this change is IMX rproc driver specific, it scales well and will be maintained by Peng.

thanks,

Daniel.

[1] https://lore.kernel.org/linux-remoteproc/38476dd0-07a6-310f-1fba-2b3021a5b007@kontron.de/

