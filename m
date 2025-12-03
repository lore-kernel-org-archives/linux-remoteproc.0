Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D15346E48;
	Wed,  3 Dec 2025 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783337; cv=fail; b=Eu8BzVyOT5bAI+IGquF6YKcRaVeVXBk6VnDpr0alWBd9dA0cA38hXpm1G+KisaKfnDlytpqAlUM4I93FjEbW2CxsifDMg5zdWcYkTSjDHVYCu7BVww3rOEor/aLTzT35E6xbgsvU+rygaaOisnkZ8limDKrGriv79dfrmem/TuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783337; c=relaxed/simple;
	bh=Sz6D5WfUO8Y8EWyGt8qvftqmSziivLW7H87EvkghCSA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M9M5q8FqUEdfLOKgfOhEnjMyhZ0+Ko52ugdeyovzcbc2Q0HE3XI8yZ7b/R5ZNzcbEna96O2TM5RHdGSXwjnmNDclkDjxWmkTctjFUuFFJYsBNbYRS50DgFo5eUI6l2hNp1ik13+BM3z2V2bz8Gi7Oe/PqT1nxfwkA1vJsA6vWu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mKQVlCwi; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mKQVlCwi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYcn1Ea4hQXG59j3d3A11EMWwAGaT5eMjq3SsRFwLyhpPpgqTL8BdXs/KaFnBTA7u0Y5uvvUhwVPo+/63xfn3TJMSEqOlZcPPBfnwJ0Ey1xXhgXY3Bv6hG1MuWaa4/NKe2topOkLB/dKkkGBFxq3c5pwTMad19prRcMmcepEdEnOU0klaFWGsA4FZR0Vk4TPwh/u5HbeaIvFnaw1yOIcSJeEU+nqhc7SVWuK7cFu895j2I3q3K2eVjPCjB5oUs2naf1WvGM+s8ewaEncHb1FBcScO+hdNNK40We79Fz2VCFGey5QnWs5/KEo5fW3rzMNjqFjIc77SSqWA1y3weF4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBIAeD6BBunL3ffoRWNKg8vwEKhNUFVUNSD+huHswwI=;
 b=VSG0YE7fg+6QADkxXe3yQAOP122lRh7PPt6MdLiW/lriTBUeaBnf7F819erTQ66lpQ6y7LSAblKnH2Nksxr41l3SAVqxffnrqYfzjWOrwzaMROD9TZuZRkZ0IhUjN4b1M3rZ3MlznRhOTChwsQC5yFUylEM5hsqzSYOrKSsOiQw16DBWbQ036hwsrpM/X3KEWDe4pSE0MohPMxO3KFFF/TuA5XnzbJCdW1gC5WWH/LBMLbNlp6omi9BjYCiTgqStZZQzlcAkmjFoTcw8cJ4hWC+yGFNw9S0/Mg2nBgE+UnuWQ89nHqJjpYA6GoenZHmD3lm3daE0BBP+1YJl2yrneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBIAeD6BBunL3ffoRWNKg8vwEKhNUFVUNSD+huHswwI=;
 b=mKQVlCwiKlEO4IuSqRcO1Lo+fFTt8p+lfQ+ECADa8XlDQQn5W9VN/xp+J0ZIwcorBmkDnuP5dV591mawjsuejsLQ6aL/j5vCZrM8jJCBARgA7HWEms2m4dpYHqnRseZ5+0jiAI0exXH7uVPeDjFdWoCuon61MBO+kviS0jJUqo6G437n0FSm0EZYb0OYj4P8Nz43jYS3vgE3u4mkE6amLh2syBO95fS2pPP3fn5LUtAiykUjevvV2aeLtLF95zLch7rkkGmvpUA76a5LgnHFEZ388vJGNDOjr01/K+nHSsZHZroPkd5ZnEVb/CrEZXITs7G2k37W54cuzLD8SsdnDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by DU2PR04MB8805.eurprd04.prod.outlook.com (2603:10a6:10:2e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 17:35:28 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 17:35:28 +0000
Message-ID: <36564f56-eb61-449d-a90b-980304b0f5ea@nxp.com>
Date: Wed, 3 Dec 2025 19:35:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
To: Bjorn Andersson <andersson@kernel.org>,
 "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, imx@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
 <mkgc3gpgzvdvotzw4752om5ascwxpscocaj2x5urzaa7ss4iys@rsqb3ebrexw7>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <mkgc3gpgzvdvotzw4752om5ascwxpscocaj2x5urzaa7ss4iys@rsqb3ebrexw7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::8) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|DU2PR04MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f666854-2df1-4797-5e9e-08de329259a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eit3aDg1V21GNVZhS2FYMTh4TElFYUpGVmVyTVExU2ZqVHVjc1NsL2hkSXR4?=
 =?utf-8?B?NS81MkxpTU5Ibk9DdmJpRk5kOFdIZ3MyOEYvOFVxcEsrZGtPZGdIMEJKN0ly?=
 =?utf-8?B?eXRJbklPc3lpVDB2dTN1NUVlaWlrYktRYXF3dzVERlVVVFZtbWd5c1ZVWVdD?=
 =?utf-8?B?N3p1aWJMckJTVmkvMWNTRUlJTkxzakNrOXd6SUVMSGY3QTVWRHZFcVF1NWtN?=
 =?utf-8?B?RlVxMDE4VGQ2VFhCL2gyL3RldlMxZTErOWtnWVZDZjlYK3FnK01ya2lOZ1B5?=
 =?utf-8?B?di9NZkRmUkdFNnQxbXZ4MnUyaXZTd1VyRm1LUVR5cUhzZjBJcjlyOEpGUE9k?=
 =?utf-8?B?WEs0OFJxdGdKUXlpdEZkdmczY1pTd1EvUXM5bG9NNmhZWTJHWmtJd0ZOWlNP?=
 =?utf-8?B?TFBkVFh0ZGZCUUYyOExlRGFNc3EvUU92WUNPVVJJWmxtSkNKQnlFNFBGOE1v?=
 =?utf-8?B?Z2Q3T2JvVkJmVFhDcEdNbnIyUCs5REZHNnVHQU04T2E2bDNlUzZNdjdDczdC?=
 =?utf-8?B?NXVLNk80em85MXFsMHFXZllUOW1BZ0tBYVIvQy85dHorbmh1QnB3bTRoeG5U?=
 =?utf-8?B?bDNSVm5UM0RzT1NMalNXSDhnOU1zTkxXaTMzRDZuWnM2dFYvaXJXWkt5Q1h2?=
 =?utf-8?B?VTJ5ZmtIVHZYcGZBRG53ckVjWTRaZmtMQ0FNTWVWY3JNYzc4SWNCMVBqQXgz?=
 =?utf-8?B?TzBqOXlZRXVSb1QrY1MvaS94ZW1TTE1hekFUWUlKK0ErT3A4VHQ0cVk5Y3JE?=
 =?utf-8?B?MVVSb09IYVhPeU5lYWxudGVxaTgyMnRZa3lITUt2ZUhsd3JZb0JXWGlOOTNZ?=
 =?utf-8?B?dHVQRWdueHJtOGdHVUwvWGw2djhXOGRvSWZXa0dGNjltZEVqMURub1pmN25B?=
 =?utf-8?B?RTB3MlpZOFJnalExdGRsTTdvOUlmclJFZ0dBSWFJMmJ4dmVhSnVzWWN6djJt?=
 =?utf-8?B?ai9YVkZZenR5M2ZVQXREdGQ4M0dRd2NZSnZpU3JKMGdnblRVQjJPeTNCeStx?=
 =?utf-8?B?cGh0RjUrakl0UzAvT1FOYUZkZkJaSGtCcHQxSkpvbTZoYThZY3A5cDF2NFl3?=
 =?utf-8?B?eW1iZ2xlNFlSbXRnMmVnTFpOSStoalNSZmRYWkQvdGVLVEEzMnVPR3B3VWo2?=
 =?utf-8?B?MDBabFk5VU9UV2dQNjNTL3c2Wmw1VzF1UCtXZWErTEdZQ3ZyYjNFazV4VVJs?=
 =?utf-8?B?VmxoRzRPNi9BYnVsbE5KQTE4UnFndm1lWlZLYmNnNm03aG1GYmxYSWlsclVQ?=
 =?utf-8?B?NkNnUmxiT0JJRVZrRWx1NkoyVDBTbzhzWDg3MmNwQ0xkY3BIVkhYYkg0WXZC?=
 =?utf-8?B?VzZNR2QwY0hMT3U0dEw1b3F3elN1QjgxemNhNUU3S2NvSis0WFhVQXJ2MWc3?=
 =?utf-8?B?L2V6dTNadGdYYnBHU3I3UFVwOE9hY09NbVhCTXdsSVNHSDNOYWtQRnhlcHYx?=
 =?utf-8?B?OTFNWlVKRmhVMytHMFBPZXIrQTJvYUx4VU82cVBmdUVKVEczRGU0WkdoMFJo?=
 =?utf-8?B?eVdIYkUxVTZUcVBkeVNTTXZOZDdQMjViM1V1OUkzR1FPMmtyMXRkc3FrV1ZO?=
 =?utf-8?B?dkg1WUN4aE1rREJjTEF5ZVpqMXRCeE1YV1RRREQrZXU2VDNoUlZzUStFbFZG?=
 =?utf-8?B?Nkh5ZmhIay9JemlLWHN0Znh2dW0wdEJudVRoMEFpYXNCM3N5RkdWbllVQ003?=
 =?utf-8?B?eGNOV1dpK0Y1Um9zcmwyQWNFVVcvNHlveXloNmhIUVdWbXEzTlp3YUc1TTdI?=
 =?utf-8?B?blRwUWtVQ3Jzcm1wVHRZZ0dNLzJIVkduVkpFVXpoRDZFUkJBenZEMWdaaUxX?=
 =?utf-8?B?QnpjanJVZjk0RE5Xc0VLL0hyWGtBemNnZzY4L0JTZUlSYWpKYjRGNXNobWJN?=
 =?utf-8?B?SGNHM3NmQ2NUa1BSSDZrWGcwT1NMajRPSmcycklsY2VPbzFaWEJxUU52SVVF?=
 =?utf-8?Q?6I5klbeuz/GDSidHPkYlfcLS7t4x2qQ9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2hHUERIVE1uamJxK0JoeUZjREh6SXczNFAvQ2dPYzRta21xa3hMY3FJWjhZ?=
 =?utf-8?B?ZlNWUXJhR1BaMm1vVlVNaEJtejIySFplRWlsekdnMGIzNjhVc3pybVBzcThs?=
 =?utf-8?B?NWlkVGM0dk1MRnFjWUpua1R3UDVQMzliU2I2ZkQ4MXhWYlJXZXN5TE9pSll4?=
 =?utf-8?B?cDF1a0sxQ3krb3hzeExrNEI0TWlsei83VGhNdk5XeU5mQ0t1SnQ2Z1hudFFT?=
 =?utf-8?B?R05saWhCT1AzUURtMUo0cFFmYmp6c3ZjS01kNjY0d0lMTXp4OTNFWnA1VXM3?=
 =?utf-8?B?elByeVBSd1hUbW40VGVzaG01b2orN1d4ODhlZ0kxQlB5K1BGZkN2TkNGQlV1?=
 =?utf-8?B?ZENnWTdTc1BPb21HZWp6M05CcTlDVk50dXIwWW90Qkl2SENCMTl6SVc4SDN4?=
 =?utf-8?B?eFM2TytONUh2NHFrZjdMMzNxM3FIaEJ1QmJTdHl6QXZ5VjY0WjFxa0NvTFZW?=
 =?utf-8?B?MmFCU1gxWEMxamVSbnN3cys3RVNDTnhOejFsQmRjMWZVSWIvRGxaQkg1QmlG?=
 =?utf-8?B?QTZBWCtmWXN0dXNtV0NJWURxZFl0cTBmR1p5aFo3VEE5NWVSQm4wNmlJSzlw?=
 =?utf-8?B?UDFuREF5aUZ3U3dqWHFtd1RRVUhpZ2xWbzA5RVNwZ1lZN0VXMitYaThjbUta?=
 =?utf-8?B?VWZXNStyRlZUUHJYbUl0YmtCT0dtSnpOc2R0SFBaRGdscnVmL3F6R0dCT2JE?=
 =?utf-8?B?dHV4QWcxYm9JWUc0TjlvNDVXTHVJbncvSGZzQkRCWlEwc0lKVFlLWUMxYUdx?=
 =?utf-8?B?d0NSbC9WZlZYTno3aDVMT2tOS1ZERFhqUUdvKzBucm41ODRiR1gvbXhxU0Fl?=
 =?utf-8?B?SGJ5TGJrVVgyUHI2cWZqTzZBSTZjaEF3bUdUTWRvUko3Z3JyNVBhRFJqaXlj?=
 =?utf-8?B?cWtwSFdIVEZOOHlKRUxVRFZhSFEwajUvdG10aFpJaTdPakVMcmFIOUowZU50?=
 =?utf-8?B?ekZqMDhNR0k0dWR1SGhqeWVqMzlQckZRNHlreTdOcWI0dDVLcEw3Z0dEa3Jw?=
 =?utf-8?B?YWJGeDFGSGNFam5RaklJYkRYZmdnRDN2cVBpYnlxYmFEeml1eEI0WEhXL2hY?=
 =?utf-8?B?MnozSnFIOEhTNVB4OWFmbngyU1JNOHJtRC9LRGRCYmZaMEM0SG1CS2oySHZK?=
 =?utf-8?B?TE14MDBqaFYvblV5U2xQSkYxUjFqaDY5NGFtN09laStLU3hQd3ltcGdGRHUx?=
 =?utf-8?B?VHZubkZ2RFFyUTBhdnMyb29Dd3FuZnFuRFhWVVVQbExFTFVJNTBZeHhBenV1?=
 =?utf-8?B?elI3S1pGckpRSUp2cUkzclFHZ0ttTjFaaUcvTVlaN0xyd2QxWFo1VTZsYUxB?=
 =?utf-8?B?bzc5ak45bU5SMUVqNGVBNW5aaFlsbWRtbFZQQ3hvdjVGTG5uaFFRaU90MDJm?=
 =?utf-8?B?SzhkaHBVSjVZWjk0YnJlem9melUrR3UwQjlCa09XcXBCYmRJRnd0M1F6eU5S?=
 =?utf-8?B?TGpvUDQrNm1BS0UxRk1HS3Rwa1ZQMCsxUHRjTGZBOVU5TGtMSXY3dUJ3R3Nv?=
 =?utf-8?B?VDQ5dFFOM01EdTg5dXJQUkpJVkFyc3VIeG93YTZ3bm1TQUJ1eVpKMlhRQUN3?=
 =?utf-8?B?eHl1QnBTVENCLzdNN1VjK0wzZnZmQVh0V3ZKMGlIK1hlam5jNGQrMHBpUDYv?=
 =?utf-8?B?a1M3dlhPYmFCTUhyc0JWclRxN29aYjB4YmxnYzV3TjFoUGZ0NTlTc3RHbk5u?=
 =?utf-8?B?V2tjLytFSnR2VjlmQTRCOU0xRDJPOG03M3lrWDNsVVJTcUNpbGVTaGg3UjRW?=
 =?utf-8?B?TG5BY09PV2dvQWdVTjY1VW0zd1RmdEpyS3dFRC94Q0F3NDFBN3ZFdnZOUzBx?=
 =?utf-8?B?UVNKMkJpK2VtZmo0Uk5oWXRBbTRhdW9rMndnMzZPaDZoOUs1TExTaWpWMkZT?=
 =?utf-8?B?K3pTY0wxTnVuS1E1cHoyT2lKMWdrcXdkSmVib25FVWI0NURYSG9pSkhSYjl1?=
 =?utf-8?B?cTU3NUNPTmg4OWdtK0t6ejJ3STlvTHo2OTcxSElZU3ByakdOL3RPdnZSKzNt?=
 =?utf-8?B?Zkw4RE85K3FKSEk4dEU2clFmc2VnbkdrRlB4ckVjOWJOeU1XS0ZNYzJPQ1A5?=
 =?utf-8?B?THNlRngzbGdjQnlNd0F5NzY1VW1yUnhhNEJFSGZKYm1CZHJzdUpIMGNkM0NE?=
 =?utf-8?B?U0hTVEJpZUZlSjJuZi9Fb0IwVHJRRjV1TEVqNXVwb3Rnc1U3WEZ0RjlDQ2wz?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f666854-2df1-4797-5e9e-08de329259a8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:35:28.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8+a+4+E4Ra9AFLHI7I/UWNNN9gJmJYrEol7tkGPij9O7Gb+rJ6yHyvzhPZua+io3FAqmHAkAT0NsXf1kSc9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8805

