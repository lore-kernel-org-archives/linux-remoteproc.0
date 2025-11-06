Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AB263F2D;
	Thu,  6 Nov 2025 03:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399856; cv=fail; b=AgVgNk8UndtDJQqlF3NYqk/PZE4Z7eOWUhN0iSyaz4qgPus9WP+FvjkuBgOT8s2NnXHjd87iTWmGNephUGbCILXksmlxneUAWz2ADHAd7klcfHbjiZi9Iy4PxR0STvniBWKxxPF3iIoYlZEIFrmBj/bvu5uR5dkwxa8TO6Moaxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399856; c=relaxed/simple;
	bh=2mpv8hgXsqAfCO7+sXbTs0ZIPaX7YodeyiJg96LQKZk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=T117EukJh4c6B9yjiIhBq0+YfwMaSuHMgQDmzu9cc0+5WPbGP4Kw6+PegRkgUIzaDKjoq85z95A1CI11pb1KWwH1t/quH9rrX/nTbhWbW0JUzMB6gMi6l3d7K//e8hF2wTRPDqH8xR0lDMWwpEe0Hk44qLAxC7fTSUyIcQ5xUp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FTpvrmHY; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FTpvrmHY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWDKGZevmud/Ts4mjxQQPHwB7OzKN1RwhnSmnG5JhaDK2rbEIGqwygBUVZ1oJzS7+AZGCIyhzGN2OQ8tlndmy17oBPKZXSNVrtouM0r0lk+gnmg+pzV3JE6N4Rb9YfOilapAhEu902hbOq/0FRSqTxEKVWRgRFnFqIDvYXhhHzk7Pfg7y/AxV9xpXpztZhZYNVKCdjULL9hZ22ROGSv0PhjlwRICank2EWMPYVIje9jXSME9yoe0un23kO7mQqMTjiDQPZSWrVGn9ECaF62O4N6Y7Oz3OVajWEA8Ytd2nn8xt74Rb5qgdbH8+4IYHGIai4cAT3S/E15VW//uXzujrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwiR+EFx8TVUutPcF32hO0wOK3d+c0XGhcWmtCwdXK4=;
 b=bPnz1FoZblElkDMQfQ+OjzWJrxHsnbmYFQv5/hiowdy6JvV5hdGCp6xle+YS1dyrBPTKvhkl4+qC6sMeJVhJj55alP0d6QguetPz3R138tIjSqZyCKdmjnVX3YaCcIkp3jTWqW3Oyb6baFR++7r+ecZv9j8+AeLL5/rS1tXm1QAbl9sAWuvuS0lDH8Z+wtlEKsb9BP/Tsm93ivbgMfJR5lLU3A0NNPm3x9ct/HASptC3bFqhpvAHyiwhYOQDJK5u/v8/ec89lDVvflzle2zPsFY5ZTHQjdDapwH8EjkY9diTxVVkFN9NnFXPl+S4xHgpc3QSqt+ecw1azY/TpnQvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwiR+EFx8TVUutPcF32hO0wOK3d+c0XGhcWmtCwdXK4=;
 b=FTpvrmHYnCKnZHbWBxkz9abGWo67a7u1eNjqUmQFlGHzcMa2kYuJRX9/NYrMr+9zf6smWM2etLLT/fhe9kGsYoW/z3DN908NnJrr9XpoEXEHaT2Nxn6RM20YwzftHod/PTxYkxGtHZjhsWM9BXhxDoI2cp7vm+lhMFYWMYQHy2y0xd2mRgh+udL7Wn9ir4Dzff6dOrrvfutghBhGz0MWmZMZ5riJs86FV/G8odrLKYdUbrIuMlt3z9N2c/gQL09BKl3SgJXBKSWiUAmdHCA/Ahx2uaN7kdqzoSNlaGGkks4ZRlWLP5uJtCsxxint47D9stn5Crxte2o5+nY0T4NyQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 03:30:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:30:49 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 00/11] remoteproc: imx_dsp_rproc: Refactor to use new ops
 and remove switch-case logic
Date: Thu, 06 Nov 2025 11:30:26 +0800
Message-Id: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFIWDGkC/x2MQQqAIBAAvyJ7bsGViugr0aFsrT1koRCC+Pes4
 wzMZIgchCOMKkPgR6JcvgI1Cuyx+J1RtspgtOmIdI9yJtzijZ9AIqxqddx2g3XWtBZqeAd2kv7
 pNJfyArKQeElkAAAA
