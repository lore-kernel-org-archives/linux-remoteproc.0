Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE192DBF75;
	Tue, 28 Oct 2025 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761639530; cv=fail; b=uOTk018dp/WfJYiT4A02003MPRpvXm05p7idLvGZqWNuy708eNhhpOFVGjfm1jfLHTl5TgJfigMir60ywjl7zPG2y6cpr6lK4ITYK9g/3ud4z3W6lC/ZL4Eq7UV41xIw8QiimGlVr5R7sV6L/kQBaveSDXvUCgfBpkDnOBunUMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761639530; c=relaxed/simple;
	bh=WdDRJmuJBlwPWA+Nz3ihkZzTNWaH9whzR7+VzVRnRNc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Pdhke/lntIzUJnISXScLb3XQIHK+jZOy+MWg3AaZ+3TleRmzrbvRNRKlRFUrh1mQCbwmV4LbF7WxLFeAOvlwZYsd42VRQr7jbhVFArmeCYc97PWVt7660F/J/K5ZnGgDSu1etLtE9tn4RZfaJi98Qm4urNP19yRkbMShOYRh0JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d5WhC9T9; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d5WhC9T9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9S7pZTYZhQN3z4Rh3neq57WtH61wLpGympVJNiZCaTr+Kf5Y4T8SEtgOEs98QYIx+dRzsV4p+pIXurdmIGzl/eoWBOlMA+Nb8XXXti9CMzr78LAwtLhSefd8b8Xy0t3dKMOlVczPoapqeyDkpQ7DHJnUhWXpkRL5PLaUUVpNoeixE0I6+XybtdlN68xYEIf3Z4XEOrUhVxwLY/Ui9BQ5MLY7K51wz8YYge6iBNxpnY8+RKHG1DqWIr38gKYrVYSIKz6NUcz3OPfXCgb4zoDffqGvjSiPnxUXSqFbXyZhMFMMjC5Ba0Oe4hkCTGmgc3gIFWUQ3DCSro6UScvSh7yoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haneENzBgHaUhrTrFeFlJja+X9GZtEr66jm1+ZzZUW0=;
 b=y8eu7Ctn8stKHWkhoVyBJvaDS8N+4SoeCIs+GyjUY9laREKfXk2q//juxvjjmLYZvHtJowQczaMFCgdQbPQd8Dae75j3Vt+sMAidfr+yve2mU3qmprdvMqxw6z8RLsF5JUUkHoZcc9oDcgSqg0YpbRARuO8tDjKvfQLf6JePAemCJwyRTRkKAweWggIdKvnUS3svUBjMIc6IhzU4KH2Q8HPQ/4t8AK8REOQSOA6VvumJ8qbZgzxaJnbPi1JfDbiPEFj5T6MLkxDaSvV9U8woyar3BXftEzEkFg+sm9Zsl3QxxIPH5PK0dQiuRN9o9HQfX918AuAYn84jaDYqUsmrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haneENzBgHaUhrTrFeFlJja+X9GZtEr66jm1+ZzZUW0=;
 b=d5WhC9T9xti2kdKfPGmNcQPt9lnxwkpT6QGzYOn/ekvGWx8KI+OCsIYF3ExAXczwO+AoweRwo9rEQ7kNojgq2/Ngq9IFr1ACXfM8OB0XMpY0HrTrwjhIQnvOsuYMWQmj4WaVp2e0Cw52ZcrEtgvQrOiCr7i+SLzDwiGdOUMoWhEtN4/0JR3T/Xs9Y0EK2cF8IA/gChZXxZmGEFwZEiwGUzPolY7bRFOfs9hycRBv0z9CrFU/GIiNpmTgsxnFF86Ds3zPcNVzbMlKXxs5048ebgmMeTEP6jAh2pabTK5ypc7gn5btiQwpVpc1P9L+DpaOMRHPnHpN2/2GyeavtK7QxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 08:18:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 08:18:41 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 28 Oct 2025 16:18:02 +0800
