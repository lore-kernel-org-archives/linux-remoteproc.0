Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E3264623;
	Mon, 28 Jul 2025 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753715350; cv=fail; b=PgiicnwX91ECutEpzbTcvPzhNl+65bdfDMTWBBvdM7JzARyICBPNDFAhNfKOAEYcEd3+BoQNiOHpu9U1QJwA2B8q8nGB2IpA/l+0G4FC0P4pa/aOGnGn6DHQoqsTyYiunmN8wz8IW2XYbruYc9S70hWYfgbSa14ijVHjSD6+gsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753715350; c=relaxed/simple;
	bh=qozQEvOj9BMcWloqPgTeH09e0/dyzH5m5V5vX1MgWLc=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=RPteJTXwmGeFfSPYpbll750JBg1QMPdD1szteTqKPO8tgI2aWcopGzPFiy+r95Hy9RuBMqsqslSE2JMx/ltZEIn+4kJzKdjz0csOMBhfDtPXwrexePoht1hB38hbCafj73QpNUWKqUs/aqGADGlmO3+QAARMgT2wITd14YSslSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UIOLGXsv; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UIOLGXsv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9LvKSS6bL39psp3fzU3uGah0WK6SE18qQT5E5g1/BP/+/BQ3EYTnS6b+BrJ4iT5XGXB0qd1RjZpftpvaBzpRnBg9zhDigA0eCgxod/Sy4hiKudL9Qs3egFsw9l+FDaPenc/fN5lXbiDHzkhw4z7XrkEvc0SptrLCr1/om0grdukraK87D6VZe66/g8mvSS+Nbg60DX5owYgQ3AUPfk/PCMtPLmBiYwVgtkWuJY5fOgwRomxDtDEys4ckPeB53LXum2MGrUsrU6lAECiFCeRzj2mTYOytle1U3ZdRhgkWicC6aj4Xi+a4BnTWZ2p8NmKdlkVdxle1d3ZAB0TOzRNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmQsKFkanRQM8VcVeQGqAKupcZkT65yIfXSg151Yc14=;
 b=Lu9Wq/iz5IiMZ12KL+rW6WMVtzUZZOafS1tP6hnpfdurLP34HXw5ODTar2dZ0dMFfK6862r6nGNs5Z0ryik13YhRUQyJ8hFnlgdevCTIKMvNkn95WzmpFtM8IEmjyIi0UXOPP2v6Aeudvz5362aEqM0Vqkc+ZwMd+v0Tiu0aAJvHK5UlR9Av8xOoSYbZIcBB/Wgwme5bbOS8vNBjpEEE6ocoGGCbwaa2dWZG3HxiHfGV0PT2bn0DUk3B/qVaAk4aF6nC+hrYb93vlXOvAxzaOQMLedmBHDfEzwxewgga0+3egcPoCphyCh8dT7JM/dRkHTcEOhJJdAkgYX1ghpbJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmQsKFkanRQM8VcVeQGqAKupcZkT65yIfXSg151Yc14=;
 b=UIOLGXsvHGULpZiwT5jR10yJI6dunXB3u3RtCC5D7phfT9+Wf2kPHqqj4ubRH1KfRSzbnta2nrg3blpmSN+wEmNpNCUL0pq7DSjOGezG0/9qwlaJPtj2aOXsNvZmkr4SRKft1rUL0IPvDmdPrXinMBbREMrQVJ8B5krN2Hf7uPEDWVymsM9nkOKMdXGgpaU4jiBBmv/hTe0ggncxKJ06aRMrxS4tZJyz7/nS/hyKYHGL7TCugE/vJelGWMtE+v7hzluh5q4DOIg5QcVkM8RJRBO7nz18fOgg/xpk40nP8SMmFlbWtFg5+KY8OloJ3dq3W5dnna0RazfATrXjkX/J9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 15:09:04 +0000
Received: from AS8PR04MB8900.eurprd04.prod.outlook.com
 ([fe80::a824:ac8:988c:390]) by AS8PR04MB8900.eurprd04.prod.outlook.com
 ([fe80::a824:ac8:988c:390%7]) with mapi id 15.20.8964.024; Mon, 28 Jul 2025
 15:09:04 +0000