X-Change-ID: 20251106-imx-dsp-2025-11-06-bfe458cfc24c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=2121;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=2mpv8hgXsqAfCO7+sXbTs0ZIPaX7YodeyiJg96LQKZk=;
 b=VEsN3z0iLrVHypf4BWlZ9QKbJZtJsuodQ8q+yLXamDpZoo0O7BktiY09FMsoWO2YpLTJzpXL3
 UUawmsBsWWYDeM3PXK1xxE6d6hj/LoYql44fEv7FF4b/PhHeH3KnIYC
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0dd5a2-cca7-4aed-0f63-08de1ce4e18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2UvbUoxVkQ3SU1JckRRWm9MM2hPUU9ZQjVSTitZS2dQZTVyTEZuelBURzdH?=
 =?utf-8?B?WDRraDdUby96dE1YRS8wZWhqeU9NYU5zdFhzdGxhMzd0cTB5SCtJUjJBMyty?=
 =?utf-8?B?ZFlwN3NmTlhIQTQwcFRYMG5yclhtcnc1WCtBa21ZeTgva2xuRXZpQXFTTExz?=
 =?utf-8?B?QTRPZURldXdHeFlhbzlKVVFLZElNRmIwNDJVb01FaWp2ZnlLb2M2MzJ4SWti?=
 =?utf-8?B?ZUV3cUNyTVM4UEtQWk1lclh5WTY5SkFraFlZMnBYSjhOTkMxK1BGS3h3eEtp?=
 =?utf-8?B?OEFVdXIra3RSV242Mkg3NFdiQmtrajUvT01qdTdoOVVpVVJKUy9mSDhBZ3Nm?=
 =?utf-8?B?b3JDTFJtanNIblQ0UVUvcDNoNWF4MHpUQ2R3YWtPYzQxZHptQWtCd2pTN0NM?=
 =?utf-8?B?QlovbmRsY0dBaldHTDBwbldWTll6VWNjZ2p3SXlXcTRaQjg5cDU3ZVN1ZGVm?=
 =?utf-8?B?Z2Z3dG1WbjQ3ZGRZU1hBTm5OS0wzZEZrSkdRWVFMRWpZTVllTW5EUGkrWkVP?=
 =?utf-8?B?QXpIVVdXOXlweDlSRmZmaWNqYjNKK3V6N0N2MEgvdEt0Nm9KRzgwWnA1OWs4?=
 =?utf-8?B?ODVyVTRsQkRjSW9JajZubVJhVkNLUmd1L21KN3dOdXJoVWVobHZqMGs5cUFa?=
 =?utf-8?B?d2RoLzA4bkxsV3dLR3pQcFl0SzF5Zmo0NFBrSHJPYW9ZdnE2TEg4SjVFQm41?=
 =?utf-8?B?S3pHNk5ZREdFTm5FakNqT2NZR3JMZE4wSHJlendKVGhISUtDZnRQWTZUamtm?=
 =?utf-8?B?SjhaNkRJdElSRjZyNHBWeUVtNDJ1WnN0OWdDY3JQSlNnbERJekRwNkQydnBB?=
 =?utf-8?B?SVQraHVzYnl0MWZPSzcrNGtiU1VVQUZjU2EwekVpUGhEdlVmU2tVMG9VbmZo?=
 =?utf-8?B?Q2RXZzV1OG9QY1NOUHRnUEpYWGVIdk1ZTS92R3JZZ3oxakhCVThYQzR0OWpP?=
 =?utf-8?B?WlJIaDdMZEszdDBSTUt1aUZIYytKVW5iN0xDZ29GaDQ1ckw3Y3pNM0I1YmVM?=
 =?utf-8?B?MVlSS2pZdno3eE5TWEpqd0ZKc2dIVE5IbitKVUlna2V4MTI4Qk1DOE5IY0dp?=
 =?utf-8?B?M2R1MTl5eExxNEhxUncvejdsYnRHOWNNa0VHNTNrbmdqanpLWmt3ZFIvYzVX?=
 =?utf-8?B?RVBmd2piTlBQc1VGRVFNSDNOVUpVdHZPQ3RsTWkybVp1bTQ3OVlISURRWFJm?=
 =?utf-8?B?VkdDeDhHN3hRcVpjbFFHbThSU0hyYnZteUlCa1IxMEI4a0JBcXFZSER1OC8v?=
 =?utf-8?B?d3MzaTdRODV1bGs4d1ZTSFArblBCb2VRSHZnTWVuMmRKalduQ2o0YXpiQTVi?=
 =?utf-8?B?V1ZFajQzWGVIdW0vMmFJcmxkR0x5Ym10MTh5alIvcUk1VCs1OHFBZUNRWExI?=
 =?utf-8?B?Y3RJMEJKZERWWG1EYXowMjNLTDFNc2NLN1NlcENncm0vMlJ4NCtPSFlLdHZ2?=
 =?utf-8?B?ZHVOMkc1dnpYRHJ0MzhLekl2d0c0dDBxUXBPaHBXeTVCVzM1ZzlWTTNZeWdT?=
 =?utf-8?B?STBTWERqekdEWmVybGxKbFYwS1NIdkI4NWNLTndNTloySlRYNmNWV3owQXgr?=
 =?utf-8?B?TTFTUkRveDYxMTNwanFEYVo3ekROQjNLTmgwNmNlcmZpWXJDNksrVVpXWWVB?=
 =?utf-8?B?SGJxUGRibDdNTDN0cm53SDNCN0xXTkVDZEdnRG13V1UwNjNpbmtFOVJmNG5k?=
 =?utf-8?B?SGI0OTRETU5nak5kWUVyTEw1WFo3SFFXcnhsNTRGRHZnWFBmOFc5aE1qSmhB?=
 =?utf-8?B?M3hPb0loSGV1U1hQQkZwQW1ITWYycm03Zk4xdmZaKzA3UHNQbWdsd05kQnNZ?=
 =?utf-8?B?UXBuVTJjZk5FZloxQ2ZoaTJMKzhPVm9oVnFSTFRRdlp4Y0N5ajhLWS9nL3FF?=
 =?utf-8?B?UTIvL0VPdU9qOEpub2xRNThYU1dzS1ZDejI2d2JRU1dyZTJSUkx0dmJWaXQ0?=
 =?utf-8?B?RzRnc1NiOG9yaXYrQ241a2xoYlFNSUpRNUNFK3FDb3l5dUlPQUpIZWFFOGJ1?=
 =?utf-8?B?d0h5OUZTeHUyMHA3WkxXNGlDSHp4MElmaVNUOGk4OU9rdkREYnlNZ1VwUGtk?=
 =?utf-8?B?T25ReTBBbDBtZitydzFxT1FHdW0ybTB1RmxsUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVpIblNOQ1dEUjR6WEpwS2VrWG5OSE5jTnJpR2MyaytGTzRNVmRaSmFpaE1R?=
 =?utf-8?B?cG91YW5GRUxuTXZiTExRU1E0cXlFWmtrZ3BpSlFFWXl2cmxHWGk4SzVGL3dp?=
 =?utf-8?B?Z0JNdU1LbmZCOUh3MGtQOUlsZmJuTC84bVZVb0FxbXlGcjh4c0oyei9CTDk3?=
 =?utf-8?B?WjF4WkN0Z3ZFcGFCZnNteG1panM4dmlqWlpFUS9FQ2FuNk1CZlpnNi9aVWQ1?=
 =?utf-8?B?VlBNR2dYZ2NXS05aZ2V0ZWlqQ3ZmQlk3bkM4Zi84YmJUbHNUUmRoZUZNcG1J?=
 =?utf-8?B?U2pkWG42WE8ydDNmaWlvM3hxQ21sYjNGcHlEY0NUbEIyM3lSYWhyWHJpcVN1?=
 =?utf-8?B?WW5qQUI1bG9qVXN2TVFZT3JSMHhtR2xzclhPTzhodytTVXhBelFld2dNRnVB?=
 =?utf-8?B?UXpWM1BGdlZFWGFTQ2xGS2k5bjEwR2I0Q3hKQVRkekU2aDg3MG9wdnByRDRX?=
 =?utf-8?B?bksvVXpONFhuOTNoQWFNdUVGNmFwQnFDMlNCQ0ExMkRiTFF6eDRlUi8zcHZz?=
 =?utf-8?B?SytZdVJQbHlVUFowR1FWcWpzeFliUnluRE5maGFVNm1KSmc1WkM4dURsanc4?=
 =?utf-8?B?ajkwaEJmdkxiQS91d2lEOEhyS1ZteUVueDBYMk1CNEdKbzB6VFJ0OTg3YXBs?=
 =?utf-8?B?NXhhalVzUXhjZTR2aVFSS0ZNOVRTVkVCcGt2bVEraHgwa1hXWnY3bURic0hR?=
 =?utf-8?B?S0RwU2hlNCtIbkhvUmFrZU5JdnNLWnBUSzRkdTdiZVNlRTY2UnRVdWRxcEd5?=
 =?utf-8?B?U0habk9lUVBqUWJZVUFWRktHV1ZrUkwyZ1oza3JwVEU3bHJST3QzMUVjdDRw?=
 =?utf-8?B?b3FraUtFcmVYeG5FaWVRa0IzbE4xZkU0TkRqODVQUU5VS0pId0FzOFAwWUNW?=
 =?utf-8?B?RFF2UXlsTy9MaHNPNkZrVGZLSzg4K1lqcEV6QWhvdlB6VG1VOUFLaHBpV0gr?=
 =?utf-8?B?S2FZR2hRTmUzZFV2VTdobFAxa2MvRGZCZ2ZLeE94RVk2bC9Yd2V4RWdCRWdh?=
 =?utf-8?B?UjBZL1FZelV5OTdmMTZJSHFyMWNoeUpkZi8xMzM5SmN5U0RicGNxREFUUUp5?=
 =?utf-8?B?N2hKVXpRRnNISVJtQU5oWDh5Z05NakRLaDRyeVJkZDlGMHU2WXhKUlhrL1RZ?=
 =?utf-8?B?T2NOUGY2Uk44dXNyZG9qbEtMRThJdG8wRkRiYmVUbzlYbWlJZkdyRzNYR1BX?=
 =?utf-8?B?RjRMV0J1NTNac3JWVHQzam9mZjNsdUdFN3NVcmYrNW5Mb3RtbTcvYmZzK0Jh?=
 =?utf-8?B?UjZBRXVmOXBPNUVjaEw0a3pGcFMrWHAwczM4TXRTOHRVRVc2NEk4bjdCSjVw?=
 =?utf-8?B?SWZLOUlKWWdGa1dSUkMxSmcwbTlZVExnL2Rna2s5WWNoVGVsYk1mRXMwQ3g0?=
 =?utf-8?B?SkdZWjY1aVNjSXVUa2t5ZzM3QjhMcXcrSXlOVktzZ2hMUFBPNW5yVTFyQlYv?=
 =?utf-8?B?QmpZbVVhdGZ3VWh2bTEyN0U3enVVakYzYmcwZXJQWDMydHpkQlZmK2NWdERH?=
 =?utf-8?B?S2h3TEkwWlRuUkJneXFWbmlwekg2TUlHY2V1T3VmRVZvODlzT1Z3dkN0RGhz?=
 =?utf-8?B?Zmowc3gxTFZWTGcyOVFvVGpaZzFXcGFibmZTeXdpWW13cStsU2FUQ2VaZHZr?=
 =?utf-8?B?MW1Qa2Izdm16ak1qM0JYS0lKK1MrdThqU1FOaVpvaHROenpPWndKaEtBaU9U?=
 =?utf-8?B?MU5yYXdmTVRWOU1RancwR0o5M2ltWkttUVZBYlNGSEpyeGcrbzhmQnlCODYw?=
 =?utf-8?B?MEdkdk9mMHhkandMdHFNQnNQRjRZRk9LQWU0L0hXQVViVllnRy8wem0zRlFq?=
 =?utf-8?B?RVJUNWxHcnZrdVo3Q0NoNW1RTS9WNCtCV0pIdVp0YzhsYkF0SThSbUdMcHl4?=
 =?utf-8?B?ckxVeW5Wa0ZjaG5MZ1E5S29MeTlqd0RrUE9rNW15a3VsWDNMQnZhN1J2UFFq?=
 =?utf-8?B?dlplVGxMUFVaR2JsVStTdDVhVTI0SmZ0dEF1VE40VjBmMkVqd08rek9kMHVw?=
 =?utf-8?B?Y3ZYa3JmK05VZ202dk83QUNpZ1dRMVNkK2MxVmttUHZaVlpaZ3k0bmJxM0E0?=
 =?utf-8?B?cm5CbFJOTGhDbWdwY2VMdnBKWDJ1ZlZtS3F2OXU3ZFRjR2NsNnU3R2hwOHJD?=
 =?utf-8?Q?JUfNrG1NIDJgJVXy5z7pztwtm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0dd5a2-cca7-4aed-0f63-08de1ce4e18b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:30:49.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nb7xECNV+tZVybapqFVJFW6IvXOp5g77WpvLL3E2cyFJQiM/EyeguCTK5BWTpvlXYC60lK5cZOKD5eeZUQdu2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9287

This patchset aligns imx_dsp_rproc with the cleanup and modernization
previously applied to imx_rproc.c. The goal is to simplify the driver by
transitioning to the new ops-based method, eliminating the legacy
switch-case logic for a cleaner and more maintainable design.

Patches 1–5: General cleanup, including code simplification and adoption
             of the devres API.
Patches 6–10: Transition to the new ops-based approach, removing the
              switch-case structure.
Patch 11: Remove the obsolete enum imx_rproc_method.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Collected R-b
- Patch 3: Update commit per Frank/Daniel
- patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
- Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab

---
Peng Fan (11):
      remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
      remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
      remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
      remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
      remoteproc: imx_dsp_rproc: Drop extra space
      remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
      remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
      remoteproc: imx_rproc: Remove enum imx_rproc_method

 drivers/remoteproc/imx_dsp_rproc.c | 342 ++++++++++++++++++++-----------------
 drivers/remoteproc/imx_rproc.h     |  14 --
 2 files changed, 182 insertions(+), 174 deletions(-)
---
base-commit: 84d39fb9d529f27d2f3d295430d1be0abdae7a6d
change-id: 20251106-imx-dsp-2025-11-06-bfe458cfc24c

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

