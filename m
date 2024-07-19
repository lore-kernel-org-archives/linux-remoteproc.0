Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09B7BAF7;
	Fri, 19 Jul 2024 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378412; cv=fail; b=h6tGgtbNGfW1TyAojyENFlEOd784t/Czorsr1hiFb1tWmLi4g7k18HotAlYLa5b9WH5goQ50Bcsna3SoDjXkE8rUOuWXq1MkEQdbG67Tkp48PvXornLESIjuuEoThxm54zWTCYlHAQgDrL0o3pgDshpbgSZnL29yvjGsgWyu4HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378412; c=relaxed/simple;
	bh=KYyEfSPq7YTUfASdWBxFNDvg2GrfN4Fd23BsX7GvZFk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uY6WBBvEtf92Yq1DZtELujuCCO9mN5SPo4lNefZ9pwdOBcBD+isnP568BSQNgmqzvwRcSuXiefQl4OMwKvOrFI8cq8Eu+ejnvF9TspUoqiSYYaWwBUxyj9iYkGxTBkpLbtURXK0iv4W9pW8ZgrglpNps0IYrYwkM1rcClIwBUoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RHZ5Y5J8; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RHZ5Y5J8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JytShI+csmUPQFmWxejCjcaGPdtYdTO2K37x0DwFJg3Ej3OhINk13ZD60AcnIyymwWkbB+kKSnJI/hITVoa2znPfwoCQs6HQzLKa7v3M3eakHwSbjbKNFGU4eCYWIBWELpql10/b6xIGnK9AnNxtroXFRUs6pAHIwJ0yr9idJLrUDpdWmk3Z4DMq2Y3WNmAzl2jz5sboDw3lM2v9TMsKPsyR2gvQL8cUXp7kP7MnFKAcPjH15Xu/t74dufZIm2L+IHP8LnKdtzi395psEiuyVCKma8agHUjzTKUNh/OK9A+S1BNIAiZ68NRer+i1d495nG/Db5rbUdx9em2ZHoKxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi/KMaB6KbDIf9Uij0D+ag02a/o21x+A7FUICQWfbXM=;
 b=n0OE4kS+c71XrymmqX4df7aCQkGtD5wKKn6tbZJJGixZlsCMuBJVhORIXsGDELCuOejKsI1/jdh14/XwGf8QHm8P2ZwyVjEsyfxpQiJL22KxG8hEmzN0jOjAgaQC708zwiXY+TAqJmzWvgxg8tD8UOmas89o7SBSx8xJ3z7aGEvadV4576NfjPTeqJq74QYGA3bYRKtKkfDltaCvHUcsve/9GS3kOiERjMyDsELJ58sW1AJmvEKgJ0e5hDNPMcrnjOwg/nQAlGuAch0xRpNkDC7QSXeScfdp+tS+zf1pGcVU4xPuxgsJGZ6X3AoHHV82+7bv+HdE1Y60azIlItcAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi/KMaB6KbDIf9Uij0D+ag02a/o21x+A7FUICQWfbXM=;
 b=RHZ5Y5J8HGfqcV32cqgo+BdA2rOE++gaqQ+G2p3PcVF4UGsf9IqKZHmEPSt509zDSvARHwZ0RUt1zVIs6MPlEg/W+h9TcMai8EjhUpEzwki/q+w+LrSch+Zn1W8qJRN7+wJbC2SRHNkd+QWCs3WrGjCRUMPwJKAxrj2KxEEJUGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6812.eurprd04.prod.outlook.com (2603:10a6:10:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 08:40:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 08:40:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 19 Jul 2024 16:49:03 +0800
Subject: [PATCH v2 1/2] remoteproc: imx_rproc: allow tx_block to be set
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-imx_rproc-v2-1-cd8549aa3f1f@nxp.com>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721378951; l=2299;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Co0X/fogF63BIl2CA2vyYF72Bd5h0JVH5Wy6/50cNts=;
 b=qkU82bWr+/4fpZIt+QZQGjAmRKZ+8WVVx+prEVydlbLyA9AKLK4ECcgmLJYo/qujPHWjvdbL/
 yieUS7iGJagCSNrVOVLRregeykEHNvN94SLY+bhAl84UcUGM9lTlBoS
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0129.apcprd03.prod.outlook.com
 (2603:1096:4:91::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be662f6-3944-4906-75ca-08dca7ce64a6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c29qYWM4NHNOU0Z6MFc2UnAzL1duVGszUm4xeDI1Z1FxSGV1UVhRZ1NPODZx?=
 =?utf-8?B?UzlSUWkwc01OeWk3UHBZdi9rUmszVWliRmNsVU1wVlY5WnhPUnJPaWZqbVFj?=
 =?utf-8?B?bk1mZ0NyLzhmSTVBZzlFUW5uRjVRc3BBWElNcGVzc1pZdXloZDBweXM5SFNj?=
 =?utf-8?B?dXlRY05OSHphVHFEZjQ4NG9zajVVSk02eUpjdlE0Rm5EUGlNejVjTUxKNHVK?=
 =?utf-8?B?VlRpLzd6dkFNWVJSeGRJelNQdmU3cVdGemZoTFNwVkFSaDRjWXNHcnh2T21K?=
 =?utf-8?B?VjcrbmRhME94RHdPWHhIUFRVQ3o1MzZEMnFrUW1FVGpCMG1MM2ViYjljY1c5?=
 =?utf-8?B?cUduYU93dzdpUnNRZ0JWTHhNZWRkbDBRYnFwWDVDVEpINnZOMGlLVTh0VVBQ?=
 =?utf-8?B?WHNqd0V1YjJZNVNaY1g0SXpSajB0VDZuU1FvTGNVcUVWZjNrelN5TnRmV0Rx?=
 =?utf-8?B?dVJVQk1kdytROXBDd29IZWhPM3lWaXhtVlVZdXBDOFVmRnZuWVNab3BCU2hV?=
 =?utf-8?B?SGx4aUs5enpOM0NQTEZsb09DVnpWZlQvcEdEUUNtbmx0bFdQS1JuVUEzUzlZ?=
 =?utf-8?B?MUFpa3pIZUxMU282Z2Z3OWgxNzYvMVphVFNyQlp5R29OOVVjZnY3UDZISVo2?=
 =?utf-8?B?Y1gweEV5VG9sQmRYVHQ1R1c2NVNvNkVJMlUzaG1SejYzSUNmUnhzMGtJV09K?=
 =?utf-8?B?Y1pQa2lPSzVjYkdlZnpvWWtZM21RUzBOZ0p5MzRjZDFyNXA1VFVhL0lkeWpx?=
 =?utf-8?B?dnJyWGI1MWU3VTRBdUtUWHBXaFBrODNxelpYNEhUMm9Ra0l0UUd4QTFzTmsz?=
 =?utf-8?B?YmFIN2pkVUMvUmtkU0lUak9ZMTgwT3FqU3Vua25yVWUwZWpSekhxbnQ3UVpm?=
 =?utf-8?B?SEpCVTVFMGtLUDBZM09iemlyVmxablVSWWV3WG9FQ1RaeEJ2RHNCRnh2YUFw?=
 =?utf-8?B?UVFBTHJseElaS2IyQ0IzMHBZV1dnRjVjQUhkWHYxSUlHa3FBUUhXQ3V2QlRq?=
 =?utf-8?B?d084bUhOVm56VDJkVFFQSGp0RnMvczQ0RSs0V0RhcDMyV3g0TUswT1V6SG85?=
 =?utf-8?B?WDhQaGZheW5CclpvZklITDVManBIUDVLMlQxL3Z0WS95eGtRY3gyQVU4TUhu?=
 =?utf-8?B?M0hvT3ZyVXRBV0M1aWN4cEZ6Vks4cWozY1FPRUdlSlBiUnpHcUdrTGUreGdK?=
 =?utf-8?B?ZTdRYmJQM0ZWaHhSL0RUV1B3RDhnbTU4T1o4eWJpM0x0bU9acWU3MG1ISGlk?=
 =?utf-8?B?WkY3NUxxbE94MWROV3NNZmxEakJuczk1Y1R0OUZNVjYxbzZ6Nmh2SmJjSDdY?=
 =?utf-8?B?SkpiNnZmeE1RWk9OWWdIM0x1c2pDbmtzdmpOQU91Qzc1aWNRRkFkanhsWDhu?=
 =?utf-8?B?M1lkb3RYR0k0NFlDZGFIMFpacUJxQW5xQm9VV29vbnFvVDBlSHJCaWhmU1Vs?=
 =?utf-8?B?QlMzcjdaVDhVdG4zZ0hxMS9hK2szMTNPa21lYm91STB6MVVyUXhmSzVuK2l6?=
 =?utf-8?B?SXRlOXRubEVtU3kyMHgwS0JiMXk2ZVdyK0VEOVN0RjRvREN3aVdJWWZhVDFy?=
 =?utf-8?B?NTZkME5BdEpQbm5UbVNhQXRUTnU2UXIybE45Y3hIT2xvOTBSMUpDZ0xDZ1pq?=
 =?utf-8?B?UXpvUHR6NEtzbHQxMEZwL1AzNnJ6U3V0NWxlb21iekdTSTM1YUFtSnNackpI?=
 =?utf-8?B?RzVpMmhaVDB0c21QUEtwdkJQU2pTZFhRaWdvUzZLVGRvQXdLM0hkVGpkZnMz?=
 =?utf-8?B?Z2ZXdFVtb3RtRG8xcGQvcnQ3dlRKRjFCemo2Tmh0R3U4Vmo5czdFRzdGeFdC?=
 =?utf-8?B?dmhDMGxjTkJSbS93eXNaendFN0w5YU9EbHNNdjZZYVBuK3VLakYySUQ2MFhm?=
 =?utf-8?B?d0wvMjFJUEI5MkJkdng1MXkzaVZXNVRWbFlBd1BEUnRyRlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmFzTnMvaCtieE5CYkJiYU81TjZCMjVCQ3J4TTU4Zy9SQkdUdC9yWVI2b1pr?=
 =?utf-8?B?a2pOZUR1RDRKTjhCMDdNWHVmZ2VpMDdKd2FhWjVVRHVlSFUrYmRTZlJHVUlz?=
 =?utf-8?B?NzY3TWZEcjlUSnRwL0xZamV1MDM2cWVuQlRneG0vOFUrMTRRT0dSbTROUGx2?=
 =?utf-8?B?QWpXdjZLMFVpZ0dwcmNrREowMk1pREY5OWJxZnBiaHJFbDk3L1FubTFOSElZ?=
 =?utf-8?B?QlhjaXpVV3hYWjVKS1dRQTVaZDg3U1J3cUNiZnFQZStLRURiYWpBdVRuOENF?=
 =?utf-8?B?MDlaL0VkVm4xaHRlSmZRRktLTTlLL3ZnSXlmemxjTFlMS01RK1loUDhMalI3?=
 =?utf-8?B?K0ltWHVlT1h4d2FSUGozMnQrNXVHZWErV1FBWlJJVVVrWGFDbU1UMUgwbHly?=
 =?utf-8?B?czRqelFCc2Z1SjZOVzZDWEw5b0Y5QjVicmg0WEloOFNkSDIvTXR6VDdleG9a?=
 =?utf-8?B?NjdQT1g4MHpsS1hiTFNSVXljUWZKTmV5cmVjNDJsbEZUaDdYakxNNHFTU3d3?=
 =?utf-8?B?UTJxektqY3BQZmdHSUJwbTNVSERRWjJhY3VjYXdiTmJ1RTlzNis1QUFBZE5j?=
 =?utf-8?B?b2lZdHRmaTJxaDBqN1JHYVZET2lKdmNpRWpRV3MxcXlyMDdXMi9JR1NBbWVi?=
 =?utf-8?B?ZUZQcHQ2SWt0Umhmc1lSajgybm44aWxjSnRIMjFsR2Rra2VvOGpJUWdiVXRq?=
 =?utf-8?B?SGZ2cFJ5RktrTzVna2EvTGI3QmwwSWdxdGNPdFBKbC9CTkJoL2ZOK0Mzb1BS?=
 =?utf-8?B?eDlKakRsT1FDUmI5Z1VaMEtKQlBLUEs2WmM2VXM5aElITkJYTEhHYnBlN3JP?=
 =?utf-8?B?UkdwWWN4cGhoeWNXampFczB5T2xkaFppTlVKTlg1QmtBK0VpYm9oTG8reG92?=
 =?utf-8?B?NDVJSFVUamd4MDR1Q1p6dkN4cXI4SXBrQi8zNFdaOUdvOEVESlNWQlROT1pl?=
 =?utf-8?B?cC9FZHJxS2xQU1Q4Qzl3ckxUdDduNmtIcUpHVFc2WmI2UWtnREQ1TlFrcUZT?=
 =?utf-8?B?NXFtMXlRK3ZUK3NaSXdqTG4rMnhYNmlxbnUyNnU4NEFPTmNjOS9aWC9JR1J2?=
 =?utf-8?B?ZWp3eDdVQmNiTG53WUNjdmZjejJkcE1aSFp4RzV5KzZuc1d4MDdqZ0lieGhh?=
 =?utf-8?B?SndOUGEwM3pjQkZkNDd0Ty9yR3BRM1crMm9haWcrUmZmdjlsWUFSVVFmdUI2?=
 =?utf-8?B?YnZOZXA2VDQ1ZmgvTEhWQXhPekQ3N2tabmFQSnp1UEpaVlhpbVNPR1g3Mktk?=
 =?utf-8?B?d3IveVVqQzN5WTJmZlFkdVVYM3JzTmRNaE90bC9VQ2swM3V3VkxoMm9CMHZt?=
 =?utf-8?B?cHpoODhZWTNUYW5iUkhsd00rR1hTNWJCMy9TVkFqay9LYkFrZ3NpZzlaZ1hB?=
 =?utf-8?B?bDFLSVlvcUJyNnVuN0MxQ2xZeFcrZlpKMXhuSzY1MDhacUUwZThzaG0wK0x5?=
 =?utf-8?B?SlBXZTBKYjJKUFJxNEttRjgxVnpwMzBQdy9EdDlzZ29TV1ZWdUhhOE1rNnNJ?=
 =?utf-8?B?Zkl1eXg2cUV1U1YrTEwxTFVNdU9oRngrZlRnODUwTEJIeFV2VndGWTJJaStQ?=
 =?utf-8?B?NFZWTDJjR2tDTU1EMkRWdnpRdXBjUlNYUlRKVkh2cEN1UFkwOW1wbUNsRndQ?=
 =?utf-8?B?OXBuTStnUkFjZHZCY1hNUm04VVNkcEtycHRmREFCTlhHUWRyYXI0bjhDY1kz?=
 =?utf-8?B?cnVyOFBvcjRRUmVKZ1UxT1d6YzRDem1BQkM2Y0VzN2wrK3p4alRSSGU2SzZZ?=
 =?utf-8?B?OFlLYVNDb1ZnUUFzVDZ5d1FXWHM5TC9xTzJ5VWZGZ0p0cDNLL2I2WXVWKzhQ?=
 =?utf-8?B?MGdubE50OHdMY09UZ3k5UWZONTNlZUhMNThCNnpyTUFNL1M0WWJ4NXl5WkU1?=
 =?utf-8?B?UjVKSjEwQlpvMkZIbWhUMUVRVDlpQVUyS0tmTU9LTHd5QnVKN1J6K1dUZVBl?=
 =?utf-8?B?SVpxQTFsNGlNbDNjU0M3UGluckI3TkdRWGxhRDBiMkpIOE15S2Z0aWFYUlZy?=
 =?utf-8?B?QnhsYmpIa0c3b2hHZTd4R3dPcTB6eWRKWUR1RUlObng2QklrMjJzVGtDZ3E2?=
 =?utf-8?B?YWZhOWlhTzlMZmxDcEhJTURRUkdnbERyR2dsMUlzRlFVL1lEUkVLRXdkTGxy?=
 =?utf-8?Q?ahy3hWhtDaxtB4fr2QFwHvscM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be662f6-3944-4906-75ca-08dca7ce64a6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:40:07.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inxpjBsOjXRQw+c0RmYJh4WzYhSO00TcJGcLSSJEzFySRAON6dRklNGESfEYFmViPqADEwwOsfLZl5w33IOF/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6812

From: Peng Fan <peng.fan@nxp.com>

Current tx_block is set to true, but there is case that no need to wait
response. Linux just needs to send data to remote processor, so let's
allow tx_block could be set to false. No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 552fccebf7e2..01cf1dfb2e87 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -90,7 +90,7 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
 struct imx_rproc {
@@ -369,7 +369,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct arm_smccc_res res;
 	int ret;
 
-	ret = imx_rproc_xtr_mbox_init(rproc);
+	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
 		return ret;
 
@@ -629,7 +629,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 
 static int imx_rproc_attach(struct rproc *rproc)
 {
-	return imx_rproc_xtr_mbox_init(rproc);
+	return imx_rproc_xtr_mbox_init(rproc, true);
 }
 
 static int imx_rproc_detach(struct rproc *rproc)
@@ -794,7 +794,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 	queue_work(priv->workqueue, &priv->rproc_work);
 }
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
@@ -817,7 +817,7 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
 
 	cl = &priv->cl;
 	cl->dev = dev;
-	cl->tx_block = true;
+	cl->tx_block = tx_block;
 	cl->tx_tout = 100;
 	cl->knows_txdone = false;
 	cl->rx_callback = imx_rproc_rx_callback;
@@ -1083,7 +1083,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
-	ret = imx_rproc_xtr_mbox_init(rproc);
+	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
 		goto err_put_wkq;
 

-- 
2.37.1

