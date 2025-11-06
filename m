Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058F2D9EF3;
	Thu,  6 Nov 2025 03:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399870; cv=fail; b=Of9kgOZh9gAouEjqiLuhzrM2tWdnxmwzH+cBlWEx/P88Slk4E+Q7OF1Zz/vMmLDplvidPyC+jcPxRfIZhRjd3r+CkzIN1ZFzpqz/itFTWNraVUnmE3u4KLliWgQsbiuG4yq3V3XHqQ9P3EO7HS8jJbhWlQ8PO5sE9kygmmQtJjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399870; c=relaxed/simple;
	bh=bIvLCjNhP0+rwnyzlM6gsjUPBMJetltPcNLMLdue0wU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z23/80qKEv4M3ApcVjVIcgyEKAdTYlFtio8q1tVgtoPMwpj5MSCSkMnJMBB0ZkN0YDQvHFcteX/MGIMSS5+atdzGdC5PqNvN7aIW64xcmcF6aSnSMeSOvUDGEe3sQCq57BxeBKrAHjXYQEEzQOL25JT5FP06SbGDQ2pW1eMxnyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dFIOlEDA; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dFIOlEDA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM9n36rMzCTjZ6e+V0cf8s0iApH8cDS3qh5aiEjOIr5vpgmC9WpKlaeOx8Oa/SfDoDtu5tMdpwbV9tA887/kr8eC6Agx/nm7ifzS47GqTnVgHjCHIGIZmD2HPWO6iTlNHxviboR5V0IiNHoackKLUA1jbfrmTLtAdrjEtz4fhPBdISGk2H9wBuCHCLWo7Oj+Ea4xjXr/DqT5+2IB0hntIYM/82rJWSy0vlIZdvzh0jUlwG+MiO9zudP6wVNd8QaupszOWKwCX1+5Bzp8aNV3D1svDhluDdnORhvXxqgCoix9oblbr0hcqvNBTZN2+/1vUqWJJMgZPBKrpNlalEKJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zZ+YgtiWq8CEwJWqYRYCCjjLihApNpFo9YjMoZ77IA=;
 b=mYMfRs7imOCz1uO64qobWBoWbLfFXfKzUcWzFCCOPPBnuDP5K6x2pau1PK66PpMKU3j9h8JimZ/FGrz4/KBBUJXJbHxUUP1Rg/u7nPGjG74z9gPJn4mk3n90bew6faVHoNz3uHVMKW2lDP5cPZKT+XAm/EtxoH9OMXx/o0Rx6UXzUiBa5+PiGpigzDepY4pfdu7qD49yEHGBjaJem7H1yPNWsXzG1/3hfSHPHoxd+N4CUCn30eKvoF13P9Yi7HGMUMfNTJI7/zK+cydS3Qeqg1ZALOd3D+oFaYQxpHBdVCeRUqnRVyB+I8uO2YZu5hoOe+NmYBtAWWSYuJjAi31U+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zZ+YgtiWq8CEwJWqYRYCCjjLihApNpFo9YjMoZ77IA=;
 b=dFIOlEDAUe56xWVrNvcdvSPFNT032faW53NGZz69wArts671b8LVl806voQfzvSf/ke4JYVcr1kchDadfJ+P51ZfPFV2IgWYm5gwlkEg8o3XTTo3Yu3RT3WvYiuWNnysLAZBUy7ExDGBPALmRWrZrk4Za26cHHNPXJ9h0n0bkbeTmCwMJfFmwEUhFoeK+fE5hDjEqs5ehtgOP5YmC7COYqURM/aNqdRI8I/zENJ9J5Rc4tOAdGcc6klZbpyFv8l6Y2r/VH+iCnUW/sjZ6hHhGyFuQp1dKJpHnMEqjoy5tzLzAbKocev5BJUSxor0hOa1nXrkt5VRk01BtRsjfEEquA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:05 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:29 +0800
