Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC327A105;
	Tue, 15 Apr 2025 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715101; cv=fail; b=mvxm9wOT+YjfegTVx2XfTmKrGMZqjbZ42noGJoR3EvrsKyJLwadVxiGbcqy9baUxf96t24qEac7Fa1g1MFYW12awpvC7ptIkeurLr1z/epGwiODQ6qOQ/SbztWZ8JhD9j86VizmDlFXitlIa09mglCNIKeDVJztEZ87sFsxrLPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715101; c=relaxed/simple;
	bh=0tAyiUiRA+zu+oWHfhGfgk5h9i9d+KAo9dU3+dFLgtU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RfBy7MO79iU9zXGCvq73splnE8PZK+5bcXBNU4ZYytYpd5bDR4ynCq3S2/cQyVol2EihcVAow6/FtMdPTeo2kWwPImYiJuOIdV6L4vn5fhDU0i/LKUAp7KgDMsHfphYr6r0iq2nFqasL1d6moymvdrmho/bfPcc2pMwR2I4pjgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EqrtoiN6; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EqrtoiN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azkzLhLhm8t4biiIKtDnIyncf9q2lMIvzIYyRrHd+OqD41sQWPlwPDFXQ325D1hAUq7Z0Wj0PsXoHLp1Xt+A2l1YP2rb1vERizvRelNEGNb6Mp7qsocmeX8Kl+/Jy1qsa0it60jzK1AfqQBilqznISXBFUsZ2tQdtyXng/9+IVOw2Mwyh2knunSw+kPatXIivsacQY+jbPDDQvj8JZ9gkYbS3/MPYNiGwT5/2RfGH+5yJ8oVFDFpoGsFyNedm1dn3K41k6uq4BUNozaLzf9oFggQ/+SXQnUD3f3/sUBJ3KFhifGwG6LmgZMfs0szzg8EVESG5PbWWK/g5ixEMLwZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YSoyf02DUx4TMq53rrIUgo8aL4y0bmzBEsSu0OPgKo=;
 b=W6j/KwdD847HJGEaiJq4VKmzVyoSMuohi9K67XTfRe14BoFwxz1p98fNL2Y776nr+Qu0KXFaADOGkczXCxnRVnZYBoXWmDKzdSDjzg+0fjv/nKqIFAaNvbEdiywAXC4anPuWUFWWDnA28wzp8Bimq1BcepwVkU/1/SKX06r0y0fwVsHDvTusVH62bzD8gJNYy5I26IcfFCb1MNc+bHalZyWDfspLSTuQUPPgYZ+tEehCaHZhK0Dyf1zTC0HBWUko1S3UTQZVi8i3aqkTQ7HpU2Kyu+uFLhkvQ0BtpwU2iyYAzsTIsrallnomJMdGTJQmBpJ72f0VfMSjFjLjMucq0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YSoyf02DUx4TMq53rrIUgo8aL4y0bmzBEsSu0OPgKo=;
 b=EqrtoiN6mMbToJ2EsC3CREOv4lsnbM8OeAdRcspaD3pOCH57w4/elRSnCX5JSjuNnO3todvv7IT6l9d0Bao4ztt0V4c+dSVCImDeg2XRD5BxrOktH0rbgZkY4u7ko7LwoMmHYEoOUXivcjqgeIqrxh5yw1LeTJqLz27rXHof3jUUliU59MEIHrPJl6oBZQEPyqtROB2WrDjs8rGZyEH8uttUf5Tc7txnWABj+bwtfuVr7FsMXUw4lp4GUTNqZMnSYQw8+L7h7QBNvyBpCA3ww75t367eo5pehC1ncE5oVPdFGZr3lauE5F7xfnKkayd9VkEGLLU5uW6L2PVWyf3CyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DU2PR04MB8918.eurprd04.prod.outlook.com (2603:10a6:10:2e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:04:55 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:04:55 +0000
Message-ID: <8116ac27-4c2e-41a4-9e05-7d20a7c6a361@nxp.com>
Date: Tue, 15 Apr 2025 14:04:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, "S.J. Wang" <shengjiu.wang@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mpuaudiosw <Mpuaudiosw@nxp.com>, imx@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
References: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>
 <Z_0snwzpkPTJqjWX@p14s>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <Z_0snwzpkPTJqjWX@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS4P195CA0039.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::15) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|DU2PR04MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 04446b35-9f70-47d0-d2f4-08dd7c0d5a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjYzclVmSTJMOERvWk9obncwM21EVmg3ZEsxTjQ5K3FsVUpldlc3QVAxM0RB?=
 =?utf-8?B?bkorRnVmcHF2YVF2dzNXWWxpOVordThWZVRGT3V0ZHhmNEFlSmptQ0NVSGtX?=
 =?utf-8?B?MDBWTkNTNmFpNGh3VUNOdXVaRkdvVkRna2E1bFROMzhmUUxVUTJqb0NWN1pi?=
 =?utf-8?B?QUhST1RWdG4zU0k1MGd3SzYvS0NBZlIzczhza2hudHVnL1l5MS8wd3ZVQXpH?=
 =?utf-8?B?WjUrc1RDU0tIZFA0Q1RWd0Z4VlFpQW9ycTI0QU95RFR4SUgyaGlETkZnMThj?=
 =?utf-8?B?K1dZazd6dXI5SWMvMXdMRExGai9iM2VXWWdiaHNGaUJvYXV4STR2RjdDNHIw?=
 =?utf-8?B?L2MzamNrKzRNV2hJcHhPbHE0UE4yV3I3NkxmdzA5YkdnNmZDSnl3Zk0vWExy?=
 =?utf-8?B?Y2dHeU1LM3o1OElvbkdhUzZ1bDAyOTB6dThEOEdzM3JIZEZKS0lVOE55TVhT?=
 =?utf-8?B?dnRoTUtQclV6UGNqeUFGbDRTZXBpUFFnbVFuSkliN0RVRzlHMzYvc1NJM0Y2?=
 =?utf-8?B?VjhlWjJYVFNqWmx3dWVRb0h1YVpFNlBkK1lJUEtMcDU1VmpiTDVsK2hrUEYx?=
 =?utf-8?B?MXVFMmxTYUpnbXRmYXhBM2RFZlptYk5MSXRZbGE2Q08yK1RWRzB6eUpmYWlv?=
 =?utf-8?B?RndPV2VIVUhVbmVTVlk3KzhZakQyaWZxWnlvTHMzam4yNU15RWFWanNKZG9u?=
 =?utf-8?B?UTVoSDd6SnFyb0RqYTZlakxUWGlQVTZrUTNUZThmK1JmdTZxNHhEL0VXTFF4?=
 =?utf-8?B?OEV2cUxPNnBMKzZ1WFY0eFJRUm9wUXBJa20xWkdzVmx0VE1ocW1JaXBXVFJz?=
 =?utf-8?B?UEJkUkhyZWxiMzFNWDhVYlZRR3JrelRPdkNIamtyK2FYSFNIa2FweURCdFUv?=
 =?utf-8?B?YXNTQTA5cnFrSW1OVE1sY0FQQ28wNVVkWDkrekYyVlZPR1NoRWNjQ1kxWWpw?=
 =?utf-8?B?MGVVZWFXbFhsNnFxa05scVpxMHdnZVd2WnI5YmtLZkVhUDN1NEQvYnBEb2l6?=
 =?utf-8?B?UUo5aGlPNjBmSEpiWVR2em93UGxTcUJhOWMrOUg3Ymp0REZHNzBmOEJzVUM4?=
 =?utf-8?B?L215eVJpSWhQQkNKclZtOTE3blM3d1Zuek5QZDFWVDZyd3RDblIwOU83UDl3?=
 =?utf-8?B?c0o3dlYvNjlkeXpnNDhIYlFYRXpmYXZvRUh5UmpaZ2w5S05US1M3QnZaekVB?=
 =?utf-8?B?YzFYN2s5NDc2eFVDTlRpbDE4UUtLQVBRL2sycmhwZnByQ083akVVVk5lQ2pG?=
 =?utf-8?B?cXdqK0tiWDFxYTJCWEJ4UnV0UWkwaEVTMHA1bXo2M1N3OExxZVFtY0pkV1lR?=
 =?utf-8?B?dU1rUVpDZ2h5WXREQTJkNXc3UWYrTXhtbHhya1JTUkp2a2E5djIxalhveFNI?=
 =?utf-8?B?Z1ZDVzhvRVlzQkF1b3k4R0h1VnpwVkZjK0lYeGtveUFaVk10YldhS1V4NVAw?=
 =?utf-8?B?clVnbjFhNFpKeUUvZi9NU0pkSGNjLzRzcFp6N2JRQW9CNnRjWlhoZ3hyOGwy?=
 =?utf-8?B?TG1jTmxNR2cvQjIzQkxCaXVHbXdkMDkwOGo5b0x3Q0ZlQi9ZOXpXYVVQQXFt?=
 =?utf-8?B?ajM2Z0xIYVhhdm9FVlIyZzZFLytPSzYzYVdUVWRvZmU0aWlQTndPNFdweTFT?=
 =?utf-8?B?eCtUZ2R4ZDA0ZXNKaG9aRzJwbHJUemxnNm1DcXpONk96bEp2WmRhckdla3o3?=
 =?utf-8?B?N0dBUlhhSUpvZVpQdFMzQlArUTFXU0U0TDI1TWphKzg1KzZnekl2UGZVcXQ2?=
 =?utf-8?B?RVduT2FwWDRHZGhTWkVFM1Y2V0pidEpNbDVmTmh5aTNCWmlwMjZTbHFRdFRF?=
 =?utf-8?B?NG1HR0V1R2IxaUFZeUowSXRqUHl1b0ZWQzFTQkUxcmplRVVNMndsWHlxWmZj?=
 =?utf-8?B?MGY5Vnh1dzNXKzFlOEc5elNwb0F2L0VWVFh5ZTA3L2pOMlVtbHFKUFg5U3VR?=
 =?utf-8?Q?Iv1y/BLcycc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjBwT20waWZqa3lSclZBMVY5TnVDZVp4dTlSRmduOHorZ2R0T3pvMXVVLy9N?=
 =?utf-8?B?YVNybytaQUhEbGd2dFlDQXBtYVFXS21vVWxUUUp4ZFpieTlXU2xKWUl5Y1pM?=
 =?utf-8?B?d24zMWwrckdTVG93VElUVi9NSldqQUllNVVQbS81dDdjclUxQmt2b2pSdy9Y?=
 =?utf-8?B?V3Y1Ymd0T1g2eERoQVBCZkc5bnNyZjZYRm1oYTdDWERlckN6a0twM2dTVVVY?=
 =?utf-8?B?QlJVY2xUdkdmYmNXaWVOMTRVcCs5MHBoTlhLQ2ZtNEpyN3BzM1ZEYUQ2Tzc5?=
 =?utf-8?B?S09XVFJTa1FaOTlDd09YckZhNU9PdzFRUHVKdjB4Z3NmWVExOXdkNUpRV0VL?=
 =?utf-8?B?VXpXaVo3SG44TWhQYkZHREFRMmc4YVUzcHNXWXdjQVFjQ2dHdUxlRFFuLzUz?=
 =?utf-8?B?MW5FenB2bE0yeGlpNHUwMksvZ044VVpOVHNwTTJ6SEVBSS92bW5PZ2JqVUNn?=
 =?utf-8?B?Mmt1QXZHTVZOeFVjZUJOOVJaMEFVdUhBS2RoOUlCd0ZCMHpVY3FYdFNSbzE4?=
 =?utf-8?B?MVFObTFLN2RkYlhvSjNhWjM5WVh2MTFBelhLSGNUN1lvb3dKV29obXRlZUxv?=
 =?utf-8?B?UWppVGZCV1JjaGN4ZnhRaXdRa1NHbDNNRUZTZEpvakRuU3kwSUpjY2VHNDFm?=
 =?utf-8?B?SEx0eTd4eitqT1dKU3JWVmFxODNOUE9kYVE3VVlJUEhuZzh6bXVTQnlMeEtt?=
 =?utf-8?B?ZW1mbnovMU9nTzYyMDhlUmRoWU9TclR6R25ScnNuRzIwTVN6dXdnc0FaVWE0?=
 =?utf-8?B?THRVa1FLaVJyMFU2aThMNEZrdC9ialVCTUNqcWk5VEVJVDNBTnREcEhpSXA2?=
 =?utf-8?B?czZpWm9ENWRGNGpRTDF2cGFEa3pRZlJVMDk3bTY3aVkrVTVHTDNkaU1mbnFL?=
 =?utf-8?B?NjR0aVQrbzl0MHlqWi9mdEE5TllldlRZNDJ1MjlLRG5yWWFURHNoMjhKK3Vo?=
 =?utf-8?B?MTBGdjJwOVVqVTBvVmJUcllDME41dmgzNTJiMGZMblpZQkhsdkp0UUtpSVF2?=
 =?utf-8?B?QzlmVVM0ZnRNbDZjQ1BvRDZWelVVOGFnRC9HY25sNHRQM2RSVmdZOEhGRGdV?=
 =?utf-8?B?ZjZ0OEV2NGl1TFpZeXIvWmNUczA2UDZwWFlza1ZUZXRlYUdZbER0S1ExOEl1?=
 =?utf-8?B?dSs1WUVNK3VSWUNXMVp4ajhkTTNLOXhZWmpIRHNWR1VkbnlOQWRqdVA1OWFj?=
 =?utf-8?B?TzJLUHp4MkFxUDNKcHcwR2U0dkxWOUZ0c0Q5OW5uNVhjZmU5T1FobUlFcW1t?=
 =?utf-8?B?UVNvRWNLS29VTUg0VVJOQkxwVjBtNFMxUWFldmJMcHU4a0htTEUrdWZDcjFn?=
 =?utf-8?B?SUpLNjFKNkJaUElhODhkaXJORytCRVFubjlVV05FS1p2ZjBRd3Fkd2hWUEVK?=
 =?utf-8?B?ZUs1N2ZkeUpMTkFZYjBOSFFGSjZBVzJCRlZhVjBuR0V4anpFMHBQN2tpNkpq?=
 =?utf-8?B?TUc0VkUycnF1Z3ozMnR2SVdzc3Vpd0hxb3B4bnRqZWhnSGhIbUU1OGFBZDZt?=
 =?utf-8?B?YjYxakkzcmdmVFMycUpKUnllc3U0cWpPbmRMeTNkMzd6N3NjZi9taWhSSVgx?=
 =?utf-8?B?Vyt4QkEyR2RjVDd1K1dqUERpWisvWGkvYmxIWWhPZllaNGJKbFBySUVDZHZl?=
 =?utf-8?B?NFYxcEx0Wm5nd2t0Q2p3ZVBEcTk1c0dVMm9wMExvR3dkWk5FUExiSVROMTV6?=
 =?utf-8?B?anM3SVBFVjAzUi94bndBRllmc25zZXhoWGhOOGI0aTlBRkI1SXRERHExZnY3?=
 =?utf-8?B?M0dMTWFzbzlGcENnTm9RN0ovS0NwZkZuMDlUWFE5SENkeVIzQnBnT04xU0Vr?=
 =?utf-8?B?aDloZlRydkNmVEo4bWdiczRYL1BzQ0FqWDAwM3U5c1k3WUxXZkFmNWtKMWo5?=
 =?utf-8?B?dmhJNk9SWkxNeDRqNEpzd0o1SC9ON3dFQitwRERMbDBPMkxrY2M4TTd0dHJa?=
 =?utf-8?B?aXpiQXlXWHJEZDhSWUNMYUdQL3U4VEwyMkxZeWFCdHA2WUtZTVczc21zNmQ2?=
 =?utf-8?B?czhaajg2S3JqUGtXS0VFL2FiNGkzZ2tKK1hGN2dwSzVWV1FteHV1dTZ5WDl4?=
 =?utf-8?B?RXc0OHl4SWJwVjNYbGZMcHp6QUxnNUJDSTBoMTRwYTVFaG5zemI0bno3SXZN?=
 =?utf-8?Q?8iOIL8RiLR6RRyo0Mg27KFCP5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04446b35-9f70-47d0-d2f4-08dd7c0d5a66
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:04:55.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWxd0E30ahbI5BtX213rI/ufZxOSxCbPqYiHTKxQT+Zguap4u85UP07OG/wmccMCf48opl1NNiVXqwzhczU7pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8918

