Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84866309F15;
	Mon,  8 Sep 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336905; cv=fail; b=Go3h6m1KWwzbBLNdxponYM66szNkJpZzghNrFiW94U4eksxd6rmToLzikDFUiAbN8qxP0TW5GskNwm+dZ51oEQo4nP9J3Ahexwtx/eg2IHbzJUcGjbK6PQFO0SqUHp8jk6fnBbqAUtbqw98n8tYzgi5bXlwzVUvlkqraEN4SWu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336905; c=relaxed/simple;
	bh=K/BZpRKkxI1Ad4HlundfENvmuV2lgxaSLD/nbPG/Lr8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lmMoHLPaWyHbAb+1EEXe5rumJkFAFwZWdN/N7a/zTAYQKDTd/Pzyu/YDW9KrmYaNXubvlzEELDg5nn8z9deU/hQp+CAGEBby5Fx5Jy8OLICKxOME4hFIW9CbfJXzO0ac61SfOKqkalQDLcv42WeAMyUccFIceUIzwAdT9S9JfAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FRyfffOW; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FRyfffOW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkdBrlBVdRpIPnPLIlAtaq/z1ZCnIcQ8epXEzNixNGzyQPuVZoXFYrHy8LiH4PdBUmodJNsvJIu2bQ/qUhgaUM0W8+QdLCggM19bW+KK5BYsKS9aUz9Bk0BfS8IlZDeanXEdPl4Jv73ohRbdYbKetJsn2FXYDzhvuBQ7LxNTA3/OTjn5HAUHRZ0spPEBEvF53nAj7mYR5MqBJEPHNKSCbCQicLMMZvOeSapXhCh/3G5dCVc1Q6oy3eRbRI6nU35aERaLyMLnkJgYqPSWMVFYuBSFIACPbF+jLxAAXTiBZYyYOxlOBOSDmF5LZpDS5cE3kgkCa7VMqyof3veAJzV2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMyiB+EhVrdwyX/PlxCpGsoQmBOgb1K+L3LPD6HZRws=;
 b=tLVkJgcbAJoB8/HZVgWIDmgvsFb2F1X9O0BIU9bIGly3/llEcL964gjE6HkHwm1ripglGrOZguI2zmPUmTOUIg60I2dSpjjleBHs5ZwgOKs32Kw5j5x0NLT3p/tQbIGy8cQnVK/5Doew0q6nNDYHKtwZrkwoq1flQjUoeCOA23uC2gahn6gIoOcOnVSBa7LqLo8vTTKKt3a6CGD2kVJvZnk81u7kx316mIAyBfCmq71H1IMx0Qg/L9s68dbOCVs7S4O/uy9vdiQSR1dmLPninKr67oDgiBzp5bbIRQaMevTAXkqQXZFoUQ/kCt4GHSjjPOKyx63hz+U/hSLY1G9WaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMyiB+EhVrdwyX/PlxCpGsoQmBOgb1K+L3LPD6HZRws=;
 b=FRyfffOWPdMJt7Ty1DaWjEdFy6+078vJyXRicwiR1C3GoDlGdSyN+nYoXGvoa8PN75Yk93Z4uP+7yXPF/UYZU22ZSUJm6Wsj0lUwx6OUw9PVmS8syknxfYBY+DertLhKgMGCSgapjXdVK/amUBWvFB0DBVaIsghnZGHkPnOxuCNBNB2hnDmSPCUVhjWKmZ0NbvCc4Q/UT76elQQNEBnXVAsYqvolztCLvIZMtGXrugpLpAYP+M90AF+3sgzlgLFfWlwogwOh/A5gVi4ERbLGKYdFGDDXykyfm+BWB6SLANgaXdQl1UfCmoOn4twoduWDU86MymZ3uagG7FREUDNNpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 13:08:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:08:19 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 08 Sep 2025 21:07:35 +0800
