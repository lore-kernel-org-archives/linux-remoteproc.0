Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084E14F9D6;
	Wed,  4 Jun 2025 02:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749004570; cv=fail; b=NOt63I7caw1Nm0XtEG2zecjx+L7xZfr6caxUeYjwGu6EGEi2LiMgO+zU43O+0ie5BC+4/l2Sk+54z/kDkO1IBnYBq2RuCe279zDM8lnk4NemBFwPOzMr9Ufofhm606Aqy41H26vaMe/wbq9KWFHq5UpuOARzJdbZuA/upci5t54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749004570; c=relaxed/simple;
	bh=webNUD+qzFEQVwkAP+X9bcgK3EWlHUhGuFkS/HdHj4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=toNnINIgPAwE350oTIeeL8wSGsv30nEdd3AwMVwDoZe97R5dC5MhoPwNTxlGkAZAW95NCFSp9ViZGRaNUdN1IbhAlWHcSvGXOLh5gW9kAd+Ez8Uo/xAZcYp4vlg7U7Z5K6c9ckQFacCPpUtFlZk6xHldUQx24qGEhpX7kIPfU1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nbY828Fa; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nbY828Fa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krF4bL5UI4qxL33c60bAUm6aW/1SF5I7jO6EPB2bQrkgpl2wwBSLBfsBajrgjdw5YywuY7VoaTQzEHHhEtV0uyCCLcMPli64VtFnnIXmV0mHKGl0XYV3ce1omxCvdPw3VsFvVSEWadrn9EttPXesBHgb8uzqtbmWGHYoXMl0bCno1NIqr41D6u6O9A0hg5lhk3uWQBoSzCd8A1HLSjdXg2iFFpI/JHz2VcgumvYCLs5b83R0GrXWL0USFEjytcCkEABrstTMon85rQCSLMamDzU32FDSV4d40b6CXHrwiMZU5QA2AoaTs7okYmNiO0U41MoUiuTZ2oKD5kKxKbsHsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcZv7hPvcmgLqbxA8G1013G3uXpxFd0Rh0Oy+mRnqwo=;
 b=bXGHsks85CHyMpJMSrEY2WOzOwdTK1nmdb+AZ7N3CRt3IjpiLl2tfXZ1mdjDOx1LjJA3b8w/4+KQDR3CIr3o2XIKu6yEL351Tsfcp/7AKyIVdvxDMVthXKEQklFJkzbMb49O30+ZDqaGUgjwZ6X8sXpQkQdP25lwiInlKq+ZLZZOvOD0jtr2X2j7wrRVgIs8AClK95lM2ELzmQVITVic47Q3gkhqIfGxNL+ONHFpJf2nep5GtGByvYu3EkeBCrNH/r+bNVeVfxjMgy8TpPy8whF79K++znK3JQoq2hM/VBYIcfsie+u4lk9rxqJfIeD+tArMPrL9Qz7YbvoSAIzd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcZv7hPvcmgLqbxA8G1013G3uXpxFd0Rh0Oy+mRnqwo=;
 b=nbY828FacwKEMk+zyHhxOQo0RgJXVfbSiiCW1eeNSOza9h5YBvsZUzWOjbMkRVUqUqmIbeN8MM1MJ+zfcBFByYo0RLvMwQI6lZYqhPzOz73377bJ74bje/HKVIMCG7DhDSMtVPWIgjngm59mrb4gh1yOlZC5lNJvreutbdib64q0Yl+LJartwAszrNOa5wrc5cJwsRgDppcoAn77m3Txckjf2/R1Uz2w5oc2NFxgbyLHIUdWVJ8SM/ac+3BgCZ2rk8CWnpkp303pK/GIJd7U1buotYfMkedlWAarS9Ak7dqjDCVFUSVIRz3mdr1FTGPKn485vxMB6Y89TTOxAZz+bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 4 Jun
 2025 02:36:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 02:36:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 04 Jun 2025 10:33:44 +0800
