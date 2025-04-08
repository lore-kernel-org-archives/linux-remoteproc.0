Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2050.outbound.protection.outlook.com [40.107.105.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD28E264A99;
	Tue,  8 Apr 2025 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102041; cv=fail; b=hDCMn1GxSLHUg5tNc99NgLifcmveKBwaHv5ClwEwbHbCH5VCOszRR6daS37qlvlB9qgqU2LiHeM4m0BnhXtXP3GV/QJStgKbCEYyutKRUmG4RhqW8sPiDPeNSFvR+4jBWLblgjSdo2DM/hs81LfWeEJUCRvra2pPRqTdkYy3TnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102041; c=relaxed/simple;
	bh=kX2dWSYqXrF0Y/zeyRYq7kv3eoXgpQeJzeW+/msOgTg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nt4Ju9WVSMwZaZpQEVmo8t4UQGy+/p/xQlFaYflO8SR3234Rv/oMxUnbj9KvSmZ1zmflK9agfCfMMD6rcBvRK8Q/OIaD16suVOjkQI6ByIZwFa2cJ1ue0InMdHoj7K3EG97iO23uqrXUQYUX0keqwgujeuWWvZGoXLT6SDzTtuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JkaJ5NTA; arc=fail smtp.client-ip=40.107.105.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JkaJ5NTA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDR1s/usJ+N2QtEF5wIVm/IQVa1L5cBjYKk198l3k+LNjiHrTtx5jhOuyPx+Jp5qRpz6YjrO3vEMsjxKGwjAdLT6FHky19bA/XfIjIKoU7q/Jwpbw4PH9yhjK6o0dQdJb+mV1fv5ZZMLmHR6p9oF1nSxa2rE3avd6BBGw5JzhVUvyqZV7VGPdOeZFiMMvz/o1Vo5eGNTyXQyJe5lr6cIo6eydRcuA8Hq4QhBY1MToUtfLx+oBozl19yXoGaf2YIc3ljcQb0d/PAZhS6ld/yc+rBh43rDPSkSOgLk3wPuAS8v4vf1IzpSffGVONl9CL+9kngInap+UQCZ9ghiLUxIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVkycqvAg8jLZB5ZKeLiwK0AzWkukAMfI/NxEXjX3Vw=;
 b=ksi76RGsQWas0xF9lHh0U5mUnjoDZyrowZUcOfDhUi5Dny1h11TaWX6iE+qJ31VjuecM18ZPNIBHSGeUjs1JJhEq6Fx5B3FfWoN85063D0Z1wNkzqrI9w/M1KVPdrwpm3wcE8zFkgdRi3WLiV+vOYlNV++k7CFzdoWISm5fn++0at7yEwLk2PpwZ+g+9AaVfmSbxy07wsduEDPFa7v+JAy6RP844bNqhlGXprcflcuktQ5M61hupwi5xNG5z7gjQFXUELD2dUsIF3Fg/Itjbpri7Cy2brSJ4gh7iZGi50sVp0c7vN1HW/ozlhWFTfpUKXLuewUlA+PbbGBgiGYeQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVkycqvAg8jLZB5ZKeLiwK0AzWkukAMfI/NxEXjX3Vw=;
 b=JkaJ5NTAHuaUp5dc5OroN+1wr03uppCdEG5szKJYHcBiRGca2IjSoNAXKlJdNB+Og5xcl4zSKfUaOHBhXQwPxaIdzEthwybUcNWkdGE8mFHqhNKSBpimGRJu3U9YuO4GF7sAVDNpnz0qdCLWpOawcAR235wbIzRTYczjVl4fmsRph7vf6T4SVh5tLq/+I+k4YD37havlt/s5SjirdQEXQtJutTOaeJVk6jHq8hHDTHl9d9yrUH/Edcms5tehF3b9wlOsCu6wHgu9DqowqA8IvxlIEEJoKelf3ukkWS5xSVpVk+uQyUugjVUCfVbuydm6G7Iqy5j1rmbB9hzNQRn3nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 08:47:15 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%6]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 08:47:14 +0000
