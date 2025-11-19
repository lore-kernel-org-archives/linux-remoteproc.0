Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277DE2FE05B;
	Wed, 19 Nov 2025 04:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526160; cv=fail; b=OFs4f8MgfFUUq9/s6R1tAODdShv7htXIbzhDykjn7SP0exMNooDxXotUaa/hMY6SCAdD/ED/BypkEFLNBgRfr4rKhbsK595I0ZPiMDUseeVVIoyheL1wcTPk/d11uLW8LAlM2Hp9uCtdxjt/o/TiL3ARskXDR96f/EzVA4Jt78g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526160; c=relaxed/simple;
	bh=QMSGnVxfDPECm8WbjDpJd9a/t3yuczbQZTSWKtScg0Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nzvQnYR7YJYngYmlr1Hi2Un1GaU8dnYKIkBmsfd/rjh8KKRR5U0DVla3jcL/PuGdID/fggmiDmKqgIJrhgZMoLxalgMsfGr/tK/1+NRTS/X5DVTbs4yIs5TaJWKiFMvxGB3afnLogj1sUeJXgMdWI6OPzUbbqDVF9Ydcdnble8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jkZkMg8d; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jkZkMg8d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwkdPvgL0Uxxkt7wQYzeF/sRDWJVuZftbS6lx4fM7lLiT9ijvojbyMLaLh43x7wLdMUBY5YRME4SKHS7SIqmqsNi9R+x9kvfR7IlysUFOLgFX7ABaGonney93izdifim7vWoEz7oM8/RNsjKZZu8VaCDQ2nBAvT+t0nrhngQ+O0UmZuWPt2rhU9avWxkw4ei6vt26GGm7AeFy+htqpakRew1AmvvOazalvg1jkC+7g1cSbEm2D0APtFzPqwPhV47q7Uk5dr5Yw3aXnFIt19zdQCwApwOX9VXMbkaSKMoIHcV+rTe0ExVCgtAWA2vbjqEWyNKbvXOinUzwbN4WsDp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdWWra0WXUAVz44fhyU5es6nvF78K7iJ17lQCba/XwY=;
 b=qe+wI/HBZUYGbl+oJmBMui5k6GC0j9FTLAD4F210zPXD8vX4xmJ7l78SqoGSV6a2p6kSkIp+kdlHrGAl06FLIAMlRWTcvDAQPGCspD8MYfrbHC1XQ/HhfZiMBicT4zeP9gVrbKcBd/gNX2dhm/SyGk3QRct7T2bfhl3bgw+zebzCTtjoF7Zyyi+3IA6QE1jmpQx4Z++abQFaIJUAkVh8Cc8kvkvM9SBX3Pe7M42Bn4vV99epOvg0oXCRZJ8uRnIweqD63bDWGJw5aFSvEFq+ilgVbTp7RB8vbGXNB8kcbFB+Eh8hKUkb4/3xaXybpyWNNPL7jU/esruetUvl2cssNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdWWra0WXUAVz44fhyU5es6nvF78K7iJ17lQCba/XwY=;
 b=jkZkMg8dHgV4GgmjLaZc30Fo1US3rsHwYJoE/lUs2Rsw1dob+4y7EYugWvQHf/Vf8wsBwW/jauY/ZHIeD5KJQBI88hK4JuIBqG7/5DqxcO2OmiMWKKC8vrWi7owyjsx5tEods3H5Nw6eJYhIk6ULaRb/tRHQ6ke4ff6LtQ4NEwMuwmqXIPIlKk1MsoVHhLQU5Jc/en27lNUgKB8tJmBho/uRi+4mayh8yXJI4ReQK8d2NsXsBfo4YabzzZ8GJ3Qu9ovT1Vqm3hsYtxztZhOaXAQKYJ3b0Lcw98lwgGmQ37FNi9NmdoK9PiqSIUBrvW988IYvpx9YluF6LyYvL/mbeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:52 +0800