Subject: [PATCH 2/3] remoteproc: imx_rproc: Add support for System Manager
 API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749004455; l=9305;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=7lof5Bc1iYf7XSaetMxtRpoGej7DY1Cuw727XXxEK48=;
 b=ak3LbzzLa/dtlDNlLMCwcAsy58PotMAbtbTc2TEK/QBXHDAw21u8b0KUGV0AQJY2/pIcsqpsf
 d6+WNtXzeTVCyDCtq+Gd/FnUK3THmxtk9es+UNJK/So73g3z9HRkU1k
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SY8P300CA0015.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 925494bc-4105-4125-5721-08dda3108de3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YysycTB5bUx6bEsxNHdCTEFOVUh2WG4zdWNreU00dUNjbWQ0dzN4RW9UZktm?=
 =?utf-8?B?SDVQZGpxcG5hY3ZuOERpS0ZOVEVoL2IrOXdnRmVkZW81TlZzMnBYSlpmNmhs?=
 =?utf-8?B?enhrMkJoSnE0K2ZQdnlWMCtrU0lxTy9YaFBQVjVRM1pHNEJNanRDaGpCR21z?=
 =?utf-8?B?dUhkY1NObjF0bE1oblVrNTJhM2VvOEorK2pVaXhmeXlsOTdRbk9XV1BMRWJu?=
 =?utf-8?B?NGorMUxtZGZsY1hERWl4ZDMyMXlzNUhwSVZIbkZ2UC9iR2RQMU5WTmNVWHRN?=
 =?utf-8?B?dkc5VU5mY0JQTnkwOFRmZER0dlgzcHZRb1RXajNXRVJYMG03WStlMlZlTjgv?=
 =?utf-8?B?TWhXQytaNTFoamhBcEwrYklrMlVlT0dsNWJXbEFmcHV3RlhUM0U4T1R1WGQ0?=
 =?utf-8?B?dHhkMTZBNmtDWXRtZFdzUkRMN3Q3WGxRbG5KY2REV2MxRVRQLzk5WlRNMTFq?=
 =?utf-8?B?ZzllUGxnZTZZMXFVQ1lrMGZzWmhSNm1xbndOVnc0ZE5STW5kaTlTQk5pYXR5?=
 =?utf-8?B?U2tyQzNEdHFSdjV1SHNMV3hUd3crWkxEM1pxNzZJQy9hdlVrRlEvSkdlSCs3?=
 =?utf-8?B?RkhHNm8vcXBJbkZHTjZaaXl6bjljMkFBZFRUNWFXdVlVUjJVNElOZ3A2ZlRF?=
 =?utf-8?B?eGlnVEQ2cjBPV08xNnV5Mk9yV0FPUUVxdittenl2eS8ybWlMT0FzVUs0R09F?=
 =?utf-8?B?WFpzYVNTMVZ3TU1Bc3FIVWxXZFU5L2Z4RlY4Ny9sZmNINVI0MTVjYlhFVm5D?=
 =?utf-8?B?SjFDc2laa3BydzRhdXRYc2psZnh5Ylc5U2RWaCtNNS9vb1NtRU5SLzFqZlJk?=
 =?utf-8?B?YTdRaGQzSG5YZVk2eGhqTHM2Y3RhSW8wMDJqYmpaMXFKWDVjU3EyeGtoNTRz?=
 =?utf-8?B?Z0Z6ZXFvQzNpMGFLaWlLeFJ0R1ZSc3RHejNlYXp2dTUxMnZwYytYVzFJZU1T?=
 =?utf-8?B?Lzl1WjFwRjFYQ1NCUHpMdTBvWHp1U04xckpoL0dCTm9NQXdBNnFPcDFOWFdB?=
 =?utf-8?B?alN0YjkzbzZmRVhyOUdzOWVDQkNSaFFxLzF2ajB2OU8rdEJ5UVIyU2xYeE41?=
 =?utf-8?B?bkY3SnFNNk1vRWkyejFQQU1lSThjOUJMV0p5SU5Ta3NQVTJFdlYra3J3MDV3?=
 =?utf-8?B?SFBIN3FBMTZwbVowZTZDZVk5ZW1QOXVoMXZ0K0pweFk4MUFUZU5KdDJRN3Fy?=
 =?utf-8?B?UngrMXo5NzFMM0tOSHpxdTJMUEdlQkNMbERXdXEyQUFxZmJHd0p5YkdVbzlR?=
 =?utf-8?B?OVBxVDJONTc2WUV2S3V2c1ZEU2trdUNvekVtSnduc0NRcTE2M2tlMVlKYVVi?=
 =?utf-8?B?ckU5K3lWQ0lVbEtlN1A3bGFLbUE2a0VIY2dkREJCSGYzeDdYLzhqQklKd0sw?=
 =?utf-8?B?Um8xcnRob2lQMngzS1A0TmdoaW9kK1lBMzNNUlYvZTJPTXg3ejRVVXRlaWNq?=
 =?utf-8?B?S2M0VDFzb1dlWjhJRWlyL0lhT25JZFRoT2pGcktXQVBDNmJYckhBeWRGYlIr?=
 =?utf-8?B?UHJPZkNFMkg4bllaVWFRRkNoNjNxeDNPTWdjaVZGRnl0c2lMc0N4QU5aMFhN?=
 =?utf-8?B?bGw5NldIN0h0VFR4UDFZRmtmUWZmaThhUlBOMDJTWXV3bHZTV2NIRmE3Q3FR?=
 =?utf-8?B?L0lxVFRCVzk1YXphQ2hadk9NWFBoUDQ5RHRwSWNOZ01KZ1h4eVh6L2JGQS9V?=
 =?utf-8?B?YnUxMzRYcHEyVXJxVENOOEIwdjZ3UjlVdnFrb3pMOXlqdnptSnFzMVZXTVlL?=
 =?utf-8?B?Z2JXbE9iMitsYUxTaFgxbWJBWWxEaThZVFhkcUxXQmtMd1VsWlIxamlTcHRu?=
 =?utf-8?B?Y1hDdnI0UmJsdFhtOWFYd0dHUkZPeWR3QmNnTFE5bzhoVkhtTy96U2FMYmQ4?=
 =?utf-8?B?RDdkY2hNMm1JbWgvRnZ3cXpYaTc1Sk10dXNXdlUwUkt3dEVNWDlKU2dXRFU1?=
 =?utf-8?B?VUtrTzQxaWdmckpEekFoRTM1aG9sL3NieUVrbVpSb2tFSEN2cE1GT3BITzM0?=
 =?utf-8?Q?3gwDXUq983tspwDEftf0Rzlgs1kF10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUthSXJBVEkxR1hQWkdpbzJ2b1E3QmQ5RnJmbjdYaWlNNmdvbnJmS01LOS9z?=
 =?utf-8?B?NUdOeFN6Nkg3djg1RG5NWjN1bCs3b21ReW55TnBpQVp0YWdmTVd3OWNpRGlk?=
 =?utf-8?B?UHE0bUpna0NnaTFGaFU5eE10OTQrYkVTODllWERJUkNaa1dhdlNad3oxK3VT?=
 =?utf-8?B?dkJNSWtNQ1U0QjFMWU9TQUNCZ2dGNFQ0YnBFWFloYnp6Sy9ibWk1T2Q0NWNv?=
 =?utf-8?B?M1UwWGc1ZitndC9rdnRka0pkS3gyZDRkVDllc1JXeFdyK1g2TG5CQzZxc1Uv?=
 =?utf-8?B?TGtoYXcrZm9nd0ZOblBjWlBGdTZ6Qll0bUR3M29sMEhJL0JERHZZS2pHKzM0?=
 =?utf-8?B?QmNQano2L2xyL1pZbVI2R04wSENUVmlDbkwwN3R2NjVneVZHaTh6QXFCb3Fm?=
 =?utf-8?B?RXRUWEg1aUN3YStlUTlFcmI2cWYzcGVpcVV6L014c1VzMGpWSjFwbnVoeHdI?=
 =?utf-8?B?ZEhhV0x3Uk1OUzZKbEJ5aWxLOTNVNS8wVndzd01qbnBURG02RDROb3grVXBm?=
 =?utf-8?B?blVXZU5iZFNIRmdPcENmanFnS3N4cW9EYktKL1AwT21NMHFuODNpRlNOWDJi?=
 =?utf-8?B?bS9zaFBIOGRHRXpnWmVSemFhRTZCc0RsMTVKQlRPdzhtZWRWREh4WkpmeDhB?=
 =?utf-8?B?cDRMdm5GaUVzcjdZTC8vemdUbTQ3YUlqZWQ2TjdlUzNyaHFpOUF3SUxNK0dK?=
 =?utf-8?B?L0REU0dlVUtqMHVXS3FwdDlpd0crSVgxQkxweitXY2xXQUxEMTRZTFdVNkZB?=
 =?utf-8?B?ZzQ3YkJLL0N0cGxwSVhUbWZXeTNPMkJGYzhYUHhFTkFxUnY4Y0ZyKzJQZVlF?=
 =?utf-8?B?VUwrNW1RaEhjdW5RQ0RTMnQ0TmYrU0UwN0IrL2U5NmJtWG5ENEFWMVVvcGhl?=
 =?utf-8?B?S1dyYVhPRVh4dW9xc3JZTmM3c0tQWFJNSTFteTA0Z3k4a0R3SWR1MDh6TXYx?=
 =?utf-8?B?QXZIVHJNMVZDWVFLTGNNOVlkWTlnekJEWDQ2TDliMkt1TjRaT2ZXYTVQK1VS?=
 =?utf-8?B?R2lhYUJEajlMdzVJbzdieTJKcHY2cG41eEE0VDg5eDlIdUhKSkF1Ti9Gci9x?=
 =?utf-8?B?VDQyTmFXbW9ydDhtRTZlNSt1TFZwc2szVHU5eVlnR2FzYlVDSEI1Q2tLVEMr?=
 =?utf-8?B?VFVqNVBlVEV3TE1qWVNhZlU0TnpaRXpVS3NzTXlQc3BDaDkxUEtCOVFHVjlM?=
 =?utf-8?B?Y3RpM0kwNDNFZjFKQ0VYYmdYc2EwRlBJSnVYT2NVdVZMcFMrdC81bUNSVklG?=
 =?utf-8?B?TTM1WFpublNlcElWQnJtajNaWnlFcVV5M1lSbGQ4MXlrUXQ1b1NxeDd0aENr?=
 =?utf-8?B?ZGkvRWZDUE9CTHNPYm9qZnMzUnJvMnpXY0MvSTREeUdGSTFsMGlVa0lxeUJP?=
 =?utf-8?B?dlEvNDNkNllJVS9YbGNtVnZNSTY5T2VwNmZNaXB4cjFwNVg3Um1CWmpnTk42?=
 =?utf-8?B?NkJGdmI2emtuRTZBOU4wTjhOWGcvRCtwbEtNSktNc3p4MExndFpKQ2ExN2ky?=
 =?utf-8?B?M0tmU20zSmRjSDhITXc2QUFRZVpaU3hEc1IybG5qK2tMRG9sdGxNNWdQdzc4?=
 =?utf-8?B?RWZyRDNPTnlUcSsrMHZ6alZkRXY0OTJ4bHorais0MXA1TFFGYk1hcTRGRnRh?=
 =?utf-8?B?WjJucWtEZ3RwZ3FIbjk4QloxMUNuYTBqL210NXVXcWdNYVkzYVRiV3lQRWlj?=
 =?utf-8?B?dzhKODhZcWVjNVRKVHloUGFROGpINVZyMyttMEpRdGg1Y3BNUkFza21kdGpo?=
 =?utf-8?B?bmNLZkhqRnZtWTdWS1AvN0dQVEU2RlRkM1dSK3lkem1mamlqNVJCaURxZStu?=
 =?utf-8?B?WHg3d09ONTlrWFA3ZHlqdmVKM0VVVUI4VG1LbU5yMmJHa25wdjBWZEY4eU1h?=
 =?utf-8?B?R3QrbWxCWmUrZDZKOGJ4ZHVJMWhKQlJiL1pBcmtXSERNcVRBZW5YSXRScmp4?=
 =?utf-8?B?RnZaVjNDcHB6OGppbHdjckdweFFySE9PbU4zUFpiOGd3L1VoVGZkdEJDWkdi?=
 =?utf-8?B?ZThmSGlNenh5ZkgwRFIvTjNwWEJBa3l2bVc2TlZ2TXhkZ2wycnkwSFVNUHAz?=
 =?utf-8?B?SzJCMnZGQnAzKzBlOElCNkh5NTdZWFo5T2I5R1hYZ1pKNkZvZGhzVFZzTElq?=
 =?utf-8?Q?9y7Z2aMzg5LxjffFsxXu9B09C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925494bc-4105-4125-5721-08dda3108de3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:36:05.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7WdA59f8N8NTGCMPi15vA5zDuqyUlYzXtLAaSZY79CvNrOMBEP5fg7i7xYziwoiyBLg4H76lz+3BYnK6mSbmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

