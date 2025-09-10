Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013030.outbound.protection.outlook.com [52.101.83.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC92308F1D;
	Wed, 10 Sep 2025 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488347; cv=fail; b=rh3ewRt2fHc+qHD0Pb+IA7qQi+20TSGzGcOJW+fExdtYvatmxFAu9NjaLsEnsFQHD2ejawoIaLj+A7MkLWDEFkHXp3nw+uEayOdU0c5kVg6TdMLwV8aks78FpD+TKZEMGQzF6RHsSH5D9Cs0xTG+ZCIC8PQQDRGZAP/hfEPSPkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488347; c=relaxed/simple;
	bh=ZZkSOnmk3tkhr68K9EUIuk1PiLOpl8Ut2xwhvhA5l30=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RSTNyeYGfDVPGv7Af3JHIVTo8/R8wW3ZL40HuQXriaWolrv2LCbORxRgrxJC9IgaxT6LMecZvod91w3n4Em+j+yvjye2e4WJ23Fyr1TNZBPJoJZgP+0oCNKBQ25mbzFOe7bgCwGpzYZgjp4VNcNitP7Bop27SfqM2C7I3zqjrJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fKFO+yy0; arc=fail smtp.client-ip=52.101.83.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fKFO+yy0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/YaiU5B95JiHgIHauxZM3AGmndNqrSyxv1PIqwBhWkfVQ/jy2s6xWD3QxXwgBsO1cCO8x0bblm37Z5BuJf01NDKnbT7vm76vERPYiCC4sdARoH0REQOxBnwBufP3PrtGpz9yEssGLDN9Py2amtcRV5hiW0sLlrn+kgIsDDvNeQrAWJai/7AQ/ppJrLRA3nNraRnzB5Bej8uZqlAJ197MqQNYJt4O1ttKRTEGN198EPj8vglbtbKeYtjkfyRJBytU16629KiaKL1PmIoI3SWxfdqnQo7uv7VsnucN0x0uTl0Rkn70fRcQC3XTeB2taF7knci7UYdwT9Ty1m5Is0XQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLcWBc4+6MD1GzxISs5yZQ1dluEnfoc+UbEZRWjocto=;
 b=ZhXGlKPUWMKsn8cz2i09Oe6m5K+guZfy45SsdAd9SFdCDwlJhE+GlV1VPbn32CU6lAZCGP8qSuGAKRwT2j9PkRN3RHMpsZrBMVMb7atITioxA/pr1i/m2Uyd8vDDWyskFdkDyMOFHKHeKMUGUqMsXL8MfAUKOPIRb/jJ2bahxkDeMtyHIQ20125cl0+l12CXLrWUhpceXZx1xLCyAodza8tqZGsLZLMkLTnRn3+2tNE6Oz8O769B58ztU0dKddScsrerLU2TJh0V0gohGLdqzuHGPiR6eGRxi7pH7+GWJuf8JIRNjrHhxz9a/u82yws53SB4Oet9upeyiL0IB3mT1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLcWBc4+6MD1GzxISs5yZQ1dluEnfoc+UbEZRWjocto=;
 b=fKFO+yy0/nOSyTld1i0OvVZf7d9+60LEFx3oqSPuDi+S64/bA7o5GZG9BNLkGWjWPpxy2eXI2QQ0pJSzhuJytzw3VxdCipM8cm+JzHHYCgzdxqkXpFTpg7E+nbWTi4nIJCp/DmfB5pYxuQGMDF0HxJe9smAPQOW7c91UDMCPTRkGmyeYOuuB9utXQceUY146w2iN96J+LD1e1k6KlP43ncsJ7TQ66zGTH3/Qva3DUOCtDosxQKHad/6W2ddyaD6to2P87Yyly8ugx+u3/UhyprpPQhoAD5FeZ3W6UlMcn5tIV+itK0mOonsRf7WMDN5fC6MdZkgSCl4pa2+Cqa1yTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 07:12:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 07:12:20 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 10 Sep 2025 15:11:47 +0800
Subject: [PATCH v2 3/6] remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO
 switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-imx-rproc-cleanup-v2-3-10386685b8a9@nxp.com>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757488317; l=7658;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZZkSOnmk3tkhr68K9EUIuk1PiLOpl8Ut2xwhvhA5l30=;
 b=Z+eVswz2zLRgxdxPy94l4Hvm9sb99gJmYDeGaGP3/IF/vkFURsKfp8tBl3jxETo+sQuVbcad7
 RbD/RcvKS87BzVXqiFYoFSsr2rqIKMIa7rdUDCq8rqf+gc254UI3/fu
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: a70df1ce-4b40-4cd7-10c8-08ddf03961cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDI2RW5sMjZJM05icS9ReGN4MkRUbUZkOEFNTEFQeHdMaFVYaUN5d0p4ZERN?=
 =?utf-8?B?eHVyU3NVUitQSXZKUFoyTm5CbzltT1FSSytrUTkvTGJpaVlZZmdPM2wxRlRF?=
 =?utf-8?B?Sk1lKzZ1L0pkbEpwRkNJODg3eG5GWkF0YzY2TWczVzhoTkpLbFpQUUhhSkJX?=
 =?utf-8?B?UFVWcUNIYml1NjNZN0Y0dFhMeW5pVFVoc2xyb1Voa3lYTDFxVzAwVnhnT0kw?=
 =?utf-8?B?ejdyZFVnajhXbENpM1EzbllJTEtBVFplZHJ0MVd3dEhTbGxwOG1oMGVndHU1?=
 =?utf-8?B?RjZqZFFVMnVhSkhCZWdqeFFVTkliTlFLWDlUdkxoOFZhdGd3VXRjZW9KY2p2?=
 =?utf-8?B?MXFRRDdaVkU0T2tITzVmVEljbUxNVmxWMk9WK0NENkUwUFF5eDBFaFprNW01?=
 =?utf-8?B?b0pIL2pKWkhvZHhTMk1yK2RHVkhzMktMUE9BSHBLZlllMGdiRlpFK3k4SWRV?=
 =?utf-8?B?a2orU3ZPdjk5OFNkUi9iVXBhTXZJYTlHNElFS1RXMkRobU9aN2hRUlZTaitM?=
 =?utf-8?B?aWt2ZkpvMlI5ZFFqa1VhbHVWMnhhTGZsRmxmMTAxdkRrdU1XcEZrb1NiMjgv?=
 =?utf-8?B?NDF3OVhPNTdtRW1OckV2OFE0N3lMZmRYbUdXUGQ0dUp2a2lnSnowdUNWSDVS?=
 =?utf-8?B?WkZtdFprblFDWHVBR2hyUUVwVDEyUFVuRFJKenhkVVZNdjFhVkZBN0ErekdC?=
 =?utf-8?B?QVA1THJHcXFIamluQnNBK1F5Q21lNGlxb3FwU0h1WnlIYlNzZlBSK3ZMV2tx?=
 =?utf-8?B?QTZLVTRqZHJHNmJ5VXhlYUFidlpyTjhXeGJkVGNvcE9objV1RnRZeFdEdXk3?=
 =?utf-8?B?Y3lvckRKL1lMRW1BSE0yOFlIUVJwaW1nY1dvQjF1R3lzdGlPRnhJOVhjTUZo?=
 =?utf-8?B?WExkOGJQVUdrWGdVOFRaQTd6UEJWdkhtSGhFUFQvYUIyc2I2Q2gyTVQ1RURZ?=
 =?utf-8?B?bjRXSE4waGxSSjN6TWJwY1hSbHlWK0dzZEw2WWxxZFZTMGw5cGNwKzVIdHF0?=
 =?utf-8?B?K2NxT2JrMkFYRkJtbUlkdlVYZjB6bk1pK2kzNmdIWjJSeEY2czNiY2k1MXZZ?=
 =?utf-8?B?ZHdsQzdtM3pMRE9zbW5rSXh2Wkd0SXpSSFFyVmxVOFdtYm0wMHhOaWRzZ1Fr?=
 =?utf-8?B?NFh5R2VMVEU5ZWJtTFc1VGRCS2dxV0Q5UExyMDdBRjAxZFJSa0w4NFpGazdQ?=
 =?utf-8?B?cXlabFhuTm1URDR1dnFRTTI3S1JtcUI5NTJnYkxPTVFwU09iNU9sY2lvdjNm?=
 =?utf-8?B?R3FsbG1FWEdOUWp2R3ZrdUNHRlRGVWVNWXl4YTUyV0h5RmM3SGFMV2xiRkYy?=
 =?utf-8?B?Q1gwT1RZZnZvTmdSL2R0dHA3Qjg3VzhtNEVXVUkxYjVTRGtWaEFkMWlmY0Jt?=
 =?utf-8?B?NTJObmIrVmxhSW1tZzdWZ0hRdHNja05KTmlaQi9jNm04QWVNd2xIRFpOY0Jv?=
 =?utf-8?B?RHJxOTZ1Wk16S1FMYVcwVE04L3BmTEVta2JPWS9RWnI3OVFxTEJBb014VElV?=
 =?utf-8?B?SVJ4R0hGTElGRlg5NXNQTm91blFSUXNUZ25YYVJUWEM3TldDT2diYzlRalFD?=
 =?utf-8?B?TXFYNFhoeDFVaS9ZT1dyZ016cE1XV2lUbFlndUxTMTF0ZUtqbHNEUXNDdlVk?=
 =?utf-8?B?MUloTGdmSjFrRVBOdHFhZ3JUQ0dxYmgyVzhTN1JnU013VEJsOHgrL3FQdGtI?=
 =?utf-8?B?OHBkRlNBT1U0NS9JQVJTR09iL3lOSTdha3Rvc0o0aFYyMzBCRjV0aWJrUVZB?=
 =?utf-8?B?R1pESFhXYS85cEtaZTU4M2dqNk9aNGZFRnNPNWkzdnlDTmt4MHdsUk9tVHhK?=
 =?utf-8?B?R2VPeGMwREtjS1FJd3JmbFh2UjFKdWNyaTJ3SEZRTC9ITm90Q3JXUmxsaVk4?=
 =?utf-8?B?YkpYeU5uZ1MySXhrRWZzdXYycm5tK0ErVkY1RTBZT0FQa0paRlBlazc5TWZM?=
 =?utf-8?B?UDBUMkx0UFkyeTRHT1lpM09JQ0ZmZFlNL21qVWpUVUticW91dDhHbHN1bEJL?=
 =?utf-8?Q?p7+kPzk6XS5SjjbY5WwSh9nhZKVjAI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzQzUFd4SHFUQk1zQ1hUSFRRWUxZMnQyQTM0Uk82NS9wNjR6YUZjNGVvM0sv?=
 =?utf-8?B?RmZLMGErUUU4M1BGNC95WDREc2k0dzI3ZUhQVDkvVVFkVVZ1NnhIZTRFbXpL?=
 =?utf-8?B?NC9Nb1dQdm5CeldWdWZodFdwRGVmcHk0MURYcWRNM3NFd2ovRGY0NmtVb0to?=
 =?utf-8?B?VmRMbnc1L0FzMWxnZTJXSzdnTlo5TFdZRlBNK21MRFhOVXhWYXd5ZXBXYnlT?=
 =?utf-8?B?N0ZOY0J6VTJyV3krbzRrcmJYeGtiMUtsNFh4VWp1RTVmcVN3R2JNblBLaHZh?=
 =?utf-8?B?SWNBUXBvd3NpRTZRM2ZLcXBDM2VWa1B2djhnR0NZQ1dKdDh6cTQ1RThiQXhi?=
 =?utf-8?B?MnJhNlFBak5zd1VvRWNYZ1hUUDBoNUlqKzVTaktlT1l5cStiNzNXenpNNXBx?=
 =?utf-8?B?VGVoeGl2ellNakUwMkpzUmpwRXduMUJkSkp4cFlMZ3RSL08rR1c3VWRvVndW?=
 =?utf-8?B?eDF6N3UzQnBMblBJdy9ETjBIbm5nVGNia0plaUlKeHdiOFFic2locFZKTW5z?=
 =?utf-8?B?R29OQnpicTk0dDFOQzBXKzdpVWwrRnAyNjR4MjV2YVMwb2VUcCtLQlVZN2dq?=
 =?utf-8?B?VCtON3EvcVlrOUkxdHgraWt2VUVvUUJCOEZIVlpFSk9sY2dSUWhSdnZkZXEv?=
 =?utf-8?B?M1dCc3FvNmVDMjViNVkzZWhBYmFiQUk5d3NxSCtpUHcvR0dJQ2JacEwwb2Vr?=
 =?utf-8?B?U3NHSHUyamZMVlloeGpRWk93dzd3SHA3Wk5kTXBVcCtpWFVHTHIvRmlsNVQ5?=
 =?utf-8?B?N2FHVjNockN2dkJoMFFIV284djdNeVdMbDF1V1JBellqU1BwZU5qYWd2QSsy?=
 =?utf-8?B?My91N3RYUlBzcUN0VFlCZXBQQ2kvUE8rMTFOVkhrOGl3Nm5WcFlCeEdiUjBC?=
 =?utf-8?B?RzA0VndobytEazBhSlg2b2NBV2t2cmVZQ1VkTDFZNW1iMFRGaW12MlgwWnVH?=
 =?utf-8?B?NVRqazdnR1QyTUM0M1A4c0JrTlptTjgzeHJ5Y0QrOXNwbUtPY0RKQXFYbllB?=
 =?utf-8?B?c1NwR0ZLZWxXb2haVWpqSEswN2hIVWtuY2pMck1SQmhBaTFwNDlkUHdYZ3ps?=
 =?utf-8?B?dDlwVkFZbUxLZC92b2x5WXZaYmFodTFqVUJDeDN0QXY1QmpqRjB3d3VOV2hj?=
 =?utf-8?B?V3pOd00yeUxjMHFtZkdkaG1sbEFDNlRvTTBkOGR6aENkSDdVUk5hZm41OHNH?=
 =?utf-8?B?c1YxVHFGY0lZM2pUOGlWWk8zRk5oUnRKd3ZlVHZEVkVQQ0NHSlJnNkowRkpC?=
 =?utf-8?B?V0tkekw4emdnM3NmbjVONFVKNUtQZWtEbXphMGthcFVpU3JmbWFXSlMzdENv?=
 =?utf-8?B?eGd2L2piOFNUcytsR1dlaU5ER3hGVTlwUEVpbTFGOVZNVldoTHQzQ2I2T3hE?=
 =?utf-8?B?cXZJbklCQ1VvcmFsdDBOOGlVNjZibnRmT3NMZWxOUkg2TGx0ajZ3RXZVQ3h1?=
 =?utf-8?B?a1VibzRYMCt1WXBkUjNlQzgrU1VNbFc5UWFtSFpDdzFvWW9QZHEyQkJDSk45?=
 =?utf-8?B?M3g0VDUyK0pqOHhXNnI1cTBpTG45S1hYck5kb08vV0cvUlpGdEV0ZGg2QVNX?=
 =?utf-8?B?b1ZhMi8rdHVjaGN0RmRTTEoxb21wbHVNNWY3a0ROaG5uWFp4aFl5QVpoQXhS?=
 =?utf-8?B?S0w3NGQvMysrUXZSZWkyWjRxSlIzbUIxeS9TaGowOUp5TnZKTXdWREVGNi9K?=
 =?utf-8?B?N2NhMnRZb013aEZpRUVjaDJzcG0zaHo4ODl3cVppNGtEVVZRbFA2cGZkZXN6?=
 =?utf-8?B?bFNrL0QyWnlsS3pKd2NTYTNhZEhtYllSd1pZNWZyZXo2eHhYUmkvY3FnT1ZC?=
 =?utf-8?B?MHhtRmFnTXJIMitKRE5SeDN3aUJvS0ltVlprbEZYcGxBY2JHS2hFT2xoNW9L?=
 =?utf-8?B?cEt3L1FjaXlodzhidWRVc2JGOUw5TERHTXpteFVCM2twOUtldm0wMGF6YWRo?=
 =?utf-8?B?SFYyWFNjeUtaWENLTXNzb1hSVUVwcm9NSkw3VzZNZ3dUTDE5VzBkZ0JZbTEr?=
 =?utf-8?B?dE5Tb1JmN05DQS90d0U0TFY1S241UGZzQno1ajQ3akE2Sm9MVnN0VlhIaGc5?=
 =?utf-8?B?SnZMaWJCMi9Mem1DOTNETFlWRHFCR3VrdFFMM0dJWW15eUt1RG1UMk9WUjhE?=
 =?utf-8?Q?ZKL6g+TrByBMAaveQa/uwkJXJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70df1ce-4b40-4cd7-10c8-08ddf03961cf
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:12:20.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zjfjjj6/6gdHeCTKOhToLvIaVy+D+A4Y7GJdoZHzXDIqxX5XaHdkhFN6gF/IaFXCPWukgK6r+Urchh7/FZDaHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358

Introduce imx_rproc_mmio_{start, stop, detect_mode}() helper functions for
all i.MX variants using IMX_RPROC_MMIO to manage remote processors.

This allows the removal of the IMX_RPROC_MMIO switch-case blocks from
imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
in cleaner and more maintainable code.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 148 ++++++++++++++++++++++++-----------------
 1 file changed, 86 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index af7b69d750deed734668cb413b29378e5ca7c64e..c37dd67595960f08fd85c0b516d0d03855cec9fc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -285,6 +285,17 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static int imx_rproc_mmio_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (priv->gpr)
+		return regmap_clear_bits(priv->gpr, dcfg->gpr_reg, dcfg->gpr_wait);
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -303,16 +314,6 @@ static int imx_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		if (priv->gpr) {
-			ret = regmap_clear_bits(priv->gpr, dcfg->gpr_reg,
-						dcfg->gpr_wait);
-		} else {
-			ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
-						 dcfg->src_mask,
-						 dcfg->src_start);
-		}
-		break;
 	case IMX_RPROC_SMC:
 		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
 		ret = res.a0;