Subject: [PATCH v4 07/12] remoteproc: imx_dsp_rproc: Move
 imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-7-adafd342d07b@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b61a3ff1-8d78-4831-9bcd-08de272343de
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WERaTDh6T3JiZng1NExSYXJyMlVjczdIa3EvUUdZY041ZHpDcXpsL1NvLzBC?=
 =?utf-8?B?V2RENWMySGk0K1FWd3ovZytBdndScmd6aHpjbHVobk4yMmZLM09zbGQ0bndV?=
 =?utf-8?B?NGhXWEFVeFNrYXh3V1FFUVVieUdndmMwVXN6QlgzTUxvY2JPc1dXNVdFWit2?=
 =?utf-8?B?c2ZBTDdHTXF6bjh6WC9YYi9rZ0plYlVLN2VVYWhMa1dnV1NpcndNU0pkQ25v?=
 =?utf-8?B?czE2bjZ2NElQYWl3Mk5taW9MU2RDeXp4Y2lJNWxIWmRkcmtDaXRIbHdnRC8y?=
 =?utf-8?B?UjV4Ni9Mak82dk83bUxsMXlNSWFEWkVqWTRYZkNpeGxZZE5QL3IydlQ2ZGZC?=
 =?utf-8?B?cUxwM3hveUMwcUN0UU1Pa0N1T3hjc0I4dEdGcVNlWlJQVERpRTY0Y2lwNzVR?=
 =?utf-8?B?Um5CMk9pc082cHd0Z1hHKzlGUUxZOW5aV3R0R1daNXJyanhvUkNURlZzaFJF?=
 =?utf-8?B?elgxNXdJcmxzMFIyZGRBeGFlYTk2QVRFeUdnenJoREJhUmhGQU1hSnB1T25i?=
 =?utf-8?B?SVZCQ0VPM01YcHJDUCttZE40bWVaNXlIVEJFQk43eWhJK3ZTWFc2L0UydEtu?=
 =?utf-8?B?NVVBcC9mRWxRVjBoTitEc0pXYWVNQWsxYS9yV0wwN3Zjd2tYMERyR0JWVzB3?=
 =?utf-8?B?Z1dxQ1ZwWmkxb0dqU3FsRjRCZnZVOSttNHQxTUFnazZNRnRkbG5MZEZ4U2t0?=
 =?utf-8?B?b0xjNVNLeFNUM1UxZjByL0hZNWZMZjlaL2JnWTZrN0d6ZXpra0R2VDNTQm0r?=
 =?utf-8?B?ODloaDhFMUtaL2U5VnVIVnQ4ZnRWOWlzdkRNNkhGMk5ZTWJuZGNERkpuS3V3?=
 =?utf-8?B?WE12d3U4WUZnNTdZM3RlV3Q1b0lLYytNN3RITDI2NFB0NnNoYzJFaW1IZzlK?=
 =?utf-8?B?ektnYklGVWY5OWpjdUJRbldJTHFTb0IwbVZIc29DQzdWY21pL0FKMnRaMUtq?=
 =?utf-8?B?QTJzbzRkRnRtS3p0cjBJNzRGSEV2dHZrVlhmbjdPSGpsOUI0QWlKVTRTSVdC?=
 =?utf-8?B?N2hOWGc2MUUxcXlldjQrdDJSdzlNeG1FUkJPWHB6S1d0RDU2dVVHdnNEL3Vt?=
 =?utf-8?B?ZWIvSktXVjBrdkt6V25ES3h0QUlGb0t6eUxtekVPZjhDSEZYa3pPQjFaVU1U?=
 =?utf-8?B?SWVYTFFKRmIwTmYwb0ZFdWhPeU1OeWdRazA4RGR2Vy81alowaWJaejAvNHhy?=
 =?utf-8?B?UVlwck52UUdRUjJqMXF5MS9CZ09wcGhhWE94MlBVVWQycHZ1eGJDNEpncy9P?=
 =?utf-8?B?REs4c1doZ0dUMTYrWWxnNEwzSytrQ0pvK1BveW52SWJvdlkwd3RCeDlqaDNE?=
 =?utf-8?B?OWZnSGZkbndEK2E5SUpPOWQrWE9BSmJhaFl4ay9Gd3hwdmlsVjBLVHJoUHBl?=
 =?utf-8?B?eHZ5SkR5eGhVNmJrKy8zeTFaVmtZUlNDeEZsYUpLZDlBeDh3SWRWVzM5ejZZ?=
 =?utf-8?B?S05ONE5xYldpVTdka1prZ3lPdUNSVWd2ZVgxQkR2RG1kQS9SeXhaWHFTQ3R2?=
 =?utf-8?B?Z0J1VXp0KzJrZ2RlZ3VLK25zNXk4ZkZZMi9VOGdEbGxoMDc0R1M4dnluRm16?=
 =?utf-8?B?NVJCS0lNbng5UWZZbnVLblRidW5HaHNyTUNLdnNvR3h4Y29KbzJzai8wSlBS?=
 =?utf-8?B?d2psdG9lRlA5aHc3M3djMCtYSm1veUN2Z0pOWlZOUHVmZXpxMU9sUzU4anZE?=
 =?utf-8?B?MHJ0S1dIdlUwTHFLaCt3d1o0ZzRtS2ZNTGxSaGJLZjBaSEJCU1RKMTh5SFVU?=
 =?utf-8?B?K0dLbVI0VFJRekdNeHNoQWFGR0ZpcG9oeXNWOHViTW84TVY4TDVOdWhFVUkr?=
 =?utf-8?B?eloxSEhwTzJkWVJMV3JXTzhUUmNzVkV1ZFRXd3FTeEpKS1M4eXUweVVDUjZ1?=
 =?utf-8?B?RWJTT2lXeERtam9lT0NqK1R5VzEvOW81T01kdWVValhhT2RHZG9VakU5TXVh?=
 =?utf-8?B?ZGFZNWkxUjJLSk9FWEVSdFFSaHBHSEo4TDV4cy8rYkNRaXJCUXJkaDcxVkRN?=
 =?utf-8?B?cmVXVlZ6WnNRU2R2WC9TS2RjUU8yWWxZdHgyME1UNDZFakhOQXRacDZyV1NU?=
 =?utf-8?B?clA2RVVnejNhRGhlVjZza1NlRXFhZU5mSHdBdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3VOc1BOMVRvSjNGS29aczY0czBkQ0RWRDhoMmwrYll6RkUxT0l6TTVudDUy?=
 =?utf-8?B?eE9JRFAxQkR0MFhPaFZTaVlDcFJzckU2dVRkb1NBODFTNWQzbmFhcXMrZ2tJ?=
 =?utf-8?B?bGhlN3RPNVlMK3BiMlBOSFN5TE04cCttZzBoM0UxQzhvTVlmSm5acUJaOWQ1?=
 =?utf-8?B?YWt3ek9qak5CUUQvb0NJci9ibS9MeDltcno2MlZ6YW01bDRINFJnYzdLeXQw?=
 =?utf-8?B?bmIwNDBkaHRFc3ZIRlBnaWJSL3Y3NVlZSDM1U1VOK3VLNE1Kb3Y2VFJVVCtI?=
 =?utf-8?B?aWhKcE93RnIxT1hjVkR1SmI1SzNEemdqZWp4S3VVanpLY3JveWhIenJ1Sm41?=
 =?utf-8?B?akRuSGhLRVZGMW1XWFcxQzlTZVJwdFhYZDl5ZHhmNUxjd0xiRFlNN29ZRzBD?=
 =?utf-8?B?Z1NMYXdYRkZIVnpoMEtYc2lkUmdWekFCak04Uzd0YTZPWGNub0lwc3M1OTZ5?=
 =?utf-8?B?RDIzaENQelhBRXNUSGN1MnJVVTU4MHRqUEYySGUwNmRYOGxLaWxqUmZNa3hx?=
 =?utf-8?B?Wll6aFA1NURsTkpPdGl1RFVmSVpFQkI1SXFYOWVqcnNJYzhoMkUyb1NVK2p2?=
 =?utf-8?B?RmdOaW5tVTA4NUNoTG5hWnhOb0JrVG5Qd1p4MzQrVHF3ZjJDMDd2a3JKR0hI?=
 =?utf-8?B?M1hQeERlSHFLNFJYNXA0ZGRRaERobE91V3VwdzkvZ05MaDVXYzFvcDY4MGxq?=
 =?utf-8?B?MHpWOGJTOXJCSzJ0OVpKUmUzc0hqNEN4c0xnSXZOT2FETnorV25Rdk1Tenoz?=
 =?utf-8?B?aDN6T0pQQ3ErQmhCS3h4cWszUWEyM2dEMGg0TlN4VVRmekZEWFEvVzhIaTRx?=
 =?utf-8?B?VHlaOHpaaEZDMC9EY1Y4OFUvVDU2QVZKaDhFdjFwTFpRM1RhclhHeWJUYnc0?=
 =?utf-8?B?azJ0YUwzam52bXhDcGFDTGltV1N0L1FLcExLb2ZuZjlmZGJCT29TdlFuWkpB?=
 =?utf-8?B?b0xHdkdhRi91U2JmMytqY2h1U0pHUDdMRXlCYWp0YmNQKzFGNVpCamRNaVM2?=
 =?utf-8?B?YUNjeGR6Q1pVWUhGdUtWM042ZFdJcktLejNtNjNLNUxKVGUvYmlubTIxRERK?=
 =?utf-8?B?LzJ3Tjg0SXRiNVdua2JOeE5LRUpmcVROMHdwcE02Y1pmMzZBK2ZnK2c0NFZS?=
 =?utf-8?B?d3B3RTFVcjl5bTQ1eFRuckpzSjJmZDc2cHRpWXBkZCtUU0hESVRmNzZmM0dS?=
 =?utf-8?B?YzNVRTBXWXVJWDlDME9yZ3huYWRjVTZmQkVIaytqTnNWWllxWWc0emlrdHhj?=
 =?utf-8?B?bHY0UW5vVE45azFESDNhU2pWblpkdURpREp3MDUrSHVVNE9yalp2aFRaMHhV?=
 =?utf-8?B?OU8zSFVTU1dSRGkrUUNIaTNCZ0dSUVF4bC9zQXdLT05BRFZ1NndlVjhwNkdu?=
 =?utf-8?B?U0FKdzd3M1B1QUJZTHFlMXRjMW9ZWkZzeUtxRkJqK2QrTHptTWsrMzFFdVdu?=
 =?utf-8?B?YTF3dm5GSXhTcHRmd3Y4MTNpWnpWT1A1UzR2WWk4dFIzUXdVTVh0bVZVSk11?=
 =?utf-8?B?U2hXUXl0RlhiTmhYV2V5V3dyWTZBVG9MZ0JGRUg5dFlSY2VqMlVNRnlBbVVG?=
 =?utf-8?B?VUR5ZmVna2dlNWV2WnEwNlZkNVc5K0ZScHdPK3V4Q3ROY3IxUDU1VUlTNUFq?=
 =?utf-8?B?L2NUWG44QnpXc0VYUUc0NGptSXRMUko1RGpsZk9QSitUeXZWSjcxV0F4QXVQ?=
 =?utf-8?B?dzBpTVl5bXdOMUcrMWkyUUlNNDJVUSs3c3phV3dSZXUvbUJtT0djQ3VQMXQ3?=
 =?utf-8?B?TkFpWmZ2cVNvUVg4WEpjQ044NE9ib0pRTXI3ZG13c3ovbG9EcndJL1M1RHpH?=
 =?utf-8?B?aEp2cjNXYXVNbEJobWNMUCtRQ0NsZzBzdTFiZUVnVCtvMnJvWklZZFJtZDFy?=
 =?utf-8?B?MS85dXN6VGFoVWppc3FYb2VaVFQrV09LYktacS9CRmRpUFZmL1NuMk5acU82?=
 =?utf-8?B?Ri9ZRXdJM0M4cDBWN0lzVGZYZ1dqcis5ZnhNdXAwS25Xc2JlUUxSS2djMlYv?=
 =?utf-8?B?Sno5WG9MTGRxM1gzSWtBLzFuSEE2TnUzRXlSeXJGZ3Y2NEk0SWp5Z0hVK0sv?=
 =?utf-8?B?RnFvTDcwQ0JzbDl5V0tiVU1IK1pjcVQyRXpQLzJ5SWlQRVFoZG1NYTMwTE8r?=
 =?utf-8?Q?9IghR8rG1vCZKyFs2yP8hi5Js?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61a3ff1-8d78-4831-9bcd-08de272343de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:35.0402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/5/6K7a2dGF9NhUSlEAAcx19+5TOSIaKzk9TkDmsWfeOuLIakvDz6TrDEDZ071TE6t29vYpGeix9eUxYFl1EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

From: Peng Fan <peng.fan@nxp.com>

Move the imx_dsp_rproc_dcfg structure definitions closer to
imx_dsp_rproc_of_match to prepare for adding start/stop/detect_mode ops for
each i.MX variant.

Avoids the need to declare function prototypes such as
'static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)' at the
beginning of the file, improving code organization and readability.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
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

