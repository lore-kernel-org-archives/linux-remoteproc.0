Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519A1C01;
	Sun,  5 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673700; cv=fail; b=bndv8qearyzZtdRQxGRNLv059Qe4XSNwBp36Vq478T5XgQX4uewKRCYa/0Fa48axxfUJhW+gv1m3b1+YdoP3UzhKgMT9DYn79DfbiQKVV4NqaN222PVTq8l5HlSqCCYjLaLdj897hF04uPSn8HWnrfbkr3Ej7aUb4MGHm3vJO0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673700; c=relaxed/simple;
	bh=GLHGZcwVYwg3jTQiRIsDZaI8j36uD8lf1l0xoejGbac=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=VjoyEtQkUswU61OvhMcrivBu/ccMxwTCgU1x3bjc+Fy0l7W5cMn/LBibEFjXXWCb/ngEqiRoYeSLGXbA2vIeu25ySrziiWaBBgE0+LonzaDMz2Vv02V9eXR46znoOPfPVM625F2kAMyhrAO89fiwptJ6qb9D3/d/FrL53CXb2dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BZx199Rj; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BZx199Rj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cx5DyULqoiGo2LoEvPe4bXivZLoAGCe901p//pf7rBm0GQc+6kAj8CdYE1Uf7CryaUnKqAeBf+phnlDDccyAWAI0YE3xuvguu4a3kDAKcKTbA76oddnIzEhXaKYJ6YtIl8he4xVmdm6rvS+lcwmCjjYTfrWykvHv5M/poJ50DY2JsZqLpColQ1DRmJG9LhZ8GXhoWKRo8cVZKuLawtvnFciVxnmeGz/nQKRMI1ZprU9wXu/oEBwVER2Bc7hOAifO+imJ9BlAZsYCTap4Z44j7Wlw47D2T2++vjI9K5Ye2frhyxoX7yj/dyw8Y1Bnzq9URAN4NRtC4uKNaQbqAKke/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xik/11h+oeUHHXD4b2j+q8ei7WZmH2moM6AO1w6n2F4=;
 b=QVAElBvO9luPJOef935+T/yfSvtzS8eoo78Ne2ERrDEPyAqEj6BQgp3Jea0mYw9NymCq4AbSJQVClGu51DuLAJF7NPjxOxLTWSyUslGl4k160SNNK7P+tPShoQvP3ynmQZqeTrz9yW52Fkt1tTRA1wB4TxVsJJWxOERc0odo6aN9qWvCoriBkA+T/OlFA1YMQ8/APyPGXGvojehbmiYXUfE+3ULSj7QwjdlT6B8ZM+wDU7pUt/gNe5TQpmoPk++F0Au09u+D93twCediqy5tYGdtqXz7rJVYCDMQZ3hLLToBsP2ppYFnUNecRmWQN9MFIIqumGa9D5IqUdU/2PqpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xik/11h+oeUHHXD4b2j+q8ei7WZmH2moM6AO1w6n2F4=;
 b=BZx199Rjnd+8zbps3jC/LfHSGxZMw/78uSbrD/Lf/d7T8liERSZTi/sCGUIfs8Dk6lXdGv2CHJ3fvDIAqtNEQnfmUV9ICEF99AvQT8wW29KXpKyjcmdac0zgF8FPm9rJe5vwBdcRB2PhW3ggOks4F9zQOCuf8u9U9KNSYE/BoC/0wgEMzetoyGz+xe6JbMN2D7EfKyEE08gVu9EFJT/d0MapaKzHXAlB+sHne9xlvjA5u4YEmwO26autzaAjs5DlZTb+QuksIwlEqzrJ6Rv8t26MqfxUkcMZDBCsKcjH4HfhCSgI1fsS9jvMbBBz6bgYJP+8ConrSk36/ZsDseOKzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 14:14:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 14:14:48 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/6] remoteproc: core: misc update
Date: Sun, 05 Oct 2025 22:14:25 +0800
Message-Id: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEF94mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNj3aLU3PyS1IKi/GTd5JzUxLzSAl1jE9PkFFODtFRDYwsloMaCotS
 0zAqwodGxtbUAv6HL5mQAAAA=
