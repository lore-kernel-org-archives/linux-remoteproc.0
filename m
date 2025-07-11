Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE1A1C5F2C;
	Fri, 11 Jul 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752220490; cv=fail; b=Xwhrnj+lIaHmbhkBfqZjS7qhmXVb/AON0l7/8uZ6+Vemy7PfdTdiu10V+RIsZBVuYsDBsk9EHi9jChQjLzk8E3NvzdBMoQFOF7M9ORp6470GAv+do2xEBtvvQopSulDCbUOeb8b5FgJWrZPkNAedikla1CmiBQ65/iORNJE5WmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752220490; c=relaxed/simple;
	bh=/nCU113I4A9vktXHTU9a3h4FNP3KOW8paIYV23AbMRE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VwmjLNR/F2Rv7ZOo4GAuWwHAI+8wOsZLdc8BofGBJjVs7CmLNz7IFbJ4SaK4rLl6QAEbLD0U7uJWN/pugHm4xkJ2ob1pTQuMS5GTFzGBzmrDukrjp1SLvfV2J1Z2CxtdlQ5JfLEL9MDljKD/2uu+p8KkV7VHoIXoScIC/f5fS6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IKR9JrYg; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IKR9JrYg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/TS5bCWXfvZZ5L62hGG7Oc1vauALwT9tQGZXm5z7XBlTdbWaGm6SjmYBV1w/ZC8zYGcNeqSWVSXhTUTdhzXS38oIwBY4RLBTRto40xyJvxrvewTaKszQtBCdcZ8oy0KNsoq0U3rEggJIuvtbTFq4zSgxPkeUFRwhHYv7/UWk0gpgKyG0423JhnfHE/m2GO7c8kVGYqeUjEjQLvPYgii/tqs64nOQzPGmqw4ywAdd27ffgRjeYWSG0Up9VhMWBfDCAtxwPSFBOHlBrjldqyb6eIEuhU+dgnLLU80EDiufu8bojK7sZO1cAcbhDWM+NIIsVz1wOcCumyY3cuVqXe2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDWDsBwoUQT91boUlemzuOV1XcbJCJBQPx69MBrkmgs=;
 b=OoVX7jcLtZ9wqlAPauJlEiLKWJ1RF2Y0zXW6mh4Sc4GtChG/YVxuf0BZqdx15ooZWnBmstMUoXm2Ix92sRfShvLtEdiySdm8rX+ouC1LjKcahWyL+vTRlhoK8vyovk4F4DuIu7rn7aC2L4tdmK3OZ8pdK/rakE+Z120HCMIZLiTtUt1I61XVrmeWSi+5uszPVcxLeoUn9MhP+Y4cnjL6hL++r4Z14lKZ5zpx/inyC49JJMtQouWWfmQ+zAxo+q8vxauz8L6LewghElmODBo0Px44PkmCaq0aNvqZFUL77R5s9shjD8NNREUJZGc39/zoPZev24ZVfg07TkPdCG+qSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDWDsBwoUQT91boUlemzuOV1XcbJCJBQPx69MBrkmgs=;
 b=IKR9JrYgY79bbtGl7nw+mH2iVM5s8t2g/XnlGkMa2rNkdin28WP3rWlwtcEqVffWvOqhuDC9aSZQC/Qtkfh+CqKUDM94WunMeL6PcXMv1Vc9/E7b+pq5Mfj0WaxY7arw+IW6pfjZyrevWV9cUoBI4RtIokVm3TX3Pgzy1p+MbnttkEwZG71eA01NqYfuvSj8xS7ArUjFMuQMSTun45wALp71DfElcqvE+12xUCOvB/KDT1GQyca6E7lUd9aPvpc6tq7uDRrXbLTKT7AudwjWnl6+7x5gT+S11qtraO15wLAntQebyRC04ck0xVH7ByhDvJva9ZcrjRCXOW8Lce360g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by AM9PR04MB8922.eurprd04.prod.outlook.com (2603:10a6:20b:409::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 07:54:44 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%3]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 07:54:43 +0000