Message-ID: <29a04e57-2b41-4571-8bb9-ab3222105d8c@nxp.com>
Date: Tue, 8 Apr 2025 11:47:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, "S.J. Wang" <shengjiu.wang@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mpuaudiosw <Mpuaudiosw@nxp.com>, imx@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
 <Z_P6n5wQfGuSmV2B@p14s>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <Z_P6n5wQfGuSmV2B@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS4PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::17) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 775fa94b-4883-43c0-5c59-08dd7679f60f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXhacG9MMi92MndneE9ZdEdNZ05sZmtYK3ljQ0lhY3duZXNVMURDbjFmanJV?=
 =?utf-8?B?L1paWllyOUN2emxJYjBtR3F0NzhJZCtpUUYrY3ErYjFCOHJJNHRMcnNGZ1J2?=
 =?utf-8?B?MHNkUCs4L3ErTFRsZTAzbnNwTE9RSzJIRElycEpoMWdTN2hxSVpiU0U3aEcw?=
 =?utf-8?B?YjhweVRURDN1ZE9UN3g0UUxWQXRwall3akFZSTN1ZHEyUi9SYWNCSG05aEdN?=
 =?utf-8?B?U3JQVW53alJTWmdBWEhBNnpLSTR6MUFSYUJlMkZjdW4ycEZ5L3E4dmY0L09B?=
 =?utf-8?B?QmZ4V1NUbk52VERWR3FBMklMRkhJUnNLS2M0UnVjQS9QbHpBdThrdXR6cVh2?=
 =?utf-8?B?dWEydTVNblNUMEpuc3lQenFSOFNlSUhEY3R3TXl0QkpWd0s2Nittd1VldC9z?=
 =?utf-8?B?bXdhRk0ydzdoN0FRL3ZSTktra2pYeHVMRUVGOC9PQmxQd0FodGRnYlJ1enEx?=
 =?utf-8?B?eWVVT0NPZUVQVmxZNE94V01QVW1Rd3NWY3FMY1VqMU9jZFd0bXNpOEIwR0JY?=
 =?utf-8?B?RUVtaFRCWThCT1VFc05LOURSVXljU1RUT3FJQURIaTZsZDJKREt4ajFBU1hw?=
 =?utf-8?B?VXFQNmJ4SXVxYzJRV1lMUjlhSkxoZlZYbTgzM1R5V05CZXIraHVEZGYzNEc4?=
 =?utf-8?B?TjM3aVBUWjZZLzhqSXl6Y3ZWS1RkK001bkVCL2xyMysrcWlUOXN2RzlxVXhM?=
 =?utf-8?B?aWpqNkoyWkQ3ZndWbkhtNjBMSzJyOElLZ3E5ek53cnJuK29Wcm5xVVlIUGI4?=
 =?utf-8?B?bGNkVDEzcTFWaVRTV1JEeHRGdnIvVXNzL2MrRW1aRmh1ZFE0Z1R6U2hwTys4?=
 =?utf-8?B?aVZaZHRHc0VNYUFPR0VsREI4eDBadWM4RTI1UWZNQk5Jd2xUck9TMCtOaU1r?=
 =?utf-8?B?WERmcGlMR09RdU8wTFJueDBFNytIbmowVEN3ZktyR0tPaHdDeVYxb0Rwc09p?=
 =?utf-8?B?eHVhN3Q4TTFlNG5yZTRCYWxPVlEzQ3JpejdZcGxlMlN1SU1hcnBHd050OFNW?=
 =?utf-8?B?ZHF0VkJkRm5sWko0SU5KZGJHM1N5eFpaWnltNWd4RVFTOHdxT2NKaE04cmxu?=
 =?utf-8?B?eFZpK21hR2dlL2F5NU5oMDBMUDlHVUNHV0M0SG1ya1lxUW1Rbll0Rkx2c0I5?=
 =?utf-8?B?VnFDR3lvWkxMdkd5U0tXOFJjOVl4NTEzOFBsZk9aMDl5bncvWndTc3BqYklx?=
 =?utf-8?B?N1V4bUlSTnp6ODd6Q2JCdVltMGRwOVlnY2M3OTRicDl2NmlSdkw4VEU2aEVL?=
 =?utf-8?B?ZFlXSU0rTVZjWDlacFVCd29ybnhtZEtCZ1VnQXdUZENtYStycys4cjhXUG1l?=
 =?utf-8?B?enZJa0VGUHNGS1g2OG5VVmhZNnl3clBYZVUvZnZaUFR3Wmh2QnNIeWtyT1Rk?=
 =?utf-8?B?Ums1d0ZsZWRDek1iYk5nbG0zUkw0MFdpd3pjWXZJUzY2Mi9FZlNjb213K0ZP?=
 =?utf-8?B?MWhnQXMvaGJMcWhZVnpxSm9iVFJXckdjK05Ra09TRDM4OGdsZTNjUExVTDVr?=
 =?utf-8?B?MzJCZkFEQXZrNUNTbG12U1FBSkF1L2kyRi9OenZnZUpPTG9MQ05TdW51RWRq?=
 =?utf-8?B?cDFONXdhakJ3WklUa3o5N1FXMEUzUWJIMnRDdC9pR2liOWsyN0RaZTQwemxQ?=
 =?utf-8?B?Y0p2UFpLS2U2Z2NtK3crRTc1bW5ObnorOW9hd0J0eTlYOEROSTN4amJkQ0c5?=
 =?utf-8?B?VFgwNWk0ZGNTNW91dml6bVE4a1Nia2dLOWc5N0VPZld2TW00NStyL3pHdHIr?=
 =?utf-8?B?YldwaFZnd3VCTm45SHkwMjhpelZnaTFzQjJBalBlSk9iS2J2NkVRY2szLzdJ?=
 =?utf-8?B?ZlVUdTJQdjZ6anVXbXU5Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHozTkVzMUJBQndER0FXcHV4bXJ1Qm5YVVdhMnlDQi9qaFd0QkZzS2NwOXRC?=
 =?utf-8?B?dEtwNmphS25HVlRWWXhZSGlYNC9NeEVnVkN1NVhZaFdoZ3RpS2dWbXA4NU8y?=
 =?utf-8?B?TkpZaDlVdTNUdUtsaFUrN3FleGdSd3VkdXRSb1ZoVkxSYjA5NGJCS2xDdTJV?=
 =?utf-8?B?dTdKU21tMlJXOUIwR25zaEtPb1BJQ3Buei9Sc2tNNHdRVGVZZ1pFS1RQQ1hr?=
 =?utf-8?B?blVQbmNWWm5JZGFJQmloYitIbjIrbjZFVFpIZURXU0V1MUFlamI4R1JxZENB?=
 =?utf-8?B?Y3RXNnNKL3loZWhrVXBCNWg1UXhSY09vMWpadDU5dkV2RThPb2VWWk9QZUhj?=
 =?utf-8?B?VGJZekdZWjl2OW9NV2phM1ZRM2d2Y2ZleFFTTkRMU1ozT2JzUWJCMkZzNEho?=
 =?utf-8?B?VE5ZdkcvVFdzS1NZSEppdHQ3TVZKYk1xaE5EKzZtTnNxZXNUYWs1UUtKMS96?=
 =?utf-8?B?QXdtY3prQWw3MzJXT2FVZWk4MW8xZCtvd2xneDZqbGFTK2NqcVk3MGpQUlZy?=
 =?utf-8?B?bDZOa0VENGhDWFRnQnJWQWQwNTJJbGJKcENvN05EUWNMOHFJOWRxbDlyRWlt?=
 =?utf-8?B?dnY0YUVzTDR4aWVWMjErOFFGL0RSUit2d1ZpamZZYzljVE5IbFRNMldpYWZP?=
 =?utf-8?B?dHA1YVZYbkJ2Z3JIc1pUVmlSanI5dTloSUpncDdpaDRGQmtQYSt1c2wwemJa?=
 =?utf-8?B?QURtVTA2Sy94bkE1N3c3K1RtZE9vRm44N3RjRlVEbzR1eERFWkc2M0NhUjFP?=
 =?utf-8?B?NlNmd3hyUVJTVTZqSUZyMUdoNkdJSDB6S3JhaUwyM1FkdEVHZHlzQ09kQzU5?=
 =?utf-8?B?Y2tCbC9WUWZDa0o5eXFlOW1Kb05RVUR3amxxS2dIbHFYbkRmQ1RlK0FGbUZo?=
 =?utf-8?B?d3N6d0JKV2JmeS82Z0ZwczlrTkxDQWRscVg4UWdlL1hVOHVEUEI3eW1QS25I?=
 =?utf-8?B?Tm0xTVNhc3BPTGdod0NCNkJHSUFiNjV4V2ZuSm1jTkh0YVA3Y25jNmJPRFdS?=
 =?utf-8?B?TnNJRTNkQWZrem0wZi9NWG5OUzR3d2VPWDBDN2ZoTTJUTkI5eURDL1R6ZTdT?=
 =?utf-8?B?Y2hmdGQ1b09MYlJjVCtsWDVlZ2JiTTY5QXR1SmZMbnV2dlF5bkxqbkpmNUZG?=
 =?utf-8?B?bVFSdk5BSEJIdFBQYVZWNC9XQlFaNFozdHNnL1cwMHJkNlFjUEdzdEprTWJm?=
 =?utf-8?B?ODI2czVXckt2MEZlUXJESHowVXVkU2dGUU02TGxjUzB5bGVUdXVHSHJOd2dQ?=
 =?utf-8?B?aHh1TzJ0aVY1NmFPOE9mbU0yeVJUK05aUGNWbFZxMXZiY2puNXZrd2RBcXBo?=
 =?utf-8?B?Y3U0MmlLNDhwK1RDOFVaMGttbm9LYnRPY3pkMjJuVFVibWN4ZlJtZWNSVmhS?=
 =?utf-8?B?RVI5d1FDeEIzV1ptSE5pRkllYzB2ODNSK3dBa3h4dkN0U2hUY3ErOVcybmhq?=
 =?utf-8?B?WkRaSnJrRlZ6a0hCNytLV3Z5RG10TTVmWW9tMEVITFJ5M1dpVU0zOWhwR0NG?=
 =?utf-8?B?TTNyOUpJdGppWFNXQTNLekIxN0x4NW9JMUMvQy9NSEp1YlpVVUtIdWtGTUZw?=
 =?utf-8?B?YWU5dXMxQlEva2taejRZYmZXR21YSHJlOHNmQmNqdkc1SklQbFAyOTFZbWpy?=
 =?utf-8?B?WkZ0UnJ1NGJBdnVHdkxxQVo1cHNuQlE5U2ttUXFvNWZyV3U5UHUvTGpyZW1Z?=
 =?utf-8?B?aHQ0TW4vbEJvV09zU0dFVTF2bncvRHpnQk9kR1F2end4R2E5MXZKWUlsYnhC?=
 =?utf-8?B?eWx2RHllL1VDVTJ2V3FBNmlhRFpsTDMreC9tc0JkdzNTUlJyS3llZkticXJo?=
 =?utf-8?B?MitrYWcyNGxhUkJLbFhoWXRidzEyYmFJSHQ5ZVdGSUViM1hmVjZiaDdleXp5?=
 =?utf-8?B?MWpubEZ4VzF0U1Q0cFBDaTFFUWVmZkJwSGV0WkE5SGlWMWUvOWhmRCtMemVm?=
 =?utf-8?B?NFphdC95U1RMVFArSTJ5T1B6VnBCaStUdXlMNHVpUFB6WmoxaUMrRzRHUHIz?=
 =?utf-8?B?czYyZVFPVFBUVFNlZUU5STVHUFR3cC94NjJ4MWhHQ0JXajRGclZhL2tqdFU1?=
 =?utf-8?B?WG5KMllZMnFvbGU5anhRdzN5N3pGRVpYM3NCcnI3SjUrbDhFcG1tWFhpOE9q?=
 =?utf-8?Q?QBtIuPy6GShhDD/jrTKDfDQ4Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775fa94b-4883-43c0-5c59-08dd7679f60f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:14.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7VEJrB0SpvpCdv0VO2NBvclaGMptPEa9LtMRYxGtWCJmWznonWK/QaWpnsoBDo1NlhdKFItPb+X52KebpM40Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

