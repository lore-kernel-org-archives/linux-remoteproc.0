Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF3305967;
	Thu, 18 Sep 2025 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196317; cv=fail; b=OjoFwOlD1TJgk+C9G5hB5MvWldtH9c0QEcwnGhwcFqnveSnddVelUSPn/ZaVL91yZBqBHnSYXn5wUzfnkaYgo2QicdI6Al5wDlNhipLrJNzCiWm36t8FTCcszwJ6IVXrolv4z9a1AK4lLEzZ4Ulua3ZsJAurdk+OHXsztABhQvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196317; c=relaxed/simple;
	bh=rnlYni1D2bDbaqIihc7eOvCsGmqEg07H7qemzxFCjms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g/UbfMnEQ04pvW0LDmn86AXCOJuRFTy/5YTILw7mtlBpeODnbLnjTYr1YWGnUJOWIbScsKHVXj42uPrGAQtTICsvcXOAGz3i7CjkEWHhb/ZrqBI2VgthmRExZMNGoWDGvUlsanAfMbVKXR6NhuTFDtQfHBs+P6mnR+tCOdVZgl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AUtrnZxr; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AUtrnZxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIYY/aDAFDmqKTkW19IJb3XAHLqB2dtFZGjoKVh2jJR02U1L7tmXcuv0Zf/8KEu391RSMwlZ+Kd9KY2dVHBMVUo+bim6l9aTy6ySy4YZONMgwcp5I70XgW2UwvE38OkzsMtkgVTuO7HPVQXsOdlQsafx6mmABC+S+2nxg/JmroknPEWznjYhl5dTlIa80JrtjpOW/ZG6iE/y9BgJoDb1pP/pqwCvIKeyIunTWc+GmpJx4nLgWfUV5PpKKLPIoBDe8T1NPWsvetS4UlfuJroXVcx41c1PuenZXJ4wjX75ReKw+8IYnLGQg6LZ5LKp2CDhVwksCLOoIssznXJcyMnx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/IhTifv8vAn9CZVA21y8Tg6a/GWngpc6FZ/ousOckk=;
 b=uwNjem9SJ0ajJhHMqyb4teO/oRO8Ea38gzZcxpmZBboDCK2ybCnMJvRFz4bBj8Q8hL3WmPJZn4KlsUXYtBQ33l6U7FBuJpzOTsN29QlLyNNUKPjzP9gMPRJxEJQrmsaBUHyjcorBmC9qLWh2QmamgYuYg1upT+j9wUaXxrlpNFdG36UP/3TZ229PUaLYEwC4IRBupiS+gUjWmjZuTSkCn2SbpXByPP2CLOsP/LU4RzzEnD2zKdC8P8qzdbLqU18yktnP61Q1T3dcGvYYAPvA4jAa74zF2lW7s0CZRJDSeFcordPQlhrjYGJ4RpAcFCt/PcX8eVk0C7bHcLkfsdZBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/IhTifv8vAn9CZVA21y8Tg6a/GWngpc6FZ/ousOckk=;
 b=AUtrnZxrOI+dQtEQWmi1TbVb1UQfW1mGO49h9GW2Xo8T4fQd1zLMPLEAeNbfZn9oVlMgRA42Km2Vl4+UZ8mrP9+0C3eSaq8B9sqjzbVapKPgTwpV9HI8iY0wDEzI5mNN3mSu44BEz81wDrgKa1M2Bh/3yGbQzmgVY4+k/3Q5UiXpSy3OBYZ+in7u+XCfV1CokGuf/BIMjomxBpZY+Tmgo5BODT/9pBkTgaPOEiOEOT7HNBXfqOHFFJBEE5x1hkl03uMMcidYbs7nLWKtCSBWYvQoc1yMudUAVr2Hb+bczp/1+QChWTgzgq+VVnX/1Wl+aMoAIuBJQtwI3XEQ+1wFoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10450.eurprd04.prod.outlook.com (2603:10a6:150:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 11:51:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 11:51:54 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 18 Sep 2025 19:51:20 +0800
Subject: [PATCH 5/5] MAINTAINERS: Add an entry for i.MX remoteproc driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-imx_rproc_c2-v1-5-deec8183185f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758196288; l=810;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=rnlYni1D2bDbaqIihc7eOvCsGmqEg07H7qemzxFCjms=;
 b=0HDG+ioirjjV19crT0NrKtFR+vYM0qOs+W2fzQpDClMU3y68sCJjs+WELKzT20LJsZ9Z2ki7r
 qGoQjCPU7srB3MFJXlcTaQpGmYssjpZHTR5aHMQPAqS+CfdQUSvkRmV
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
X-MS-Office365-Filtering-Correlation-Id: 8f580f98-9f8a-448b-0cc9-08ddf6a9c32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTVGNUMxcTNyTnV4aHhQR2J3S3AyWXJBMHNpbnZORXhmM1h0cEVQMjlBVHBD?=
 =?utf-8?B?aDBySEtEQ1hMNWxSQnIwZlE4WDBmN1FnZkloOUhoS1pEMWE3c0Fpd1EyN3BQ?=
 =?utf-8?B?OTB1S2FMSU5Za3Uybytvb1puWkhkTHpBZk82N003MGMvbWcvK0I4dldYWXVY?=
 =?utf-8?B?eFZWSmw3c3pIeEtJVWJ6Tm5jN2diV0VFbHRQWjNsUnB6Snh6dTJkTGRyV2dB?=
 =?utf-8?B?eGpOd2RnUDJrTG42R1lpNTlkQ2x3dytTZWpKQm9uYzZOTFhtaVB1eEFkbHpM?=
 =?utf-8?B?WjlOaE5IMVZUQnFiRlprTTU0QmpIeVB5UEs2VlVMTmRPMVIrNW5ySnR2Z01z?=
 =?utf-8?B?WU5JSFc3MnovRmJud0p2aE1ubHg5TzBOVW9rL0VuTW5oYnRvL2ltaE03UHdC?=
 =?utf-8?B?Y2IwZXF3MTM3c05oaVZhUzhTTkhqSzNYL1Z5eGVyRXY5THlhRWlZVm1HTmdF?=
 =?utf-8?B?ZE5pSy93Y1V5cFVVdjNKOC9zdC9YVklzYmxTRkMzbFhsOE81WDN3UGRsNFZS?=
 =?utf-8?B?aUlVS1VHWjFqQWY5MHVQWndVenBXc3o5ZEU5NERnME5JRzBwWFhkYmFPSzls?=
 =?utf-8?B?aVdjKzBDcCtzdEVrUzVRN3FlZmRNemswM3duUzBUUkFWNWJycFlrdEVUSko3?=
 =?utf-8?B?TVRYd1NkMlZDN1NsNlU4SnI0Y0pnMlFZenJDN2JEVEVPQkRuZGY1TXphbTlq?=
 =?utf-8?B?dUxLekxoR2xLelcwdDBQRlY5Q1NYWlQxeTBGS2dXdXV0RkcxckIrVTB6NlRu?=
 =?utf-8?B?aW41dVVnOWFJY0czdkwwL2RTMVp0WjVSV0kvY2EweFE4WlcxZE95TUJkVzI0?=
 =?utf-8?B?VmlFYUVkSGtKL3AyeVBCNjZKalN5NTB2d2Y5TE5mM2NkK0FxWW5MMDg3NHFM?=
 =?utf-8?B?NU9vNjZJb2daTEt6R3RxYURsdE9QZ24vUlNuZllwMlg5ZjdSVk5ORG1mWGVF?=
 =?utf-8?B?NlN1cGo5cHdHUUVnMGZ0ZFlRZVM1Umt2UzVkRmptR205NTlZNm5TM003N1h0?=
 =?utf-8?B?K0RXTzJJSzFzWStJTlRrM0t4NXQyRzRjRnNrK1FGS1V2QWNvL2Z0WW94cUJM?=
 =?utf-8?B?SlJoUDR1V2E4MEU4UXVYMVM0Nm5aREdoZkZLM3VJa0x1RGNvOFFkajVsVk4r?=
 =?utf-8?B?YWIyUWJaY1hENHY1cS9oOWdxb2FXR2FwdDJucHV1NlNxODFOMXNUbG9hT1RF?=
 =?utf-8?B?cjVraHNOZldyWStmUUNYb3lUZlFzd21tSEx4NnV4NGdJZmJTVUJ2dmMzbzF6?=
 =?utf-8?B?c0RyNVVSc3k1YWNyb29xRkN5WGMzMDg2Q3oxRFB4QjZuOWhjcDRiWjNVU3Q4?=
 =?utf-8?B?MDJsaTQ4ZDJ0Q0hQNUswcWZIbzluLzFNTkFUR0h6NzhLUmxoVzFpUVloakMr?=
 =?utf-8?B?Y09RR29VWFhWUGtPcVpIVVhJUU40OUdhRGdvYmdXdHhjMzh6empLUm05NW9t?=
 =?utf-8?B?U0ttNjZMck5oTEVWdG83VXIrZlpiblMrMVA0bS8wOEhKMHpwOVE2ckVsazlF?=
 =?utf-8?B?Vkd3ekp4UFE2ZFdJRm5FQ1hnTU9kWFU3SXVIRHh5L2hOTngrclFTdXd0c1E4?=
 =?utf-8?B?cjZsTENpekZFZE9rQ05hdzJKK2Z0UlErTVdTWUJZSitBbjQyTGtaMWlHeXIw?=
 =?utf-8?B?ZW83WEFRdmtxTlNBTVZwdnEwc1dDVXBaUmpNM1dEdExmbjJEWTBRMHA3QmhK?=
 =?utf-8?B?akQwZG9qRld5eGN0Z0FBS25pL3RjQnZHSWFaRi8xRlAyL2RKell4ZzBrNVZx?=
 =?utf-8?B?MU1CYVpPalBsY3J6QjFnTnU3c0hJMkY4TUpLR1FQVmtaczZXa0RlaHZ2YnJI?=
 =?utf-8?B?VzhDeGhoajlyaksxbGpTZzFLRUI5MzFVMERtcmtBN0NEb3lQb1BjVnE1c1J5?=
 =?utf-8?B?YzB6TEM1MTNGMS95M2Q5ZXQvejdQSTUxVko4VFlBL0JaL2xNMEFEdkZOSDRL?=
 =?utf-8?B?M2QzTzRqUXJPSnV1aGRVRVRlcUFCMHVoeVR1U2wxVTJtVHI3MkF0cUs5WUpS?=
 =?utf-8?B?QzZldm1UbVNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1pqZm9lZnFrSHY0R0lrT2x5Q1BpM3pPSU5hR0VXNG1NaWJ4UnRLdUhhU0Ro?=
 =?utf-8?B?ZU9vWi94c25LWnpScGlnZ0pGcHlFbHlibFQxRlJ4NUNDZmxUS0hqT1A2eTNG?=
 =?utf-8?B?dEMrWi9YTzNGamxQdEZJYnowODArNnFGSFhiWDNNS1BmWmlGMG1RVEozazQx?=
 =?utf-8?B?eUQ1dDJRTm43bm5wUEtHK1krRlBqOFFJc3hSblJEd1VqVjhxWHYxdk9vR2RO?=
 =?utf-8?B?NURvRVNqaGNuYnFRUWFwTkNQMTl1Y2lrUmNNQmg0dTlMUDhwa1RYV0ZZNlkr?=
 =?utf-8?B?a3AvUjFjeUhGbkk4OTJmbktadjRYNEhwTGtzcTkxNFBoNWY1QmVRRnMrNWdT?=
 =?utf-8?B?bUNMRDE4cDJaZlp4Uk5WTmpWMysvZm9UcUF6bnpmcDAyMVREbFJ6aHVjLzRv?=
 =?utf-8?B?eDJKclZRcjJkWEh2OWtteVdPS0ZhSHlqWnc0SjBST3NzREZKZFVybEZZQzZk?=
 =?utf-8?B?MWw5cWRidDdrVEdIWnJ0TFhVNWRhM01JZ2haTklXa2FmM3o5TFVHdjBnTkZP?=
 =?utf-8?B?THhBaUVoL0E3M2VFSXdkOVU5MEMwN254Q1BIZEJKOVJMMmg0N2xJck1HNTZx?=
 =?utf-8?B?N1ZBY1VmNTVCK3VsSUR5ajhNeWI1SjFlNzhra1RReU1Qd3pDM2JpU1pObnZ3?=
 =?utf-8?B?MHZDVGRNdkFJaENuNXJBRXFzTHBWbGZ2OFpZS29wQzRsZlhwWXNXaUI0am9T?=
 =?utf-8?B?NTcyekpseUxOU2lyaEcxSk5TOFpwOUZzVFp2T3dvc3lkOEpmMTVFSjViUk1K?=
 =?utf-8?B?RUhqT09pYnhiWG5ETHk1WDJLVzdQQVFCRE5IL2o5cnNMaWV4Sk1sVjBOYnBG?=
 =?utf-8?B?ejVlcS9ZSjVESmNBUkc0dnVIeFVtRFFzdU15UUFSVlRFZUJjT0NXV1hNVnJC?=
 =?utf-8?B?RzJPRnUrdWJhZ1ppRjRnTkduU1lNMEdqL1B0RWVidUxiY052WURMK3dvdCtn?=
 =?utf-8?B?Q3MzTStoTVUzbTRUZkFvTHRGMnMzNXp6YUdwZ1JVbFlIeHpORUtSdlE4YUpC?=
 =?utf-8?B?VVBINVB6RmdPc2hiWUdtUkd2OGptUElBUVNTekVscUtZWUJ0TThSSkRlMDNU?=
 =?utf-8?B?dWtLT3IxZC9CSyt3VnFKOW1FNWxldTdTVFk1eDdMNm9wejF2K2N1ZGFKR25p?=
 =?utf-8?B?OEk3WVpRYkoxQ2R0Ry81US96N1NRdUZHNDNYV015SEwvZFAwcG93bHQ0bkwx?=
 =?utf-8?B?TnJ4NXpnOFpPWHBhYXB2WmNYSUQxbnZwNVVJZjhQMEI1QmVkUVRPUkdiSGFl?=
 =?utf-8?B?RjRkT0VITHEvOW13ZktuYlBVbEVScGtYeWgvek9tV05EUzVzYjJ5SzUvaWhN?=
 =?utf-8?B?OHZUQ295NVdlYW5xbmZuWTlEWmg5WUhaYVpnWlVIL04xMHFDemozMnkrNytP?=
 =?utf-8?B?OTg2anYxa2RLd3BCOFAwbVVDOTlmU3VrdkUvRklyd2FaTkhkSThmTnRzY3Jo?=
 =?utf-8?B?V09LTnpmTUh1MTVsTlNuMnBjRlBUZENxL0RnYlFmTmMvQ1Vlei9EMkMyQ2lw?=
 =?utf-8?B?RGIzZFd1TXIrWXI1Y0dsYXR5M3FKS1N3VzcvQUR3UmNydUJWc0R2c0ExSUZu?=
 =?utf-8?B?cmRMU0NNOTF3Nk9vdHdPVU1HNHZ0VU9WM0s3NGNPQm02UjA1TVNOU0ZGSnI0?=
 =?utf-8?B?S0ZQbE5SbHlkRCttRU5aVnlNUDlPZE8rWitrTndoSXFqRk9MOFg3bnpzNjd4?=
 =?utf-8?B?UlFINFBKNkRWaFNXdzc0Zjh0K3YxUUNBWXluVGtGcnJDNWNJSzlyVlJRNG1O?=
 =?utf-8?B?R0l1ZlBnWlJrMWlBc1A3a0NJbVVmakNsejFLcDdJdFYwWUNrRW9QY2FONWlw?=
 =?utf-8?B?eVlkdWJENTdTYk0xeEE3VHAyRU1MYWY5R3J6WnIzNGRqaVRDMVdiV3ZteFc1?=
 =?utf-8?B?b0xlQVVKelpDbTErejU4OWgvVEZaWk1Md2JBamw5M2xDc3JQZDdTa2JENStN?=
 =?utf-8?B?b243UVZ5UlBPeVNEUGg1TW94NE0zM3NQRjRSRnA4UUpXQk43MWFxS0xWOUdx?=
 =?utf-8?B?VEpsdEVmRFEvRktBQUdEM0RleUwyYzRoQXkxK3ZWK3Z3WktsMy9kWit1dkYv?=
 =?utf-8?B?NUtnK29Id3VRNjQrUThuZFRVd0NZV0RHM0NQeE1KclJuNGsvdWhjOXF5eDB1?=
 =?utf-8?Q?Gf7N/zzYpCdkGS+b/m10q9wAi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f580f98-9f8a-448b-0cc9-08ddf6a9c32a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:51:54.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6QqNDAYIfLtRBkxFAq02UwCF2JAIxnBvNnpbsoJu/YaA6SgYn4j+LfoXMfYluJmJwmPrVPkMEFmde/TrEXfWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10450

Add an entry for the i.MX remoteproc driver

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index df319f9762b369a2746ee7f41334be9b57e7bf9b..0bf57317c6607d72020e1401540cdbc77b70c4ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18508,6 +18508,14 @@ F:	Documentation/devicetree/bindings/clock/*imx*
 F:	drivers/clk/imx/
 F:	include/dt-bindings/clock/*imx*
 
+NXP i.MX REMOTEPROC DRIVERS
+M:	Peng Fan <peng.fan@nxp.com>
+M:	Daniel Baluta <daniel.baluta@nxp.com>
+L:	linux-remoteproc@vger.kernel.org
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	drivers/remoteproc/imx*
+
 NXP NETC TIMER PTP CLOCK DRIVER
 M:	Wei Fang <wei.fang@nxp.com>
 M:	Clark Wang <xiaoning.wang@nxp.com>

-- 
2.37.1

