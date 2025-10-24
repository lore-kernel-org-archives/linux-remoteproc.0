Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFFD28DC4;
	Fri, 24 Oct 2025 02:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761274315; cv=fail; b=tRsv1BxSCNNF6aTTuA263293Gd4t6q9b28CTZSjJbEdraUOmpqNHAKI5taaqQNKh8eJNqwLz5cIptpfBzSvSZKfiYjJcGyNKIngYnbp5PTg9gM3pUSj+eRa2SBa0YPS7jF0JJcaTNHl+2NTsVao7co6LCY3C6X3MWIFnvl6YnYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761274315; c=relaxed/simple;
	bh=zj1wJZoRzQVOYlYOKrgVjjCd29zhVc5N5hWXIh/JD+g=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=rLDsSMSm0/fLmi33zSe702Dtf5N/IdAinIgYk54PYi/T03bIX5NCipwpsr7FdOB+0/E66Hvp2FgU6UAcf4AzmS2dx/mqNWkP8guiTDSVeajd7Wtay3OThtBE6hSEsnGxIT9C8II61x0fVMz57vd+qDr6mxTDwQQvH9k/xpiaDBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cv+NIKoK; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cv+NIKoK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix3in2cthxgA6MhfA4pWeRrSNzb6HB4mVQU7f1MI8ijO0q/GTnRIS4q/qBTAXssddvdTYwIAM0vOGuzPjyRUVhyA5FuXCj64SvLncvjqpDGn2PX8L/VJqDb7dQpcsxEQ2JIQQLIzYH87mKLQOPGQpYOoCEZ66egs2lW7BHt/becQQe5ArFAPxwrDyf3hjMS6OtwWNpxNeWvAI0YE2LHk8/tfbNz6hOrF1kvjhQVyod6lnP5Ympm8qgfOnf8a/F62ghWMmeISEoDgEdoJlxiBfvoXbbPgC7xVXIn0eq+RFXW4kauvSpPOfxoWSPjfxdeqWOwEEs5GbKJ2db5/ahREqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cyHT58NA5uaqLQLdnkIFztg9MYnPixFkju4gznlQCg=;
 b=gHu7VC48o1+JLIAL4JOvnbzdQwd72bEBokl2wQJViCSgxqTevC6slKeLzRVWytyKw202d50UW07JPDrB6zCwq2ASAZ8DwFJ1RR2o5j4vAtAUicHYgGHcY82jxYVVL/wc85DkWTF/r3fD7UGH6J/+v8I5SNkanRU0hTORIZl1r/Q5SLK6jybnQJHlVYm3ajx0t1Gizz6b9VxDiV1nB06dU6nmqKV+QOD3wExN1q+kro8YmNlBMS/dgpzLl5BiJIWDAFi9yueARRJcmdSVJ3MTU1tqSCYSfyGUtqp/tKAAEe6lkzD9gw+xOZYGTSISMzO9rJrQXv/kK7feE503ru8PEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cyHT58NA5uaqLQLdnkIFztg9MYnPixFkju4gznlQCg=;
 b=cv+NIKoK4L/MR8v3R5IEVXS3y6pmz3lV5Yd0XKA3+A3F/4z2xT2ayIlbvuPPjq9GvvEeZZ5UHjuq6xc0yHg+l/ac7JeOhmU7yc3sC/BUWZQVyKEi9oT3lao4wZeyQbJGd2zkT9l0cbXbImeaeRhWUDjYFwq3T04Cl/KKP2yjE06HgEGFVQzNrQS5DXOhaGt833xWmmvq1Eg3yQ+WeaMzHl9nbAx4xNXg3ZES1PM/qGM+EtHHG09RdYQecPU1Re6aBuRfpcDqL77y5wIa4tWXg2T7guwCTBR7r+1r9AjtbL95ykzp7BTHhp+uqsRbliaEupX2FJ9tIV/v4QwWqCpEXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:51:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:51:49 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 0/4] remoteproc: imx_rproc: misc clean up