Subject: [PATCH 03/11] remoteproc: imx_dsp_rproc: Use
 devm_pm_runtime_enable() helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-3-46028bc3459a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=1757;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=bIvLCjNhP0+rwnyzlM6gsjUPBMJetltPcNLMLdue0wU=;
 b=g8reAxpbILs6Nw1vVKZlLEWwO6z7ui034ZOcKTa3TGB3UyDXs5AW0PSPM3vJP1ZQ5iwt9unUj
 wBLs+Q/pKa4C3BA94A0P9Vzg9SOjpupCNDcuACQ41KL6Oohali9ngsH
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
X-MS-Office365-Filtering-Correlation-Id: 0153aea6-2ad9-43af-9f8b-08de1ce4eab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVBhZU5Vdnd6ZkEvc3dIazBVaVlzQjJ3Tm5IUnFIQ09IVVZadzMvWEFyd0l4?=
 =?utf-8?B?djhheGx5b29PcFYya3V0Znp6bzI5NTBhbFBtcjUwT204WUl4VzZzQUVFeWs5?=
 =?utf-8?B?Y2xJZjNiVDllWXJaa3ZrOXRvSkYyc1F1TkxkZk9rQ01EM0xJYTdDK1g5NkZN?=
 =?utf-8?B?MHE5eXlqMldCNFcwVE5uMDRVdDJGTTJSQTR4bzBCT3lTZkc1cms1T094Vko3?=
 =?utf-8?B?N0NvMXJjbHY4dHMrQUNCZ1lRWlFpNzBEdWxxWitYTzVONGRDQ2xEUEVwd2hi?=
 =?utf-8?B?U04wZDgweUJ6UnRZYnFsUFBiWGQwTk9HbnA5ajhtSDZmZlJtWks1ZFFIT1VD?=
 =?utf-8?B?YkxyNWttdndYb283eEtrMlVqMTJUQVpNUE9oK3NIckRkMC9mOERtN0lxRjNo?=
 =?utf-8?B?VkN3UW4yV2hUdk9FbklPN01WeGNPWDNnYWU2UkVITTdmVmFFWXBEa2FxeHZs?=
 =?utf-8?B?d3VwdXFFNUdPV0RXWXB5WTlIQUNVSmhocEJERnpENWR4YlNMdFFFQlRNMy9C?=
 =?utf-8?B?aXNPVllnQ2FKYWUwSFJNWHZGUlh1bjJ6b0QxYmVFdjFUSE03ME5kdGZWUHpq?=
 =?utf-8?B?bVdyc2p5S1NoaFhoSGdydnUvMlJ6RGM3U0t5SDNpUHZpaHUyaEVEeUg2T0d5?=
 =?utf-8?B?ZUZSVlZYWkNUOW9pa3JuTmpjMHlDbHNEdERLQlhBdTZldSs4QU9YZkQxU0py?=
 =?utf-8?B?MUFnT05FNGRTWGlzVm0xa1pYRzczTGh5dmhHK1htSHpickF0OHYrU3FoMXpY?=
 =?utf-8?B?V3FCbHpQZDg0TE1JcmUzK1RMUW5PaWNhTzVmckJuTE9Tb1dOZXptM0YrTjho?=
 =?utf-8?B?UFo5NGoyZHNhclltWWgwaGtodXNtRUd5TVM1bjdYU215SUticUhNWlkrUjVP?=
 =?utf-8?B?K2xUekZOQ1NLUVdZc20zemY4UThvbzlUZzJoalNjVEUvc1o3aUxuMDdrUCsy?=
 =?utf-8?B?RlR6SGNHcnQ0dkVmSjJjd1JYRHc2ckRVem54b3ROKzduNlRQS3hQYU9XOG5k?=
 =?utf-8?B?YTd2cDR2SmVQSFR6TGxmMk8zd21HWlBIMmJheld2ajI0U1hBZzJWeVVOeHJG?=
 =?utf-8?B?WXVJajVtbUFYaVVxSTZlenJxQUlOS1JaSUxLTi9hUHNMOGxZeXNNVlNCMzlj?=
 =?utf-8?B?L1drR2x0M21NSG9RenMyWG5QTkd1TSsrVDFFWUZ1aUk3bDVTT0JMVnRhRmRv?=
 =?utf-8?B?dGJXdkQ3UVhudXpuN0VhdDRyM1JwVzJiTU5jQzBBYk5RT0E5eFdaczN0enR0?=
 =?utf-8?B?L2EyQ1NuVkZ5MGxIa0JPRXA5SXgxRThYVERCTGN5U2NzVXY0MWU5TE8wUlNT?=
 =?utf-8?B?SDdpaGVRM1Q4MHZVMzV1L29oMC9EUGM0VWdQeWtUcFNXRjRSTWMvM0JjZTdP?=
 =?utf-8?B?SThZOUVXMzg3NG5UVlVLK1pjS0tSdWdCV2liWjVyMVhuU2NicENHbjJ5Qkx5?=
 =?utf-8?B?SEcxdkplejRsYzJWNlJrMVd1VytmN2RvbTZKUlYwYTJQalNSdW9qVmR3UVdZ?=
 =?utf-8?B?WEdHbmx1Y3hoaFBEVlJVUXllNWVDaTkvVHNNZGFKZEZicU5XU0VTUjdjQ0dZ?=
 =?utf-8?B?QUEzTERRbFlqNitaNDNESU9uMnBmalZEMWFZTFlaSGFWZERVRFdPVHY1STZZ?=
 =?utf-8?B?TC92ZjdFZ1cvcmh0NHlZREZLTWpuS2VmUUVXdjJjNGNDbHh0KzRvK29nNDQ5?=
 =?utf-8?B?UjAzYXpLd2lubXYvUURlZE9qN2RyZEZ4Z0k4ZHM3UlVwM09teHJFQUhlemNk?=
 =?utf-8?B?QkFyUzZRbExVUUNoSTJCa3lsMXRQYlZVajhSU0lFWVdkV0tlMUg4YVhTZS9j?=
 =?utf-8?B?Z1ZBamhaeXdoVzVxWTA5cmNzRWhyM2tYeC91dFpFeTVjR1hENlhRR2wxREVE?=
 =?utf-8?B?eHdWWjZOSFZkdWRWbnJCeDRjMGxWSkVvWGd1MEo2aXZqZUF5aWNoUzRsVnho?=
 =?utf-8?B?VFNaOEduL3FESHZrUGlTM2ZxN1JLaGc0ajRTbk9SZGhGangrWmV3M0VFZXpF?=
 =?utf-8?B?ZnBkOFViVHFwWkQ4K25BdmV2UUU3elRJZFNUZmM5YUs1b1RXK3p0WHNERlZs?=
 =?utf-8?B?RU1GajZHYWdNVXQyeVZpOUFVNkFUVGdUR28zUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2U1ZXEzbmZBZ0pwU2ZXTUxGb0xUcElSRW5tOTd5TGZkNFN0bFN0UDQrUllR?=
 =?utf-8?B?MDRYaUVEWHFNZEgzeTZISXBQUXVtQkhPQ2ZiSEhZbTNEZWR4K1hLaVZFdlJZ?=
 =?utf-8?B?L21SdmtEUkdpM0FvR1VHN3NyUzJBMTZXZXJLUEF3Qm90ZXJPN3lnQmZ5SFQx?=
 =?utf-8?B?MDlZc2VTOXF4MWUrOGxvU3o1Y3FDWjhtbjUyOEM5V1lQY2V3Qm1jTm53VmE4?=
 =?utf-8?B?RjR6NnErWTkvTWQycTRLbHh2Q1RaUklxdS9temxKODRjODJ1ekRBNDBqZ0NM?=
 =?utf-8?B?SVpOdHp6R1FvM3J4R3QwWVlCRXRVWlpadS9OL3pGWDl3bmYwR1R4SlQ5cE1Z?=
 =?utf-8?B?RldGT3oxZE10YmZVSkFZTEhkVlFXT244QUZoMGNPUHYvcEtoemdmb3ZzVDMv?=
 =?utf-8?B?Z2gwQnlqRFlaVkVtZTNZRldXNGNNa1FQVUppdi9ldnVrU21jY2d0aEswcXJB?=
 =?utf-8?B?Y3IzVDUyeGt1U1FrWk14cG1Pd2NEL3NCV1AvaURUSUNuYTJMRkFuRWpqWW1E?=
 =?utf-8?B?WVZDcDQ4YTRJWG9KZ1ROZlNqWjhWOWQ4L09FNzQ1RDFpNXRITjQwN2E5aVZ5?=
 =?utf-8?B?TkU3VGRwSDdmNTMxdGUvZWowTmVRRkZtU2xVaFNyM2syUjB0TjVSNGQ1czdO?=
 =?utf-8?B?U2JlSW5pcyswTWErR282TkREMEQ3Yi9KNDczOEl5aThpZXZWWWphVTNOd0gz?=
 =?utf-8?B?VU85NUJ4UkFDdGdtQ1Qrb1prT004amZ3N0daOVJDb3BaS0lFVlhwaG9KU05l?=
 =?utf-8?B?YUxXL3NlTTZvVWxDZ0V1c1UxVThEUWFSZW9XaWV3Z3A1Wm9xQWJpWWgzdFdW?=
 =?utf-8?B?bjRQQ3dqOG8wbzNDKzQ0U1kySU5naEdtbmNld0VTM0MvcTY4Lyt5UEZtbnFs?=
 =?utf-8?B?OEdWTU1NSGNZRHdCOEZKc1pOeEJNVE9KdmF1WmhJa0NPUDJkSTFhOWpnY2Nn?=
 =?utf-8?B?NXI2cFVVTzhGZFZheCt6eS96cmhsazhDdVJ5cG5kZ2tqQTRlWGl3TU9TNzN3?=
 =?utf-8?B?T1Y2RFlBcFFEYjBDYVhBWDVuRjNnTzNkSjVoZ1R1Z0Qrb1YvbG5UdnJvR3VX?=
 =?utf-8?B?VzY2Q0h1RXl3VkJxejBBb3JFdmdkcHVIMThCT1h1RkNMWEtRSkV2VzdsTkt4?=
 =?utf-8?B?TFZtNi9ZSDZKVkpNY1hicDQ2bTQ1NEtaSExVa3FZUDhaOGIydzNRWDVWQ1Ez?=
 =?utf-8?B?WWJrcnBGcFJ4SWN5dTBFMG1acUdWVXNqK01wOUxVZzVFYUZPeUJscURadWh3?=
 =?utf-8?B?M0NXMzR3ZnE1YkdrSnNCbTFBd2xlUmkzYmJlejZMSjhXYUpQK2tBTHphWmc5?=
 =?utf-8?B?U293c3RSUFBiZ3F3UlJQdVR4WEJJOHBadEVza2k0UnNXangyS0N4OUV3VWls?=
 =?utf-8?B?eGticWJwbUJkUGltWXkyL2dKNGFORUMzYjVDT0V2TFVjUWxwTFoxK082SUM5?=
 =?utf-8?B?VHFnSnNjaWk4bkhPcTd5VThUMGlHa1lEemltVGhXU1dWd0lEYk94QldMWm1U?=
 =?utf-8?B?YWJuTjRVUDZUTHhjbi9Va3I2ZitGbVFEV1FPL1h0SEV1R1NpcDlrVW9XWFhQ?=
 =?utf-8?B?TmxXaThVTkhFNHZLaElpNExoNW16RjhSODJNeUxjQmhDVjIwNWgrb2lyb2No?=
 =?utf-8?B?VmF2TkRNTldQVElBV09sRnBYbTRXQ3ZieFhiYW1nMCtFNEI5M0RsTVF0SXN1?=
 =?utf-8?B?c1JMak5qVE91QWJoWVcreU1CR1E5a0RCc3NmaXFQL0QyMzhENUp3ZkFKR3lL?=
 =?utf-8?B?MmdIUE5WSEFKWEd1djIyZFhxYWQ0dURqb1BYbmd2emFXK09OUGZBaUJvV3gr?=
 =?utf-8?B?QmJIa1NaNmFEMjFlSFhYMjNrakk3MFQwVndBbStLdDd6MmRGUi9RZS9TOTlS?=
 =?utf-8?B?Y2Y0UVR5K2Yra2IzOGNZUEFyV202N2hTekhVejdzbVlrL25JN2NhbEpWYk0x?=
 =?utf-8?B?NWNYMlBBaVhWb2QrL0duNjRjd0o4ZmFncTRveGNmQUx5MytUaFh0QVY0em5P?=
 =?utf-8?B?R25xeVhuMWRBOXZwbjRpNk1USExJSXFRdlo5d05pZk55MWd0SEtDemRJMDVT?=
 =?utf-8?B?WE9JdysrV1Q3WTROVkttSG1NenY5NEIvUnBuaUM3T1ZtK05QdTdmTkJ4NlpD?=
 =?utf-8?Q?wiYzbr/VRKKhI7wl1V6GnRorM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0153aea6-2ad9-43af-9f8b-08de1ce4eab7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:05.1243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4OvW0OcReBubynaKA02KJsDPPLhoXk654Fg0t1AcUpgMf3FmwLHHkMw6xL3mRbowBeBl6UzTZO6J0DHO5vYjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

Current code on the cleanup path just disables runtime PM for a device.

Using resource managed version devm_pm_runtime_enable() registers a cleanup
callback that sets autosuspend to false and then disables runtime PM for
a device. So, basically the same functionality as we don't use autosuspend
anyway.

As a result, the .remove callback is no longer needed, reducing boilerplate
code.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index df6a4126538d22ff6e02145edb5ac13c2d72c949..f5d0aec52c56664d6074272e276edb0c4175c9ea 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1200,17 +1200,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void imx_dsp_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct imx_dsp_rproc *priv = rproc->priv;
-
-	pm_runtime_disable(&pdev->dev);
+	return devm_pm_runtime_enable(dev);
 }
 
 /* pm runtime functions */
@@ -1361,7 +1351,6 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
 
 static struct platform_driver imx_dsp_rproc_driver = {
 	.probe = imx_dsp_rproc_probe,
-	.remove = imx_dsp_rproc_remove,
 	.driver = {
 		.name = "imx-dsp-rproc",
 		.of_match_table = imx_dsp_rproc_of_match,

-- 
2.37.1

