Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD262D94A3;
	Thu, 21 Aug 2025 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767130; cv=fail; b=l6j/KQVyP1d1mARr1OqJqY1tCCO7C1ZFHxI/rZkT06u42rJcgU2vjCoxxnLb7k3DPMHGP+0+nmMHIBlEx7ceGf0xQQT1DtbusRPkSwpDazbbCyNE1HBAVhBdLbaPpW5Jd4h15zoLbrhbYoBfctMI8pXr269QOz0y3BC2UovSikQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767130; c=relaxed/simple;
	bh=gK3iz9HF0gjh+kJRNJIRZ0AeupB6Au7cocjYgGOOvoc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=qMuHkX0q0Gw5mLauFHPlZeVl/gM8Z1f6EhKwCJKjRMH/tautWsuOiS154ztO84FS5T7Ew3a1qUwqLaK2d3nY/PsJ1Nw57dwx6/X9rjq1f/l98A4QIdUAMKyW/+7xs8zfGAQbhAXvAlTKOWbfORO/a+zJl7Bb9G2BgY+pKCuGyx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hHAqZKMN; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHAqZKMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2D7er5xC9Bcd0CAqPHvCv6BMlgOGGQ+ov1n/xlY5x8p/2+9cQi3GcQxwy69sBIXU4H89fHHi1AwNDjdAfjTu7h+NIsnt6nGXdoU7KCzSIckJIER5oagr6r6xXgzyKm/nUDFInMp6e/IWDYktUClvj3e36cVc53PsU1PenmUeT7GQksl79pnr+hjEE2LIHxHFG3EbPCyHuJr1HdYK+15JBLLdPhLAzUCeIwGDD0C5BYUn2Rjhqwi3BgN2FUKC2hX5AfsPi+/HyIAP4cDSGWuRBE8ExIoMVBjB71ZllCnF40vZErEntU0G6ENJjj2fX0n4yBlV/6tGeO+LPiVqcGdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n572feGW+t5s/xL/Pdw//55qCyK5MhkR7YHxaw1GW3w=;
 b=uRyoojsUjMZvmr7zvg0wvz6CnCKVNZbVuqy06Ycw2MS5T4r1Tt/G8OAlkZRf7O4S8SJQUBx74K/AC4CuvZjA0lSyjkYFg5bxYx+ouvlaiH6ZvyrHWp6U8LUCaCAuhu4hk2nNTMx9boZKHn4qu17zqkFXRWgXMxZ9Iz1hSm4+cMTSAlC8InirJJAgc0PVqK2ldyJIL4va50gEOAhdoMiR5bej5BauybZPvuyaf3Q2YrQHWYnpxwuYkiYCUgaDZqCntUSoPCwB1cNb6T7k81nsOogdpxGWvg3w6B+ozAFLL8HxFxAyt9kRkBuEeacdskhoMWp/lOzI3j+mfttUqK3Yog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n572feGW+t5s/xL/Pdw//55qCyK5MhkR7YHxaw1GW3w=;
 b=hHAqZKMNQlTyVn2QQbY5Jp0bXwqFjq+Yxm5lCxns+Cm5jPCMDX6oAfKH3ZGB6Ukt0ipkR4mh+Rk3q9YZJzZNbzzNYilVFFjvMtfZPA9/gUa8gx6SWLSPowptdw+MNROPKfWOvYib5Dl4f59/PHeNcRokLKxExSEDwEjCy/RlErV/IMOQK/dwVM39rOpgGNAJboyYbO7xBworJqOAIo9hc7tB3+KMdNj6x6nwy6PVEj5Gh7RnuUFfO/Ow3/rjJDZdY1Whlb53jKAZ/x8J/ZUdKpKxOHawkISskybupDQ8t5Ks5+bWCEjbyUPLu8KSdzWDH+Wg/P40+AZnotWTN7OKWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7858.eurprd04.prod.outlook.com (2603:10a6:20b:237::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 09:05:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:05:24 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v5 0/3] remoteproc: imx_rproc: Support i.MX95