@@ -331,6 +332,23 @@ static int imx_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_rproc_mmio_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (priv->gpr) {
+		ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg, dcfg->gpr_wait);
+		if (ret) {
+			dev_err(priv->dev, "Failed to quiescence M4 platform!\n");
+			return ret;
+		}
+	}
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -345,20 +363,6 @@ static int imx_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		if (priv->gpr) {
-			ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg,
-					      dcfg->gpr_wait);
-			if (ret) {
-				dev_err(priv->dev,
-					"Failed to quiescence M4 platform!\n");
-				return ret;
-			}
-		}
-
-		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
-					 dcfg->src_stop);
-		break;
 	case IMX_RPROC_SMC:
 		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
 		ret = res.a0;
@@ -855,15 +859,60 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	return 0;
 }
 
-static int imx_rproc_detect_mode(struct imx_rproc *priv)
+static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 {
-	struct regmap_config config = { .name = "imx-rproc" };
+	const struct regmap_config config = { .name = "imx-rproc" };
+	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	struct regmap *regmap;
+	u32 val;
+	int ret;
+
+	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
+	if (IS_ERR(priv->gpr))
+		priv->gpr = NULL;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+	regmap_attach_dev(dev, regmap, &config);
+
+	if (priv->gpr) {
+		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
+		if (val & dcfg->gpr_wait) {
+			/*
+			 * After cold boot, the CM indicates its in wait
+			 * state, but not fully powered off. Power it off
+			 * fully so firmware can be loaded into it.
+			 */
+			imx_rproc_stop(priv->rproc);
+			return 0;
+		}
+	}
+
+	ret = regmap_read(regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if ((val & dcfg->src_mask) != dcfg->src_stop)
+		priv->rproc->state = RPROC_DETACHED;
+
+	return 0;
+}
+
+static int imx_rproc_detect_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
 	struct arm_smccc_res res;
 	int ret;
-	u32 val;
 	u8 pt;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
@@ -937,41 +986,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 		break;
 	}
 
