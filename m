Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE33F330B1D;
	Fri, 31 Oct 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901757; cv=fail; b=HByL1P1SwStwhbCK7bnue8Qywvod+mFTugVWc+46JN9IZSAjnu2DD+u9krjfFHWs76KGVQNxd0bWxKTGHq0Y+871WA0H/amSTLdbuMiE9TRxhvtpo9DLHmHVSpB1z1TYVoz9gNQyG/2GcSV9DxEUzf4s23JBU/keUMg+imuSx94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901757; c=relaxed/simple;
	bh=P49jMcAhuQNOpzbP+Ee7b6odmMCnmPgHnhwU/gp7vGQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YxLC1qspxWLXJkxKRwptQB293oNDHJXaZPlcJ7uD8f09vOaJOkiGSFBg41tXKOjt50VmM4AuNX4+/cKCj3AdIDqaDsyEMQAlOF+XaC80ceDN16X0FqiWENzWcr5iOYY0/wZQ5yMY+2SOZJy8PetIxatH84DIR5MmkpsOYHC2cLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bhQZPGxa; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bhQZPGxa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX5dJIBgVTnvd+My8PUH26XtjBVjgjV1XvSxsWXZg0MuQrUq9OjhcH0tMFAvDJlgoyZH9d+eNbIStLXJsdkWOlSIXnszZ5HFZ6n5F90mI/T6pRcIXAVzaNKVN3vWY97lbMOFOwzRupdS7zYfw5kWuejPLMQHxuboBfRfbAeC30BCb2mHXM2OLIhR5rPH43LLfvo8dQNjhMbxunHS/VKnmZ8qodmKeGCXe7ytLovp+cnzvGL+ROEVsJmtzjeJrvDDpZeYP/GyEfa7d2MigESYT6ezDLlgR3GCfcsIJaBH4Cqwa049K2/NUlsOaNpesBfWk5CMw7zpNlc9aMHIWeVBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dm4LCG7ijjZwfMwGcnBduvL9vOrcgjeWIYQgJ5G24cc=;
 b=a8gswIgC0WSdJIUqhDH1DNMEaJF07aQ3LsHcGU8wUMpMn/MHUz6tStfenoNS78VNl0SBjHY6xx/QSyflTOSjzwrN6ePrZqaUBTa+Eva736LWPUNPIyFmNK03+ry3u3NTwzSueAn5VErHNfv0+aPMu0CGX0OakXSwEvjhW4kuT/KKgjV3nR9vc8vWpJxtEbXI2YgIBrc1OTeu/Z7Co3SPvplmaPHb4tngFTvxozVsZgb8k0ZPwgASlMeOooi71ajcRFZkChkFvaW6Opg/PVVbI7jlxGCwD2iZrv9AGKAWwuif2daa+COWfX+zDllnOwdtHuqBK0aUfp/DPd6Lr0EIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dm4LCG7ijjZwfMwGcnBduvL9vOrcgjeWIYQgJ5G24cc=;
 b=bhQZPGxad/bcaYynig4f0q+Y/NroaWbj70gSTgi9amNT0q6IeWemxHL/1YagP7QgEX6IyOVMAt2xsTnoD/tkJOKvYzMMNoAuBH0P7GCnvxjrhTlM6dQNazPO9+f78t3cNsa4jV9qNKqqLXAiuCU+cVrcARs1kc5aJHSc8ozf2LgQTdP5NE/K4C4GdpIzwBNZV1P617d0tOzVg+wUT4tjAUVM2I5r/uYfYCO7dKI8jQ2LYRMSKvaBIkwp6m22LbMctjSqa6CE6uSaXFOJlN4PcM0IBsU5+2JL7dKkwz4Gb8b66TtkvPbE91n2mvvz7ftGxzhwUiuDeHJ70mYwfNgeMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:13 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:32 +0800