On 4/14/2025 6:41 PM, Mathieu Poirier wrote:
> On Thu, Apr 10, 2025 at 12:30:30AM +0300, Iuliana Prodan (OSS) wrote:
>> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>>
>> Some DSP firmware requires a FW_READY signal before proceeding, while
>> others do not.
>> Therefore, add support to handle i.MX DSP-specific features.
>>
>> Implement handle_rsc callback to handle resource table parsing and to
>> process DSP-specific resource, to determine if waiting is needed.
>>
>> Update imx_dsp_rproc_start() to handle this condition accordingly.
>>
>> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>> ---
>> Changes in v4:
>> - Reviews from Mathieu Poirier:
>>    - Adjusted len to include the size of struct fw_rsc_imx_dsp.
>>    - Updated len validation checks.
>> - Review from Frank Li:
>>    - In imx_dsp_rproc_handle_rsc(), removed the goto ignored statement.
>> - In probe(), set flags to WAIT_FW_READY to ensure the host waits
>> for fw_ready when no vendor-specific resource is defined.
>> - Link to v3: https://lore.kernel.org/all/20250403100124.637889-1-iuliana.prodan@oss.nxp.com/
>>
>> Changes in v3:
>> - Reviews from Mathieu Poirier:
>>    - Added version and magic number to vendor-specific resource table entry.
>>    - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
>>      - By default, wait for `fw_ready`, unless specified otherwise.
>> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
>>
>> Changes in v2:
>> - Reviews from Mathieu Poirier:
>>    - Use vendor-specific resource table entry.
>>    - Implement resource handler specific to the i.MX DSP.
>> - Revise commit message to include recent updates.
>> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
>>
>>   drivers/remoteproc/imx_dsp_rproc.c | 98 +++++++++++++++++++++++++++++-
>>   1 file changed, 96 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index b9bb15970966..e4212e624a91 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -35,9 +35,18 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>>   MODULE_PARM_DESC(no_mailboxes,
>>   		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>>   
>> +/* Flag indicating that the remote is up and running */
>>   #define REMOTE_IS_READY				BIT(0)
>> +/* Flag indicating that the host should wait for a firmware-ready response */
>> +#define WAIT_FW_READY				BIT(1)
>>   #define REMOTE_READY_WAIT_MAX_RETRIES		500
>>   
>> +/*
>> + * This flag is set in the DSP resource table's features field to indicate
>> + * that the firmware requires the host NOT to wait for a FW_READY response.
>> + */
>> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
>> +
>>   /* att flags */
>>   /* DSP own area */
>>   #define ATT_OWN					BIT(31)
>> @@ -72,6 +81,10 @@ MODULE_PARM_DESC(no_mailboxes,
>>   
>>   #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
>>   
>> +#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
>> +						 (uint32_t)'x' << 16 |	\
>> +						 (uint32_t)'p' << 8 |	\
>> +						 (uint32_t)'s')
>>   /*
>>    * enum - Predefined Mailbox Messages
>>    *
>> @@ -136,6 +149,24 @@ struct imx_dsp_rproc_dcfg {
>>   	int (*reset)(struct imx_dsp_rproc *priv);
>>   };
>>   
>> +/**
>> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
>> + *
>> + * @len: length of the resource entry
>> + * @magic_num: 32-bit magic number
>> + * @version: version of data structure
>> + * @features: feature flags supported by the i.MX DSP firmware
>> + *
>> + * This represents a DSP-specific resource in the firmware's
>> + * resource table, providing information on supported features.
>> + */
>> +struct fw_rsc_imx_dsp {
>> +	uint32_t len;
>> +	uint32_t magic_num;
>> +	uint32_t version;
>> +	uint32_t features;
>> +} __packed;
>> +
>>   static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>>   	/* dev addr , sys addr  , size	    , flags */
>>   	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
>> @@ -300,6 +331,66 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>>   	return -ETIMEDOUT;
>>   }
>>   
>> +/**
>> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
>> + * @rproc: remote processor instance
>> + * @rsc_type: resource type identifier
>> + * @rsc: pointer to the resource entry
>> + * @offset: offset of the resource entry
>> + * @avail: available space in the resource table
>> + *
>> + * Parse the DSP-specific resource entry and update flags accordingly.
>> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
>> + * to signal readiness before proceeding with execution.
>> + *
>> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
>> + */
>> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>> +				    void *rsc, int offset, int avail)
>> +{
>> +	struct imx_dsp_rproc *priv = rproc->priv;
>> +	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
>> +	struct device *dev = rproc->dev.parent;
>> +
>> +	if (!imx_dsp_rsc) {
>> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
>> +		return RSC_IGNORED;
>> +	}
>> +
>> +	/* Make sure resource isn't truncated */
>> +	if (sizeof(struct fw_rsc_imx_dsp) > avail ||
> We agree on that part.
>
>> +	    sizeof(struct fw_rsc_imx_dsp) < imx_dsp_rsc->len) {
>  From the above, "sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len" would be a
> valid condition when it clearly isn't.  I am still convinced the only
> valid option is:
>
>              sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len)
>
> I am happy to change my mind but would need more information.

You're right, it should be sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len.
The ->len comes from the remote size, while in Linux we need to check if 
the length is at least sizeof(struct fw_rsc_imx_dsp).
This is for backwards compatibility - if someone changes the structure 
on the remote side and increases the length, in Linux we can still load 
that firmware, but probably not all features will be checked.

If you agree with this, I'll send a v5 with this fix - s/</>.

Thanks,
Iulia

> Thanks,
> Mathieu
>
>> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
>> +		return RSC_IGNORED;
>> +	}
>> +
>> +	/*
>> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
>> +	 * wait for fw_ready reply (default work flow)
>> +	 */
>> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
>> +		dev_dbg(dev, "Invalid resource table magic number.\n");
>> +		return RSC_IGNORED;
>> +	}
>> +
>> +	/*
>> +	 * For now, in struct fw_rsc_imx_dsp, version 0,
>> +	 * only FEATURE_DONT_WAIT_FW_READY is valid.
>> +	 *
>> +	 * When adding new features, please upgrade version.
>> +	 */
>> +	if (imx_dsp_rsc->version > 0) {
>> +		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
>> +			 imx_dsp_rsc->version);
>> +		return RSC_IGNORED;
>> +	}
>> +
>> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
>> +		priv->flags &= ~WAIT_FW_READY;
>> +
>> +	return RSC_HANDLED;
>> +}
>> +
>>   /*
>>    * Start function for rproc_ops
>>    *
>> @@ -335,8 +426,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>>   
>>   	if (ret)
>>   		dev_err(dev, "Failed to enable remote core!\n");
>> -	else
>> -		ret = imx_dsp_rproc_ready(rproc);
>> +	else if (priv->flags & WAIT_FW_READY)
>> +		return imx_dsp_rproc_ready(rproc);
>>   
>>   	return ret;
>>   }
>> @@ -936,6 +1027,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>>   	.kick		= imx_dsp_rproc_kick,
>>   	.load		= imx_dsp_rproc_elf_load_segments,
>>   	.parse_fw	= imx_dsp_rproc_parse_fw,
>> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>>   	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>>   	.sanity_check	= rproc_elf_sanity_check,
>>   	.get_boot_addr	= rproc_elf_get_boot_addr,
>> @@ -1053,6 +1145,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>>   	priv = rproc->priv;
>>   	priv->rproc = rproc;
>>   	priv->dsp_dcfg = dsp_dcfg;
>> +	/* By default, host waits for fw_ready reply */
>> +	priv->flags |= WAIT_FW_READY;
>>   
>>   	if (no_mailboxes)
>>   		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
>> -- 
>> 2.25.1
>>
