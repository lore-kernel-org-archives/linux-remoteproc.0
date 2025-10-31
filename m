Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EBD33374D;
	Fri, 31 Oct 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901786; cv=fail; b=OppMf/Rb98dVdmmOVENsVgn+vhpyOHRMNobFNMtKGeoIjwbOSL36lUKL7cvbDTEgH7zYAkiAvEHGN77rCoglfPobpLWvvBO9UTCOBA8HBsMsW10MEGEBHWZccpIM2Fvs43yr5SsEnNulyLSGtDcQIIOQ0r+lTRVq07FXNpdAJXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901786; c=relaxed/simple;
	bh=8CdnUppDBO0Dz8YmLGwT/h0Pc+sRSW5ROgezwbwF544=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qjSn2L9EPqX3fSfROopwuCXyQK23+J2DN61XDklzQS/LIw3/I9LO/WAbb0U8LkVuDlDnD8FYA8bxx4eRYtTW+xM3DZFZXMUUb5/TCOdofZDYEJccwmicrtRNh7vV0Sx8F3xKSJ7tGXfiO8J9SUiYtuvDAUx3eUtOzuC2M1n0YuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gn48MN5L; arc=fail smtp.client-ip=40.107.159.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gn48MN5L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDlQYw9NDcJ/PsYDlTBZvzieEhGT18x6GuXXLGl2WAYPOeMg3mskJ+41cZgGHxqKdKykbaGqYp4SgH2/JSoZ2HrMp+hc4GBmYzXM6HPfzDEEHZEfv8t2k0iFQKrEUOrEWBLOVsOeUn5mCMg6s1eci/1pHVPIJUXMGfduXSoCGR8f7ujZuzc88EizY6l1j8XkAG3HLAIyHHHMQvfqXKV3DJ58d706sGCL6DU9QTVTLhi3EUa7oBmaBVUDQ20OGG9THM/606Yt/Vn+5Y+Thoweh1gf0gfGH5CVLiQhXuOm4j2982BC2m/aSR6bzoNvQDsTU/LxROFjs9VplJ4h3TeE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yb4XEJh46wl+8ohfpGQztVn4iFwSPnrj7H7spt26Y4=;
 b=CjENT2URR2MFtPFoH2mZB3KFHXac3HIXU7MQ0QmpT02QWX/4aVKKvHls8Jpv0w6HtbRDBidu+BoktDUgiImS6nlbK9dRBhHY/4ry7ZOs2wwsATM6Lj5W8/bGl+JbYSf2VKqaGDkReAkGMNJDw7Cv0fBky5VXsXfntIgmmo1GpsZaqm6gV6P44OIeLMIYMNwCZjMSCduEEUUy1pUNtVuEQimoHg9gCNLpvTDOCQHbZ1MiOa8WoQHuWVQgUijNYlEal7jFhhXPF0EbNFK9p8iyKekJybFWOX1At0hleMsYNIeGHQz4YPmoYGLfUIrj0/3Lwa2kmQvEMNDoBy04TKRi5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Yb4XEJh46wl+8ohfpGQztVn4iFwSPnrj7H7spt26Y4=;
 b=Gn48MN5Lsl9eVeEW6BirW3ZQ2qXGGVdiw9OaJKe0sHWQgwk4pydLexjQHLnSf5kQITvkRH4JVknVCbTvPI91aKnKgXM0do7x14HgW3YIqdZ0J4nmNYVbMVCFvkf569dCMU2ZxDb3U0vIPRIhL25nQ+skZeLkRsnPradLNdHBf8RPFcXmd3KJqH9mFS7CbHbbsUHzJmGlIUKvbkJT2yVdQDSTPOIUBt9diFAPiMDk3xP8Rp4QuDiZF0gkFs+ykl2nHwbpJslrHnrCShQH1KZ/6NRv0zU0lSp2DsBwLc4BLPTTQQjedkSwZsOTouiqNNjYRP+HZ/rPF9yhB24Q1qeNzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:41 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:38 +0800
