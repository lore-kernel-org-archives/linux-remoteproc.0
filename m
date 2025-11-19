Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D372FE06E;
	Wed, 19 Nov 2025 04:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526165; cv=fail; b=eeU074jLvsgf3ThPKihlNLfqFOFzxoH0a8CuBLdV9ZVfWyYZfXEzXITPy4ctrmkGsfw09lyOQ5B4CMnVmQeEzyQviDvMTuGpC5+k/aVxESi+uYUdRouz6gYnC/m2CPjEYzeq8kG0ilemBaGE8f3nxr8rkdsMtOAkeYFJrrMSjMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526165; c=relaxed/simple;
	bh=05nCVQQrlixRb9SgxB7/ptAj2YaE9uRzzg91PGheW7E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b8z/ynf5UYYTk9G+fMoqUyfUDV43oe/IXSPBmV4y3bXirOwE4kcMZODQYOQ6F9O8IXj8phAykwQ7GZEl+FXwtDr0KOaT6Qc6hHVM6f9nVTMhwzcZc0J3ysFUMshkZ2vhPu+1a1dEzTDWqJhnm4arlnDOixXdEn3gaJ5hXLq80l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P1wnxS62; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P1wnxS62"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEupa2epKiJCwjn/y1OAqnZ2xJ6j152yJHJYmanN7AlycNLFcVBPTZ8bVwgVtz4KkrTIzAXaE8a8EtkBudQ+vqGNy2v9DmNYqq8LthX1gXuifB1ped2UV8L+bBeGZZjpX4bSOZQ450fboyKsdmEqqkKLd6v0bRbCkVXpAEkJVV9oE1ugV8fBnpmmhDR4Rr73sqrK3fazHCAo19XIZX21A/i6cDRclKrfIY1i+x+VTFliCsa1A8tpJujCoQMeksZKMxgGi+JEWBK1eRPnBwO+vkQxw2VoA7dbIzvflcNDjUwkiMM41RgJQcwqTxeH89l/z+sxcMdVN+j5iyxQIuTsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbBVaJ7YReJ/X7A171JjoBProBjbDKamT6rt1r4ns8A=;
 b=HoFaDItLRDQZBcEMYqlFUWAXnEC9pbcCbxWnVzbD/EzAr0/6rREbkBsWPSVam6kloORf06sC9UX+gWFiOHr3L6kWCC0e5YhzDdFd4PsT4CDGepe2c8ugFXWM5RyoKV6saMgtuiTR/6oxb6Au/kmX2V3k6W5NCLJlHx8B1hMWhIIJslxy58NWazsZnxK1ZDi1XuJx2JWMY5xmJGRkJGBVSVOo8+LSEywhWUdcvS1f47dmKGZrM2jmmzLoZbyx8JpBKyd/amGnvmz+8TJDpyibXCX3E8wZKEStvoSszZ4i+dJ2f7QQMJQqkVNJDi6U+3IRm5Sm7DH7jBlIzYng66YCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbBVaJ7YReJ/X7A171JjoBProBjbDKamT6rt1r4ns8A=;
 b=P1wnxS62oawu3oJXlI2uvyrzcu6UBKV/+ySkAGLsVE87UEkOTr/FSGcMRVyJdXx/zuQZ01xieaLwHnAURWpg5EhXYfdjn8Mz904vsQrw2eVS4gE0aKZ6Blif0KcKOagkvYcShMvC+ALuVjY2/T3PadaCzmWFV48VbhzNfrnIvz/9yPf82wuGKrbE6aIYLOuZKYmOB3wItYR0/T5859N434wCON07b5mHoDlcPncQS5Bd1k+gJolJNwoO6fZQpc80IaFGZ/sfS0qG7aP5S6xzNcRgm+Mv7/op8ak7+h7vdjflvwH3mAoy2bUaGsuphgRrW4sCOkWnYUUScPlWJt2jzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:53 +0800