Date: Fri, 24 Oct 2025 10:51:27 +0800
Message-Id: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/p+mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMT3czciviigqL85PhkE10LS0sz8yQTQ1OLJDMloJaCotS0zAqwcdG
 xtbUAfyX8QV4AAAA=
X-Change-ID: 20251024-imx_rproc_c4-89967b4158b6
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761274300; l=2087;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=zj1wJZoRzQVOYlYOKrgVjjCd29zhVc5N5hWXIh/JD+g=;
 b=kWG+5Hb5TBwyxFS+LR2B3X2QIsiQIqCFraHIbqyolSvb0tAc1CZmbqQ9W0NHsQQeJdRe0t51j
 uVnz0zZC3+wDRwKSVSXI9YkvOiD01nd5+xjyJOtOeLCHc0oBFDcgBAR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: dba27191-cc0f-4716-7e7d-08de12a846d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFVuSE80eEtNQ2Z3aWNMQzJhY0NBVW5XRk4zQ3U3WWpsSHhFbSs1Znk3bzlS?=
 =?utf-8?B?ZmlsSjRmQnB1V0k0SGZRUTRmWlM5YVpGVnprUzBCM3Q0UDk0YjlBbkIyZ05S?=
 =?utf-8?B?cHYxOUM1Y0NLcjVHMm8rRlR1aVdOR3p4WVBHQUswQTVCNmVPRjNmZ3hXcEhw?=
 =?utf-8?B?clJXU0V3cW9Qc05qODF5UGluT2hpMFBtcUFZUFcybko2TXdBRjkrdGRPdkow?=
 =?utf-8?B?clZTWkx2c2N6eEZUbTk4UHhlMUVhOEp0d1RVY2ptN0hHMU9SN2dRZ3BVK2N5?=
 =?utf-8?B?ZjNuTGNNTnVlYjlnMUtMZy9zMXh3cjZ0UHpwbmxWUlB3dWhlbnExODF0WFZw?=
 =?utf-8?B?aVkzSHhKUXJReCsyUHVtaVNDcWR1dzdDb0R1aUR6bW8yZ0RGZnMyemJHRDF0?=
 =?utf-8?B?RGFVNG9aWEt0NDhHR0dXWW9XM2M5UXFYdVlMS3M4d0V6OUIxdGZaeWhPeW5F?=
 =?utf-8?B?dHlhU0kvS1kvWFcrVStsOHVJcGJ6Y3Fpemgzb3pCWi9XR1lnQkdMUWZJajN2?=
 =?utf-8?B?TmcxdXpPZGtVV0tvSUFTbHNuY01sM09LYlJlSjVKajB1VGt0a1FsN0RJREN3?=
 =?utf-8?B?VU9Ybm84b3B0RnhGanJBNmkxSGhLZnVrcDY0b3BlbWNWalQrZlhIVG5GWXFn?=
 =?utf-8?B?K3RYZHc1NDVYemV4MkMwdVZlVlFTYUhPQ2lLdE1kNWxYTTJPOHgwSjRtdFhm?=
 =?utf-8?B?SEUzVTFXOXQ4SlF5dE82eDFHemxaQWlxT1JEMUZIY1Q4eTVVNG5SalprOHU5?=
 =?utf-8?B?N3ZHN2J3ek9HWG80Y3JDV2x2eDJqMFpMZkdVWERhc1FIWURTaHpxRmEwMzVF?=
 =?utf-8?B?UnVJQ1lqQ2h1N3I0bWF5YjRIOWpydVg1Wk8xTHd5cDZ4eG9scHVoVGlONmN1?=
 =?utf-8?B?WU9aOFd4Uk15YVJpVEdWK0pHWDNEZXJVRlpRZ2JoZURVRDZteFNXL2t1Nk5p?=
 =?utf-8?B?QXlhZXlDV1NYL2FtZWdweVVmbGhPU0wrMTk5NVJ3dGNFcGNhL3ZNeDRZWGNn?=
 =?utf-8?B?MGZCOTFGNDRKWXJhS0dLbWd0QTV4ZUtrREszNHlicy96T3pzU05OYUZvRmlm?=
 =?utf-8?B?aWdSdDRhUEw4Q3ZRQXNLTTBJbXY4b1kyRXpqa3E2bUNoRHVyUVlIRzVhTjZD?=
 =?utf-8?B?OXdnSktjNGNHNk1KUVpiQmNGVlAyY2dUZzRWaStvTU9scTBKbURON2Ztd2Y2?=
 =?utf-8?B?TkpXd1V5VWNObGluU2pMTkxTR29vbm1lOVVmemw5NjBISENEbVVoOVNZSDFT?=
 =?utf-8?B?V1lmaHdJdStkV0EyeTJ2N1d1QXd5ZHVTeE5JZ0NPTFh4bjNjbVhJYVpXMzJ5?=
 =?utf-8?B?VG51WnpWVzJPM25TN0Z2eXBTYy9VR2hYWkdtSDhqWW5SL0dnMXNtNlkrbENu?=
 =?utf-8?B?ZVdscVNTOVhWOHdHY0RhVWdRRjFNWGNIcHZkSmtGUHdzeEZqbE5iZE1WNDZX?=
 =?utf-8?B?dzhCeFJPbndVMEhiaHdDczlqWWFjZkRxMHJXRlNyRXRwUnFSTjBpQnQxK24y?=
 =?utf-8?B?TkRlVHVXRlNkdnpxL1FEOGtMVmZXb1hyb2x1aUJEM2ZnUWRpMDZoaXVVSXFt?=
 =?utf-8?B?dkJkM2dXd0hNbTh5am9Ma3JLWmxTcEMyaXQ1eW4rQThPbjNJYnZUd0drSks5?=
 =?utf-8?B?NHBTM0ZJV3YrRmhzREs1dU1kMUZYWS9Ta3loenlTVmRhVzdFaUdNZGVlZjlT?=
 =?utf-8?B?Z0NZdmdzTHBUK1NOdVdNajEwTk5uaTEvQTVrRjFRd2g3M2hwUXp0S2RFZDlj?=
 =?utf-8?B?QkZzR2s4Sjdna01hTmQ3WkthbHNhajljajZ0NGh3Y01DTVg5bE52ZVFiMXdH?=
 =?utf-8?B?Vmh2RDV6VVpEQWN3eXR0TTBlUmMraWVIemh5anN0clV4Q1FTTGdTeldJVkkx?=
 =?utf-8?B?cGNjZ2xHTk5Vc3ZkL29nczZVYkdXV0UzNDNnMVFrTVloTDFYdmVQQXZjUzlj?=
 =?utf-8?B?bWlLbkVKOUVCR1p6ZFRWR3NDZ2plc0U3ckxzRzhxRXNqZ2R6UUtDRVA5c1Bz?=
 =?utf-8?B?ZFRGVEJHc1VraTAvVVI1UGNsWnlFcDVUbXZmUTRtaHR0eGtmYnlVMm9PNUl4?=
 =?utf-8?Q?ECd+Jp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWhtc1ZXUndqUE5uOXd6dXpaVmV5R1lDa2pBeHI0ZjNvT045dFdYNnVFbGxE?=
 =?utf-8?B?VHJlbVhZc1ZNby9Ua0hOY2tUMGpBRGZpU1Q1R2RLSkVhTHZoYlhIVk9SaEho?=
 =?utf-8?B?UmtSNlZYSGpNNGc5WUFrdUZwTGFESGZCT25McTNLdU5EMTk1aGo5bFZNMGsv?=
 =?utf-8?B?cTNhR2ZTSlhZVFdicFVYYTM3UlE4Qk5qN3pDdVd6dTBXYm16Uktjb1o3NjRp?=
 =?utf-8?B?MjdZb1pGYlRPbFRxMDVWQU9lSDVhZ2g2Q1lWWk5nUnBEZHNScWJvb01hWWZO?=
 =?utf-8?B?RjJZSGJuRkRDYm1oaDFMQlNYRVd2RmNkSkRqL0pPd01JK3htZ1cyeWlYd1Vm?=
 =?utf-8?B?dFFhR0RPanlEME9GOHhkSitoVExxY0ZLeWtzcWNWM0UvU0cvelpEajBxZGZt?=
 =?utf-8?B?aGpDY042UFdHbzBLWFpRK3I4UGtYZ255amZBVmxrVWlDTWJiT1QxS1JReTlq?=
 =?utf-8?B?Z3lGTUQ5WVhFeGVXNytWOFR0WGk4T3dvd3hacERmaDltUXcvcHB6YkMvdzQx?=
 =?utf-8?B?L1hkdWlabTdvdzhkMzJCUnBFU0hvdXZkempob2NRZ3JqdlJDMWpTb3hQcHdv?=
 =?utf-8?B?Sm1VRmVrS0crT0UySjErRHZaVlpJRTNTYWNFcENIZzYrQkNRdTJnSjhidVdC?=
 =?utf-8?B?Z3VCbVQwYWhCdDAyamh6dC9seVBiWlZaL2V3dEhOT1VhaFYyVUNjT1l6clRk?=
 =?utf-8?B?bU1HUEEzWWdDQ3JGQ3lIVStYS2lmVzdaK0dhQlE2ekFWenBqYkxBRmNRVXJQ?=
 =?utf-8?B?cFNOZkxSYUZwS2hFNERGTjR5bzNHWjZkcVhHbVlLN0lHdWJ3NUNoZHZ6cWs2?=
 =?utf-8?B?ZEN1Y2Q5K1p1WTVLSG9TTEE5SlErMU4zVlBiUXcySUFGODI3bHJXcGJkOW11?=
 =?utf-8?B?Zzc2aGp5ai9aSWk0dG5TTUp0V1BGWkFta29FU2k0K3oyaUdLYWdtSTQyTEpS?=
 =?utf-8?B?ZkIwR3JWc0tLcFhLYUZDNktESUJpd1lSZ1Vac0twNUVjdGVIMy9oaHcwN084?=
 =?utf-8?B?ZEtoVnROYzdKU0xZMVhDck5pckVZTm1qb1kzdXNzNWY4MHFjZHdMWjY4K3pz?=
 =?utf-8?B?TitpYlpOU3pzbzhXeVRJREFBR2M5WGk5NGxSRXF0S2s4WlNaSDJLYTdhWWNw?=
 =?utf-8?B?Z2tOOUJkY3AzejhSMmxERng0YkRicDZ2UFBWSUpvRFN2THl4UFBlY1JsSGFP?=
 =?utf-8?B?N1Z2eFVodk1Ebk11b3lORW03MVRpdU5INFZNZzVjN202NmFhVXo0OHhxQmkv?=
 =?utf-8?B?SnpQYmN2TlgvV1VDRHhLZkNZZTVYdlQ5eTJqRGoxcndwTnljMVM4NUlYUFhC?=
 =?utf-8?B?ODgrd3lmc1hrQ1FNNzZXTlVuZXVEeGFRZWlESWFhR1o1M1h6TndUcVM1VkJy?=
 =?utf-8?B?bHdsMnFhMHJBZjNqL2JPL2RpQjdkWkFadFVDKzFEVlhsa216OUxlQ3Bnelp3?=
 =?utf-8?B?WURyNGFSZ01YMVNFdkUvb09hUFY0cXJVTUlmV2pSb0RQaXNaOElKbzh6K2Ju?=
 =?utf-8?B?RFVET2JWTW90NEhMRHZma2hRdXZBMFF4NHlKelIycU43QXpQTHBMU0tvK0R6?=
 =?utf-8?B?eFRTTHQwaU9qdlFSS3RDYkdQU1BiN3JZdWROWW5wSjFBalJ1cG5WRWk4M1dS?=
 =?utf-8?B?UTJWMHdURFlWYmdWN1dwejM0QTk0aW9VNE9yMm9SS0svVEVYYjNTclI1MmF1?=
 =?utf-8?B?NzFJWEdLUERtNzNLaTQwbWdwTTBHZGF6TkJUREVSeUNXVksrRnVCOUxzdmZY?=
 =?utf-8?B?U0FDNnVNQU04R1RaM25lMUNMOUMvdE4xRll3a3JTaHMyVE8ydjVieVRva014?=
 =?utf-8?B?UFQrUlgxZXFjY1Y0dkxxZkI2ZlNNbFV2aW9KU0dyTkVRSHk3bVFYWG9jc3VU?=
 =?utf-8?B?Si9PcHBib1JTK0RiUEt3aEY2NS91ZDlmeHFlK2w2WjB6RlZwcU4wcWJ2Kytz?=
 =?utf-8?B?YmNBZVRoT0R0MXNrd2FYQUZ3QXM0OC93R0RTcnhRK3MyNTZ0UytES2E0NTlP?=
 =?utf-8?B?TlAvbnpzejl0NzVLMnczQkR5N0dNQ0FTWHE0OHJITFRxMEpLQ2s1aGE0bVJ2?=
 =?utf-8?B?cHk1dzJ1eStGY21FWjVTcE5vNjVwYUNQTi83SlgyZHh0UU90Mzd3UjFUY1A1?=
 =?utf-8?Q?abmLvqyuiRTbgAKRXppdPJ6+r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba27191-cc0f-4716-7e7d-08de12a846d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:51:49.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9FyrWkkYE2bN+YORqlhP0IFaJ/lI1jU5I9E3b1UVYLeo3ON8Jp5FiOuoC1okeTah1riUzmyrxlX0Bnus8caQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

