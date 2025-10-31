Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0CA33372A;
	Fri, 31 Oct 2025 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901777; cv=fail; b=YRw43NsQHOWs/aeFInDT/3wXzCIyvZCi1FvLlFtvq+3eO9l4zspO3N8x3ZPRK6cKusYXjNLbhmxqfgMJD3Lz+dYB4FSOaWEBDQDF8jxIu1KK9RriQQKaDQG43nJ9zF+F2iXk1PtmCwT7HDtcmnXi9iK6VAHEQCF2vadbKXQKEVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901777; c=relaxed/simple;
	bh=E4gT9XaiPMroMEbSj380oC/IHz5e6QzbNplypztn7pc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YJXVAC+EHd8CJgfZ/70SgUDS4K7vasRgDBdP2+LK4lw7vVF1jXVPuZWmmciDvXkKa4AsFJJfI6Jq7yWrUEmPCBFwMLjWBDngXrlLq1aUFflGayvaREDh3/+XIxy6G4ZhkqhOwwHXrgwbPccsluLDX4TbazYEAof3e+xuJ5BUR/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oF359/8i; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oF359/8i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alF93C+rZd4nHdsSuaJIExRJuA56DLzgLh//QGvElZ4BTjMQj9fOhxZOI6a+vWcvpxZpEEI0Hllk+VXsqXSbk+27xqPMy2//XoY+i2MnOYCNIx/HHwaA2w5XKxl+S6jp5GuDj6GTD77zCE5g82Ld7BOq/hnduIJnTJEEqNrswcyGN1uFnfp4Vk4473l6zwT1cE6rgAEaSDgyA69v87js8DsLpI/ZJyoIUVxp6OYTS6ldtHjfPVvcxiZOT/iOfq0ITVdrV1baYl4DrRmsxZU/4XAA0pyWpP2gTFzbeimc6SE+5gJq0aOk5zMa/L2nzAFep+msML4TsAxGWsPt+PZdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLnBsvijneuqlywXdu5x0PjgFg26stPI2nSJffLAUNo=;
 b=xXjEoMsKkheGfg/851MerDBP+Vl698cZAOMo4nHLZIaRYzKkhtHjhkEyHvL4lYCTvFfc7kDyRbZUVUcWod4t4fd7MWUHd1tt+FcDfpA9hasmsADkGtvXc2HZJ8rRNwmilav275NOLjh7LFthukGnV1iN/BLrcDGTmN+L/NEG8WiBsBxcEPyTzdpBNhokcTfGlyPJONht29NbWAjitmAAirVqJoEjiKI298HMtX5+RufwtM3dB6DqH3cJfby1fhfAbhARNIITWiyfiSe9dCnuyN1LCS2HygCKTpkff9mPRNrg1s5lRsDsN57R3cp1OqdDw0NW/EpoxpRmzGxoOi0o/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLnBsvijneuqlywXdu5x0PjgFg26stPI2nSJffLAUNo=;
 b=oF359/8iijid2Wda+913TSC+8P2x5aYTwdKtrWk483umF/lNe1JvbLE06oKiS3wEf2J2mK2x9LIbPkaZniqyel6aN8ZrlpPIHKT7rNV4k5uyBKJcO9rwxd/PZljyv2lSrDHNrmqwzExJSA+7hSNuLO++bqplZa6BccrRyxyZoAtad0hP2qN3Gt5w4HqR80nQDJsiY6SuwZaQsSL3XzZJ49e9Lyin04OLh25hSiNS0GHaN1OMibnh4MSYmPc1Ab5y3YUtTsuTiqR1pP4DpClZduDokHA1wxKRs5sXhZtawBOwyXEE6nOM7cgEPE0q3ZmwreF79MCHQ2XxIYvCMj1wCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:31 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:36 +0800