X-Change-ID: 20251003-remoteproc-cleanup-345cd50fe138
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759673682; l=1241;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=GLHGZcwVYwg3jTQiRIsDZaI8j36uD8lf1l0xoejGbac=;
 b=UUmyRd/78OCcyn75DY9sFjGf+FbvQKGp0bZ7bM6NYZdi+ypH8efTrJBKxTeudZYKcPhMhmsNz
 NwpuGT8vaaHDQGJ7Z8/749FpSz2u+hUr866oV9n2chXE23PvnLf12rO
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: fb963fc7-02fb-4a1f-c079-08de04198ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1ZNRnhIVi9LWVF1NUt4bnV5Vm0xZXU5MVp3VWc3bk9LRDBnWGcwUmQrUlNV?=
 =?utf-8?B?dDdGM1NIMmdncVFMd2VkL25QUTN4RGxKRFNVVlRvOXpYdU5DRDBobUwveXBS?=
 =?utf-8?B?TS9VakFPb2lQZ0FWaE5zZGJwaVRuVmJoa05NMXNPVmxmdG1la0hwbmg0Z2x2?=
 =?utf-8?B?bGRlMW5teWMyTjUwa0llckVHVnpkdGhBSjBEeTFQUVBETGVVSFppMFNMS21u?=
 =?utf-8?B?b3QvejE2ZnVlQXF0MVl2R28zR3FWSDZzQ1J5dEN4KzlFUUkvUTV6aFV0S3Ro?=
 =?utf-8?B?NnRwS1dycm1ySFlZeVhSaGRzbnN0V2tKcXZ3MHQ3clRWSVUvYUtxamIrcnFD?=
 =?utf-8?B?RC9yZldpQjY3VTNmZXRJQlh6cjI0aE1uUm5oVGp1Uk9DdFV6dlB4NjhHVEhw?=
 =?utf-8?B?YlV5NTFWWkJsM0ZMU3lVeHVMOExMRzQ1SkM2WStCMUUrdEhoR25paXJsd094?=
 =?utf-8?B?RzBmdThiNEJ3RnRKZVNUcWRraGcxVWRJb3UxcVFCeURLZ3BRSGhiaFpjaVlC?=
 =?utf-8?B?UUlRN08yTVNRNFUyVHE3UVJnZ1I0MUNPaUowcjdaVS9FeXQ0Vm5mU1dyUkNN?=
 =?utf-8?B?QVFLN01XMnR2Ym9SZ1Y0OWVtWXlwZkpjTkFwVkN3UElhUzJJUWpXalU3MkJW?=
 =?utf-8?B?OEFQUUpMNkVUc051NVBjRnI4WkNCazI0Z2ZFRGVDSzI4TWlyNmNmamtyTDhS?=
 =?utf-8?B?WEtCeEZIUTNmcGorM2VGTSt6MWc1WC95cFhJRlBxdHg2UVBnZ0djZVpPZTE0?=
 =?utf-8?B?SkFLZEhBMUlhYlNNL2NNejMwQTVTbDRWZ1JXSXlSMHNzUlJwTXlBc2FWWFFs?=
 =?utf-8?B?U21TL2tGZHdKRUtmaHpMUm9sc3M4bmpBRFZWaCtsMXVSN3RMNnB3WEhaKzRw?=
 =?utf-8?B?aTdqTzRnUGFGNUVQM1Y1aEp0MllKRW5KbjM1WFRtYmZQZ1crZllzcmNoNTRo?=
 =?utf-8?B?MkZBNkoyelVwQnlpNERVNnFWWlpscFd5UEt4UVUvTmVUT3VQazJid0V0MFlV?=
 =?utf-8?B?bVovMlBGMW56cUJrR1BjN2dnYUhUcWJmWklwanpGODNyaExPK3VvTTIwZFVH?=
 =?utf-8?B?ZnlVeGdCRmlqdDg1NklaMEZvS2owUUlSZmVmem5ub0lUZ2hsZnRsMjJTRWFP?=
 =?utf-8?B?K1hhYlNBSmd6eEUzVGdpTmJoSEIzK1VwbTMwS3hyYlRCeWE4a0dzdHFuS29h?=
 =?utf-8?B?dEx3QkJ4SXV2cjlmSmtSNHo4TndmTkJMdThKOG9rTkh4K0IvdlJGMkpkZFNR?=
 =?utf-8?B?SVZSTUJPNTdCOEh0NGhFTFhzK0VNUm9wWVBEb0NEZ2tXUTZ3Qk1PVW52Tjd1?=
 =?utf-8?B?dHVvZDNlTmlTcnhXaG5iL3djMUNXWWZXdUZrQTRFZURnUnI1WXQycEFvekF1?=
 =?utf-8?B?Vks2VTdQVEtjV1gxbWRlRFZwQ1dGUncrdTdvMnBHTFo5VVdRNm9HdzJsbmhi?=
 =?utf-8?B?KzlJcVl5MnBQRlRWQ3kzQnBtVHUzYndZdkI0NEl4VzlvbTcwSExDSFY3Z0p3?=
 =?utf-8?B?bkpKZGlCVmljbW00OVdDdzlhckozcnNTS1hnUk45eENWWkRsZVhpeVZTUk5I?=
 =?utf-8?B?T2tMdFQ1MmdZaVk0UVVoeUdLSnFSaXVtNVYzeE9EUm9FVlZpM1dhbDNvTkJi?=
 =?utf-8?B?Zkt3aHNPMVF4cU9XY0hldndDaWtoZ0Jaem0zdTdFZlZjNnd1NGI3NWs2R291?=
 =?utf-8?B?Q3p3dlgyamJ2VWYwcEFmVGdsSUNQZzRCWkwyY2syRDZBbEZIeW0vcTA0ZHlU?=
 =?utf-8?B?blVuZEJuRERwY0s5SEdrM01LYVdiU2M3VGNNYXY1OE5XZVdFd2RSQS8xdkpn?=
 =?utf-8?B?WFVqQzFaM3g5dVlsZkJCWVlaaTlocGVHRjlTZCtULy9XYXhyeXV6ZkRUc2s2?=
 =?utf-8?B?Y1djNnhvUlA0cFQzM0JOUFRoOEgwNVJQTCtEeWVleWJNbThZODFrTWtoc2k1?=
 =?utf-8?B?OVpsUjVJdWVITzBQYkR0MnBKdDVzUTZWbmtYNTlBZndueWxGSE5adUgyQmZP?=
 =?utf-8?B?YnBFTGVQQVlFYS94Zm5MSEFvMVRVZk1uNVZ3cFBiZndDT2ZPQ1FRaTBMV2Rx?=
 =?utf-8?Q?FIbhFs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QStuWWRqYlhNWXdWc280aXl6QnFOWm5hd2I2MHk0SHZFU29ITjZkTzdoYnlj?=
 =?utf-8?B?RXhNRHIyTHJ4S2d5QXREUHAwaFZGZ1N5YTFwVFVGQ2V3TEtHZ3hseC9hY2NQ?=
 =?utf-8?B?MEhBVndLN2hzRWRlbUl2aERKbEt3UWxwYll2bTlId0c1Y1NJdkxLMCtQMmxT?=
 =?utf-8?B?cmZmYVBvTHVhK2JOendGaHFSYzRHcFlrNXViRDl3TzRnN094TGpTZzR0bnFF?=
 =?utf-8?B?OWkydE9kVGt6aksxakRxN3lPTnpXYnZXYXFIcGlsMUdJYlZqZVJRNkVjZm9s?=
 =?utf-8?B?dy9TbEc2NmRFZjNCdmhLK1B6TisxeTZBM3Bnc01mL2NHaGI0Z1J3Yys2bHY0?=
 =?utf-8?B?cVdhSTBnVzRCT1FvSklRY1ZsYzIvNk9pbEs5NFp4QldIbUx4K0VUc1RmMDU3?=
 =?utf-8?B?Z216dFpUWkV1TEt6cURFNjVKNHo3N2xSQURGQkp4ZEpCT0RlelN2QThKUXN6?=
 =?utf-8?B?bjErRktUTnBDMkNKaWl0S3R6NzJIUWNSNFZBcW9zRDZxdkcyc0xyRVBKNVp6?=
 =?utf-8?B?bWNxWDAvUGRnTG91ZG9uMEtuM2tZcFVzZlVBamN4aHVJNEJibzI2MCswSFRB?=
 =?utf-8?B?eE5ycTFFOUwyUEVQRUUyZS9GUGJLMHRTeVd5ZStEMUdXc2srWW50MTlMcDhM?=
 =?utf-8?B?MTdxdkg4L3Z1N2laZmtnVi8wcHlqaU02Y1VDNFdLQ1BBM0g4WjdGQUtxekZT?=
 =?utf-8?B?TktyY3MvU1Vac0RQYXRvSWNOaG9pUFJDVWFKVEF0MVBIQ0E3YmhFSlBoT2FH?=
 =?utf-8?B?d3Q4ak1pV2wyZS9McXNGclNnZVNNUzY0ckRKWGpsNyszclgvR1ZtWjhsOUE0?=
 =?utf-8?B?SlFaRUcyL2pEaEYzUjZHWGwzdE01ZjRXemplOVBPeWQvRTlOeiszN3NZbk1X?=
 =?utf-8?B?bUdkVUp3V2xSQ0hYbC9UajJVS1hpM0FWajBVS3RXeUJ3amFndmJ4V1hPS2Uy?=
 =?utf-8?B?VUJDOFI4SHFDWWw5VEx0SmtpQUdRVDlXK0tCZmk1Y1dwekhNaWxyWmY5RjhO?=
 =?utf-8?B?SXpJdStRSXhMMWNuL3dzeFlpYlVWMURqd1pBSm1XV0EyZW1rT3F6Q01JMjRo?=
 =?utf-8?B?YUVmU01oOURXbkNCRGprL29xbE1xb3gwRGdjQ0dkUE1PcllQcjh0VzdMM0x1?=
 =?utf-8?B?R2JVTTR4Z3VaM252TkpTQ0U4Z0ZxNTNjak9yRTk4cjhQNndxN2JOdUtmWlYw?=
 =?utf-8?B?OFFRR2w2K05KUk13WmZnMGtibWVqR2VqYzJ6TDQ0ZVRTL01seEVjc1lZd3dQ?=
 =?utf-8?B?N0c1Y25XQ2IvTkVCWUJKa0NIRDZiSjYrL0UxaGdpeTh6OUtDRngvNGljdGND?=
 =?utf-8?B?YkdiQ3BCZlNrVDRRZkZ5OExJeTdocGVCVVBUS1hwL08vV0JzS1VpRk5xcHFk?=
 =?utf-8?B?ak45bVRqWTg2eFo1aHNnWnZnM2E5T1V6N0hPTGNFdEJRa1A0UGJiNkttSUJ2?=
 =?utf-8?B?Rm4rQ3ZFZVJldnNZaEtDR2lhQjZSZzZuWjNvOVVKaEdsMnA2eWE2UkpWNFlP?=
 =?utf-8?B?RUdXRnBkc0Nzd0lHd093RDBTZlNKUHZqaTlKblVRdVpaT1dkVmdISzBjYWk2?=
 =?utf-8?B?dkJBeHQyVWVmNlYyamkvaUd4VDNUcCt6TXNYTmhvNHo3dGJ3V0pESEZURnYv?=
 =?utf-8?B?bkM2R1k4MFR6V1B0aDBhaGc4UVQ2ZzdSWlNLWTBtL1JMUlZCcjRNeU5rblBF?=
 =?utf-8?B?bVFQNGdnRVRHMENiNTFjYnJDNThTbkZHWlJsbFlsZ1VGM2xUK3QyZndiMDJ1?=
 =?utf-8?B?SVk4Zk8rbjBUZHRFaWRWTzJqZTl4bEMxUWNldlErNStwRE9YNGtzVnV3alpQ?=
 =?utf-8?B?bGd6MkZ3aUp6WEFsK2k5dlFiR2JBOHpsMGI4aDEyM1lSU09ycWFoMWVWaDV5?=
 =?utf-8?B?RkJ6VFJNTlhxMTR1NzFuR2lIZlVybHZBK0VDNG0rdVlZWG5LZElEWDJ6RGox?=
 =?utf-8?B?VlM4S3c5eTF1bVU3cVlaemU5RExNRXRsVEpPM1dXcUpBV3ZtQTg0ZzJVdW9B?=
 =?utf-8?B?bDFjbHJ4My80YUhIQlVTOXdSWnVlSFVnSzN0YVZHWjZ6NWJRbmx6WWdvZG56?=
 =?utf-8?B?NnorTHVrQmU5VXZQcHVUMW5nSXd2M1c4WjU3aWdoZmFiWVhhbG5JbHNhL3p4?=
 =?utf-8?Q?SJBebI+O5A97sxME1bGdQwFxX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb963fc7-02fb-4a1f-c079-08de04198ac5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 14:14:48.3730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kK20bKnB2e8Yj1lfbjMAwqrJ9AC1Z1SkP5IOmMcKmd7AsF/jASbAP9P1xz3chQsX4bCoKhrwizshJU8Og++IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

This patchset is a misc update of remoteproc_core.c.
Patch 1: Drop a pointless initialization to variable ret
Patch 2-3: Cleanup the included headers
Patch 4: Use cleanup.h to simplify code
Patch 5: Remove export of rproc_va_to_pa
Patch 6: Use 1-bit bitfields for bool

I am also reviewing the rproc->lock usage and thinking whether we
need to add a lockdep_assert_held for some functions that should have
lock held. But not sure.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (6):
      remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
      remoteproc: core: Sort header includes
      remoteproc: core: Removed unused headers
      remoteproc: core: Use cleanup.h macros to simplify lock handling
      remoteproc: core: Remove unused export of rproc_va_to_pa
      remoteproc: core: Consolidate bool flags into 1-bit bitfields

 drivers/remoteproc/remoteproc_core.c | 144 ++++++++++++++---------------------
 include/linux/remoteproc.h           |  18 ++---
 2 files changed, 67 insertions(+), 95 deletions(-)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251003-remoteproc-cleanup-345cd50fe138

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