Subject: [PATCH 09/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_SCU_API switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-9-282f66f55804@nxp.com>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=5071;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=8CdnUppDBO0Dz8YmLGwT/h0Pc+sRSW5ROgezwbwF544=;
 b=uxjunjYaNZxKKvSk8sshGlJy1PjDcIsxI3bV7+XEle7sEXxwWHl5/yRzHOiOs53XgBbeV/8sW
 4dL+lUWqWDWD/aob1kXiQpTmnlr7lOv6UGR9s1JQqlUzsXWBB3aA6W7
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f58edf6-2496-4d7a-01a5-08de185d3999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVlKZmtkQ2s4NGIwL3M3bFQwWmtWTU5ubVlaMUlvUFk0NjNGNjJWK1JValRw?=
 =?utf-8?B?WG1jbHY5eVJ6WEtIaTJPL2QvTGE3TkhRbHA0RFBVMzQ5elVGaXdPeEJ6K2Ni?=
 =?utf-8?B?dlRFaVNySm9ZZExQdFdVeXllTkZTQkRQcnRlbFNGTFZKblZ5ZmZXa1doR0s1?=
 =?utf-8?B?VWVRVVZoMEcwbnp2VWZkRTNnMjFZdndib3pwTHRhVVo0NE5Tb2piSStLNTAw?=
 =?utf-8?B?OHhWS0pKZE05NzBEU3BPZkdyYUNYR29pM2VsaDN4UGNNUWRiWXNjaVl6ZVdr?=
 =?utf-8?B?eUJ3clJ2dC9nUnRMeHBWcFBLRE1HYjlLcDM3Z0xhMzdiU3N5eCtYb2lqODlP?=
 =?utf-8?B?aWFiWmRKR0dSVFdrSUpFUjlXVC9VeFBJZElhV3RVR0FJRHRaekxzdTExb2hp?=
 =?utf-8?B?REluTGd6aVB2S2ZERWxVcVVEWld4ckFnTWxNTmRtWWRYQVpxcWMzZG5mOVda?=
 =?utf-8?B?RVoyZFlqTUNYc0tHYlBoTzU5K1BkQlhsbXVlYWhTakZyMkRVLzBZTmRCUkVG?=
 =?utf-8?B?UHBaVHRsQlJLVkFycSsrczM4b2hiOTBTSzNNSmFhRlF1RTJZbTlwWGZpRzNq?=
 =?utf-8?B?R1BZQU9NMXdodXJhT2RwVUdpbDdKQkNiNXdFbTJhZFpkaTRrMFFvTGc0SnRr?=
 =?utf-8?B?ZGNkakpOQUM4KytPbFBGM05LT1JMeVNkazg4bDF1SmZEa1B4bXR0Q3J5TXh4?=
 =?utf-8?B?NnRhOCtxZFFXYVNHNzMxNUtkQmpoM1R6WTJ5a2paektNcDdpdDZybGtFS0dZ?=
 =?utf-8?B?UVhzZ3pCQXc3bS9MNi91aVBva0MyYUdxK25GUFhwOERjOUc3MmNZYWJDdzB5?=
 =?utf-8?B?YTFpKzVQVGNlWDFpcE9PMFpUYml0eTRxUjByd05kVlh6Q1FJcWd4b1VUa3BH?=
 =?utf-8?B?MkFxQ2o5d3lpYTk1U29tLy9LOHhxT2RSbE0reWR2Q2RpZlVVdDZybWI2ZWs4?=
 =?utf-8?B?N1dWSGhWdmdQN3BWS01ETXFhbE53UytWY3hNR1loOUJ3QU5pYTRyZEI0SGRm?=
 =?utf-8?B?Rm5iNWdQejAwTUNYb3A1WTJzTkJIaDl1TzlXaWZhd1ZSWmtnWmxOdExPRVpr?=
 =?utf-8?B?dTEydVVkbGJaeXlUWDVwTFdPWEY1bU9MQWhUeGRGMTd5TWNOK1o3dDdFYnB0?=
 =?utf-8?B?UHlBUk5yK0tkbWdOZldJVVRXY2FJNkxEUkNva2FZUlVncW1OM3NUc3FybS91?=
 =?utf-8?B?U3VSNU1ENTdDaE02ZXdkcFpzODAwV2FWVGNnaVNPL252U0FBd04xQ2Nxb0Np?=
 =?utf-8?B?TGpzVWxZVkNGdDRZbmZLdnZGVm9YTzdHQVNFQndOckxYaGVITWt5by9OWVRU?=
 =?utf-8?B?allQTS92NmhPVVhqU3U1V0F4QUZNNWZXUDZUelFORFNjdzZuOVZ1c0VHN1ZU?=
 =?utf-8?B?clN2TXErVTJ1NGJFZGN3aktCQTJPdHdaQnVaZEZ4L3N2a0pDREhFMjh4RUdC?=
 =?utf-8?B?R1hXR0tWLzVKVlYrYmZZL0ZhL2grSXBJZzJpalRnRVFhRFNPQlNBVGhjTGtD?=
 =?utf-8?B?Y1RlTGxvaEVKdVlnRU02S292Y2R4NnF4MFJlTk9VR2tMYUFKcklWNmt5RHEy?=
 =?utf-8?B?Y2hmblIxamtRM3VCaEE0cURxTWVoYTRZbC9WcERFaGZ4S1B6Y09YVjRXNjBl?=
 =?utf-8?B?U0duNTUvbkpHMysxVDRrRWU0Z25PUGxlbmZJRHVZeFZwWXFUMktLQTJTTkxY?=
 =?utf-8?B?V0pLUWtyenZJdWFhODljbFdXTHNJd2t6TnJ2cGdCQWkxSEZERWJZeWlMa1Jn?=
 =?utf-8?B?MmpyQ0wrNkY3UnlOK1FrcHhhVi9qSHMwemZFcnhKSEJQdE81SXJqbVRnUkp5?=
 =?utf-8?B?ZkdKdkJPNlJmdVg3blVEdm4wZU5FMGV5bUVUK2Z2ZnJyK1BzYXVYUVlFWWdQ?=
 =?utf-8?B?R01WZlVjbW8zQWU4d3kzWTFyQjU2TGVDaDNtU2ZRQlVGOTRyL05CQXg4ODRl?=
 =?utf-8?B?blc2RXJtajJVMUNPZGVXYkIwTGhFdzRrQ2oxMjd3WGQ3NklFeURiZmxMeGtY?=
 =?utf-8?B?aU9maWdtZEdqV3RIKzRyNHdNNWozcngxaFpvUkhnSUdQbkVyQUxJWDdub2F1?=
 =?utf-8?B?NWxtamFzbWlYSG5ZRzhSRC9Qc1JubWVMeFUyUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWR1MUZtbWdnaFM0T2s2bTZ3WHhkekxneVZNU09oRjR4bG4rTEFkelJZUUJX?=
 =?utf-8?B?VW85V0FnSk5lZmdNRVhQbmNLWVlJRitHNUpGU3U3b0pOZDFtYWkweldnV1VH?=
 =?utf-8?B?eVkzN1k5NzdoMXV4cHVza2lNVUtMbmpiMThEUk5xbFdnOHhkRlZsWTdLV0o4?=
 =?utf-8?B?Y0ppdjk5c0s4NVpHalJGVi93UXRzU1dBY0RiMndqbHY5ZnhuTGxrLzRTTHV4?=
 =?utf-8?B?YlpabWtrZHBuNTcyNTYzNUFzQWdBM3F1cG90K1piWlBXaHhSZ2lLSUlhUHpH?=
 =?utf-8?B?L3NBWXBTdkdCZzFMZDdnVjhaSUwyd0ZTNjRNQzg4S3l5L0ZsMFRxa0w0eUVS?=
 =?utf-8?B?eW5Pcmx5U0lLS2E0RTVUQ2dZUlZuTDdnVlNCQTluUDlyVVFndXcwMDMvcVRY?=
 =?utf-8?B?UmNhbHB2NFQzVGgvSXEyaUI5Y3BaVGpRWU5mK2VXVzlDYzJJNWRDckswaklD?=
 =?utf-8?B?SjhRc0ZJMTdUNFp5Zk1mYU1TaHBwK0VDelNSRzdCUTBCRWxjcU9rdlpQc0tZ?=
 =?utf-8?B?KzlGOFNOYWVNNm8yNHg3K0xiZkRJcGRidXlySE9LT2RxK2JtSDhNeWo4c3RO?=
 =?utf-8?B?dGVMUWUzMVlKK0p5QTRLcGMwbjg3c2ZSTENRNEFlemlONjNaUlcxNEl6MVRv?=
 =?utf-8?B?d2IvejFSUS9pL1JqRUd3KzdpV0VkT1BuRmVPL2R1WlNYcTR1aEVJS3hGbkp3?=
 =?utf-8?B?Y1hNTG5BeWVSL0dza0dYNDl0cC9EQmN0eUJWbFdiVnRySTlUVExaM0NFN0hr?=
 =?utf-8?B?bjBLc2pxOGl3eXQvY2FReXN0OW92MGxHS3BxTjltVGVNN1oxT05Kc0sxb2N4?=
 =?utf-8?B?UDc2eDdXSWhFczBFcEEybGVJNnRHbENxMFhhZ2VLdFF6QzRvaFc5Sko4b2JI?=
 =?utf-8?B?andDVVJDQUJ0M05wWkFqbm5aWEhaMXIxajE1UUdSai90Z3l6L3crZytzWFBZ?=
 =?utf-8?B?S1UybmtadjM1bHYwMU5lNkdZOXdLWnpJM2plMG9ubUtQZGFnUnVaRFJSdHFm?=
 =?utf-8?B?T2pqQzB3dElreElPdXlnbXNzM2JWdGw0dEhqdjQ0K2NtcVZTd3FEenlnenJY?=
 =?utf-8?B?Z0FoT1FxVXZtbXFhalFKMS9aRG5waXdYK0VDUzRkVGoxS2NTRmNpaXFodVpu?=
 =?utf-8?B?NDY2YlhSZmRBR1k4VXl6SmV5clRyYTQzZmtRTjEzOTgydlJ5T0x0TENMUkRn?=
 =?utf-8?B?VVNUMEx4TWFaUkw3R0JHYzdIYWZvMzV2OThlak52RWN6eUxWZGlWSU83S2Ex?=
 =?utf-8?B?ajRyNG1XL0tzYWpqYUZhNTRTWDFScXlVOGU4T2VoSktXM20vcWlKUWJSNlo3?=
 =?utf-8?B?VE41eHFYNUxlZFdMV0g4U25Dd1B5TGhjUXRCTG9hbmtkOHlidS84YjMwN0pz?=
 =?utf-8?B?WnhLUTEwdGhvUmtURVBkdXJoc3VLYkwvajFaMmVVZDBEeWhQRi9IaUFySVcy?=
 =?utf-8?B?K0hEVXZDTnc2UnBYK1hSUGlpZS9XVC9RTGUwK0xmcW90a3dRd01YYUVKVWto?=
 =?utf-8?B?QjcxUlVZbSs1OE5tVFFnUUFvU0NkTU9jeVNucy9UbERJYi8yV1NtS3Fpc05i?=
 =?utf-8?B?TkdnTEZ3Vm1uWkVhTUdNd3pnSFVDMGRrNDU5VGZHbkhMVlBlMVMxR3VDUkRK?=
 =?utf-8?B?S1BaQUIvSWdkTG5xV2RkMEdDaUM4RVBEZG1VaXdoS2ZSWlJPZTRYUG96SjNs?=
 =?utf-8?B?ckh5QkJmSDRUdVVRc0NJSHFhK1Z3UjEzM3NjYWhxbjBkc0lMQm83UkZFOGp1?=
 =?utf-8?B?MVZqV2lvUHQ5UkY3KzNLVXhMM0ZMRjMvSWRha1g2SUFZTUtVaStjWjl2RXpD?=
 =?utf-8?B?K2xraXN2YzFnQTY0STRhLzhTejRjTUR4YVN6ZldwaEsvdlR5VFVuTUE5NlZN?=
 =?utf-8?B?Zzl4Z3B2RzRTUzdKR1ZNVUNqUmR6MmdvV3B2czQ0VkQ1TWpyYVlXeGNEelFF?=
 =?utf-8?B?U1RxYm1SdCtEVnRWUnQvUW54akpDOVdGMHZSK1Y5TkNpdmZwc3V3MmJpdjIw?=
 =?utf-8?B?Nm82ZkYwY1FrTkJiaTlxMGRtdktzZDZOYW4rdExsK3VCMUlDRWphS253RWYy?=
 =?utf-8?B?RnQ5bXc2bkNObnQ2VWhadXhsM0dqTTNKKzBTbDQzV2RkRExNaFZTMVEyR2ly?=
 =?utf-8?Q?foC7aYlRektzaZt3tLz5tTCNj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f58edf6-2496-4d7a-01a5-08de185d3999
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:41.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ez5T2r8fughPJoz0UWgfgf6IWJVDtGPmUEi8U4kG+8gyqCnN5db6gEA9de7WLxfIO/D8nLFZmWeiwdaLPxFHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Introduce imx_dsp_rproc_scu_api_{start, stop, detect_mode}() helper
functions for i.MX variants using IMX_RPROC_SCU_API to manage remote
processors.

Allows the removal of the IMX_RPROC_SCU_API switch-case blocks from
imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
maintainable code.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 48 +++++++++++++++++++++++---------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 456a46f163d3d823a25d16d11fb79fa9fceb2ddb..56e94754d5c5feba112227c45b0f99a4fe868926 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -347,6 +347,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
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
@@ -369,12 +376,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
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
@@ -400,6 +401,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
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
@@ -423,12 +431,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
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
@@ -1057,6 +1059,13 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
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
@@ -1080,11 +1089,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
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
@@ -1322,6 +1326,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
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
@@ -1354,7 +1364,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
 	.att		= imx_dsp_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
+	.ops		= &imx_dsp_rproc_ops_scu_api,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
@@ -1365,7 +1375,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
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

