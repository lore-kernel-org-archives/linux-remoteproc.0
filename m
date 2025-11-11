Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D834A795;
	Tue, 11 Nov 2025 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825338; cv=fail; b=It2YXuVaxYy9LdOqfWiOjfHnY6C/tG6EMXhl9bLZECwL8oG+TXcV0H3P3Cj34bFRbiY9CbwqL6AsYclQx7TpH61sD1agQaDPH1aC8ijo1VLD7naMFK7JGvMH8SSj29pdU5nQl/YrgvCZreWc8xNXgyZyKlsg/TDtpdgMBuGkvkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825338; c=relaxed/simple;
	bh=PSKlS2Icc0z1f64MsYUkcGz1b9Z+R4WDz/pefQpi4bU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=klF4+HdqLbyvXCcISfFJW5aBou1dH4HzFgTeO/Awb0H3kWRUyyLjnhBNacIPZ4b4BICZ2OjbiBuwc/8UVS3mygbhSzUz/pubUEf8M7tOVvcwMq/DxE9BTYG88x3Nu/aZPvqGNxBG5jfCMeMvt6jRyItFCx8YefjSg0zgIYQuEqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j26Orv1T; arc=fail smtp.client-ip=52.101.84.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j26Orv1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w98Jf5Mrb56kc8LhMY9KvrjsfQg58mAITD9DKLWHXdbN+oUT77zh5uNPvOZecpnWR2VweUY7hhqdjf/mmvXtl8u6JdCB7GHZ+is9sWsnia5l5L5FY2iJNl6/xStt2D0cdqymadl0yMf5D2T2zwvGnIIM8/WyNIR4OgNV+gcO2r0r4FX6w74JSteyOaHHeyVjAMY2bMC/fyqewJQg5oFzEaRNQp/hFyDXeZn+IzC63x4Oz0C2Rx6n/0ekgwu1lCePZe4Fx+atFtFZWJXVJ5Vr/LtQG8mrSr+LbT3TcqmWXFT6Hdw65i1aA6eLS69E6Kc41gFvVBC8W8rkUI2yU+PZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY0Pt3/c9h4U7/TWiyqsYecUf3tiAGKhheuAf9PTMcg=;
 b=N4x+bvlnii+Wtld/aZu9DmC9y9trtPqT1DRucaNi/yd815awhdkCCzdKUlakdEA0ljnYDOysYYYOGJbQXF3dZfuRy6L/JpW1F2ifvrGNbN6OJTZUJSeg15y1VRr9km+Iyl58nLUphAAhYNlaZRAl/+H3VIco4RjoTsSVrzpap1pLIQLqc/lmF+ux9D4Oz+iatqYwQJ+h1K+k75A8SV5LHJ/+SX1mhH5Dbi/lX/FBdq+XqpS+29LQkf6IgIfN4vxxrNEe4ICOZKQk8I3/pTbo/Bh/WtirmdJNIwJeMNagq0908b4UhSQ3qeonULGGcJzsyDgSjNqbfRLij34LiXJRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY0Pt3/c9h4U7/TWiyqsYecUf3tiAGKhheuAf9PTMcg=;
 b=j26Orv1Tom6JTCcrJzeMpkqivEnIJDo5VVkzU59Jo+TiQvHZWGxYAyb5RYxiSuMgagwa6RNqq2blfcZjZ1RSieMzsZRxkyzLtB70oVIxRR8VxwJ9WsvuwP0qyBWY7wDuT0lMsg7jPGk47snAvN/CLvBAi/EyD/K37Dzp/60DEaavgrX8Uq/aE9Sq+jD25V1nDkon63tJML6xroYbdbQEVSvvDwb5XkNYwPLH1v0Pdk85bc2KIFhsMjyUmPGYIhZvqwrgfe2gmjkslZKtvB4Y0IMLUpohHwwA6eNO6i/7O/9ocnDnyWvUl5lTYtk4qw9mA8AzStQBMQNCnhc/eGT58w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:42:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:42:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:21 +0800