On 11/26/2025 10:14 PM, Bjorn Andersson wrote:
> On Tue, Nov 25, 2025 at 02:49:02PM +0200, Iuliana Prodan (OSS) wrote:
>> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>>
>> Firmwares that do not use mailbox communication
>> (e.g., the hello_world sample) leave priv->tx_ch
>> as NULL. The current suspend logic unconditionally
>> sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
>> an initialized TX channel.
>>
>> Detect the no_mailboxes case early and skip sending
>> the suspend message. Instead, proceed directly to
>> the runtime PM suspend path, which is the correct
>> behavior for firmwares that cannot respond to mailbox
>> requests.
> 
> Please use the allotted 75 characters of width for your commit message.
> 
Right, will do in v2.

>>
>> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>> ---
>>   drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index f11662f9a12f..fc0470aa72c1 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -1308,6 +1308,15 @@ static int imx_dsp_suspend(struct device *dev)
>>   	if (rproc->state != RPROC_RUNNING)
>>   		goto out;
>>   
>> +	/*
>> +	 * No channel available for sending messages;
>> +	 * indicates no mailboxes present, so trigger PM runtime suspend
>> +	 */
>> +	if (!priv->tx_ch) {
>> +		dev_err(dev, "No initialized mbox tx channel\n");
> 
> Commit message and comment above says this is "normal" behavior,
> dev_err() indicates that it's not. Should this be a dev_info()?
> 
> That said, it's still a message every time you suspend, so perhaps even
> omitting the print (or a dev_dbg()) makes more sense?
There's no error here; it's just a use case.
dev_dbg makes more sense, I agree.

> 
> Regards,
> Bjorn
> 
>> +		goto out;
>> +	}
>> +
>>   	reinit_completion(&priv->pm_comp);
>>   
>>   	/* Tell DSP that suspend is happening */
>> -- 
>> 2.34.1
>>