From: Peng Fan <peng.fan@nxp.com>

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

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Add IMX_RPROC_SM to indicate the remotecores runs on a SoC that
   has System Manager.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
   from DTB), if same, use CPU protocol to start/stop. Otherwise, use
   LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 139 ++++++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h |   2 +
 2 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f10a0db794de494c52304b2323b89f..0649faa98725db99366946c65edf5b7daff78316 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -21,6 +22,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -91,6 +93,11 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Logical Machine Operation */
+#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
@@ -115,6 +122,22 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	/* For i.MX System Manager based systems */
+	u32				cpuid;
+	u32				lmid;
+	u32				flags;
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -393,6 +416,30 @@ static int imx_rproc_start(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+				return -EACCES;
+
+			ret = scmi_imx_lmm_reset_vector_set(priv->lmid, priv->cpuid, 0, 0);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+					priv->lmid, priv->cpuid, ret);
+			}
+
+			ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_BOOT, 0);
+			if (ret)
+				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, priv->lmid);
+		} else {
+			ret = scmi_imx_cpu_reset_vector_set(priv->cpuid, 0, true, false, false);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
+					priv->cpuid, ret);
+			}
+
+			ret = scmi_imx_cpu_start(priv->cpuid, true);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -435,6 +482,16 @@ static int imx_rproc_stop(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
+				ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+			else
+				ret = -EACCES;
+		} else {
+			ret = scmi_imx_cpu_start(priv->cpuid, false);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -549,9 +606,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
 	struct reserved_mem *rmem;
+	int ret;
 	u32 da;
 
 	/* Register associated reserved memory regions */
@@ -592,6 +651,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
+	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
+			break;
+		/*
+		 * Power on the Logical Machine to make sure TCM is available.
+		 * Also serve as permission check. If in different Logical
+		 * Machine, and linux has permission to handle the Logical
+		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+		 */
+		ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+		if (ret == 0) {
+			dev_info(priv->dev, "lmm(%d) powered on\n", priv->lmid);
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+		} else if (ret == -EACCES) {
+			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", priv->lmid);
+			/*
+			 * If remote cores boots up, continue the rpmsg channel setup,
+			 * else linux have no permission, so return -EACCES.
+			 */
+			if (priv->rproc->state != RPROC_DETACHED)
+				return -EACCES;
+		} else if (ret) {
+			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, priv->lmid);
+			return ret;
+		}
+
+		break;
+	default:
+		break;
+	};
+
 	return  0;
 }
 
