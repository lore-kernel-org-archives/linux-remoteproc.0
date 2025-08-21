Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6822EE60E;
	Thu, 21 Aug 2025 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767142; cv=fail; b=WczSYcsaQ/Rfs8lpvagDVoMUqXtLJnBaHYUT/y+o479r3wvu65H1lxjMQ0tnnjO+JUPraY6cBjJZ4GwKB6BecC1vaJ5BctcNNDMl1T2t1PhxMHBRYYPRAz1WMO/jZC4ToV7I6hn2pFWIgSWVOurf7eaHfKOew3uF7QVqUPOa2ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767142; c=relaxed/simple;
	bh=D6kMRSgdMEI1Y0X9XNvdU1qMt6FskdBgejERjnFUdAA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IKxTCZ5LH/Ethn//lNryYYptxIHrZMG8zh3SnWf341TePWbqWhk7Z3viPjfTCgMCvWUu0b+EywD64wc5onahDIkEMBXMkVJyEHGTU7z6vwhXA5nUGihX1j9C1xjBudhtPC3cydoUcrG/cPKo9pdFUfmqsu59rWpeBHPYceddZLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jGnmnylD; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jGnmnylD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmZaagCa4HaTJ/BLj2zS0v9/0gT/93CBRO8iTbs2fRXj2Vm0QsTtuY1ax+drsaCufSluB73xA2Z0h1CoAMsNl0woFPwhX+9xblz8ePHLz7WlDZecLfe+2ZhtbK/EyM3DqIla4M0jZvHIS/x39kzdvKAsHSRvWNRjxY7M/EX66MnssMG56xXuhK1Z7TQ38IekaPwr+DMwWaDczY4K+lInSi31poG2Y0RoaRVRFRS5wAfy9M5fPecco9C8hn0oTo2DWTT8wIqnxsJKfhras4orCnRgSIx41xayXsx3EdbYkroz9TQeGA1wSwjub97KzV4yT9PQmzsUBHUvQiBscIKXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+StWxaylqZ4sRFav+UWM43fpxgFFKgBsvazbsGpnJ8=;
 b=MUSID0bQlSJXrtXqNsHjxGYhBKAfPxX38JiYXbU3J+1n37qK7DLwVZw09zPvSIiLeIhU3uLN6ZTunl/G2IDAGqKYpb+ma4cBGxBjntjjadriCRoHUn7yDJ7gKtwUZE4ogJi63MTiP3qeUuwEG8stulKgZ559EYpyNr5uxgqSx+Hogg/BcYaqbMIrDGH2wCcLxwGwSR6rfvLsB7lbM3mU32trAHzlrgknxga02A4r7PJoyxt+mtIPMQ0a1YZKa2xYhsgsX83jBOKWH1ERttmqvAAv4yJ97DqiBBr4YEDZ8ho3tWiIEWP4wh81HGM2FWX07w9gi9aiBbGnxlktBl4HJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+StWxaylqZ4sRFav+UWM43fpxgFFKgBsvazbsGpnJ8=;
 b=jGnmnylDWBSf0HBfcBedM/mk5lXL0CkRbU0KQYfD7AeORnXiLdGOmMmbvsN+BGz1f/OEv33hVGsVphjzg09C8sM/14qW3vslmRsdTEZlw6ZP42rgUXAm/yoqotcQ6b6WByImwjfcxSwRlhCEn73yusnKpIq/NnL45nNa5TbmbKHAR36aMDADlJKxgUu5HQLGiHeqgkYDqihfRU7w81QDYL3qHkvjfH10ZILGj2UbZSZm+5sYEAmn1VQWvxPrn/uUvObf18nOzlneI+MmEqfx+U5BSLz5vThFuGdDXdGUH8CWNkzqEIUt7pCvejR79qjdC6MR29Pym7Sez2b9lU9ztg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10101.eurprd04.prod.outlook.com (2603:10a6:800:24a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 09:05:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:05:35 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 21 Aug 2025 17:05:05 +0800
Subject: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
In-Reply-To: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
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
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755767118; l=10056;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=D6kMRSgdMEI1Y0X9XNvdU1qMt6FskdBgejERjnFUdAA=;
 b=wCYlFAWjRBm3b8W1gGvM1oFaY7dAOJ1znSjHQi/HafVDrsX7snEvStvVbDarNlgakyLWBPmL/
 cqi13jCfW1WB1vIbcfp/YhmQJDsXtlXOdN8NoJYmjMGd+3KTyoi7tbz
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d47080-afdd-4c4c-f377-08dde091e3d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnRyMytFdWMyRDRWcWtZMVBDMk8yaTRwWXgyUzVSeHcydlNyb1hYcUhDUHl1?=
 =?utf-8?B?UGdIUnpDbGFjTGtEUDBCcVQwZTk2cmpZd0I4V0tKWmR3Vjk0Tk5vZE5FUVli?=
 =?utf-8?B?NHBoOUNocHJzU2VkV1BVWEpwTGt2bUE1WU5rMU91MzliOHVkZ0tuNERseExD?=
 =?utf-8?B?V3pYT0lIemJmaEhVRVA3UmdybmZTRGlOYWVUODg1OFF0THVCK3NaOGsrY3dI?=
 =?utf-8?B?STE0MVlyNFBEc1Q3SkR2N05mdEtCN3ZyTzZMRVhhWkI2d3VBYXJnR0gvbExo?=
 =?utf-8?B?dGo2MXZYTW9SS0JZVm9BenE4K3FTYXduZTRBSkk0KzB1UEg5V2gvYkZlUXZY?=
 =?utf-8?B?ZXBZd3hQMDVXTkQwMU5ycWh5bGZ0SGdXZlduUWZRTE9IU1V0dXBqaVZYWjhL?=
 =?utf-8?B?eVhBZDZQNEZvUFRvcFpPMHpITkcyU2U5NlpUcmE5VExXTU9IaytIakFmcld2?=
 =?utf-8?B?L1djRERkU2ZLOSsvNm9wekxLZSswd3E2dlFxcy9LQk5tV0R3RTcwT0Q5NTRh?=
 =?utf-8?B?YUxCaHQ1bGtrOUhjV3FtUmF6N3d4a2krYXhxZHloc3l1MUIyT1BPeThSYkJK?=
 =?utf-8?B?Q3J6bnQra3dzKzQvcWpwRjRsWDJHUnNwb1RPVHZjZjhNeGdGcVFTckJHcHMr?=
 =?utf-8?B?eWsvSkM0cEhIaWxYRmZ1ck0zcmVLR3F0UG93cXV3NndRODM0NFgvRFF5V2Iw?=
 =?utf-8?B?TTlHdDJtRWRkS0V0enFwR0FFUTNlSnlLTWtOYnUrWXpsQU9WbGtDdWd5WTkr?=
 =?utf-8?B?U3pSdjJZMTdZY29DdXpKWEpQalBsUXYrRHVuYzVtUzh1NDlIQ1Q5NWNPdEgx?=
 =?utf-8?B?TmIrajRIZFRJa1FNbTcyWWZjYlJlbTJNTHl5SXowM1FYcmFxWjdGM2pFYzBi?=
 =?utf-8?B?WDNuc3JqTFg0QlA3eklYbThKbGkrSWp2b3JCS3dldmRnSUVZVGtOS3U2QWMr?=
 =?utf-8?B?cHdMOVliVkZRTFJTTUlUMXNyM1RWSmFNcVAwWVJqbnBGRFQ5RzUzaTZNMjFG?=
 =?utf-8?B?dWlpaUNLS2x3MHVUM3FIeTlLRlN1VFNSTlF6RVhaNmlFeWFWN2ZIdlVNQ3Zh?=
 =?utf-8?B?KzZGM1FlQkZrbWo0OVNucWlEL0ZtU0hSajNld3drVTZYOUtuYXYvSTR4SmJW?=
 =?utf-8?B?dFZaTXZxWmQ0WFMzTTJiTkRCcW5SY05POU0xNW4rK0FzU3I4cnlSd1BFYzgv?=
 =?utf-8?B?aGd1SW1DRmZXZS8rWVB0MnFsWFJSMlZGY2ZmSXBudlRMT3RjRnB2UlNDa2VM?=
 =?utf-8?B?SGRtdFU2K3U3M3hTcUlzZUtvc1lTNjYrL2JTSHdIYzBYRXhNNmpOcmxhR28x?=
 =?utf-8?B?QkFESm1UWDErRHVwVFdGN1NIeTJTdlJUQmxWaWxUUXpNS2lJZWZmQ1RBWUcv?=
 =?utf-8?B?WExDNlFhQVpiS080SEcvS3Q5amM3cjY1Ykp2MXZYS1VMU0MwNU9mL05EMmVL?=
 =?utf-8?B?ZzBmYW14MW1GemNaL1JYRE8wcUQ5RTR0U2lDQ2oxS1JrUVNaSnZ6VitqaTk1?=
 =?utf-8?B?eVdtalJONWtSdjQ0cGpsVDhZQkZIQ29FRDlCWW5iODB0L0VwRTRpckZmdDFQ?=
 =?utf-8?B?Vy9xTmxvUEJuTDJHUUplTjl0N01nd1hJTnhkV2xZbTF2Z0FKWWpXeTFXMERh?=
 =?utf-8?B?QkhsTlU5b25PQUdSOWFodlQ5NHdmYjNJSXdXaUVWMVI4blNuUUdkTDlYMGtG?=
 =?utf-8?B?bld2QUM5Z0tPenlIN0pMWEVpV1NsSm9ESVhTL2poS29XVUtlTlhqSVZldVBX?=
 =?utf-8?B?QTRmZVNtVnppaVY4OWZDVGpwMStTckRPYzFRUkVXQlVUd1pkWTM0U2JVTU0v?=
 =?utf-8?B?YmJmUzkzNHlCaHl2ekdkUk5vYnJEOVc3NmxYUVV2eUhFbFFiMlpVaWwvUUYx?=
 =?utf-8?B?WkpGY1VFLzBmVkM0bjBWVUtZL3gwa2hoeXQzR0ZMRDVZdmZDWjBXR2dVVDBa?=
 =?utf-8?B?RmxDZjRseHZ3ZWczVjFlUHpXd25aUE5NLzR2ak05OWxYMFZnOGoweDExK2Q2?=
 =?utf-8?Q?hBYhRbFEs8Nsu9mqJhhf5zzlvRgO4U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2MwSWJGYmdFdy9idEZtUnpSTGwzeDc5d2xzR2pGTFlJem5PNUFTYlRVMTJt?=
 =?utf-8?B?NVBBR1NMMUsxTFNCQ3VLVnVqOVBvMHRBVXFPbVQzVERCRi9LYURSSmVhZE1C?=
 =?utf-8?B?blVCTitPUEI4ZXcvRU50ZjAxV0hkUGlQMjZNZDlIS0FVOTRhMEJjaGxwcHhK?=
 =?utf-8?B?Q0doSHB2ZDRxSWJudk92NVZsSnp3cjhGa3NmTitOaHRBOXJtK2RpMmpsdWps?=
 =?utf-8?B?YkppeElwcFRWdFR5Y3VmT3EvOStiQjF3WlJESUtESmw1REw0eXAvVllIQTQr?=
 =?utf-8?B?cUtPVmVtbEQrQUpxUW83eUlzb05FRDVIcVViNU5WVzRNV1RQdjI0a00wUWZj?=
 =?utf-8?B?eWdSSjVLaHpKYUE2OE15SkI5S01QTUtmbkQ2ZURCY0VNNnVmcTdoelcrdit3?=
 =?utf-8?B?S3FUdFpzK0Jud2p4eWN0S0xRa2xUU21QZG9vcHJDWFZWN2VxQnZNZ0hpUiti?=
 =?utf-8?B?TWNtZGlYY0p5TTk2QWd5cmZwaW9JNnQ5VDE0RVlSVFRXMkp0N1YrMzJuVlp6?=
 =?utf-8?B?U0RrekVtZk9DZCtOb0RBT29VRzB3dWdYeXNOU1Z6bWZhcURZdzhQaEZ6YWtQ?=
 =?utf-8?B?SmlQMDZYZmtHbFR0aERkVmFvOVU4NU1SRjhEb0kvdjRPWk5XNjJKRmV0N1Zz?=
 =?utf-8?B?YWpxcVFHaG5FVk9leVNCWFBvR2JQUnRqVjY0L2xXN1BGbjhoSjJFOWNTai85?=
 =?utf-8?B?ZFJrWTVVdmtrcFh5N3dvbWIreGZIOElRUGprTFhYVk9rODBWeUJqdmdnaDRp?=
 =?utf-8?B?b1ZIV1hXaW1IZmd5aTBrSGFqZzNncmxIdmIyaFRNbFBTWlNEdDFTV3U2b2JB?=
 =?utf-8?B?Tk84c2orZ0d3cE1rd3ordDlDY3h0RmZRTzB0d3k3UzlPeGFVLzRqVGI5UDRl?=
 =?utf-8?B?WVJlQjUyWHVUVVNvQ1g5VlJyV01HRWZQMGhIbXJXbmlkd1kzdXFaaWtrSTNU?=
 =?utf-8?B?VVFRQjN1MTVCKy9mTnRldTRSb2MrYUg5c01KUmMzOHBuTnVlZC93bi9Uanc4?=
 =?utf-8?B?Z1RXRnRRamowTGpMUDlNRlhPZ1p0OWY5SXZTZkcreldhRDBheEkrV1NJS2JK?=
 =?utf-8?B?bHRGM1ZiUEplOFpWTklQZGlyWG4rK01wVkVzVTVWTGdtRnIzWEErbnl5NWpx?=
 =?utf-8?B?VVdpNUJ4OTAxM2R6aW1XY1EzaFl2WTVKdDEyVHhLKy9TREdWNFNUVmM0ZW1G?=
 =?utf-8?B?M2VRZmdRR082OHd5ZkxFd3RiMThoUU03UXloOHNhV1daWFJ2NklOMmZpZys2?=
 =?utf-8?B?cmdhQXQvYU9tYzhHT2JWRWdrM3k4QWJFMlBuS0RQYXlNc3Z4Um13cDFCbG5v?=
 =?utf-8?B?NFhKY0g2Z3djRmFOSXV5elJzWHJpMXdrUXVsMUs4RGMyWW5TN2Q0eVIxenY0?=
 =?utf-8?B?bVo5Zk1DaXFBR1U5WjZ3ZG1IOUpWREFiRnhFaEFtVDI3TXBoZENkbXRZQUhL?=
 =?utf-8?B?SVhVcnhReDdmZ3QrbXRDVU15alAzTHo4dXliVnBJQzIrTWNVSmtYd0E2Y3Q1?=
 =?utf-8?B?alY4Ym0weEF5WEVqVnFWWG9XY2wxZDlmWnVzQVB5czFsTXczZVdMTEVyNHd1?=
 =?utf-8?B?cGErMFd5dU1aZnJubHg4eTR1cTlsTTNqWUFOekpsOW1yT1doTllCelJkTEh2?=
 =?utf-8?B?K0kxZjFKdWNRZmtyOFpmYzBGQko4NzIrWWZLT3I2T1EyUE9JQUF3VTlXZjNQ?=
 =?utf-8?B?NmFSYWNzTHRhOGh0V3BGOWFtS2xTUjFES3k5eFpFVU9WTVNNWHN5Zm1wZnRF?=
 =?utf-8?B?eS9xMWVqZ25BK2dBdUdVZE9uN2lKR1RPWk5xR1JQdU1Fdnllc2VWWW5tSnpD?=
 =?utf-8?B?VUk4R3JieDl1cE9yTUhRem5nT2V2WWhWZTVUbDN1NDlvM056c0YrZ2hKY1Z5?=
 =?utf-8?B?V0Z1WHc1VTR0RnVvK3JwMGV4ejhucVpFMmU5ZTlUZ3Ewanh4UnUzQTRaSlRL?=
 =?utf-8?B?bTNIU3lqbHlveDJ2bWlkdTA0TEhTTGl4aUlpTFNaRFhpTExQOW1La1paYnZN?=
 =?utf-8?B?VkRJODdzSnFUc3VLaHBYUElydWtXTS9FQXRTTVhUWlMxRFpRVHVWL0lsNGQy?=
 =?utf-8?B?Y1JqRnIvam9UWmNKS1NXcWcrZlBMNXVySUMzRXNSd2JjaGR6Z1VaREZPNTd0?=
 =?utf-8?Q?pq+Zg1EBIRMiNNQxo9Z05od2a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d47080-afdd-4c4c-f377-08dde091e3d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:05:35.5755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: No38roPD0WVIaYKDc10GniFRC6jsA/a8fBwDZr70E4S/lviAOrYSzAOdRYLdN0V9TDLM7bT4wnWmN1bF4cL2Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10101

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
 (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
 (2) M7 in a separate Logical Machine that Linux can control it using
     LMM protocol
 (3) M7 runs in same Logical Machine as A55, so Linux can control it
     using CPU protocol

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
   has System Manager.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a seprate LM),
   if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
   protocol to start/stop. Otherwise, use LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |   2 +
 drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h |   5 ++
 3 files changed, 127 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -27,6 +27,8 @@ config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	depends on HAVE_ARM_SMCCC
+	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
+	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
 	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9df0ed873f493791f2d1466e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -22,6 +23,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -92,6 +94,11 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Logical Machine Operation */
+#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
@@ -116,6 +123,8 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	/* For i.MX System Manager based systems */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+				return -EACCES;
+
+			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+					dcfg->lmid, dcfg->cpuid, ret);
+			}
+
+			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+			if (ret)
+				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
+		} else {
+			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
+					dcfg->cpuid, ret);
+			}
+
+			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
+				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+			else
+				ret = -EACCES;
+		} else {
+			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
+static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
+		return 0;
+
+	/*
+	 * Power on the Logical Machine to make sure TCM is available.
+	 * Also serve as permission check. If in different Logical
+	 * Machine, and linux has permission to handle the Logical
+	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+	 */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret == 0) {
+		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
+		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+	} else if (ret == -EACCES) {
+		dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+		/*
+		 * If remote cores boots up in detached mode, continue;
+		 * else linux has no permission, return -EACCES.
+		 */
+		if (priv->rproc->state != RPROC_DETACHED)
+			return -EACCES;
+
+		/* work in state RPROC_DETACHED */
+		ret = 0;
+	} else if (ret) {
+		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
+	}
+
+	return ret;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
 	struct reserved_mem *rmem;