-	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
-	if (IS_ERR(priv->gpr))
-		priv->gpr = NULL;
-
-	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
-	}
-
-	priv->regmap = regmap;
-	regmap_attach_dev(dev, regmap, &config);
-
-	if (priv->gpr) {
-		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
-		if (val & dcfg->gpr_wait) {
-			/*
-			 * After cold boot, the CM indicates its in wait
-			 * state, but not fully powered off. Power it off
-			 * fully so firmware can be loaded into it.
-			 */
-			imx_rproc_stop(priv->rproc);
-			return 0;
-		}
-	}
-
-	ret = regmap_read(regmap, dcfg->src_reg, &val);
-	if (ret) {
-		dev_err(dev, "Failed to read src\n");
-		return ret;
-	}
-
-	if ((val & dcfg->src_mask) != dcfg->src_stop)
-		priv->rproc->state = RPROC_DETACHED;
-
 	return 0;
 }
 
@@ -1143,6 +1157,12 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	destroy_workqueue(priv->workqueue);
 }
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
+	.start		= imx_rproc_mmio_start,
+	.stop		= imx_rproc_mmio_stop,
+	.detect_mode	= imx_rproc_mmio_detect_mode,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -1153,6 +1173,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
@@ -1169,6 +1190,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
@@ -1204,6 +1226,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -1214,6 +1237,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {

-- 
2.37.1

