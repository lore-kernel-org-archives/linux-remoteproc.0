Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B941E2FD7DE;
	Sat, 20 Sep 2025 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758374115; cv=fail; b=BindNM1G1wQXF/GXSwlShsmoB92nB+nR8bmSOT5WzidgM8EYLTwVE47XbeXnVCWHIaGqcf5PhMnEQ2Ezn03LnDocq29t7GpPmjtZpUNA9ICC1nTftrYH2ODVpzcd1/JdZEE36NDJzYHvL2Ag/whjogS2mf7T6vg7MOijBHqrQFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758374115; c=relaxed/simple;
	bh=idSCNJMvJPyFJN0jolzdeOHdNjooP5NvZW8l4TJeZG4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BS5cTm0AVhbIf3Bk5FN2nUz1tM2EdqdYVUhmJM88uteSgwfJffNyLJqO02bK1C4V6koDqqiQ0rh6cy/kcV5n6OhDdN5gjNkOtFdRU+iQv6LoX0IzWbe84y9xtsI3nTsAyR0sKb45S7gR/cel905wCqT0EaQaSCn7tx2nDMRxwY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q4cXBnb+; arc=fail smtp.client-ip=52.101.72.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q4cXBnb+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnT0uBiLY/CHKx3F8v1z+DtL7/oJYzFD+QMhcjI9zb9fR2OohKqvWKLcmTVUbl/zCb4RIDA8UQPmJEMgk16t9X3HtXpyihA/7tdVViURyjG1h4Oz4Nfyzd7UWi9aaLIXUSrleOct9UxSHr/x9Tds80F6YGJqT9FPKccWtdq5+72NyPa+s/qWdfanW/EraEpQttSI3upXa+rBFICu/2kuwNAtjKiuGTFxp2agzaGmeLHiNB7FQsGZB00h2UGUJ3zjoINzTlNzNB6ngvUXhgw8Lch72xYlscUwwIpNwL7Ca3Z3eOfRgAR3mLlBP1gB/ve+q7mH4wDruIn0ZH+CpPUVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+TEU647JIjJqH/nMND5pjVgbRGKb+Utpgol7iC7RQY=;
 b=LV/frF8/I+EmuNEnWRMw5ZcFVwpyP/tN6NtvQpyvEb+3jKpuVViOqs9XAOy6oeWqbDWhjbk0XvTYR0DE0Ype4ODCLPsEfun2S5QVR/KKkHcs+vfDpFeS/NWDeNUz+vu1C865nnqBQvG+ZBTla70lQp0gZbDPWT/MwZz23LpBzK+sOvKTBne04UFY93z/A4zekanS0ZC6qhsViyGrB0UewDFndTeD47ajghznVo6gV2yb1T9nCYrKAW4feppKmmbMYxhn4NYTFWANMTnl7l5jWArfZp2+2B7GDW6Wo/6vAG0HnNK60MRx+4e2uykkZaeT/qSlSIkkJw5dWkaRiaBuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+TEU647JIjJqH/nMND5pjVgbRGKb+Utpgol7iC7RQY=;
 b=Q4cXBnb+LoKZcN4LJwlzZ4aX8YGxEltPLxugjVPOcC7Rl7vVQGfyAtgkaRyJl6vA9s6Gv6OQjWgRexYLE5lhT3ANfQYxO3EM6PFJ1QOSZeQUNozB50A44C4rAuoK0onDsMxpWAsjQ+I/w73gM5xiAodhnbCWNhysbd6n03rMwsPS4V7jpEcEJ1d/vDJXeoRC0d8m/yAFJMu9mtrSKNEdNNL2OjEY+LPzTS8SsBcU0T320LKuzFv4oz7rHDAtGfRXpbtD1GRjvowS1plUCDw18ZqncBgWhxCfi+FjUQmpwPbg7cVbz8NIFtbQkuM9oewKjd03VY7pvGpkHB92wqY+nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 13:15:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.017; Sat, 20 Sep 2025
 13:15:11 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sat, 20 Sep 2025 21:14:37 +0800
