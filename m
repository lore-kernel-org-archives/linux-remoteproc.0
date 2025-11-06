Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB41DF254;
	Thu,  6 Nov 2025 03:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399890; cv=fail; b=Z1/YhNSYL0zfL8ui4yv289A3v3V+ZPUU3oOp5ZyvXFSV6DMW/EI7ZU3ZndfCfUD21AbriK69zjRoGoHHfL0Y2cRs7yp9sFI2OlBVNVSkEaMAXAfbP7LVxphpcxEvVKVIYxBJYg1MYrztPje/f568oxqVGPDpyYw298AmmdHL8UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399890; c=relaxed/simple;
	bh=/GQNWAxnuzz/Fvi6TX7zQgT+OJeyV8GsV7UaS2Mf/OU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WNg6reOBG7+Bk88EVCePCU9iD9GZc57Z/GkQJltI99tlZnTLQkjTY7lTjvFSJl8qk2n73Z4989Fiq8SCsVb4Wd48ZZJfTgFvUHrd32So14lCDUd1qpI2mtiOx0iEe2VTmYQ3y9QpanrUEc86olwqSp3DzDbqcZYObat3hgqupWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FChjaTs3; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FChjaTs3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boWJnHSYtMedrYg4/ZUyDu0QBOX50JqCeZTvs71QFe/IMkgx+lLQ70tSFhRaa9BogIgT+HrOuauojdkap8mQuJndJHh4eahQN33ibRhMeLHFzlghZmxRvRJwR2ROkqVAUNR+dnwzeYVQ3p2nt/W9LX/k9RgqEs24yaOphKsgomKxiP/JOMiFmzdgusr7DnSfuXUE5LSqsq59xI6hcb0cGLQq82xzc1Z0xXoQJWXvp1NOW6ioggAfti1z/6liGQzrSuI2wqt4O7QKMkklVobmM2CMa9nE41VlYAeBNM603jHNmVD81eCImiQj6but4oE1/LXaSpmeesKjuwZujkCLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb/doVVYTQ8i+xe3Rwic4xjXgD/ntRjJ5EgKDxyw2DI=;
 b=r+4pVPD1teN22H3J6lf3L3G6NvmpZyRwPsOEudPh3eOYvH0ROcLu1n+SCPYg/H5ti2DuzXiL0dceAw7wNc0UYRGqQniASU3tSOO6qGNPeq/uAWwyGB62f8brpWvmTOQlYU+Olq8UaSEldqssZUGOLpPnZaxgKw6fLuMbcQhDyNZG9l+n0vR0834B4FG/E7856vw5XSXo85DFYyKODH/ATgGx51gYnwnYNM5yfSygNjVJ/XsfPuy7swh0VSCTjva81nFVFsg0GLpba4BisL254W1dCY6VCnMoFeSM9C0GuN9QmFpFUSb7IC/H3JqcZzaTPK3fj34eNzE1UBBCBagO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb/doVVYTQ8i+xe3Rwic4xjXgD/ntRjJ5EgKDxyw2DI=;
 b=FChjaTs3ithO34KW0enQD7e6jloQNWbic24P2mYZGcKO/P6uUiqJFZqwf/VsaRDnBDbNPIGYQRWcib7laYETzm2gxStmpgBOIsnQuByzPfhVDXawYIXdtcbR8U+5Urhtgp1Ix7uS1JP5qH0HmBrCNJGBfOfod4m2RtKPsmGfjX9gW8BEX9mBiKwawdNsa8GeaKJRKIB+Xm0C1EEG5/cpoSc7rUJxlBseoAnv8wrtE8kpIwHAZZYKVbFVmujZhImGqqOQp7TSnw3JrN2fZbir1VflkVOFWuAbM4Q2TRfdlXyD3eCYk65QVZwcr+jj6NNj5Mphdp6JAplpxuXz4Q2FIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:25 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:33 +0800