Subject: [PATCH v4 08/12] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_MMIO switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-8-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be71720-c419-43a3-335f-08de272346ae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW1BTmt1T1pBTTZ2TFVabzRrcGEvVWR1TGlPMm0zdWlqVGI5b0J1VWMvZ1BX?=
 =?utf-8?B?TVhML3ZjL0tYTlFxc3hxNExYeHJHTm9WRVNPb0tsY3c5MFBTeUJCZVNzT2Fj?=
 =?utf-8?B?OWV2WHRORWdYaEFiVGJUMU9aU0NsNEVQVE04SmEwOTE5L1VPU3NYS0JkVzho?=
 =?utf-8?B?RU9VMGpkbGRmNE5aV213RWxIVEUvK2lzei9VQkFnelp5WndwZVVlQ3F1UXlu?=
 =?utf-8?B?UHlqQW0wUnUzNlhRTEFFQjJqZ1hoR0VVWjdPTnFpekZBTDBxTmc4OHkzcUJm?=
 =?utf-8?B?aUV2SnEyS2VBWWlxaG83TnFTU2t6TU10TUtFRjVpVEJ3WSt2NGZvYk9EL2ZS?=
 =?utf-8?B?SUoybjdwSU4yVUx3QW1BR1hjZ3NkMC9paWM5eHA3YVJjcmlmZVlGOXRaTnJZ?=
 =?utf-8?B?VjlQM3ZRY1RwK1VaU0t0QWhZcm9zK2dick9QeTF4UTFpTEpPNTZXZ2M0K1Q5?=
 =?utf-8?B?SFRJMVdaR001OVVRZWJENEE1WE5EaDJEbUZHcFRZNk4zYUVGVFdXTUhmeWFT?=
 =?utf-8?B?K1MxWG1YUGVPY3h6Z1ZOYmdUN2lUdDBBYjRMMkxJaDRlT2RDOTM4aGFHeGMz?=
 =?utf-8?B?aHlJcU9ML3VwVzlxU3VuOExlVEdwcWtVWmlXMWp6bWRlbUNCVVFrSEozZmND?=
 =?utf-8?B?RkViVEdiWjZnRnZHUUtMdFdOZkIvMmZtbk5FZVEvK3VicEp2TXhHaUJYaGlM?=
 =?utf-8?B?N2pscFNlVWRqLzVqelU3ZGREQlRKWjhNbUtGb1lHWFEzK2RZZ0xMcDhSRnNX?=
 =?utf-8?B?Ung1VjRwa1JORXFqNXRGaCtXMnFOR05VZ2lHMVFiamRZUk9FVGlZOUFTV1Yy?=
 =?utf-8?B?WngwRHVYeDRhbXBiNVR4aXlQRGpDbzJDUUw0eVA4ZlFNVG52bXhidGEweTUx?=
 =?utf-8?B?cTh0RWo3dWc5ZjNiMitSR1oyWlBQVm5BYlhRV05DRVlNcUk5QzRBTThKejNH?=
 =?utf-8?B?TWNBVkpLSnRlb3VXTldPdGdVNVRSOFhXc011NDFrRnJ6Z2pqM3l1ZEpzTTZJ?=
 =?utf-8?B?RjBDd2hlcWw4YzJyaGoveTduam11UEcvZllXR2hvN0pvZlhUemZ4QkorU3Zy?=
 =?utf-8?B?eFJoTUlBcGFDeVkyTERHTFpBdEZQSEpremY1ZlFnZGloc2t2Y0I5V1ZUamwr?=
 =?utf-8?B?T3VUQkR5YVNtaFYvZ1pwRkRtYnpUeE1KTW1iY1Q2azhvNDVPSGFPaUtQSVph?=
 =?utf-8?B?TEZsQVAwVFV0d1l4eXJYcHM2c2tZVkJyQ1FKV0JnSUhlaURqZmtxcW4yZzds?=
 =?utf-8?B?WlNsVS9DdnU2QnFMWlFKd0ZEbE1uRHlSSlcyNmlUeWh4SlNYWnN2ZE9WL3p0?=
 =?utf-8?B?bHBLWVVBK283K1B6TENvY0ZhZHkvMlUwMTkzUnNBaWRCSzBlK05DSXpFYWo2?=
 =?utf-8?B?KzAvcjBkY1BEaFlrTmtmRnkxcGY1TW5nVkRBclRFV2grTHBUclBRZkZZcEEy?=
 =?utf-8?B?UHVmbTNMbU5ud0cyUXpnMmRaQnlHekxZZHF4RC9JVTFVeUIzMWpCZTlRS1h1?=
 =?utf-8?B?N05na241VXhSdVZwcVpJcmptc3JDZGJSMFF1dWE4b1pjclN6OVllV1NMUnJm?=
 =?utf-8?B?YVA1V2JvMTJDUWZGdWxrU05UUmQ4Y2srRC9ra3kvSitldU96T1VTcktaSFpK?=
 =?utf-8?B?VDVqME1ueGUyUmx5d2d0UHRjWW9hNVpEcW5sL2JVZEtEbFBqek9GTmd1emsz?=
 =?utf-8?B?S2JjSnNHbU9ydGpabXR4Vk5PNTVnL3lpQzJ6Rm1ka0tUalJKdS8xN3g5dTlu?=
 =?utf-8?B?M2ZGOE9NOEgvT01kR0J4QkJta0dadDV3L1BiOStpWmlyS0tlNlA3ZW4rc2Iz?=
 =?utf-8?B?UnV4VTN3Z2t0VGhaalFVYjVLWGNhVjc0bSs3NDRHUG1MdWNidTFSdnI1NVV1?=
 =?utf-8?B?YVMrcjVZc29UNVhVTjUxaEZCcjRZV0xjSW5UTHJKUklKdHgxYU9zdS9oa3VK?=
 =?utf-8?B?U2hDS3FTRmllaTI2MlRJNkpncEd2ZjEzU0s5NDB3VUQ2WVdpMUxVUXFWbEpp?=
 =?utf-8?B?S0M0eWZDbzV5TmNGZFpncGJ1WjM5bXk2S1A3NEJ2WWorK0dUWFNaeldtUGM3?=
 =?utf-8?B?ZTdjRXVST21uMjJMbVk2OUZzK0E5Y00xbXRPUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkVFay9jSFg3ano1NEREYlVWaTNtYno5cHpGVjAxdW1LaWgzSnQzR1pkZGd6?=
 =?utf-8?B?NUJ2SWdybVAzOVlVdTEyZklSVUZXaU1SZ0s5cGJFeWpZcVpLcTVGMlczTnh4?=
 =?utf-8?B?TXhmMGw3NzNGczloOWFQcExoMHBlK3F0VGVvd0N5alpMYTlseGFreEFNWDBM?=
 =?utf-8?B?aDJDRnRBMG0xSGU5YnNCdWx1YmNTeVorV3p6MUdWWU9yZGZqUEgxWVFFYTdz?=
 =?utf-8?B?elF0VkMyZXlzdWVZVDdRbDdFclR3RStRM0Rpa0hiUHFjNVZrRUdHRXE3WXJP?=
 =?utf-8?B?cXdCWVVPcmxaNnhkSnpiYWgxRTMxYTZzQzhkRXEvUHRZL3U2SWplbGtONE84?=
 =?utf-8?B?MXRXT2pES2dFVzZqMEgxVnJUenNxT0VIblAxNXZub0dqZmQ4TEJrWlRDRVBj?=
 =?utf-8?B?VVk2MzBwRW1hOXJURVlneDdsUGo0a3phNkU4dVRKMVZCaDdqWEFCWGZWcDFw?=
 =?utf-8?B?M1lvc0JFMEZ6Y2RjNUEyb1JWUkN0Ti9JQ01mMXV5OGQ1bFhMbkFNdHEyT2dO?=
 =?utf-8?B?aGd2RUFNZDJMZStFYk1TQ2c2bER2L2Z1K0ZGaHBzZkdyV2NpTDhtbUtqc0FK?=
 =?utf-8?B?ZkVyWFFzam0wdWhZdmtYZGRBcGxzQ2Y0Smoxa2ZIYm5FZWZONy8zNDFsNURp?=
 =?utf-8?B?UFVHR1FiMnNsV0pMdDI1bEdnQlZJZEVLTy92Y0ZKWkhlQzVWRE84S2dMTm94?=
 =?utf-8?B?YUdZeEoySXNUdU92WDROTnArMmlUcDNHcTROeTBCenYvVjR0ajdKVHNUdllF?=
 =?utf-8?B?UkJ4ejRUUnpzYlVzTXk2ck5aWmliaU44NUNRYVE2QytsTlRhRVJQVFBsUWRO?=
 =?utf-8?B?NWJnb2Z6eHdmT3hUNG5UcWI4VktZMG82KzNpZlBaSVpXL2JGSzlsNXpVYXhk?=
 =?utf-8?B?S2l5TzVFUDVwa3RuNXhHQUNlWVgyMU0wY09Pdk5lSW5QdXpmVzI5NFdYc3NP?=
 =?utf-8?B?dG9hWkRXV3V6dXB6dWxCN2x0cW01NWlkdmoxMnRsNEtWN1RneDlIbDdMRFdi?=
 =?utf-8?B?WUk4U2RvZTBCNXhOWFltM3Jac0JteXV6V1U4U3dFbjFtZDhVVjZvSkUyV0xu?=
 =?utf-8?B?bk5KL1JCcTdRWWlpNEIxQUhkN2RUZDlYdTJrbG1QemIxZUdzVTA3a1FHMHN5?=
 =?utf-8?B?SzQwOXAxOFZkRFhDYkZ5UER3RVlJdi9zVjhOT1A1VUgyRDVFWEtVclZINVJJ?=
 =?utf-8?B?SExRTEtLZVRWU1BxZ3VPdEt3Qk9yV0pHK2ZwT1cxbzJWVnhjWkVaem5tRjJr?=
 =?utf-8?B?anBrMGkrckVOTXZKOExqVm1UU3hoQ2Q2cHJiZEVRcXFyTmZnZWxYTTNYdXJx?=
 =?utf-8?B?aVA2STFnZFQzS0dFU1JhcnUrRTY3YlhsVXVXQXI3Zk1LcFJ3VHR2T2QrM2k5?=
 =?utf-8?B?TllOOUhiSUpTUm5EZ2ZXNnAzL3E0RllsQUY3cjR4RTYzdllDZTEycnNJa3BO?=
 =?utf-8?B?RERvcE91RWR2R2VkUkJIcjk0T0MxQ1h0Nk5qK0JVZ0pERTQvUlBFZVFwNmFX?=
 =?utf-8?B?OE1yeE5OUERpb3JVZVJkZlh0dEVUVHNRdlc2ckFOekFPK1dyMkh2TGM1OVlZ?=
 =?utf-8?B?dGF2RGtOK3g2RExzY0ZmMDNkWjJybzdaOXFDRDRzdHE2ZnFvMy82R0p5WWVl?=
 =?utf-8?B?ZEZHQW1RUWJ3VkRMZGVIWkdERWVUU2wyK1lmVTFtME1oYm9telBLUVcyTE02?=
 =?utf-8?B?bm94bUZ1TGFLNGNRLzNiZWdpTXNmaEZheGc0TkF6YXVPKzl1TUlsNHZXSkFV?=
 =?utf-8?B?S0JXbHNaRGF2Z2tyOTBaTTFZRmp6UlBCYnQzVytMeGN2OVgza1BQVW91UEp6?=
 =?utf-8?B?Q05SNnQwU0JkRUhqcHlWazVjcUhaUEduU3B5S0RaZmRqVmFjR0JUUVdCVnM2?=
 =?utf-8?B?RDM1OE9COVFTR1BsMGxaeS9YZWhRNExOb3Uya3dFTWF1cDMzUGFaU0NxQllw?=
 =?utf-8?B?Zk9yTERVZjNqdnpiTDNXbmQrcE45R1NWRDNaYlJyZTR2M0ZBRFpkY1FCelpj?=
 =?utf-8?B?QWx6eDVNdGZrK0ExYnJMcGsxTVdIS0xxSXBmMGErMkhjbmEzMUNBQnBKdjNu?=
 =?utf-8?B?cEEyeTZuYy83TnBOZTRYWnJoN0wxdlh5VTlOU0lJblZMZDYrbHdLcVExbThy?=
 =?utf-8?Q?2GJCECMXZLTRkdvq1aor+6Zn0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be71720-c419-43a3-335f-08de272346ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:39.9037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: et7vUBgZmvNwQPPtA5EbrA2DzInNRzrXj6ube7dyi4Ya+AhQuuhXcw9zZSt+h5Ehy6eB5Ajjx6iKqqdHQ2rXtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

