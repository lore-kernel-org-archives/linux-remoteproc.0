Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF2311C17;
	Tue, 23 Sep 2025 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604652; cv=fail; b=uGFdsprnYpX60xhaw2KiPEMiidMtOQpnP3q/m+8hQVYdOaRaSv1OZWCUhXOBz2vly6QDvoxeKNdC4d0+RcU2rAIxoB/pUsKipBLFaoCa6dP4tpU95lsPWJJcV3x8g31syjXQP+lrrpkZ34PKUTHfEKqWI5OCuKzOF9QXB+n1oq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604652; c=relaxed/simple;
	bh=Vmn06J9qDOzb2M48RRKhwvGiq1Wapnk4KAxPtzIJGZM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IeuuVAMJImeiZpkNYNWg/t4gGcfq+aqX4GxF296ccZn1l3V7XsmDi0RBwZjAPLaBqd97EybjmHK3yta1uxJejIBUfAyApyKot9d8AwifxlYFMKn/upoAw6IZlwNhBdiVsP5+jNLlWoXTFPvmoPgj3M6ubfa9M8ypvtvcxDdrfA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gP1UteeQ; arc=fail smtp.client-ip=52.101.66.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gP1UteeQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzTw3cSmlS3RcESqS1QuJ3/c52ENdeBGQaL0XDLgB1Bn5IEcNarN6IuDVohEyTj9bzCd96CaTxFpnpSYQICS8WNasRbwZAPNIH/3RribpWJmLstZg8LCFzIEgRaARP+TW55wcK0rHbb3p2e/OMxSABXqwJeSGt1kycXxouf0ae29aS9axSa7bXzDK7vFYqlpXSHvXIOTNPqwk1AcisAPCu1AD4QnDSHWcjbdqwZdxTiqoB+OpZT3+5atSxLuvoMMWBQg1Tk9svKRnhL/xsAZoqEwuOyQw/bEZ0N5y9eRVNOyE8npULgtkK2zbRCA1TuOT95pOGlAY9Mc/Aqf5MCWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWDUyd1lZ+G9VdPuRc1rjIYIZ0kuqfkdzocf1gWG7UM=;
 b=t5Z/UsGrTmJ+rUXJMPMoJnVdw4/60piTbsqEdhuiy9m9MEHO5nXU7Be4ZviFHglp8DMowGRydDDCpDk/NYK5Xk4k0b8Wum44e46WKYhhdibuJlXIqjDjbiFhH3LD7Oj3k0OS/bSxJXbSFAHvOViRTyZmXxDuocsZqd8tFTvtJEl6nP+BvfOheyP8DPRlhhEe7YFOPNCNafLRbqcw9orZNsS87O0tJW1BcJinHBuS0XiuZznijvufCxzcYPawBTgqxSqyYZga5eFCP+c1dFrxRPNWP5SXVoHQ067iWP3oi18LV7/nNB/8FK4XqQC/Nz4Bvb1FGur9lKbebfp3MWLEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWDUyd1lZ+G9VdPuRc1rjIYIZ0kuqfkdzocf1gWG7UM=;
 b=gP1UteeQSt7kxMVUlIFEOd6c6YtgYDD1+U7huHjhZnTULLpbQxBpJKgqQBumleXf8UD/SlMZTTCj1xt2FmJf2vCvaddVp9zf22xSe+R0ojz0OHzRZ70T1XDrmH4dScJ8HnT4FXo0AIUNDyrmLvCN3uswlYNb1iRdgJqJYw6iGjPXbgzOYXyfbjG30uPQHAeeYO6rfNW/ld25xWC1+kWni0w00X4739YvcD1xpEVYfrWMqbFiUGIznBvjRJO7+TlVUDtf3TZISh6gsn87xWO0tCIpidCQVZIcoA2eQXn3W9zisCoPsD7A6GSHYjk4VQDiTjgXrK7GFmpko5tWxiru+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:17:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:17:27 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 23 Sep 2025 13:16:38 +0800