This is the 3rd series to cleanup the driver.

Patch 1: simplify clock enable logic
Patch 2: Add a platform detach ops which will be easier to support new
         platforms
Patch 3: Enable runtime for all
Patch 4: Drop method assignment

This is the last patchset to do the clean up for imx_rproc.c.
After imx_dsp_rproc.c moved to use platform ops with swith-case removed,
the method entry from dcfg could be removed in the end.

Tested V3 on
i.MX8MP-EVK, i.MX93-11x11-EVK.

Tested V1/V2 on
i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.

Thanks to Daniel and Frank for the internal reviewing.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Drop patch 5 which updates MAINTAINERS entry.
- Add R-b for patch 3
- Link to v3: https://lore.kernel.org/linux-remoteproc/20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com/T/#m68811fc8e9fc92d2c091926b0d5e699e8d888fc6

Changes in v3:
- Rebased to latest next branch
- Resolve the conflicts in patch 3 to enable runtime PM for i.MX family.
- Add A-b for patch 5
- Link to v2: https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/#t

Changes in v2:
- Add R-b from Daniel and Frank
- Update comment in patch 1 (from Daniel)
- Update commit log in patch 4 (from Daniel)
- Include Shengjiu as maintainer
- Link to v1: https://lore.kernel.org/r/20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com

---
Peng Fan (4):
      remoteproc: imx_rproc: Simplify clock enable logic using dcfg flags
      remoteproc: imx_rproc: Make detach operation platform-specific
      remoteproc: imx_rproc: Enable PM runtime support unconditionally
      remoteproc: imx_rproc: Remove the assignement to method

 drivers/remoteproc/imx_rproc.c | 90 +++++++++++++++++-------------------------
 drivers/remoteproc/imx_rproc.h |  2 +
 2 files changed, 38 insertions(+), 54 deletions(-)
---
base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
change-id: 20251024-imx_rproc_c4-89967b4158b6

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

