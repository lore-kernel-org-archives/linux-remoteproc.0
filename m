Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8071234889B;
	Tue, 11 Nov 2025 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825332; cv=fail; b=uA4rqVvIcMTm8bFba7BGR3TymNP6XVhTSfQNc68EIWnUxOF+7CU+g1CKuX2e8RMwYEKGA95E3+R8j0oSitgxqzY7fuCDIplAXFcReuL1UXMkfO15fyErSL0NOZof8J90XEeUYV3oHff8GAO8OKv0TxZShQTL9d9x9ZMaIC22nZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825332; c=relaxed/simple;
	bh=BQXomjOXVSFSIkRQJERKjKFthROEP85wpBffuxfl6w4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K48gcRVqAuyVAiIBoowYEVWIBsFQ+/15IWFnMA3/DcJgC5fhTewQ0sTGfR3kNrgyGEHMYCStQ71pFy+Gtf/XLRbL7avVSVm22Jom4mrDcNP1ux7JEdsRE1snQWbNkd1/ZEmJN50wdf6Bcw+60dwk7DeM8WyT6jThlKMOjZmCcb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A2GkJIvv; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A2GkJIvv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9jdhEOZ5XkOgBISJVcCLzMFed02Y5MTB3Nvt+FAmEtp+D46pGAd3d4XMKkDF3uskD8gJGE7zjU4LQJoM9SpA19hKQsQn/7mUhFxLdKOgtB8WAVJt/k7mo03pOZkkkQN6uVaOjpFZhymgVUhMe2lRF2++Y8A1rQuysIieGuOgHC8gAWc+/9xt4Sh/Tgby3Tj1boZP4UTtShRApsuYTNeqNKRYkSdxf7IIIo+qmMQiUptG9bglu/qVusAxn4n2zzEk+nU/mGraABZvjbwBLqVEQq8B0AYo7CzA2Q1D9KbXJhJtPZZJrQ2ytp6e12poanjHJ6l9Cdl2sm7S+dhDpqNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mY1mjf1VbQRcyElK4muzJlLBxfXOzLmtd0WhQQid9OA=;
 b=L021tSj9cayQjTSxNOZ3QWEsTk70d8dBP7Y2kwUHnRxFl24ptIvwSYD2qm1+T9Zj6jE4S6Kh0yuEF3ejgo3whfYfh4Zp6vYgcLLCxDTFWAJjp5VtEMRlodWz84W9/zrGdxZ3X/0DLkGCpm3mjfIYd04X8wCFoAazlXeCfsnhOONTUYZDXfBr68eqVFs3PNPxr9P/kEiVuLlj1Ek3ZGv+iov+43fT7DGfQmHFpKj9lTZBdf1v50EWATgcDHc4ONojsAojzWXfdQZHNgO7z5GFi/7PxQJ7J3cA0R6/dUFAriNtdG2zhUtE9ZsH0wDB2bjykC1mRILugmU1YseXA4Sytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mY1mjf1VbQRcyElK4muzJlLBxfXOzLmtd0WhQQid9OA=;
 b=A2GkJIvva7SyuyhK3flD18GprPl82Yz5gVkmEsJsltyIhIPTJxwVQXf2Yisx+1KaU6Nj5k2qD9D/wpCDg+9HjkD/ycfnmB+NZiTQnhkeguU1RIWpq5C2MDp+xAZPpYQ9APbj6yViEGjVIc2XHNd7DbmmnCYt5XJMj9PNxKBmvV/JkbFPXhdcQE6sk42lWC7rMCMkfkz37axfSRVNwLxxQ466PRZNB5k4FOG5gRcku+w4tq2OR5seNMM6KD69eDVQC1yVJmlPerMmwuWg/cq9bZuP69+en9LQYvZxTQkyRVMs20CbPHj+f0V0WzXl/DoXAR3U//I2X0k4aGz0lHT9aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:42:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:42:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:20 +0800
