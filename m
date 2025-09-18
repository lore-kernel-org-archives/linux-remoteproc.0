Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE272BF012;
	Thu, 18 Sep 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196304; cv=fail; b=JtyevbSr1Xy3ZRHkmTTjWFDR0bEHkhltWmFYgGNpmKHXalpqI95zX+SMN7Bvv68CDi04Gt8nc4bn597JIGxFYgrq7MbfuZ+4vGSZyeDu84YS0i864peybFEhK1o57QpJROTUej8T3QAE9Sn8Qy3THw/lSPEDFMLwj24vZh+5PHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196304; c=relaxed/simple;
	bh=mNW0/0tQk4TWhfLEORok/Gfb6mVy4DRf2siaKlVhu58=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jY6ZkDvhzy/GXe4rm/2BHQYhn+00HwDtjmZ3MjOliNQwDHlphdTmmcY6yl9DRwNwMWZzR0+CMLJs574xYeBzt2d1O7D64uZZiZ0aRlqM7iA4jZD4NvmmYpMm/E3UV/uw5A5j0TcCNP0DTKT2XnWp8DAvMwUg3dSy4eqVviuZA24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IfTXgvVZ; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IfTXgvVZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZcjtkVjqMmxnHNdOL5Gs8GMZReafjff37WKKHP1HNY6/a+aGv9l7PvSLRX9s/yONBgbCQOWpxO7toUg75wYKVJhZlNmpYuACn+cRgIiQ7VMmAU4e2mFKHnikNZECZ0VwaZyzrlCeLJuxxTig3JzyMnFv/m3deus1tbMgxGRXmBnd/mjMPA8c2N9zu3dZvHForVCQQF486CjOgXVTL7YCmfSDbOWu+lH7XzMNsrNjEGcYcBzQZ55/RocO9B+RqX+33M0LqLkTvjcSC6XRTGiLN/yL8X6yP0lWLZW1+nUYbP7JSlLwYusRX4Y7ulwAaO7jODIu3URsnWN+wTuSHdoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1li0KeW0BjYChh+oPlZ4f/CxYDHZf63pKXDn+4YLauA=;
 b=GPeh1Dbc5nn/VoJ9dEzHMnMqEyVJwMXkOJXMX35LESWfTu6TkxsaHcECJL4K9gVhkOt2lF+GD7tLYP/+oh5ZmvRbAoaOaEUZFHnkrPeafrqNQnM3575MdcU5+gWZjnJllDyjw2v844F9i/JQWwRfFMGkGWcJiRfxsDqnDqcMwZ3G0nUrCJ5AC0ah1Q88DPbvtsWrtveBTU53fkO9+czmadOJ2vKxLab0Bc6x5TqL7BPTv7CeJJ4kUKmSQpuY8c8sY8APYpz9hTKTLJDuRLjp28ehHcGH49srg2fa1xP5hiiDVDlrN5l6iwjTSiEsOWz9Ph9xmG8HdsHHPQh/3GyGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1li0KeW0BjYChh+oPlZ4f/CxYDHZf63pKXDn+4YLauA=;
 b=IfTXgvVZCv53f+CYFEz9AJirEBeKBOdTZ0OIaJrzEQpb2UZRGHc08dTdDSwUdwyQSMLhRKGcLjKsJls30qisxvLbFAzIrjhfOjQ8Bu38U/GXySs+8BpSmHc4aF4FlVxK/0W9C2e/gaNUBnOZKP7toHask8KXp82EWw9cj86RnPvT8tuS7pQJ+MI29lGhajSqSlBoGoYa7wh+QU/JewHf5i0sdNz8Z9joMunAPLpf6l2bnZOzJj7xyZ5uGCiUUGim5d6vLQq8nbRxzcZoU23xX/b8Y3MPS5L8/iLhWLtU5HA1cZFPjVeGYE5hcGig6CBRzKJdX2fFwJxAsuIDVSDB9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10450.eurprd04.prod.outlook.com (2603:10a6:150:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:51:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:51:38 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 18 Sep 2025 19:51:16 +0800
Subject: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758196288; l=4741;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=mNW0/0tQk4TWhfLEORok/Gfb6mVy4DRf2siaKlVhu58=;
 b=2KaSHVM/x4+wgX+l+UYnBKCwP1FUqN6JwyP+vNoWX/4qD576QIzrUU/GaReTqSLitlTVQFSu7
 EGlYxObTECACVRxFguamo10Nq0Te7FLgI4Y/czCNjVwDtzcOaVNzi9X
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10450:EE_
X-MS-Office365-Filtering-Correlation-Id: d360ec79-66f9-49be-162d-08ddf6a9b9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REVQOW9rZFpNMmVOTXUyaElacDhUVWtHY0wzajZoM2x1QmpHUERzOTFPK2wv?=
 =?utf-8?B?a2lhU0pMd2JpL0Y5L1k3dHFFNVFGQUhhbVRqSGhuMlVla2hvMVBEMkFGd0Ew?=
 =?utf-8?B?MlU1cUJkUGZXdlAxSEpmNzF3cVdaek5TTk1WaHFnSTZHUFdnWG1sREkzQUQ0?=
 =?utf-8?B?NnM5Zkx5TlhZNHRqWnpRL2tNOS8wWUdpOGRUQUlOb25EYWdsK3B3bUFYUG52?=
 =?utf-8?B?RVJRSFZ3aEtraUs5czBQWE9JV2NkdjJ3YlMvOE9DMU8rLzFzQ0VnRE1PNTNy?=
 =?utf-8?B?SUt1eGY4RURVZ20xeUtCVTZsL1Y5NEVhUENkbkZtTFNVeFBkMjRIWDFMSm9o?=
 =?utf-8?B?K2VMRlI4UXB3b0NDVXp4dS8rUkIwUjFrV2ZQUGxJOEo3NmJpY25wUCtzem91?=
 =?utf-8?B?Y1pKcWJZYm5EYlliRXo1MnNRSGdpZEF4bUVBREVQaDg1VFlSR29YSU42M3Yv?=
 =?utf-8?B?a09aL0hOSC81cW5oQnhwaWhlUldianJWL0lPazBENUFVUGhEcTVlNkFiUTBF?=
 =?utf-8?B?TEg5eTRtb2VvQlJIYzQ2S044SlpsWGczTnlIQXpHOHNkcTFQekhSZElVYkF4?=
 =?utf-8?B?MmJzbWcvZlRNYXlnK3lBNlZyb3JrMGRIbUhPT3gyNTUyZkFwSzNYeUZacE00?=
 =?utf-8?B?bVIxcnVjTjlFUFBJR0hzaDI2b2ZPeEJUUlhjUjUxdzhuYXJlNUZlTWRJM2t2?=
 =?utf-8?B?cTdTZ2J0OTlPYzAyYm91b1Zqa0NWNjNEMzBhVTY4UjlNM2xrQ2RmOC9PcCtw?=
 =?utf-8?B?NDhkMjd2T0tod3dRU0tra29rNGhWaU51eEVDNlkxMVU0NjdzZWRNbEs0U2Rl?=
 =?utf-8?B?UmR3clpTeDhucjJLSFBuVWNlb2JTYkpNSnk0UWQ2UmkvWTUyNXpLWXBmTjRU?=
 =?utf-8?B?MG45WGthbWdZUmxMNWZtYUlqcW9rNzF2Z3U1OE9iQ0FBZHY0VUpSR2hTRXJr?=
 =?utf-8?B?REpNSlE2VmZpWERRVlFEYnNDL2EwdkVNaFZHS0t0Qm1vWEVEeXFRdE1hc1RQ?=
 =?utf-8?B?bVJkRUNqKzFyMmxrNmRFT0Q4bE4wbDd3QkJpZzdaamlaWm9WU2d6cnZWRTRv?=
 =?utf-8?B?RnhPSnduRW54NUwxOWE1WVJxd29aUmtuOFI5S21RUkUvN216MXE4VWVPWVpm?=
 =?utf-8?B?eER1bHdlcHhRR1g1SVVWSUpHQUgvZ0s5bE90blYvMlJiVStOYjROSG44Wm5C?=
 =?utf-8?B?Sms5c0VKN3p5blVKSDZ2RDFYc25QRm1rTkxpcHhyQXU3dXlmQnR4dExobjE2?=
 =?utf-8?B?NFNEQkpGWjJtUXB2djQ3OStyVFpFZDhHVjE3S3FLNmVmOVYzZmlHQzhMdnBw?=
 =?utf-8?B?cmVYcHB0WGFkUXJBaGt1ZmpuQzBMeTNrWFRsenNGRVRkNEltZVUvUW5PTWVp?=
 =?utf-8?B?YU9vY0w1TVRra1BTM1grT3FnRmJQcHB6YzFqVUU5NTJYZXBFWkpmMzZ6eVZQ?=
 =?utf-8?B?RnFjekJPV2wxaDk0aVJHOHRlelVROVB0T1Rrc0R0OFdVeEM2cTd4YzBVV2Ey?=
 =?utf-8?B?b2tWNUZtOGsxaHdsL2d5dlRPMUtSbFZwa0RuRDJrM21oSTRGQkV0QkdpdDBD?=
 =?utf-8?B?SXRZdzJleDFDb0RVbTZFMytLUGNadHl6a1IyRVQ1K1dTRTVoR2tHUHFONHEy?=
 =?utf-8?B?Mm9PM2R6TmdGTlFJS09qQ0hlMnRseFNVV3hiQUtocDBzdktUcmRDS1V6a1ph?=
 =?utf-8?B?UEhNc0txN0U4TjI1QmRHS0dJNWo1SmcxRWhHTkYwRlhpTDQvMzN1RnRMS0V4?=
 =?utf-8?B?RmlsNnYzQThWOWYwbHBVZHM3UGFYaTB3eTJqUXlOVWhiMkNoNXRZSHZGZTJE?=
 =?utf-8?B?b3VSeGI1R2JsVi9TdTBkYkc1ejRjUTlYdE1BZWptTHJYWk5IaDQrZ3NkK3lC?=
 =?utf-8?B?SWNzSTlLbGNEZFh2UjVsVk5jT2J6TjhpKzZKb3lHWTRPc2VBWWJQUGtaUUph?=
 =?utf-8?B?WktHSm14Q28xOU04WGpiSjJMRWJxckRndEJjT0huQkVzSzBPQWxtZ2kyekZO?=
 =?utf-8?B?S3llU3NvRUFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmhrZ1E4ZmV5OC9uZnR2SmVqNUJHK1c4aUhyanZFQVc3L1VYbVJ3ektBOGZV?=
 =?utf-8?B?YmQ3WVl6cFFEUGdhT21tVzk2cTRhWmZITHBCQ1c4MSs5bS83NXhmdlkreGFY?=
 =?utf-8?B?OTNpTFgxYmxGUW9wU2QwSk5CakgreW5WMDRvWnpIdmlIVGk1RU9KMjlXOWVQ?=
 =?utf-8?B?ZjVWVURFV0xIY2hhVHNDZmdXN3UzVVdWeG83S1IyUjVWU0xXaFNMVU90QTg5?=
 =?utf-8?B?c2FkM0EvQ1RITHZhZ2FzWFI5Ynl2Z04vblhkN2ZwU2dnbTVlQksxb3Q4ZWQw?=
 =?utf-8?B?bVRMV0txVHNsNTBiQVlpQXBQYVVja0tvOWp6TWRsT01qeHZnTDVGVUd3QkVU?=
 =?utf-8?B?ZjhGM2Nhdi9ORFFENU9yTTFpUkVvaHdLbGRUSmwvUFlKVFE2a09zK243MUZU?=
 =?utf-8?B?R0dBYk0ycDNKN0xJYlU3d2VwSXNkbWhMUjNvUVNySlo5TVlwTVQwMlg5NHZ6?=
 =?utf-8?B?QTFmb3NYd3NUd0dlYi8vT0dpdjduM3VFVkNZb0lhQnBzZDVQLzBoYmJmSG5K?=
 =?utf-8?B?WmxweWFCQldxcG52eGJPenIyelJ2QWgzOGthRFVkT2h1RnFnQXJsQUJ5Q0F0?=
 =?utf-8?B?T0htWFBLNzNJWXVhaFQ2cmFFdmRaZVR1aDRFdW94c2hlckNRcUlaZElpaTZl?=
 =?utf-8?B?bjBiVVgzbzN4OGJ2Y002R3ltVVozN0J2MlpkbDJQcEE1M04rT1lLQjlEYlJY?=
 =?utf-8?B?Mm8rdWZlVmM2ZTZUblFseklTTHdDai9kSm8vV2tFakxMeFpaY0dJb2pmem1Q?=
 =?utf-8?B?R3JEUnJQRmU1dmpoNk9JdHlncFFaSzJ4WkxtTlBYR0Q2Uk1idkNacXFHOWs4?=
 =?utf-8?B?Y0g0UWxrN3Z1bDBEUG9hRnJ3ZlFRa0MydU1ic2ZsVzJiK0tQNy9XSjNjVTdJ?=
 =?utf-8?B?QVpTYmR6S1JOY25Id05qN1dRV0p5dnZzMGRHSk1LNUlhTW96cDh6LzNVOGcr?=
 =?utf-8?B?NlF1OWxaSk5VZ0JIRWU1ZGhoekFkRGcyRE1EdW8xQjlBWWJhM0YyaWVLR3JY?=
 =?utf-8?B?Y1QvOW43cXBPT0ViNTRqU3JFLzNua2xaTXEvb1RGeXRmVEwweGMzN2MydVN2?=
 =?utf-8?B?L01zU2RwaUZjUU80cm1vc3N4TmhkTUtBM2RjVng2UkRGWUF0UW5OMndXWnRz?=
 =?utf-8?B?UlJLQ2JQdWUzbUZGRjQrcGhncGh3MzFGNzZKZ1BrTzJ6bmpUMjYveXZXaGRP?=
 =?utf-8?B?dGkrZlQxVjArQi9rdEs0VjlQQWkwMzlyTWQwRUxBRVFWaE1FT0VLN3RYTEYv?=
 =?utf-8?B?RE5qR0M0VHFnUktqVW83RGluS0hDS2pJdFlXbkJIZTVrdFFEelN5VldxcEVl?=
 =?utf-8?B?d3dyd0hsSFBnN2hmQ2szQkFaOXhZTmFqV08rdzVUdjBTYkhSYkFnVnBBdkt4?=
 =?utf-8?B?T2dnUVdzbjN2czdleVY1Sy82Zk96QmZJYWNQdndrVGtWd3NpdG44VWF5VjJt?=
 =?utf-8?B?N3dYUHdGcFFyMzhOVTZDN2g5NXE1MVcyYjBPV1lLLzYxRGV2LzVjT2NtalpK?=
 =?utf-8?B?L3pabDlGV3Q3M3B0RW0yTTE1ZC9kemIrUkI5S3Y4K1pxSGQyT0hsVXp3Q0Y4?=
 =?utf-8?B?Mkw4VTB1UHkrRzdqV2p3aVNINXpzRlQxdEdodUdQaDhqR3BMR01SeUE5NkVS?=
 =?utf-8?B?ZVpQeVdGVlBNOUpGYm8yMGNyWUFyZ2wyTFl0ZE9PWUswZytjMC9rK2QycWN6?=
 =?utf-8?B?YUowaVppeDBaaXBrdDJxSTVtWGNTY1phNTlvZldXdXBGWGZoQlFoVzRRUVhx?=
 =?utf-8?B?NWNLd05jSk1uVDJVZ0IzK0ZyTXFJVlNoUjA1Sy93NndvZjhZSXZJVnI1UGpF?=
 =?utf-8?B?NVpEeEM3N1V5RXdnWExUNXNzbGRKell2RVBRQmViS0RPd1FPQnhCYklKUzlN?=
 =?utf-8?B?OFpJQ2pkaU9OcjB3cFROK0dLL3llUUM4WWZ3U1JZYWZFRHBWSlE2eUFFcmNQ?=
 =?utf-8?B?K0RkbEtLbG83ZEtUWHNFSUF1K0VFaTRPY0UrTUQvTFI4K0NlRkZ1K0krZjlC?=
 =?utf-8?B?VTFvKzFwbVYzb1o1R3RkRjhkT2t5K0tDbGFEZFdIb2oxNVUyZzlYeWtRQkF3?=
 =?utf-8?B?aGFhRVp2cGVMYVpQTmRCdW05WkRnYys3WGRZb1BJenNDY3NDVkdNK1NNczJF?=
 =?utf-8?Q?CxRngjI7xm1hr66U5n6MS+oBx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d360ec79-66f9-49be-162d-08ddf6a9b9b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:51:38.3915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wrzC98z2SrOlZdnW7bRMx6RfH7sPA/YjV8VuFk2XzVsmoip4FGecC4WS8lh8Vi7B3N1ERmUjUyzjTSP8Ghl2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10450

Simplify the clock enable logic by removing the dedicated
imx_rproc_clk_enable() function and integrate the clock handling directly
into the probe function to simplify the code.

Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
management is required for a given SoC. Update probe logic to conditionally
enable clocks based on the new flag.

Set the flag for applicable SoCs (e.g., i.MX7D, i.MX8MQ, i.MX93, etc.).

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 37 ++++++++++++-------------------------
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 694fbbb2f34061de22a3a815f8a6114159585f9e..71617b20f9d0ae698e7f655aae22e8895434f32c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1002,28 +1002,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return dcfg->ops->detect_mode(priv->rproc);
 }
 
