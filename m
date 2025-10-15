Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF26242D6F;
	Wed, 15 Oct 2025 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536418; cv=fail; b=LxsImRNIVwdlSpDnukXNXlaf8JI+424Rq08XD1bjJ+8pWPZ1fxVXMCf4bPzvARBtVs58XRXl2E0IjEQNW8nCgpnBBKScNPxGsJoZYsibHqds4l9RH9OuJlrb7B3NkjSOiOQlcJfIfJ4BGoldyHjlH3XahAspq1aj1xTgUqXf4AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536418; c=relaxed/simple;
	bh=VXYpdHvUw57i+0LvSXSztrq0W9UubBlIsjx2j57GckM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Oosv5KLfgcWMKRC8odoo3pCtav8Ak3N7dBuOKdfSBpjI276qSVhdeL+MeD7OLBNDYIcunN+lj+YXS36rqsDt+YFggNthmyw+pmHVegjIVKEaWoXXvfdtc4iNIitXNpK0aIKvLKYC1joNuZ21scXKlpEL5aRg+1x716UElSdig84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SVHu9csy; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SVHu9csy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDqHc13jBE6arZjHSp/itGtngLdFqnnSerIK32DzUuLjkRQ8KJKkBmO0Hjg6xJSxFIgbVaNaUUADtnKxz2Y8vx7PQLBUfsffpV0fGLBJ81r6k6OG0MWUb4bL7T55uqiAJsjlV3T4SZH8LLuj2lUJhhLK2dhVs0H8aSwrm0pmTavrpOWCXqOqx/w8hqxtBV5PT+WDDgjlpBOuYRe7AuwTMIKoVaIa+nxqp8ZmBA/qg0G3NyRjReOujf4Csp6KNWSUpGtyOhWRy4KlwDHPI2caiYEHERB9CJlwRDOtT2ccpXl6Jw5NvWQN1skoUQgWslEPfvlIGuH1pA64kMayw1yBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPWpybrGn6jf5Y+4QJCjSXIb0B5LyOL5jkhUOnY+GXk=;
 b=i2fSwnKkpdZAw3xYeLf3tGF/KjXnZp8os22LPbg3roiG2y7GDgPx04goJnuO6OQJrbKCb/kEk1qvDJhXoKqQFUFQslF5d48YaYXEY5+QBh4xdsS9kDCCR1mOa+mKSb/PHGQyKOwgy9oO2hqIZMM5lY3kerdlTiUmyV1tNZrfGVmE0uGJ0d1VuohP3OgP73diiwyLKQ6oruy7Pyq5+W9B8SDNRQhK9O9fypoWTCVdov0D3lXb+ZZ+65tqftICmYTfvJRckIaEt8ZwgW49cj4VL8ixrfYIle30ExSHD2nJa+reWHJK/rFHdjRZudiHbHMOSwjUyjAxVrAl8xLJaa2BFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPWpybrGn6jf5Y+4QJCjSXIb0B5LyOL5jkhUOnY+GXk=;
 b=SVHu9csyw1EIi5dhXGo+nFOOPzRXRApIYPg7JxRLCfOgT1qZvoUcPCxC5q/tbeVEyCVUqSg8bO6fCUvnKucamkRdUXmMn85Hx3HfgecLv/x8ZdVotH2sYj/zHuW/tCAtRlWs0egQHpSOKC2JmPiTlrBWudu8klwSPQyteuKKmtVRb7BnVwOfgIoAwKqU3DO7+dpf4WsWgIgaRu39RHjzDHFAXoRNgDCD5KGDXBSLmWNVaapyqV3hQiRo1C8opspmrLWWL0kfGPjEQHduyFLeGFH8S/3DzxmAjNWe+nifwVBOux1ZxbgI5qJl5C0rF6ZnCH88y+vmyn8L+k6blZCEDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 13:53:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 13:53:32 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 15 Oct 2025 21:52:56 +0800
