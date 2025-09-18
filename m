Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FDA2DA769;
	Thu, 18 Sep 2025 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196315; cv=fail; b=cjSZg0ZqcW3yjtKkKTftQ0fudgWALBPpH0wZ4DXdLeEiV4gUd1foORtzzSm99aIgWaaFf4qe9lzhG9O+BadAoO0QMQ0KJYPD/g1lrHUIP/xJlmxAQ9/F5gA9jgVuSKWJAgGmiS3SmF3AM+g3dI+gNAlcEEUf61gIoCh8Nzt3kgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196315; c=relaxed/simple;
	bh=vZQRQ0MFZjYfIceZiAIJCZLf0DxK8cRgtyj/Tfb3uQ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PC56rkaqQIWz4Cd6ZWp+P9W6Wzq76/RYXYF1+wq0XmzKCL5s/o/Iz1PSA0DZ50/KZimr8av9ks248T7/QKRKEmdICo1bE9zILOmrvcqBH8PbZI1Q8+hg4fe8jReALQzATHuWf5rZiKYVs7+i9/ddvsUZZs951Q8V8W2CuwbjYP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XbQdMByL; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XbQdMByL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICxw4fG+Xuh41+G4ZEJ9ZcK+lp0RCczre7n++t4aeC0OI5ak+CGPejjxOx+IfBVedSP4tFoHyBr43wJGRenKScncUjmqHjCH5rosDEW7cTCccOaXDDZL2m+zYFmveb/Bkpcb32pKi6KXmS4lMZ7t1OwaqxYpeOyfpzH54Zw3p6jbuPXD+mLjNcmacRDzGZwKWc/2SOc/Kp/BulCuK8pe1URk8q3j8kSYOBEkotIXm11AxFtQztGy7F88kx9gAFSzVBVoHqL0zpnicgcmDsMWYomeShnSPsG+Dvrzc0ZmXfyRMJIOQwh0Derut0NPN/csKYO5eufP+4DucwrcLCcjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fe2dXopcvAaBf4m1fb5nXc2ujlz9qS5+VhNBY1aIIU=;
 b=u/dfvT25zgSjxC9Ib+6bdDY/3H3Cf4I4r9PIPTsXA9YTqnZWvcH+PiRW71bN3s5/ThWK4+vZ3LxUXm2/nNGycU4+qjXzF+nZkZs1Gnfur4wCPYx+17I5vxQlfc8LSB0e02lIggdqCnvhXzQq+f04WvCGCR4H6xU8kjwMAnxzoM7oObT249C7QPC88pKRvRxfb6djumFT8/+tzKUxnGDfm9VzDBqRRrxkWJZvVf3s80QuhxC0uV+ZPsWIJBu6gmUCzVjzHZW3kbaCnTSMR8t1HvheZvCj3tPyDXePLvMTLmfGOfNpI+HRNJVMxiZBfQOvgEJA1Oja8rOgnLyUPl+qww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fe2dXopcvAaBf4m1fb5nXc2ujlz9qS5+VhNBY1aIIU=;
 b=XbQdMByL9S1CXOyiGtRdERKxE0KdSqUoq8oBLMaaNktFA7w6INjIBuLh5M14MA+y3bUvfndQgrt4e3Cz4OCPAg7gYDVtrrcLSpPLVWCEC31lxmx7egOgxAoCk57xGzygJ+zIXXc99+i/3MpwjMWsyiR6+LeI7wkulnJEWIvni8Rg5cUck64HU/t8tMb+8V2ZvcyIsPBG1jqYxenSoiyqOBIiw0M8Z3ec6E815MKtD8mhvs25OTvcciETqpdZEJCR7H0CkueROkjkLQr0BaN/AVYmWfcVQ4h5OJAJlRJqJOFkjSSnV6yGr9/Tlf7FhaJzJR3umnow8Ql7nM5bR4K5vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10450.eurprd04.prod.outlook.com (2603:10a6:150:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:51:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:51:50 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 18 Sep 2025 19:51:19 +0800
Subject: [PATCH 4/5] remoteproc: imx_rproc: Remove the assignement to
 method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758196288; l=3317;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=vZQRQ0MFZjYfIceZiAIJCZLf0DxK8cRgtyj/Tfb3uQ4=;
 b=cWD5/15de0jabKe5G9JEuHsjbPfeGS4AglafYm3X1srHT0RH0mqBTpmtQHOTpF/EA9d2WIneF
 9PEx+Cqln3VCADpXSIzDAy/IneWGxFQR5VAwWa3KgbQTamhZt0AZLNn
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
X-MS-Office365-Filtering-Correlation-Id: 36fa5207-38d7-421c-e10f-08ddf6a9c0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mk9qb1BBSC9ld095REsxa0p5RzJiWm9pUXVrN2RLbnRheVFHcVpsUDdITm9D?=
 =?utf-8?B?MkNNMGpqMlhiVnJza3RYdmxaNUhRQTBLWDVPUG5RWWFqbnZnZDZRRE84cDlG?=
 =?utf-8?B?aks5bkJ2QU9BTmhncDlVVkpreFplVDFkVHVuR0VFVmhXSUtpa0doZHFXWUVr?=
 =?utf-8?B?bmxsMjZRaXg5QXVQeEVibjBGQ1FoZ3JCa3ByL3hnMDZRQzJyaWZiQXI5U1N2?=
 =?utf-8?B?R0pMTWlNUGpIRmlod1dzZEtNaGZOOVlCNVN5YUgwbzIzL2ZPMlFGMHlHTGxV?=
 =?utf-8?B?ZlY1MXRtNk1tbms4cUh4VXNYaUxkSkF6SHZ3KzZld1dpbDRVRXp3MndhMG9Z?=
 =?utf-8?B?ai9nR29Ga2NndGZZY0pDbkdHbVFPVkpCY2syN09WQUZKZnZoanoyN3V2eGxH?=
 =?utf-8?B?MzVIaGNYMS93MG9uRFQxY3h1ZjdWQzJBbTZpK01GbFVpU2tZVzBUVExpNDR6?=
 =?utf-8?B?Mkc0d05YQmdzTTBIVGpYcXpibklMMjZQNVRBYU9ZWitLSTVxcmZXUGNoV3Er?=
 =?utf-8?B?OVR4UDZDR281c29nQkdIdGkvVUgxemtuYS84NGcyVE1MbS80NjJNWVRCL29L?=
 =?utf-8?B?dTVHUk1oMWV2L2VWdWRTa3hzbzN0RUc3SmtOckdPUnZTTk4yd0RpbnRDTlkx?=
 =?utf-8?B?VktuRjczNFRlWXJJRHR0ajhScFVjRDRtKzMzSVFvaTBhdi9BWXJQNDdiRnBJ?=
 =?utf-8?B?VTNJaTR5aytRN0lIN3JsT1AvSmFqMU5LY3lEamdlYmpzV0E5UTIrdy9mVEcv?=
 =?utf-8?B?U0ZOa01Cc2Z1Tm84QTdzTzVTSnJlcXdIaFVVSEMra2RadzRWUENsNnZDU1Fo?=
 =?utf-8?B?RGVkZHhpNzNaL3E1TXh4UVRmdVdyam4vSkpheEpTMTk5RkFtYkVxdm5uQXVS?=
 =?utf-8?B?aFNIMloyYjVwYTRSUG16Q09sQndPM0EwbEZqUHd1eVdQL1FkK3dOV1JaSTF5?=
 =?utf-8?B?V3ZUS0p3OURRU0FxeFBIaTRyMTlTNk44Z25OL0tmTlcwb3Uvc0ROK2FtR2Vx?=
 =?utf-8?B?Qi9PbVpNOHVISE9jZ0lTaldacjJjQnFLNUM2Zy92Wk91VVRhUUVUa3BManRx?=
 =?utf-8?B?TjFFblhSMXVyMnBMVWtiWk1mbkh2YzdBNTZZcnIyT25vbHo4ekQrdVpBS2VG?=
 =?utf-8?B?djNBSDVhMEdpVTdsQUpBQ0JQSjRETDlXVDB1QTFvbU1KMElyTWJGeGlpcEsy?=
 =?utf-8?B?b2ZlQm5UQ2g3V1FnRmU1cGxFeUpubTRxTzFObHIwYWk4YWY0SUh2RWs1UER4?=
 =?utf-8?B?VHJ3ZXc1c0dHaGxLMDdMMXorSEhudFExZ1F5OHVGenNVNU9IOVphVFlVTm5R?=
 =?utf-8?B?K0hUL0tjZ2tXRjQ0ZllobWtZWXpDamcxSDdFWE8xMVA2TnNFVTI0OUpzNnZV?=
 =?utf-8?B?K1JYRzVtT3Q5eFZ4QW4xSHMrNlFZdklRcGlvUjJRNUJybURIQVJDTHVzR3pF?=
 =?utf-8?B?bXFIMmlnSUtSMitqbzNneGFLUUdWZ2xCdmNCUERvYVlGbnVzRTdTYXIvcmdp?=
 =?utf-8?B?TzNqOGI2cEhCY01USWJ5R1g1eWxielorYzcvRHBOTjV0RmRrU1YxK1o0dXh6?=
 =?utf-8?B?cnpMQ2I5bTJUYm5sY0NmVUpjVy9jUEJ4RUltL092aDg5K1RIdlc0Y1NrTWlE?=
 =?utf-8?B?cUh2ODNOUEhWaFp3ai82V1BZWmc0ZEh2NHZ5NnAweCsxRjRuc00rbHVSZE5S?=
 =?utf-8?B?YWw1VmhKNDAweWRvRUFVbHh4dDBFbkxiYVhVT1BvMmw4MnF3TmN5Z3ZqV0JE?=
 =?utf-8?B?c1ZKcjJLZEJ1NGZQR1Z5Y2p0aENxS0YzQWVrZnFuaXBBVklhNEQ4ajkyRG5O?=
 =?utf-8?B?VmoyMlUvWlZ6NjJGRmp2QUIwT1hyalFsZWQ3TlRVTnNWZmNpUzBHMTNVMzda?=
 =?utf-8?B?T1QwTGUrNTNjcjEvMG9vc3BUZ0lwcVp5MFM2WDRXemRPUzI2SzRjakd6S2dk?=
 =?utf-8?B?a3VtdTZ5VXMvSzU5dlk1SHAvNk9zc0NxUkpZQ3h4KzRiNVRIMVZWemNtRDNY?=
 =?utf-8?B?TzNlZ0lGUDFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME9WNkhOWWdXNUxsRnhKa21NMm1pM2JPaENTYnpiODNBS3FhN3oyM0JiQzdB?=
 =?utf-8?B?UHNMaEUySjFGcmgyT0ZZQnBpTU1vMkwvMitTZ01FUnNZVnFjaFFmZmhSdDdx?=
 =?utf-8?B?Wmo3U2Z5bVp1U1dDYXFtTTROZmxjQXBRQlArSXYrT0pNbVMvQ0o2Qm1tZmd4?=
 =?utf-8?B?ckc2Rk9YbXZwSWFrdnlsalgxWTBZQUJuVE4xcklkMWplY041d2xLSFArWHZr?=
 =?utf-8?B?MmM3SkxleFUrYzg4S3NJWGVYbkd5NlFjU1hhMjJIQU9ZMnByTnl5QTgvTkN3?=
 =?utf-8?B?ZXBIYk9haHRYZkFZYnJtVlN3N2pIQ2NCdzZDaHFxTkN6WmpJRmR3RFBDL1F5?=
 =?utf-8?B?ay9ZMHNxbWYva0JvcC9QdU1sRzBiSDBhYXVZSnp2Z3VTalN3ZEp2WHl4OU43?=
 =?utf-8?B?Wm8yWmk5VERBUFlrYXliWWFpQm9sejNTWDdFcHZwZndIN0E2d1R5K3Q2aHk2?=
 =?utf-8?B?Szg5S0VJU05wamNHRjROUmo2enpCb242NDRpb093a0IrZzhMM0QzNEcwUVd6?=
 =?utf-8?B?RGhGaDdCTDVhZE55djFIKzh5RXREbDZxVFMxZXNSNXU3ZG42R3Q1eXpPQ0ZC?=
 =?utf-8?B?OURMYnM5Y2FxSkRYWVV5T1F0aHNab2ZINVp0QzJsWnZMZWJXaW11MVVJWFJZ?=
 =?utf-8?B?LzhWRWNzWStDaGFTTlJxWjhMOEN1QjRjemtFaTJ1RE1RekFFK1ZTNllLM1VG?=
 =?utf-8?B?SVRhYjhTZGJFUVRONnZQQUlRMXNOQ0tsYTNlY3BYRi9DT09iRUtHZVdlOGlp?=
 =?utf-8?B?ZzF1ckNFNnU1dU9vOWxuQ294RkRVb1ZIYVJEU29rYVdyYzd2ZGtQTFBmbHdR?=
 =?utf-8?B?T292ajZ0TFlCdWtnV3BpbE5vNUtLSnhseTE2aGYxbmhJbk9LMVlCSFpmb256?=
 =?utf-8?B?RHJlMlB4U1VkaURyTy9Sb3JoMFdkUUdLQnN3RHIwcWlzcXJtRVRSR2lJcm9E?=
 =?utf-8?B?Z3VKYzlyMDJTSTBhNlpLY2dsdVdkN3lhVnR2MDhVeU93TmgzUGpPMjFrcVVt?=
 =?utf-8?B?aGJxOHdLWlpHdVBFSFBhQS9Va09mU2pmYmdYbkxNaWpETEE5dDFTNTJjYWZV?=
 =?utf-8?B?TjVtVDZqTHZULzR1elhhNWRYTU1YMHVaZXBLaVRmUmxOSXUyZ3BtenEwb3Ro?=
 =?utf-8?B?OHRFUTExeFVsQmpqSThGekYyQktJU3k4WllkVStabFBTQ3RKaGkrdjlGK1Rz?=
 =?utf-8?B?c2wzMDBLSlVHcjlUSDQvNXNkaC9tK3U4NS8zcTZuMTlzMTBtWXZRdHRzVXpp?=
 =?utf-8?B?Z1E4VDFwUWlETFFNR1FlOXFxZ291a2NlQVlPZVFXaXV2Yy9GVzE3UHFtMFM1?=
 =?utf-8?B?VHE4OVh1N3E2Ym4xVUU2OFJudkRDa3NzeGVobmhuVEdHb3cra0NtWUNidHBJ?=
 =?utf-8?B?N3Aya3BPV1ZTZGE2cmdveXhab0NFUnhzTzFnUHdkdy8wQ01HaE96NFYvRDF1?=
 =?utf-8?B?dDBneTdIYlBWZnJOVmFxUFNGZmZGTU5hS2pMeFhFV2c1MExTZWFKMWJ0NDRh?=
 =?utf-8?B?UE54NDJadlZBMGM2UDU4eXkwSUNxb3g0SVQxQkpHUHUvMjV0ZmhXVkZxNEJl?=
 =?utf-8?B?TmtoNnZyMWNVcmR4Y2JUYi9yL0RkN3F5Tmt6NjlIbEFRVk5zTFRHZWNiczF2?=
 =?utf-8?B?eXRMeWNTTkltY0tWWTN4Q1RoSTNSVHZ2TCs4WVpnUUNZWE9Wc1NxQlJ2MFM3?=
 =?utf-8?B?UGlHU3F2Y0xXK3R3NlRGZlltVmI4Y3Nyemd3dkxUSnBRelByTzcvR05HQWpR?=
 =?utf-8?B?Q2crdmpDSEsrRXZxM2lUajRKbG1vSiszR0M1UmNEN1A4b1JlbFNZQkQxUWIx?=
 =?utf-8?B?TG01VFJaYUlvc0pJMXZXdUFqaUIzMG1vYWhOM0dEM1l3RXdvcTFTeG5URUxU?=
 =?utf-8?B?Q1orUFN5TWUvRXRvWFoyOWpLS3hUZTQzb3o1SHorcm0rdWwvblcyVjgwL2FE?=
 =?utf-8?B?RmdTbTl0clBTcDh5NnJOcng1Vi9sYjBwM2J5QW1aUWVQQzhYcXFjNFBNalBX?=
 =?utf-8?B?TkRrdDRnenh1SEdGbzZaSlFVek8wanlQd0dyYjV5TjF3RGk2ZzVtVm9EMjd1?=
 =?utf-8?B?RXh4Q2gvR3pMV3I1MHI1ZEhjRXNHNlBzckp1aVpOSVRXT3VjL3VQQWF4K2Iy?=
 =?utf-8?Q?kixp8wWNcqlvtRdtMwgDKxsYb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fa5207-38d7-421c-e10f-08ddf6a9c0db
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:51:50.3574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QW8EHR7fUQucTV+OBngUYCUqXjvMMy+jwTVcROWzAu5JzTCuJP8r6ySER3pWKZd2dUwz8C/+OblRxYVXmORz4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10450

There is no referring to the field method, it could be removed now.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 69b57cb4b251d9fb65a23e139a1960bf29c175ed..46fe7c147ce01ee07a610341b85544b79baadd13 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1170,7 +1170,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1178,7 +1177,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1190,7 +1188,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1198,27 +1195,23 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
 	.att            = imx_rproc_att_imx8qm,
 	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
-	.method         = IMX_RPROC_SCU_API,
 	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
 	.att		= imx_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
 	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
 	.att		= imx_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_NONE,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.method		= IMX_RPROC_NONE,
 	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
 };
 
@@ -1229,7 +1222,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1241,7 +1233,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_stop	= IMX6SX_M4_STOP,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1249,7 +1240,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att		= imx_rproc_att_imx93,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };

-- 
2.37.1