Subject: [PATCH v2 4/5] remoteproc: imx_rproc: Remove the assignement to
 method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-imx_rproc_c2-v2-4-3351c4c96df5@nxp.com>
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758374085; l=3509;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=idSCNJMvJPyFJN0jolzdeOHdNjooP5NvZW8l4TJeZG4=;
 b=7+c+WuJpL8OIOMJ5l1YA4kwASIvjemnn4TT+KKCKeTQgkWXKGNv9xi9Ap1RdhhjCZmWW1rn6q
 GvaHDtNstpSAh4V2OZd43tRd7B96GU0+L1OrqGr2Qh0DjSdP47/CG8g
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c27832-ba29-4acb-78f7-08ddf847ba5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWJYYURuTXNhdmkvU3o1UXJKeEhIRHdEOEUwSVgrbFFHSEUvS3pFUXFmbldR?=
 =?utf-8?B?TjB4VHRYMjVSeTQzaTdUT2NpL0xGZVp6MzA3c0czaHZoV1QwdXVmLzVqcjBq?=
 =?utf-8?B?TGpYOXhNRFg2ZDVvOE1uMExVRnVRSHQ4ZWREdHpZS0wvbWVSQTFjSGw2WUlK?=
 =?utf-8?B?K0I4Nlk3MFU1UytsV0lsdmcrb25YSk56L1pkVWI0alhEcGF0YlRuQjBKZENx?=
 =?utf-8?B?SXByL2pmK3ZmL3JLL1VuajY4MWRELzVYSkpVNSs1N3kzeEhkelZWSkZnUHVY?=
 =?utf-8?B?eE44WE1NSzBxd1Y0SFZmb1VYU1VPZ0NIRmc2UzB5QzBjU3Qrc3FFNmNOSW9j?=
 =?utf-8?B?RXhpRmdxSHZRR1NGY294VW1naXlGZ2ZTdG91d1N6N09tcXdJdWNMMFhlOUdi?=
 =?utf-8?B?M2dHTExGS3dwSlpLYjNjR2VpRWdlQy9FMVN4YmVzcXd4aGZIYm5kNjB1RXlD?=
 =?utf-8?B?TDlrZUk1cXEwUmQ4ZEFQV3g1M0JUS2E1cFYxSHdZOThGUTYxTXdVT3lFMmU3?=
 =?utf-8?B?N3IxWDlFZkI1dW9QbnNVTHE3dGNMa3RNNysyb1RQMnZ2ZWRHZ1VISW5KMzdx?=
 =?utf-8?B?dDlzT2FhY1FJVXZsSHc5dkVOUVE1T2ZVTHhYZWl3ZnJKMzB3SUozSmZyMkpu?=
 =?utf-8?B?NVFLWHJhTE92K2xPNFdoQ2VhL0I0RDZPRGNPbnBJY2VPV1lqSDBjVUIrakdQ?=
 =?utf-8?B?UzBMMmhPakUxbWJ5a1FyQndTdVpDTUoweFZoK2w5cDM2dEJJbjlOR01NWmls?=
 =?utf-8?B?bVFGV0hzNnM4NnZYV29RUTNjUVlBbXJvd01Td1YwWXpJV0FqZ0QyZFRPeUQ2?=
 =?utf-8?B?VjJySWp6TGRybi80T096L1N2ZkdiTEZmTnVlNnlDWE84SC8xVTFDQXRHaXdU?=
 =?utf-8?B?YkdiM3k4OHEyQThkNFFjNE4rekRDRmpiRElzMFJBdml3NEQ0VVlZZzlveDZM?=
 =?utf-8?B?M2pwMnpKbzFZQjlwSVkrb0g1N1M2RmRDaUtoaitCKzduSU1hOTJsa2VDdUQw?=
 =?utf-8?B?TE5heVJnZzJTZGsxNXhSOE96bWNOalRrYzV0SW40NzVhbUIrYk1HL2lsdnpw?=
 =?utf-8?B?VWtKcThkd1ArTUFQOGljWEJxTWtlRWlralZqaUF3YTIzd1psdzBtejlLaVky?=
 =?utf-8?B?TkJ1R0lZN0U4c255Um9COHE4WDQwKyt0bSs2UEEzM3NyQWEyYlFjOUowNUp6?=
 =?utf-8?B?WUdhTHZjTDU4aE9Qa3oxK1RIN2E4WXFmTlR4Y01BWnRJRTJkMUFnbkd6a3gr?=
 =?utf-8?B?UEZjakIxRlRidEVhWFFrRVFEbm1MbUMrUnYvTHc5MFNpSVJKTzFKQ3pVTmMx?=
 =?utf-8?B?MlZuVXltdHNYamZGSVVRWnkvQVhGWG9MejM0dnVhbkVsaEtKV2tJa01IdDdz?=
 =?utf-8?B?NitrRFJWOVE0QVo2alN6L0VmVG1kbndETTQ4eGlrSkNoMzIrbThZOW92eVlt?=
 =?utf-8?B?T0ttNkc2Mms4UWhBaHVxS3JvVUFraEw0RFZhdkNZQlV3YVFHV1NpOVlFalJK?=
 =?utf-8?B?aVpRYTBZKzZaMktZeUNUd29yM0NzeGtSTHcrZVhwemsxZDRwaE1pcjVrcitF?=
 =?utf-8?B?TEl5MkJtQUh1UWFWVitDbmR6WC9jNXFONHkvbkM4aHRsdElHa3FZaXprblVl?=
 =?utf-8?B?cUpZWWhhekxyUUJXUnd2YWN2UWlQaU90cFgveERTeFRtVmxlVTF1ZnpheExm?=
 =?utf-8?B?M3lHb2QxSXlnZlJRclBJNDEzOEV0bkJKNVp4V0MvNUdQS3R3bG1yakNJUHhV?=
 =?utf-8?B?OHRNVnROcDlwTWQ1eGhveFNLUFA5bGlaVlpscllFR0h1ejNUbUpaeXA4NEIw?=
 =?utf-8?B?WHcrU0tpeFVMSUJ6aUZBM1B1RmRaVjVSYXIrUjRvUGduWDhpR29rb0xyaFlX?=
 =?utf-8?B?N3dQazlLdjRUeUNhaERKaGxkMkpZTFJvOHQxcW5PRmkrOWlteEoyeTB1c1h1?=
 =?utf-8?B?d1pVRDRuMm9vaWJpOXErUlFFaGJ3OFRRejJINWJwWEI4Y2FWdGZqVzRUVkFY?=
 =?utf-8?B?TXQ5OGRWbTN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elZBR3Vnc2VsV1BCZHFJNFJTQWliZGJUNWt5UktjbkR4RzNTRml6NkVCVGNG?=
 =?utf-8?B?VEtmdG1iM1JCS0Q0ZHA4MmhnVmR1VHovRzM2L2duNG92SWhOWk13OEJEMkx0?=
 =?utf-8?B?ZU9QT3VvWEdDNEFQR1NKNE4wWkxScVcyT2ptWlJqczZHVU1yL3FTbTlmOWVw?=
 =?utf-8?B?YzVzVjlCODVNcFFWVGl5TEEzRVlrMDlEMFZHaS9vR3RBOFFpR2lwbjNOalls?=
 =?utf-8?B?YmNLdmg5cmRoc0YxUVlzdVlaOFFIM1dsVHVSVHlwUFViV3d5VGRRMUt4N0wv?=
 =?utf-8?B?M1BtN2FUNmlzSXpla2Q4Y3pHVWVWeUtwMjhnL2MxSlpxUDE3cFhBOXdRUXFz?=
 =?utf-8?B?eGc2em1NQmp4alhsZG1scHc4YTJRbmZSTVQvS0s1SjFZaFFOVlF1YnRtNGE0?=
 =?utf-8?B?SElJVnVKTzJuQ3VxUzlmUG1GTytsYXFCek5MTnRaR2pFSCtJRHdTYlRkb0w1?=
 =?utf-8?B?cDQ4M1h2TE1LVTBNbU80U0ZFR1Znc3ZKMGlpYjh5RWhRUHAvL05GU0xSdlNR?=
 =?utf-8?B?NDZYeEwrOTNTVDNkYzFxbFhBMCswdGNEa1QxcVhKMnhjSEFHU1JRY3QrU05l?=
 =?utf-8?B?Y1YwaVovdk96ZjFuK0x5K25hTHNnaytEZjh3NDhhV1g0TUVsZzdrQVVONk5E?=
 =?utf-8?B?K052dW03ZnhkYkhRU1BEcUlRSHFaQVFWQ0x3NG5RbVRTbVd6Z2RNZHRySngz?=
 =?utf-8?B?dlNneTZERUNyTit0VzZsckwwVG5NSExQcjV2VnF1cG1ETVMxTSszOS91WXFZ?=
 =?utf-8?B?ZnpWRnU4eU9LU0NOUFAwZ0g2U0Zqb3NTUTUwcXBIMXVodWNBVEFQcmNabHBD?=
 =?utf-8?B?bUxZNVBrQ05UTWcwTHdMaE8xY04yQncxZzJveU41TjJ6QnFxcEd0S08xL0tC?=
 =?utf-8?B?Q0YvK2E4MitRTlFxZmV5b0d1N2xHNUIwdnp5L29PWERKdHZSYzFROXZMVTFL?=
 =?utf-8?B?NUpjVThuaFA1RVlZMFRwQ1FVUkNZUm0xbi9rUWZ1cHNpbTBtVVdMNit5Mjll?=
 =?utf-8?B?R0lSaHh0Z1R1UURJMWd3R0ErczREV0cwbGtoRTcwa1J4VGhwZXZhbFZ1RGc0?=
 =?utf-8?B?cStncUVJRWlQYjRCczZBbDZiU0ZWOW1oUERIazBEZWdLZWRnRFk4clZtcld4?=
 =?utf-8?B?TmlodENZYnJUWit4elNKbXB6SzdvSE4wenNYaGxkbVVvM0Nla2h4NmlWbjhF?=
 =?utf-8?B?QUtoQkt1Q01hVlluZk5lTkpzenNBVjBiQ1VFK241UFRyc09WNGJoVEszVm9T?=
 =?utf-8?B?cHpweXZkaVo0MHd5Y3NKV1RISE01M2c5QkYzZmRNclZKc3FTSlB0aXpiMHdm?=
 =?utf-8?B?dDVWQW5GKzAwaHVEdlIvaUhvLzJtRzkwc21qcUY3dEtGeHEreVA4WkxRajFX?=
 =?utf-8?B?TmJvT3FaY21YS25QdUhab2hDSGx4dWZJZ0hNREVsVUNXZFQ5ZHdkdlVTOVI2?=
 =?utf-8?B?NmxnaFVtSVVkNGxDVzdjSVVTaG9ZUWE0TnBwQU1tRFUraFRkcHB0QmpmWnFL?=
 =?utf-8?B?SzY3eU9udmxoMzYwLzBXdWRZVmNGVEZGNmpQM0lUU1FyR3haaW5Wa1JXZmoy?=
 =?utf-8?B?bW9JR0hFelBPZlNRRU9HdlZGVG9zaWxVZVFIV0ZKNmVzRGdBYlQ2OHFzR1g0?=
 =?utf-8?B?Tm05eDM1Sy80R3Z2RmZOQ1FaekdWWFRFQUp4akh0eDBvbDhMSFIwMTJ5bVRK?=
 =?utf-8?B?U2wvb0crRkVVVEx1a1UwYVJ6UEFyeHkwSm9CNVhIMzd2NUQ0U2gyblMzTWc0?=
 =?utf-8?B?d01Sam1VTDFnNzE1ejJ0N0x5VmpMMVdnT3F1dHBjVmdhUzFvNkV1VmVDdEJZ?=
 =?utf-8?B?dStsUk0rb0NNRnQxY1ZCWTVWaWpNQmtsNkEyVWVFb3l3WTJNTTdldm5yUnJl?=
 =?utf-8?B?UWM0dENzem85cFd6TmFORlBiUHJXOFZVSzdLTnlZQkRCd2dpVnFKYlpXc1pZ?=
 =?utf-8?B?N2d0bGtUUWdsYjRFdW04cTJXdWV2a2Y0c2k1TXNuMkVFd1V5VnNQZGVtMkM4?=
 =?utf-8?B?TU9GUEx5NjdxNlltdDhmcXNtY1pHbEhUeVB0WDJmSTQvcVRqTTBmbWRmblg2?=
 =?utf-8?B?U3Ryd1dndzlHQytMbXBIVTFGdGs4ZFVrN0oyU09jUTZoSXdpQ3hZVkRRVmN1?=
 =?utf-8?Q?hppKKPlztqsf5GIjtU+7pmK9p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c27832-ba29-4acb-78f7-08ddf847ba5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 13:15:11.0550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0Q9mZPWlrpP3eJ6fL/2wCQ9EIiD5PN+JHyyNee4VAcz1aSlXFsr0tyYBRLHyYNIRp/6q8bzQQ1RY/bCOHkbig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

'method' is no longer used in imx_rproc.c, so remove the assignment.
But imx_dsp_rproc.c is still using 'method', so still keep the field
in struct imx_rrpoc_dcfg.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index afdf7ba73783512016c3016cd1bef395a28847b9..8d75d203a5b84f53695dd562a9d27497bae87785 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1173,7 +1173,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1181,7 +1180,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1193,7 +1191,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1201,27 +1198,23 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
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
 
@@ -1232,7 +1225,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1244,7 +1236,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_stop	= IMX6SX_M4_STOP,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
-	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
@@ -1252,7 +1243,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att		= imx_rproc_att_imx93,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
-	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
 	.flags		= IMX_RPROC_NEED_CLKS,
 };

-- 
2.37.1