-static int imx_rproc_clk_enable(struct imx_rproc *priv)
-{
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-	struct device *dev = priv->dev;
-
-	/* Remote core is not under control of Linux or it is managed by SCU API */
-	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
-		return 0;
-
-	/*
-	 * clk for M4 block including memory. Should be
-	 * enabled before .start for FW transfer.
-	 */
-	priv->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to enable clock\n");
-		return PTR_ERR(priv->clk);
-	}
-
-	return 0;
-}
-
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 {
 	struct rproc *rproc = data->cb_data;
@@ -1108,9 +1086,12 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed on detect mode\n");
 
-	ret = imx_rproc_clk_enable(priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clks\n");
+	/* Remote core is under control of Linux or clock is not managed by firmware */
+	if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
+		priv->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(priv->clk))
+			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
+	}
 
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
@@ -1185,6 +1166,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
@@ -1192,6 +1174,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
@@ -1203,6 +1186,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
@@ -1241,6 +1225,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -1252,6 +1237,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
@@ -1259,6 +1245,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct of_device_id imx_rproc_of_match[] = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 3a9adaaf048b396102feeb45488cd2ff125a807a..a9cba623560c85ea37e47401c392c06dada500aa 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -30,6 +30,7 @@ enum imx_rproc_method {
 
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+#define IMX_RPROC_NEED_CLKS		BIT(1)
 
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);

-- 
2.37.1