Subject: [PATCH v2 6/6] remoteproc: imx_rproc: Use devm_rproc_add() helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx_rproc_c2-v2-6-d31c437507e5@nxp.com>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758604605; l=1686;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Vmn06J9qDOzb2M48RRKhwvGiq1Wapnk4KAxPtzIJGZM=;
 b=qWiWQN8XUQTf8a+Bzl53xMnSDmr+7wXA7rjCm4EgUDRjkBgfReaZEearpJf/ToOd+fud4jiEU
 iCxh2bteifFDVzEZ5X5ZEBXVhorFEOlhcSBjA7N2qekH6dNnOWevYq5
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4a7c27-053f-409e-98ec-08ddfa607c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXJpQXNBTG1EQXFNQ3VTZXp4VjBoSkp2VHEvRHFWSzdMQllqL3R6aFhjTGF4?=
 =?utf-8?B?Q3Y1RHZpb0lOdWE5cGloODBUSTZpajExb3loTmlJTWxEbGxrRXZzbisyRW9Q?=
 =?utf-8?B?S0tDanVqQ1ZnalZubGl1STFsblBPRTRkdjlBVEpYM3dEQVUxYkkxWkVEQ1Zl?=
 =?utf-8?B?LzlqdHF4U29EVlJiSEVqN1NCZ0Ryb0NmZmtHMG1hUnVodWZ6b0dFNlJsMDA0?=
 =?utf-8?B?MGtsM1U0TDBOekVONjZOck1uWjRxQTBkYjB3WWJya3hIc3lOdUpTb2srVkt0?=
 =?utf-8?B?RGVScHMvSk40SWJ5b3RFZEpXSUo5S2ljdGcvcjRPRVJmcUp6cGx0MlFHMHU4?=
 =?utf-8?B?TEVMeUpSby9WUEJNcElHU24rMUdQQW8zYzM5S1hXdmJUQklYSXZ3UEsvcytr?=
 =?utf-8?B?VE5xSDRmcE0vbVA5RTh1NVBZeU9yS3BHT0MzdlJ3My9lQVo3V28zb1FpUU1y?=
 =?utf-8?B?TGtEdlc1TWxMU0Uzd2tKRGhVWTlKRTl5SWZpdVdKVlRqd2RwSEpUSHhhaTlI?=
 =?utf-8?B?WmtOK2JRN2QxU08wWmErRlZIRDhETVFCQUdJcEUwMGNzVHYzem41TmFwTG4v?=
 =?utf-8?B?eURhMTh4aWpoVzJ5SWFvVGR6ZldnZTlpditYeUFrdGk3Ym1QdDdjdk1iMjE0?=
 =?utf-8?B?TkVmbG5idlAySFoxdDV5cmFUVnEzcTAza0pTcDloRDc4bXFXdnhiRVpMQWxC?=
 =?utf-8?B?MXlmZWRSV2MwdE56MFZwYThka0RvcXpNTXBUYVFrYTlxTkNyZjlTUzdzVkZZ?=
 =?utf-8?B?SmJpSHpGc2RvdmxlZ00zVW4wZFBEWDJuNVhTSFVQaUtPTnYxNmdubWdXRWVO?=
 =?utf-8?B?aDRaMU1HTXFOelZzL0tkWmlwbDZzYisvTGVNSm84S1BCMzJaK0JNSnEvUktz?=
 =?utf-8?B?Umd2NmJuc2ZvWjBDNFB5YXQwb1EzQzZUY0RRMDVJUVdld3dudVJhRWljQkZG?=
 =?utf-8?B?WThYTzNUUTRTTjFYWmswTllUeWRBbkwvRjUvaXV0b0hZOXFhb21PdnJocmN6?=
 =?utf-8?B?NmkwODYveE9wUjZWMytNTUE4eTY5RldHSDNCSzN6Q2t6bERIOWVXc3BZclNo?=
 =?utf-8?B?M3BTUXZpVmcyRnpBaUJHRWh3Rkx5Z2JkRFAzc2IzRVI5QksxL2gxSVZDVURQ?=
 =?utf-8?B?ZDdaQjNGSzBSYnJxS3BYUHhOeFdTQnJ6WEVTaVZ1TFRvU0JZL1Jadk1wTDha?=
 =?utf-8?B?bTJjOEV5TUJpMU40aU9MalFFNUdYbHVEYWk0c0VZTTYranlWMXVIakYrdm55?=
 =?utf-8?B?c2dlUWZKU3dHRS9mbWdRV2pBeHdoNG1CRGdabWFXUldxbDVWM2Z1TkhlT1VQ?=
 =?utf-8?B?RTg0ZG90MDdmbnNpbGoreWtITVEzL0UxcG9HUXNua1NqWmJZVjRna2htcVdX?=
 =?utf-8?B?U2NveVFHSFFuUGNwS0NYRVhkS0R0RGRpQks3MDJkcFVjOHVva3JVZ0Y3Ulcv?=
 =?utf-8?B?cXc2djRoT1JyTmJETmxxdlVUZmpuTjBiNjRDVEJsRWhJZVd3dUdHaWNXdm1x?=
 =?utf-8?B?ZVcyRDhSZ3RNRlZyVUVNcGRJNmtKZWRJSDFXbVlNZmRRRytaVUtXdGxFVGQv?=
 =?utf-8?B?R2VYWlhGQUliTHdjaEh4MXkrZU5SYWNMS3VFOSs1Yi9ZVEo5aVhNY0FTcEcx?=
 =?utf-8?B?ZjlJUHM0VUQ0MjcvY3ZmSHdLRVV0S1ZBU2ZHMVd3Z3FlZDl5YUhDVlQwK3ZE?=
 =?utf-8?B?bVI4dkdiS2QxN2ZPTnVMWlBDNlpqdjVmRmxkKzVMdDVtaEl1WDhGTEc5TEhi?=
 =?utf-8?B?Z2hOdFhwb043MWsxOUNwNVpZa0FlVEs4WmFlWVQxRHBJcXk0bW1IVHN2UkZi?=
 =?utf-8?B?MVBFOVRCY214MzlHeXdzOENuc1lpWXRCUzhkWFk0aTAvMnB6Y1Uxb1Z3OFNC?=
 =?utf-8?B?RVRBM1VqRVpKOStBNkhUZ2Q3dTJPbE4xUVEvT1FtWk9zVStQYlQvVmNUa1Bl?=
 =?utf-8?B?d3Blc0V2cmw2UU8rK3ZTdWtYQ1lkcm1PemVHaW9USTc1QnRSWlhpS29ITDVY?=
 =?utf-8?B?VlJsYm05NTBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUd5NHdDWm9FeHFPNFEvdTJMZzlDaTJzbVZWa1VrZWZGQVJWVlQwTjd1L0dz?=
 =?utf-8?B?bFpORlRtU25yQjZsb1Bqbjh6SnUwRWpFSjJCVkVuNDhTajJ0L1lkdkRXYTUz?=
 =?utf-8?B?Z21IVmppY1gvWUFudUVKekViZEJQTUtjd1NzMEhPVDJHWkhGOFljS241YWRs?=
 =?utf-8?B?RFVyalFFKzl5aElteWNGamwzNnVUUllHUy9lQTRwaXRYMmsyMmJ3MUM2a3VB?=
 =?utf-8?B?SWl0dHBOR0ZWaVRYQWdPTFQrV011bnJPbldPM3hKYWlZdDdCMm5qTTh3YUh4?=
 =?utf-8?B?QXVNeXUwUXlJNWdHUi9JNC8wMVpDMFhhSG8rUzMwVy9hekc4VTRxOC9pZkwv?=
 =?utf-8?B?czNWb3h5QXNJOERCZGQybmVDSndrek9MVXVKTXZFbmpyZWZrZlhtL1JacDMx?=
 =?utf-8?B?eXZqbVFva1pOWUlBQy9kODhXWmluOXlOU0UxSnB2RkJMZWFUcVlKWTZ3NDJt?=
 =?utf-8?B?Q0dNWjF6UDhoNitvY3lYbU85WDgydm5lU1V1dDBHbmtmS1lCSmk5TDZ0L0xG?=
 =?utf-8?B?M2FvNnczTVNXUldrNTdWbmhnb2tUR01wczZ6VXZzZ3o2VVo4NzVSWUt2NHZP?=
 =?utf-8?B?NnkvSzZJUVhoTHlUUDRZS0pzZEFjSUkxbVhuaWZFc2R1c05GenpaYm1NQXZ1?=
 =?utf-8?B?dllCV2NkM2dLNjFuOGw4ZlRxS1B5YktSTFg0UC9ReTlqMGxUUEdNMVdUNmlx?=
 =?utf-8?B?RUtWRkdoMGI3MDRZTHN2VXFSN0Rya0QvVXJsM3FPbytvS1RqK1ZoZUhFQkNZ?=
 =?utf-8?B?bjI5R3VreStwRU9ZVHBiWGRvQmVBU2NHb21UcThoVFM5dCswQmFuc3FQV2VR?=
 =?utf-8?B?ZVVzUFFmTVZici9FNlBObElXRDZlUFF5OGVLWFJQMmVTU1RUMnBadnFjNFA4?=
 =?utf-8?B?U1dwSHNVZmhGbjdZUnQveWd2aWpQcWRuUWEvcnF0eXJCbmVYeGtEeC9Ic1Mr?=
 =?utf-8?B?dU5xbms0N2t5UDdUY0lvamxyenA0ZjB1aFd2ck9KaWpkbjdjeU9COXlLbytP?=
 =?utf-8?B?bWREQnVxa0s2RFFCZGFQUm4xa1g0QllWVTBwbDdtS1BaT1RHV0EzVS9CbVVG?=
 =?utf-8?B?ZnZrQ0NQUDZtcm93enc2aEN6NzlMY2t1aTkxN2t5ZURub2tsUlNOSGt4Mnht?=
 =?utf-8?B?MUlLSUJURFYxY2plS000bVRCVlBkN2Zpc1BxcUQxekd0V2FWOHZvTTg3VG51?=
 =?utf-8?B?Rnl1aFIwOEhPRkpjL3pwc1hOZ1NBUG41UG5kMDZvcFBRYkhlcXh3VU5hRFRB?=
 =?utf-8?B?eVJjRXQ4ZmtUMmRnLzlzd2FwRXE0SU1Rbk9XeDNhSk9YM3RFMmxXMk0wYmRE?=
 =?utf-8?B?UlkwMXhYd1kxeXVUanRxSWVVYTlIQlJBMUp4alc1WTU4T2l2b0FHUjR3OTYz?=
 =?utf-8?B?ZFlJajd4b2tHTFV4WmlkeW9tM2RmcVVxS1oxL1RJR3NMSlpVNlZHdWw2cHI4?=
 =?utf-8?B?Mjkya2ZjeEsvVWdnUHlMelVWQlRaNzZReXlYM2trMVZOQVVPTEUvSFU3RGdP?=
 =?utf-8?B?VWhtdUJUVE55WWdHdlowb1A4bEVUaGZPeTg0UTJ3TElZRDN1aDF4UGxHanlF?=
 =?utf-8?B?VnBWMnlTVVorWFVnc0FHWGpBSGlPS200MHpSZmxlOEE4UnRKdmNRcTdRMmVL?=
 =?utf-8?B?bHdVVmMvekNkSjArc3NMWDlXQUFaYWpKVDFBS3B2YUpSSEVZRDZMKzRLUHc0?=
 =?utf-8?B?MVBubW1HaDFGRTEwVkh2VkNpUXV2cHVGWFRUVDVXN2R0MTBEUWQrZ29GTEIw?=
 =?utf-8?B?b1c2THp5VWpYcVduTmUxZTV4NlduUlVhOTBEL3dkZk1ub0RIZ01zUUk0elZV?=
 =?utf-8?B?U05NRjY2U0RGbHFFZU1DM0FYWms5MnNadCtXVUhIbk1EYVlEaWpENXlnUVI2?=
 =?utf-8?B?QWVzaHl0UDZVaTJPTWJIRXhoekhMOG81V3RjRWhTZ3VrK2NkS3Jtb2ZJVDIy?=
 =?utf-8?B?Nkg0RUU5RlZGQWUrNXpqcEJGcHVCOXNjWHJYVEsvTERWajN5QS9BYTFmY095?=
 =?utf-8?B?S1BGWE9ZdTl4SjRxNkdFUy9oNXowdytzc3BvMFBZQ3VmUVh2dC96dEVWOXQz?=
 =?utf-8?B?ZWIzZEQwT0pMdUdSOVR4MTBHTSsvbDZKaDlNcmdzY09zRStrSlVCSnJBdFN6?=
 =?utf-8?Q?QKt38Et3ZLzOSAAzLDzoaD0RN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4a7c27-053f-409e-98ec-08ddfa607c9a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:17:27.2006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2ClEokzG5L+s1b08dkxKIkx00jcogRLoZSug5lA7g4a3op2IGLi+M/3vB34tcIvXEkEvqfi2cCvPzH8ETRZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367

Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
ties the remoteproc lifecycle to the device's lifecycle. This simplifies
error handling and ensures proper cleanup.

With no need to invoke rproc_del(), the remove() ops could be removed.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a53ff186d218f54123e1ce740b0277a6fe95a902..694fbbb2f34061de22a3a815f8a6114159585f9e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1149,20 +1149,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
 	}
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	return 0;
 }
 
-static void imx_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-
-	rproc_del(rproc);
-}
-
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
 	.start		= imx_rproc_arm_smc_start,
 	.stop		= imx_rproc_arm_smc_stop,
@@ -1288,7 +1281,6 @@ MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
 
 static struct platform_driver imx_rproc_driver = {
 	.probe = imx_rproc_probe,
-	.remove = imx_rproc_remove,
 	.driver = {
 		.name = "imx-rproc",
 		.of_match_table = imx_rproc_of_match,

-- 
2.37.1