From: Peng Fan <peng.fan@nxp.com>

Introduce imx_dsp_rproc_mmio_{start, stop, detect_mode}() helper functions
for i.MX variants using IMX_RPROC_MMIO to manage remote processors.

Allows the removal of the IMX_RPROC_MMIO switch-case blocks from
imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
maintainable code.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 61 +++++++++++++++++++++++++-------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f28d25cab3f1d89e5cde37a04b528870a59abeed..71776816c3508a86bf7b8a09ac45827a83a7bb3a 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -338,6 +338,14 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 	return RSC_HANDLED;
 }
 
+static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -360,12 +368,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap,
-					 dcfg->src_reg,
-					 dcfg->src_mask,
-					 dcfg->src_start);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -388,6 +390,14 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 /*
  * Stop function for rproc_ops
  * It clears the REMOTE_IS_READY flags
@@ -411,10 +421,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
-					 dcfg->src_stop);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -1032,6 +1038,23 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
+static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	struct regmap *regmap;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+
+	return 0;
+}
+
 /**
  * imx_dsp_rproc_detect_mode() - detect DSP control mode
  * @priv: private data pointer
@@ -1049,7 +1072,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = priv->rproc->dev.parent;
-	struct regmap *regmap;
 	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
@@ -1061,15 +1083,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 		if (ret)
 			return ret;
 		break;
-	case IMX_RPROC_MMIO:
-		regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "failed to find syscon\n");
-			return PTR_ERR(regmap);
-		}
-
-		priv->regmap = regmap;
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
 		if (IS_ERR(priv->run_stall)) {
@@ -1301,6 +1314,12 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
+	.start		= imx_dsp_rproc_mmio_start,
+	.stop		= imx_dsp_rproc_mmio_stop,
+	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
+};
+
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
@@ -1321,7 +1340,7 @@ static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
 	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
 	.att		= imx_dsp_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_dsp_rproc_ops_mmio,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index aeed08bdfb5619c7afd7201589f417cfd6745818..912827c39c0dedeed76c13740efd42a8e7cf9c45 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -18,8 +18,6 @@ struct imx_rproc_att {
 /* Remote core start/stop method */
 enum imx_rproc_method {
 	IMX_RPROC_NONE,
-	/* Through syscon regmap */
-	IMX_RPROC_MMIO,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
 	/* Through System Control Unit API */

-- 
2.37.1