Subject: [PATCH 03/11] remoteproc: imx_dsp_rproc: Use
 devm_pm_runtime_enable() helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-3-282f66f55804@nxp.com>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=1669;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=P49jMcAhuQNOpzbP+Ee7b6odmMCnmPgHnhwU/gp7vGQ=;
 b=TSkwrslPis+CuScOJTND08FN7gNXFpvNQ5G6MtZpodst5geSnz1p45HUS4mrPoquJgemyh6dL
 j/SZFryF9laA83tLuIOZVlO620xUY7GakMlghphFJsaFpxJZuXDlCiG
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6b282b-1d23-4715-b1ea-08de185d28d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDdXV2Z0WDZKMVM5THVYcVhzQmpPRlVqZFNyZEVWNDRaVlNtd0diVVpTc3Bz?=
 =?utf-8?B?aXRQdmc2dUdxbEVOTXUwUTZRZjBxSnZtdGdOb29CRjJDQnIwYWNVbUVaZUkz?=
 =?utf-8?B?ODNtTXdveFNZSWFTT1VMTU5aU1pWYlgxTFZXMFIvZklNcFg0ckR5T2M3aWtK?=
 =?utf-8?B?clVlS0tyQ0RxQm5tUmdGb2lwNFhxb2RtRC9kTVZZR3JjQnRJOGxRMTJ0cEg3?=
 =?utf-8?B?aEY2QW1hbW5jVm1NV0pwdWJQc3F1bEcxaVYrWGZCdWZBUE5aR1B0eHNhbzQx?=
 =?utf-8?B?WkdLNEpwcHpKQXVTTnFTdTJyRVBzRnBrMk90YmZWQkovNlhyM254K1VtalFR?=
 =?utf-8?B?WjFKSjVFbzMrVXdSRnE2Q0FtRS9KV1BGaTYwM01uYkJyUEdROXFvK2g0cTMz?=
 =?utf-8?B?TVhGU2xidi9PTm52V1RwcGFKZTlEKzZqQk52eHAzcGhFZG1SMFdnK0c3cVRa?=
 =?utf-8?B?ZXp1QlNCMVd1c3hqdVdnVWZkOWFnNkhBalo5d0YxVXhhQjh3R2dRN2N3bThK?=
 =?utf-8?B?clVCTDVWTTNDeDB6c1JySDRtS2NpVk1Rd1VFSlZMd3pRTWNrVG5LaExIeHRt?=
 =?utf-8?B?d2w2TUZXUlZ0UzlqTmtIc1g2QXpnMXAzY3VneEhMRW5xQ2w5QTViaG1ESFNX?=
 =?utf-8?B?Uzhyc0FacGpWeEl3WGhvVEJOelNCQlZGc3MvaVBDUnpURVpCSFNSY29HbnBh?=
 =?utf-8?B?a3BkYXd2QXFsb3E2dG1DRjFCSlFTVXE2bXlCN1p6OHF2QWRPY29FWXcvNnZH?=
 =?utf-8?B?OU4zMUJxTm5FVmlsTmtnS01PcEhKZGNDUHBzQWlMc2d3RGNYM0NuTjgzM3ZZ?=
 =?utf-8?B?eStSbEg3Mk9KblhEditKYXlFQkQxazByRzk1aDZEL0d6MlgvWDg2UlpldG5p?=
 =?utf-8?B?U0JlZzJzeGtWSjZlZkl6bVVLTVh6Tk5sbitmU3dmejhYd2xuMTB0c2lGNThE?=
 =?utf-8?B?Q2NZRmxTSUEwSzZMdTd1bFhSTDZWNzdGUklFbHZpekR1d3J3MTBCOURWdUFi?=
 =?utf-8?B?eC93eDlSeksycWJjQWFmQ0tHdFdVaXVMUWtzZXNEdWdtdTlteE8zNU1Xa1Mx?=
 =?utf-8?B?NGFHamtwam00RnBJTkRxMzJhUmVYVU5LdWJ3OUVnZUwxbWh3RDA0UTNnTmRE?=
 =?utf-8?B?MFg5d01NSTQ1ZTd3ZHROakZ1SW4zOVl3enZ2aXRlNjd3SGIrMXZQMzhTc05n?=
 =?utf-8?B?Qk9Bc0gvMURvSXBWaGdkMkpkUml6eHQ1Y0RxMVBDQnJtbk15NTBNdVBoRUMx?=
 =?utf-8?B?S2o3WElHTFJTcXZ2UlYxRndmNlJsN2NTSzhMN2M4OWZRK1lFUVdzaVF4ZWpC?=
 =?utf-8?B?VWk0UzloamJ5a0NMb3U5RDYvcStZeFo5OTNqOHYzNVJYZXY4RGpZaUxFSkti?=
 =?utf-8?B?a1M5MEpHemlXelR3RVMvTXNpVVZLMkxDd0Rlay81SXN6Y0g3TzZHTjZJUkIz?=
 =?utf-8?B?L0o4ZzQyeWQ2N1k4TmtyczJxR2c1NXgrdllyV3YvQ29NTGFXaGhnZWhYRDl4?=
 =?utf-8?B?L29YdVBYcDVzRWFnY240TTNuN1Z0K2RUYnVXRlVkUVViS0dFZVRlelZ1d3gv?=
 =?utf-8?B?OEN0Tkl0d2Qzbk1Wb1duTkpxdHVxMW41bWp0ZjhoTjFUQ0ZWN3Y2RXJoNmpy?=
 =?utf-8?B?Syt4MXNkNGNXUDF5QVQxblJ4UTBFZEFjKzJ2VXVWQkVpTmhIYUtoSHZXU1NK?=
 =?utf-8?B?M0w5d0kzVUdqY1ErVVZ1UVk0MG51ZDRhKzZwaTRId2FVM1pBUEZobTB0Z3h6?=
 =?utf-8?B?V1ZrWm9CT2xWT2ZndXZpQXg1Q01KWTRqcXBpT2l5SVk5WWlKZmZ5NUlkakNh?=
 =?utf-8?B?WGtaeWl0bUVvL2RielNPUjhkSTBlalg4UGRLbVRmdExhc3ZYWWE4ZWUvZmVJ?=
 =?utf-8?B?UkhJMUhxRlExUWhBR3YvZHQ0VS9OY0g1WVBOUFEzS0IrWnlUTXdtb0ZyNEpH?=
 =?utf-8?B?VktCZnFFNkNadFlsdHQxZCtCVlpwR1BoTTVGRDJ2WERxQlBDWUI2c1d1Nk82?=
 =?utf-8?B?WWVrWGd4SnBlczcxcnBTMU9lUm9BK1UrSWtjcEtWOTdSS1dQV0F4WXZvYW1Y?=
 =?utf-8?B?QlkvRndMRUM5aXgrR2hZZW41VzJRdkZVRll4dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVJGU0MzUmRPTmw0ZUJZdUk3LzY4OUhQdDFYUGVLam5MYjNpZlZEZ1JVWVpJ?=
 =?utf-8?B?NGlzMFNmVWVub3V0NmpRQ0kyeGliRVQxS1MxMFR1RC9YakVBV0V1d29vejVB?=
 =?utf-8?B?QjhBTHNNYUdJdktsS2dCOXFrQ21KTEdreW8rekdXaDB0U2tDeHEwejJNbXN0?=
 =?utf-8?B?clJCNE56UFNaTkdFKzRUOEswNmxiR2ViMVhVVkt5M3dBNFQxcWxMRDB5TFZx?=
 =?utf-8?B?Tzg3UEdYdUozRjE4cVRVci9odVlwbXhUV0wrMjVpTXphYTlSVWZxNjFsS1hO?=
 =?utf-8?B?ODNtbUhHa3c0ampGNUZWNUxHYW0wM3Y0bmJtOTZYS3lLQll3bTE4NXV0dnFE?=
 =?utf-8?B?SlNId3VIMkJISEFDTWU2WjU0ekc1TWlDTkVXTXd0dUFZYjc5ajcxNExTSUNi?=
 =?utf-8?B?NHMvVlI0azZOOHBRQWJZUTRTYVZ0RGs5ei9LRGxtNVc0c0svbGpDMXhVcGlC?=
 =?utf-8?B?VWx3MTBuUklCL2ZRWnVzWFNTVHZOZU9iRFUzcUJMV2hlVHN1Y1JONUpPU2xB?=
 =?utf-8?B?Um03STRzaGZwRFMyKzhMV0RTZWdlWkRSbGV6VVBPZ3FuOWxnbXFpTExSSG5T?=
 =?utf-8?B?UHhQeTRWNTQ2dUY5ZHB4NmE3VVVYTlFQVkFXYmtCUlhCLzBmNTFDeGVyVktH?=
 =?utf-8?B?SFRUNENoS3Z1STFRYXNCNUthV3RZWHNDQ2lxQWZsbkJpY3o1a2dOM2VwZTdZ?=
 =?utf-8?B?dmhTSGkzbXpwNkRoN2RnSUVEZHBBb1VLamJKM2l0aGJYRzZ6UE1FczAyRytn?=
 =?utf-8?B?VXBraDBhL0ZrNzBTa25nemk4S2xscW1mUDJXMEIvUW02Q2NlR1gxMllmTlNw?=
 =?utf-8?B?UjVKVzhwbWE4ckhiOXEwVDRqMnoyQi9oVUY0UEptbm12dEFoWWdudzlpbGVI?=
 =?utf-8?B?QTBmK0Rndm9ZenRlanEreGw0dkRYNjk2ZmRoM0cvYytacEZVTVdJMnp5M1ZR?=
 =?utf-8?B?d3NqNlRBR0dkbW9YN2N6U0dWNGJmU2N3U0VLdlhvNGREbjRFVlZTZ1pnME5t?=
 =?utf-8?B?a2lMamRIcklaUXpXS3J4VCtVOVBHd0pFUGZJQUtFN0g1KzY0T0JQWTlvQjVM?=
 =?utf-8?B?bG9mR3dFa3dQdmozYkN4RE1CcHd4S1puOXE2dnhMMlRqbHBrVHc2NVJ1WDJ1?=
 =?utf-8?B?WDduNUFVbmZHUzgrb1luMGpHc25DZU0zYUlWRHdDZzJPUXoxdUVwei9QT1BV?=
 =?utf-8?B?WUxSSHAwUTNPMTFRMzE5emtWbkwvc216UytqR0J1cmNKZCt4TFlwa3pWMmg4?=
 =?utf-8?B?MlovOGZXaTFjSlZ1NUtHOFVHWFZVcjM4eU5IM3Z4eUNmdkZvWE9xaTByQm53?=
 =?utf-8?B?a21Gb0lZcGNnVGpIOGZlSGtGY3NQT1dOa3BzY2o0WXpZcGtqVTd1UEFyZUJI?=
 =?utf-8?B?NG1DdENXMXVoaXNTbGRNSFd5bHhBT1ZzSG52VG13ME9OUG82SUM5M1lrcUE2?=
 =?utf-8?B?TXdxL3FqTjdLZkxoY1JBUXc4dENkRHU5b2lOdEtEUXVFKy83alc3d2FtR085?=
 =?utf-8?B?QUljK0dOOWlnUzVtak9BOGUrMVZXd3FxUjcrMks3Nm5EeFNSZGpRM0oyRUJR?=
 =?utf-8?B?QUh3WWRTcFR5Zkd1UjRYTzQvNDUwY05ocGJTcUwxS2VNV2pUaWJYNWV1TDc2?=
 =?utf-8?B?TnQxM1ZwQWFlUjVMMlRiMU45QjdwT20vYm5PZDRjN1JuUGcxUlNSTkwrSTBi?=
 =?utf-8?B?NkVZWUtOYVI1N3VleTJRb0h4RVFYbnpla2Qydkg3VzVac0xUUnNUc3ZFdFNU?=
 =?utf-8?B?d0VyaGZEZ3l5RFh1UEZwS3FPbkpoMnNXbHUycXFXcXlzVXVXK0FIZERiRkFh?=
 =?utf-8?B?cjMxcU85aVBqSmFyKytOelVFakZVa3BWbnI1cFA2ejEyRlBCUmJFYjY2dWh3?=
 =?utf-8?B?dVc2Wlo3Zk9zVFphb3RzdzJJRUpza2dqWEp6OC81dTJOTnBCdVd3Y1FRZjhI?=
 =?utf-8?B?bmFrazVkUHAwTEdjSVlPWkROZGdwbkY1K24wcyt0WDVjVmo0VTA5QjhoUUdB?=
 =?utf-8?B?TjJYVElvU1V0Yzh3KzZXZ2JrT1JxM2VYa04wOVF5cDU3SllOVEdYemZCQ1dn?=
 =?utf-8?B?TXNBNUphM0d1YjE1eGZBQ0plbUhabEIzT1Z0VHVpdlBwV0duVmJKVW1IRTVW?=
 =?utf-8?Q?C3U1DyX3BEtV5Z0N3pscu1eX9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6b282b-1d23-4715-b1ea-08de185d28d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:13.0942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pm+YRZr4ch4hFdN3nhR67SgYzgdMZdHG213lkdW+2KXOD5LFUZmPXDoBdbbL8wYpWutJ8HEyl+sAZ5QUey5PFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Replace manual pm_runtime_enable() with devm_pm_runtime_enable() to
leverage device-managed cleanup and simplify resource handling.

pm_runtime_disable_action() not only calls pm_runtime_disable(), but
also calls pm_runtime_dont_use_autosuspend(). The current driver
only calls pm_runtime_disable(). But this should be fine here to use
devm_pm_runtime_enable().

As a result, the .remove callback is no longer needed, reducing boilerplate
code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index df6a4126538d22ff6e02145edb5ac13c2d72c949..f5d0aec52c56664d6074272e276edb0c4175c9ea 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1200,17 +1200,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void imx_dsp_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct imx_dsp_rproc *priv = rproc->priv;
-
-	pm_runtime_disable(&pdev->dev);
+	return devm_pm_runtime_enable(dev);
 }
 
 /* pm runtime functions */
@@ -1361,7 +1351,6 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
 
 static struct platform_driver imx_dsp_rproc_driver = {
 	.probe = imx_dsp_rproc_probe,
-	.remove = imx_dsp_rproc_remove,
 	.driver = {
 		.name = "imx-dsp-rproc",
 		.of_match_table = imx_dsp_rproc_of_match,

-- 
2.37.1