Subject: [PATCH v3 09/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_SCU_API switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-9-d05dcba737fa@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3361b4-91fa-4417-eceb-08de20c386aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmQ1UnFRTTg1dE1aRW9ZZVI4bEc4amJIQldGZWJmYU5keXR5ektkUUNmZ3dy?=
 =?utf-8?B?ZnQ0cVc0cHRFSVg1YVZJZnBmTWdqaXQydlJ4Tkg3b3JCeWFhTUIwS2JpZDZh?=
 =?utf-8?B?VmE2L2RRNlVYTEFFaXllVTFSS0xvVzRsUzhFRkpzNnY3Z3FPZkl0SWN2ZVc0?=
 =?utf-8?B?TXI2TXNEaUZZZ3VMMFBoblVRUDgwRzZFc05GUmt3WlYyVG4wQWJlYUEwakMx?=
 =?utf-8?B?N0lrTkpKdWZGYVVxVkk2anpaRGc1bkpjV29rNGc3WHdlYkoyZEtJT2l5UTZ1?=
 =?utf-8?B?NVpQZ0lJMU02ekNTdlhQTzRveEdoVHI4KzJkS250c2Y0OVZBRTJvTk9Rb2Nx?=
 =?utf-8?B?aEQ5UTBZc0JEeGxYaW1qbU9SS21SckhNM1NzV3lYSDEzV29yVkxKMUY0RzlN?=
 =?utf-8?B?VXpHM2hCZ29WeUE3Vy9YZ1hFUTdzM2ZQS0tpbFlhcHJlSTM0NUs4aE94QVBy?=
 =?utf-8?B?UmtHT0lxTG81QXlMTTQ5L0F4eENvbHg0MHpQVnREL2d2S2RIMnZ2ekpza2JF?=
 =?utf-8?B?bGlVWFpEK2oxZmdjc25RdXhQbzk3TWROaFpXcHVMM0YxVW9yOHpHajJFMER5?=
 =?utf-8?B?UURwZlQyU3dFZWZHYUl3TXZ1VWp3QUJCQ3c0dG55UTU1eE85UUFvMzdzaStV?=
 =?utf-8?B?KzBaYlhNY2hpRDRGaHk4aTFwVWxtNFFndHBzcG9xc2g2QnlsemN3UzlocTdm?=
 =?utf-8?B?TVdDZ3N4SFpyb2p3VWZBRHdObEM1Q0RsdEg5d1BUVml5bXlTZTRtNjF3Rnc4?=
 =?utf-8?B?MzUyQVV1VmNuN25jd2Z6VEpYZ1VHZ1JCblBUK0lvRzlkWjhKSFZ5bXduR1ZO?=
 =?utf-8?B?SXkwZm9HMEJoLzhLSW9pU2VwN0RUcTRTaE4vSFkwUmlydVRyWElZc21Gakky?=
 =?utf-8?B?YUduTnA0SVdnR3RYZ0dORFZzODRFRnFmbC84M3RiRjVzbGg1TjhlRTQwdTZ0?=
 =?utf-8?B?OFMyc0NOWVMzckJ4bUh6NXBXRjYya0dLa1cxVGh3ZDUzZU53QWxpU3c1aXNl?=
 =?utf-8?B?NEswVDVrbGVXalNhZkN2dE1EaFJuQU92RDhrcVJOenVBNzdnWGgrVHFsYS8z?=
 =?utf-8?B?aWVEcS8yMUVLNUtWcFp1TmVHeXhEOTMxbkovZWNDRVQxa1dZeENpOHdraXlw?=
 =?utf-8?B?bkwwZ2xMVHBvd2VEamVsb3VSNmxhZFJPeTdqTjZyUUNDaDBFbzBRMllrNDdv?=
 =?utf-8?B?dG16aGZkOGJXZHBlYVFVeUluVnhZU29xZmFlS3BSK2p5MXdOV01Nc0xsNFUy?=
 =?utf-8?B?YTNIMEN6cXBrS2Rtb3Y0M1dCVUg3dExsMUx0R3E1bC9SdmNneTdJR2J6ZWky?=
 =?utf-8?B?VE9EdG1Yd3JxQ0pBRDBLcDdQZmJ1ci9HbjZGRUpuL0JOSklXZzYxR0oxZ0xX?=
 =?utf-8?B?a3hPKzl0dHRmaFBScUh6R1A5N1FVcGo5cFhwVU5jSmhGRGgzK2JZbGo0ZE5u?=
 =?utf-8?B?VUpkRURQSWVmSGdtRUF1aWVyU05xQ3Zpd251TUJxN2VEcjBJMTNhWnhKU25z?=
 =?utf-8?B?OWI4UnRENlFic0lGeklGbGw1NjQvVHdXd1ZhR2U3VThhU3FZSVJZbkVyTGNC?=
 =?utf-8?B?aVYzbTFzMVRHUU9ibWFNVGJQTU4zMU85bUx3QW85RWJLWVlGUEJOdnlYQVZJ?=
 =?utf-8?B?ZjJyOGdCMUNlRUlrZTRaQmtiN1UxRENteXRITWNBVUFGN3ZRdHB1c3d1WVpS?=
 =?utf-8?B?K0ZPSHNhL0RRZjZVZDZWSGpDVlBIVFh0MUJZZUxiUzlwclowN0dNQ3Q4SlpX?=
 =?utf-8?B?NFpoTStNSFBLSllrd0k5ZTcwOGJHcHZ6aEM5VjRLK01DYnRWekJTVGxEV29M?=
 =?utf-8?B?MG1KNUVaTzcra0hMZ2dzUDBOWFpRR1NrNmdxb1ZBd21NWlpTMXcyNXg2Nm84?=
 =?utf-8?B?eW45RGNzOG1KMEFjUkJid2FxbGRiU1hDVVdxYlBPamdRLy9TRGhtVU8ySTUr?=
 =?utf-8?B?QjFaVU1FbDVPT1laUUtvNGI1RThWZFdDSmEvTnAvZjhSQ2lFQnVITVBvQ3VX?=
 =?utf-8?B?YlNqR0J1azNLR0d0Q3RDak11VTBUU1ZZYU95cFMxRFQyYkxQdWlFZzNrOFVX?=
 =?utf-8?Q?BcrPXQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUVoWUlEU2hHczhsMUVVR1F4M2R0OTdIYnV1SFMxb1lsZSszK2tWY0xNTE50?=
 =?utf-8?B?Q3ZYcjVjVGFRQk9KS1NFdTF5ZlZDV0JZNVFlY09UV0xFMzF3ZmZQOS93Y1lT?=
 =?utf-8?B?YXp2RlVVUExPSENVbzJDVnpFM3ovSlpORW12M1BTZ0lySERYQlVTYWkrWmx2?=
 =?utf-8?B?cEt2M0xUOHpVN2RTeCtjcU5oR2s5SVVVYXQzVGlTd1FoNU1BM3NGRmg3aDJQ?=
 =?utf-8?B?d3VVOEhFbnA4K1hoNjMweUpzRmpDcTFpT2NOWnpvQU5rbkx6Yk1wZmJRN1o2?=
 =?utf-8?B?NjhORWNoQ2x0ZGtKL1UyWmlFYVp3YmxDUTdkME4zTUk0anZSSlFrR2hHdjRT?=
 =?utf-8?B?TXIrM09wRjcxZTZpZnBIRkM1T1NhWmdwdjV3dXllb0ZiN0Z2TCs0eGtZOGZJ?=
 =?utf-8?B?eDIrUXRyYzQyOHhDcTkyUG80MTdxdkg4VXZINFFUWXk5Mm1lWHhOMXJUc3Fo?=
 =?utf-8?B?N2x5N3d1Y2dVcWN1M2trcjVtSGVSZThDVUQwWk13bTFUNFMyUDUrdFI2WDRL?=
 =?utf-8?B?SmhLbWx6bWsvamg1MkZoMFA0SkxuazQwcHNPeFRBdkdZVE5aZEk2bXZXZVhV?=
 =?utf-8?B?c2FYQUZnODVHNWNWbkxXZENwdjRaeUN5cnpySlk4RlFIaHY1bVZoYnNYMmtE?=
 =?utf-8?B?QVg3N2VJTTdmQXhtUk95aFJiQnY0UFE5YU8wazAvQWNGbmw1MXZUTFZEM0xy?=
 =?utf-8?B?WUJHa3J0eGZFTkZjTm5LTVEwaU9TZFM3QW1aajV4d25YMUNlWXcxTkR0Q0Qz?=
 =?utf-8?B?SjNwTFBNYWVQSmtseWJneXRlcENZV1M5NmpPTDhPcFRBNEdUanBKWFVuL0dU?=
 =?utf-8?B?aE52bUJmWFZNT3JBc2lTbEw2ZGo3cEtDL0hjTVBEQVpWdWZseEFleXFzdHJB?=
 =?utf-8?B?OFp0Rk1aOFZjajduTDBRUjA3YWR6SDdFbFBaUXZmOVFNQW1XWThzUnFIM0ls?=
 =?utf-8?B?ZE1odG9qZGFkVmlqRi91bmdIdWpONlNrRlRnRFcxbjVFUFYwS0oxbkE5ZC9l?=
 =?utf-8?B?Vm44TG43eFo4WkJ3M3pBdDFjYU9uV1JiZVhRVFNadHNnRndEMTl4VzNxSmlL?=
 =?utf-8?B?RDY5Mzh3d1pFc1pSSGJpSndsN2pBdHR2M3VhTkR2a0hPN0ZnM1M0Z3R3RHJK?=
 =?utf-8?B?UUhUZjZEdFFmUEN5TkMzSGcyeWFUcDZ0SENqZHNmTngyUDJ5L0RwdStKNU15?=
 =?utf-8?B?UlRzbVJwR1AvYno2YW8xRUJ5Rk5Zckpwang2NDY4a3AyeDlETGZWKy9lU1p3?=
 =?utf-8?B?T3BBSHlBYXZEcUNJVVJUemg4L2RuRG9acWRRSXlMY0kwWjNkK1VTZXlBeHFu?=
 =?utf-8?B?Ylh5TUN2cXNaZGpZckJad2FjdFQ2REtSZ2NKdnZWUEVja0hOK2JiQjJZc2hZ?=
 =?utf-8?B?THBOQm5sMktVNVZ5OVF3czIyTTREaCtIOGZFbmdNNEd4eWxzZCtiUExiRGVk?=
 =?utf-8?B?RkR4QkFOVWU3YzJwT1R1a3diK2lNbVhTQlptSnFPbGpVYm1VZEMycTczMk12?=
 =?utf-8?B?Mk5GWGduRVkzQ2RQbDZ1QkZzVG1aTytoajR5QnNnUHpkVFROQ0ZpUDYwQVBF?=
 =?utf-8?B?UDdYMGlPOVRLUXRtK3JwdGdoNkc5R2lhRnJSWUJDbU44bWEyTkI3UWZJc3Ft?=
 =?utf-8?B?SjdqeGlqdU50ZU5NeWovMTZYdk5vemRQNDRpTEhPSmZ1WDNLRU1JMFlNNUZM?=
 =?utf-8?B?VG1sUlFORTVEUnM1amFiWCt4U2dlRVNseFVIYmpJSTZBK2dRMytpcnMyVG5V?=
 =?utf-8?B?TWVKT1BnM2dJbGtJVnVZMU1MMm43cnhwYU52T1hqdzArcnBTQ1lIMkpkVXJC?=
 =?utf-8?B?Uk55RHlLOHV1Mkh4OXJWbVRlNlZpRnBZcXFnZSt4L0pQeEJQTlNITHBLVGlG?=
 =?utf-8?B?Yk92blZDSHJ2WnhUK0xkRUJRZTFpdDJUOUQyQkhlTjY5R0o1MU1lNWUxYmF1?=
 =?utf-8?B?TTZNZjRQZVVxazdNa0NzVzNtaXpwbUh3NUo3NHlqU1hCRjZFY3E1QStmL2JB?=
 =?utf-8?B?WlpUMWx6WG9YWkh2ZE9qblBpcEtmcVI5VVp1TXd1Z1pXVEtVYmNpSGtWYjRW?=
 =?utf-8?B?YmpXeHJQVDFFbDg4ajkyNFdyZnpyOC9hRVlWTXdGU0RaZlRrNE5YelBoMm5K?=
 =?utf-8?Q?A9WKsZEXhEDFRuqiFOPb0qJIK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3361b4-91fa-4417-eceb-08de20c386aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:42:08.4764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tco3cp+vmrsidZ3JIJQiX6yQ2NgG0aQG2Esw4pFiPm2LOkpawSdeY0CcQgSVdZMNsK4HjeoMQvM6l5CTFb97sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

From: Peng Fan <peng.fan@nxp.com>

Introduce imx_dsp_rproc_scu_api_{start, stop, detect_mode}() helper
functions for i.MX variants using IMX_RPROC_SCU_API to manage remote
processors.

Allows the removal of the IMX_RPROC_SCU_API switch-case blocks from
imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
maintainable code.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 48 +++++++++++++++++++++++---------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 71776816c3508a86bf7b8a09ac45827a83a7bb3a..91d041c15ac19f527f48c8189421f71fb7c9745e 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -346,6 +346,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, IMX_SC_R_DSP, true, rproc->bootaddr);
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -368,12 +375,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
-					  IMX_SC_R_DSP,
-					  true,
-					  rproc->bootaddr);
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		ret = reset_control_deassert(priv->run_stall);
 		break;