Subject: [PATCH 2/6] remoteproc: imx_rproc: Move imx_rproc_dcfg closer to
 imx_rproc_of_match
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-imx-rproc-cleanup-v1-2-e838cb14436c@nxp.com>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757336884; l=6344;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=K/BZpRKkxI1Ad4HlundfENvmuV2lgxaSLD/nbPG/Lr8=;
 b=QrpmgnYrqTKP3KY/S4kr+Y2O6BG7iTnhvXj04SRvLyiirT/zqTddjmIeVTBw++hvdcLU1Zpat
 Sbgnhyl90IJCByn+tTnltztZMo2lIH6YfiwSlbAKfiSTbfoRCMGQWgm
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b8536f-7723-43d4-82cf-08ddeed8c7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkVlRUFsYVR3bFNXSS9OYXZ5WGZRY0orS3BJZmRMUWVIRGhSdm95d0w5cFZ1?=
 =?utf-8?B?T1RaUjQ1ZU1aOGVJRHF0R3pQTnN1VjFDUGlLZXY0QTNuMmllK1ZNYkpGN3Fq?=
 =?utf-8?B?V1I1K0w0NWVlbDVXTWk3dHhMaFhwdzlOTlJERXJmbFdzYW1yaVRiSmNHVnNl?=
 =?utf-8?B?RWRrMnFGSDBYd0lYNm1qZHhhNkk1SXA4YkVmSHdkWVBvYmVlc2hJU0UrOVdE?=
 =?utf-8?B?WExTSzhDRXRYQjVMT1o0d2FSK0JOK1QvSCtDUG81cFduTEJsQzdMUHVSaTdj?=
 =?utf-8?B?SjBTWFpwTzNudlluem5EdGxOVW9zbXc2am9LV0Z5b0JLNGM5QnE2cFFwTWhr?=
 =?utf-8?B?UFlaSG4vbVZSb0JVOFpLNVhxT1FNQlcweVJjWmszaEwrRE5mRTV1WGZaNlFz?=
 =?utf-8?B?ZWlWS0k5TWt6TXFjeWRHZldhdDJHai94WWVUM1d2UnJrQU15c1I5bllEKys2?=
 =?utf-8?B?TUNNbHc0ak13RUxkZ1k3VGVWQVJrc3FnWVI5b2s5ODVJMEM2SHlmMmFnWFpj?=
 =?utf-8?B?c2NaYzg3NFRLcEhJZURlNUxmVGwrWVBKSVk2UmxFWFNCVjJ6SktaZU9PMUNJ?=
 =?utf-8?B?QnZBTmlUakhCWlRVb2ZFZmpjNWs5Z2MvazBPS2xRSDc5Vi9JaWpxZ0h6RjVr?=
 =?utf-8?B?NE1PZ0FLMko5WGZSYmtMMFRObXJaTlJudGR6TEJiSXhKODY1cERYaC94UG1s?=
 =?utf-8?B?bGt5SzlUaG5lc1h6Z3JuZkwvWWQrNGxMaHBQVVQ3NkptcGVoSmRVQWpNK1Mw?=
 =?utf-8?B?K1ZJRWNFcVhjNVBZNTkxOXJaZ3VtUmpIYlM1b3pnTnF4c3dNbEhhaFpFbk9j?=
 =?utf-8?B?Y0JwaUJWNytISVBpVkZLVE1JSjlSd1FpOXRpTWh3dUVIQ05RaGhSVlZKdTJX?=
 =?utf-8?B?SlE2Y0R1NjkrWkltY2JjV1RsTjdDQ2M3QVh4VHgzYzY5Vi9BWEZKK1UweHJC?=
 =?utf-8?B?WURkQUtWNVc0RnpkT0NXZGVPQ3RqSTlUKzNLbmxpand1Q25wakM1NzV2WjE2?=
 =?utf-8?B?ZCtPWERKdVVyVVdoSkdZTXRBWmxaMm4wTnFKWVc5QkpLd3d3OFZPeWxNdFdy?=
 =?utf-8?B?UW5RdjVKYndDeVBBeElUZnRBai85V01ZMU1kdEF5Smp4dldQRy9XWTNqZUQv?=
 =?utf-8?B?ZHJMOGhVSDNucmE4TjY4bUFsMTVFTkgwcFhaQUk0K3F4Tlg0SldKNFl6ck8z?=
 =?utf-8?B?a3RjMlNXUVpCc0V2N3NNYkJBZFRnNnhWMmxtN0xDUkNrRFkzTG9GeWc4V3p2?=
 =?utf-8?B?RXVldElWak1idmMwTWFkTjNSeHRnVHU5OE8xNUhTZ0xhVmx3M1BwaFlvLzQ2?=
 =?utf-8?B?SjFCOHpuQTJnelVIRG1VMXA4bVBoZXNrMDdpYmVIKzdJN1dZRE5HWWIxbFlY?=
 =?utf-8?B?QllSaHZvblMyK1NJQmdycmszcTlaNjZrYzlPVGZjcEFZTUttMitLRWZxZWk2?=
 =?utf-8?B?TXg4Q1djRGloQmpPclVKMUFiWXVFTC9TbVdyTmVWaDNuR2dnb2Z3blBWZ2s1?=
 =?utf-8?B?a0hNYlF1WkUxQUl4QmZ5RHpkT2pUcWRTUVAyeVpJMDQwTmJUd2xPSXBvV2Ez?=
 =?utf-8?B?OUJueW0zQkRwdnJEbWwrV3Z3VWkwb2IzcVo3Z3puRzQxWUZGVk9tditTaEt1?=
 =?utf-8?B?OFZUUFltQm9BbTZoSDI5Nyt4VC92WGIrSlBrM3EySWdGQTA1M2JsYUR2S2U3?=
 =?utf-8?B?UmVuTkM4b0pEOWY1cytGTnZUdXBXdHJ4M2tmQW5OekNVZC9SZFBLbE5qTDQ5?=
 =?utf-8?B?Y3BBVEp6djdFcENSc1U1SVNoZFFkdlkwMHFFeVV4cVdEK2d3L3lOY2c4ME5C?=
 =?utf-8?B?NExkNXBKWTdkNUVOS3Y0VDJhVE5RdVkyeGZCMU9jZkdFQUtmcEV3aEQrRkkr?=
 =?utf-8?B?RXlHVE5UalR2VHYyYmNNY1ZISzhnM1NNRUYvRnYyMEZEV05GSnFCQVgwRVJ0?=
 =?utf-8?B?a2F4b2dndDdzOWJwN1FVTVZrSXMwdXFZL1cwMUNlSTRRUEZHR1Vyb1orT0F4?=
 =?utf-8?B?eXNaUDdsU1dnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2JadzA4eFhlVGNYa05XaUpMOW96YjEyVkI4VFpYUXBBdnpqMXhPRngxUml6?=
 =?utf-8?B?VTBmYUZERjBnSnVuT3FVd0Rvd2hDYnB2cmtpcW42Tm1SUDljMHE1bmsweU9x?=
 =?utf-8?B?SXprVDQ2NEJUSWduQ0lNWDAvZDRDOHpBd21BNnRIM1dpeXB4K1lNRDlqa0t3?=
 =?utf-8?B?c3B4eUVwaGVlZERQZFBOK080OTVNWnRkNGpscHJFb2JFTkhVdlluR0R5MkJl?=
 =?utf-8?B?REZVSzhaQW1mTGxNdXQvRW5DS3VNN3B6L1JkOHU3dXZFS2JyOGVvOCtUQjky?=
 =?utf-8?B?eWhUZXYvZFVWNndlakFkY1cvSXkzT0ZrcisxenpNODdoOTRhZEdYNVJyekRv?=
 =?utf-8?B?WUJ5QTNacnJuVWI1MS9BbjdUOWhialVvZmd4YkkrdEhiYTNDK1EzVWhUOXlZ?=
 =?utf-8?B?cm9Mb0N2bDdxN0xoL0RvTzk5ckVQUk96NzJMY1Y0RzI1WlZ5d2QvZ3dqZEgw?=
 =?utf-8?B?dWFCZVNoVEZUKzloR3Z4b2Z2M3lFRGYzdVg0QktFdmV1MStZakk4MDFJZWM0?=
 =?utf-8?B?R3R5blMwWm9KN2o4S0N4YXVzakNhZ2dNY1pRVHVMUEVLWXhDaVpDeUQrSTB1?=
 =?utf-8?B?dkxUTW5TcS9QSUZnam1RNWpLNnIzZG05VXEwR0ZuNGhwTWhuQjZtTzBFK3dN?=
 =?utf-8?B?YUI5TS82WGRYV1FNbGc5ZTB1czloVjZmZ1NmbTRpYWJlR2ZpM1JnczB3K2RK?=
 =?utf-8?B?eHlsSEdPdkdaN2ViSEV4cTV6eFcycmtneVBwUmdtMkpDa3BmeHI2WWorRFlm?=
 =?utf-8?B?UVdTdjhRODhBWkNzcmxZcEpKekM1Wkw4Ui92cXRzeE5aOEVtcnRQTlU3SjBD?=
 =?utf-8?B?ME1kZ01PT3VJQXpnMzBVZWdxZU0yS2lvRXdpVHFzUHdwSnc2SWl2SmEvb2tT?=
 =?utf-8?B?ckdDdWEyZzUwRDhjVmNVcjdlQVlGUm8vY05Gb1R4TlBBM0VFWVBrWnhudnBt?=
 =?utf-8?B?azhKaFVRejIxSFFNSFFTZmFneGZ2Vld1L1VSV2orc1d3Y0doQ053VExpWmVT?=
 =?utf-8?B?K3ZyTkNyb3NpZEJLS1prWEhYRVdZTlBCeWwzaCtZR0g3UytoaGhpVGpCMGZn?=
 =?utf-8?B?OEk4L3BKSVA1cjlIMHJ5TU8vQXVDc29TZzFVUEFXVGdhUWlKbXpzRlhBRWpv?=
 =?utf-8?B?STQ4YjNBQnN1WGZhV3ZJN2c0K1dKcHFncmFmdzR3VnIzZ3hITE10eVIvNmJL?=
 =?utf-8?B?VXhubWdMZ1l2ZEJNQVhrbTRaL3R3MnZmWCs5eXVZNlJJM0M4cjVWNm5hT0NU?=
 =?utf-8?B?dUIxYmYwcG5hNjdBVXlTUHUvcVhPbEtSSW15cjU1OE4rR1Z5ZWFkYUM2SjlO?=
 =?utf-8?B?a2FvRWFiTWtpNXpFQ1NaU3p2cHkyTmFvY1BLajBtUnh2YXBIR293OFNONnBQ?=
 =?utf-8?B?RzFSNy8zM3dMN2lpUUo4THMrd1RIK2VDbWxMWDkvOVluZFRraWJuQnJRVlds?=
 =?utf-8?B?Y0lqM3R0NitnWWVNN3lhMU9XTVFPem0wb1lNQ05MQUM3T3BqTlVibnFPT3ZX?=
 =?utf-8?B?NXNHOE93N2FKQVI0S0ZDOUZMUXUzVG42MmVVcGxJQkhFaS9GUUhxSm5LQThJ?=
 =?utf-8?B?cmp0Uk9RV0Jha2xhRWlYL1Z1Sm5FU0pwRDVyMDdYc0wyTEl1dVlNMHJDRG9x?=
 =?utf-8?B?ZXNKVFJRSlBKUTVqVEk0NEFtbkhXbXh4b1VKaDZFd2dPTTBVemh3M3ozRXkx?=
 =?utf-8?B?QSs5YnFhMVNKbngwRDhJdjNiaGpoTUo4ZllDTitWNSt1ZmtDbHA3b1RxQnRi?=
 =?utf-8?B?QWpoYlJXeTN3dFFGdTJTYlRuTFhQMU5XdmVpZjF4SnEyOVNDUXBCUmtKQWVy?=
 =?utf-8?B?emZHV05mdTRlcnY2WnB2dUw5TVdkcU5uQ2Q4MXkwcmNuZ1FGSzRQZEF0dXdC?=
 =?utf-8?B?bGRMOStQeVdzVTM0TFlVNCtuSnpWUVAwbFFIVUlPWGFEVnBpdDgzc1QwNlBQ?=
 =?utf-8?B?dUNYbVdqNHhGVHo0MlVIeEtubVlCUUpYb3Z2MVRPSFJTWjUyRGkvTW5vdlM2?=
 =?utf-8?B?RjZvQTlWbFlybmxQNHg3U2R5MHFPbVBaM3pGdnZmenE0ZmV3aGFiUEN2SEFB?=
 =?utf-8?B?NFd2YkdpUVROZ3pWYTdtMG95NE53V1hpdmJjWnE5VStBckcyYyt2ZklxN3I3?=
 =?utf-8?Q?IrlIkY47ErZH8hMO8r/qWuNuI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b8536f-7723-43d4-82cf-08ddeed8c7f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:08:19.3274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xzeac7Gq7RIH/veNQkNbI6boLMBq/t56AzTkhlOa/NagdMCCjc5/qUtpfQYtE07aJWBm4yV10KSKAQGpNQUDYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977