Subject: [PATCH 07/11] remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg
 closer to imx_dsp_rproc_of_match
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-7-282f66f55804@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=4720;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=E4gT9XaiPMroMEbSj380oC/IHz5e6QzbNplypztn7pc=;
 b=+xuduDw7mLfHkPmAX6MqvLFcazYFhZKnHrwQEGk1X3axJRBn7RXm5kNS4+lQ/FOFxMB7MP4kj
 3SMcSY8iXztDYYMsTTTcR9tePlGnstLNzwtcCp/+zOr2QgqlxYmpZ20
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
X-MS-Office365-Filtering-Correlation-Id: 708d0475-2df9-44c2-386d-08de185d33df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFl6Q1JPYmdDSlk0WHYrZFBwdzNSQmdOVWs3eDlmRkxLZEVDa0NnVUFHajJB?=
 =?utf-8?B?VlNHbW5SR2VHRm1SRkt0UHZUeEdTb1B3QnIvYWFkeFlES3NLRmVLZDdpZi85?=
 =?utf-8?B?TUpwNURTZ1RxaXhocTNsVGhLbm5mMStlODFxR0pPU2RBVkpOT3M0OHByTVRT?=
 =?utf-8?B?REtvWitnTDJBUzcyejZZNW1HYXVxcldkc1doNkVkTFNxRnV4NlRJeUNkY0NO?=
 =?utf-8?B?TVVEVEoyWHNEbGFpeFJJaGxnWmQvMHZna3FoZ2lMTG8weHloeFBObXFZK0xF?=
 =?utf-8?B?MGFObURZOWRqMVVnUnNQQnBZNkU2YWhiMVF3VEM0a1ZEOGNLb2ltem13dUxW?=
 =?utf-8?B?SVNXdjdWeGV2TW5qOW1RWVluYjhyM21HcHpPL0NHS3E0aHA1SS9NaXRVOXd4?=
 =?utf-8?B?TnFyU1huOUxkajlUOHJBeGJWZ3NLSkRWZlFLL2F5REhPUHoxUUlsVFJreWhH?=
 =?utf-8?B?NTh1MU94RnZPS2tZZjNNcjRINDlOMEZqTS9DUEVLdkp0Q3JmbmsxTnBZdUhG?=
 =?utf-8?B?OVFMaGx4UUVYVjVZcW9BaXFtTUs3Ymp1L2U5R2hSWnp1MVhDWjgyYTg1V2h0?=
 =?utf-8?B?M0NOQjZJVzh1d0RHRk5iOUI2aHRZbHg5SVpFV2dWVXgxVi90bzREaWluWFFH?=
 =?utf-8?B?UG1IODJROXhOZUhydlg4UUpUK09uYVJwUnpMMHdnZE1NTVV1QnhJSzhZSHMr?=
 =?utf-8?B?U1liMGE4UTB3VEtGeW5DNGlObHdDY1cxeW1BSHZqMUFQOS96eEMxUDVyWVpk?=
 =?utf-8?B?bmtXNzM2dkg0eUtpRG5NeFRtclh1alRMdkRobXFVQmtmZ3p2UWxWNm1XdzVR?=
 =?utf-8?B?N1RPZjFxUnhGaGUvb3lSS3Yra0NSN0taNGZ1VVY5R3V1UWhXL2VDbVRhMW5Q?=
 =?utf-8?B?bVBLYUIxSXhZMWlMbkwvOXZoUDIzNGlIbkpNb1krTEJkZDkreVRXeHN4TGwr?=
 =?utf-8?B?WG5qSCsrRUR6eUZwVWtTRkxpak5BeERvclI5SFQzSjlCR2JCZENINW5JeHhI?=
 =?utf-8?B?OElvR2JJb3lVemZibXFnQUo3UVM3dTJBUWo5ZzQzZnU3NTYrSFNpOWMzL3kw?=
 =?utf-8?B?Zlg1a3M4MDJzaDZHOTVydmlWYXMrODhISUNrbTRHVUxnZjlQQXNHUFlGdzVv?=
 =?utf-8?B?MjRRcFo0QUlkTmF5dG56MVJwWUkxTkpVbG5GVHdoREpNZW0rVFhaaDlRZ3lp?=
 =?utf-8?B?QWlEKzl1Z1FmK0M1T3pDc3hYVEJKTG1LQXNEYW9lVzNhcEczaFpOMVFzVi9X?=
 =?utf-8?B?TzBnZ2FXK3JZTUtkR0MwaVRKek9TRUNtblkrMkNRaGcyaTFHVi9rR2lxenVy?=
 =?utf-8?B?Q3ZhNnZoWmRqVS9FV3FUNlI0dzd0QnJDQWRYNUE3dGxselJ2bUhrSytzQTJh?=
 =?utf-8?B?SFE3U3E4ZHFaWlhMZnFCUGN4V2xUWi9ndkQ2L2JIa3YzcTFHSzJqT3NNVDJ3?=
 =?utf-8?B?cG9FaTdGQ2kxbFBSZWFSWDVvVXF2SFFpUm9kN2RqNmc2am84cGYyaVFYWUdG?=
 =?utf-8?B?UXhnYTh0QTBYYlpjVFZHRmdLQlc2SzQvWlowNHZtcDlPQXFYZ1doNGlTZGpm?=
 =?utf-8?B?eThsZ3d4Ly9DNjNIT25Gbk9sWGdOM1ZZbGhMUTY3OXB5bmZudG9xM1JoeDE0?=
 =?utf-8?B?R0prZFdIc1VKUGxtYUpxNmZIQytIWlJKaWFVZmVHeEpyVnBhMnFjWjJHcUk2?=
 =?utf-8?B?cTRMd1FiTEdVSTN1bFhZR3R2ekNHYzZBRnhYSXJOeUJLazIxWDJXZldXTnpN?=
 =?utf-8?B?bjdBY2hYUlRrVTRTbkhiSCtDMGpHY0twYk4wN2x0RHZOdE5kWUNHZENrNTkr?=
 =?utf-8?B?NERmTmd2UTdYTzNUMU5sUHVjaE1RMEwrb2puaEJ1a1Y3Q0YrYmY1Z29OM2Zp?=
 =?utf-8?B?YUloNVExS0pZS3VrdUY3V3UxWjlXN0gwQnh6MDZaamFId3Jxd1hKRnhSU2hL?=
 =?utf-8?B?STJ1SS9Rb2dSZDNONS9vazRwcGg3VnpJNXJxQ2FSVGloV2hOM2d3SHF1ZXJE?=
 =?utf-8?B?NEtEVktleUNKYmFFTzVCNDlxTEVYSnRNQjVGUzVDUVdYd2d3OVdVMVlFNkc0?=
 =?utf-8?B?QXBHSzdVZmtFd2dhTnQxUlFTV3JMTkZjamQ4UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTVmSEJGL0I3L29BblNwNDliOGIzTTVPbHNldVJPVlh3WWIrOUttL3YwcTFU?=
 =?utf-8?B?NWtDb3VzeWlnTGhEVGZVb1hlbkxndzk5YmN3Q1Q5dll1NXNqZnlvLzduRHhQ?=
 =?utf-8?B?R0ZYY3hHYnl3c29UM2JQTW9aSDl2RGFoY094di9HMUpTN2Q4cjlUMjhxYnJ6?=
 =?utf-8?B?bncrLzFJOXFVUTIra1hXTWtVUzlJNDE5dUFpRmgzaUc1YmpINkw4M3ZlN0N1?=
 =?utf-8?B?R0ZuMkt0UlNxYTVWTHJpQWJEMnY4YTBTZTg0MStxYkRHRENyTkx5VXJyeGVw?=
 =?utf-8?B?V0MvY091UjMyc1JZYkJlbkRBY29hWU5Ba0lKMThCQkdLZDNEYm5GQlozaG54?=
 =?utf-8?B?NFRUbTFsdVNycW9pKzRFK09uSGRuN0IwbGR4MDJ4T3pLR1pqamlXeXFNS3JW?=
 =?utf-8?B?aDVkVWdFdTlGK0J2UnVtK0dsa1JRbTdOSDU0SEFqQlIyUWJkMUVOSm5JZTZH?=
 =?utf-8?B?cnhKbHJ5VGJiM1NmbTlwbFA5TlcyeWRrYU5WeEdaUnFETndnM0NQdXV4NVd4?=
 =?utf-8?B?Z08zbDVHcVJxU0x2K3lyZGh0YjNRNVJlYUFoYlZJdmJjTnVVSHRuYjc2RHZM?=
 =?utf-8?B?WkJYcnlHakc5VmhuK2pVU1RuMWZkd251UGRqUHhFNVRaeDZ2K1lQeGNTcisx?=
 =?utf-8?B?bDBhT2VsZlIvbmRrdk91THFHN1QzamdiSU85TXQrYXdLaGIvTkpVbkloNnpy?=
 =?utf-8?B?Mi9UejhwaGVkY1NMb1dkVzNmaVdLRDlqTXNabFY2bUVzdC91WFVKT29jaUY0?=
 =?utf-8?B?alpQYlBSRGNLMnh5eVVKK3N0SXNuOXRGaWcvYlNXblZETiswOXh0dGZpSjBE?=
 =?utf-8?B?UVhnRW5oM3p3bDNLRStzWDlLV3VJaU1nSjM3V0RheFJ2SEJnZTRsMDcyWVJy?=
 =?utf-8?B?NGRDQ2dXSnZDTUlsRkZESG9GMVF2Q3lqdmhNbURZbDJ6MFA2cW9lTjkwTmJU?=
 =?utf-8?B?MURHSGw3WjJOZngxMlhYNWFURG1PS2RXWFVwcHdNQUpXSnNSVnpLN0h3aEhT?=
 =?utf-8?B?eHFQUkF2L2hiK0VOUDVpdXlJZHRyUWhKeEFkK0szNDgxWEowSjVrUEUwSytp?=
 =?utf-8?B?MlhhUjE5Q3lTclVhejZIeHdlbHdCWDlVOU9nMmErTVF5M3BwQzNyWWs3TDB5?=
 =?utf-8?B?eHJiSEl4RE90aEVKL3ViV0h6QU94RWF1UTdMUlZJMUJES1dTTXRqWmprcXZ2?=
 =?utf-8?B?OFd2ajdxeHNCSExTeDM0UTgrMUxoUVp0UzR4bFB3T2hvblZXbGs4V3RjZkFU?=
 =?utf-8?B?R0V4N1pKVXhNWEhvMml6Mm5zTUVIcGRyUXNZTkhOM0N3SmdRWGlsdG5MS3hO?=
 =?utf-8?B?Kzhob3Z4eTZ2aEZud3A1dC9udVlGRFVPV1A1cGc5bmQwQ1dMcC9qTHliaU1m?=
 =?utf-8?B?M1Y2YU1IVTJqQ0l2Y0VKOENrODcvVTlDR3FwUFR1TFRjdW80amE3VVFveUdq?=
 =?utf-8?B?UHV3OUpxZW1teGFDdG1NUnVkendldU9YUWpEck1DRFBiQWlHbnBGckRtQ2Fo?=
 =?utf-8?B?YlBHZHE1ZzNkNUN0VWp1aXo3aUlCb2trc1RwT0tqazlseXR0aTJOQ0dyVzhi?=
 =?utf-8?B?SWlkNjV5U0txSE5obzV5NG1ZUFVQMGlWSG9hVmUyMWhHNEVUMTROVWZZY1Rj?=
 =?utf-8?B?OHJLR0MwU29kMVdYSUZKUkFFSXJpVVB5RllpSEswaUZad2NEYWVDa2dkUXpU?=
 =?utf-8?B?TGsxT000ZnRqaUpPVkVHTlZsR0NjY0J1YVBZallpNUtubzc0TjVCWFRQVkpT?=
 =?utf-8?B?SE55Zk9TM0lMWWdjYitrQnpDcE83Z1hYWEdIdWh2akZ1Yk9aazJUeW95aUNj?=
 =?utf-8?B?Qk9XUkxaSUlGajZDRDZXNDlQUG5jdU5vTFVIYmFMNEFHUlFFNklOSy8rU0l3?=
 =?utf-8?B?ZlcvTkRQb0tNVXQxbW03UXBOL2dsTGIvdEtjeVl2TFZqVVU3YkorMitGZFdj?=
 =?utf-8?B?RVVnMjdFNkh4akJBaHRHWlB5Z0tMQnkwaG1xRXpJM0VVekJPZ2MrcTdTeDdk?=
 =?utf-8?B?a1ZjeHZML1ViTDNDWEVWSUlEdENFVkpzNlpLOTJBSmx3UkV3cDlsQ2ptOElp?=
 =?utf-8?B?ZWcraFZ6b0tyVTl1SEE4YzJvNnlwY1dOUTZLdUYvQ0orRTBCaTlwRFZWUXB6?=
 =?utf-8?Q?ezw8Vy2t7F0X6f4r25qv9A2R4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708d0475-2df9-44c2-386d-08de185d33df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:31.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfRU9LnEtLj7SxvDm4NGf0CtrROsFB/LrwLTW8uMCY3Ye6xDyeFqges4NMYGPk8NA4TAbpfLbfljRCfi5XvO8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Move the imx_dsp_rproc_dcfg structure definitions closer to
imx_dsp_rproc_of_match to prepare for adding start/stop/detect_mode ops for
each i.MX variant.

Avoids the need to declare function prototypes such as
'static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)' at the
beginning of the file, improving code organization and readability.

No functional changes.

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