Subject: [PATCH 07/11] remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg
 closer to imx_dsp_rproc_of_match
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-7-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=4866;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=/GQNWAxnuzz/Fvi6TX7zQgT+OJeyV8GsV7UaS2Mf/OU=;
 b=ohBKyWX02wGIC3D5lTYf4pNuQvBtoBpFn2T6pKo6yV8GHY5I+zP2sL6jLGEQN+LJk2RIPmXsT
 9JaUwDZJ9UCAz3+PrRgSudm1LF+vbiRGYvX6hKSJA14mFOH/xX1hPhG
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ea594a-86d7-4a37-98b3-08de1ce4f6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0NXRSszUHp5YjNEckFMZ1JzcDNGQWJnbWI5UW51RmhmT1RDVWR6bS9HcG93?=
 =?utf-8?B?elphdlNZdkFhNGg0ais3MU10SWxiLzFaS2tFbHd1V1VTK0R5RmF6T1dzU3hn?=
 =?utf-8?B?YUFFRU8vU0hkN3JtdzNlbm9MT0Y0bEdMa21XK1pMSUF2bWVjS1dXYzBiT3Jk?=
 =?utf-8?B?dytFbkRlcllqVTVhbWxrT1dOeDdQaW5qeEVhQlUwMG5RR0hOR1E5ZnI3UGF0?=
 =?utf-8?B?UTJVU2tTcUJSNS84MTM0WnZFam9LQ05BakJEUE1jdmFDa09UTm5SNTB6VmZk?=
 =?utf-8?B?eld1ZjFrcGNVdUVtK2RnODA3N0R4NkZCdFc5UzEvMWNjVUxCTWRYTHlFa2Fs?=
 =?utf-8?B?bzhnWE8xVW44WWVXUG80cm5keTlWWU0wcE83WlRtdWZqeDJYTTc3SFdVWk4v?=
 =?utf-8?B?Q1hSNWhFdjV1MHhmZ1lEcktoU0hsVTBReTJKa2RmLzAwRUJ3WmErSEtKY2Vp?=
 =?utf-8?B?dGpBV2dpVWlXM1hkTWwvR2dQaUNBSG1tZXNGaG5sbVpXQmNPejhqbUlNTzdq?=
 =?utf-8?B?K212b2NaR3V0a2NPYi9oSzAxTXhlc0lKaE83MXdtRWRjUkRLWnRXQUhEbm5z?=
 =?utf-8?B?TVllL2VRQlczdno5S3kvRndiRXNLT3RWV0szenE1dmpEaEw4LytrYW5qbHVB?=
 =?utf-8?B?cVVEMTFvUW9ETmJJYWJwMVVOekRaTmpmOThoaVMrR0hoWnZYRENqVVJOVXhs?=
 =?utf-8?B?MjVXWHNpbGF2ZmF4Ynh4Mk1BdldVcmFxYUg2RTRmUTgxb3orK0NyUU5lZEg1?=
 =?utf-8?B?WkFzV0lqcG94QTV4cktkRmtWV0I3bGhSa2w3Ym1wYWRLUG1aWUZmYnd5WFRj?=
 =?utf-8?B?N2Zpdkg3NUl3OFZtRG4xY2tId1ErWVhXeEE2SUd4a2RqUmxpQ1JLVDl2TWJj?=
 =?utf-8?B?SWFmdU1HeVhOSHU5WUE3VUQ4SzJvVmZIQUxhc3VzZjJDaEpyZVMvY1Zxa0d5?=
 =?utf-8?B?SjVqZmlmY0U0WUYxaWRpTDZJaXpmcE03enNnMllURGxYdVQyRjMrSGpmQUgx?=
 =?utf-8?B?WkRWcmZ1ZTJiVmJpZEpHM1phWnYxbkExakU5NTVWRmtMYVJ6RlZvMlQwSXZw?=
 =?utf-8?B?UGd0anhaTU5vaC93QWVlZ1dxcUhCZHRkdUNNZ28xbEF6dHBOT3I0QkpOeWVk?=
 =?utf-8?B?TFN0TU9ET2hhQ1o5U1kyTUsvQmF5OGNQbWdnSDNLMWszTFNJWWRldE5Hei9k?=
 =?utf-8?B?cVJKMlVzUkNTNGtvTkVQVk5YdFE4LytMSkZCZCtQT1pnTzdNcUFhM2VNd3pn?=
 =?utf-8?B?TnBLMmJXbm04bm9zY0dGako1Y1BxQ0hpdFRObjJvd0VwRmZXRFBmM3lCQS8y?=
 =?utf-8?B?N2FFY3lVcHpNL0RuUEpORkdnTTcwdmREdldaWkwzKzRXT0RKL0V3Y2JvWGdm?=
 =?utf-8?B?MUFweG5OaXVKZDErMXY3a20zeXZEcmU2OUJWL2taZ3VMbG5sd0Zua1lXUGZK?=
 =?utf-8?B?YUw0VnJLWEZ4UTdDS3M5RXVwdUVKL1BnOXgrSUNTZTAyVjNEQXFMT2xxV3la?=
 =?utf-8?B?SWtYRXh0WkNhc1FWb2tDLzVwMmtENERZNFJUaTVmQ2JMTGlmZWZZbzZRT2Vp?=
 =?utf-8?B?eEJrRE5FNjR4T2RJMTk3RE1PeGRnQTlsN1puWi9sR1FoZUFnYzFrcjBXbWll?=
 =?utf-8?B?ekhjdVVWLzBHckdCYTlZNDZnY1FTbXQ3QmMrWXpqQzJQaFVreHhtNjQrK0Nh?=
 =?utf-8?B?Q21VZXRFRXBwdE1RT2JJcmt2dVJ5aVdXakdvVHF4clNmUlN1T05PVGVNTlY1?=
 =?utf-8?B?bkd3dmtKRTJudGdzOTNPZzg4amsvdXYvN1AwdUhyTkVJVTVhZGZFQ1JqMThT?=
 =?utf-8?B?UkxGL2Z0RWQ4QlU3dlFDYzN2OEFrTVp2YlFzTUswakRETEpYNS9NN2xXVlBQ?=
 =?utf-8?B?WFo2VlprdnpmdjFFT3ZZcE50NWJqdG9WalNMQkZnM29hWWxVTHUzYk4rOWMz?=
 =?utf-8?B?b1VSVzIxeTlBRm1EZjJiQm5kSjIyS01zYS9KS1lzOGZ1THBZOUw5b3IvaStH?=
 =?utf-8?B?L2QramZ5SWx4WWMrUXl5ZlZ5ZHVYWnorOHpzajZqUzJmVytJYnltQ202YWt6?=
 =?utf-8?B?dVFWblJvK3ZkUkxwclVwWkZhM3BzMHArNmt2dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZwUFNPUU9IdXo5QnY2MXkvTThQcm5IMk5VL0szR0tIbms3andJUTZ5aUVV?=
 =?utf-8?B?bWxHbTZsUCsvWkZhMCtNQ2hTUXU4b0MvZkJYOFZnamdVMks4YldLS2pLdWp2?=
 =?utf-8?B?UXJCYmJlRy9DUGRDMkpDSWhlQWlhNURyckh5U0pRZG9uSyt6QTg2RXpibTNy?=
 =?utf-8?B?TTNsZlpVc2w1cW9VR3ZQZjZhbGxFVDVON0lvbTJaZkdsVzZRL1hMRjdIT3NN?=
 =?utf-8?B?WXFRRUxBdjE4MzVrOHBiZlkrdHZtRzFJcVp4T3BIQnY0d2NobGN2aEIrUkRw?=
 =?utf-8?B?SVVYMWdoeGNRaGFCSWF4SCtGcEd2K1EreTh5QUhZUk00VDhJMWtYWVR2RU9G?=
 =?utf-8?B?aFVYeVZsMVdJNWdVeUtoaUlTejN3aFd1d1o4YlNTcjllWWFXOUxWNG5HdGJ5?=
 =?utf-8?B?YzE4OW9SdFFsTHJzZ01xS2toWEhuTmZTQU11c3JIWno5QVl4eWd5ZnlYSVV0?=
 =?utf-8?B?KzhUT0lHK3hEKzVQSGlxVW1BSjZNYTVycmtCQzBaejNKN20yM29namVNRlB4?=
 =?utf-8?B?dFBuQjNyREIvWTAvRVlLWGoyTUoxOWwrak96dUphUzZIMTkxeEp6N3ZHVW1O?=
 =?utf-8?B?MDAxWTdYZDFleWJqWWF0ODZGS2x4aVpIL0M2WTNpdVZFMTQxKzJlKzhjbkRa?=
 =?utf-8?B?Y3Rnd3BqeXVjYlVSWEFMSVhpZVQrbnp2VmxSSGFNbElLbmFydzdDM2tWcmxN?=
 =?utf-8?B?YU40aUg0RkcxNHptMzVibGZXekRSU2pRVjY3ZDBXcHlhZFljRUJXOE9Gekxs?=
 =?utf-8?B?NS9qM0NBVEYxNGYrSWZBTnpwZmorQkZwck5rZmprbXg3ZmRNdGxTRHpjT3R0?=
 =?utf-8?B?TkltcE9sNmd0SnVpMDVvcFZNWlI5NHplbmNuWHNjZnF3R0lMVHJ2OTF3VjBJ?=
 =?utf-8?B?VTBiVjBWZFZNR3FxOXRhaEQ0VW5wK1J3ZXE3UjVJZXAzVHFPSTdpMHZvUUV1?=
 =?utf-8?B?TXVMVS9DZ2g0MHFpamhxL0MyYlRnaXNQMHc3TjYzbFdUdnpTVzJMVGlXVDRj?=
 =?utf-8?B?b1BPbW95bEl5QkhQV3YramNocmljQ2t6VjlJNTlyTkFNQVFpUlNZbExVcERv?=
 =?utf-8?B?OEJIYkxCU3ZscXdWOGZkR3lYekRFaXA1MjhrL3ZZVVdVZnhSbm1La2s2R3ly?=
 =?utf-8?B?dzZ6WEZRYWRLVVJCeEw1WnFFQ3N4Qm1RZUpselVtOGY5dGgrY1dtZjdmazZo?=
 =?utf-8?B?T1lUYWVqQTlmVHdTOVdMMFNzcFBTZFZ1SHpWNFRua0dGN01FTlBQTHFUUEZ1?=
 =?utf-8?B?MG5UNExCRi92SUtocC91ZlJ4N2NhZUZZTUdIRmVFSnBDa2g2RUREZmtmenFO?=
 =?utf-8?B?aGxkQXdEaldneG9qZEl3RExDTlllQTJ3Skx1RDFzZkdqTXRNelRjU2dwWHZ4?=
 =?utf-8?B?WU5aRGVVdW9RWHZqVXprbjNkNVNHWXFsdjVNamQ4bWRHZUsvVElzdFFOSmJR?=
 =?utf-8?B?UG90cVF5OGYwLzB3L3p4WWRuS1pEclkwR0tiajAzTDEyQjlOYUhmK0JVNklT?=
 =?utf-8?B?aVNHdWprZFdkOURrbHVkZGRxTGo4VmdwaVR3MzRUbmM4UjFzMHdrWmZWa3NL?=
 =?utf-8?B?MENFV3ZQOWRlcTFmaVhYS1J4V0xyU1pFeEs0S1FibWpZRXBQRHY2K0kvemxF?=
 =?utf-8?B?alJXelBlT0VyUUM1UFpka3FpQVJKODVHV0xmam9UQitDRjUyYTlOYmVWM1lh?=
 =?utf-8?B?OE1zT3loWmp5Y21CTXFIdUkxTGpTMFlTQjRvN0hNcTFseEh1UWladldIVHBQ?=
 =?utf-8?B?d3V6YjNacWJsVmx4UStiMmUzT3g2Y2h2aWwxMlhHUnpEVXhBOG9KVmpMeXpq?=
 =?utf-8?B?YWxaU3J1VlZtbHpGbFZvMjdoR1QzL1ZGaHRKUHdneUlmem5iNDA0cWVVdzNu?=
 =?utf-8?B?ZmtYS3VxZ0lWcm9qVkxnTTE0UTdwYVpiQ2VqcFo5b1QwU1NZM010U1hBTDJj?=
 =?utf-8?B?bS96b2NTY21HZi9pcHNMZmNkdmNsd0pvcTVLN01EWXZ1TFQ1RS9aS1d0YlY4?=
 =?utf-8?B?dzNtWTVJemZpV0dXSFRJSGdTT083SDZCd0dwWGIzOTNjN2ROZUh6VEsybWlG?=
 =?utf-8?B?bEpvR0E0VUh6ajhkd0VOcHNKSWZQTFNlcUFoREhwdktCcjRWQVBkbWp3MEFB?=
 =?utf-8?Q?/2n3druuTssajbpCSgsOzDhq0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ea594a-86d7-4a37-98b3-08de1ce4f6a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:25.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPRJk8w+FKuM4BI5CiQ5Rid2f8ECVRznFJN2ov/UYUOqDWo1tte9nBCqD83Yaku+ATFqPnE5g15B9ByHSDEaxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

