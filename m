Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4AB25F988;
	Sat, 22 Nov 2025 00:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763773142; cv=fail; b=X0tb2exnYUtAhoNRn++/l8tgkvWck9tgAyV2FO/J/avk8enCpuPbZ57XKGJe1FAEwBkDZVQhPCSPOvCVi5o5+cX30cMIBmtxN0U7vy4WbGljWXM6VQhKnTvgR90qE0RKEY6eMFs7BcRmlgy4F8Il2ddA38nZiqB/8j3hkuwqLWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763773142; c=relaxed/simple;
	bh=xjhYLecQKz0G6giV4lzIQwYZKWTErLuevPE144Vv6Go=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D2h8EMsnlECrq7FCVN3nyqNXomxF1a5f9a5HLC/YGrWJnERz9Kc+JayYcllSZh2wkiyHDMo8obWmsPRa6Da7umDTK3aYVUd2nDYPfwrk6IdjHauB5CgbBy9z5uo2qDPxnYz9hqGqJnMX7Ed5j8hVAaoOnOdpmTUT56sk99/Q2EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LGy3EJu/; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LGy3EJu/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS0mBWfer49Ti1Ct2hsXKviSiq+Pt3xp0u2MPhXHwj7TAcPOzFjwFwRTvQbIgmpEKFe1CI7HSZGCT9F3Mztr51qMJJrm3GwkYIUYI/f31i+M4dXsNzfMx4T4kZdO3xR4lIruooscI6INjUl6OaCwrecaM6B/LY6iNEY7sPHbn0aYAk53PUEJQcS4vwifKqazO3XnNc1uIYr7BiFA8TtUYNnUj8UmZ9DoLJsnZbfdZk49DchtbkkdyUzSOJojFeoii2QkTCHsgCjTRvCPcT7S5SNiAFDYMMBbEhHSKmSvCyRElTHh5i8KMoS4xSh3l4Tq2AVWCg6EoNRiQC00JghX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=do5kNc+ETNFv/0xBrnHidaUnOBQubf7L+wLSOtv/uq010f8U8wr6ziY7TIo5ObiC8X/Y8f1nwwSZQ2eqDCo3hZKJjVwX/ZgawL66Vo5ALil6A7xTZOWm6cR23Rae1p5ZmIIDQNTQWt6I/w2EXGR9KnNPwHGrXksbbyKiuRbmKx5sTS/tUsWLnM9FECnX3DPlGT62xoouM7AGDpo1U5jDL8cvqKGvy/4H6KMUkbbxNYWTU5lEleJEvZ0LSzFLbtqiVK31viKGVxIrAFFkXz4AHENR94PhHrqzgYqBe0tcLgluYXr8WS2NQpSO9/Xkf22KCF2dYkJP6wIZn6hOlPkfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UFkVWEbuXlEyhQIYx0Mov0Bl+koyt1S1wlVHUGASKs=;
 b=LGy3EJu/85A0mCmf2cVqltORiC0JVsM6/8zxf5Lo691ODpNxNWCu5SOtNEzHRDQUHJeO12J0pIksPhT0OK1PifkbtN0YoktLb5hKYFDJrdXstDxB+ZITuHodh5rfvCK1wDmcAONWp36TLH81r4cbHzU5z/6SoVrxgeXwzfP/JthK7d81WbcMjmYIGbyYMcoeUvAMi4BZlwEfPI3gS7epk67jK8/zyAKD8HjA3qH6ZPNzBN2bhdzGe9dZnYERAmRwTcHzJXc0IgvZ7I7g7O/v3vHX5HEjOnwCiEqnIhT5By4e7AUZkf/XDZ88zKPwy+/M2nUvYVKTEbp0rC50LvFjIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 00:58:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 00:58:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 22 Nov 2025 08:58:16 +0800
