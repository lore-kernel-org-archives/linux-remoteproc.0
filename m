Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374B42FD1B6;
	Wed, 19 Nov 2025 04:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526151; cv=fail; b=sp2sioQn1ZsdGUgXC60kQur8zD154LTkJAryI2j3RkamGDvEngsOkZIllfAQZqNI+qGLBinCfdpyhVHJc2o7hCPrcJzyYvk6/caoQdNPRF7LfFn6hDtSzkZkoo9qzyXAicXGpGrBF2AG5X2PBXJnn4M7AouSmTWhgOvU6aAuN14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526151; c=relaxed/simple;
	bh=mPGPxJqPqmmLuzMzEFe0Wl9LgE09XDIAW1ygFEeDodQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IUvTwkbWyVN15ZNrGZ/luWgkPgU0H+MkhdpDsRbjwO0wdEwmqwCUROyZa6DsdgLDXB1AnePig88qQOzXIZD26fb2ns/16MIGMcvfzqJoP5sg7qZ/s7lsd20y/EojjuGiNQEDQQDVaKhotMoXgWzzA934YtbCGrpmUm6Hl9yCnT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bqf2IHMn; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bqf2IHMn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml7o3yw+sCIM6JPO7Fq/V416U7PTsWkHVhWVo81kqwfJkjR9oCw4TUweHJ4g02kw8qasM6VRHEnUcaWP7Hryis9uBu671xcCs1qFi2VU+N+6QclGo/LBzzOROJMsU4gxoIKF41jrPxZWP0+j9ln5VdlPta29SS4Vevb5qoARGWUP0Wa5/qia5RR55qhGJaYnAd/rbC0XarOSjgijbkWQRz7ay2Y96qfAyjWf27ZfGb3HuYxAQLUBmqOICSpbLVrIJvBZ7XzW57zF528QdacG2mgSArhCIKNoGWw1SEXaraQmpO5U+6QnXjAeDZXjhv8keNFgBZGZ+ShuYbdt3xlUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAt33bTwiNEMaYQqQD10RAl6/XaD904OgUxTZkUw1zE=;
 b=voAEEswx33ym/00iA/YDrQ/3WzRQ/hF9NPNS7r+WVsGTrzqZ1P+rb3x4MeLHjZisYM6W4EEbnmGnsbi67s/XYcATiSzRLDxvmm6RV3cQxA6jqcA6xG7JhW+02Sh4pm1yCGywV0lakyys+ZWzLIBmRgSMX16SMnH+zqF7uZN6cwZd8ePUDd6QBqYX5JLK39G6kLCwD8doUwd8nzw2fPm448uGjgDVWDT3ki/JQNmJxcRxuRrvyRgclpC7IngyaUxIAb8nxQZuuCxIMTgz3V6rfbKHy22NUASmxpFVneIdrQWto8RdAUPROF3kxeKlG8Y/VcEki268xbZijSPv4ou/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAt33bTwiNEMaYQqQD10RAl6/XaD904OgUxTZkUw1zE=;
 b=bqf2IHMn7JvqFVhx5zRVqUCgg2SVc9Tt2t4ozyVIG4Uk0HYIWJm6XY/VhCRHQkaTYgih2MZrQvOOn7oq2nUU5dG6CxLAA+Y9LlCiGVR+0ckkT3Ybn8VVojl6acaUwHRuEuk8Bp9lHWioFdmKRcMGOWpjK43gkLLd8/sUYHbWnzNs7jv7xjxlULYv5x7pjvWnjJIvRcvRgH1RIqKfRaiGyLsc8EsFUUWooPuly3JoKwLJbMpp7goOdTuPZ/O3UQcTcUHFdE2JZ20Fr3LlJyQo9SksXCcCuo6oTWL6JCmVcZ8nLGPWvF07fXnpVEvBDSzf7lgWg0o2cTCywVsGaEws7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:50 +0800