Subject: [PATCH 2/4] remoteproc: imx_rproc: Add runtime ops copy to support
 dynamic behavior
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761639500; l=4045;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=WdDRJmuJBlwPWA+Nz3ihkZzTNWaH9whzR7+VzVRnRNc=;
 b=lPuDRzvZTOJzskk2davysvj5IkS131ZOLLmtlaZTm3xSElfwf2c6OSVYHYUFN4uahTHEt2NI2
 Xrb4++Zzr5iAivdukioUqXEs4m8BqWmF+s/mDiYmvlm5JDn6xBSXEIf
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cf6b06-832c-4540-e238-08de15fa9a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L05sU05wMktORk1pLytzQ0xacXJSaGgvT3JrM3p3RHZEUkRtLzlTVWowV2dK?=
 =?utf-8?B?bXdOOVZWdUoydFNEZW45WlArQVRkeHF2cGlsemZ6U1lIMURFVUEwMlFLSnor?=
 =?utf-8?B?VzRoekJ1QkU4a0F3bHVseFNpUWJrOUpDYkdHN3NnajNId0ZadkRWOWZ1T3Zz?=
 =?utf-8?B?T1JCTDArUFRZWUtPQU1RaDkwRHowN1k1OGRXeVlaaHdKVXBiTXBGeVlnZ1RX?=
 =?utf-8?B?WXJvREowa0IyVWRPeXhhUVVlRTNzeWs1NlgxblJocnJwR28wNVhSendFQ3Yw?=
 =?utf-8?B?OXd1TWM3M0pYanZNZzQzcGNrK1c2S1NyOWlKakx6NDdjYThvTWtvWUhSL1Vm?=
 =?utf-8?B?SEJCaGFzclBLY0pxMkRBcGFvZUo2QzdIUUhtZXZxSEd3VWdWdUZMTWl0Y3NZ?=
 =?utf-8?B?Yk5La1NWTmVOWWxUa1VJcnAzajl1MjFYVkV2aGsrZ0QxSzZ1QzFNbnd5MGZD?=
 =?utf-8?B?L0Nqd1NXOHVoNVltUHR6YmpVMElwOERWRjdoeGprVVZjRlpHYzFMOE9nYkJn?=
 =?utf-8?B?ck5QMS9Gb1hGdEdiUUpYbEszQkNtOE9JQzVPVVVrRkpGbk5NalJ3KzBGSUZP?=
 =?utf-8?B?UDZaMVlYWk4xRjBYWlpZLzBCRW0rQ3ZLVytTcHlhblovZkN1ZlBlWEZWeFB2?=
 =?utf-8?B?eUxpMDEvODZMeXNGaW9OQjd5cHdGenY3ckpKbERvM2ovZlF0eDJkQUVIdDA4?=
 =?utf-8?B?U2c3a25HR242cm5Ob0dCQ2t0SXFxOVBvWkt3bjVYbGUwZ3VyaXlDYStFOGVG?=
 =?utf-8?B?V3pDUWc2eUVCOGhGRWI0L0xReE5nT0VJS1B5SEdxSFl4SURuWFJDZTFNMGw0?=
 =?utf-8?B?Z1NYZ2dWUk5FU2NLcFZ0THBpaDFRZUJBL0dNNTJPNi9qazRmcEp5NGF4bThy?=
 =?utf-8?B?bEY3cVRHZXE3blZqa0dLK3NXWXZuRnBhODBkYm5uQ1kzdzBtWmludFVKaWZl?=
 =?utf-8?B?NEZHa2VsMEVUZjdpSHhreEt0NktyL3VMRktxM2FLbjJoSVJnODBWWDBmNFNC?=
 =?utf-8?B?WHhCdnljS3o1bmkxSjgvV2VpS3JsVXorQkpSalNraG5hRjRZQ1pObHNYanR0?=
 =?utf-8?B?VWFWb3VoTFV2NTEwR0cvMVdSMzdCVEl6dGFENkcwdkZXZnZrdFIzelZuaDYy?=
 =?utf-8?B?WXVXTEsvRXR6QmVIK2JzKzNzOS9wdFRHWFk2Z1J3NktrMCtoZHBDOTFrTmJV?=
 =?utf-8?B?S0NETEpQS0I3VFN1RHhnZlhjYUVoQzBiSHErcmwxekhLYm01aTlSVWY0VFNx?=
 =?utf-8?B?ZWVRZC80OUFSdkFVR0pUb2ZWU3BqZW4rdW9oUm5yZFczNnJTMytXSHBRL3Ix?=
 =?utf-8?B?T3hIQnpUUzU1WmxVU0RnWjlJSVdWMGdxZlV1RFQzMHBnK2x3TjVQcEZ3TzhS?=
 =?utf-8?B?L1ZhdXNXdVZ2TkVucTV5SWwrY3VOM2w1WkFCMjRZcTBQYlMvVUpyQ2ZyVk1F?=
 =?utf-8?B?Tm40bUZ3ckZWZ2d2RXR2UXRxdk1GMDdnaTBMdk1MZzBpN29xNlRmNWxrQVNz?=
 =?utf-8?B?ZFZrVXFNbGc0WTl3cnczekRSNkYxSmtrTk55eDdtNkkxMVpQdjhXazVBRHU3?=
 =?utf-8?B?cFdwZnEyNGcrRkVwU1E2MmFGelZaTkVSOXpnMlN3NWJVdDBpWnJTK01mcTNr?=
 =?utf-8?B?RWN0UmNDRG55RUZCU3d2UmJJQlVUcEs0Rm5JMHhrSTF5bEo2RTQ4M1F0TCt3?=
 =?utf-8?B?Q25FR012Qmt4Ni9GOUNuWWN1Tk9vbXJqZ1l4VHQ1Wk13blZ3R09QeU1NUldK?=
 =?utf-8?B?Wm5uN1NneEU0Zzk4ZS9IbEliVENJUTlERGsva0ZmMS85QkFET2taWE5veTZn?=
 =?utf-8?B?bmFpSFU4REZvQzZrQitnNUxVY2NwUk80S1lLVUpHUXFuN0JtNFd6WDA3WWRP?=
 =?utf-8?B?RmExb2s5bldudjVBWnd5b0ZOcXo0R0lqeXREbmdiMUw3WkVHalJqK3R4YkxV?=
 =?utf-8?B?a0hKZFVtQlFPbzZGbUtPTlJVSnB0ZXh6QllmWURwdVlqcEtvNGlsT1NCNHlP?=
 =?utf-8?B?WmJVU2Z6YlpYdXgwbllmTHBzcXRqeTliZW5zQjhCczVCUlhKZEpNUU9qd1hq?=
 =?utf-8?B?aDBDaFJyNGZGMllIaTdxQ2NPTmF2ZG53MlJkZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTZzQkNvTTNzUjBBK0srNHpwSEo4Vm5tRFNVdm05a1ozcWZ5TmRXQk56b1l1?=
 =?utf-8?B?ZDRncFBVdnRra3Bzc2d2cEl5dElnMFFiSHQyZ213Y1B3Y0pMNTliSGhrTXVP?=
 =?utf-8?B?bnhtZDZjaEdUQ0lvRE9DeGxlVEFxVk1mTVVINmlzd1RqdGRuL2txOElUMDJG?=
 =?utf-8?B?QSszOGVtNUZXSXhkUlhWRWV3OTc2bXhlUGMwSHBMZVZ5SHEwdFVtNnZNRkFk?=
 =?utf-8?B?Sko1eWNXV1RKQnFCc213WVp0aGtnVGdsZUdlL2NoczIzc2Ywb00vNHdzeVk4?=
 =?utf-8?B?MVB4Nk1qUVBmY0pEOUVhQkgvNjJBcjMvUEJoU2FJbEg3OTNPYnE3SkFEWGdv?=
 =?utf-8?B?V3BKeW8zalNnKzFrMVNEOHZhU2JNQUUwSUVmdWZZWWU1TjhWSDdHWkthMDJ1?=
 =?utf-8?B?VWhRMVFxQUtlWDhoNXh2bmlCN092dlNPUGY1QUZTd1prRlhhc1hMdFlNdmZP?=
 =?utf-8?B?UFFJRXRGY2wxQmFicHlxeWp3V3ZZd2JnNHYvSkxqa1dnekMvamFoQUFzUjRh?=
 =?utf-8?B?WW5PYzJBNVB6dlExSnZrM2wrQlF3dkhHaVZ1eDBNQms1QzU3RnZ0aWcyZ3VQ?=
 =?utf-8?B?Z1RBdU1QYldrNUpCek1NK2dFd0xBdy9oSnFUZk5BR0pBOEoyTDhxRlhuaXhZ?=
 =?utf-8?B?NmhDWXd4ei9qcmxWL3N6THoxK25RMXp4Qm5MT0o3WXJlTG1mcnRKeUxUcGxn?=
 =?utf-8?B?ZWRCVVNYRHlkL2JROWNvVEpLU2xpYy8yWWZlclgzUks1SlJkMEU4bndndStN?=
 =?utf-8?B?V3N4MmZmOGNyckN3K2c0cEk2OVNMYWZZZSs0KzMvUXd0YzZOSnQ3dHMwY2tl?=
 =?utf-8?B?WE9maEtrWTdKMmFLYXJTS1FwMm94K3RqSUZyTzdxWkwwY2VHNmF0YnNteWd4?=
 =?utf-8?B?dmR0cFlUZncvREw4ZUJHc3lMaGRZMzc1MzEzSGY1bFNDbi9BNjNIbXNMS2Uw?=
 =?utf-8?B?QVZKNW4xV2czNURyVGNIRkhRT2M1OXNlWHdhWkdwZm8wRlhoQTc1NmtPR0N2?=
 =?utf-8?B?TDkvQml3SDdDTzNEWExCd0UzOTI4SXo4L2ZtM0R2OU5pMEI5dHo5Y2JjVFJp?=
 =?utf-8?B?aXpHVE1NV1ZsdFRtZnZiT1lrTjl1NjZzZkFlelA1SDVQaXdra2tpV3B1WkZj?=
 =?utf-8?B?RFgwT1BVVVlXalpTM00rcVNJNVNyV3Q5UHhGQWhiK1lJaTVUTyt3Y2YrTEFq?=
 =?utf-8?B?enN6QmFMbzFhNDFsaGx2elFxOGU0RngyOXlDVDdEeGNjMThvQ09XR1NTMzM2?=
 =?utf-8?B?clVGTlNUelY3c25RYlNsc3BJdjNmVUhnVFphWFNsY1R5aDVaKzRqUm5kS3FT?=
 =?utf-8?B?K3JjL3ZTaGVIWGFpQ0VkTjdua1ErYll3Y0hwQnYyOTBSUWJEejZoUVBaV3pV?=
 =?utf-8?B?WWdFdXoyTDZhMytaR1ZQR3E3b0RpcElzREZIZDY4R2RDRTg1R3pCa1ZXbXdk?=
 =?utf-8?B?VFp1ckl6dkFvbWhMTHFEVEtXNWloRG9MWjlxdjE2QkNHcGlaMU1qdzgwUnYy?=
 =?utf-8?B?cmtwYVd0c0ZUQUF3bkJrRUh3cTFZZnNzZjh1dUdmRWZEVjZLMXhOWVp6QjFG?=
 =?utf-8?B?OWkycnFzOXBjWS9VVzdQek5uYWRoN2xMTmdsdG1jT2R4YzF4WXpXS3BvV1pG?=
 =?utf-8?B?czlGTmpEalFJcFZxMlkzY0VXaURkU3JFTUdDS2YrdzI3aFoyMFFJM3pQSkJ3?=
 =?utf-8?B?N0lJSXgwazdSWGpHQ0JOWCtHcmtTSW50QzRXcWZFQmxGY3FNb3UxeUJrM3Zs?=
 =?utf-8?B?dm1SOXo5N0RhUXJKblJxZWpuSXZ2ckNRbFdzNkljdmJhdkRua2hqbTlMcElJ?=
 =?utf-8?B?YzZKQUg5T2dOUk9UQTEyQTdZSlUvZ2tMUm9ja1o3emNrMzdTTXo2cmJnVjFW?=
 =?utf-8?B?eU5jaldRM2JrQnVxbXZYbTN1VHpjN1djZWcycUIyYW5Ydkg5Y3NsRUQyMkl1?=
 =?utf-8?B?TmhMaGQ2OTJYM1ZyOVVHNWJCdmxSUitFT2ordkFGR2ZRRFRIV0hGbmhtcXNX?=
 =?utf-8?B?L0lCTm1EY0VYSUIrdzFtSEw4RE5Sck5KY3paQWdXMXREUmNYVHV0aldPeE1u?=
 =?utf-8?B?cUR2SXlTWWQ1MFhNYWFObWUzVzJHQVZ4bmlVVUV2ejRYamJBYjhmcFdqdkRv?=
 =?utf-8?Q?BX8K8xLOvrB1ejt/NBcGkr4xt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cf6b06-832c-4540-e238-08de15fa9a68
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:18:41.2126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JDd1sMLrMT63CtIgBqMduIRIpRHgxH5411RqOoQf5FGBSHfbn3u/OYUf0KgjiPiSbF5Mm0LLSU8QPN+ZwNAnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
which defines the start/stop/detect_mode operations for a remote processor.
To preserve the const correctness of the static configuration while
allowing runtime modification of ops behavior, this patch introduces a new
imx_rproc_plat_ops member in struct imx_rproc named `ops`.