Subject: [PATCH v3 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add support
 for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-imx95-rproc-2025-11-20-v3-1-9ae6ee619a78@nxp.com>
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ecb977-568a-4936-6bf4-08de29624947
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkNZc3NRMjJzME1tWDNMVUZmc3lkelB0amU2U09yYXNiRFdsUUJBaUY5Z1ZH?=
 =?utf-8?B?ZG5sY1BNbG9oNW9Tb2J2ZEdYRlUzWFR1S0l6TjQ1eVhxRllNREdSMU4zZmhq?=
 =?utf-8?B?REhYeVlFNG1aK1B4SmVyVkY3akFIU0ZraEFJOHJBaWkxMzBFSDdvbkdhY01y?=
 =?utf-8?B?L2EveFNNRGNOZXJESy9TUUtIakpaclVXNGl0WVR5TDROcGRKQU5yVjNuUmtZ?=
 =?utf-8?B?VXU0UXBwaWc4UDgrUzlBTzRvb2dLbkVuVFZrQjlZTUVKNW1FU1ZOckRkREZQ?=
 =?utf-8?B?Qis1Zk1VVlZKelFOcDJLbGdpVGtVaHB1dWZURkhsVWYxUGt5Tzk5bXFWbWNV?=
 =?utf-8?B?YzlZZE5KQW5KYXhPOSt4TUdTb1BJQ1ZnR2RGTXVEb2IxNHRGclV2MnJrT3Mw?=
 =?utf-8?B?azhPMktja0JZaHZyV29SUDNQR2VJQVJIZ05DTW1MOFh4TU10VVF0SmQ2dUsr?=
 =?utf-8?B?ODRHUGRnT0xuN2pmS0hoSit3NjNNemhxUThpSno3OXg2NXE5VlVNWTdXK2xE?=
 =?utf-8?B?cXNMOVJaZWl6d1NUaDRBODJURW9wQm04ZlhSdHZuODZVeGlBYjdFbTBhcVcv?=
 =?utf-8?B?K0xPSGRCK1J4bmFKdUNCWWd3NkpZSE9VSTdkMmFyOGhiNEgvQlMvQTJXZHhE?=
 =?utf-8?B?ZHF2RDAyRFEzazVtaFYyMEhlbzM3YlhHTTUwQXhnZXVkK0RxeU9VWmN1YVVt?=
 =?utf-8?B?cW5oMVU1NnJsR3V3V2JhOWo2SHFDN0x1bzFRandXZEwzSmMyL1U5ZGVpNGts?=
 =?utf-8?B?eHAvRlc3Mmh1d0JiWWw0YUUvN3RrREEvc1l5dFB3bDhndXEwUDlvN3VEcFBB?=
 =?utf-8?B?RWNjbnFYWjQ1RFkweHFIUkhpR0U5NUY1V1ZqMnIzbnYzVWlPRERVdXhGQVE4?=
 =?utf-8?B?djk5L3FTelNSTDk0eDJCT0xROGJ3MkZlWXFiZXpnUkttWU1Tb0hoMFNXWHdx?=
 =?utf-8?B?NHk0cEdwQlphZGpUN1Q1cWVBTFlpcFVIdHY5dFU3Qk4rUUlZdjNtaFJlQXFa?=
 =?utf-8?B?dXFPUTFCSGdVSldDVEVtb1FEYzZ4c3NaTFJGSklLTUVQL1NUWXFHVXFuR2ti?=
 =?utf-8?B?aXJoWkRpdGJjSUZOSVpzSWFoUlZsNmovdm5YMDB5eml2VGMwTDZIYlBRYzhh?=
 =?utf-8?B?MUR1R1lkKy8yZnRmMzVYUklja1VQLzhudzVWZ1JkZnc0VUdQWXlQdVRCZkhE?=
 =?utf-8?B?WjM4WXkxZXgramlTTmlYK0dubWhaeWYxdGR5cW9hVlhsWjA0cHFMdENoY0Ny?=
 =?utf-8?B?Z21QWk9NWjJGYkpreG9iWkhNL1BGSEJyRjBTWlp4cEVSUW10Wk5VRnRMTDY3?=
 =?utf-8?B?Q2Z2anlXT080QWFPdmI3N0NaSmlhQ1JlOG9McXI5MkcwWTh5cXFaSFE3c1Bm?=
 =?utf-8?B?WHdTMCtGUTRsMFRDeEp6b2lLYlNYMWg2RmxsMnNGUlhIQmx2MnkxczhVYVN3?=
 =?utf-8?B?YVNGZ1dBZTQ4Q29BVEdkdTFRZmNpSC9EVTBJR3QvdUw1RGFiS29uaHNRb1JT?=
 =?utf-8?B?dWhOWHYyVTNZSVNmUm9iblJpWTRsL0FFL0F6dmJKbnhGRjBDU3ZrY2V5VXB4?=
 =?utf-8?B?d0U4T0w2cHYvZTV6emZWd1JyODN2aWwzUDMxYmhCRzEyTWNNMUE4bVlhcmY5?=
 =?utf-8?B?MlM4RlJCZ3AwK0tlc0E4V1ZVSGxNTGwzakZva25uWkkyaXpwT2dXNmlXNjBV?=
 =?utf-8?B?aXpPWnpaNFJIZ1RyWkc1cFI4OERUeGlBaDBXUHZyam1zSnNLOEJJVmxuU09x?=
 =?utf-8?B?bndsb3VDM2pUYkgyVDVLVERKVTM2ZDNEZUQ3RW5hTTFRa0creHNUVnlNWlNx?=
 =?utf-8?B?Z01WeTduMnRFWG5yRVBRcm5iSi9Oa3krZnlRTkwwU254UGdtckhDT2lSMjds?=
 =?utf-8?B?R2gzZGxrL1VIUmZQWW1KaDBBc2dJbmIyczZvcFhzZUUzdmR4SWF3QjAxM1l3?=
 =?utf-8?B?RVpwSnBWa2RNTDA2LzdVMUlrVm5JSUlEY01lcy9mVVVYaXRyYnBtcFZCOHEr?=
 =?utf-8?B?YTV3dFFsNDZUU0p4REZRM21sTHg5bkxwV2pMaVNxdUZoMi9id2ZJU1VSQUZm?=
 =?utf-8?B?UDhVYm5nYllDWkFQQWpOMFNmWWVJVVdBS3B4QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1dJVzVDaWxoN01ZRk5EWVptYjhQNVR6Ly9pWnVybUZRcG02S3NLU205UEpC?=
 =?utf-8?B?eEd1dlduM3RWSlpFMDdkVzFUNm1mZjlMdGZVaDNRWEtiNEJ0UWZxZHhNdW1i?=
 =?utf-8?B?NklzdFRTV2wrWTVOLysxWm55MmZDWmdkeVhrdlRNS0s4eW5xbndaYlVQbTZi?=
 =?utf-8?B?YVRKcnY3UThNeTgyWjJnOFlOZTF6MldnVDA3MmR0bFE1RTZ4TVllMVpSVm9Q?=
 =?utf-8?B?cUgzUXpNTHo5S1dtR3h1Y25qUmJFTkwrNmdRUU5GWHlIU2NMdXhGNXI2UjZ5?=
 =?utf-8?B?eklQdzB1cDVlN01jbnZCVVV3MStDcXNjT3N3L09KY1JCYzFwR0xsWElVSjVB?=
 =?utf-8?B?eUdDT29JUmpaV1NXbFpJOWNYSTJnYks3UTFTaFNiRTg5NHRPdFVzT2pLNWM0?=
 =?utf-8?B?eVVlQUFwMkF6b1E4Si94eG9yVElRMEt6NmtyUFFUQW1qb2w2S2xqU1ZGbG5n?=
 =?utf-8?B?WVduSmYzNmFrSkFZMWRkK2g2eStiSDBQV0IwLzNCZk40ZVB5b1dhajVLeFZn?=
 =?utf-8?B?bUV2WUgrV1RtT2tndHIxdE43dkZFSDA3djNMR2NsSGhabFl3WWlqQUsra2Rj?=
 =?utf-8?B?VmFGMDB5WHl3YWVhNXFCendKaDNraWpoZUxmbkx1dFdLMS8xZzJtRlpadElu?=
 =?utf-8?B?eGw0all5MUIxaHVHc1FSYnZQald1Z2o4dE44YkxVN2FxMGt6QzRPNEZtQ0pJ?=
 =?utf-8?B?ZFNlVk9uUHdpUkpCb3lVK2RjSSs5VTlycVlTdmRmbnV3QXRaclpIN29UWGZD?=
 =?utf-8?B?a3gxczNsTzZTUUQvSUx5Zmt0UXBnWUxzRG1iSVpBVVkyVGVtQUF5U1NvSnpt?=
 =?utf-8?B?b0JTYWU4NkgwczI0QjNubkNvS3RpV0xORDE0Q0p5QVNzRUwvYXFGK00vR1l1?=
 =?utf-8?B?dGdVZFVlbXg4emc3UlhiV3VBQzBrcGVKeHRieC9aZzlRRnE4UEkxRERFd2d3?=
 =?utf-8?B?cXl4dUptMTlFMXV5SjdicjV6ZEtTZ3BXUUVRYmZQMzY1dnNCK1FiS01QdG9w?=
 =?utf-8?B?aTNQK2xBRU5HUFFJdk9CYUFjUnZRSDJOZUZSM044eVAyZ1FYWVBXL3pWbUkz?=
 =?utf-8?B?eXdUdTZkdjUzWm1QQ2VNZFdzdmU5NXhPR0pmSVQxUU5PeDQrR1ord3liRU5S?=
 =?utf-8?B?Q2FMNWRMemV5Sllad2N0dUhOalpDdHhRWmNWclp4bVVaQTZ4VXo5RVFwM1ZJ?=
 =?utf-8?B?bGt4NXdrVkJZZHhYU1ZjNGxiNXdjMW43MUJWK2t3RkpBZTR0R1lTLzhhbmgv?=
 =?utf-8?B?WDJaOVFKYlJFTEVXQ3BmUUZZTk4zQlBSckNBUEptc2xyYlNuQ1lpRVAwL3Ba?=
 =?utf-8?B?eWlYbXV4QzZya0ZOYW4wdTlvNUxDbUJQd2hIUHloZEY0dStHbG01VFZ2N2JM?=
 =?utf-8?B?b2gyQWhCYTdNMTBZek84eldmcjcwYUtvTzNWQUt1aUZtL1hLMVlXcFpxOHNF?=
 =?utf-8?B?VU1lbUhpVVhOSW05YUl5V3RhdmpkSVd0akRCOGdxMnJTanhJR2UrMjVjRzh2?=
 =?utf-8?B?QlFTYVgvdCs5Qy9xUXNXNllHclM2VVlVT2hVd1UvU1lpQUxST0pXK0pXaXpS?=
 =?utf-8?B?YTd1cmJxS0lLbm9jb2N6YUpPZ1N0SEgxZStsbUNTVGRrT2VqNDdKOEpUa3dE?=
 =?utf-8?B?Wm5GQkJsMTdZTnVkWkFDdlk3QzZVVnBHMGNHRWZLSzFZRGo5NitraUI1Sm9j?=
 =?utf-8?B?bXRaNmtMT2hia21nZG1mYmkrdXpZYzQrSTRQZm9rbXBhWlkySWtpNDJNWkhF?=
 =?utf-8?B?UndrMHVQaENlbFFTS08yNG1CZnp4S2kyOUFPUjUvTmplYjJRL0pIeGc5cVZm?=
 =?utf-8?B?cDFXdk5UTExaZmZDZWlFcG1qbkVQMTEvYmwwZi9BWlIyY0RSSDZtSjFYbHQ3?=
 =?utf-8?B?ZkI3QUI4WWZoeWNhaWMzS1lmeUlrK3VuR0ZkMWE4NlJFQ0FmdmpkZm56cExM?=
 =?utf-8?B?c1JsSUpURUJUMmptK2dKUHlJUUgxdDlYOE1HOTR6MTFqYzREdHBhTEV3cGNZ?=
 =?utf-8?B?cStKN1ZVL2d1SVA1Yk9CUnl6Q3BZUUtVbURUSEtkblBHUXVtOWRuK3J1VjJT?=
 =?utf-8?B?RGt3aEQ4TElOUjRDNkZSekZTVGMyK3JKR1UzVjhZTVBDWW9Ob2IxeVNoSXlh?=
 =?utf-8?Q?l0UHaRfvnjXhKYiuuR3vmynJw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ecb977-568a-4936-6bf4-08de29624947
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:58:44.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIpi+//ogdhlLP+vFKOWh4SVsglTWO4zdnDGHwsDd8dOesfvV5as08yZ0GHgqvGR+hncls4lpndQrSlX3fLpPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for the Cortex-M7 core in i.MX95

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..ce8ec0119469c8fc0979a192b6e3d3a03108d7d2 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,7 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7
 
   clocks:
     maxItems: 1

-- 
2.37.1