Subject: [PATCH v3 10/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_RESET_CONTROLLER switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-10-d05dcba737fa@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 073be814-1b3c-49be-bc97-08de20c38941
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1NsNjQxSWNZR2I2STBWelVWR0YxeDMvTEd3MUxtcm00TUtyNURRYWY5OE9k?=
 =?utf-8?B?S2xSYnBSMzNBbEV3RkVGdVJUVWRHSDl4cGFhMHIrZG5IUjJVb2dhUGxMbXJM?=
 =?utf-8?B?SzVPV1JEVWs0N3dxaTJCSTNNa3FpckdrRVFGOW1jb1p3dzBSZEFwR3NiV1g1?=
 =?utf-8?B?cFR2SnNGRVhWOVRNV3ZWcWRLek51RDJGcDRJZG5aNXVSc3FkaVByQXljNTNo?=
 =?utf-8?B?WitTOTBiZHdTZVc1eW1MejdmYytFQkZxRUt2dUN5WXJGQkQ2RnZWYWFjUlRl?=
 =?utf-8?B?dG9id1BuTkFxZGk2T05KVFphOVpPeHRQWmh2eDdmWWdXcWFyeHIwc01GWVd3?=
 =?utf-8?B?cFkvUWJrZXB5WTR3eTE0bDRvTEVUN2RxdkgxWHptYjlqRW5VdEVNSFdtc3E0?=
 =?utf-8?B?MmpHNHlXczRJamtjZzE2MDFiRHhlSlg1Y1paaUg0Sy9HY3VRVkZ1ZFpFekh4?=
 =?utf-8?B?dmthRFJYNkxVQXBpR21nWGpMbzdMNjBkbkZXQzE5SDN0WXRIcWx6YksrYW1r?=
 =?utf-8?B?VTd4YktRcE12OWhIdi8venY2VGxZaDIreXUxU2R2VDY2dkpmRFY2Z2N1Z3Fl?=
 =?utf-8?B?dWRtY3Q3V2I2K2dvKzVtQy9aYisrZ0l4VkFPUG52eHAyZWQzVzdqaFFyMFR1?=
 =?utf-8?B?Vk5saDIxYURjaHROUXplN0xHRFBXeklQejkrMWFtK0xkNis5dFY1WjZ1MGwr?=
 =?utf-8?B?WVpiOFJiL2EwaHk5RENUY0dreGR6M2hRNk9yMEZmajk3QVliYVFsMXRVb3c2?=
 =?utf-8?B?RGUxNTUzUk9kS0J3czJ4bHBNbEtsZW1UT1dsby9jcUQwb2RoZmkxekNWc0FL?=
 =?utf-8?B?Mld1M2FTQUg0dVZZRzlFM2p3b0xWd2NydlFFenkxMjNNUHhRQ09iZjQ3VEIv?=
 =?utf-8?B?alRtYzJWNllKSE5QcmlCWjh1MGJLVTN1SEZrT1dlSDZtQ2lhanRNUXZPbG9N?=
 =?utf-8?B?YVZYWjdWSmlYRWZPTElibWVFQWEzN04rb1l6RE1HZ3NsNk42VXRmMUNSM3VX?=
 =?utf-8?B?aCtEUDNvRXdBMHFyUjAzVWZUQWVvZXZYdE1QOTJsazhkMHRxNjNWTDlMM1JQ?=
 =?utf-8?B?SDk1VVBpZzRmTjV3SktTSFY4OThJK3g4MVR6cEYrVlZ0ZDBTcVJaTVlZcUFq?=
 =?utf-8?B?ZVZXMk1sUk43ZkpFa0daK0NxMWMrV2Q1Sk9URWQ3U0FycEZnMUFZU2VwWHNy?=
 =?utf-8?B?YlQyR1FDUk00S25xMVhZZXMwRlAxYktueFc3NTl2Zk1OemVCZVc1VkxJM3A1?=
 =?utf-8?B?S0F0QnVMRXJWRE1RWkFoSjd0NGljOEVpVEpnTDdvMENxTWVSTUJWeEZUWFkv?=
 =?utf-8?B?Wm1zOUNiUEVuN3RaSElEVllTOFduSFo3QlV2REVlWDh0TXlneG1nQzZIYUVN?=
 =?utf-8?B?cUZHanBxMTRGUzk5ZXJXc1JvWGZ2SEg2V3hJTHM2THYzcytoVXd3NG1HVUhV?=
 =?utf-8?B?dGFreXpYdHY0enpobUZlaVdYbUxKYkp3cXVvMmlLNlNoSUVQRVJueGI4UDYr?=
 =?utf-8?B?aWRiUzZJRGNwWmdYeWNlM2QvalVlWndMOU8vNHo2TkJYMzFYeGNUWDFSVDE4?=
 =?utf-8?B?QVhOM05BNnE4MndBUUo4SVpNNGFXR0xFNi9VcnMxVzRLdVlhUFZ5VDRraVlS?=
 =?utf-8?B?blNPMHJRNEUwTEs2M3hkZVBVNGVmaWpsTWxJSVRYR3ZNZ1IyRml0V3V3SjI0?=
 =?utf-8?B?R1Vja255WmhiUlRveG5xbC91WUJxMnBzS0Q3bHNrSzhXRnJBcHFUM1JpRUFC?=
 =?utf-8?B?MHFqV3prUHY0TlZhM0o1Tmo1UVZ4MnUrK0ZrQnJKelNMR2tEa3lUWUJVdUtW?=
 =?utf-8?B?THNXVHN5bjZTS21MSEJRM200VTZSVW5mNXM5TCtWY256Z2JqbzZTSEZqbStl?=
 =?utf-8?B?TEc0MTZqektRV3JCTUhTOUQ0V2UvaXZia0NzNmxYZXFNMkNWRWVNRUlKT2lr?=
 =?utf-8?B?TUdKYjRFbzFFL0xHRXlWQW5ER0hGYjRoY0tkS0M2cjJGaUtPT29YU281d2Yx?=
 =?utf-8?B?QXZTOW05ZmJNeEk2RDN5RVBaWVNveWdaQ1dpQW84dzkzNm9Ycnp6dzhyRTgr?=
 =?utf-8?Q?U1Nfky?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1p1YTdVS20xVTg0TUMvT2pyVXRlT0hGSGdtY2tkYm5MeGs3OStmeWExMXlm?=
 =?utf-8?B?eFFSYytINXdadmNWallxU2FDbE5sNUh3RTUyQ3ljNllpNGNFdzJkQlF3Q1BL?=
 =?utf-8?B?SE8yTjFmbUFsNzNRNW9INUdqNDlqdGJLaG9BSXI2TzAxRTJKa2ZKMndJK3FI?=
 =?utf-8?B?U2NpWjRhVTZ4OEQyN1g2akJpRklvOEloRVJBN01DY2ZUMndxZjNVbnBwc3Rl?=
 =?utf-8?B?TnViVUZ4bDFWblkxTTlEMnFhOU5kMUZiMzZvNmdoNmIxZkJIbDJMa2luaGZV?=
 =?utf-8?B?cEhKdVl1WHJnWmNyUlk1QVpKdnpOTWMwOGNwVUUySGFQc3d2V3F1ZWZFZW9y?=
 =?utf-8?B?cFVmdjB1N0pwYTNlcVBRazZ1TmNtRXpDQ0k4WEpXWjZ5RXBJeHFXZkYybWUw?=
 =?utf-8?B?cHZGWGJ1VmJ1SGJsMkRSVkNEUnJOSWtPbnZMNjBjbzlkRHZONXpaNGx4MEZs?=
 =?utf-8?B?T0tQNzlYang5eFRKUjRuQjRqU0trb1NoMHVYTFRPRVFQNklGcEtHZWUvQzRD?=
 =?utf-8?B?eU45NU5KZDV5OWIyblhjc3h3Zk5jOFFqVTlkRFFJaVgvUWswajh0a0I2QzVv?=
 =?utf-8?B?eU5VL1ptUm5hWXdzdnBhMGZka1h6STBTVExxd2RMd2xuZWtjODUxTkVFczV3?=
 =?utf-8?B?dmtQZktPNXZLTmtpT2Y0S1orN3ZnZEpRN1F5LzFzUXZtelFsLzNWQm8rZk9k?=
 =?utf-8?B?cWFOcy81U0hMNDZWWnlGR0Q0SmhnQ1h5alBsUENxTEYyU3RBZW5LOFRReXJ1?=
 =?utf-8?B?K05BZHJOUS90a1ExZEJ3M0dZeEYzb05jT0lCbWdVL25wTW5BdFMzaGgxVmFo?=
 =?utf-8?B?ZTBNZEtVdmpRUVY3UWRGK3BlTHVHa09LV1BzRHoxOHlLblFGNDFrNFZNNUJ6?=
 =?utf-8?B?dzJVYmY5S0VyWVhCdEVYcjhWV0ErMGFhZ2pxbTkrQ1VHRHFpZkluL3FQQ1BD?=
 =?utf-8?B?emM5YnpTQzhTVVdNb1ZxSGNCWmwxL1Z1SFV4TlRuenprVTFBQ2JFaDlZU2pB?=
 =?utf-8?B?MWtTdzY2aGRVMTlQTWtIZEpseGxZZ3JCbnJUcnZEZFJPVklpTTl2MWQ5aVRE?=
 =?utf-8?B?c052T3pFR2JXamJ3RXVQVEN2dDBRQldFd3gxS0pBYkV6TG5lMS80TmxtUUJB?=
 =?utf-8?B?VUlDRldHWHByWHNHQUpsYU1RWEhCSlYwQVEzOWlsTm5CTmNtTHhWKzVTSGJI?=
 =?utf-8?B?MWdocjJHQTh3Qk1YS0tpSWxhWGtFNkQzeFRUZ1ZZbXJORnl5Rnl4YlkwZi9L?=
 =?utf-8?B?Z1lFc04vbWZvVk10K1Yyd2x0eHJmb2FxVDN4Vi84UnlKL0tUVFUyS1V5WmFq?=
 =?utf-8?B?L3ZvUWZoQlBmU29PS2RtUEhReEFaVHU3dFlPZkk2b25BYTQ2dFRqUUxKbVFy?=
 =?utf-8?B?dFZ2Q1ZBTDBDd2duWUMrUVpxMDVNVlZMSUtUck80U0hHM1dxVEJlcXQxbFhz?=
 =?utf-8?B?N3U3WndGNEZiM0ZucUdlTWNIS1M5VWluWWxmWGVseW9UMWtxUnN5NkU0OUlD?=
 =?utf-8?B?STNtZ0JqZGlMMUFRN2cyUTNUZmZOV1lrRlhzSEhJMTFWQnR2TDdWWDVuV0Np?=
 =?utf-8?B?TVZvTVNrOHRZbzJ1bjAzWnNrdkRhc2N4WTZPQU9HMFpwWVROMExXR1pESC8z?=
 =?utf-8?B?RSsvMngvQWVuN0VObVlhRjA2VEdZV01BcGdPcEozOVoxQXlyYnJ5aVA4U2pm?=
 =?utf-8?B?Vjh3WHBnNU9hMlBYZW1ESjNSdU1NaTQ5dkdPYnJudnBBelUwZ1EwV1VQRkp4?=
 =?utf-8?B?Ny9YQU5BOEJRYmpVejJDenJQUVJjQUJlM1g4emNaditjSENFR29lTkZqNVZ4?=
 =?utf-8?B?M2o1UHFrOGlqQ2tpSEFpdmVOSzJRVXpuSUZtYWNEYjNVYUNyYnRSTGdmekRk?=
 =?utf-8?B?eDhpVlo0Q2diaFppcjQ3ZDZHL2J4dlJPVm44ZFBmUE55dWFTc0cxZUhCVllR?=
 =?utf-8?B?cDVocWlTc3ZmUkZXc3RrSUc0cDdqM01rM0d0VHRTSXgweDVIaWl4VmlTc1Bn?=
 =?utf-8?B?R3FIVk4wMXRsY1E5M1VKaVlEb3ROYWdualgvZTFlTXV4d0hCUlpxbjdSL2RK?=
 =?utf-8?B?SG5uajNhU3VzNFV5UlhvTllvMFVhSzZxd0swLzRVaHcwY0EvOE1uQ29GQm95?=
 =?utf-8?Q?MOoLMz+/VdUcPQue87jaSOlVm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073be814-1b3c-49be-bc97-08de20c38941
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:42:13.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuDnafqUfeuPq3S79Kjm2ZDSL9FMNEMztNHYU8SYQsTEKlwYua+/BcuLgjywUOwMd1I6ZXtemsO1ubqjurWXwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

From: Peng Fan <peng.fan@nxp.com>

Introduce imx_dsp_rproc_reset_ctr_{start, stop, detect_mode}() helper
functions for i.MX variants using IMX_RPROC_RESET_CONTROLLER to manage
remote processors.

Allows the removal of the IMX_RPROC_RESET_CONTROLLER switch-case blocks
from imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and
more maintainable code.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 69 +++++++++++++++++++++-----------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 91d041c15ac19f527f48c8189421f71fb7c9745e..6237e8db2eff759c2b7fcce5fb4a44e4ebaec8cf 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -346,6 +346,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_deassert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -374,13 +381,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		goto start_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_deassert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 start_ret:
 	if (ret)
@@ -399,6 +400,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+
+	return reset_control_assert(priv->run_stall);
+}
+
 static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -428,13 +436,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 		goto stop_ret;
 	}
 