Message-ID: <71b45ffd-b554-4369-b988-860bdcfe4ee3@nxp.com>
Date: Fri, 11 Jul 2025 10:54:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery
 process
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, daniel.baluta@nxp.com
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com> <aG_SosukEqUxrHvH@p14s>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <aG_SosukEqUxrHvH@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|AM9PR04MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dacb592-42d9-4297-6fb9-08ddc050326d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3p3ZE9NU2NwVldRb1ZNWFZpUUFpcEhWRjRVTzQrUG5aU3dtVEZydUlUenlK?=
 =?utf-8?B?ZnNhYVZSZkRhdXZPZHAyOCs5OHZYTWpoQUIvQmxVZm43dFRIVjVrY1FBU3VV?=
 =?utf-8?B?ZTkvQUxuOGFQUlU0cFRIU0FIMDJTN2tvOFN1dEN6U2QrSEJaQXJmTHExbkFG?=
 =?utf-8?B?NFp6N1BEUnEvOWt3TmVYQkg3a0ZlWmtEcVMvdzBMMEZtWDREb3daWGMydFlo?=
 =?utf-8?B?MWo5dDExZ1lSNGpZWW4zR0M3elhWdzB4ekRHR3dmRStERU84MytZZmhwR0sw?=
 =?utf-8?B?bmNWazBtd1lnSUVuMzJabkx5bXVTclU5TmpMWEViOFdNNFRTV1dFeG91Skg1?=
 =?utf-8?B?UnlabWNWdUxwQ0JSOXlja1BxSXhGU09CRDNNaThpODFVU25BK21BeXEzSzZY?=
 =?utf-8?B?OXZ0enNBcTBrQW9wRm4zZmE3UjZwVmlQa0ZucjBsbzR4bHczb3JSWDU2UkR2?=
 =?utf-8?B?OUlucHowQzlBUS93bGRQOGRKQ0NNcjNiRzhkNVgyYVdNWlRrL1EvZG5yQ1Vj?=
 =?utf-8?B?YUR5MlA0clNOeGcyT0VzYW9JYkVvL2hNalRqTWg4TVpDemhNQVlHZHNHazNE?=
 =?utf-8?B?U3cvRmpTdUpXRmxqeVF4NFg0Tnh6ZnNHTHVhcGVtRmdhYzNrY1RjSTJPOGE0?=
 =?utf-8?B?RVRGcm95SG4vNDEwRFBrVlhkSi9jMUU2WE5lWEdqUkdCYkdxOEhiUlc0aW5y?=
 =?utf-8?B?K0Z1ZmQwT1lubnRSRkFhdUlGdExpL0NDM21JS2pjNDcyRGgxcW5RM3E1WHNl?=
 =?utf-8?B?SzR5K25lSGFJYWxkdlFHU1FWUHk0YTN0T3dJU3I4Lzd3WTJVZURQU3FIMU5P?=
 =?utf-8?B?MzFKTkFsS096U1dxT0VSL2RMS3Rxdm9SQjlQczBQMVRQU050b082dnlxVFht?=
 =?utf-8?B?MCs1WnpocU1Wa21RTG5DU3NMNjltcWZpdU1jVlErTlFvVnh5UFFhaWg3enZV?=
 =?utf-8?B?VVQrSDJUN0hIbWc2SXFMQWtVa2ZvbmJ5RXNnMVh1R3BoaUM0cDFPa2Q0OE1m?=
 =?utf-8?B?eFBDY3NrRXY0VXF4cy91aFdQSm1lcFhhalNqS0VzbUVmSFhVNlduVUptQlUy?=
 =?utf-8?B?cXlRUDZVeXRHWGgvRndNMDRNQngzdHRKU2lFQmVkSDhtcnpCL0hYbVE3dWdi?=
 =?utf-8?B?ZjlOZFpiZTBXWWJ5ZGRrOEVVRFR1TzlNWUZwNlJNT0Z6QitRRFdWUU5RaWVZ?=
 =?utf-8?B?UDBzNUxTSy9QZTB2R3lPdXNGYWQwSFdZZHJNaVprZFZHb24ydE1GWnUwNm4y?=
 =?utf-8?B?Uit4MWRkZDNJd1oxM2IyTXFBNUhra1A2Z1RRNnFtNkEyc2RmNTlEem9hUitY?=
 =?utf-8?B?djlDbnkvZERaUGFGWTBMOHBaNzNuczBwS05MeXB6RTk2em9TYk91cmFLTEVj?=
 =?utf-8?B?UGVSQ21UdGJVa0JhcTJ2SHdEV1hub3o1MkJVNzI3M1NlRTNEaGd1UUZ6SGV6?=
 =?utf-8?B?aXRUcnRTMkdUYlR4bVRGT2lLcEd0NW94Wk9wcXNJNGtJM1diazIydHhpNEFS?=
 =?utf-8?B?SjV3K2RLL045OUZRWldQam5nSlJCRXpUVGNkamQ0dmozd3BoY2FiYXZjNzZN?=
 =?utf-8?B?c3FkN2huZk9NenJwYjhEa2ExNDFLM2ZwOE5Ia3pQZFVYNmRZUnpXZ296VEtJ?=
 =?utf-8?B?Rmk2M1daK0Q5YVBEZGVoeXF6dHhuU2VzM2hqaE4yU291UHE1b1l4UVp2YkNz?=
 =?utf-8?B?MFlRRE0zZ1Z2cHNlMU9oQUM1aTJPRHJWUk9raFZiSittTitjUjJ1dHVCMVA0?=
 =?utf-8?B?MjlDQW1ZQTFlRzg1V3R3cnptSkFkalNycEdCZ3h5ZGtMZEllZDVtK3hoelVI?=
 =?utf-8?B?ZFBMYlFqV2pjY0R3WmNRSEtkSU5RWTJRMUVNbm1Jck16Q3VpcFM1MFlUU0pD?=
 =?utf-8?B?cGRpaHI4ZHEraUR6NE5vR1BFd2xkQm9CbWU5d1YvbTRwamdzTE82QUVSMzhl?=
 =?utf-8?Q?4h+O2P0zeQE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L21YejFac1JiSjJpVEcrazR0MHdpKzlNZ0JpV3pUTTRDYlZ1K1BVZjY5VEtE?=
 =?utf-8?B?Y0lhdWpYb3FEUWV4cmgweTlNRHQvU3hmRkRsbGt3OVZyaVFKTHZzdTRUR3N4?=
 =?utf-8?B?VHZMUUFlWktKaWx1anpTcHRLcWtiNmVEcDNCTHlrN3grTUxCdFRnN3duSTFH?=
 =?utf-8?B?SzdPUkVtckVHeHhpWiszVTBSNU1wQVFJcTBGcVBTZ0Z3dUpyZnIyc0VYUUlP?=
 =?utf-8?B?a2ozZUhnbDBOMmNSOWFwTEpsMUdEK2Zhb2lucThnbTRqRW9meExadjE0R2to?=
 =?utf-8?B?LzQrU3NwWXhvZDJhNXNNNHFQODZzS1F5dzFwMTFLQlZOdVQ5eUJUbzRKZFk1?=
 =?utf-8?B?SnA3eWdSak1IcHdVMThyTjc2L1ZnMk1ydmxYTmEvME1PbWJTbStqaHRJOHUx?=
 =?utf-8?B?bDIxVk96MmU2RVpyWE9GWHRjWjVrcGZ2cXdpSExBTFFVRk44V1VqeFRtMklp?=
 =?utf-8?B?U1pWY1BZOXlSWE0wM1JEMDRFMTV4WThpdkEyenJ4WFJKYndNYUtwWXBBUmhx?=
 =?utf-8?B?Nk5ZQkM0UUlmMm9PMzhEMGt1WlROMGlOdThRWnE0dVhoRmphZDU0WVRlMEh0?=
 =?utf-8?B?TG1EREc5NFVMRVlLSENwa1N4QU4xWHhINWRjYXl6Slo1SjBDUkI3TElHbFhK?=
 =?utf-8?B?TmMxd1lJRUhpZDdrRGR0STdNV2Y5SUR1Yi9BREhOQktsSXlWZFhBTnhtc1lR?=
 =?utf-8?B?SzhnZmhiTFdDa0kxa0Frb0RLVTNtTHJyWWlMWTcxSjZPdTNrbXJiakYrRjIv?=
 =?utf-8?B?RHJnTlRISnBkaGdSUXJYOXhlK2tka1ZuOENZUmVYNDNCc1FYNCtQQTFvNWtp?=
 =?utf-8?B?bzRuWldLdWJIelp2MUdkeCtNSlcrYXh2bE1pU1M3QTFIRHZqNlU2cGtWbFk5?=
 =?utf-8?B?Y28vb1REc0s4VHl5bzRvcUozcUJKbzJVeXhJa1BoYjd4ZGVlSG45RDk1V1lB?=
 =?utf-8?B?UTNYa2V3RG9xaGVDL2VzbzhleWNvb04zcUhHL1BYekxSQkhZKzNWZHBPblpa?=
 =?utf-8?B?RFlacmF2Sm1ibVovcUlKdWZveXpzaTlaSS9QZmJFenl3UnQ1bkVHREl3dVdk?=
 =?utf-8?B?eHdoQUhDTG9ybmhpaEUwTGRyOGNISHE4ZXBWWndkaFlqdkZTY0tsem9CSFFZ?=
 =?utf-8?B?NEg5T1pTVStKQVlxcWg0V0FTM1lCS1FBWkJpbTFZcUVZRW5BUW0vZUpEczF5?=
 =?utf-8?B?dnVYS0poZ3pSd1VTaGJ3RGozUjRzQTRidS9ZeHJZYkdOU0crWlFuSFBCNGhD?=
 =?utf-8?B?OU5qT3ZZR1Q1aElYSXBkS3JvTkFHQW9UU1J5Qk11R0d0TGhrc0pJcTV6SE9Z?=
 =?utf-8?B?SjNsTTNhekk0UnlrNHlFYVg4bGVjc1p6T0tvd2N6aGp3a2FPK3R1YlRCRit2?=
 =?utf-8?B?TFpBbTBVa0kvK3llOG5ZYXdEMWRmbER5bkljQW5MaEhKMG4xbTBoT2xOa0RE?=
 =?utf-8?B?UmlQMHFBOStFL09jYTNRd3FKemd3b21CVGlBdzlCckFiOUg1M1VHTFhwR01S?=
 =?utf-8?B?YnhTZW5sZnBWMVVZdnlydE1KTkZQNjhudE44Z2Y4UUhZTHNaZ2FDbnNrVUJP?=
 =?utf-8?B?SmtsSVNDcCtMRkV1N0NDV3FnK1JEYUNabzFPeG9qMzF4SjZQSS9qWEdxR1po?=
 =?utf-8?B?T3ZOK1A0VGlQd0wrelJZUVUwNzZxMTRiNEZkaEZNWXhVNWtrK0x3WklrNjcr?=
 =?utf-8?B?ekVuVU9xUUkvcTF3SlFKZG5jYThNNkJzam9VdnYzQVRtUGdQTnF6ZmVmNldy?=
 =?utf-8?B?Z0Q1aGFMOWFrKzRkZm1oOUZTNm41czFxbit1U0dGY0NiMTRVaElqM2FXRUxP?=
 =?utf-8?B?SnJ3VFdZZldqaDFpSml1eU5NdDBUMU0wZkJzWnVVNFN2ZHhjUG9RVG5ZTkN2?=
 =?utf-8?B?aWJqL0tzRTZ4RXVwa0dIbDlnVGV5T1ZrYWdSYy9aa2xCQ3JBWnVocHdsem4y?=
 =?utf-8?B?cFp6LzFWYkthdGtKZjQ4QzV4dEdXUXpXeXJBaDBzZlp6ZUFmN0kwTCt2Skxl?=
 =?utf-8?B?ellkbjdqNzBtVEllVlE3K0trSU55Z1NsSmNpZlFTeVpXYVNtNVhIUFF1aWVo?=
 =?utf-8?B?cUFuWnptUFozQWVpTXNTcFFqK1k5SzNKTFEvWlY4eU5QQzhxMUZzZE5zYTVJ?=
 =?utf-8?Q?jBBSNnO92GPTRobfRxt+LRCW0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dacb592-42d9-4297-6fb9-08ddc050326d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 07:54:43.7594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEUxhfus8GMhnwQTjSM0w9o0/DevTRy2v50rrj1iXWbvWmirtV/wWx1MsZr+SZKahNPxEAPlzlgdUdwJ3dp2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8922

