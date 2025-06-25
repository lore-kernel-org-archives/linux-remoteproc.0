Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9041C4A24;
	Wed, 25 Jun 2025 02:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818338; cv=fail; b=jdm+uH7LkaC6PSFeY85VgpnKWD1JTLpCfiecCL6RLiaZ9zQkKlybU6C6cC3iDGZGBvd8FHdivxpbJPCJKoJz46wH1nNdyaN12iJZQJAgiZW5OetQ4NnJyk0UecuvKdap4Q6NfTKN/8TApLyG0GWQt2guT4zdnXopRYtkEPqyQnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818338; c=relaxed/simple;
	bh=5sFTPqSKB+4DRfcvtaBUMShL1+z6BDo40orcGQEschs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=htKZ4pXAzRcrDk9CirrqK6xOnjocz6ciS3Hh4F6phMv/MER252Tf+R5FkAb8Hesq7PbiQNrkZ+AcC8TjXoAXP8gUQz0F3JOjkEGjUnZEdsIsyfnEiZB+vfYSkg4n0wYaOrM41g4VFjRLz92NtrfCAMkOwakELqbeE1/A/5pj28A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PtaD6pbh; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PtaD6pbh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvBYGlG1hKKKJFIGz0NBi+aaOWs8ocs1A6NRsHwmexFw0lhF7wtoVy2UfTT1HjWXum2t183UzqdS7mjShvzE9bwALE7Xa0NN0yn28y9Wk+H/fNOvAO4D8mTw1nV5egf4oLZx/8vq4KqY9+T7w89VE8igi/9PikFJGTRBtGye4ZsdZYjm5n1ZoU0JiMUKk566kfguVTZfzvQxnGh+VJkyJPsxpkJohikKfX2N0dRr+PsrMJF03XnITEFeAgX0DwZtp3xLCYqEqG9ly16klX5GspYo8D3WXiJYszv6eRPqI/zWLdIfHhCCexiVEin6FcF4a5n0T6MlY36Y4z2G9IKBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csnzyFoCR3Tv5pV0Jk3MhOeD3BjJ3alOKU/sJFfbv9U=;
 b=mqpZ2uRrT6IwGwLO/8csyP67BgM1spok2HnqL/UUejlr4/aHByFX/7jQ0NzI11AD4IiZoFYPNRj0j3AJrx95UADbrwTLTG1G/FBcp1auLvgcwtAj5dTWi0ClKhU7iCPw34wYaT6+FyWA66Ww+OWiOQ+dGoAuWJhueWcd/rEak81lECjKFR1uOpjzKw/O6JwBLROzXaYPuElj1ypZZYNafTqsV8CnuExICHWA411KnCBYrshaLdhNYPxw6kGGt9Tru3IAw4J3gyC75C9iZqh2b5IxMexKP1Lo1lPrG0FrUjmgRogKmN6KvMp/o6Ii3OGqauQLDHkedALoDSovSd/tgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csnzyFoCR3Tv5pV0Jk3MhOeD3BjJ3alOKU/sJFfbv9U=;
 b=PtaD6pbhWy/5mgtZ0ohGb6/3VeD2PR/h6oqBBXv6trgqfSyQZx3w3Ufu3bmRlNdSp74TD9zdi2qBCgasokQktyGrnja9fx5BnPsNU/vMroCuBpFVgdtCdJhyCsBluiMajAsO4s4ck7d6cosvQm+Ha+L7sEj2I2aI0pr/+hZPVYkM6NK2BpzwuQg11GYAO2NnsEZFUNzcwzP7LU6p902SxoUEorFuxR1ldTpAy3AXC5QK63HnN0xJd2YP6s9K8w24qNvXKVI1ARvYb66B2oXPXt1gLHGSncmh5FL318Nomrvcrc6UjqGf19Gd0DkO27Xab4ElR2le2YSblQ3Z2UXnWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:25:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:25:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Jun 2025 10:23:29 +0800