Hello Mathieu,

On 4/7/2025 7:17 PM, Mathieu Poirier wrote:
> Good morning,
>
> On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
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
>>   drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
>>   1 file changed, 100 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index b9bb15970966..80d4470cc731 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>>   MODULE_PARM_DESC(no_mailboxes,
>>   		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>>   
>> +/* Flag indicating that the remote is up and running */
>>   #define REMOTE_IS_READY				BIT(0)
>> +/* Flag indicating that the host should wait for a firmware-ready response */
>> +#define WAIT_FW_READY				BIT(1)
>>   #define REMOTE_READY_WAIT_MAX_RETRIES		500
>>   
>> +/* This flag is set in the DSP resource table's features field to indicate
>> + * that the firmware requires the host NOT to wait for a FW_READY response.
>> + */
>> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
>> +
>>   /* att flags */
>>   /* DSP own area */
>>   #define ATT_OWN					BIT(31)
>> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
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
>> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
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
>> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
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
>> +	size_t expected_size;
>> +
>> +	if (!imx_dsp_rsc) {
>> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
>> +		goto ignored;
>> +	}
>> +
>> +	/* Make sure resource isn't truncated */
>> +	expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);
> Something seems odd with this check... I don't see how adding
> imx_dsp_rsc->len with 4 will give us any indication of the expected size.
The fw_rsc_imx_dsp structure is based on Zephyr and OpenAMP ([1]).