Hello Mathieu, Shengjiu,

On 7/10/2025 5:48 PM, Mathieu Poirier wrote:
> On Fri, Jul 04, 2025 at 01:25:28PM +0800, Shengjiu Wang wrote:
>> When recovery is triggered, rproc_stop() is called first then
>> rproc_start(), but there is no rproc_unprepare_device() and
>> rproc_prepare_device() in the flow. As the software reset is needed
>> before DSP starts, so move software reset from imx_dsp_runtime_resume()
>> to .load() to make the recovery work. And make sure memory is cleared
>> before loading firmware.
>>
>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>> ---
>>   drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
>>   1 file changed, 27 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index 5ee622bf5352..ba764fc55686 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>>   {
>>   	struct imx_dsp_rproc *priv = rproc->priv;
>>   	struct device *dev = rproc->dev.parent;
>> -	struct rproc_mem_entry *carveout;
>>   	int ret;
>>   
>>   	ret = imx_dsp_rproc_add_carveout(priv);
>> @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>>   
>>   	pm_runtime_get_sync(dev);
>>   
>> -	/*
>> -	 * Clear buffers after pm rumtime for internal ocram is not
>> -	 * accessible if power and clock are not enabled.
>> -	 */
>> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
>> -		if (carveout->va)
>> -			memset(carveout->va, 0, carveout->len);
>> -	}
>> -
>>   	return  0;
>>   }
>>   
>> @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
>>   	return 0;
>>   }
>>   
>> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	struct imx_dsp_rproc *priv = rproc->priv;
>> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>> +	struct rproc_mem_entry *carveout;
>> +	int ret;
>> +
>> +	/* Reset DSP if needed */
>> +	if (dsp_dcfg->reset)
>> +		dsp_dcfg->reset(priv);
>> +	/*
>> +	 * Clear buffers after pm rumtime for internal ocram is not
>> +	 * accessible if power and clock are not enabled.
>> +	 */
>> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
>> +		if (carveout->va)
>> +			memset(carveout->va, 0, carveout->len);
>> +	}
>> +
>> +	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
> 
> This is a much better approach.  During my last review I said that I would not
> move forward with this work until Daniel or Iuliana provide their R-B and yet,
> they have not been added to the recipient list.
> 

I will have a look at this patchset at the beginning of next week.
I also plan to test it.

Iulia

>>   static const struct rproc_ops imx_dsp_rproc_ops = {
>>   	.prepare	= imx_dsp_rproc_prepare,
>>   	.unprepare	= imx_dsp_rproc_unprepare,
>>   	.start		= imx_dsp_rproc_start,
>>   	.stop		= imx_dsp_rproc_stop,
>>   	.kick		= imx_dsp_rproc_kick,
>> -	.load		= imx_dsp_rproc_elf_load_segments,
>> +	.load		= imx_dsp_rproc_load,
>>   	.parse_fw	= imx_dsp_rproc_parse_fw,
>>   	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>>   	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>> @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>>   {
>>   	struct rproc *rproc = dev_get_drvdata(dev);
>>   	struct imx_dsp_rproc *priv = rproc->priv;
>> -	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>>   	int ret;
>>   
>>   	/*
>> @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>>   		return ret;
>>   	}
>>   
>> -	/* Reset DSP if needed */
>> -	if (dsp_dcfg->reset)
>> -		dsp_dcfg->reset(priv);
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.34.1
>>