@@ -398,6 +399,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, IMX_SC_R_DSP, false, rproc->bootaddr);
+}
+
 /*
  * Stop function for rproc_ops
  * It clears the REMOTE_IS_READY flags
@@ -421,12 +429,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
-					  IMX_SC_R_DSP,
-					  false,
-					  rproc->bootaddr);
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		ret = reset_control_assert(priv->run_stall);
 		break;
@@ -1055,6 +1057,13 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return imx_scu_get_handle(&priv->ipc_handle);
+}
+
 /**
  * imx_dsp_rproc_detect_mode() - detect DSP control mode
  * @priv: private data pointer
@@ -1078,11 +1087,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 		return dcfg->ops->detect_mode(priv->rproc);
 
 	switch (dsp_dcfg->dcfg->method) {
-	case IMX_RPROC_SCU_API:
-		ret = imx_scu_get_handle(&priv->ipc_handle);
-		if (ret)
-			return ret;
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
 		if (IS_ERR(priv->run_stall)) {
@@ -1320,6 +1324,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
 	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
+	.start		= imx_dsp_rproc_scu_api_start,
+	.stop		= imx_dsp_rproc_scu_api_stop,
+	.detect_mode	= imx_dsp_rproc_scu_api_detect_mode,
+};
+
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
@@ -1352,7 +1362,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
 	.att		= imx_dsp_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
+	.ops		= &imx_dsp_rproc_ops_scu_api,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
@@ -1363,7 +1373,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
 	.att		= imx_dsp_rproc_att_imx8qm,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
-	.method		= IMX_RPROC_SCU_API,
+	.ops		= &imx_dsp_rproc_ops_scu_api,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 912827c39c0dedeed76c13740efd42a8e7cf9c45..a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -20,8 +20,6 @@ enum imx_rproc_method {
 	IMX_RPROC_NONE,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
-	/* Through System Control Unit API */
-	IMX_RPROC_SCU_API,
 	/* Through Reset Controller API */
 	IMX_RPROC_RESET_CONTROLLER,
 };

-- 
2.37.1