Content-Type: multipart/mixed; boundary="------------emRCXOPA7YuGy0Ao4jMmIQrP"
Message-ID: <12184ce7-e74b-48eb-abee-25f8a10a2423@nxp.com>
Date: Mon, 28 Jul 2025 18:09:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and
 coredump process
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Daniel Baluta <daniel.baluta@gmail.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
 <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
 <aIeFqVUp2C6fh4PT@p14s>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <aIeFqVUp2C6fh4PT@p14s>
X-ClientProxiedBy: AM0PR02CA0205.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::12) To AS8PR04MB8900.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8900:EE_|PAWPR04MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: 4210aa1b-12c5-4df6-d560-08ddcde8b0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nk9XQnovcTFKVVBINkhKeWhOZmZlNjhLUk5MSWovVEpxczZqTnIvYm5pVmQr?=
 =?utf-8?B?eXY0OGhDWVdPb3FIK3BCRzFqK0I4R3JiK0w1RGxEd3hDTzBSWjRUOXFpWWx0?=
 =?utf-8?B?YXF3OGRaMkJQd09sM3ZFZDRRYlVWd1lTcE5zeUYveWNLblFNUFozRUROMEg1?=
 =?utf-8?B?UFZPMmVzZUFyYnNhOE84TFNrbmNPcXpXaCtnbmdZNS9aUHlIVFFTd3JkYmIz?=
 =?utf-8?B?eC9zYkRaNS9yQkpiamN5YlBnbjZGL096VlU3VHlwSHdBRmRzTEU2N2haKy9s?=
 =?utf-8?B?cXZ6a2hXSi9nTWh2MjJSS1ZlSDRveXR3ckFlK0xYaEFvTXVYaDNuWHFJZEV1?=
 =?utf-8?B?eEhDN2dJZmNNdVJYMXdIMGJTQ0VIQVpEV0ZyeFVlWGRmZ3dzSGdTZ2doMzhN?=
 =?utf-8?B?dmw1bU5ialo1RkR3elBPWlVzamNBTUJ6OHl5bzlJUG9ka0NtNEhPVHdtVERK?=
 =?utf-8?B?NXJYVzRabW5tUjhnM3hQN1RKS1dHVmNxVktlY3VUdDdPdmdVQ2trMmIzZVF2?=
 =?utf-8?B?V0NRYjdMZm8zN1FyQTdVNW56UlV1R3EyckQzTlhQOEI0eitIMEdIKzlTOGpU?=
 =?utf-8?B?R1UzbmNCbGlkQXdIZTlpTVQwUFFTQkpTRXk3amJRWmxuVndxZ0FxRkQyc0FS?=
 =?utf-8?B?QU5ueTVwMHFiVncvYlY3Nm10cjFjVmhxYVJGdjZtYy9acFY5TUgwUGFhNDhH?=
 =?utf-8?B?WTQ4Smd4ZEpDNE1jNU9pY25GTFBhVC9YTlBCNkpIVXdWS1RsODZqSUJIWTV1?=
 =?utf-8?B?ajVyQ0JHVlJTMWNSbjN1ZDZ2SWkyWitwcGs5Wmo3NnY2Y3N5TlZRVDlTYkwv?=
 =?utf-8?B?d0tzbDJLNDNONyswNEd3NmN2aHZlbHp3RitPcm1jbTNhQTZhamw5czVhY0R5?=
 =?utf-8?B?eW5kQ2E1cnpvN0h1eGlNZnMxRW0rZWY1MUxqTFY5dGZCWHR0NVArdDNRclZq?=
 =?utf-8?B?VHY3VEZtT0NweStEQWU5b0NxeHBOcG9vMEkrR2VvMVl2VHU2UEhGRHE2TTBN?=
 =?utf-8?B?cmNGd1J4NXNKcmxXb1hvY1ZJZmJseXZlYWVuSmxuMk52cXRIVTI0TVc1ZURV?=
 =?utf-8?B?LzN2UGV6a1l1MTVNdG82NDZLbDVMQkF0K0xDalhFTjZVKzM0NStER3c4ZDJF?=
 =?utf-8?B?R2JGZnlxNkJEeXo1cWFVTlRsWjF4bGJpZzE2cGx5YzRIbXFudlpHcEdxaDQ4?=
 =?utf-8?B?R20xZkxJZkYzR2c0dHlPRGwvaXprREFNQ1k4RUVsQjJEckYvT0gvcXVaWUdS?=
 =?utf-8?B?VGp6ekZORm53NWNFNk0zTmZqM3o4bjlVaEdEOHpQRnpGVVV3UTIwZm83VG0y?=
 =?utf-8?B?K0wrTWxjVWxEb1Rua3BMdnNxdXp2SEw1Ump1UEc3VnIvZGd4RFRXcXl3VEp0?=
 =?utf-8?B?SkVUMjNUSW1uQUZWdXhMZ1FiUkJEL0YzWjJ4Z0dnRHdoMFdLZzkvdkJxWldT?=
 =?utf-8?B?cktBQ0hzVCtmOFZINjNFeitHbS9mSFlNS3NlR1VkWUdjRCtnRVRCQWdMWis1?=
 =?utf-8?B?ZHRxSTN3SmdrSjRSUjk0TU9GeVR2VnYxWURhd3BpcTV3R2t0bENlQmk5WTJv?=
 =?utf-8?B?NjhacnFQY1VSODRDZEZjd25OdUJVVGlLWTNoVzk3VkZiVXZnU3MvRnhoeTZu?=
 =?utf-8?B?bEo4Yno0VENINXViZlNmbkpxVVAveVZzMUZ1aVBGT2Z3UjhQT2t6OTJLWnha?=
 =?utf-8?B?dmFkU0twWElMZEtITkVnaThJQnZ2QzNBOEExa3UxakoxbGw2VGdtcE55Z0lZ?=
 =?utf-8?B?cFpqa1dYcUNsSnpQbHF0ZUJKQnFLZEtXblpmUlVFMCtEN3RUNFJQdHFreExl?=
 =?utf-8?B?WEtaYk9ndXNNczZuMm0wVHZYM2h1ejBzd1J3WHZQVGx6M08wL2tOb3UrWjZF?=
 =?utf-8?B?QjZ4eGU0VTFyOEZ5L3VvRFQvc2g0ZzllWWVkckdjdHhVSTNmeVVwMlZtejl6?=
 =?utf-8?Q?H1czea2gLyc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STB3ZkVCcHF1MGYwQktOSksvZ2FUam1JbUc3N2JQeERJNjUxVXVrZU4xbCtw?=
 =?utf-8?B?T3NnL2N4S1l2S0VjR2RKU0NXN1RxeksxNXpxaHFpcGxUWWM4cmJvQ09QRms0?=
 =?utf-8?B?dzJiTjVuUFlCWStQQXhSLzcwOEpxVVVWYUpEWm5BaGYzZ3hZK1lWbmdocmJX?=
 =?utf-8?B?Z1JOR0RUMnNBbE1SNkZyRk4rNENyM0VBMXNNRzZnMkxDcmhFNkxvbUl4ZWJ6?=
 =?utf-8?B?ejM1U2l6STBtOHJYL0d1RVdRK2VvbWFwVmV0d21uTHFDZzhPNlNITU1oUmpw?=
 =?utf-8?B?QkhVWXI5MHU0MHlhM2w0akpzU2ZkK1NjTEhIMlE1aThUajlUVWxjcGh0SUlW?=
 =?utf-8?B?ODFNcG9iTUxRcmpQQTM2ZzNYeFdpK3NIR2FzQlNLZUhCVEpQZXI0am1GZEpT?=
 =?utf-8?B?ZWZQeXBBZFhESU9NTnNtK3lCdURYcHUvbGtXWlZ2czIvOFZTQlhhYjlzN0I4?=
 =?utf-8?B?aWF1NlNHZXJzRitnbXpadGdKSkt2OHNRV0VORm1OTUE2VHVBblBtVXhqbkxh?=
 =?utf-8?B?b0VKWlVSL2lDWFpYdzhWZUQ5KzJQVTRSOUpMZlI1VHVyS0xYVGVpQjNwY2hj?=
 =?utf-8?B?Q2UwSUI5ajFyMnFUd2NUV1VzcXhJOEZpNDNBNVc2OWdOMG9GZnI0Qm8rZy9U?=
 =?utf-8?B?WHFGYTFYRWJZVnFLM05sVkE1Rk52L1BvczdibExqSHFZT3FBZjBFQWtTbnVu?=
 =?utf-8?B?eHVpRExQTitLc3AvT0hXYno1YWhHbk8zdkg3QnlXTWo5dWFRZy8yWmFvT29x?=
 =?utf-8?B?RklEUWwweVJlRElNNnNFSTA2QUhPTjc2VWs4ZWsyNlBSMFExYUFLbnVaUTE0?=
 =?utf-8?B?TWdWZzRVemk3eFlCVHFhM2hLRUdEUU05UmtRMTg2ZmRsQ1NsRVlnSGNrZG9s?=
 =?utf-8?B?OXdidFA1TFRZMHp3MXJXaGswYmRNK2JHTGY4TWlHNXJQSEljbXZUUzNwODVi?=
 =?utf-8?B?eVkvd2o1cnFlWE1yR25NenRlMjFJRzFvZnVZaTBlMTNiRGVKdDR6NXJoMXVw?=
 =?utf-8?B?OE5VWEVkMTRya2pZUExTVFhmODlzRFFZWFlBV3Izc2ZmWEpDdjgyekZRbngz?=
 =?utf-8?B?ODhJRlRVKzl5dHFVWjJRZG5VVkhhSGI1aUM2WG9kVmt3TDJzOVRDOWJFZmJT?=
 =?utf-8?B?Wjl4VHdIU2FrUFVCQ0lrT2o4NVB2VVNFbm4xT2FYNjZodTJlOHlyUUhSaWxM?=
 =?utf-8?B?N2R5N2Q0dmdHUU1iTDR4TjNrSVpLazlmZDU3OXZLM0l1L3J1ZVUvd2t3bWhk?=
 =?utf-8?B?L2RQejFFUlpUa0VYb0U3THJnUUlpUFZXTFJjV0V3ZHp0ekM1U2E1SDU3aUU4?=
 =?utf-8?B?QWhLa2FrT210R3ZLVmpSaVlsT2kwQUpxak1DTFJkL0psZ0ZMWW5TOTBHVEdv?=
 =?utf-8?B?KzV1WmoramlHZ1hTZUtBRnBIbW9VQ0J2VldNeHZvaXEzNS9pQUpka2ZVWitS?=
 =?utf-8?B?QTlKUEJKMDdhZ0xRMkhna0kvSUQxR3dZMkZWdXlnd2tsUzEreTdRVnZNZFJ5?=
 =?utf-8?B?SkNyb2wzcDhIcXhTK0gxZHA5Y3dmR1k0emVuK2x4aWNZRTRGaWQwVzZ0bnJD?=
 =?utf-8?B?czZTNGVoNFp6ZjR4M0orKzBLY1dRUzBPdWhNSm1lbDBOYTJKenVMVUFqT0JM?=
 =?utf-8?B?V3ZEY3dqUHVhTG0wY2ZseDdrUTl3dXBxeDdOam1zZzRja2pxQjYrS3orL1Yw?=
 =?utf-8?B?ZEhzdUhLRUJVV3kwaFJpeGo2R09ER0hIUkFNcmkvMzZtMkhiWmdtMjE1czdH?=
 =?utf-8?B?b1V4SGNWdGY4dWc5MjNYSkFyNmVUb0JnYkw5aC9IbmJzU3gyL1RFSWlSUkNw?=
 =?utf-8?B?WlRndG1LS0RZeGlLTE5xUzNQN2NtVmx1Y1A2SThxQnpuUzZ6QlFZMk9US0pt?=
 =?utf-8?B?UktlYld3YU9pZXFlSmNUUDNKbTFjTFA2a1FoRWc1VStaRVlkbzBBUTViSmF1?=
 =?utf-8?B?R25MNjRENGgwakpWcFcyaytkNnVDSytub2VxcmdXcXUrOUpSYkYzZSs1Snh6?=
 =?utf-8?B?YjV4c2JaZmY3NG5QUWdVcjJQWHRIeFBoYlVsZVF1ZHVRZnArM1hYTXR5S3Zn?=
 =?utf-8?B?d0gwbjlmaEdSMHc2QkdiZVM2c3RhZVVQdXV6enRzM0hwdzJudzZMRVppeW9r?=
 =?utf-8?Q?CLYa0gkbBJPoMfgS22Sr8yS/O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4210aa1b-12c5-4df6-d560-08ddcde8b0c3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 15:09:04.0617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgHiOHLrHQYHutMUIPcqNGVylttpwuXCooh72u9rUQ7nT2AsBX+Gus+qIrs4Ip2ROZhvOLTrbGh4PCxkjQWwJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031

