Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334D52DCF50;
	Tue, 28 Oct 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639535; cv=fail; b=qP3/Np9pEMX0uSJWqjy9YM6u34h1dOooFNiRiAWqifnXG4GjQ1bmcgNY/tbHgmXXm1aMs9PuhxsrattZJy+kwAB7UGOhjkyHAKCNcbEnu8/RfqjXR/fyS9E3/pd7BAdMuDPmPAnLFv3Ui5ztVnAEos5luC3mVcsTm/d5Du6uRdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639535; c=relaxed/simple;
	bh=avdlzDHrzg9u9lQnekFeY6Vk3Zqyc4rSKSp+MF6sk54=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=s+hU6JBLN5HCYhAQs2ke0s5WsahQQ5Qq8723AMpUg9LBUy7Dj1be2JytTYcNWE1acYrPlQvbA5YMONFRs4ktrNduBfwuqjgTqkVUAvjf1oi7ohba1xVdQODQ0hFlT+frwMBSWoKYcmA50Pvfsk/L/5Kx6rlq8Cz+npDOMei75oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jWsczogP; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jWsczogP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGh03ylhfhrwipCjXSuPD+y2Fv2Q7nmIhz+HL/mN3T20ogPO4aFg+LD3Y68cKWquwb/nYGA9BwTKtUyoeM3XEicUnx5E2UvgL9pS9HNqBSdN00ViFIqRYCZn5ZGeXyUgvw4P+KxhfHhuCIFuhBaBAIynwdckNFCkkz4aac0ElvhSvsQ3EccF/GETnlJkBn6xzGNrMLfHwgDlfGEJJBKettHAedg7noc4jZ5+qhELCJM8R2/03RdT2PHh9k0ufTvwqxDDJIxu8ruSdd2S5PcrY45tb7YXXpC28+/tek1I/5kvMKAKgyMtz4SHY5/w8wGkbCxbKkpJ01pOXb+aXTjBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vlyufoZ90pT5YsEMXqZJHcHzy5g9x/cOs51+q6qqVU=;
 b=gcPv1coENQtsDaTCb+ES9SjSzg4cSNTiCmLAmTjb3do+gEkryZtwiy+a9Z3LWEYSiHo+JxQLe351yBfefGQ4TxwQiAPBC1mBwdKlRcIyi7i1maFP4kXyU9IOiMHfjukLRbRpy2fveVVKvJTKBkd26b8GoIj6AAaZgsHvy4OyCdp96kae94u3la2fqFq7qvbkCVsVBdK8oGSW2wqS4O6pipwmxuwsf1uauoKv0neIhMgXSFy72UaRPlqvSDHCGvIi6Qc7Ok4Xt57GULB67P2IruN8y3Bgj3To+zmOL/mYnNmWuF20T9YbfYJVrp8b22tNgFuLDxtHYG7Wg3/6e4FTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vlyufoZ90pT5YsEMXqZJHcHzy5g9x/cOs51+q6qqVU=;
 b=jWsczogPwJkti/xIou6woTwZ/SeNN6H0n344zqST69RjtFd+3LX7n5HhVRFaAANHShlFiOWPC/LZAAAY4xyJfCuEGLSlWlN3z7IihzfpoE46nzBciLXIn616jLFrasOWHBDQHkXnqQcFL7RK5zP6yH/C6krP9Qz5Plr+QeiJrHP2a1maszIqAbYyARGXCjae5nNa8ro40eYkfkvbnJMPHK62gV21Qw9nrc3AQAiV4dh4yNqL2umc9Qbuo0i3WVJwtUv4HWwYbllpmy1cgD49qyaoorOGLuBmuHv7kkoLDcQ56u7qkfxpFSbVKvEHaOPrjIc2ilR5VgN7M8Mhb5trmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 08:18:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 08:18:51 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 28 Oct 2025 16:18:04 +0800