-	switch (dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		ret = reset_control_assert(priv->run_stall);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return -EOPNOTSUPP;
 
 stop_ret:
 	if (ret)
@@ -1057,6 +1059,20 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+
+	priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
+	if (IS_ERR(priv->run_stall)) {
+		dev_err(dev, "Failed to get DSP runstall reset control\n");
+		return PTR_ERR(priv->run_stall);
+	}
+
+	return 0;
+}
+
 static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1080,26 +1096,11 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 {
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
-	struct device *dev = priv->rproc->dev.parent;
-	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
 
-	switch (dsp_dcfg->dcfg->method) {
-	case IMX_RPROC_RESET_CONTROLLER:
-		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
-		if (IS_ERR(priv->run_stall)) {
-			dev_err(dev, "Failed to get DSP runstall reset control\n");
-			return PTR_ERR(priv->run_stall);
-		}
-		break;
-	default:
-		ret = -EOPNOTSUPP;
-		break;
-	}
-
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static const char *imx_dsp_clks_names[DSP_RPROC_CLK_MAX] = {
@@ -1324,6 +1325,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
 	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
+	.start		= imx_dsp_rproc_reset_ctrl_start,
+	.stop		= imx_dsp_rproc_reset_ctrl_stop,
+	.detect_mode	= imx_dsp_rproc_reset_ctrl_detect_mode,
+};
+
 static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 	.start		= imx_dsp_rproc_scu_api_start,
 	.stop		= imx_dsp_rproc_scu_api_stop,
@@ -1334,7 +1341,7 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_RESET_CONTROLLER,
+	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375..6a7359f05178a937d02b027fe4166319068bd65c 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -20,8 +20,6 @@ enum imx_rproc_method {
 	IMX_RPROC_NONE,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
-	/* Through Reset Controller API */
-	IMX_RPROC_RESET_CONTROLLER,
 };
 
 /* dcfg flags */

-- 
2.37.1