Subject: [PATCH v3 2/5] remoteproc: imx_rproc: Make detach operation
 platform-specific
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-imx-rproc-c3_1-v3-2-b4baa247358d@nxp.com>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760536394; l=2976;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VXYpdHvUw57i+0LvSXSztrq0W9UubBlIsjx2j57GckM=;
 b=bimuwsff9pVAB1pNx3py1Fj4OFDIjX/kbhj+wiyjlqrBeiCESfMTbxVFaj4Z7FQvCAHhtb+wf
 LD8+tpX4P6mCEITobrwLRx5H919plMqoZLNw+UKvoVcYO+XlyrPPdur
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f3c7b9-48bc-4460-fcfc-08de0bf23a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WktKbklyeG9Zb2hWdnA1ZXpkb0dsK2FmOThESm5XdmQyS0NpckNabXhxSnNH?=
 =?utf-8?B?c0pYUm9jaXdIRmpLS2cxcG1IOHdISUxkcVFoby9VNG12bXNrOWtEOUJoeU1r?=
 =?utf-8?B?d0l0N1lrUmIvdUZyam53VUpwNW5weXpFN0FQSy8raS9HM1pxTUQwMUJnSmZ5?=
 =?utf-8?B?ak1MdjFLZTV0MVo4TGRDUkNrbmRSK3hEdkw3eVJCUFBjVHlkTGx4V1d6SElX?=
 =?utf-8?B?WWU4SGYyQ2pTb29nR0Y2b1pTUVJlK1o5UWhmZHpRUjBBVTZlajY5VXduQ2do?=
 =?utf-8?B?NThDME5Kb3FwaDhOZmhHYVZrT21QREJzNE00MmN3MWJWZjBHZE1BeXlITWox?=
 =?utf-8?B?Rjl2cTZLV3lxM3k4UUUyditlWWFTdHNPZW1wYlVmMDRISTJhZ0hDL01pZ1U4?=
 =?utf-8?B?OVFMZ3Q3bVlyeW9SUGd3cTVYYXExUzVCdUlNVkIrbEI1RWtaQU1XMUR1VEdQ?=
 =?utf-8?B?SkxBbEc1R050bWZhQWtXZ0tseDRJTk1kcU5qbm5HemM2eFc3ckY2NXpRNWpF?=
 =?utf-8?B?LzhncXdNTVZEcTgzOW9EcjZKMmp6Mm1neE1YQVhzTlRBb2dldFlSUng5RWd0?=
 =?utf-8?B?YkVqYjM5UUhpdmduYlBHU2RhY1ZEd0J3bVp1QzRVQnhHOGJiU3lHWG1HRS9C?=
 =?utf-8?B?dXpCaWRHNWUydS9NWXBqU2hibENablVaMkhqR0IvQkI5VzFqTW9tVkJkZVoy?=
 =?utf-8?B?YjBxRGgwWHdPTGFLSTFPaHo4dENCS0h5aDlwU1lFMnVVWTNSWGw2ckFHYVVo?=
 =?utf-8?B?SFN4bUhyd204NlgwbEJpdEFFc0RWSGpYV3dVMHJGS1Y5K28vU0luTlJYaVlL?=
 =?utf-8?B?MHdJczlVVlVrNXJVQjlnV1k1QlRQZUJFWDY3NG1mREgyL0cxdldUbHlTd1k2?=
 =?utf-8?B?N3QxZEh1c1k4YnluWGp2bUcxL1VqcTFSR29ubUNKKzlpR2E0eG1ESTNibTZS?=
 =?utf-8?B?dGIzQndYZ1lSUlJVKzdRNGwyUlpocFY2bnhtZEdlSU1MTlBYM1RjY2U5SjBv?=
 =?utf-8?B?cnAzSU1PUkJJNy9xUUlaUEdoRmJYamNyck5KNzdRTm1NQmNIcnllWjJ5YzZY?=
 =?utf-8?B?QVZVVkFNVExPVGM5RVBWeC9CREtEcU43dCtSdW5laDVEaDhFaklhaXFhbkpD?=
 =?utf-8?B?WWNuNVFxYkVPbVRydHdKS3JwOU9zSGRVdHZIZisra2Y3dzNnWk1Ta3N3elNJ?=
 =?utf-8?B?L3FDU2JxbmdmRFlyT2dtYnRnYWgybW1EeWdYTmZ0V3dWQy9JZnNWTVFjQ3Ja?=
 =?utf-8?B?V0FkdGVsNndPNWdMSlEwd3dENTBJMXAzZTBjRjF0eENnNmFxVDlXUmRIOEpq?=
 =?utf-8?B?QWVCNEtFbFErWDBhRTNCS1Q0aXN2NHdXeXhUVDJwQUhjVm8xaExGYkZYbW52?=
 =?utf-8?B?SzRqS3JvUGRtVTd6S2JLbW05QkYyQ0gwYlVkb3N1Ym13aGNLL2MycGc5MXZk?=
 =?utf-8?B?b1BHQ2R6c05reHBXZzhOcDdvUUh1eUt3dGtFNTUveWU0ZU5ZdnlMWmZ3VGY1?=
 =?utf-8?B?cjNQL0NMZGJFNkxYbTJwY09wdzNvWEJYRUJiQ0FZU2tFS1RTcSt3QnlUYkYw?=
 =?utf-8?B?SzEzanI2N00zcXkzWnl3cEUyOXI1SURFVGlaUkNsVXN3SlV5Zmx0bkFad3Jr?=
 =?utf-8?B?SzBlYmFlMGwwQXAzMnNGWktHL0d4VEtDUFJiMHJNTm1jcVMrRWtXK1Q2enBC?=
 =?utf-8?B?VjRUQVcxSFhnR3pzckUrVUlOMGt0MDNsMFdUOGk0RlcxOFJJRGNmUG9McGpC?=
 =?utf-8?B?WFRYUXB0dHB3R1FrcGozMkxSWS9yZW0xSUxIQjl2bkYrYWxOVGhTa2RvSWtS?=
 =?utf-8?B?eEJVZjdVVU1QZXJkZUhvaXAremJzODJqYktqSkZMOHM3V2NHUHBqQlJPc3Nm?=
 =?utf-8?B?U0xtdzNQWTNQTkNYT2xKcDAwWEZ2aFd5ck5nZWZpSVgrMFpKUzRQOGc4ckZW?=
 =?utf-8?B?NWVrMnExcVZPUTZXcTRLNEZsSjJDei9jaW9VbzlqSkt6ZHEvYmZGVWlGSjZD?=
 =?utf-8?B?cGF6Y1l6V080a2I0OFI2azdiSWJDR0I3M2VXMzZiaTNURnozbVZoYW83d2Vn?=
 =?utf-8?Q?+oFev1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEErM0RGR0Y5dzN3UG9GT3dLM1hMNW9ZbjkzT2hIRnk1K1JDSVZBQ0tjV2ta?=
 =?utf-8?B?eUJ3Rm1IRk5oaDRtRCs4YXRtblpFWkJxV3ZjcERlTVR1dlRKb0s0UVBuY01N?=
 =?utf-8?B?WExnOExsa0x5S00zN1YzK3U1VC9meG1xODVMN3BiYjRvSVpZbTE5eWVKa2ly?=
 =?utf-8?B?a0FsZWtobDZ1eWt1TG1yZFVraUlIaGlNQk50M1FvdWNwMGMxNDcweTh4RU5h?=
 =?utf-8?B?KzlaKzE0aU1uaHNvNUNhdk41ZVBhdnZ6eExVWS9mcXVPU0hVVG5qcHZjNzBF?=
 =?utf-8?B?ZHlTOG03VEF6cERlMUUwc3FCSXI5aFg5UjY1M0lVRkhaTWIrVGdSUFBCWEs5?=
 =?utf-8?B?MTViaHZ5cVdwOUNRWVYwRlJtZ1hZRWZ6SEJYd21TbFNBQ21CSVo5WkJ3ZExP?=
 =?utf-8?B?QTAwUnNwOFI0UkRnVEo3WXhXNTUyVjdXNS9JUjErSHJUVmhxL2VCRTJHNXZO?=
 =?utf-8?B?KzhZTDlCdzZ2dHhyLzZDZk9PeXVnSVVmdDJGRHJPbDlJb0FOektYSmY1ZzdO?=
 =?utf-8?B?dk1EcnpoL01mWlpORFhsVWE5Ymx6M1VXVHpCZFZ5eGsvUGFmMEhzZXFPc1lN?=
 =?utf-8?B?d0Z2UTlXTFBnS1l1ZnN5TFROQU1ySFVWb0s5aEpWbFFobFdmY2E2TGZBZ1NP?=
 =?utf-8?B?ZUkzWWJ2NXhCVmF1UlFJZG1qQmNUQkZKOWVkaHloSU1CN2xlMmcrUHpVNlFW?=
 =?utf-8?B?czQ4cms1RW54YzFONUMwK1NUTlZSUG45VGVPLzk1WUFxamtBVHJ6SHBxMXYw?=
 =?utf-8?B?cU0zNUp6NE1PbzdOSE5xSHFuYmF5aVF5NkZqUWpya0FhU2h2alBIOHRGK2or?=
 =?utf-8?B?MHEyb1lvaG1tZVRCUGFKWXVGOWhGWlg2WE9HWUlVMWRrVlJhS21Dd0M5QUNT?=
 =?utf-8?B?cDZaV3BkZG4vZkx2dWNoMGJudlAwdWpvaDZQYStXQkR5TldqODBqS1ZUTmxp?=
 =?utf-8?B?UWsrUm5jczdqU3hZa09BUGw5RC8rSERrTnJCZklhYmRGQXI2azdhL2FRRXpO?=
 =?utf-8?B?dWRNMHRvK1owOWExNk94WmI1c0JpK2ZTZE4zVEllVzV6bXRvcDBmcURkMTNL?=
 =?utf-8?B?NXFBUGV3MFdUODZJRmRVMXpIRGp4OWlBeEJ0N0J0K1dCSVNFd2Jib0Zud0VY?=
 =?utf-8?B?OFlIY3FpODZad0hzY3ZLVUU2Y0tmUWRRRVdIVHgwZ3hoc0ExaUFZM0tzR2xE?=
 =?utf-8?B?by9qYXYyRWlBcWFXWm9MOHgrSXRpdWlwZHRIYTZsZU9KVGkvUHJDa1FpeTh4?=
 =?utf-8?B?RGFSazM3dkJLamxBRTVQYVUxQzNxSm4wZFpqbkIyVmxkY1o1MnR1cmljZi9O?=
 =?utf-8?B?WVA1bm9nYU9BZXoyQ1U1ZE9GTDZWVVo2ZnFDdXBRSjM4L2RYcU1qSUpjeVpp?=
 =?utf-8?B?MGp3QzcvYWxuTTZzOFUxUkZsRDNOU1lXbFZBM09PZnlXajlkSm9HN1NwbEo2?=
 =?utf-8?B?TkczUmowNWpZQU9vS1A3WkxZc285WTQwNVZ6T1FUbWtIVEwzczk4c3g5RmlS?=
 =?utf-8?B?dmNEOFNISlNWUC9OSkJHZXhNektNdFNpckw1OEczL3ZxenVuRGZvUnNXRHp1?=
 =?utf-8?B?Z29ZWFhhcXpYU3lsWldlMFBkRk93UE5uYS90QWhSdW1wSDNFODZmTC9qQlAr?=
 =?utf-8?B?R2ZsZGZCblZMbXFaVmcyaU8yajJ3MWI5NDlNbUFiZlpNSEc4TERiNitFcFlx?=
 =?utf-8?B?REVzOThrUEdCd0tDRlVzRGhVTGNqM0hoWlRtVTdOQmdOV1VObUExUS96WTVw?=
 =?utf-8?B?ZkxMTEpBbU5YTEoyay9XVE9JZXgwS2duTHN1WkE5QU4wMWlLdm9rb0dPWjNY?=
 =?utf-8?B?YjJxYUNGcmIyZ2tHUkZPOUkrNWorYk92eDBCNy9PcTMxZU9aZ2NQSU1jVHU1?=
 =?utf-8?B?bkJnQmdwVDNhakl2NlJvRDNjLytTanIyOGpaNlRwOVhHV1o2WDhDcDR1OTF5?=
 =?utf-8?B?aUJ0ZHNyUzQvbG9hWUx3WlpiVGY5Q1ZlakRtcURpLzMwNmZOVFR6YUlqOE9U?=
 =?utf-8?B?Y0xvOUl1R0tpa3J2TXVGNDJEdUg1SHpSdW1zQTc5WDRROUQwM1BuSDlxVzhX?=
 =?utf-8?B?dEZsQmFGaEFudUhHczJYdnNHQlE1ZzBPbXdXWkdxWkw2NFkyUjgwN05aMmhE?=
 =?utf-8?Q?eNLyi8mJzJ8DUpbq8NcGP9k0P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f3c7b9-48bc-4460-fcfc-08de0bf23a6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:53:32.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7cpwXrBTKyDDpJmbLRp4Of7NtWjLD03VoSEvcIDV93UcHSwiob+A0DHh5tHcxc3YSW1y3worGuYwDXDZ3taoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612