The imx_dsp_rsc->len indicates the available resource size. Adding 4 
bytes (for uint32_t len member) gives the total structure size. If this 
does not match sizeof(struct fw_rsc_imx_dsp), the structure is incomplete.

I will also verify with avail and send a v4.

[1] 
https://github.com/OpenAMP/open-amp/blob/main/lib/include/openamp/remoteproc.h#L356

Thanks,
Iulia
>   To me
> two checks are required here:
>
> 1) if (sizeof(*rsc) > avail)
>
> 2) if (sizeof(*rsc) != imx_dsp_rsc->len)
>
> Otherwise I'm good with this new revision.
>
> Thanks,
> Mathieu
>
>> +	if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
>> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
>> +		goto ignored;
>> +	}
>> +
>> +	/*
>> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
>> +	 * wait for fw_ready reply (default work flow)
>> +	 */
>> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
>> +		dev_dbg(dev, "Invalid resource table magic number.\n");
>> +		goto ignored;
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
>> +		goto ignored;
>> +	}
>> +
>> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
>> +		priv->flags &= ~WAIT_FW_READY;
>> +	else
>> +		priv->flags |= WAIT_FW_READY;
>> +
>> +	return RSC_HANDLED;
>> +
>> +ignored:
>> +	priv->flags |= WAIT_FW_READY;
>> +	return RSC_IGNORED;
>> +}
>> +
>>   /*
>>    * Start function for rproc_ops
>>    *
>> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
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
>> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>>   	.kick		= imx_dsp_rproc_kick,
>>   	.load		= imx_dsp_rproc_elf_load_segments,
>>   	.parse_fw	= imx_dsp_rproc_parse_fw,
>> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>>   	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>>   	.sanity_check	= rproc_elf_sanity_check,
>>   	.get_boot_addr	= rproc_elf_get_boot_addr,
>> -- 
>> 2.25.1
>>