Move the imx_dsp_rproc_dcfg structure definitions closer to
imx_dsp_rproc_of_match to prepare for adding start/stop/detect_mode ops for
each i.MX variant.

Avoids the need to declare function prototypes such as
'static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)' at the
beginning of the file, improving code organization and readability.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 100 ++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 833b1bd4019614157f0bedf09bd348caab802eef..f28d25cab3f1d89e5cde37a04b528870a59abeed 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -261,56 +261,6 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
 	return 0;
 }
 
-/* Specific configuration for i.MX8MP */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
-	.att		= imx_dsp_rproc_att_imx8mp,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_RESET_CONTROLLER,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
-	.dcfg		= &dsp_rproc_cfg_imx8mp,
-	.reset          = imx8mp_dsp_reset,
-};
-
-/* Specific configuration for i.MX8ULP */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
-	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
-	.src_start	= 0,
-	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
-	.att		= imx_dsp_rproc_att_imx8ulp,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
-	.dcfg		= &dsp_rproc_cfg_imx8ulp,
-	.reset          = imx8ulp_dsp_reset,
-};
-
-/* Specific configuration for i.MX8QXP */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
-	.att		= imx_dsp_rproc_att_imx8qxp,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
-	.dcfg		= &dsp_rproc_cfg_imx8qxp,
-};
-
-/* Specific configuration for i.MX8QM */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
-	.att		= imx_dsp_rproc_att_imx8qm,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
-	.method		= IMX_RPROC_SCU_API,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
-	.dcfg		= &dsp_rproc_cfg_imx8qm,
-};
-
 static int imx_dsp_rproc_ready(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1351,6 +1301,56 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
+/* Specific configuration for i.MX8MP */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
+	.att		= imx_dsp_rproc_att_imx8mp,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
+	.method		= IMX_RPROC_RESET_CONTROLLER,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
+	.dcfg		= &dsp_rproc_cfg_imx8mp,
+	.reset          = imx8mp_dsp_reset,
+};
+
+/* Specific configuration for i.MX8ULP */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
+	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
+	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
+	.src_start	= 0,
+	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
+	.att		= imx_dsp_rproc_att_imx8ulp,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
+	.dcfg		= &dsp_rproc_cfg_imx8ulp,
+	.reset          = imx8ulp_dsp_reset,
+};
+
+/* Specific configuration for i.MX8QXP */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
+	.att		= imx_dsp_rproc_att_imx8qxp,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
+	.method		= IMX_RPROC_SCU_API,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
+	.dcfg		= &dsp_rproc_cfg_imx8qxp,
+};
+
+/* Specific configuration for i.MX8QM */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
+	.att		= imx_dsp_rproc_att_imx8qm,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
+	.method		= IMX_RPROC_SCU_API,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
+	.dcfg		= &dsp_rproc_cfg_imx8qm,
+};
+
 static const struct of_device_id imx_dsp_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qxp-hifi4", .data = &imx_dsp_rproc_cfg_imx8qxp },
 	{ .compatible = "fsl,imx8qm-hifi4",  .data = &imx_dsp_rproc_cfg_imx8qm },

-- 
2.37.1