Date: Thu, 21 Aug 2025 17:05:03 +0800
Message-Id: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/hpmgC/23OTW6DMBAF4Ksgr+PKM/bYuKveo8oC/zVeBJCpE
 FHE3WtStUlol2+k7725simWHCf22lxZiXOe8tDXQIeG+VPXf0SeQ80MBZIgJJ7PiyVexjJ4Dhy
 Fc0aF4NsusWrGElNebn3vx5pPefocyuVWP8N2/W7SQu2aZuCCdzpSIkAjwb/1y/jihzPbemZ8t
 HpvcbPoglZKti7aZysfLP7ZldUqp30CYQhM+LWH5sfQf0ZbKyQksqjD85667xkQe6u2Xw2gjC2
 ZkNzdruv6BUzctfGQAQAA
X-Change-ID: 20250525-imx95-rproc-1-20bb74ddc8af
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755767118; l=4144;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gK3iz9HF0gjh+kJRNJIRZ0AeupB6Au7cocjYgGOOvoc=;
 b=O9DIxwMEzUMV9Pwc0XtP8lkiguXtzKANLzcCrMWqy1xo0tKQRdsN0ua61lKWD3H+Qbhby3Vny
 ACDZx2WmZ7FA+TB1vTRstWKTc5h86ygFgvdKmvoRAW7Rr6NwQy8eUWn
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: f583518a-211c-4de7-e3a4-08dde091dd3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djQrQnVmL2ZGb1g2Y1JmNVNZem1lRzA4ZHdVYkFkMi9LWklrYTAyVWFrSzhy?=
 =?utf-8?B?Z1FPR1F3UWZYT3hJRnk0M1FFWTBINmJoUGRhYTBValhUUXVnSTZnZ1lZU01E?=
 =?utf-8?B?cHdrOE0vdFgwZUJEWGZYR2x3dWVSMHlIMUdHSGlqT0xLSUZwTmxzY20reEpQ?=
 =?utf-8?B?WlptZk4zSEFwajV5QjhvZmIvVzB4eXZvT3h3a0lUbmhPUG9hbytNWXBqbnVV?=
 =?utf-8?B?ajhoSllNUGVhaGJjQ1lJNEhuaGVHcmtHd3VjN0RUdWNRbW0xUHQwOUxVeXBy?=
 =?utf-8?B?bFFoTFhHb1ovLzVQZ0JoTVNSTXdPanNvZS9XbUo1LzdPY0JEeUxzcDJKODBh?=
 =?utf-8?B?Rkx5Y0FPU3IyZVk3ditYaTZPaWZGNmcyMC9RNzdBYndGTUR6eDVsN3RUbnVi?=
 =?utf-8?B?a1BUSUJ3ZHZ6RFVmSUtPRWlLWXkvSUo5dzcwcVZ6VHF3b2c0S2FVQ0pxV1Zr?=
 =?utf-8?B?ODRzQUlpQlpVRkY3c0VMdmhJcnVjdXoxRmQ5KzNlY1NMblVJWWdmU0c1Ym5L?=
 =?utf-8?B?K2lmUUtCYit4R3REbDBrYk1ac0x5SGFTSm5qbGR6QWJYM1ZweUpwRFplY2FK?=
 =?utf-8?B?K3BmbE01V0RlT1pINnRkZ0Z3a3lmdmY2a08zM0NWeGZxMDQyd3kwalU3Mksy?=
 =?utf-8?B?Z0V6YjVzZXczTmdxV0JKQkdCd0NtWXlGbE1jc2N3ZU5OSjhvMUFpQ2pCb05q?=
 =?utf-8?B?TG5XaFZyWDlhQU54ZXJoVytabUZoQTcxTTBHaFBCUEYwOFNHRkNhUEJITVNr?=
 =?utf-8?B?d3hiWUFDV21yYnBRT3BTQmF2M25KY3dkU1pabWh2ckhCWGxtNzk3Zzd4RXBs?=
 =?utf-8?B?ZndlcU1SRkJ5b0VBekZVS3BjbG45NzM5TjBwZjRXbkJjcnhpZm5KR1lhdVBi?=
 =?utf-8?B?RTg3RU4wTERqTTJJc0lDSVMwT0ViQkdLbUV3cHFSZjgrYXdmSFBHNGtza3lv?=
 =?utf-8?B?SjRvUUtFYjdjeHo3a1Zqa05zbUNpWTZuc2k0R3Q1eXg0TE40QVNjSFRlVHRa?=
 =?utf-8?B?aHY3aWw2SlJnOFNRNlV0TndQU294Zy82V3hTMXNVM0RFREkrZnlnUGRXdklM?=
 =?utf-8?B?anRtWEUyT2xMdUEzSUdFUnNLTm9qZXA2WEpNOVl1U1pkQlUxZHA2NnpadThL?=
 =?utf-8?B?dm1Qbjh1ZHpHazQ3bUVwd0oxQ2ZwUnl3QWhWcU43VWFOeXFjZ3B2VlBQcm9Y?=
 =?utf-8?B?Rllvc21XWTFtMFNUK3BXSjZIL3NyMDRUek1aSmhBeUY4NUQ1RnVLS01QRTR4?=
 =?utf-8?B?S2gxQmZGcnArclRBbzZ6TmY2NWdDV3V1ZmdwVjFMSHN6VzZPWGxna0d0QWl2?=
 =?utf-8?B?Zy9LNkJLN3QwTWJBeGFlRExCMmEzSklDaGV2OHEwNVNWTktEb3pSd3RsRjdm?=
 =?utf-8?B?WUhnU2FSdnZ3VFRiQXY1RVB5Tm1RTzM5OFE1K2ZmSWpYYXNVSW1xRWl2Tk04?=
 =?utf-8?B?T0ZHWno4NWhLbkpCcTBUQUY2MFhwemhYMUJjK1AyL0pyZ3VUTTdSZjRkRmJr?=
 =?utf-8?B?Z0JBYVk4OFNuUmM5WXpqZStDRytoaVlqSCszd2N6NUZpTlFBRko0WEhsd1Fr?=
 =?utf-8?B?Tk5wUzd3TXEzT28xLzFzcEdhVnBxSTJVZHpDbUJlK3Y5UFdQRWozUEJ3Q2pJ?=
 =?utf-8?B?WlVWN3BwL0JVdFVMQ2Y4R0VldXlDRnZsQWttM1NzM0Y1SWJML3JzeTJKNzFw?=
 =?utf-8?B?NXB6aWdXN09GZE9TcVhrdFdWL3lCY21jWUFtSFFmWTU5MTIzdFhDZ0xhbDdJ?=
 =?utf-8?B?TTNXd09kOTRjalFROFhkWXgwUWdVVlFaWDJYOC9vRys2NnBjeld6WFhWNTRp?=
 =?utf-8?B?Y3E0ZWZqbktXRGZlNk5sSVhuQTE5b0ZZWVVXTUkvdkY1TmRIOEovWi9rdWVE?=
 =?utf-8?B?b1ArL01JdkNqOFdwaUdYU2VvWXZGUzQzbHJFcUg5c0tURjNuSjFxWm9PbGQ4?=
 =?utf-8?B?bVlWOGcwN09naXRnc3FKajZIRTJ1dVVON1l0bnIyRDRFYzdLOW9TcnlTYzZi?=
 =?utf-8?B?Qi9UMUM2eG1mbU5NY2FyNDIrTCtHMW5oQjhId1lrb1JHcUFQVVFjR29WbVU5?=
 =?utf-8?Q?STA3HN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjNkblJYZ21wZGRudDBJUzc2WDU0YzNVbi9CZGxNQmc2VWJueTRvbElvMjhG?=
 =?utf-8?B?YzFUek9KZEhyNHU1ay9uUWxxWTFheURMdWV6Q0dhZXFFQnFrS1hMNko0eTdh?=
 =?utf-8?B?VkZ2citGQ050NUgrdHV1R3RGNUtSd2l2MkwrMk5DY0crMld4Ym5FNlJEMFB6?=
 =?utf-8?B?cEhoOXlPQ1Bwai9zMXBvSUZDSFBPSHh1dUxtSE1FWENVM0ZKT0dMbnBiY1BC?=
 =?utf-8?B?Tmx3NU1mNXpzV3k4S0ZqRngzMjJpMUN0VGNDWVdKNFpmdWc5ZmhZNGtXUnI5?=
 =?utf-8?B?aHJITTBURGsxa2FWK0lEdDdiWlpFVmMzbVQ1ckJTRmkyRzRLT0N0a3o1eW5X?=
 =?utf-8?B?Z0p2UXgvbVJ0ZTNweXF1SjlyRUlGU0xDQk54bytLa3BpY2tvdVRieEJ4VHRi?=
 =?utf-8?B?WG5yMjBTS1Vselc0UnI0U3JqQitxZmowSy8xSnV2OUpiNUl2eWlwSFYzdkNy?=
 =?utf-8?B?eU42dXRoMUhHZkRvUUZQT2dMeGhuZnYxQ202QXp3ejIvY2xCdWJTSXM0RzJm?=
 =?utf-8?B?bFBFbWxqUnVGbVBMc3BtOWgyZ2lnOFFIYzJkaTdXK1djZlBVYkxmN3pjWXNW?=
 =?utf-8?B?NXpQTlRBeUtJRmoraUgwVC9uS1RaV2doQm0yUlhPa3FyYkVCYU9jWFNkQk1F?=
 =?utf-8?B?VDdBMldld3BBcUlpcUpyUVM1YUdhZXowT2h5YVhPS3NsT3BLalBFMUhUWmJi?=
 =?utf-8?B?UHpUVnl5TkR3WXlwZnhhYjdmNDFSV2cvdVYyRjJWcFBkV2tkYitkc1VNclRO?=
 =?utf-8?B?T1pOaGt4bFVnbFRQM3JnL3hSUE1uZHNpVDRuaHNwakRQQ01aa09wOTk4QzVn?=
 =?utf-8?B?NmVGeGlkTHRXbDdUVEluNHdMc0hwT2YzV0hoNWxSSHUrcUIweTgyUEIzWG9z?=
 =?utf-8?B?bTBSbXhzRUZ2R3l4TnlJdmFRSThVNDF2dFg4YStUUTdoZnhTK2ZtKzgweG9Y?=
 =?utf-8?B?N1JmYjJDL1RsYXV2enQwS2hYT1RNdXFvUk1ucGRhaVM2MzhGQWE3eHhmUGpH?=
 =?utf-8?B?ZWNoZVlPVWt3eExkV3ptdFlpejYyU0U5LzFQSEFVYWk4NEpyZERURjlydEZM?=
 =?utf-8?B?NGp2YUhSQUR6MjlTMmxxdFVDTmxxZXE5eUtsLzJRN2NHT0xhcnBVWnB2akVp?=
 =?utf-8?B?ak1UUnBNa2V3Rmd6WnROcVkvcHRkVzhqTjN0VS8rR0VIbE1IYlp4M1pqR1Jw?=
 =?utf-8?B?SVBYQ2VPMlJvb3U0UHdTVGY1V2VVdllIZzZlclRVc1VyOTc5S1JwbFlkTWZP?=
 =?utf-8?B?SFNNV0V0NE1aTVdIZTRkSStMWWlDZFNhNnNNT2dKaXdQUUIycEY2NUl5ZHcv?=
 =?utf-8?B?aTJURlNOMFZ6bjAxakpkWWNLVXJSMm9ZcmtTSkxYekZ3V3R2RVhOQTNwSG9O?=
 =?utf-8?B?cjhNdGZYOVVxRnJpMFhwVUFuT1k2ZnkrbEFVdXgxSUNLR0M4Q1ZiQWdwVE5x?=
 =?utf-8?B?N1dqVDJVdDc4QXEvb2lmZkxab3NDWmNaSm1qZXlwazdKZ29RQ0lSR0dOdUE0?=
 =?utf-8?B?bk1uNkltMFVJRTJnZzUzY2ZBYzFmNWJOL1YrWjhleWlBeWNqVXhIT1RNQkJv?=
 =?utf-8?B?VHpXZGRUMlI3Z0hKZUE2dk5sVnNqMGM2dnB6SDJRUzdUK0NTY1NtV3VOTHdS?=
 =?utf-8?B?b0lSRFBXNUljLzZ3Q2liYWc3VXJiY08zL0VCTDJvZzQ4SkxKdmhCaFNMY2gy?=
 =?utf-8?B?dnF0cVZ0c2ZYOTdJVlVFYzhnSlhNbno0TWYvT0tEZFRPZ0hNb1VFTSsxd2V6?=
 =?utf-8?B?bXM3TDhJdjhRRTh5VzJvdFJ2KzlDQ3NtaFBSYzZqZjVZWFhyT29EaUFQaHJW?=
 =?utf-8?B?dXRyRmdPQjIyT3JXc1JFeXlicTJvSGJGQXFqOFBRQ1lmZnBGc1lRWXhJNXFo?=
 =?utf-8?B?cnl1ZlNsUzVyY3lBSEV2ZU93eVpleTJnbUZsbVBwT2FoUFB0dS9ocFpUR1hk?=
 =?utf-8?B?RDkxalNiaVhNR3paUFQ0ME1iWmdheUYxMk5qb1ROTk9pMWZTL2pNL3NmdHBk?=
 =?utf-8?B?Vzg4MFpKcjlBZVNYZVNHK0hXNTROckNIUm00N2dacVR6aHZSUHlYTTcrV2FE?=
 =?utf-8?B?MUl6bEFZakdVVmRJT0Y1RWRsbEw0MGQrRWN5RTRDcXhNeE5taXRsREdqSDE5?=
 =?utf-8?Q?dio3cBxiR/1r3M8egnVcpw2ow?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f583518a-211c-4de7-e3a4-08dde091dd3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:05:24.4495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GWJjupFPyIBIKM+g1R3Re4KkBf2qPVkWTIaH1IoTB9wz4AlG9TOtS9Drc/1yDw6fHVR1u7apeazxq1nVNrttg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7858

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
(2) M7 in a separate Logical Machine that Linux could control it using
    LMM protocol