Subject: [PATCH 4/4] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-imx95-rproc-2025-10-28-v1-4-ce9e7db9edcb@nxp.com>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761639500; l=2375;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=avdlzDHrzg9u9lQnekFeY6Vk3Zqyc4rSKSp+MF6sk54=;
 b=EcAeG15D3zCvvlNL1S4PC6YbsX0ZDeQJVJVt23MZQjJqbM1bg0viD2SFPn0yQycmXHaZxOVxd
 yrBaCaOIBo9CJOWCkubYoLeI3q7ZGSzZR/2GGV9YZ2raR9SMs6LeJwA
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: d3686943-d884-4a26-8331-08de15faa0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUltY1FEa0VFNEFRSzAzOXcybUFjaFVzYkQvRWx2U25mcldBNlBwNWdQT3pS?=
 =?utf-8?B?bk54NHQ5ai9JQlhPRU9hMWhOZ3BSVE5UeEhMQlN2YnEvZk9XWmdVZ3BibWpa?=
 =?utf-8?B?eEhRbXYzbmFXOUpKTENvZ2NOMGZHOVJ0Y2h3Y05DRklmK0J0OTg0M0lWc2t2?=
 =?utf-8?B?UjgvcVVMMk9jUm5zQ05GWlZOc1V2SGN2TDNtdFNnYTVGS0hzckhKcGltYlAr?=
 =?utf-8?B?Mk5nYnNrYVRodzV5YXhDditYR1ZwcWZoc2lGT2Z1R2ZIRUtzSzhNZ3VDdm1X?=
 =?utf-8?B?cTdJV3cwcStUT09jZE9KTlZzaFRWUHN1K2ZxVjc0Q04yb2hvL255aEp2c0VB?=
 =?utf-8?B?NzFqK0pVczJCSFRCSTFBLzEyU3BxaitPWlZhVjJPSjIvTkVYR0dLZDBJT0FC?=
 =?utf-8?B?QXBWSTh4SjdNSFZoUm9ZSjRnK01lbk5aWjN2QkkwZk1uaWdlOWJXUzFaZExV?=
 =?utf-8?B?ZHJDUnpJOVh1TG80SDFYckUzbDZkcXUyWHRYTFljd3NWaGxnbjNGQ2ZCMlVt?=
 =?utf-8?B?ai9QQzY0Mk5NbmRsOERscDFOclhCL3NiV3ZNOSt5MlNUM2U5dzNkMTVqc0R3?=
 =?utf-8?B?dlBNd0ZhNjJTcEp1Qm5WZkF5aXROUFhqdFM2S3V0NEN5UDh5ZkZsc3hxWmVD?=
 =?utf-8?B?M3V5NTZuQ2tWcFY0Zlhhb0ltZFhQOXVEMlhObFR6ZDB3WTd2cTBvRk9ZQnhK?=
 =?utf-8?B?ZzJ2Sm5vRFFpWmhwNFJkdnhDSGozcjY3cGRSTTA0bXNDd0UweFJkRGQ5V1l5?=
 =?utf-8?B?YThPUE85NGNjemVSY3MvdUU2Y0NQaG5RY1NLWGNxdVZtdHVUNXNEK09yc1hI?=
 =?utf-8?B?VUljWmsvWnNoR3JSL1pDb2hFMHYrbkY1dXdZMkZRNWhXc0I4K3U1bHd6SXB2?=
 =?utf-8?B?WC80Wk9mSTVTMUoxeG9LSFJzcy9FSDRkWEdpdWR6WWRhVGI2OFplc2hiTDZ5?=
 =?utf-8?B?VldvWVo3VnE2cTVtaGcyVTVaZW4rcko0R3hvOERUQmNDRlBKdHhnV1QvOSth?=
 =?utf-8?B?MFZ5SmVXRWM5bWw3MHRHNXlnMXYvWUphNmVaQkNyMUtFUjBUS3BHOFY4R0NY?=
 =?utf-8?B?eGJuTGk3SWFmNldTbG50VGk3Mm5DU0FTNTFxRnpmd1V6ZzlMY0hoMjZIMXhp?=
 =?utf-8?B?eXl0WWdZM2xhaFZ1b2c2SkRrUHVEcXVqQzMzY2JlZzRSeVRGV0p6MkxSSzJN?=
 =?utf-8?B?RThwRHJkWEhjcktlVk43K01VaWtZUUFiQjc2ZnAvWW1IemZhR21Xc2NnT2xP?=
 =?utf-8?B?RUxxelcxS2hHY1g0MTdiMG03QnovU2d6QitsMkJXZ05vQXZIZ000WUFKNFA0?=
 =?utf-8?B?UXlidmd3YjJuSGkydmdzbXVZVlNDZkJ2V0k0bm1tQ2FPcGd0VWVLb2VFVDJQ?=
 =?utf-8?B?RlhxVmdsaHIvK015c1lrSmFhUkVTRHNPNzhGVStOUmRZTU1TWjNzUTBucW44?=
 =?utf-8?B?VGMvVzR5Q3lNakxzbUloVzdGTGVPd3phTlozemt1alpUdm9ocWt1S0dna0xz?=
 =?utf-8?B?QVl4WCs2T2x1SVdUZ1N4OVkwRlozbUYyT0VyUU9xZUtaUDJlZzlIOUhRVGxx?=
 =?utf-8?B?RFFzRWZXcHFDM2xIaFBaSWZXcVluZGQ5QkdWVjNJY2U0VUVGNEdGOU8wUlUy?=
 =?utf-8?B?c2lacnhFVnNYbmlZWGVRZ3Y2OFl4QzZ1MmJ3UHFnWGgyTWZVR2RKVEVQNTdk?=
 =?utf-8?B?NXdueURSYkRGaHhmaCtlYkJQOUVmSlR6Tyttc1dTczNVak5QYVJPZkRPM20r?=
 =?utf-8?B?UzRBYUY4YlY4ZmUrMlFWWkxENlh0ZGdtUXZkNXFya3I3cHVLMUVqRndZcCtm?=
 =?utf-8?B?YVVkTUhLT0dDaFR5cjNOT3F5ZC9rQnkvazRwS05aejRtWktuZkl4QkFWcklr?=
 =?utf-8?B?clVJcUZBbEhsbnlGMDR6WGhwUlI3SnY3Ui9FYVRQb2V2WGo1U0s0Uks4MnJm?=
 =?utf-8?B?Ulp0M0h0Nk8yTDRydGNWM053bkhaZGZlL21BdVduSER3cVJ3c0FabmgwSjVq?=
 =?utf-8?B?a1ZTSmdaZjVZSW5lT2F4YzVHY0VGT3puM25BREhtS2JJT1RHbEgwVGxSeEsr?=
 =?utf-8?B?TE8xc2xxNVRhZnArMFpEYllqdU1yckljdC83QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0NqblpEZUpPMUwyMnZoVy9sQ1lqL3hicUJzTE13cTdLSkduL2doeGQwQzZZ?=
 =?utf-8?B?eFpjTHBsV1FHUUw3Z3NlZm15amRkdjhMNFR2SFZUTjQ2U1NUdkZ2WHNyV2dr?=
 =?utf-8?B?Q3F0eG9JRW1MYWxwcWQ4bVp3RVNzcEFvdnVDTGU3L09DcTV0T0VvR3JLVmgr?=
 =?utf-8?B?UUN2ZzNicXhJQmVLOHRaa3JSdnZyV3dmS3dDU0NudGl0c3VWYzZKRzBJMVJR?=
 =?utf-8?B?QVlKS3lFTmNQTytUMDdpaDFwYTZabGdBVEE3UnVqVzdlb1NLWUFsUTR5VE1Z?=
 =?utf-8?B?eHdOazhPL0ZWWGh1OXVjWmdIcTBiK2lwdm1RNTFJRE9iVDB3bGdOaWtNYWor?=
 =?utf-8?B?dm9UaXFQL1pWOUIxSHdsTkthZHU3UnRLeFM5eVlWYlFEakJtUVg2Zjh6Tm9J?=
 =?utf-8?B?azN1WEJJN0dqN3paZEQwOU43MStFcFArOWk5T3RIWVg2ZnY5V3htSVBXcHkx?=
 =?utf-8?B?bC9DZnJvbkFXZU04RGxKWkZLSS9LcFJpSHZwOXF5Mm9OZlRBc1lxWDJuU3Jh?=
 =?utf-8?B?M3hNdVhnQW5ocE1Iais2RzRROG1lY3dsSUhUdnZlSWoxQlY0MC9LTHR2RWRT?=
 =?utf-8?B?UkQ2b1Z0U3dsSGw2SmxiVHg1SkdLSnJWV0Yya1U0Smdqb0xhUkhDTjIyVkxt?=
 =?utf-8?B?TzJsaGRKZFcyejRza2E3SUJZNFpHSWtkamJtK3dqM21MZWlCck5adVBVWlRP?=
 =?utf-8?B?M3ZmeENoK3o5YURnSnZYa3NvQlZVeG9BcUxmdlVxQ2J2UjU5VHBhbncyYUdM?=
 =?utf-8?B?UDBsT3g3YXozdWM4Qm05N2xpd0l0dkVnM0lQR1V1SmF4MkMyQ0I5cmxyVitw?=
 =?utf-8?B?ZmdpVmxyd0x4Z3N3YUkxNGphU1lkbSt4L2dOUURicnd6cllRc3UvSG5mUlJw?=
 =?utf-8?B?MDMyay9rUUkvcW10dllOMm5XaDE3U0l3K1VBb1I2ZjErdHE0N3p2cDltZ1JN?=
 =?utf-8?B?THloMnpEazNoZlhBQWdYVTNZU0JtbGlNeXkwZVNXbE14dTF2WnJDaGRsN1pz?=
 =?utf-8?B?MERSYi8vdUI5Mlp3emRSK0dkZHVBUWpLMCt3WWJjNTM4a2hJV05HYjVFV0dU?=
 =?utf-8?B?THFOYkdLWnVlbll5ZUN3UGpMNWdvRkYyQTVhK2NvMlE2bkc2WlVIRy9jSlZS?=
 =?utf-8?B?UWFhdUFzU08vZ2ExZmp3SisxdnZrbk96Z1piY2xKckcrUnM5NmxpcEhHOVlz?=
 =?utf-8?B?TjFoZEJnbnNpKytBYnNWMGRYVHp2bnlobUQvK3hOTzRmRncrMXIyWm1ESGR4?=
 =?utf-8?B?ek9JQlhNVzFRbXNJMUhmVHZFRFFrNW44Q0VDeWNqMUpCTGQ3QS9EK3BGOWNt?=
 =?utf-8?B?Z3ljSlV4OWNRRWVPREhGRTEyZ1V5R3hRMFFia1ZmRHVjK245aUxnekdQV2hH?=
 =?utf-8?B?Q2pxVnhMUC9wVERmUnBYdEN3M2JHTUw4L0s4Uk9qVHdXejloNDZ3KytmcEY1?=
 =?utf-8?B?V09OVkJDV3ZoMVpNWGxvaVR5Nm1mRVMwM3lsMTlYQmVzc0c5VkREb2dhdHNt?=
 =?utf-8?B?OGw0U0NvSkFtU0lNaDd1bGh6RGRYekp2SmozNTVNeko5VUZnRTdGTnFJR0ZV?=
 =?utf-8?B?czRsUkN6ZGxZZHJ1ajlkYzVYZ1JENVhYWVZTWll4OXh3aTNXVDlLSWY2WEFB?=
 =?utf-8?B?Nm9oN0huSkxpaVlVZzJFKzhPb29oNkhtbG1UeFU1WE9tbVZDWHh1VDBlNi9R?=
 =?utf-8?B?OEtLdlhxbTdVbXZYTlltblNtalNhRktyQ250bDZaeGJvODlrdURoMEJGckF2?=
 =?utf-8?B?Sm9EbkVEeTZVTVh2R1picXg2VmU2V2xPSU52OWluWkg2NTlZc2dGTFkrOFVj?=
 =?utf-8?B?eFc0T0hCdnN0c0NtQ3NKRVNReDRZUC9VS051VkZXNE8wY29CZDhYZy8vN3Vv?=
 =?utf-8?B?eFFLSWFHSHVJZzFGcUNPeWFXZmFjbFBOQVpDTFR3WjFIOWp0VnZGZFE1NDJC?=
 =?utf-8?B?K3ZsZ2kwTGZwczZjWEVnQzkzNGk5UVVxMm1oWmFJcHVCbzV0RnRkbzZwRTNK?=
 =?utf-8?B?eHVuTHp0MnhpMVNSRWN0MHBWWHp4cTBnZTk5MXBJa2JZM0R5TE1JS3dRZ2lC?=
 =?utf-8?B?NW5YVjlRZ2ZuUnRRK2tlNFNPR0x2czVVOHU5NEJUL0k5TXlRVXNETmpRMjhB?=
 =?utf-8?Q?H0vu08GKWmL6GS+ShBXSkZp+N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3686943-d884-4a26-8331-08de15faa0a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:18:51.6219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Nil7fNwTty97n4J84SO4mqm3NPJwmHsxL89Zq7LkC+TesIiF3Aam4e/OBC3kVMkFJNp7GfxghALwgpferJubA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8ecf95c81b598bbe38b721808878e5427339a08e..45eeb5d61d43c9ce72e840611e93af067a4296e7 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -74,6 +74,10 @@
 
 #define IMX_SC_IRQ_GROUP_REBOOTED	5
 
+/* Must align with System Manager Firmware */
+#define IMX95_M7_CPUID			1
+#define IMX95_M7_LMID			1
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -131,6 +135,18 @@ struct imx_rproc {
 	u32				flags;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1440,6 +1456,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.ops		= &imx_rproc_ops_sm,
+	.cpuid		= IMX95_M7_CPUID,
+	.lmid		= IMX95_M7_LMID,
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
@@ -1454,6 +1478,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

