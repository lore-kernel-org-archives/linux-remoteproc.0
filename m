Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3572F5A03;
	Fri, 26 Sep 2025 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890037; cv=fail; b=YCi7r1pprQtw6vFVk1BXbQMOEkR0KyGhm0hjLA2BCw2xPskAHuM72Aci4wzlE959z3q0DxQFdREIr09mibqLhKeaEHVllAGksyEvF+CK4K2iSUtvyzB8CPiwExBQD8MeCDAu5yYs0nVlRlPhwvX0/d3spqc+sMQr87zpWd8tU1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890037; c=relaxed/simple;
	bh=HGRoXF5rCPTqdVyUeinAVxy9RQq1ivPMHHpYdBWKdWk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PZaLC9NcVks3tOdDS5QEai9KLuhP2Xymg6FMP0HnMeyNY337jek7R5v52KiaeHF9/2LlLNqJ/npVV+6TIAN0p0mt/nJSSfG/pksS0fjgafYIGdiWPPXbkPniLsF2eDimTv9PkJ8/97Xsr8eMoF9t2nIBr9utFj4D5mq9Tr4yF8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lxjYJHaU; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lxjYJHaU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTR2pWXz9ED7tqrQ4tbTU+0fNmyipbgGGX2hRmwV3PM9sU5mX10dVIySwx8Xc1DyL4X7QXNvMeoKTSD2XVMqfDJsBae/Cy3n0q5ntH6pHNYLViIZe/lz+IQ73iVv/kL3nz40ILek3dIyettr1eoxdaJdg/dGNcY1uuBGUoiqV5T1CxwTHuthlGWUxXYFAFj4ZP5H9jGZ+HzprqUFGj2WIDkYumAxOY/qNgR/C9s7KKsxqXClevQHJ5jBEVt3Fo7jFdn5C6ptS1qpzP+S+4bgHP9atN8c8QZJbK/Fp5X4X/OrSMdEIUkJ0zXRZmPrwO+KkSQEfJBkWcp6crNFGX8LuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9p6nRFQGuwCDYaeQstZN0roNkaUzL8JRDVtY3HKgRA=;
 b=cruIxDkGUqitNUDRsOpBBgq8t3OsTqXsmnNvhWmL6qLzFNN+B8QpIW3yUi6AG6xvyEXFSTbKupsRHa+gM4iu7TbZybsgWEpw2lVC049M4zEuS5LRl+oGZjyFF6A60CqAYTsTGBrLBwcl4c4R6z5qNI8JNkw1r1ISbck0eduEo9I530/lD3HTz1ifqgl12lWjEz/5yaKEDkXbKcgMb7b3YJhTvaoG5jqNHJ3sfyT5/oTB+2Bd5hVvgj6k0brpULEo30tNGg9XJZzvqQWeo5aQ1FSEjjhX44XL//DF25D7+DOrEKfb9JfytKq3mwetUiImqRSHAo71S2dqBLh7hY+p5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9p6nRFQGuwCDYaeQstZN0roNkaUzL8JRDVtY3HKgRA=;
 b=lxjYJHaUKsvTLv+6wD/xF/cVGmKxIWWslfDmPwhR3itmo+zHZJG3pfPDIfwIRsWiiDJQYtlX/lWYdIkmKxjjQOHGLZfjtp2IZz+VumHr9Rpdcw7K8lfxQbCJYzNQNABS4dR3AtZrbPGwjfF0OvU4s7Qv/GGsH+diA9qWU6Tc4Tl/U+fnGGCpmkCLVc7pLW+doUv65l+AYQMeukNBdJO2v6pYxurJ4uuw5cw67ikCcomsbQ0u8ySyrDeH0/F2ulkRDkW1OqZihewFeRqkdqvy+nbhtv3eH41GiEoboclDIIEjEa8H4anhGPYyHTqzgCdfGYnZmNP9/dA1PvdYGcNZ6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 12:33:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:33:52 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 26 Sep 2025 20:33:17 +0800