--------------emRCXOPA7YuGy0Ao4jMmIQrP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/2025 5:14 PM, Mathieu Poirier wrote:
> On Mon, Jul 28, 2025 at 01:39:38PM +0300, Daniel Baluta wrote:
>> On Tue, Jul 22, 2025 at 11:16 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>>>
>>> When enabled FW recovery, but is broken because software reset is missed
>>> in this recovery flow. So move software reset from
>>> imx_dsp_runtime_resume() to .load() and clear memory before loading
>>> firmware to make recovery work.
>>>
>>> Add call rproc_coredump_set_elf_info() to initialize the elf info for
>>> coredump, otherwise coredump will report error "ELF class is not set".
>>>
>>> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>
>> Changes looks good to me:

I agree, but this is not enough.

>>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>
>> I've tested it with Zephyr synchronization samples inducing a crash
>> via debugfs interface. App
>> can recover correctly.


The synchronization sample does not utilize the Messaging Unit (MU) for 
communication between the two cores, its behavior is similar to the 
basic hello_world example (no fw_ready reply is expected by host).

I’ve tested this patch with both the synchronization and hello_world 
samples, as well as with the default firmware specified in the device 
tree (imx/dsp/hifi4.bin), and everything works as expected.

However, when testing with the openamp_rsc_table sample from Zephyr [1], 
I encountered the following issue:
```
[ 1500.964232] remoteproc remoteproc0: crash detected in imx-dsp-rproc: 
type watchdog
[ 1500.964595] remoteproc remoteproc0: handling crash #1 in imx-dsp-rproc
[ 1500.964608] remoteproc remoteproc0: recovering imx-dsp-rproc
[ 1500.965959] remoteproc remoteproc0: stopped remote processor 
imx-dsp-rproc
[ 1501.251897] remoteproc remoteproc0: can't start rproc imx-dsp-rproc: -110
```
Upon debugging, I discovered that the issue stems from the imx-mailbox 
driver not clearing the General Purpose Interrupt (GPI) bits. This leads 
to the remote processor failing to restart properly.

