Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E472E11DC;
	Thu,  6 Nov 2025 03:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399900; cv=fail; b=gx04coUY/D9lxXheNhsglHrAYneXkw5BXvLpOdomzoQ5vYyWhXWVIqk0Ux0Yfinp5ba8/JGpFisK7iaAsJWMRpG6tB4CY1xbWsCZ21ad1wFZgNEQykodgZF5adU8AP7R3spfW2Rv8c6OVDIC+0MeJp1/v6dBPGtyW5aQ47O2UyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399900; c=relaxed/simple;
	bh=UUV00BYdhRV1PEUA3QZZOPpCC1TvitSqxib8CVTFrHs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Am5b6oR5T+wD0d0dXaZS15OBJUWfrsKE05XqCktJyHNMWyL0+Isf1TcW8c4r6xdOkBFnpPZc7gEY2znLoDPRm8dh6Kmg8cHpcmQRUnTzb/XeBVLZGedjxrTyRWxjaWLy+qvAXFApX9EMm11PCpscE3iP20lNszZ9Pgsa87w8Pkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BuwuIjo7; arc=fail smtp.client-ip=52.101.83.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BuwuIjo7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=genSdfVnpy6tNACRX7JIy6dDPJn1aO5up3UQ7QgrMr/L7BZQYlfSnpJgDXoMPgDrnjeAsEv0yno9dVUm3rtu5GAD2xZqmgX8X1CmW+vadoHIvLw/9a6gTNkze+3k1Cee7ZU3QfZbGoR5mZusJnSEIR00jKnnzl2upTEH7Pw2LWlG7xUT5fhSyXq1JKDaHRx35dNW+5FCEhMAw561+dB1dl3PIzCsyfF1MqIQfzwFXZd9FyRoi9lMbzSYMFUAQ+er+eV5NNmp7NAK7Cohaw4OVVIoGKSjLVeeSqiqrgGmrba0xfCXzwZ0+LSyBWueSYN7Gx51Eckpx9XCqjbMOND/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XWTD8AckO0Y0UdMiPuVIHGFXxeNt19QlUXtWl8P6cQ=;
 b=ANcSMbfUCC+vig98pwF2X1ZwP2eCax0kMSe0zcwoZV7u0UfvEiReFWKWrc7Clrc3elPWzDew4nLIVXVpG2elE70Zn0bcnFK2N4pBn6257lVCD+MSdxcp1gPwxgkRyRt/FTbDQqUk+C5OUpC5ykVu6jaf1Is/6zT/gvlLCbdg4KPQ32Dupl37Ae2ITX+WNSorvhPa2VeJuazQZh0/5MP9zZYs23n3bNEdBxCvx+4sO6X/94kdmBb+ICrPj9rfoYUbGqBed875k/TujHolxLQihs7tfwvhYR/g2pZJ3po6CUkGw9QDOqejTG/0eT/DHI3nYSCmiktUOikS1AKzNKO74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XWTD8AckO0Y0UdMiPuVIHGFXxeNt19QlUXtWl8P6cQ=;
 b=BuwuIjo7ZGZ39dYDHdKTz+di+eNVcUStKFFcbSAodwgAxdkGKmXZHKINMtdV+uKPGlDqRoxlfAf63kvb95izNqAWujSnYQgdS/WbwCe1hO9uMg1GCXJpwI/T6c/Uqc74LsRZiCaG1JqYPpupbTo+8z8Zd5Ho66fHwCa/jUpihmxL1noxYhsaTVX/gDuilikUsgBvLKSRUyd79YwWhhEkPIMnTUYnPNpRCa/WPp5kBb8ufKVkfmzshNISkml8ipFSPFJ89lYbI4/a2S1l19gXY9qCal2Xb9Xalx73M94rcT0tPmBKeACc2cZUcGfqjAsYxm6HLHC/sMyV+T//WbjLdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:35 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:35 +0800