(3) M7 runs in same Logical Machine as A55, so Linux could control it
    using CPU protocol

In patch 2, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Patchset was tested with below boot images when the patchset based on next-20250526:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Patchset was tested again with rebase on next-20250623
Patchset was tested again with rebase on next-20250710

Patchset is re-based on next-20250603.

Thanks for Daniel/Frank helping review the patchset before posting out to list.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v5:
- Rebased to next-20250820 to resolve minor conflict in patch 2, as below
  if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
	  =>
  if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API ||
      dcfg->method == IMX_RPROC_SM)
- Add Kconfig denpendencies in patch 2 following 514b2262ade4 ("firmware:
  arm_scmi: Fix i.MX build dependency")
- Drop patch 4,5 which are dts changes that enable cm7 node for i.MX95, but
  there are dtbs_check error because of "linux,code" property not laned in
  tree. To avoid false alarm on this patchset, so drop the two patches.
- Link to v4: https://lore.kernel.org/r/20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com

Changes in v4:
- Move the lmm permission check code to a separate
  function(imx_rproc_sm_lmm_prepare) in patch 3.
- Check return value of scmi_imx_cpu_started in patch 3
- Rebased to next-20250710 and tested on i.MX95-19x19-EVK
- Add R-b from Frank for patch 1-4 and A-b from Krzysztof for patch 1
- Drop mu7 from patch 5, because mu7 status was already okay.
- Link to v3: https://lore.kernel.org/r/20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com

Changes in v3:
- Drop fsl,lmm-id and fsl,cpu-id for binding in patch 1
- Add lmid and cpuid in driver patch 2.
- Add i.MX95 lmid and cpuid in patch 3
- Rebased to linux-next-6-23 and tested with this new rebased version
- Add dtsi/dts patch 4,5 to give people a view on how it is used per Krzysztof
- Daniel's R-b are still kept after talk with Daniel
- Link to v2: https://lore.kernel.org/r/20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com

Changes in v2:
- Typo fix in patch 2 commit message
- Move the m7 address mapping array from patch 2 to patch 3
- Add R-b from Daniel to patch 3
- Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com

---
Peng Fan (3):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 drivers/remoteproc/Kconfig                         |   2 +
 drivers/remoteproc/imx_rproc.c                     | 148 ++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |   5 +
 4 files changed, 153 insertions(+), 3 deletions(-)
---
base-commit: c4b125bd6408789809eb57701eabb4cdc6407d75
change-id: 20250525-imx95-rproc-1-20bb74ddc8af

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

