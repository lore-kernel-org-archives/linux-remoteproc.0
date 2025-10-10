Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F982ED15A;
	Fri, 10 Oct 2025 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099099; cv=fail; b=lCbJxG2b9KcP00KmQhVo0ZLVEzNt01e5oQKY6g9kX9F/34B44HkOZr+RQg9aBERQTBe4vFZ4BCZzxKUX6pph+j7ZfxJqhMCkNEtdOswU7g2Vl1uyYaxEyDz5JOli/lyCoIfBmlax0DUc9sB0HwNEci6GmCzYSva8pBV1utkF2hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099099; c=relaxed/simple;
	bh=KA0SkMHsTTmTkN0Yn4ItIaj3a6GcxuFTfoOJBDK4Ihc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UPaPL4UeSuBdLNmAfGXV8WBQ5OKeCoWIXI46TvDxOdAFMMdvbAYy5LAHyR4ijIOBedGdxylj80zaRdR4srjhi/ri+hB9o12XqUqDe+Abq/yQaOjtDVSXbO7EBLy9uXG4ItXEX+b7b6xSp9Dl4hxAll1BBHZ/2PoVnOT4D5CKfk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OkDxiEbT; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OkDxiEbT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL1rwvINBCkdWiKN7T831sBH/6u0e4cUpN2FDczuvBDFi9oQdXLxyvF84+29mkcCJA6l85IOgKPusRjpCfgiDvWsiSSIKBQS8tLbd+uXEbD1QwRDOOYDdDq8xL+CEha3V4rDjmAYbslvOMPI0lthV2RKUernVSvjsOnVAb/pljU3XQ9GFzvaO8JkU86CZ2/J5EM4MFMotBV/TOrxnS1cVovp+QCtpIbb7qZz3lbTJijuwcXwUXt2tOe2r2zIrwL+poN3KrJg/o6qfhT0F1UwrfhgdyAqZV4O9DE6ZJvYVReaiTATpKqinDb6VOyTyutYsAErpnfASE7fssw/noMsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fRfd4w4rGOmjYj2uc2/V9soSG334t8HS4COicz2jvo=;
 b=bAPBclBCx7F1EHCE4zk8JwekmiZ+57dABJ5ScZKW4HF2DgxlZ778sGvrbvWUFTfcZeqVc1ffMadnznrgd00tud0givFvef6dQTYCX3Ih8PwIokMW48hOCm8++3rrsL+qqerDWn+pS2/1gGFXQLFuq/kA0pamwCYSrAV98MDrtKeq4+BjmolfTlKD3i684PT2EKKJbF0OqHaXUbA8KsBaP5EojjOjhvC665C9uWCBj1dDmMAQCn6j5ue5BcDp50aK5d9juBuGK2n58sEwaGpc7TaOUrNQmXIAOsj71+QkMJtQmB68z+3NQroCSzYjkiw+8gsuuhQcOgyqNZsHaLpaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fRfd4w4rGOmjYj2uc2/V9soSG334t8HS4COicz2jvo=;
 b=OkDxiEbTbAua7tU6RDmocXecglOWR/uObGkKwytGxKcyokihQJdGxiUnPEpW4K6Ans1VgLGSQRKp7QO6TMbvSkmZzOkcm14a+7Qr16UmxBaAhCr9P+WamOFkWBYItvJDTXI76Qfm2GsBaRJKtD/Y+mpt15gyxqebgcscDuuRuwLrTR/HKyhKF/wqtPCqRzV37NlldL5YJCN58silbncO66WGrNoNv95Ln3WDogJj85p+a+AXJTPEdrwa7jh6Y7Ug39GHre4I8NzStAgTk/H7q+/1wcW1xt0n6rrg2nlbTZGvY9hPpqYGyrO8njBDY99YCBDussUyBOgUNcp0eUQWhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:24:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:24:54 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:16 +0800