@@ -593,7 +674,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
-	return  0;
+	if (dcfg->method == IMX_RPROC_SM)
+		return imx_rproc_sm_lmm_prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -927,13 +1011,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
 	struct regmap *regmap;
 	struct arm_smccc_res res;
+	bool started = false;
 	int ret;
 	u32 val;
 	u8 pt;
 
 	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		/* Get current Linux Logical Machine ID */
+		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+		if (ret) {
+			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+			return ret;
+		}
+
+		/*
+		 * Check whether remote processor is in same Logical Machine as Linux.
+		 * If no, need use Logical Machine API to manage remote processor, and
+		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
+		 * If yes, use CPU protocol API to manage remote processor.
+		 */
+		if (dcfg->lmid != info.lmid) {
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
+			dev_info(dev, "Using LMM Protocol OPS\n");
+		} else {
+			dev_info(dev, "Using CPU Protocol OPS\n");
+		}
+
+		ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
+		if (ret || started)
+			priv->rproc->state = RPROC_DETACHED;
+
+		return 0;
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
@@ -1045,8 +1157,13 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux or it is managed by SCU API */
-	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
+	/*
+	 * Remote core is not under control of Linux or it is managed by SCU API.
+	 * System Manager(SM) firmware automatically configures clock, so also
+	 * bypass the clk settings for IMX_RPROC_SM.
+	 */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API ||
+	    dcfg->method == IMX_RPROC_SM)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..6fe8d975ed302967f27b7a4319a899e6f0822976 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -26,6 +26,8 @@ enum imx_rproc_method {
 	IMX_RPROC_SCU_API,
 	/* Through Reset Controller API */
 	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
 };
 
 /* dcfg flags */
@@ -42,6 +44,9 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	enum imx_rproc_method		method;
 	u32				flags;
+	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
+	u32				cpuid;
+	u32				lmid;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