Subject: [PATCH v3 3/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for mailbox cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-imx_rproc_v3-v3-3-4c0ec279cc5f@nxp.com>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758890010; l=2739;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=HGRoXF5rCPTqdVyUeinAVxy9RQq1ivPMHHpYdBWKdWk=;
 b=2SnB8qT5ctt+Cve86v9MYl1ilmw5ClivcKCyLb6xf1f+I0opq8Bpw81ie9bs9o25xmzwIBqxe
 BMS8jvfdFuxCIgYZ38/CskiU3D5HIt2TGfUlmhVz8OrxN5MTxwy4OXQ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: d45ae1b4-66ca-4215-c246-08ddfcf8f342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGJIK09qcDdmaHhrWkx4QkpLa0dKS3NPUWFhNVh2L2srcjIycWp2VCtYZHhm?=
 =?utf-8?B?d0d4dVJuZkp4VXVwYlVzOHRqN0tYeld4cUtNYzV0ODZhVG85cDRmTmp0Yldr?=
 =?utf-8?B?czdwSyt5Qi9XKzFlcXVVMHF3K0V2U29Wc3BNZkQzNGlYUEtuZi9LaGtNZXZB?=
 =?utf-8?B?aUhkN09hdFBPQk01cG5UVHJib0taN1h4Y2JtOXRxbWJ4UGxNS1BJeVVHZVRY?=
 =?utf-8?B?Z0tOVFprejVmNXZNMytobW54VHA1YUEwamMwRjR5dmw1c1JJbXJjbGRCYjY3?=
 =?utf-8?B?WEJ4elhPdi9VMWZ0ZGpyWWs5dmV5V2ZvQnlqRGpucVI1aEN2ME1icXVLSlV4?=
 =?utf-8?B?TFlxREx3TFloalRXVHI0NDFUdHQ3dm5xU2picmxIUGpRdkVhYXFVZElZQ2Vh?=
 =?utf-8?B?TVZmUnNrRkV4cHpQaWM4cWpOcXpSQm1seGNETklhc3JOVlBnRXIreWgxSFRZ?=
 =?utf-8?B?QnQ2QklEUTZFb293RkszSGRtK1EwSHVpQTFFT3dDcFRhQVJvTEJkVmszQzh5?=
 =?utf-8?B?YTQ0cFZpdmRNSnpVUXdHTzlmRjl3eVRvelNEMzBLbEk2TW9RUFZnT2RGVFc1?=
 =?utf-8?B?eFBKT2ZSSHdqL2VyRURXQ01WZC9MUmpXN3FPVzdabEk0N0Z0QzZqZU4zUHdH?=
 =?utf-8?B?V1lvZVhENHE5cWxUcU1BSWZKWXMrOG1TK0RKaWF4NXByWnE3TzV5WlJBUUVQ?=
 =?utf-8?B?cVZRRlJlSUJrcjNTK0dzeWY0TjhLL1Y5R0xVa25FZjNLaDZndFpjdDl1SS9J?=
 =?utf-8?B?UktNZUxtS3I0bmZTaXRlVjNxTlVOcDFZTFN4cE4wczFYUHl4VzdNeXZXWXp2?=
 =?utf-8?B?WUE1eXUwWnowdlZhYSs5dmdnNWJpOVY5QzlqR3dINUdMMnJZMXdtZjRtclhD?=
 =?utf-8?B?WjczYWpHQkY2YkJLUFduOUt4dndsR0V1VHpvS3hkN3NiLyt1cE1uR09UUXR3?=
 =?utf-8?B?NWFPQUlaeVZSWFQ2ZzFJQmJYRFNHR2ZkWU1aNnFacmJJbHJrOVdRUEs3TjlK?=
 =?utf-8?B?SndPWjNsYWxkbUJlWmxiWFRCSjlUK0ZGTmhYTWo0SisrbUl6aWVKNlRxbGs2?=
 =?utf-8?B?bWlkWXg3VkNtc1Iyd0o1c0FwWkdYV2JObXByV1dlVXlDWXlMajBuZHQyUTNN?=
 =?utf-8?B?SVNMbGY4VVFZOHVObG5nNGdya3JKYXNRQ0p2TjFrZHl3T2Rxd3pKMENDc2VH?=
 =?utf-8?B?emxmN3JYUHFqbzhWcU5reC9wdmtvNFRNb0xXb2dpdHpYK3JRcVZRQmNFcDN1?=
 =?utf-8?B?Tlp5cklmZXl4UFVYUnA5anQ0TS9jQXF6NGtaM2NTaVgxVlhOdDgxMUFmZkVV?=
 =?utf-8?B?NjErZ2xGOGpsa1ZISHZ3RW0xcFVyTlFrenVaeWFxUzdaWkdUS3M2bFNrKzc0?=
 =?utf-8?B?TFBzNVg1cEVhZXdZWEt0ekFDanVzTDc1cS8reUxsODJLVkRQaEZ6RG9Xbm5T?=
 =?utf-8?B?aUlWUTJJVWhPZXJ5dVhoRXBLdG5pdWZaSW9sVjRDTHIwTDNCeUtuVW5pVlZp?=
 =?utf-8?B?dU5XUzRTOGFjVTd2eStCdnVuWVdVZlZDWXdVd1JINFFEci8vYitveHNNSmZy?=
 =?utf-8?B?ZFhtSDYrVXBFTEZIdXZhWHIvT0xkVm5nWFBwcDRyWEtTSm1aYUovSG55bXlU?=
 =?utf-8?B?QkJkbitBRmFtWGY3WUpVUnpHdFlQYS84eW9PQTVHRWJwWWUyY2dpNTZzSDEw?=
 =?utf-8?B?UHRsU1JHREE3b2UzYWM4V3JwYXcyVmxZS1lzeGRtMjh4THRJb1VxaWNFdS83?=
 =?utf-8?B?Ym81N0JDeWxCTWNQVzVncW5nTkNEelNpek9NV2dxWGM4WDRWQWxjbjBnL2Ns?=
 =?utf-8?B?Yk90cVVWTGZxM25LM29kY01UU3ZXR2t4SWpHOXdGWjJXV21NcWNQWHJGaE5s?=
 =?utf-8?B?Wm9hSFBWSktHczhoSDRsMU82dm9iWXMyS2UwTVNtQWd2R1lVaUxCRml0aVJq?=
 =?utf-8?B?WUNnaTZGRDMxTlA1ZkVqV3ZRKzE0ZVRCSTcrZlBZbWQ2UEYyaEVOM0NMb05D?=
 =?utf-8?B?bmg1VzVtOGx5WXJUdGduQXMvN1dYZzFXYzdMOFJlVHkwZEtiYkdiWmc5Q2Q5?=
 =?utf-8?B?TFFyM0ovVml5ejNaQzRNS01PM0VNdUJ2OXZWZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3YwWFcyc21udk1SSWtJd1NOdmRNUGdVcnNlYXVvMVZhcE0rYVR5NUdqbUph?=
 =?utf-8?B?YzhYUWRFdDQrRnNnMHBFaWh0L1lweVpkdy9MVTJILzF3dlVnd3dHdHZ6THF6?=
 =?utf-8?B?UFByZFZ5dlgwSGc4dmF4eVA4cmNjbUlWT3c5eXF3Q21TU3gzKzF0bW81ZHg1?=
 =?utf-8?B?ck95THNQRVBZTkVFSlhpNCtmaGRGa3RFYm1WVlBBTysvZG1GZGhRbXJtL1FQ?=
 =?utf-8?B?b0VzSUYxenRld0k5UG5xa1FmbmNpcmxKQWIzc0FTcmVYWnhwTzJoNVNwVVpv?=
 =?utf-8?B?TWRhbFQvMTNUTm1xNmUvZVVnMWFiQk9sUmp0cGpvbXdCN3AwQWVFRlVjTWlB?=
 =?utf-8?B?M0tHZ2hhWjJWVXBjcEpGM1JQckZZMTZ2YmwrZlczRFp5RHF6bmZLL3FkaHF0?=
 =?utf-8?B?VUFYRUl3WGx4SkN5elJQWisxT0xrbEZrVkZjRXhtWFQxRjBvYWRuMitubGtq?=
 =?utf-8?B?S2FLd1VXSHlZdElHcjVJa3U3VStWaHNjdUhsVFFNemFhQ3poYTdxZmlTbWFZ?=
 =?utf-8?B?TTUyWm9yR216UE1aeW5KS0pFVG5QT1llZklaV3h2Vkk2YzhUWlNGM2lQNjBL?=
 =?utf-8?B?cEV5Z1ZTZlhQVm5yNTZxajREYmp3MnlmdS92MVRVT2U0SnR3c3VhT3hpbXFE?=
 =?utf-8?B?bS9JWVlINVJDdWdpaVBGcGJZS2s0UWdIVHpDcVJLK0drajRSVGF5Ty94c0pK?=
 =?utf-8?B?dUlGM3BIMWhaNmNHSGkrcW96UHEvc0dFbmZxN2RyVHpXaFE4dTFYYk9ZbjlP?=
 =?utf-8?B?MGxkYVJjY2lzcVZiZ0xQZkJhenJwRVcwRXkyZ2ZJbzN6aDVscEdUTmxYL2t0?=
 =?utf-8?B?b1U3bkdMbjRkZ2lZckxueU1LV1p6YWd3eEdITThuMzRmbUlrQ00vN3ZBS294?=
 =?utf-8?B?VVdZemZVRUNndGR5RmRHQ1hiMEVQc1dPSDMxandwQUtVZm1OQ3Q4RkJkV1cw?=
 =?utf-8?B?VXR2UHRzWWpWeEZrTVdaRkpMakZIQVFjYjBnUmJGdEJzeHQ0eXpRd2hMemtD?=
 =?utf-8?B?djNWRkFrYTNxeUhONFh4Yzc1VVJ1RUwrYUVUaHI2cXFUakd1TWVVZDJWTkxk?=
 =?utf-8?B?bVRGS00wbzlWUTk2Smg4d2pRWWU5R1FxVmNxc2w0T3FwZUUyU0tMQktucHpS?=
 =?utf-8?B?WEN4Tk5aci9mZ2FLVERjaGR5cG9QcmlyWVlwdVlKUVQrZzhieTJudWUxclJL?=
 =?utf-8?B?Z3cxd3krWEIzdWUva0ZrZHBybTRmejJoOHdVc0VZN1NoRTRoTHY4K3NnenBZ?=
 =?utf-8?B?OWpYcUFIZllJWXhCZ0I4Z2NuUjl1N3p2RVJNVUJ0YXNlRVpxNnp3RU00TUxS?=
 =?utf-8?B?U0dYeVpVT1drNEhGRTArQmF6UkFadGk4cUk0by9mNmdaUjlaZGhzTDZZVXUy?=
 =?utf-8?B?R1V3NkhadTN0Ym5PazNrUlU2WndQV05pOUVzSkk4TmhnL0cybkhCMDlWNi9K?=
 =?utf-8?B?dnh6b1BxcFZvWm90TEsybWdKSUMvamswZUE3ZldVdGlpWmxhdS8wSCtWc1R0?=
 =?utf-8?B?OFpRSlJIL0l5NitRaFB2cloxZ2xRSGdiWjRJaVE0YVF6czhkVTNGRVZ1c1hm?=
 =?utf-8?B?S3BPUis1dTFldHJ0SWptekl6YksycWdEMW1TM21UT3NaVEx6cVcySitkNTky?=
 =?utf-8?B?T1hvKzQvL2ZFZmwxQjFJVHJIeXhpOEhVWnFVdWJoenVwbGNWd2lBbmVIYi9O?=
 =?utf-8?B?bnY2Rk5xMVdHdnRWMmJ6eGNsZkhBVjJ6WTY5UHNGT0kwYks1ZDk2ODdGczNY?=
 =?utf-8?B?elAvZExVVVgzUFBhTS9nY0tVQURjcXpZM0czMEVrOG9wVGdOSzA5aVczK1VP?=
 =?utf-8?B?eFZ2MENDWW9Nbnh2dzJOZnVzNTVMemI2Q2dDSE5BRHpuTElvSWszaXBjU3pv?=
 =?utf-8?B?YXFtczl4eCtsQS9oUEM0cmc3R0FTSEsza3hGUjNZK2YzNXFCWldUWEoybmVT?=
 =?utf-8?B?M1FWWm9zK3dQUlJOMzdERG1WWFdHblB2OGtray9pMXB1OGR2QXpGMURLVXIz?=
 =?utf-8?B?cDhwczhnVlZlOVY0NjJsMXEwTXkwckZlbTRrVVhqalVlcUZRU1RsZEh2RzRH?=
 =?utf-8?B?TXBQVUlUMnFrRm54MjdRUTM5RWY2bVBySm45YWJyOW5mbEpxeHhSc2o1RXVH?=
 =?utf-8?Q?wz2VJ2PPdYt2QN2LLZnG9AoZc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45ae1b4-66ca-4215-c246-08ddfcf8f342
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:33:52.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6Ahdth0glS1ssoe+RQK0qUDbre5ETGDfMQP68yBklJ3KFpfe1PDWOX7j8ldiBztRZaHhQGaSPuojovK+i1a6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

Convert imx_rproc_free_mbox() to a devm-managed cleanup action using
devm_add_action_or_reset(). Ensure the mailbox resources are freed
automatically with the device lifecycle, simplify error handling and
removing the need for manual cleanup in probe and remove paths.

Also improve error reporting by using dev_err_probe() for consistency and
clarity.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9c44ce56f1ab044ca5dccfeb0aaa0f7cd810aab1..3260fd55a713994e1d39cdf677265edd4192ae45 100644
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
@@ -1094,15 +1095,18 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -1161,8 +1165,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 err_put_scu:
 	imx_rproc_put_scu(rproc);
-err_put_mbox:
-	imx_rproc_free_mbox(rproc);
 
 	return ret;
 }
@@ -1179,7 +1181,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
-	imx_rproc_free_mbox(rproc);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