Subject: [PATCH 09/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_SCU_API switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-9-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=5217;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=UUV00BYdhRV1PEUA3QZZOPpCC1TvitSqxib8CVTFrHs=;
 b=vt7+FXRWXtJ1dBCnaGF/SzmYM+FjH5aTNYCEozcJQtlCrihKimlYip+HH35l/iwiPN/SZCZ4e
 Oy2Mc9tSyaSDFeHSX2OAF/zNc7CYkYXqWbBNYmSm9SnH9U0JRTNbGC5
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 9927915e-d3e1-41ae-e0f0-08de1ce4fcad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDRUVURDTWdoMHE1OUxZeVpBckFvOWE4UjRwaHl4RzNtRytCNW5XN0NMVEo4?=
 =?utf-8?B?Y0Fsc3BnOEkyM0kzM25lY0lvamRhZFdqZVA0RjNqbWxyTkllMC9oTm15Vkk1?=
 =?utf-8?B?ZVFTWllaVFVXQW1ucFdyMU54RU5TMmtncWpWL3JXQ2VwZ3dwZ0E4Z3ltUTJW?=
 =?utf-8?B?V1VQNVB6MGc2cUZpWTZNQ3dGUFVGWFdEM2UxQnBvNk4rQmdaOExhVExWWDZj?=
 =?utf-8?B?S1lodWpvcjR6amZGenFVYjN3MEdXOXpheHFVUEh3ZXp4RWxIL0QxMjhEd280?=
 =?utf-8?B?UnZPRUhmVC9JN0hJYXl5TnhsYTNlUnRtNUYxM0k3RzEvRkI5N0piWlJrWWFZ?=
 =?utf-8?B?c2Y2RkFyb1FnQ09tZlFKUjRTQkJtT0tMWVdKZnVvYWl5Sm5YeCtuc0xKRmRs?=
 =?utf-8?B?bjlpUCtwelpRM3dSd3B0YUhJMGYxbVVFMmNVVlkrNWJwQzRvQ2ZqcS9BM2tC?=
 =?utf-8?B?WG16aUV5YmhyOVBrSEcyOGp4UkF6eG5VQkt0QllSZjUxUjFqVGhFMC85MUFE?=
 =?utf-8?B?N3k4UVNHMC96eDlyUmFleTU0UmphN0M3Q1RTb014djJNZjhaNVBEakswTk1i?=
 =?utf-8?B?ZkNLeXZHZDNCRkd0V0JSMThRY1hETS80cXRqdEFkR05adXZxdGZxVTFNelNp?=
 =?utf-8?B?eVUySWszVFBBSHJzUTV3TVJvdG1nZnF4S05JTmVQOExucllUWE83ZGlYa0dx?=
 =?utf-8?B?bC9CdEduN3pPMVJwSkh1ajJtblA0OFJWdEdpV05DSnVWQVpRZW5MNk82VUFh?=
 =?utf-8?B?YThBTVdXY3hXZzhMVnUvbHYwSlBjUXhmOHV5N0NiQjEwTElaeEVCMG9QR1c3?=
 =?utf-8?B?ejAzaEd6cllvSUVEa2xNWlExNVExR1JCMFB1ZTNoSjBKYk5BRUI5ZlN2eEUz?=
 =?utf-8?B?SlFncE9YSjlYYXA5b2J2U1EwOVYrcjRhWVVBdnJsaDRFRG5oU09PSkJoUEhW?=
 =?utf-8?B?VC9PVFREYTQ3dllJNUFJRE4rUmdMKzdHZUFPd3FJK25US0g5MTNjSW13K0ZP?=
 =?utf-8?B?ZWg5R0U4R2t3bTNJZGlHYXdTWng2ekZWcG5NZkFMc2l4MzQwckZCUTdOMVdU?=
 =?utf-8?B?UmpzeC9odmhHU2p3TEVnVTBBalZSZjE0TUdwY1plczFDeDlKZ3JZcCtyR25j?=
 =?utf-8?B?bitNbGVOVUt2TEpOR2QyMldzSUlGUjJhdFhZRnlzYys1NDBhdUtEbzB3bmpD?=
 =?utf-8?B?b2N3K0pBMVB0V2lwbitYSUJsQjVnUXE3RVJuQVYzNVNYMkhuUDJLbXlvbDVW?=
 =?utf-8?B?Ukp3STN5SXhUYTFhWEIzRVBYZmpLNVoweEtCUStWUDRQb1d2NEVtZWkzWm5m?=
 =?utf-8?B?bk9ON2d3TVd0YktsODFIalhjQS9ubVBNRXdVczBEWlVaRWZsSHUwaVlBaENn?=
 =?utf-8?B?Y1JoZmhOb2xBNlNpYkdVdEpyd25oczdEOG8vQm0wSFMxdDE0M0NzY1AzTVh5?=
 =?utf-8?B?bDJZcUhNeW1BMnZybWtqdmxjME54Sk1JMkpZelFVQUlpQ1pIZlFNdFc0VzVz?=
 =?utf-8?B?dkNLR1ltR2JqQ2NBaUkyZVNBQmdBdjJLcGg1dDZpQmY0TzhiUXZjbzVwQ0lB?=
 =?utf-8?B?Y2U1KzZBQ0RDa3RpZ3NKZEV2NEVBQWJadHF6eTJScWMyQnJpVFdzQTBqcDUy?=
 =?utf-8?B?SEt2d3hxbG0rRnczMUJEZ1lScEhhVnJEdXkzR1VMRkNLUnJOcVhxWXJ2aHpF?=
 =?utf-8?B?ZDBhYzRXNUNxWFNIa05aMm9kNjVieUl2alVxaWsrNHp3d0tVM09UbGYrNWdo?=
 =?utf-8?B?ZjlJYlowSDlPbFBMcmRtQ3VQdVBxZUFDenVYbkNzTWFHODF1RkRDRkRJa1Qz?=
 =?utf-8?B?dDA3a0lHMTRaeUxrWWV0cm4zK2MycmJTcG4rQ2tRZlRyQmRieGlTNy9Sb0Vz?=
 =?utf-8?B?bllpZkxRRWV4bWFkalAxS3BhMWsrMi83M1FobXR0ZG1SdFMrVGNjaWZRY3Qz?=
 =?utf-8?B?TzJ0d1Vra1ZTNzI5RGFhaTR4QmdvdVpmQytMYWFyV0JPM3lRNjZYRUljMUI3?=
 =?utf-8?B?MHJlazVSYXdtSTB4Zkx4VU1jamZBTnZOQ0NBMU5pUHFnRzhQclVGVFNXcjlt?=
 =?utf-8?B?cVExVUxaTm5aRHAvUmViMWk4bkd5K3l6VEdEdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dldkcWdlRzVjWG5kQXRBTjR3d2xkZHpJVkdzNDdKemtnOGRMKzdQMGlQek83?=
 =?utf-8?B?RjhKWkM2aFR2SlhvTUZkdTNtcmhXYnYxWE0ybnplUUI1RG1zcU94MXlrUjlX?=
 =?utf-8?B?eXR3MWRvbE5iSWJLcHNBb1M2UytONjVEUU5oVzY4VVE3NHl0RkJNWFJ0bUZC?=
 =?utf-8?B?ZHNhcVNlSFlCSnB1TTMzdTNrNWFWSUpIejhMNUlUSjJNZFFvMUdtT21TdWgv?=
 =?utf-8?B?NWY0VUsxQkM2bGwrci9jeXd3bmY0NXhjL1UvRUdJYk9VRVhUSERLVlRsQ0FH?=
 =?utf-8?B?bXlyaW5KZmF5ZkpVVWlkYWhvc1dNNFREb3RvYm9NbmJIZHU5NGh5K3RROGJ4?=
 =?utf-8?B?a3RTaWVxYzNZSGt4TVAyaWcwcnFXWmNoS1ROWkNyVTdzcG5rOXV5TmdUcHQx?=
 =?utf-8?B?TEZHTjFrQ3p5dmh1WldqQWFnL0R0aisybkFvd3lLOUwvZG5FTWRWQnByTnA4?=
 =?utf-8?B?MDdDVFFDckJaWTdRdE5uNmJTTnRlOWtwcU9mRWxNWGRIODNrZ3FOSEtHOU1T?=
 =?utf-8?B?ZDNSWit1UmVsWlRhWll2WDFka3ZraGNtaWNxV3Z5U3hnOEljRHpYTjdQdFNJ?=
 =?utf-8?B?aHNaMmZFR3drT2tFUTRhbEZjT3Y0RnM3M3E2SmFoMXJncmdiRHMxTXpzUHZ3?=
 =?utf-8?B?cVpNemluTEVlNzg3TFhMVnRNVFBhZ2dpSnhick0zNXp4bWd2bUlIY1hOUkQ1?=
 =?utf-8?B?SGtnWUUvNmhhRzc4eGR3OWh0ajFaQ1Vjd1NhaWJ3WlBGK21EcmppSEpVYjFW?=
 =?utf-8?B?OWRBZFVOMWFwTFcrNG9zdHp1WXZRL1NobWdHc1hjM2FDc3k4RUFmNGI4clBB?=
 =?utf-8?B?SVhjT0RkUmNwN2pSQSttZGQzWGU0bXJ3UnFwSUdpR29QMTFSakpUQjdEWEFq?=
 =?utf-8?B?TXR1TS9HVTVYTHVNZ09vdlU3RUZEUmkwWXNCanB6UEdwR3dlZ3F5R0p6b0Jq?=
 =?utf-8?B?dFpQdGlPWm5yOS9KcUJBVWlCejVlLzZNYk85MDlhRXNoNlhURmdYSFR6K1ZO?=
 =?utf-8?B?Y1NUSHJmblE3M3gzRVcyS3dUWlNhRXJKV1JBbHNyTUN3VkVFd241Ulp1Q1FL?=
 =?utf-8?B?SEY5WENwcklIcGhSZnF0OURRMk00WUhFV0hmMWx1MWZENWF3c3J6eDJxSmN1?=
 =?utf-8?B?cG1hMmViNktIemp2bHZPbWsvSFM5TUliMGh2ZzhwRzN5cnBjb3cxTm91M2ls?=
 =?utf-8?B?YURCR1VQY0R3dmpGb2swRk8wUTluOCtSYWI3L2FLaHhkcmtpWkF1c0d3QnlV?=
 =?utf-8?B?bFVHQ1BPNVJLVUVOemJ6ZE8wUlRqZXdIMHh6d0tIemVRT1F1cE5IOG1FcWJZ?=
 =?utf-8?B?eVRubTFPbk5SL2pjcXdNTEdZNGZiNkRmS3JwVy8zZFJwUWxsZzR5d1ZNLzhr?=
 =?utf-8?B?cUtWak1nd1JKcnJUSHNocVFuNEZNSWU0WlNuUW8xRVZzNDViaFNKWVpwZHdH?=
 =?utf-8?B?ckROR1hieGNwYVc2emhybVRkTzhoUGo4aHhHSXByMmJ5MmI5Q3g1T3d2c1pS?=
 =?utf-8?B?Z21MNXhPeWs3L2RiblF0Z3FpZmJYbkpBeEtTK040aytQWXFlNUpoUHgrMm9T?=
 =?utf-8?B?RUowSVZhUGVMQjRYaUplM2RIRzMyWXgyRFZhRDhPV1ExTFNFSUdiSEZVOHhL?=
 =?utf-8?B?QUJaanRYQmMzLytRZW5OL05wWFlTSDFMMkt6eUpCRUtPMjJKbXlhd1hSbWF3?=
 =?utf-8?B?allmenlFTTVpS3VLaTkxYzhOSUJDZzJrMy9VU3M0WEcwMkVCdzc1VHJUQndm?=
 =?utf-8?B?TzJzdWF6VHRUOEJGcXlUZEtGS0NhQ2tvVFRKUWxQbXhGdkJFN3RBK2dLT3Bq?=
 =?utf-8?B?Ry9SYnVxVnNnQnltR3NmRUk1L05Sellpa2graUJzbVliUkY0RGM3MmljRTZR?=
 =?utf-8?B?d20zY3FGTFlsSzRjWVo0NVk0Q3FGTXVTcnc2MnNNUjhCdnR1Ty9tZ1VicER4?=
 =?utf-8?B?MmpDZStNWWg4UnZEa0FBMGlDbWIvRDVaWXA5MUcvSTM0c0k2RVk0SDk3Yjhh?=
 =?utf-8?B?dU1DbGpaUGZmd05IV1dxUTl2aEY1VkJMVzVpUlk1cFN6dys0bmhlTTdra2Qw?=
 =?utf-8?B?bmxUOURqU1o2ZlVWMTlMVDJ1U0VSemQ4aERxWGdYU1pHU0JQbjVZaTcyTWJJ?=
 =?utf-8?Q?ffiv/yIGfmPCYooukv94wu0LD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9927915e-d3e1-41ae-e0f0-08de1ce4fcad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:35.3578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDDojnwHqCftrgAT9cOJc7l6hnlcNSH0lcFFAg7PG+bi9pbCc+ImLpRMXE4KCf9/Tch2IESCyPitQDo1aoTj/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

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