During initialization, the contents of dcfg->ops are copied into priv->ops.
This enables the driver to safely override or customize specific ops at
runtime without affecting the original const configuration.

This change improves flexibility for platforms that require dynamic
operation switching (e.g. i.MX95 Logical Machine ops and CPU ops).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 02e155e967942d745de4ccd96f9008e4211f9b36..4ffd2415295be5e60c8eb8ea5126b3562bf703fe 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,6 +116,7 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	struct imx_rproc_plat_ops	ops;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -315,7 +316,6 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
@@ -323,10 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	if (!dcfg->ops || !dcfg->ops->start)
+	if (!priv->ops.start)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->start(rproc);
+	ret = priv->ops.start(rproc);
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -372,14 +372,13 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	int ret;
 
-	if (!dcfg->ops || !dcfg->ops->stop)
+	if (!priv->ops.stop)
 		return -EOPNOTSUPP;
 
-	ret = dcfg->ops->stop(rproc);
+	ret = priv->ops.stop(rproc);
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -590,12 +589,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
 static int imx_rproc_detach(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 
-	if (!dcfg->ops || !dcfg->ops->detach)
+	if (!priv->ops.detach)
 		return -EOPNOTSUPP;
 
-	return dcfg->ops->detach(rproc);
+	return priv->ops.detach(rproc);
 }
 
 static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
@@ -995,18 +993,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
 	/*
 	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
-	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
+	 * priv->ops.detect_mode, it is state RPROC_DETACHED.
 	 */
-	if (!dcfg->ops || !dcfg->ops->detect_mode) {
+	if (!priv->ops.detect_mode) {
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
 	}
 
-	return dcfg->ops->detect_mode(priv->rproc);
+	return priv->ops.detect_mode(priv->rproc);
 }
 
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
@@ -1056,6 +1052,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
+	if (dcfg->ops)
+		memcpy(&priv->ops, dcfg->ops, sizeof(struct imx_rproc_plat_ops));
+
 	dev_set_drvdata(dev, rproc);
 	priv->workqueue = create_workqueue(dev_name(dev));
 	if (!priv->workqueue) {

-- 
2.37.1