Subject: [PATCH v4 05/12] remoteproc: imx_dsp_rproc: Drop extra space
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-5-adafd342d07b@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c0f1c1c3-a05e-42ac-cf84-08de27233e6b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjRmYUJUODN6djRWbG1icWtleHBWRGZlT1V1bmZVSVZFNlJrWXdkUzE3ZjJn?=
 =?utf-8?B?NGRWSXpHQW5xOWk2NTVFMkNEYVNrMVlTYU1wNTRNc3Z4ejgwK3Y5TlM3NDhy?=
 =?utf-8?B?aVh5amRNeU1VUm54Yk5TRGw1ZXdjOFVabjR3WXk1cWNYS3UrZHFXMGV4K1Rh?=
 =?utf-8?B?ZDZnQjExWTYxam9idG5DS1ptNzhHRmJVbmx2RGNDamZvaFNGZG9hMTZLZTdY?=
 =?utf-8?B?bXpROXlqdmdaNWh1L29iYTdIVVltMTFYUDhzUzRCOTJWUDVaenhqbDg1ZjZk?=
 =?utf-8?B?enhBbEJ5ZzJJN2N5V3h2RTBVcVY2WUszRHFjbmNEQmtLeUZ6bXBLTmVkL1cw?=
 =?utf-8?B?UjhsNWJmVWNVeUl3bHJtSVorL2ZYWmRxS0NwYUs5SFFla3FBUHY2eTBDNm1P?=
 =?utf-8?B?eTNXRGJNOXVsaXhGbEhON29wRGNYRmdiZ0UwUGRReXZ3a2F1eFgvaTkwWTlW?=
 =?utf-8?B?TTd5M1NtTmJENExkRkszOEREL2g1cEZGeUNHbll0aHBoVzhEb2JZODRsRGlQ?=
 =?utf-8?B?bVFJdUlOSVlLRm5DaWErLzgvK3QyOHBoTFVSTnNESEZLR29uVE9seXRoemhp?=
 =?utf-8?B?REZGOHAyUjQ4SVRxeXB2K29kNkxJREdCdXBjUHdTbmcyUGNMc1hEcHdyZzgz?=
 =?utf-8?B?Skw3ejFKSEc2YTU4SEs1TUM2alEwL1Vpd1ZGc3o4ZmFhYW43NTN5OVdhR1dj?=
 =?utf-8?B?NElIYUVJY0RXd2tFSW9Vdy92cjZSVzJKWHV6RWNuOXBrVG4zNHp6V0RmcHRu?=
 =?utf-8?B?QXNXSDY5MkpmbWhOalNOVXNSSk43VDgvOUVWbkVFMFUxdWM4UzFuME14dGV4?=
 =?utf-8?B?OWFJY2FYWDVzcGZxQ05DQ21yQVFENHAzVHJHd3JLOXBoY0pxRytpNFRQMHhi?=
 =?utf-8?B?dXNleTF5WVZnZ05ycEMwV21FbHBhdm9DOSs2NW9iWFpTamlPNzdPUVp4OG12?=
 =?utf-8?B?STJiTHFCaEgvNFk4SFpOcWxZR2h3YUF1bWZqSVk1N09BOFZ1U1d6S1RRdzhQ?=
 =?utf-8?B?YWtWR3FPc3U3Z1c5L1NGVzJ4OStoemY5bmY5R2JIQUVjWWlaQm8zTDlNeHFG?=
 =?utf-8?B?MkJJQ3M5aDd2dWhvWmdyUnlvY0NJUDVDUHY4V0ZEcDZFMW5DZWNETUZoaDVQ?=
 =?utf-8?B?WC9ucWRWRFBta2JWODZpMmxhZnVpYUl6dG1FTUdaa3Juamx5cjNYMCt1eHVx?=
 =?utf-8?B?REZDS1VWVVJzNlBBVFN5dlBOcjdYZGIxUUxCbm1FTUVNNVdFUjYzQlI4VGJj?=
 =?utf-8?B?cmVxM1VkVXAyYVYwQzlBRExTNnlSSEtFSzNTd0F4czYwTTU2V1NJYkdMNkhy?=
 =?utf-8?B?UFZ2OVNOdUhmNzBZa3dYNWFtTjB4bmxFVFRoSmRhRGZ4M0NDTThMYVBKOXFZ?=
 =?utf-8?B?WGxXT2g1YkY5QjVpVC9JNUF4cG5LR0JXREVRWEc1S1oxcHZGYUZwZHJJUFBu?=
 =?utf-8?B?VXVUNlJOQ2VDY05IS0hkYmhreUNPbEFnellEL1hzNVlPWHZweUlKZU9jYkdM?=
 =?utf-8?B?Szh2cldWeUh0N2lHY3lNZGxSeHZ6RTlFVXd5N1k0S0FrSjJEb0dUbEtFaFcw?=
 =?utf-8?B?dEFNUXlGWVU3VnlrMVBEcWhmbGFqR20yTzdiQXlITm1zUFpFbW04TTQwTnN0?=
 =?utf-8?B?eEJaQ1hDM0VVOXdCODRicE4zS1ZycUtocVV2bkUvRWVRcU1MK1Y1NTNpZ2VI?=
 =?utf-8?B?NS9kVDB5c2ErZ3REYmh6bDBIV2FUb1FpZysrbk9jOGh1bkI4QTR2SmFRY1Ar?=
 =?utf-8?B?eG5yT2oyZnBZdU9RQ01qNmE5eTM4TDQzSWpzVzYyVjZzTUU1WWMvUjc0NnBG?=
 =?utf-8?B?TXNRWmlYVG9xejk2aFEyMEtFNGFOeGl5VjdpYWhSQVIydWpCdCt5dUFuOU9s?=
 =?utf-8?B?dG8rVitISjBYTWhwRUdyQmx5cnR3NG5iY1BxVWdsMWdnYVFqMDkwTUNwZmF0?=
 =?utf-8?B?REFDeVZhZXpwdDVJYVZoOGlmOGs0cW96NE9WTmt0ek4zWHVsRmJranAzQUVh?=
 =?utf-8?B?STgxaU1qdE9TZldqQkJpVjczWU4rWTl1OWRRL1ZNZmpXYlBTbWJhMS9SYmRS?=
 =?utf-8?B?aFRaRUlzUDhCSXE3ODJQWUw5ZFdDdVF4K3lIQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHo2WDdBMk5Lc0FKMWowTzlselJQbE5JcE9BME1GSHhTTW5ZMWNUZGtvemR2?=
 =?utf-8?B?YldqRjVpRWVwSzRZNDdMNTB3djAyNnpySndkanlzMm5kQ1lZbysxLzdPVWMx?=
 =?utf-8?B?UlhSbUpuNjZyWEd2UTMra3pQTmxVQlJRclBPaEZWU3NKblZpTUp0SXFUUXBF?=
 =?utf-8?B?OVR3cUM0S05HS3BLbVIySVd5bFVKd3Y1WFc0V0dyTHpkNERCNXlzbW1VaFJp?=
 =?utf-8?B?UnRLR2FhU2ZLd3VUUEQ1U1NkSnI5TmRNYWFTZmdIQllhSUIwMGFjV0dIYlpP?=
 =?utf-8?B?ZFA0YkhMbE1BVEJRM2g0WmdVenhRM203RFF2cFhabDRZa0hObTdndU1qcWJC?=
 =?utf-8?B?ZWpsK2hFRHIwU2tOUnFRWm5uUHZtV012Tis0WkowbjcyRW5QL0ROcFFIaVBZ?=
 =?utf-8?B?YTBYM3IxdEgrSkNRSkM0M3IwN0RueXlmUlU0UUw5SjFFb1NoWmw4K3AvZTJ2?=
 =?utf-8?B?WDBuVThIY0lJVW9ZTWljYXB6clBjSW5YRDJMTUlVRjRjSmlWd2J6STd2RE9T?=
 =?utf-8?B?ZC8rem1kOTJCdEdscWovRXFPanlkV2Z6bldUV1ZRa3kxcktTcEcvc0VQY3FE?=
 =?utf-8?B?Wjl4VzZPcEFmNEJRWWszRW84Mm5ITXc5NklEa0YxMkNjUnZJb2pIYVBEb2NN?=
 =?utf-8?B?K3ZpMjh3bk5WQWtyd0QwNVlpVnhnTVJ4S1BHSU04dEl6Z2hJYzAzYW9uUHJR?=
 =?utf-8?B?cnpUenlvbmZZbVRTTDVYU2JoMFVuNGlXVHpNaEs1TWtIakY0Z3gyTGluVGhE?=
 =?utf-8?B?ZGtDRHRVNG12T1NDVjEvaGd0TjhnZEprczVNRDdNb0M1YTlVdmZDWENpQUhh?=
 =?utf-8?B?d0FYQ25hbzhpRE1zWEtEVXRVd2NRazRacXdYVzRDOGcvdUxCUjdjS1ByZUp3?=
 =?utf-8?B?N3NUU2hZMUxNdGhaN3VLYVNRZVVmd0l6SG40d09jMDdTNzFyRjFEOFJZRHBy?=
 =?utf-8?B?eUZiZUVQaW50bnlaWWQ0Vm5ONGFmYUNJWXJvdlJOTmx2SktmVEw0ZEpQNzkw?=
 =?utf-8?B?RzNhd3gvZnU3NlMvR0FGQWNmcXVSTWhManE5dmxjR1RoSzVUd1F5NkpwTG9u?=
 =?utf-8?B?ZzNRK1BLNHRYTnk1Q0JvcDlHUUJwMlBwbys2bllIOTFaYkI2Z1Q4Z3oxL3Jy?=
 =?utf-8?B?N2swNGU5U2w3MU5EWE5hOWd0RTNOankvZkMwdGx0YWJaRWhpVXR0bDVMV1R1?=
 =?utf-8?B?RkRXK1czcDh3OC9RSlZISmVQTFBCTXZ1MmhoSXl1bGJKVExyUEVYUmlSNTIw?=
 =?utf-8?B?TXk2U1Q3ZG0rNmp6YWhQVkppdXcwVW5mYnhsY2FqNnF3RDlUSzN0YnYrY0NE?=
 =?utf-8?B?SEdUcnU2OUcyRUZBYkNTbHFCQXllS1dETlU2NWk2UTdqRjJVbUU4V013SzNa?=
 =?utf-8?B?Rmd6dnQwcm9iaUVFaFBzYVlncHFFMU9QczgyMFU5eTl1aHR1R3NrYTU3YVpt?=
 =?utf-8?B?dDFGRjljMHNvODB0WWx6REZubDhTaVVhSXFUallRWGdvMlpNZnFBSUNucDRO?=
 =?utf-8?B?azRIb0lwUWhISVMzK3ZreTRHZElRdzJpaWJEZXhRUloxM1loSUhJOWNUK1dR?=
 =?utf-8?B?NlRRY2FpTm1uQUkrV2czd3lKL1crdlN2dk8waHArL1l3cEF3QTZHREZxT2VS?=
 =?utf-8?B?bm5acWRMSy9ZTlpQV1NGeWVoTlhHMC8xVysvS0tJaHlMQjl6eXFiNjZScmlW?=
 =?utf-8?B?eGtxa2JCWHpLWjRCSWVBMWpucDNDeDEvb2hpRWo1WjBWM0dsTlVKcWlxTzFG?=
 =?utf-8?B?dGM3TC9hTUhTcHVQYnZXRUFnNE1nOWVzM3JFd05sTURYZnRPdVkxUFk4SlJM?=
 =?utf-8?B?WWJHTHp5aEd4bzQ1ZkdRcTQ1bEw0TW9kMlFQNWppTlQ3UkdPdnFackV4SG90?=
 =?utf-8?B?SGJsUTQyazBZRkRHODhRNGkrL2VDdjNYNHdic3hrR3ViaDZpUXNMa0dyTVcw?=
 =?utf-8?B?a1pUczh6OS8yNXZJZ3NnVFZ4ckRyZFUrTTJ2WmlxUnF5c1I3V1pIL2xVcnpq?=
 =?utf-8?B?eFdQWlNlemRrYmpQMUtvM08zNWwwM0Z1Yjl4YmtDOGFzcFpTMEhaZ3Z2Rkdq?=
 =?utf-8?B?K1IrclUvQ0J0ZzY4b0NIMnQ5QlBkcVBwZitwKy91Ny84cmVyYS9PMkxubWRV?=
 =?utf-8?Q?tJ8xu4D/d3J9EFBhYqXihj8l8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f1c1c3-a05e-42ac-cf84-08de27233e6b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:25.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4nc53OBPsAnjv9nn+puv+7EVhdp6w6GUW+9otOvUU8tJlZfvgmDhwjvoE2CUIIU5PXtYmUH30sRl0v3OmwEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

From: Peng Fan <peng.fan@nxp.com>

Drop extra space between return and zero.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 87f4a026c05fbf1c9371058290b2d33cb94b9e54..1726aaa1eafb9ac1a913e3e2caea73801b86dc09 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -784,7 +784,7 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 
 	pm_runtime_get_sync(dev);
 
-	return  0;
+	return 0;
 }
 
 /* Unprepare function for rproc_ops */
@@ -792,7 +792,7 @@ static int imx_dsp_rproc_unprepare(struct rproc *rproc)
 {
 	pm_runtime_put_sync(rproc->dev.parent);
 
-	return  0;
+	return 0;
 }
 
 /* Kick function for rproc_ops */

-- 
2.37.1