Subject: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750818218; l=2313;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=EeAYNj/L08cF2o+ScSJpsZ2O2gLBYwWUBi/ExWacUpg=;
 b=SFZ4lgIujeBV+7oFap9YIJgU4A+nZsK6ttyDXiBmFxbo9cJG79RnozFbDW+eV7u7I4BNm+TkU
 urmKE9RTli6DO1V7iv8t+cIYPxPL9cJ5T21a9bTN/izz5HmnKDmjJzr
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 004d1302-2365-472f-ba1c-08ddb38f8f8b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2lMY0MzVURkREFOdk5FV29hcW9jTzZxallFeURhTGZGOGd3clMrZnloZHB3?=
 =?utf-8?B?d3ZaV0JEOHI0STIzazRMK1g2MU1DVGVKZXFCVmRtRmdBV2VzMHFnZ0tNejha?=
 =?utf-8?B?aityVThiRXZScG9IcHJDeFMzbkFqSnZOSHVnL1JjZXBhVXFTS1dnWDMrdVJk?=
 =?utf-8?B?Z3d3OExyTElGd1I3ejZNVExZTGIrMEg1WUpUUmJYWUFQaE4waEV4U1dFZzNw?=
 =?utf-8?B?blIwWm9iRDJwMHRscFFqNWNGRXZxYS9XZG84c2ZPVFlORkNLdFhFR3F5OWph?=
 =?utf-8?B?VDB0UTZ6RzMyTVN0QWkrRVVuSXNFdm1nbjI3SU5qMmhFdXZOcHd2N20xaHY0?=
 =?utf-8?B?cUZ2QzNtcndEWGplNk11M1p2QlF0RWczQm5LYmJ3eTBGaFNDUjVPWXZnTlhm?=
 =?utf-8?B?QUVmRnZTQjNNVG0zeHNRUXhTU2JpY09vK0M3YklsL3YwaGdTb3YxZUVIVW9r?=
 =?utf-8?B?cXErLzQyelJkZldlS1JTVTZXeFBYb0VBTjg3bVZuU1BneXhPem1GMGlxOS9t?=
 =?utf-8?B?Nkp0VC9udDZSdThJd1gwZHQ5T01xUU9kZUl3MnNLditvZi94SFJJeU1ldVRY?=
 =?utf-8?B?RFR3K1Y5QStiRm1hYnp2MDdPQkhGSEMwL0hMNStTM2VWa1U3d01GT2ZIU3JV?=
 =?utf-8?B?K3hiU2w2V1I2MW1oNGYyVkxySW8rOXdUUERVcU5IcDFXUDlrSmMrcHBFUmxk?=
 =?utf-8?B?VkJZOHE4NnNVcXE5VVNNUFZ2YnRpUTVIbFovYk9RSWZuVXBQTkFUS0k2K0Ri?=
 =?utf-8?B?eVJSdnd4Z0ZQZXNUVTFSa1VBc0ZlSnpnajlSbFFCNGlNdjY3dUZDS2tmUGJZ?=
 =?utf-8?B?RmxIRmo4ZndMdGRObldFS2hVdGQ4RTQyYjQvS0V6eEpHcDBxdXhnRlN5VlZy?=
 =?utf-8?B?M05oR3ZhSFUyRG1ua2ZGZ2JJc2hoTU90aWdTNUlQMlNjWUY1Ym54dnYrNVdi?=
 =?utf-8?B?aG1aa2ZWZ3FKdDlmelRKandtY2lOZVEzYUJmWVQwZEZ4V0UrVWJZaG9uL1lt?=
 =?utf-8?B?K3B0R3NubVJtaTI0M1JNd3QvZk55Q1ErV3lzVDZXalJsVktMa3kra09NV0lr?=
 =?utf-8?B?dnNGYnliWWtMd1hTYmdYeG1lbWt3KzlEakZnOWRpTktrMGcyR1hqbC9PZzJM?=
 =?utf-8?B?eFdJWWd0dFQ2eUM3TVhYVTBtUzB1ZzBIWTlZcFBIa1FocUdPWEthRm5oZFZq?=
 =?utf-8?B?Q1JlUkVJZWlMTS9zbENYMmR6V3NES3pRZXVnZG5CbDdWdEIrZ3ZGNi9kU1pa?=
 =?utf-8?B?Uldrdy82T0szWUFvQ05MWjF1UGhpajlGTUZsVENqb2pGOG04M0tiUUN2ODN0?=
 =?utf-8?B?NVpiODFTVmVia0JKK1RJbW83UDFrS2JMWmFwMVh0aUJjbG9URGdld1JQWGox?=
 =?utf-8?B?MTZHNUVBdHRDME1ZM2cxWFpGYUQydEZjQnByY1MxR2RxU3pPSlFrSUw3YndP?=
 =?utf-8?B?QjNvNkMrd3JNQ2hBcUdFOEJEN2Q3SWZiZ3Q0L3R1QnFPYUZQekVwVS9sWjda?=
 =?utf-8?B?WGdYRFF4Njg5NE5hMjlIZVc3MWFjUnpJclQwRXFXNlJQbDFlMUJVK2M5R1Mx?=
 =?utf-8?B?RWdGRVFHWThuckoyTTdIdldBaUtnbURScUcxSDNlZnNRSEpLU05WeW82Q25l?=
 =?utf-8?B?MFJTOFR3UTY2bmRkTVVGTzBuTXNwWG11ZUF2dW02amxDZStSVlFxVHNLcE5Y?=
 =?utf-8?B?amVVNXB6WXRldVcwMUE4aUM4UFp6Zlc3N2kxY01zdmJnNWxzMnNuSlo3OXZJ?=
 =?utf-8?B?VzFlNXFnaEt5bVlmU2NvWGZMbDlsZm1DZXhEdFB3ZEM3ZHFKeG5NcTAwUzJo?=
 =?utf-8?B?aVRSSmlldStCUWMrOU9JditsMXNHUitISTVDSE44WHlCVm50OUZDR1FoMzMz?=
 =?utf-8?B?clBJc1IzSUlHakxKK01GNDBQMEpocVlzYmlQU0dUdWg4ODhUUEcyVGQ4RzBt?=
 =?utf-8?B?V0dibHk2Q3FsRmlSVXZncy9HU0lJNjBJRjBIZERLN2NIR0FDUHEyeEFBeThD?=
 =?utf-8?Q?BJsK8ntif1oZXrWC/CE22S7TxI4GJg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFVVUkw2c0o1MXJjS3FjUDZkSGhDNUpkcjhsNnVJK1lLR25OUW5tdVJ5dnJC?=
 =?utf-8?B?ck9EMlhNRElFdzh5T1FGeHJmZ3IvbWxicFpxc3VlcHVybmlIU1BEajI4YlNM?=
 =?utf-8?B?K2RxdjV0NGxlczV5aitPWTc0QmtOU25vdVlPczdyVDBBcHJIZzFtYkh2YVFP?=
 =?utf-8?B?Nit3UHFZcTVZRGlIMU11NkIxYTh2NkI2TTlXZGZEbnpzQ0RRV0MvN05lYlQ0?=
 =?utf-8?B?clpPTE1xTXF0WTNKcUFrZUJzT2ZFOStRbUx3RWJwN3FpQjVmdnQyRkVMUnJT?=
 =?utf-8?B?czJPTmVUY2x2VEhWaU1NWTA2Q2VuYXlzcEtlM1MzRktYbTBzUTNKclFaQm41?=
 =?utf-8?B?aVdGSHMrRUNPaHRWazliSTBLTXNpdWV4N0xYa0w4WGQ1R3pwVlMxUTJrc3pi?=
 =?utf-8?B?ZGZXVGpMSnNUNXUveDlRZ1g2ckVHOVMxbFh6ckpJWHlBSXdtL2k0NW93L1RQ?=
 =?utf-8?B?WXVyZE9xMTBrc3l6RlRveVovN25tTktzK25hSE9qdkJWOE5rU3c1Q2ZIM0k5?=
 =?utf-8?B?azUzdUxMaExTWXI4VFNqaVhxS3ZYVWxzenJHaTdwT2QvamdUSHFsSkxMNXc3?=
 =?utf-8?B?V3ZYWXQzOVB1ejVMWVhrMWdnbVc1aFlkcjVmZWxGdERINGdGTXV6cmJLNGpx?=
 =?utf-8?B?NUZ2VjllOEJicTI1MGY3Y1drNWM4M1VnSGxOZkttQjBFRTRPMzZRcXBid1pX?=
 =?utf-8?B?ODJCbnBQRmhtVURVY0JBZVNodWRWVm9Yc2xpekFuNlM2RFRjYzhEVjlqZ214?=
 =?utf-8?B?WVRWS2NXTUhrWnhsd2VDTUsycnFhcEd3U1VXUlJGbEhEZFlvVHNJNk9DNGFh?=
 =?utf-8?B?MlRtTU1EZkVuZStGK284U0JxSk0xSkRTMmJET2MvNXFxNFZTTEdjb3YreVJ3?=
 =?utf-8?B?ZTYreVo1VGQ2dXNJcXM3UGRpVytlRnY1QUlJZmpYNkMyN3hWSGtjMVJzRkRZ?=
 =?utf-8?B?dU9oMlVOWTNyQTRnVEpUN2lPTlYwekFxRUlONk5QYUpHeXduU2xZbU1nT0J5?=
 =?utf-8?B?VURGVDVOSXhIVjZQT1lqUWNkRUdqcWRUeWcxYUtDa2RVUHhDcldBWXF1aE9i?=
 =?utf-8?B?ZGIyQXlIOGdJRm90b0RXVXFLeWdYMTFmd2JxRDVoRjZTWSt6R3MyQzB0NVFR?=
 =?utf-8?B?cFNQUk4xZTZCQ1pvNXliK2hKQ2hIa0l0UDVxM2xrOGFsOU9aT3hud2V1Qk5t?=
 =?utf-8?B?T3NXS2tCMzJMTVUxOVpJc1RtaWNDbStvKzNWbUpaVzBYM0FWcWZxMW1uWkNq?=
 =?utf-8?B?T1lVTlByUTVQd0hrSDN5VUZ4MHMxQ0tCMElVNTdVdEs5YzIrRmdpUWF1Uzdi?=
 =?utf-8?B?czN4Zk45dE4xZFczeEhLQjdzVjZFN1greU9nOHQvS3VCOEpMQWwyQW5mbG55?=
 =?utf-8?B?QkU4dlhncHR1aGgvNHVCaHZVZ0xQMWNFWU4xUUNHUkJhK1dIV3ZjUFJSZTli?=
 =?utf-8?B?YlVvNFZUWUNBZXVFNzNUUjJRTktFRWlQc0xjSENYUDZpRlFHTXZHb3Vvdzk2?=
 =?utf-8?B?TklqcVVQNlRyREN2MWRndk1EQkF1Tm8zbFFTeGY5Nzl6T0pIRXFRUGx0NXg1?=
 =?utf-8?B?anFEM1hSeE1VdDRLcEtINzJsVHhESUl2ampheDlLMW9mOGtRQ0xEN0dETUxG?=
 =?utf-8?B?RUtMTWQrd1pEdXNYN2NOZ2pXM2phZ1FkRGtwYVlNTXRFdVpoR0FwTFhkaWFz?=
 =?utf-8?B?NEtIMHB0UnF3RjNBL083OWRYWUxwZ21qd0JaVFRFdmo2cmNpWExvNjl6V29G?=
 =?utf-8?B?eWkyWG5SL204VDBHcVNmNmRpajJCZ3pwY1RXeTgzK2EvaUZPc3R2NldIejB1?=
 =?utf-8?B?TmVaSWphWEZTcXhEZHNvOFozL3FWQWdhV0ZIS2Z3TzI2MGpiRTRHM2VpeTBa?=
 =?utf-8?B?QklQZEVmUHJLZW43dldtb3FWUW84OStUcjFFNFF1V1Bzd3k1YzVVaXF2Ymlp?=
 =?utf-8?B?cm5oQzl4UWl1VHFLRzcvdUhuM20reDZVQjM5ck9BVDJBa0dUNzk3Yi8ydXUv?=
 =?utf-8?B?emFmcjZ2NG56UW1hOHNoZGJ4eXpvcVVsZ01tL3QvZnRXR0R1SzBuQVBKTjZ5?=
 =?utf-8?B?ZjI4VUdqaGhHM3VGSGw2TTJWY1Z5OTZDbTVBQjhYK1pVWlZidmp3SmY4cmlD?=
 =?utf-8?Q?7PUuIeSA646p6ClC7rViHHsu+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004d1302-2365-472f-ba1c-08ddb38f8f8b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:25:32.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lK5Meh06+ISutAFOE6EOuP+9RNLl2/dG4KQ830TjUCDX6u+rUmSni6kHv+G5U439ELoySHWabmFui+8dtc+JCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

From: Peng Fan <peng.fan@nxp.com>

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -73,6 +73,10 @@
 
 #define IMX_SC_IRQ_GROUP_REBOOTED	5
 
+/* Must align with System Manager Firmware */
+#define IMX95_M7_CPUID			1
+#define IMX95_M7_LMID			1
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -126,6 +130,18 @@ struct imx_rproc {
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
@@ -372,6 +388,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.method		= IMX_RPROC_SMC,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.method		= IMX_RPROC_SM,
+	.cpuid		= IMX95_M7_CPUID,
+	.lmid		= IMX95_M7_LMID,
+};
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1301,6 +1325,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

