Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011029.outbound.protection.outlook.com [40.107.130.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD235BDAF;
	Fri,  9 Jan 2026 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960542; cv=fail; b=R/iTWsPvo5+ky5y7y8/xKSktOS4QMVzdnWmYrWZOTJTgRXINW5Tk4SJLxUa1qG+zlEt6gyGmbLkNDbDKmIzIIQdlgd7Ts1awFrHuB8xHv+CzypOAhdHurK0MWMBzaO/BzWDFsmYIrE3HeHBAm2sz5fA/bopzNiVYsitsEZIHp0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960542; c=relaxed/simple;
	bh=OA1xGy3ZnRg38oCJTqx7dQQ/LQ9ce0n1p5dFeKIEvmI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=evErS4DjlDv+KaE+yf6rb23kjK25RNk6e0U4e0oa2D04eotfQwk1mXJgIz9KgED8tkxYIl9ezhaATDhfyxKW6QT0G0DNU6FE8Zf/Lxue8koZXN6UFBRSle7crZ0tWiRaAvqhmYsAVzohEP3p+gj03cjXLwo+72ViG2lV5tUc13I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EQA9hqgw; arc=fail smtp.client-ip=40.107.130.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EQA9hqgw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQrPTjj61FRBBc3cByjbzDgLq0hm7VlkevxMNYBxYbO1M5H5xgp4+7CG4BTyOHn5S6zb224klRdL8eYPfHr6ExnzrdhDyfVbuvt02MYTNcJmlS6YEdp8Xg93NwTb6TYyURsV6Uu8ow4mXTvsCvOVcVQPxSPUy/30jgUp/AceAxSVn32ivQrQOjBcKoKDcq6vruauN0rkHTBgb0OinjN9e/PzcoTPhdfle5w2/6MmvHk+IZ0g2bVXdu3lrZAK4r/DapxqJvKg8oDpk0MeQoJCG4yQMk1DdXAUrTgAJ8ODKEBRwg2vbmlZmXWZgz5rR7KN2atbDobF3bPA+THv4ajZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSWP2XURuK+lL21gel8uGB/7l6iV5DBrcFu7eH03T3Q=;
 b=YYZgBuPgsG+wNSk2UgXTQN2XVna/IeCaoPOFdoCGvPdiiZ2sl4+8fQRSejvOQeY34U7L6NEMNI3VpuCTUVxLaFd5mNdm3l4glpuBTXjdZ0o6ieHfHkKyp+fOUtOJ8PXs51ihMnPWxRqNHkMpNzSsFwwUuLpAeaDlVoCcyh6X+EiJgK/W70Ct0Bp3m1Wzlgp+LASa1T2CDvNxhTzP+o6/+00PmzfK8MV1SGElM0MNR1V0xbCxP13xt7aE77pB+1GMPjxbPxxRC4PiyTuC4XIO4LToULKZlfO60EWutk7d66W/h5MVkNF9LGw4iqfoBc2JL7k0Q4LzsEpp+yyZuSjFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSWP2XURuK+lL21gel8uGB/7l6iV5DBrcFu7eH03T3Q=;
 b=EQA9hqgw1yadu2bnTM0SLL/gnBS1mhrcE5fYWMKN8eN8zOo434+ytwYoTZhjTAmwFSBUG0RNjZZz9crbLp1mIciqsRnRQI0N13rI7NIO9PfS539r6vvyrcezDUIOBbL+kThAYlqUBXOW7r1DoOhEr1ZnlrkC8h/6oIecvBlYDOFXxk3ZHG6WkN8XP0QMxTSp5yHgt62juT+V+Sux1Jrda/fyIL92UlDgEo3ihcUISJ+Wc5XeY0zzD1ZFRzCN0hV94juo9yS5L6Yxj4ivTJs0nFleb1delHMI+mv5cvsYRok/u035UqYOEnGNOQacbshwmcjN3NhaWWdh3YyH051xOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11356.eurprd04.prod.outlook.com (2603:10a6:150:298::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 12:08:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:08:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 Jan 2026 20:08:06 +0800
Subject: [PATCH v6 6/6] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-imx95-rproc-2026-1-8-v6-6-d2fefb36263d@nxp.com>
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV4PR04MB11356:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6e48a9-acc8-4fe3-366d-08de4f77dc25
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU45b3lQaDZxWW1jbi9YWVdSS3hUYTloS25PdU1rNllKcktXZGl4Q0Via2Nm?=
 =?utf-8?B?WGV1OGU1Mng3ZFpWV04zWXFhVXAreThJQWZlRnZTZGxKcFEvUUllTHFmd1Ar?=
 =?utf-8?B?clJ5ZlcyeUhCMjIvZDh1VENwS0JibjYxamhGeGdickUwUWF2cGdvVmYwZ0Ft?=
 =?utf-8?B?dTdVKzYwZTAvdkp5anhSa1hTSm1jOWVudFVnMndETU1mOWw3bFpXUGxOVFUz?=
 =?utf-8?B?bjBEK0cvcHpjNW1VSHhzRmYrL1lyY1VOV0NDQTRmOVUxdEZLKzFzN0xWTTcv?=
 =?utf-8?B?Qkh0a0xyL3dxcU5yQnFBVnEvZEJDczhueW0rODRGelJ0aWpMbExPeUpidm50?=
 =?utf-8?B?ajhQTmVzbWQxSFM0NEFpaTdpVVBpVkZTTFh3VDc4VWRjUHRXNnZncnJxNTlj?=
 =?utf-8?B?K0syVk5nTmwzZ0ZIb2RCaWFjZGpXaGRXa2pzMzFLV0JkZUYzZVhuUk9zN2xG?=
 =?utf-8?B?VTBIeHFuREhBUGhQK1VJLzUva2k1MWhNRlRJR09iQzY5cGNEOUZGNi9uek56?=
 =?utf-8?B?amRpL2Z4UEUzYWdVcm5sK0NTMGpvVEVsdXFYUTl3dUxFbnV6b2FsUjFla3pt?=
 =?utf-8?B?bHB0dDgwaVM3N2xuR3VGaGdKM0JxeXhUZ0srTFhHaTNqWG1xUE5VZ2Nyc21F?=
 =?utf-8?B?VC91YjhtSm1RMXNyNTRDQk1wUWEyNkcyR2ljMkV5SlA5KzFSY2JGTE1QQVpi?=
 =?utf-8?B?WEUvUmgzRXRtOTRUZE5ZNEZCT2NyMWVldHNORTZ6NDFJT0o5WWRMMFJicTR1?=
 =?utf-8?B?SHVobC8xbmNLK1d6UkluMjhkWVdWdkZQaFhzbWNMNWdSY09wSUJJclZ1eDBB?=
 =?utf-8?B?TTA0VWdmYUlpcUMySFlybFZxVFFTbjlYcWN0MWFoTTM2bUdKUkk0anlOdDJD?=
 =?utf-8?B?Z1ovK2lEYVFDbFRYYlRyV21Tc2hBQUNMcTNpanJibkJqcUVmSjNnNGlueGJX?=
 =?utf-8?B?T0pHeXdIb0xQNUdZOTdSRU45TFl6M3o3KzBaNW1pTUVSNytKNDIxcE5zbkJx?=
 =?utf-8?B?QVMvWGFGUlpmTTdiRmw4SHdMWVN3NW0zU3VqUjhDUUhYYVpSZjd0U0dJTzZU?=
 =?utf-8?B?Ung2cm5RRlBQRmRmaHZhWHVwbkl2b2VxM3A0RTdRKzAveVNJZ2U0YytOMERn?=
 =?utf-8?B?Q3I1NUF1Qjd0ZFlZWG5GUDJ1RkJKRHJla0F6VGlkekFQbUVBSUxuWWV0Y09u?=
 =?utf-8?B?Ky84eTA1NnQ5WkNpYi9rNTNmNUs5bVJncGlQSVVJL21hbEoveWRGTnlvWWJo?=
 =?utf-8?B?VXZmSEVha2NtT0FVMXlKQ0NKR3UwUG85UlJaRGtFeUpjVXZaWDQwQmhxT1Jv?=
 =?utf-8?B?NytWUXFCN0xwWkZFbUQ3dTlkYWZJd1JpQWtVY29HWjdWZHRSZWJBUDk5dTk1?=
 =?utf-8?B?UU9uQXNmcExma3kvamZZVXVPWElGQWVjd2hIZDAyWFIya2xDNW5TWUN2cFVO?=
 =?utf-8?B?OTJVN242bjVqTURoT2hRWXFZdWlnaHZCT2lJOHc0SGhPNEloNzVlUWFnaGV5?=
 =?utf-8?B?SFNzSDNmbEYvZ3NMbTJqY1p5U0E2Sk5yM1JxWGZpY1QvL3FUQURuUi80K2Rk?=
 =?utf-8?B?OFlQVzJBa3RNanJ3bnZGZ2gyU3RmY3l2b0V2STgyZG5ZUWpMZjgxMzd6YzNl?=
 =?utf-8?B?SzB2bzdTdjdQVC9Ta282UEVEVHM4dkQ0Qlh1OUF3czRHSTNkV1hjblBuTGpv?=
 =?utf-8?B?bjhiYmswMUNRdDE4eUt5enhuTE8wZ1VuZCt6bzJ3N0swajYrMStEZm5CVjNE?=
 =?utf-8?B?dGxFTDUwd29KVVY2UnFycjUya0Ruci9EdzUxS003VUV3M095dEdVMThnWGs2?=
 =?utf-8?B?L3YxY0d2MldJeXFLMmhVT0hHUmYvOFo4QVp5dUhFVzZ3bGN5Y2xRelE1c2l0?=
 =?utf-8?B?WWFRRTlRZjA4ejV1S05YeUJRd0hXbEdjVEl2ZWZxRUM4cUlYWVBFWEdVdG82?=
 =?utf-8?B?UXlyK3JpbEpuNmZibm01K3RCeEYra0lIM2pONjR2dzhMZjRUOTVPVzc1QU9t?=
 =?utf-8?B?VmMxVGkySzFmcEs3ZDlLRjMyRzNNYUI2b0tsTmo4WDdoVUpHMktYSWxNLytw?=
 =?utf-8?B?d1I4M2t0eXl4akR1OHYvQnRXRzd0NGlta1VWZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qy9jckdVZjJCOEtrSEdlWm0wcUUvbHNzN1AzRjcvblEvVnl2c0Q0MmdySy9o?=
 =?utf-8?B?dmV0VGNJVXd4cmR3di9PeDFNdTNGd2ZQQ2I1b2Y3QWdHYW0vTU5HOFM4MllO?=
 =?utf-8?B?Q0EwNDFvTllJMWRqbitUMHB2NDdLU3ptQnNwTG1pNUJUeHFhSytGNThSTW9k?=
 =?utf-8?B?b0dRZ05kTjNtbm42aGdMOE0rdXBLNzVnaEhEckhpdnNzeGxBa2NRTERmV0Ft?=
 =?utf-8?B?ajdsNWJoSnZMRVZlc1NwQWNQSGRnTmpqbk1Kc0t1R2YvTHFzYStOLzlJVk5Z?=
 =?utf-8?B?YTQzQ0VyZkN3RWlCUEhjcWdGU3pHZmlsZGEydVNid0RiU0s0RkdIeGZqRlg2?=
 =?utf-8?B?WnNjUGFWNzdjUzVLRUVEaTdzL3lQS1ZSS0JsUVd5WHhxRmFLb1BRUFBqVzdL?=
 =?utf-8?B?dmk0TjNoemxIWWFYZ2JGbC90bDVQWTZnSlA4UFAwTmlBNzZCbElNUk5FYm9w?=
 =?utf-8?B?TWM0K3BybEVrV0xDRy8zZ0FVM1lpRktJT3ZmcW9KNjJ1a0gxZ043U21vUG41?=
 =?utf-8?B?ZmNvODNzUnp3ZG03bDU4TGEvSnRGUXNodk1Ia0JUQVlJblFQck9tNHBHSWFr?=
 =?utf-8?B?TFR2M3lEaFpsaFR4ZkVTRmptVFVLZWxPZnpXSnRQM0UydkdQVDRab1JOaTg3?=
 =?utf-8?B?OHhYcTlLVVJwdXozWHVTQUdSY1hqZEdabkE1L295TnlCcDhHRDE4OGxzYTZC?=
 =?utf-8?B?dE5kNWdnMEhpY0dPNlFGYzZrOU5sREFlazZodXFyRE13eHl2NmtwN1ZuazU2?=
 =?utf-8?B?eUo1VGJjYkRKeVZiUjhBM3p3VlUvSzZGcFQvdk93MUgrVGVwZi9GSGFBMmtt?=
 =?utf-8?B?d3ZBenY1OUFRc2pQSTlZR2xwT016bDRzalBqZjVLY1VBcEl3dHREMjNmd0Ir?=
 =?utf-8?B?VmFNRVlLTFJRZUpWaWhoWGFyUGV4aHR5WkE3akoyRWJhc2pCSTFYVGFGTjRq?=
 =?utf-8?B?LzU4emh3S0FwczF1aGkxM1hPanV3azVwK0FrYlIrUFNRUTZlbG1nT0hPOHF6?=
 =?utf-8?B?Sm5sZURpdEFiemlvMmYwNDBlQ2NhWStzbmZXU2hVbkZsbnpMSjlzZS9ScjZj?=
 =?utf-8?B?WHhvdGc2OGd1dm8zNGlqY1NsOGUrbStKbVlFVWJ1cURmUGtKa0lQTStWWWVm?=
 =?utf-8?B?VEF5d0R0TW5xZXlTVzVnN1RUbmpYeVhPS29EdmtTeXIrbjlvaHcrOENXQ1NV?=
 =?utf-8?B?Z3FNT2ZQVlZ2cjB3U2JsL0JZZzVyTGVINEJ2SzVBMzVlSEpQM3dPY1ZhM0xU?=
 =?utf-8?B?RWxoM1g4TGx3MDhvb0x6bm0vOU1CK1lQR3lkckF3RWgyZWlqRDRWc1hTQnFV?=
 =?utf-8?B?WTc0RklKSSthMkVJRUpJTllKR09OT2VLZWVHTGdtSjlJN29YdTRZTGVaVGpy?=
 =?utf-8?B?QVkxSkhtRXd5K1AwRHVWZ1N5a3BSYUF2UWd4UUExelowQ1Z4bmthaytURjdp?=
 =?utf-8?B?RUNSVU9MZWNGT3d2WnBoRUpFRTdGVkJQSXB2Rm43bXk1aUZLUC9oenFIalRL?=
 =?utf-8?B?UktGTjlIZjZ1M0FjQ0ppU0dlZk81QTZndVRnUG43SnhoRXhkR2RtTms0S2dn?=
 =?utf-8?B?TDljajJXb21nYjE5cmNtdFRMK1JVYkhtcVZPRGJZTGhWN3JoY2l3d0pqbi80?=
 =?utf-8?B?VkRFMER6c3A0aU51bzdGRi9DRGZNNnVvRzUvRFlaejhNY2M3VEQ2Si95V2hu?=
 =?utf-8?B?enNaS21OclVnTlFRZHdWNXFka0tzblMrNVZqUjcrMElXTWgvb2F3MnJVYmoy?=
 =?utf-8?B?cW13LzdTVm5nQTk0T3hsNWJWbm0wa1M5S2E5QnpreGhkY2NWOU4zakhnV0o0?=
 =?utf-8?B?SkNrUkk1VUlvZW92MlQ0TzdvUGlzMEwycUxlZHhKVzUwUjg0RUVobnpLREJZ?=
 =?utf-8?B?QnhFcmVjYVdrRnljamRkZDRya044dkRzZysyZlhuTjdCOU5jcm5vUWRYeS9w?=
 =?utf-8?B?N2Fha0hUendDR2NyVHpwS0xuUnVybDc4bzdQU2cxbVFRNlZBaHFLU242aFFC?=
 =?utf-8?B?elRaNitLWWp2NnNnUzdiclZzcXhOaUxYQTlDQjE3c1hSdWppZUE4UHlST1Vn?=
 =?utf-8?B?QUQySnV5NDVUZDQ1R3FRMVY1WmN0aUxGak1sdEZuNXFSUHRibjJMYzRsRExx?=
 =?utf-8?B?dHVxRno4UnhlUGxzUU1ybmRZV2VqdkI2ais1N0pTREEvRW0rdVAyaU91azly?=
 =?utf-8?B?a0dZM2Ruay9pSkxrUWZvRzFOVEhiNUdwSUNCdFdCd0RGZHpRdy90MXFldVFt?=
 =?utf-8?B?UElvUkluOGVoanFXbXpRWk9pbEp3QXBzUXBUb2NzaXZwZ09STzZrMmxDcDFj?=
 =?utf-8?B?N0tPRUF5MzRrNGd5cGFUK3FXL2lBcWY3cmxoTVYvcXJubm5hVlhpQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6e48a9-acc8-4fe3-366d-08de4f77dc25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:08:54.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buYl8W/iWWvy9fcVRluIIECb8yRWS443PWharLlqO9HzNiDa2HyjDVi3aAUcE142se8EAT3y3CyJ3FMOUSNW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11356

From: Peng Fan <peng.fan@nxp.com>

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 09f168d9ebbecee5d26b0ed4e3523f0030275f31..375de79168a1c8d11b87ac1bd63774a3feac106d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -133,6 +133,18 @@ struct imx_rproc {
 	u32				flags;
 };
 
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
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1435,6 +1447,15 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	/* Must align with System Manager Firmware */
+	.cpuid		= 1, /* Use 1 as cpu id for M7 core */
+	.lmid		= 1, /* Use 1 as Logical Machine ID where M7 resides */
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
@@ -1449,6 +1470,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