To ensure compatibility across all firmware variants, including those 
using OpenAMP, the attached patch is required. Both the recovery and 
mailbox patches have been successfully tested on the following 
platforms: i.MX8MP, i.MX8ULP, i.MX8QM and i.MX8QXP.

Shengjiu, do you want to send a new version with both patches?

Thanks,
Iulia

> 
> Very good - I will merge this around 6.17-rc2 when I get back from vacation.
> 
> Mathieu
> 

[1] 
https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table
--------------emRCXOPA7YuGy0Ao4jMmIQrP
Content-Type: text/plain; charset=UTF-8;
 name="0004-mailbox-imx-Clear-pending-bits-for-the-GPIs-that-are.patch"
Content-Disposition: attachment;
 filename*0="0004-mailbox-imx-Clear-pending-bits-for-the-GPIs-that-are.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0Nzc4NjA3MGYxZmZiZDczZjRmZjAwMDllMmRiZGRjNzlkNjA3ZTg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBJdWxpYW5hIFByb2RhbiA8aXVsaWFuYS5wcm9kYW5AbnhwLmNv
bT4KRGF0ZTogTW9uLCAyOCBKdWwgMjAyNSAxNToyMToyNCArMDMwMApTdWJqZWN0OiBbUEFUQ0gg
NC80XSBtYWlsYm94OiBpbXg6IENsZWFyIHBlbmRpbmcgYml0cyBmb3IgdGhlIEdQSXMgdGhhdCBh
cmUKIG5vdCBlbmFibGVkCgpFbmhhbmNlIHRoZSBpLk1YIE1lc3NhZ2luZyBVbml0IGludGVycnVw
dCBzZXJ2aWNlIHJvdXRpbmUKdG8gcHJvcGVybHkgaGFuZGxlIGdlbmVyYWwtcHVycG9zZSBpbnRl
cnJ1cHRzIChHSVApIHRoYXQKYXJlIHBlbmRpbmcgYnV0IGhhdmUgdGhlaXIgY29ycmVzcG9uZGlu
ZyBlbmFibGUgYml0cyAoR0lFbikKY2xlYXJlZC4KClRoaXMgZW5zdXJlcyB0aGF0IHdlIGNhbiBu
b3RpZnkgdGhlIGhvc3QgLSBzdWNoIGFzIHNlbmRpbmcKYSBmd19yZWFkeSByZXBseSBmcm9tIHRo
ZSBEU1AgcmVtb3RlIGNvcmUgLSBvbiB0aGUgc2Vjb25kCm9yIGFueSBzdWJzZXF1ZW50IHN0YXJ0
dXAuCgpTaWduZWQtb2ZmLWJ5OiBJdWxpYW5hIFByb2RhbiA8aXVsaWFuYS5wcm9kYW5AbnhwLmNv
bT4KLS0tCiBkcml2ZXJzL21haWxib3gvaW14LW1haWxib3guYyB8IDMxICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9pbXgtbWFpbGJveC5jIGIv
ZHJpdmVycy9tYWlsYm94L2lteC1tYWlsYm94LmMKaW5kZXggNmI5ZGJkNmEzMzdhLi4yZDFkODE1
NDU2NzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWFpbGJveC9pbXgtbWFpbGJveC5jCisrKyBiL2Ry
aXZlcnMvbWFpbGJveC9pbXgtbWFpbGJveC5jCkBAIC00MCw2ICs0MCw5IEBACiAjZGVmaW5lIElN
WF9NVV9TRUNPX1RYX1RPVVQgKG1zZWNzX3RvX2ppZmZpZXMoMzAwMCkpCiAjZGVmaW5lIElNWF9N
VV9TRUNPX1JYX1RPVVQgKG1zZWNzX3RvX2ppZmZpZXMoMzAwMCkpCiAKKy8qIDQgZ2VuZXJhbC1w
dXJwb3NlIGludGVycnVwdCByZXF1ZXN0cyByZWZsZWN0ZWQgdG8gdGhlIG90aGVyIHNpZGUgKi8K
KyNkZWZpbmUgSU1YX01VX0dJUF9OTwkJNAorCiAvKiBQbGVhc2Ugbm90IGNoYW5nZSBUWCAmIFJY
ICovCiBlbnVtIGlteF9tdV9jaGFuX3R5cGUgewogCUlNWF9NVV9UWVBFX1RYCQk9IDAsIC8qIFR4
ICovCkBAIC0xNDMsNyArMTQ2LDcgQEAgc3RydWN0IGlteF9tdV9kY2ZnIHsKIC8qIE1VIHJlc2V0
ICovCiAjZGVmaW5lIElNWF9NVV94Q1JfUlNUKHR5cGUpCSh0eXBlICYgSU1YX01VX1YyID8gQklU
KDApIDogQklUKDUpKQogI2RlZmluZSBJTVhfTVVfeFNSX1JTVCh0eXBlKQkodHlwZSAmIElNWF9N
VV9WMiA/IEJJVCgwKSA6IEJJVCg3KSkKLQorI2RlZmluZSBJTVhfTVVfeFNSX0JSRElQKHR5cGUp
CSh0eXBlICYgSU1YX01VX1YyID8gQklUKDApIDogQklUKDkpKQogCiBzdGF0aWMgc3RydWN0IGlt
eF9tdV9wcml2ICp0b19pbXhfbXVfcHJpdihzdHJ1Y3QgbWJveF9jb250cm9sbGVyICptYm94KQog
ewpAQCAtNTMwLDcgKzUzMywzMSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgaW14X211X2lzcihpbnQg
aXJxLCB2b2lkICpwKQogCXN0cnVjdCBtYm94X2NoYW4gKmNoYW4gPSBwOwogCXN0cnVjdCBpbXhf
bXVfcHJpdiAqcHJpdiA9IHRvX2lteF9tdV9wcml2KGNoYW4tPm1ib3gpOwogCXN0cnVjdCBpbXhf
bXVfY29uX3ByaXYgKmNwID0gY2hhbi0+Y29uX3ByaXY7Ci0JdTMyIHZhbCwgY3RybDsKKwl1MzIg
aSwgdmFsLCBjdHJsOworCXUzMiBnaXBzID0gMCwgZ2llcyA9IDA7CisJdTMyIG11X2NyID0gaW14
X211X3JlYWQocHJpdiwgcHJpdi0+ZGNmZy0+eENSW0lNWF9NVV9HQ1JdKTsKKwl1MzIgbXVfc3Ig
PSBpbXhfbXVfcmVhZChwcml2LCBwcml2LT5kY2ZnLT54U1JbSU1YX01VX0dTUl0pOworCXUzMiBi
cmRpcCA9ICBJTVhfTVVfeFNSX0JSRElQKHByaXYtPmRjZmctPnR5cGUpOworCisJZm9yIChpID0g
MDsgaSA8IElNWF9NVV9HSVBfTk87IGkrKykgeworCQlnaXBzIHw9IElNWF9NVV94U1JfR0lQbihw
cml2LT5kY2ZnLT50eXBlLCBpKTsKKwkJZ2llcyB8PSBJTVhfTVVfeENSX0dJRW4ocHJpdi0+ZGNm
Zy0+dHlwZSwgaSk7CisJfQorCS8qIEtlZXAgb25seSBHSUVuIGJpdHMgdGhhdCBhcmUgZGlzYWJs
ZWQgKi8KKwlnaWVzICY9ICh+bXVfY3IpOworCS8qIEtlZXAgb25seSBHSVBuIGJpdHMgdGhhdCBh
cmUgcGVuZGluZyAqLworCWdpcHMgJj0gbXVfc3I7CisJLyogS2VlcCBvbmx5IEdJUG4gYml0cyB0
aGF0IGhhdmUgdGhlIGNvcnJlc3BvbmRpbmcgR0lFbiBiaXRzIGRpc2FibGVkICovCisJZ2lwcyAm
PSBnaWVzOworCisJLyoKKwkgKiBDbGVhciB0aGUgQlJESVAgYml0LCBwcm9jZXNzb3IgQi1zaWRl
IGlzIG91dCBvZiByZXNldCwKKwkgKiB3aGljaCBhbHNvIGNsZWFycyBnZW5lcmFsIHB1cnBvc2Ug
aW50ZXJydXB0IDMKKwkgKi8KKwlpZiAobXVfc3IgJiBicmRpcCkKKwkJZ2lwcyB8PSBicmRpcDsK
KwkvKiBDbGVhciBwZW5kaW5nIGJpdHMgZm9yIHRoZSBnZW5lcmFsIHB1cnBvc2UgaW50ZXJydXB0
cyB0aGF0IGFyZSBub3QgZW5hYmxlZCAqLworCWlteF9tdV93cml0ZShwcml2LCBnaXBzLCBwcml2
LT5kY2ZnLT54U1JbSU1YX01VX0dTUl0pOwogCiAJc3dpdGNoIChjcC0+dHlwZSkgewogCWNhc2Ug
SU1YX01VX1RZUEVfVFg6Ci0tIAoyLjI1LjEKCg==

--------------emRCXOPA7YuGy0Ao4jMmIQrP--
