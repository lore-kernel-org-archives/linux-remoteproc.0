Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4432C0263;
	Wed, 17 Sep 2025 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115198; cv=fail; b=QO1pxjsTK7NzwlatQPbIcOcOGKyOC9klG/TEK1SRnhPFJ/GrMIW6BJy0RhrJ5QNQmeMHNt+q+Z+zFkfmg79/waY0S/Sp2aDl2Q5ekI4UxdOhMPwTY/IWQF3ufblX+lU16xwtzP+alA1r0vkcYUR70TU9vlgwiKBEUNScg3lVgjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115198; c=relaxed/simple;
	bh=2MvVcLCP72WaT2i9RsDQd3IshZHvpdF587xHsGNY3qw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yv/g7z9D0C4R/Cl6ifRWFK5PH3BqgHAXftNu3s7GX0zQyV9wX//sN2urEx1SUqdCyRvzI9Rzi+1yulRASOUsfxV/QKsfdyfaXFLd5+oeyqmDqSnZoy/qgbJkr9T4W0frBXYCXsOiBbyXH4qPaXcv5TVQPYDBo84Mgwp4bPjl4oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IT2AvUxR; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IT2AvUxR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct+XOieYie/M/NNLLQcoHUwqMfhVev3CLkIk86pPqUgw7llGRVMK9nx3sKaNV6MYYowfuzugyf2MA4g6rB4n6LOADD3EQ74doHRW38vUwClLrVKy+37DicLoZKjrxJz7AwhKJ8DS8ZxrP0JSMX0Uac5rY39pJ/GWB0W/sosHr/RI4+JCPiYnsUz+63NUkvM7E061XG/z1T4C5uCzaSuDM1pqErfXSgkr8a3y3u8Gp6XVmdOFaJKrX2xJCN7IjqmWhZaiRqRzRULF7KTzYFGpD7AexJW19QfRx7N9PNwOgKmLwi12vxJkI/QbsxyFrldXq+0+G6XlwCgItS9Qn6Amvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CMraOTOMzC3nrOwRNk9WjUxW8M4ZfoTVYL6pfc0WcE=;
 b=aWnfl2MOmPt3QWwYTbAHM1EEMByI1rzY/bqSCt0V3w/lO+OeTKn2Of+SQqjepXn8qm1v7YvRxi627jIdwHS+cpAwaosLjlnhiz+BAu/KqoLiiI5g1iVyJs01MgwxC4OqJ0JW4SS3638zVNLyKIu8lggtKiC2dG6ysGOrke7CUWvEM2Tb1h27/YVGRqkXbXZjRDGXUrSwAykFHLzwK6iFzuM57cdwlcbJ1abgQcXyuRAaxoCm5dcLVTpSrLCBrRlVYqSxnHPXJhCjHXoDUYozKqBngNsprmxxiSpAjMZ6L2yRKd3myB6NLAWQx1OnMyZMl/JyucmdWfoSbkZpZH9HRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CMraOTOMzC3nrOwRNk9WjUxW8M4ZfoTVYL6pfc0WcE=;
 b=IT2AvUxRINleCvuvHj+LJ2mj2ydo2eWP8pJSni9+cZG2xm9q4f6SWKQEggbzc3p8jVsSem8z3exDiSvRFQNWSVsBo45sYe2NLANhK6hmD3wJVHt6UU7+r6oO4gOtRxjmfIVEuWqZ+otpDuzI0a2hPspviOZtN2PycAzPfaa4KfH9WvjQ8r6vNg76g2jZTTuCF53NnJQevPi2U3QcwdkQ272fo1qApgXSHGE6gFL5UnARmQMxfBDeABI65MQRc+iYffitZfgpUs+JYXo4PKmPOMr07HCqC7WE5e1j6QvxrsysEgtWHbEXiKFaKJ7t/PD5GhDqWp1tmC2EV5g5b1MQfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9751.eurprd04.prod.outlook.com (2603:10a6:10:4ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Wed, 17 Sep
 2025 13:19:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 13:19:51 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 17 Sep 2025 21:19:15 +0800
Subject: [PATCH 3/6] remoteproc: imx_rproc: Use devm_add_action_or_reset()
 for mailbox cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-imx_rproc_c2-v1-3-00ce23dc9c6e@nxp.com>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758115170; l=2645;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=2MvVcLCP72WaT2i9RsDQd3IshZHvpdF587xHsGNY3qw=;
 b=aE6E087kldzOgeb0vmWfpjtzSSBBTtcx2daIgkAxU7LJAFQCFUAzzSMwHTGGBVS4bipNvrhzL
 Jf4ccg9NhuODUzdU8uPMIRQeoY1+FqOB5wEtPuNKD4lKHlM/4qH2Z7O
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a897f30-1441-45e7-b12e-08ddf5ece22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2I5VjkyN3UreFhjNEpPSHRaLzlpSm85dkZVc2lyYmJOMzZXc3V3eXZvLzNU?=
 =?utf-8?B?aCsyN0N0Tm9xbko3RlFkL2RaTXRxYmkzNWY5NWF1WVRIbTUxTHNkbmxreG1n?=
 =?utf-8?B?Yk5YeFlqWDRvV1NwUTBiRG1Cd1FSVEJNVzgzaSt2TFRnQUhnLy9VSWFiQjFn?=
 =?utf-8?B?ejVMUXpWL2s0ZENrSGtseS96K1ErNzVCcGZxSlhIQ21GVzdZdHZYNDBOeVMz?=
 =?utf-8?B?cDhJL2gva2xMeStGeWM2RkluUFRiQWxhUllSWlhFb0JCVHM0UkdEQ05DUDhk?=
 =?utf-8?B?SS9UK2xFQ0w0aUZhdWZ4WTdKOEhSOWgyMllSVWxGYkJwYUQzWktyVjhGMlhL?=
 =?utf-8?B?STBJSGN3bDRERzdUbTM4TkFyNXBUNm5pQ0dqckZqRmJQN2xyMXB5ZnQ3T2pW?=
 =?utf-8?B?WVB3eHFId2NOUG44MVluZ0x5NXRUNnM1RzRhV0YyOGpNYUlPSDJ4SWxtUTZN?=
 =?utf-8?B?Q2tKZ2N2dmtrdlZHQzJXTzRkYjVCY05NdmF2V3gwSmJGSlVyUTVTSjlwbVRy?=
 =?utf-8?B?L3BxOHBVbkhYZU1rTVo2RjZ1NnQzRlRFVHJITTdjRUhpTGx2VFVSYkRhR1NJ?=
 =?utf-8?B?RFErR1lwK1JTTS9oaW5aSkovV1ZKTC9tNHBGMUhPYXhvZER1MHdoZUl2MTV5?=
 =?utf-8?B?SnBUZFlqQ2JQRzFJWnNVdHRXTzJPN3M5V0Z3bjJWQlJjb3FRSXB2ZW15dTJY?=
 =?utf-8?B?U1R5cHV5aWJGQjZzNHk3STdlaTRrbFNxZ2tmbWtzblgrT1ZpeEdTTVBJbnQx?=
 =?utf-8?B?QXpIVC9qYzVHSWlqTjlKaGFRNEkwRmlSMVdjNDlLTFhnd3NJZFI1YzdINU4x?=
 =?utf-8?B?SS9YTDhVa3BOaG9ENUNrNnIvV2tMM3J6VC9RdUk2Y2tHdURhWFB2WXBURGVq?=
 =?utf-8?B?THdac01pSVk5RSt5THArTDNTZmN6aGlFN1JBRWJ6YkRuT05qcVY0cWhYS0o2?=
 =?utf-8?B?aTErU08weGpqMTFQYnJLeG5zbEVtS21CU2FRZXVpNWpGeXdTR2tyQkc5endt?=
 =?utf-8?B?a3dOZzNTZ0gwUUt0K0YxaHVGeFhMTnBxUU1tMHQvL2NabjBOeEt0Wk1ySU5O?=
 =?utf-8?B?K3d4clU4aURNRHVjbkhLVEw5QVp3ODdNSDBaWXJjOGxWUGhIa0M4dXo1cFZK?=
 =?utf-8?B?bWZMajh2MG5GelJIVERpQnNPU1hyTHlLR0dxTDA2SVdwcVpsb2R2ZWFWTE14?=
 =?utf-8?B?TWE1SkxkNDRZOGdJaEVoQ3p2YXpjNk1acXNlQmwzUTdtRkRSTFNRTXlDRU80?=
 =?utf-8?B?RTNkR1dLK0Z4QTRvNm1TTVp2Q1k5dGppcE1jdm94clIyV0ZaRkhISkR3NXhF?=
 =?utf-8?B?eWs4UlZ0M3pIWHRFMVFRVk5oZ2hBNVpWVEIxeWpEU0QxNTJKUjE1ZjBUVEdt?=
 =?utf-8?B?Nk80QUhDNDk1bERUSmg2dFN5UFdaUExVSFhDYUhKTHJiYTJiYWhEc0NjRjFr?=
 =?utf-8?B?amVIQzQwK3AyV25zR1FxSWVaWEYzK1RYbmtHWWNxMnNyd2FRTnlLUW1mazkz?=
 =?utf-8?B?eGdjVDU4bjUyM2dVSzQvVnRTaWM2QndyNVgzYTlkbGl0NmpZYk04ZTRrQ1cx?=
 =?utf-8?B?SjZScC9mWnZZeDhWR3htRGxLbFdDWlpXR3ZLTFgvY2ZmcUhtaC9YK0ZCQzNJ?=
 =?utf-8?B?T29relYwNTk1TmlsMEdjZmFrTDNWc3Q0Q1UzQ2FjMjdvWmViZ0V4Nm42OUVy?=
 =?utf-8?B?dlE0MnZKanVWODh3ekZFa1kwdE93NUgxeWs4VnpCSmFsM2EzMmNjQVdpTkxD?=
 =?utf-8?B?TFB2SWdXMktrSUNWbWY4YmFXR1lBZDlpcGU3cE1hS25yOVVrVmR4aVJHNkZL?=
 =?utf-8?B?aUJqN3lEWktNdlZuWnZSdGFIaEYzU0JXQkNnTERvUXQyclFkQjNBNU5HKzZO?=
 =?utf-8?B?ZjNZamx4U0ZRYzQ0Z3EvaTRRK1RhY1lTN1FPVXJCR1hBZHcrZzB0dGJsS2FM?=
 =?utf-8?B?T0l5Y3hEVExWMmRUUnl1RThhT0FKekRrOVdGbG1TeDJEZnNPcldqQlZlZWxo?=
 =?utf-8?B?ZVNmUkVhUkJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZitPUUQ1WTlEOFBKOGRXNnpWdXVjQkI5VGNMODRzL1NIUXdheVVVWnRqam5L?=
 =?utf-8?B?aWhsZ0FQaDhRY3ViK2pDQndlOEZJS2ozenZZN21FUTU3dGU0T2doR1ZjdFRL?=
 =?utf-8?B?SjQ4NktvZ1VrUytrS2JWVHQyQWxxNStBNkxYaVVFWkR3RXJvS3JsWnA2MUMv?=
 =?utf-8?B?bm01S3YzSHVjMjQ4VGQ5NCs3RFFQaEEzeTZPeFU0NzhuTjhtNEhMNm50cFpl?=
 =?utf-8?B?VG1KSi9ReXdSMGVMOTFEcGlESWgxMWZOSGJWSDZRMjRyRnBCZThzT3hzd2VY?=
 =?utf-8?B?VktCc3RaejYzM2pKVkt5OHZ6OUd0M21JYnprR3E4Z28wV0Zwd2NiUkZhWHlx?=
 =?utf-8?B?bjlnMGtjZXJNYzdmWHFKdU10VnBJTkFmUmpGdUplemVaMngwd2VaZjQxaDE4?=
 =?utf-8?B?WHRHQ05IbXhza00wTzVXQVNzV2MwcnBnM0NSOXhYRDJ6NFV4VUFudVBMcEZ4?=
 =?utf-8?B?Q28wSXNaM1lYV1J0Z2RqUFFBVjczMmk5SStIblNaWUdoU1NzV1dteEkvRmpK?=
 =?utf-8?B?SlUvMVNMYXdqMi9hczdNa3lJUEc3cUc5OWd5d1F5SFJYK2htWmNvd2ZGRlRv?=
 =?utf-8?B?ay9hZ1JGcVozZi9VdFFlK1V3WHI1SExKdE84bnpGZ1dUOE9XQ0hVRGo3QUt4?=
 =?utf-8?B?ZFVod1FKV1hOd2JOWnJSaXllOHVCZU14V0lDMWRpaXBoMUtzOGVrRjBPUVZB?=
 =?utf-8?B?MDdLNXRuMXorVG1CaktMNHJCTmMxclFyQlpyYWhWK1lDRG5HVkJGU24vc0tk?=
 =?utf-8?B?QnZoalZLOHp0b0Y0aElLbnduN1VHL3Q3TjlIRzBadUQ3ZHJEU1pTdmZIMEZ2?=
 =?utf-8?B?NjlQWDdMT3drSUxQbHJVY0o2ZmgyS01ISENPa3M5bjBqeXJIS3g3bGVkVmRj?=
 =?utf-8?B?ZWEyOXloeGJXTW11Q1FZVVNodG4yS2pmaUUxVm1vU1cwdTRWb2JaNlN1bHZi?=
 =?utf-8?B?cHR6L281Z0ZENXltZWxYV3grRXZVVXl4cmRkZDVnZDZMbC8xdjBXUFhvdU14?=
 =?utf-8?B?NWd0VmN4YmhxL1RNYXNIOHkzcHNHd1Z5Q1h3K1h1bk9UaExFTWN1RjltM1Jz?=
 =?utf-8?B?V0h0MHVUMS9WcWFjcXppU29WZ2MyVlZHamRQOHVITTlvdU9Wa1A2U3oyVFBh?=
 =?utf-8?B?YjN0cUxBN1loeWszaGFSTE9wb0hrL29NMjU0RmhqT0dBMUhRTlNNN1Y1TFJM?=
 =?utf-8?B?aUNVc3p5c2N5bll1MGE0Rzlsb1BrWE01YVZsU0RZakJ6NU1tRVBrZGlrbGZa?=
 =?utf-8?B?QXVOVWc2cFhteWFaOXVGUVYvK2NOOVU0TGk0VDBYdFRnNG91azgzdHZXc25I?=
 =?utf-8?B?OURKaWRIZnlMeXhnV2NhVE9FMjQySDlWWGV3a1VmVFBNSm93L2NIbW0xeU1Z?=
 =?utf-8?B?QmlvU3FvQStleENCeE5IcXo0aVVkOWZVbXFNOXc0NDBYMUpwcndjUDZDNDB2?=
 =?utf-8?B?RlVJZFdQci9xdHQwL1hkTHlkZ000TGhuMHAyc3pEdTJONElLeEIvK2FLVzhQ?=
 =?utf-8?B?VklxS1RoZUFWYjlWdVJyOEtiTlUzM2VIY09CekNYZTJxdE50WEw5V3pDbVBZ?=
 =?utf-8?B?ZW9pZlU1TGdTNWF1QWI1aFhHdTc1UEh3T3drU0NocGxudVIycmFUd1UyMHpR?=
 =?utf-8?B?Q3Q0WWZCOStldWdrYXV1VkpYTGRiQmh4YXc4ajhkT1EzalJjdXNVMXphb0Nj?=
 =?utf-8?B?MmNZR2RLT3lTWUVsZjRhYytXSWg5bzFla2htVmhzbWhKMFVEL0ZDMU50NHhK?=
 =?utf-8?B?UUpucld4Z2gvbGNBNGMyV3V6VUp0NmcwWVlCbEoyRkdzQmFwZVZld2VOWGVs?=
 =?utf-8?B?UXAyYW9ZL1RZQ2FuM0hRdXpOdXcvRUphSEhrN3AzWHpmY0g2d3VxU1lTTXUv?=
 =?utf-8?B?cEs3clNDcGJTeUJHRnhaQjcvZTE2MEVkUnJDWVdwUUJwUUxVS0VTMDFpT1lR?=
 =?utf-8?B?dUFOSzY4RVRQbGtzUFNIWXo2c1oxZFlOOGUzaks2ZUI4dGJnRGlyeXZETEQ2?=
 =?utf-8?B?S2ZxdjYzbTN1MHhmcTBxWVk2alQ4aWMzZEw1dlI1cnl6dDdrTDR4anZVcWhR?=
 =?utf-8?B?L29NZUVpRUlESXVHZiszK1hFZVlyWHZIMGRrZ1JiS3E4L1R5RjJzL01SSTNn?=
 =?utf-8?Q?gzp2ltfJ0kEJBRXpAUxNmRDv5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a897f30-1441-45e7-b12e-08ddf5ece22c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:19:51.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRgkBqsu3QgyxgPvb8wYbic3wHmYOgRq1TcpPjfZVq5Fl/Ek5YamaP+hKcLRdsnCKh51eLF2+kIGdO7I4ItRDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9751

Convert imx_rproc_free_mbox() to a devm-managed cleanup action using
devm_add_action_or_reset(). Ensure the mailbox resources are freed
automatically with the device lifecycle, simplify error handling and
removing the need for manual cleanup in probe and remove paths.

Also improve error reporting by using dev_err_probe() for consistency and
clarity.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index cc776f5d75f1f614943c05250877f17537837068..e30b61ee39dacc88f9e938f8c6ffe61fef63dbda 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -93,7 +93,7 @@ struct imx_rproc_mem {
 #define ATT_CORE(I)     BIT((I))
 
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
-static void imx_rproc_free_mbox(struct rproc *rproc);
+static void imx_rproc_free_mbox(void *data);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -780,8 +780,9 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 	return 0;
 }
 
-static void imx_rproc_free_mbox(struct rproc *rproc)
+static void imx_rproc_free_mbox(void *data)
 {
+	struct rproc *rproc = data;
 	struct imx_rproc *priv = rproc->priv;
 
 	if (priv->tx_ch) {
@@ -1101,15 +1102,18 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_free_mbox, rproc);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to add devm free mbox action: %d\n", ret);
+
 	ret = imx_rproc_addr_init(priv, pdev);
-	if (ret) {
-		dev_err(dev, "failed on imx_rproc_addr_init\n");
-		goto err_put_mbox;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_rproc_addr_init\n");
 
 	ret = imx_rproc_detect_mode(priv);
 	if (ret)
-		goto err_put_mbox;
+		return dev_err_probe(dev, ret, "failed on detect mode\n");
 
 	ret = imx_rproc_clk_enable(priv);
 	if (ret)
@@ -1174,8 +1178,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 err_put_scu:
 	imx_rproc_put_scu(rproc);
-err_put_mbox:
-	imx_rproc_free_mbox(rproc);
 
 	return ret;
 }
@@ -1188,7 +1190,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
-	imx_rproc_free_mbox(rproc);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