Refactor the detach logic to support platform-specific implementations via
the dcfg->ops->detach callback. Allow finer control over detach behavior
depending on the remote processor management method, and make it easier
to add detach support for new SoCs.

The previous hardcoded SCU API detach logic is now moved into a dedicated
imx_rproc_scu_api_detach() function, and registered via the plat ops
structure. The generic imx_rproc_detach() now delegates to the
platform-specific handler if available.

Also, the dcfg->method check with IMX_RPROC_SCU_API is removed.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2a71863c09e917719301e02c3cd535a2852abbea..820b0cd5adbb17ce5665e7ec2786bca23f1a67ea 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -575,13 +575,9 @@ static int imx_rproc_attach(struct rproc *rproc)
 	return imx_rproc_xtr_mbox_init(rproc, true);
 }
 
-static int imx_rproc_detach(struct rproc *rproc)
+static int imx_rproc_scu_api_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
-	if (dcfg->method != IMX_RPROC_SCU_API)
-		return -EOPNOTSUPP;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id))
 		return -EOPNOTSUPP;
@@ -591,6 +587,17 @@ static int imx_rproc_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_detach(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!dcfg->ops || !dcfg->ops->detach)
+		return -EOPNOTSUPP;
+
+	return dcfg->ops->detach(rproc);
+}
+
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1162,6 +1169,7 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
 static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
 	.start		= imx_rproc_scu_api_start,
 	.stop		= imx_rproc_scu_api_stop,
+	.detach		= imx_rproc_scu_api_detach,
 	.detect_mode	= imx_rproc_scu_api_detect_mode,
 };
 
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index a9cba623560c85ea37e47401c392c06dada500aa..aeed08bdfb5619c7afd7201589f417cfd6745818 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -35,6 +35,7 @@ enum imx_rproc_method {
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
 };
 

-- 
2.37.1