Subject: [PATCH v2 5/7] remoteproc: core: Remove unused export of
 rproc_va_to_pa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-remoteproc-cleanup-v2-5-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=1115;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=KA0SkMHsTTmTkN0Yn4ItIaj3a6GcxuFTfoOJBDK4Ihc=;
 b=/mGdoDBoghz6rQc49CXuTGx9F7w389depcFD177BTVRgP45ABljlAThsELp2It32pvz/Wpg3j
 vbYaLsVkDMMBZ8RD3bswoU7WIGx7e/Tf+W4eQ9Uh9/X6hl3qyw7sPhb
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 967274f6-078d-44fb-7859-08de07f80498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlE3b0FwczY3NzhvQitpaEN0NUdraiszczkrMi81d1RRcE1VR29KMkJkYlBq?=
 =?utf-8?B?em5RSXAyN0x3WjJzTTdJU2I2MlpYOVJXcC9RVVFTY1hVYUp1NTZ2SHV2ckd0?=
 =?utf-8?B?Y2hnT3VRd1o3SWhBek8wN0FZYTFjUCtHSE9NenRyVzhqMGl3UjZmcTdOMGo3?=
 =?utf-8?B?SHlEM21MSC9YVjN5VEpSelBYaXRadXdwZ2lqeXdJRndPUDNCelEyNUVpSWxT?=
 =?utf-8?B?QTJjTk5kZjVNR09PWTdHZ291YVBtcERCQkhNMTM1QUdiZ2k2cDlWMzFuL3Rs?=
 =?utf-8?B?MDhhQjdsOWNHL1U3M2NBMzAyYTNSNkl5RXVZS0s2dWFrUTdVQk1hWHhETjVK?=
 =?utf-8?B?VDM1R1FiUC9ZeStJdTYybmdReExIbkpRRCtkRHdTL2FQRmYxV1JZVSs3WGFl?=
 =?utf-8?B?TkNJRnYrRU5tZmdJZzdUZ0wvS1ZzdzhVMUZFa1l1ajlNS2RNYTRyZVYzeG5x?=
 =?utf-8?B?WWJkeCtsYjlvTTlCdzkzb2hzdTVlSGpnWThqaFdIS0VFSDlqeFNGeDB2OVF1?=
 =?utf-8?B?SVFOQVVoOFhBV0pIb0VqVk42N3FqczRTQ3A3c1AwYkdrVE45cWlyTU5wU0tw?=
 =?utf-8?B?YUlRNjI2Tk1iRUd1d1lBNTZxMkpyRENLelNQQjQwTmpvOFFDOTMvSWx3N2U3?=
 =?utf-8?B?M2FhQ093Z3hFR3BvZldUMDB0bGd2b2NWbmEyRkI1RmY0ZW0wUW53cTYvSnBW?=
 =?utf-8?B?MXNiTU1IbUwrUnBkVUpJOEdnNXpPbU4wWlBydUZmVHcrMUZMa2Z4d0J1WWFG?=
 =?utf-8?B?VkhmbDNuVnJOMHliK3BMdDZ1cnNrcXlVdW53alpHVjQ5d2MrNFdrYk5rWG9y?=
 =?utf-8?B?ZlRVeDlRK2EvRFh6MXZ6RHZ2VnF1UGxSeTF1am1GMXZwNE8vd1VuSkVtbmxj?=
 =?utf-8?B?cTh4Q0Q1M2FjQ0g3OVliblpLT1I0MTdOUXViM3NGL1JaWldXZVhLVmk3aVUr?=
 =?utf-8?B?T0RFZEs0M3lxeGRuZndqMW0zOHFzTXdtRXlzMG53ekIrenltZGUyOGZ4V3JD?=
 =?utf-8?B?aG5qMnBXZWRFczBuKzNHY2JUcVNJYWtsU1EvMEdJMk9QUjdlOUMwNXlLdVRI?=
 =?utf-8?B?dUVZejZ5Ny9EeGEvUkR3czAvazI2TWU1QmZQSm03RmV3SmlhWE95SnZsOTZp?=
 =?utf-8?B?R1VOemZLU3VtcDl3RW05SG1vbEd5WmtUcjg0Q3VmZ3lUYXBHWFhyVWdmdUww?=
 =?utf-8?B?b0RDZlN1aDlvQXo3ZFFCUFhQTGlwTXZtN3hCSG9XY2dKeDEvbCtlaUxaRWlV?=
 =?utf-8?B?VVJZRjhUc3ByV0tISzFzRTEwS2FhWFo3dzRKbDU1eFEwVUpCOGZyczNGVGNq?=
 =?utf-8?B?NmlqYVVnQWpUVzc5QnpHdWhCWlk3NFVmTUNTcG1MQkpMVUxmRkM3THd1WVZD?=
 =?utf-8?B?TlR4ZmtpcEFHRi9IQVhuM2RpTU96Z0RNM1kzTmtoNVB4VnBqSzcwL1ROTGJO?=
 =?utf-8?B?LzNaekdPZk1CNXJ6Qm5QUkZPQXRDQXpzYlI1VEU4a3FYenYzcXVnZ2xQLytS?=
 =?utf-8?B?NHJZOFV0RTZ0QW5lU3VQVzBKSjkzNlp0WkV6ajh1aEltb1Z4bWxnaklJVUdW?=
 =?utf-8?B?RUZBbjhpNkJxWjR1TmorN2pGZVlkU2tObEJSbUFoT1YwQ2xUbnpOcU1zb1Zm?=
 =?utf-8?B?VzRWaXRuRmU3VS81S1JaTC9BT3NjK3ZMS3V2TXlHU0VqRDNoVThET3VmN1pN?=
 =?utf-8?B?NXdMYzd2OFU4RnhRL2l3dWpsOVUxeGh1Rk1kMDZGWnlKN1ltZVRQdm02Y2dI?=
 =?utf-8?B?eWxiKzByeFJlVlVQYXlqaTFMc093bndOeUFNUTNMYXlLcW1LNzJTTTZYNnRk?=
 =?utf-8?B?WkxySy9XT2lyN0JGcGJCeEhZR3lpMVpCOGdFWGxlRG9aYjB6S2FCWGhqcXZZ?=
 =?utf-8?B?a0xOZkd0dnorYk4zMWxYRGpmMi9FeGVDU2xEV0ZxOHN5U01Sa3ZzcDdmdVRr?=
 =?utf-8?B?T29rcVN4YkE0RndSN0tRd3JKYmpxMlRVa0tNR3M1amd4M3I1dlUvWDZobTVI?=
 =?utf-8?B?WXVRcVQzbU91eVVneWg1NzIvdGdlRlBabThGN3U4M2tURjR1cXVUL29zWng3?=
 =?utf-8?Q?Z8P/P8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUVJNjBVS01OYStQd0RRdGcyNEtMNzJZSmZyaC9ITWY3T0VnRHVlWHgyV1do?=
 =?utf-8?B?cG5lOEkrUW5pclpnb1QyQkR1bEFWWHJmZDJhK3hMZ2ZYMG4yVFA0ak1HQmdp?=
 =?utf-8?B?NFg2SGFVTFZLSXNTaXVGOVN1QjhKclgvWkhVYnBjdnhLWktIZitONHhMTEph?=
 =?utf-8?B?V1BlNVBRUXNJNHRiNlI4RVJLYUJOenVqYmFpRHkyZ25vWU5RRjVZNU0yN0V2?=
 =?utf-8?B?eVpDWVJRRnNMTjAxMDJ0WWZialNvSlg4dlJBdk4vNHkxM2J4NHUvRS9qVmlq?=
 =?utf-8?B?Z25kWWx2dkVQQXFDTFloTHJVL2RlWUEwQ05vKzlocDhLbnhjY1lsOHhJaXlp?=
 =?utf-8?B?NFVJc1dEb2Z0T0NPRkQ1a3lNSWR0WmU1SW9JcmlDRERCTUFIVXN6MVYxM3p1?=
 =?utf-8?B?ZFJSZWNIcXlZZ1lLWlV3VGNDN3A4TXdVUjQrSTUwYWZmWWp1czViM1ovYmR3?=
 =?utf-8?B?TUplaFE4WDhGM3pDQXdrT1RzNURQWExSazY4RkdhWmYwK0JYREI3bTd2Zmgy?=
 =?utf-8?B?aXVqbGlYS1ZJdzhoNk1LWXkwWEc5OFJQY0R2YjRPTUhFWjc1QlZhU04xVDVO?=
 =?utf-8?B?UXpNZzk0ZkhqSUZxQXdaZ2xVbkxoaGhvSDluMWV0U2tudkF6czVNeER2NlUy?=
 =?utf-8?B?NzJxWEMwZnFFbDRDQ3NaeHpaWnc5K0x6SkpaNjEvREpWcHlGTy9RZVdZQkJv?=
 =?utf-8?B?Q3Y1a2hwUTdCRG9qaFlpWVhmQzRaZjg3eDNaYjBNUHFIKzhJSU1sNzJlWVd6?=
 =?utf-8?B?SkJDbEsvNnUrSXkvQUlBNVZ6YjAzQ3E1SXJCMDdIZS9ibjUwcWk5bTJQeGdZ?=
 =?utf-8?B?cks0c1d3Mk5OektsenhnbXJROEFpOU1lWWJ1amVpMzhvVjRHTDFFN09mSjJI?=
 =?utf-8?B?aGJleFNPbWNsQ05ITXlrb0tyaEhpTkNDUUlSeVJaSUQ1STllM05yTWltMUFz?=
 =?utf-8?B?WFF2MXlidWhEN1hGNkJKTlhIdk12R0ZaS050Z011ZFhxUE9TZEFMUmtIRmt5?=
 =?utf-8?B?K3k3NGZSWUo5a1hFSng5RnVhMnhueHVPRTdzZlJ2b2d6emxkYmJvYjdIZml3?=
 =?utf-8?B?bXB1U0l3NjhnM3JwZXY4bkZTOHdVMDlIbStZaTRySE5pSm1oeHo5RC8ramF0?=
 =?utf-8?B?YTRsWkZjc1FXRGNlaGNGMFVVKy9sSGI5TnJ4b3RUOWM3R1YzNlRHNTMzL3VZ?=
 =?utf-8?B?UkRMRVRYWHo2aytGd2NwL1JmUGd2M0xTQ0dJbWxYT3BGOUdJUkQ0NXhLbnJW?=
 =?utf-8?B?dHJmY1dMcHRHQnA4TWowakM0ZjIzK0hFa0VFRTB1NUh4aTVVY0RHTXhseTlW?=
 =?utf-8?B?ZXpsTU1LaGk5bFVWTzUyQzJyUnk1b3hoblYrZm9wdmZmQWVCNzRhUUw2aGM1?=
 =?utf-8?B?aEdGK0YyMXlvRmxha1RiYzkyWWxoUDE2YUw1cnZRdjVETXhXcEpSMWZPc0pB?=
 =?utf-8?B?RCsyYkR4M2g5ZS9rQmQ1eEZwZEkvWGRsY2tPbzZmZFRoSnR0VnlWd25mYVha?=
 =?utf-8?B?MWFCcEFISTFRaXdXVk1yZEIzNlV1WWJlYXc0eW9VYWpGSkY3T0RveHRCQ2ho?=
 =?utf-8?B?bmdxN0FzamgwU2hGRjVBRVF3MXhjMndLdEpYcjZCOENYd2kvYkszM3hLUDE4?=
 =?utf-8?B?YXgxTFBxK1l1TWsyZWxVOHFZNlN4T240K2hjZXZNeUNXSlhCN3JtYXA2eHdL?=
 =?utf-8?B?Zyswdm1INzNGK21kOW9LUnFtMFFRVGg0Mk5wR0tPZzNtU0l6elRZMWR2R2xC?=
 =?utf-8?B?cGhhbkJhaUJYYlhyYTBGTzEreWRqVTZKa0NLVGZxQVpkajVIRkM1SUhmMUlC?=
 =?utf-8?B?ejBFK0RUdGsvalh3aFc2dGxGdG9UOWRXS0lWR3g5SU9GSGhUdUFnakFPbFJ4?=
 =?utf-8?B?VDRVcFNrQXo0cnBYeG1heE9XcGd4eXorYi9VZHViUWNRbWNkYUxnNFhnc1VM?=
 =?utf-8?B?R2RCT1g4bWtaRnFzT0R6QmxHdDU4UFc3bWRUdUpwRVFacXNmZWZFMzQvTmEy?=
 =?utf-8?B?VXFYaWw5MVJpNUwyMDQ2SjExSS9BemtENUVuWGt6SUg2ak05TXFqUDFsQ0h5?=
 =?utf-8?B?TVlNODYrQmFYV2FhVjU4dDhkbmVEQ1JYVk1BdGIyNnVIN1QxMGV1RnZTZGFB?=
 =?utf-8?Q?ghOSlR4f7nXjCi5U+yCnWjbUP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967274f6-078d-44fb-7859-08de07f80498
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:24:54.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ7ZMr54cs7gWGYqjCxuyjAl/e2DjpfLAN9N929u+RCTmYHZQz8/nJJClqRvEcRTFUT1suiE5/I0dzOZ6N30VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535

commit 086d08725d34 ("remoteproc: create vdev subdevice with specific dma
memory pool") added an export for rproc_va_to_pa. However, since its
introduction, this symbol has not been used by any loadable modules. It
remains only referenced within remoteproc_virtio.c, which is always built
together with remoteproc_core.c.

As such, exporting rproc_va_to_pa is unnecessary, so remove the export.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dd859378f6ff6dec2728980cc82d31687aa7a3dc..383479d624c89da1c481adc956a169c03b793bcc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -156,7 +156,6 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr)
 	WARN_ON(!virt_addr_valid(cpu_addr));
 	return virt_to_phys(cpu_addr);
 }
-EXPORT_SYMBOL(rproc_va_to_pa);
 
 /**
  * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address

-- 
2.37.1