Move the imx_rproc_dcfg structure definitions closer to imx_rproc_of_match
to prepare for adding start/stop/detect_mode ops for each i.MX variant.

This relocation avoids the need to declare function prototypes such as
'static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)'
at the beginning of the file, improving code organization and readability.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 158 ++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5cdc5045e57566e817170ed3c708dad6108d2e46..af7b69d750deed734668cb413b29378e5ca7c64e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -285,85 +285,6 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
-	.src_reg	= IMX7D_SRC_SCR,
-	.src_mask	= IMX7D_M4_RST_MASK,
-	.src_start	= IMX7D_M4_START,
-	.src_stop	= IMX8M_M7_STOP,
-	.gpr_reg	= IMX8M_GPR22,
-	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
-	.att		= imx_rproc_att_imx8mn,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
-	.att		= imx_rproc_att_imx8mn,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_SMC,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
-	.src_reg	= IMX7D_SRC_SCR,
-	.src_mask	= IMX7D_M4_RST_MASK,
-	.src_start	= IMX7D_M4_START,
-	.src_stop	= IMX7D_M4_STOP,
-	.att		= imx_rproc_att_imx8mq,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
-	.att            = imx_rproc_att_imx8qm,
-	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
-	.method         = IMX_RPROC_SCU_API,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
-	.att		= imx_rproc_att_imx8qxp,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
-	.att		= imx_rproc_att_imx8ulp,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_NONE,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
-	.att		= imx_rproc_att_imx7ulp,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.method		= IMX_RPROC_NONE,
-	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
-	.src_reg	= IMX7D_SRC_SCR,
-	.src_mask	= IMX7D_M4_RST_MASK,
-	.src_start	= IMX7D_M4_START,
-	.src_stop	= IMX7D_M4_STOP,
-	.att		= imx_rproc_att_imx7d,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
-	.src_reg	= IMX6SX_SRC_SCR,
-	.src_mask	= IMX6SX_M4_RST_MASK,
-	.src_start	= IMX6SX_M4_START,
-	.src_stop	= IMX6SX_M4_STOP,
-	.att		= imx_rproc_att_imx6sx,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
-	.att		= imx_rproc_att_imx93,
-	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
-	.method		= IMX_RPROC_SMC,
-};
-
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1222,6 +1143,85 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	destroy_workqueue(priv->workqueue);
 }
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX8M_M7_STOP,
+	.gpr_reg	= IMX8M_GPR22,
+	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
+	.att            = imx_rproc_att_imx8qm,
+	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
+	.method         = IMX_RPROC_SCU_API,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
+	.att		= imx_rproc_att_imx8qxp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
+	.method		= IMX_RPROC_SCU_API,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
+	.att		= imx_rproc_att_imx8ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
+	.method		= IMX_RPROC_NONE,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
+	.att		= imx_rproc_att_imx7ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
+	.method		= IMX_RPROC_NONE,
+	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx7d,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
+	.src_reg	= IMX6SX_SRC_SCR,
+	.src_mask	= IMX6SX_M4_RST_MASK,
+	.src_start	= IMX6SX_M4_START,
+	.src_stop	= IMX6SX_M4_STOP,
+	.att		= imx_rproc_att_imx6sx,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
+	.att		= imx_rproc_att_imx93,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
+	.method		= IMX_RPROC_SMC,
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },

-- 
2.37.1

