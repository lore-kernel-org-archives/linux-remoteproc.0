Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EBB28A72F;
	Mon, 15 Dec 2025 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765823555; cv=fail; b=ZobC84WyvOWDJG1PW9kzBYG51ZyCDGYGaB7FBiRmh3L7ia/SzB16htVkT9NLJf4TZX+9OGWexDf/D3Nhwa1qtrZu3hfxsQ/NCr87K9xQL1e21XrvXmJbECPLkyrhbDlJfotCEEiS9uSy1ePZk0wW1V5CBiYM/cXf0HV7fKScuAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765823555; c=relaxed/simple;
	bh=h6A//agmr8vE6XLxxbSu9Q65GeA9jgMhx5UPNLy4UK4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CZEGvtKbyDiHcvj7DKceUCIfTGeE3ADP1ikPvoBKC0rjwJHiD/s2O8qgAgnHzTbPBLDVrUS2390Z/tLgGiS4vFOCiKun6UuVN6nEeAtOA3g2iuOxDh4fPV9ZS1KUjxJ+T6pSWySkz27DIXnrTWwikJhr3wfro0wzwNeouZUJuYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BB71vHJ3; arc=fail smtp.client-ip=52.101.66.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BB71vHJ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBDGrPngW5bhZ2qI/QEYM1UT2wyHewblXV0qnBWwe+u1u1mGX7gWMm+Fg93NY8CZHDoTVX3Jy3tZVJ4KHs/ALCGz7jXC8oD12HGMSdOIlkZG9DY/nWz6HS5LxFz9YuLFx4/6vndVVaMNhLn8mffskH90g6oCcN+qeUtrT/kOlSYBEZZKqn+2l653HPHeH4Kmc+fg21U/Yji3yF7TMw8bBJhAs4itPoLm06aLqcKcvP3lGO5Lbpmr/r7tB43Ii3vR3d0OzNiD7jdkXgopVmFm1kSsD0HtkZDvW9TsQLfYuC5/zl71OnKY7c8t/enyB7eY/IdWqXoZVfeyGGHaSl4GDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnXQWnCgRyHXc5aF1xR4iQduieqZJyPlz2PJATJeqwY=;
 b=MY3PxIljPP03BRIV72JhCv/FXSiuAhIMC8YtoSs4yp6/NSnwLNxXbtN+SQC3GNBUfXi4F/QI8I5Kly/s8z1PDN9XIP2NofCOhaEg2t497EE8DAeTzlGWZDkmScgBkmAE3opB48IOz9uwVf9AcaVSrgL5a4Tm71K9ec1g1gBXDfeiG9i7PjSTzeEFAosGEqM90VOeSUm6rvp2yZ2hzdtyB1VdXjO5dlnHnFuxkBwsce+W+d40hvmgnoNXTyxn7FUMQuZBVY8iddcTTJl3rp+NJxtkdQgewwD+C/o6ShUyC3q2c4KTIz5vtsw3kQVpQmXumFjBsHBMjjT5pj3rbu7XCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnXQWnCgRyHXc5aF1xR4iQduieqZJyPlz2PJATJeqwY=;
 b=BB71vHJ3yvTyWYeboAR5bbwfXwAC5f8OeW2iPtHJVfby/npISGA/K7r8TnsGaUJwMrrnXkGKewv6BBv+eZ1yWW5J+X9uM6X5SgAkOpH8LiM148jj6fVNhlFv30IGqzGpHGU9gThyDNOUviigt4vOPSBV+Kf2Z8rpMlIxF3zdJgPX7kijbG69bRdIBe4J4rC2OFJWw+yXrZbOVY95cto4Rj0zNt+N19Kra8XolvDg6qN2w7D4a+llOq4cGjnaALpgg+BFVZGMm8iU7mM61Ganw2Mf+l24CVxpyHeWq9jyenjvdspPiX4aMgx6BKX4w3rvF/jMZt7vhgBpbPhoLUXK5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by PA2PR04MB10411.eurprd04.prod.outlook.com (2603:10a6:102:424::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:32:29 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 18:32:29 +0000
Message-ID: <8c00c09f-da9e-4630-a3d7-586ed29116f3@nxp.com>
Date: Mon, 15 Dec 2025 20:32:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callback
 for i.MX7ULP suspend
To: Jacky Bai <ping.bai@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com
References: <20251215-imx7ulp_rproc-v1-1-4e96cebc4bc6@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251215-imx7ulp_rproc-v1-1-4e96cebc4bc6@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0094.eurprd05.prod.outlook.com
 (2603:10a6:208:136::34) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|PA2PR04MB10411:EE_
X-MS-Office365-Filtering-Correlation-Id: 3914a6cb-2585-4512-05d7-08de3c084d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1ljWE95MzBqTXFUNkVwMWNWR21XbldXRUh3dlc2bzdPaVoxUW9wZjA2TlhN?=
 =?utf-8?B?Q1QwK3o0K2FDUzM3UDA5OC9hM2IyWHBnUHpEZFF0MklhYmZKOEI5UlNUN09t?=
 =?utf-8?B?em56aWpTUjh0bVdxSlVIN2Q3cWJBSzFxZ3d0SEV2dUVKbFpCU3pOa1k3bkY0?=
 =?utf-8?B?cGVUUjB1VWZacm8wY0hhL1ZZUEEwd0FpU2JMMFYzTmNIK0pTUklmOWJYSjN3?=
 =?utf-8?B?TE9JRjZYNmRxUDFJMzRyaVptVFhPNWhuc2dDdFFkUGpQc29TMEdvMHFUbVZG?=
 =?utf-8?B?UHZjMHV0Q1cxK3REMWp4aTJZTFpDU1FGTDA3bEJzU2lvbEpZc1RnMzl5ZFpH?=
 =?utf-8?B?UFJ5NllTR1E1bjBmTHAvUjFiMm13RStiaFJFZ2NHdHZNMHozMUs4SVlCbkwv?=
 =?utf-8?B?cm03cEU4V0hiWGJEa3JJUUVuV0RsRko4QWpaNkFneU9QMUdkT3hJQmkwdkJ5?=
 =?utf-8?B?bmhQak4ybWlSTml0R0U5NDRtL2FtckRnQjMyZ2lGb09BSUxCM3JweG9meldW?=
 =?utf-8?B?dlI1LzNiL1VPc0FHZ3BPWWIxVVM0Z2VBbUZMZmxiOW55OGpVMnZlQnp6UHpy?=
 =?utf-8?B?N1hlSXgvbzlNUE8yWkJhRkJCbktJWFN4OHdhdllJTlN2VmpjYjdZZUQvQU5k?=
 =?utf-8?B?TmlER0oyd1o2VnRsalBESFdzK29BZnR5ZDRUb3lSMmtoaVVmN1lCbUJ2cGpx?=
 =?utf-8?B?ZkFaNmg0Y0JJb2FqdTlvcitudWFpRHBNRHVYV2NwdEtXVXFFc3llcUR3RktR?=
 =?utf-8?B?S0o2L0tjZWRrUTduTFgyZm9rMUN6bjFqanZPdFZiVndyTGRSa1Y5YzlSdlho?=
 =?utf-8?B?cHNqUWhWS2pHbGpmRlFDaTk4c28zMTArVkl4YXpCeWU0a05ocFZ6a3l3NUdU?=
 =?utf-8?B?K3J1UGg2WE1JYlNPVkd0RmRjYldHTHdaL1NuWmd5WEpodkZraVFMbThGUkNP?=
 =?utf-8?B?T0FUSDNWcWY2RG4rZUs4dThSNFlialAwbG8yTzkzQ2JpVUhUUnRjR2VXcmFB?=
 =?utf-8?B?L25OQTdlQ1YwMlRJSFFDdGZBdEZhYTQ1ejJCdDdpc0VFcEFSdCsyelNtUlNp?=
 =?utf-8?B?UDJPSjAzSTFkY1U4dnVJNzVhY0lWN1dxUWsyNHk3K1J1dm1aSllMMnpyQW5W?=
 =?utf-8?B?Q3NIYWhmazJIL2x3UitxVERsWUtNODg5SkNORkRHTS9Mb3ZaR0NvdS9oTzNK?=
 =?utf-8?B?alNUNEhXejlZOW5xc1lkdGVUOXE0aE8vRVQ2WEttbmhSZWdwd25CMGxaUXRD?=
 =?utf-8?B?bEk3K1JDK0xNOEpqZFpwR3lPUjV3UXpEZ3FEWnNYajZaY0VUWENvNE5KQkps?=
 =?utf-8?B?K2t3TXZnbDBkby9reEkycDhSeXdWNDYvUUdZbmdDUEFxQU9QRXg5R0ZTeDlU?=
 =?utf-8?B?VmtmK0tNalZPQm9aWFVRMTQ1b3M1U05LN1Zzc1FMNnkwQ1NaVnErbVgyOEkw?=
 =?utf-8?B?RzBEanZhaWxCU0RySzNydmUzU2hXTHRNUzNTUUp0SnBUaWxtQVpIeUw2SHBG?=
 =?utf-8?B?N0d1bUgydU5jT290MGNJai9LaTBpQSs2OFZuMmRPYm1YWTh3UGs1bU1LYS96?=
 =?utf-8?B?MklQUS9zQk9acGI4SnF3M0tKU1dnL25aSE1PUlUvQjk4Vy9ka2ticFc1UnRG?=
 =?utf-8?B?WEpBNkNCd2RxTG9FOXNSTDdTakluNGFNTnYrSE1nN0s1d2I2KzBZNGxEa0kz?=
 =?utf-8?B?TUlKSVIyYjFzQWdqcEgvcDBHSjlMSkNjUGcxWXRoK0FINTdLUytDSXB6L3BS?=
 =?utf-8?B?c3RNZ3h4VWJjdDRKQW5RRFM4Y0h3L1lQdkF0VHZTWWUwTUJMNXlLV0pISW1M?=
 =?utf-8?B?RUg4cFloVG5Ec3hqbEt1M3JIanFuTXVPT0FEeUM3RUdxWUlkbTlDT2p0OThL?=
 =?utf-8?B?Sm9MSG1IemJKUzRBTC9kdFZSbG4zb1JaOFdXTlRZWHFxZDJKYitWYUFIR3lX?=
 =?utf-8?Q?mLoEya/ALl1yANcSra4Uq6exJelaghS2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHpHWEYreG92T1puKzFiQmEyS2lXdXFJeGNPcDdiYkhKVTBkcTJFYldDTGhr?=
 =?utf-8?B?N3hrcGxlQkhPMHc0SjQycHVuQnV2dG44YVFYMFlhRFY4WGtRUWVkUElPQzBB?=
 =?utf-8?B?K0R1RGdHaVR6UEU2dGxDRVV4eWhIS0M0ajR0ekpoRVZjWExOcXNPR3h6eVZN?=
 =?utf-8?B?YnMzZDZHL1NpMWlDRHJTZ0UyUXNnWDltaEdIR1lyaXlocUJ6SGdyRzZIWnQ1?=
 =?utf-8?B?ME11OElsT2ZiaWNaM1orNDErV3N2MEVXcVh5VUFFZmkxS3pSM2xuVDVkK24y?=
 =?utf-8?B?QVNzVDNCbDg2ZTQ3VmFOaEJtRC9YNWpVVTAvRjdxR0RTK2lZN3BTbU0zOXho?=
 =?utf-8?B?eGk1UGtSdEY4U3VIYXRYTVBqZWlCODVieC9nZDJGQmpkQncvUGd3Slg0Zk1n?=
 =?utf-8?B?NDcwOTNFb2pzVW9WYTdPUzdVUUY4VHZBS0NGSHBzNVB3Szh0ZDA5VzRiUUN4?=
 =?utf-8?B?bnBvbzdxd2pyMmZLM0dINVNpM0YvYlQvaDA3Q3lPTEdBNllOYU9ucVpxempR?=
 =?utf-8?B?cUhQMSs4eDlIcVZiOFJkM052YUw3b3hHMEZnVGNEWVdaK2kwZ0RPSmd5dzFL?=
 =?utf-8?B?Mm5EVUEwMUtNQytqdDBXY0NiS2o1N3BhcXpnTUxLMllET2NRb2s4bUVYYWcx?=
 =?utf-8?B?TFZIZkNOd3JqcktLMHRwMlV0NXFoR0RyYUR6UjZrSm5jL1l1djFRSm4remVL?=
 =?utf-8?B?V3ZiK0ZhKzNCb3hoRDRQRHVKS2FUWVdCUk1DOTRFbTZpdXFIV20zdTFpYWU1?=
 =?utf-8?B?ejcxeWd6UjY2OEpmb0diYUhVekF0bGo4ck45UmlJK2kzTTc4aWFvYUFZV2Uw?=
 =?utf-8?B?cUtramRJc1BacUhvRTZXM05jenVwNmNDWkd5L3BWY0ZZb2lKSjBpRElFSi9o?=
 =?utf-8?B?YmUzM2FIRTNyQTMwMDd0NGhqUktlL3pIR0s1NzljSmdQY1NUU2k4dEJUaGdk?=
 =?utf-8?B?Y3BnNU9xU2U4bjk5aHhCaTJEOEFLcWV1eTVDNVdWQW5hcEd2dUhLUlpVTDg2?=
 =?utf-8?B?VDBna002QVdhNzRtQUk1MDlwZFp2QzRVWkR6eTZZU2lBbld5ZTIvK0dObk5G?=
 =?utf-8?B?WHNDb25XMDBVdUg3Q2c0Zkw3RE1mOVlXOVpsN2hTK2FqRlRkMkd2NTBHUFBD?=
 =?utf-8?B?aVlkZ3Vtcndvb3FDLy9wUVRKV0M2WGs1U1dqc3pnTkx5SEYrNHFIUjNSN0JD?=
 =?utf-8?B?dUIxbkoxak53SXR1NUFDKzhITmlubWpLUVltMFl5VXV5TDgwTEMyaXF3UGdM?=
 =?utf-8?B?R2NveGlDM1huVUdBVmllNVZBTHBQenhMeFJIQkpiRk9qcTZLNnVOa3poMnRD?=
 =?utf-8?B?SXdJZ2Rta1VhTTZIc3A0M2hCdlM1ZFpkNUQreGZjeWQ5aGsvSnpXaWRpemVh?=
 =?utf-8?B?QUZITHIydFBMdHdRdmFKdTdzdG0wbmF1bTNNWHBrSXlzU01yemhZcy9BcHh3?=
 =?utf-8?B?d0NxNUsxdDNFMjRrUWI0QTk2cDJDcVpUcFEya2ZNSnhqcnFKRUh3dkY5Y0lq?=
 =?utf-8?B?VGVKZEhBRjR5N2lHVysrdjJBVjlSakRuSUhTSm10UHFwMFVveXVxb1hvSS94?=
 =?utf-8?B?QkNwdzhFWG1MNU0xdTFmME9uWTZlZ1R5TlBkUkxrSWlMeHRSSGZoSmg4OGxa?=
 =?utf-8?B?TVlNUFgvc0RpeHFxbmZBc3A1dFdkN2ljTkU3MlE4dmVPVSs4TWtQdGRHYmIy?=
 =?utf-8?B?blV4dXNLRVY0WGFKUTVWWFMzYTdCS3FXUVU1Rzd0TG5ISWx3VFhORmNXREVo?=
 =?utf-8?B?cFhhUmo5SmRCQkdPTVVGb1hJM1pqalE5MFJhWkVqbjFMRXNFRGxpd0s4R3N4?=
 =?utf-8?B?cVNwM1NqYnpnT3BTWUF1bHNjdEl3NVB3enNNb2Y3TFpaL1NoL1BzMm15Rlhx?=
 =?utf-8?B?S1FJYklMdnRKbTlLblEwTzYyVms5Z3pCTExDWklGd3lsSUpiMVA5NTN2QVJM?=
 =?utf-8?B?RC84L0RvMVdGNSthNERCTktJZWdvM1AzT2VHeWRVbGY4N0ZNRmNvY0ZzYlJX?=
 =?utf-8?B?Yk94UUp4Rkx3L0Y3NXBGa3dBbzJtLzFyb0dDcDNBVFlFOTFMWG1aRVF2b24v?=
 =?utf-8?B?akdYTnVHTFd2d1lGV3lyb3U4MTc3T0VrTlVBQVljcDVmZ0haRlY0azZtVEVS?=
 =?utf-8?Q?ybxRE0CDzQrMJHgQVN1TwacP4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3914a6cb-2585-4512-05d7-08de3c084d7e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:32:29.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTCMV7twxVMP1q1zyeq4JG995WIXoJlBk2iPTfH1T/jKm352lJwcZjIHYBb3mt+AG9/EyvUUvi0lLUXaNUcb1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10411

On 12/15/2025 9:26 AM, Jacky Bai wrote:
> On i.MX7ULP platform, certain drivers that depend on rpmsg may need
> to send an rpmsg request and receive an acknowledgment from the
> remote core during the late_suspend stage. In the current imx_rproc
> implementation, rx_callback defers message handling to a workqueue.
> However, this deferred work may not execute before the system enters
> the noirq_suspend stage. When that happens, pending mailbox IRQs
> will cause the suspend sequence to abort.
> 
> To address this, handle incoming messages synchronously within
> rx_callback when running on i.MX7ULP. This ensures the message is
> processed immediately, allows the mailbox IRQ to be cleared in time,
> and prevents suspend failures.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>   drivers/remoteproc/imx_rproc.c | 49 ++++++++++++++++++++++++++++++++++++++++--
>   drivers/remoteproc/imx_rproc.h |  1 +
>   2 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2ccc789dd40508ec274000ec09978..1127c56388fd94f296c80db5c01a5d431d669c4d 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -22,6 +22,7 @@
>   #include <linux/reboot.h>
>   #include <linux/regmap.h>
>   #include <linux/remoteproc.h>
> +#include <linux/suspend.h>
>   #include <linux/workqueue.h>
>   
>   #include "imx_rproc.h"
> @@ -111,11 +112,13 @@ struct imx_rproc {
>   	void __iomem			*rsc_table;
>   	struct imx_sc_ipc		*ipc_handle;
>   	struct notifier_block		rproc_nb;
> +	struct notifier_block		pm_nb;
>   	u32				rproc_pt;	/* partition id */
>   	u32				rsrc_id;	/* resource id */
>   	u32				entry;		/* cpu start address */
>   	u32				core_index;
>   	struct dev_pm_domain_list	*pd_list;
> +	bool				use_sync_rx;
>   };
>   
>   static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -725,7 +728,10 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
>   	struct rproc *rproc = dev_get_drvdata(cl->dev);
>   	struct imx_rproc *priv = rproc->priv;
>   
> -	queue_work(priv->workqueue, &priv->rproc_work);
> +	if (priv->use_sync_rx)
> +		idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
> +	else
> +		queue_work(priv->workqueue, &priv->rproc_work);
>   }
>   
>   static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> @@ -1009,6 +1015,38 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>   	return NOTIFY_DONE;
>   }
>   
> +static int imx_rproc_pm_notify(struct notifier_block *nb,
> +	unsigned long action, void *data)
> +{
> +	int ret;
> +	struct imx_rproc *priv = container_of(nb, struct imx_rproc, pm_nb);
> +
> +	imx_rproc_free_mbox(priv->rproc);

Here you free mailbox unconditinally.
> +
> +	switch (action) {
> +	case PM_SUSPEND_PREPARE:

When switching to sync mode, any pending work in the workqueue should be 
flushed to avoid processing messages twice.
> +		ret = imx_rproc_xtr_mbox_init(priv->rproc, false);
> +		if (ret) {
> +			dev_err(&priv->rproc->dev, "Failed to request non-blocking mbox\n");
> +			return NOTIFY_BAD;
> +		}
> +		priv->use_sync_rx = true;
> +		break;
> +	case PM_POST_SUSPEND:
> +		ret = imx_rproc_xtr_mbox_init(priv->rproc, true);
> +		if (ret) {
> +			dev_err(&priv->rproc->dev, "Failed to request blocking mbox\n");
> +			return NOTIFY_BAD;
> +		}

If imx_rproc_xtr_mbox_init() fails in either case, the mailbox channels 
remain freed but the function returns NOTIFY_BAD. The system may 
continue with freed mailbox channels.

Only free the mailbox if re-initialization succeeds, or ensure proper 
cleanup on failure.

> +		priv->use_sync_rx = false;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>   static void imx_rproc_destroy_workqueue(void *data)
>   {
>   	struct workqueue_struct *workqueue = data;
> @@ -1103,6 +1141,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
>   			return dev_err_probe(dev, ret, "register restart handler failure\n");
>   	}
>   
> +	if (dcfg->flags & IMX_RPROC_NEED_PM_SYNC) {
> +		priv->pm_nb.notifier_call = imx_rproc_pm_notify;
> +		ret = register_pm_notifier(&priv->pm_nb);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "register pm notifier failure\n");
> +	}
> +

The PM notifier is registered in probe but never unregistered in remove 
or error paths.

Thanks,
Iulia

>   	pm_runtime_enable(dev);
>   	ret = pm_runtime_resume_and_get(dev);
>   	if (ret)
> @@ -1202,7 +1247,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
>   static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
>   	.att		= imx_rproc_att_imx7ulp,
>   	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> -	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
> +	.flags		= IMX_RPROC_NEED_SYSTEM_OFF | IMX_RPROC_NEED_PM_SYNC,
>   };
>   
>   static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..0e3e460cef4ed9340fb4977183e03143c84764af 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -18,6 +18,7 @@ struct imx_rproc_att {
>   /* dcfg flags */
>   #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
>   #define IMX_RPROC_NEED_CLKS		BIT(1)
> +#define IMX_RPROC_NEED_PM_SYNC		BIT(2)
>   
>   struct imx_rproc_plat_ops {
>   	int (*start)(struct rproc *rproc);
> 
> ---
> base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
> change-id: 20251211-imx7ulp_rproc-57999329239b
> 
> Best regards,