@@ -911,13 +1002,53 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
 	struct regmap *regmap;
 	struct arm_smccc_res res;
+	bool started = false;
 	int ret;
 	u32 val;
 	u8 pt;
 
 	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		/* Get current Linux Logical Machine ID */
+		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+		if (ret) {
+			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+			return ret;
+		}
+
+		ret = of_property_read_u32(dev->of_node, "fsl,cpu-id", &priv->cpuid);
+		if (ret) {
+			dev_err(dev, "No fsl,cpu-id property\n");
+			return ret;
+		}
+
+		ret = of_property_read_u32(dev->of_node, "fsl,lmm-id", &priv->lmid);
+		if (ret) {
+			dev_info(dev, "No fsl,lmm-id property\n");
+			return ret;
+		}
+
+		/*
+		 * Check whether remote processor is in same Logical Machine as Linux.
+		 * If no, need use Logical Machine API to manage remote processor, and
+		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
+		 * If yes, use CPU protocol API to manage remote processor.
+		 */
+		if (priv->lmid != info.lmid) {
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
+			dev_info(dev, "Using LMM Protocol OPS\n");
+		} else {
+			dev_info(dev, "Using CPU Protocol OPS\n");
+		}
+
+		scmi_imx_cpu_started(priv->cpuid, &started);
+		if (started)
+			priv->rproc->state = RPROC_DETACHED;
+
+		return 0;
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
@@ -1029,8 +1160,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/*
+	 * IMX_RPROC_NONE indicates not under control of Linux.
+	 * System Manager(SM) firmware automatically configures clock,
+	 * so bypass the clk settings for IMX_RPROC_SM.
+	 */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SM)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..e3e851d88fb069a589531ea21a3790fd62fde57d 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -26,6 +26,8 @@ enum imx_rproc_method {
 	IMX_RPROC_SCU_API,
 	/* Through Reset Controller API */
 	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
 };
 
 /* dcfg flags */

-- 
2.37.1

