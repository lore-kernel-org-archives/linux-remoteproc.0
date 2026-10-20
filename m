Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515032;
	b=Hz0a6C3Zhv7WudDBccYWngqVKR+rfj4IYFcUSbeJ8ZLkirnZf7CrSoj7rZXYgvDJgb2g
	 hdai1+ZQ70CQBKn+5iCo4jbieEV+4Frj6fa3CeH6nk7tQ6v3I7W6g4fir+AwNa1ApddX4
	 NK5atln81NAw5Kn3UaosKRgpeRkzxmOMdcsJ7S86qULzIuyUeb+TLM+H9FEzhRMZJlTNZ
	 b6Cogo7jgVMff78nZiwUSGFR5dy+Tz2wAKwTKfVmF+j1xdVuuoo9esJ6fXlFarSheRdl1
	 VBMu6zO5YhAqer712qLBgr4hAkWHbbmBv+llcZfHIZNRq0zEGnjTKz0Av1yJrby6zFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515032;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=eIIQKRf/Kv/e6+Y4aOKMp+r6yCt7zlFacIRn4QyQdwk=;
	b=sHwWAth2NGDXAN5vb1d1DJ1T9+kEXSfP8B7sgNdQ1jgUGSf/mTpsh1MchMuh03KjHxZb
	 YkjnXLc4nkBkfoo+flsAYSYcg45ArMMCB19yLPDCWZBUVHSmwKRUJIj22Ip5vW+ginFfO
	 SDK7cy/dfoYiXuuICEWsiI9bNSLSE3JrKiEtRxM9FkKxKvw2PKmM6WViN2evw+I24ypdX
	 u/41lOwNb8xMfApLdPAQXT8lLj/b+mBF1E29gyeG7CJLdDc/oVFerJQGAnaM5wzma9duK
	 gvxKVAKzIhWMIcYueLYST9hRhHoZCTrlISqDy3joqNHZFq59WTxm2scAFWTOqHPlexg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=M+5QlYGk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.31
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815F4606A31F;
	Tue, 20 Oct 2026 16:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815F4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=M+5QlYGk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGLEwuk8/NlEqXI5puIUC+mdr+r5NDZ4RFFaBfRNhYxAhgOEVCw1wzX8+59oe8g3SK20BKFb6x4aJinm+oRPDVMv8X9NojzCrSpUJQJ763iNwbgNYOf0quL3jRSn2ddLarXwhpvNVQr//t9Jft61dTT3d9ZeeRGYD6cexRL5cZnKKHsPMqvKIurORS0aShPoz6xr5RSGBbs0BdeaFoSnJ+4fI10hnOhqdVRW4s4vhJG1wTbl9Mm1rzCB+nq3EOKMnsy0YHtpRhStiU+ZEzUY1sopUCPRWTK9pnW6g8xUxVMIpYtUfkY18TBsG1CHmi0uyXyD/iMQ/O0H5FoaHWCT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIIQKRf/Kv/e6+Y4aOKMp+r6yCt7zlFacIRn4QyQdwk=;
 b=p2/FrTQTlcwiVZ1mHM6fH7G3OobcTIPR92ZSb5wQQITxHuHSBsBpDMCsq0yjkR8a2o8GxnsdJpUh9/nVsrF7VkxXHZ2rbLcBirQXOy2oNv4Q4TKevSDRA1MbjFdq0j6e04hZeShv3mYLeZoftuNh27o8cGyxyLUoP9QFXw9BNl4j5ahutf4PCp0rjvglK64GrXv0KyU7VUVBPcFDeaJID+6TbWRhmXIkz6MUAPdpuM5HkdKEHq4j2E7fgQsI5BfsHNJd86A96FuXpoTOQtiH05UNBqoWLgukW/85pHhgS0dvLyts8HWCzRKb/iMpbM6jc2TneiSTTtU1nfY96MYLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIIQKRf/Kv/e6+Y4aOKMp+r6yCt7zlFacIRn4QyQdwk=;
 b=M+5QlYGk/CeC+VO8pdV5OA5Yrnx3KAXr8KpIp/v5bA3X08CtpJ4sd1CGfZ1U1YyMxzXfJBKRUUkuOiT/30koMvuKj3uA6BjvB5nIdjGtWb2x2YgbTr4VWKYfqJHAg/nlBtfqULDAnVWdCuJW7Yx+ipCX/5c8C8TgyZ85Qew5acDnH/dhHSTlQG4YVPowlNetm6FH7wD2+xVWAzovlYSspk/VPR/OaPgNsk5SiWBPQKyy/YPVepuEkAObhSgDHaBwzNsqpcczH8oEgtmPFQcMl7MGA8L/TRWZny7P3pHU2kg9lZBoa7fK0flGNoEZ8ogOmtwXqYd/MhB9NgDMFVvk5g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 16:50:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 16:50:28 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v7 0/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Date: Tue, 20 Oct 2026 12:50:20 -0400
Message-Id: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyb12oC/23OSw6DIBQF0K0YxqVBFJCOuo+mA9Cn0sRPwBIb4
 94LNv0lDm+4nPsW5MAacOiULMiCN84MfQjikKCyVX0D2FQhI0ooJzJluINusA9soQlN3KsOcC0
 ZAVBUi6JC4eNooTbzhl6ur+zu+gblFKXYaI2bgrKt+jz23gNib8DnmODwLBiTlICuz/08HsuhQ
 5H37AOkZP9CzwKgdJmxQmdSSf4P8F9A7gI8XgA51xRExbn4Auu6PgFUpMD2RgEAAA==
X-Change-ID: 20260915-memory-region-name-f950eea2b78d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792515024; l=3227;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2AJcYee94LOzB/iMPujzJuIDv/x49ynG7bMzZ2Tl7Dk=;
 b=nPtr9FSfq4hcNX/7Q1DiQLz5hK6N2cY1Grh0njG+vCMVg1sNo9YeCTLRitHR4aFLNeLfVJuQi
 itEQhEEUPAPBHRz9IG/yldnf5uYNvdcrp4sOoPg9o5L10cx6U2EBItn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:25b::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 44031c66-4a48-4393-683e-08df2eca3f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|56012099006|5023799004|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VSp9D9spJUlWhx5epeFB30IryZVskWxrd3+4iByZ8iz6vLbjAAc53cwT15BPKZSunocxLjVft3EDQMdhEVowadxfDb3PSvTZPNNxCvkaa7jBi9riBkS54ItA44RIQAoVz6hruMxEcbh6n3tpIVYGcwkDjU0pMQHR3m3kLCfqWP7vWbZFhhGhr24KwYespBM64AUgaUXYVoChTkEEwte25RnOfNKvkr0Y8qIeMi9Yqd3UIwQSh5UcVyNH6gw9b4wcDVLiUwTjR2awe2/MjT1iYIEik5sNn57X+hNI4DBFLgjTSortXxqazPpE6zugNtF4KlMce1tH52qxEJrs6uZ7+KGrBQ5VOfFEdi4o9bOe6hZf/hug7tVRgA9DZSffZvS6TDFtMnsltZYP7uj2G6T8QuHiqxuzhqmj0bmSBpCvWFYHvRipoD9y807YLg+ifal9CxwAyKg+AKDNzZSL61rTrUevaMcN8RcVXeBb3soV/bZ6oYW6Pxjm0dKNx0LlrSvKn1hDQBzszymD1NCy1Z3wbr1U770EC0EU9CLGuZxcm75u7Bnu9Pa7P9spdF/bRX+8vlDbZUzkaQUb788hJisn1XqZc4ID8mthStGVG1uI5jn8G7bOjJKWdIwUFIM67Nlj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEtySWREZDdtOXJLajZXNTRMM2c0U2R0RVZtY3JnaVZZU1FndkVwZ3JPbVJj?=
 =?utf-8?B?UGsyaDVXcllzWnBXWjJ6ZXl5UkNCNW9vaXhjUFhTUDlRMU5oZHh5OEdwYWlz?=
 =?utf-8?B?QjVnU3FBbE5Ld0dubHVRK1VTbEkvQUp6OGtGK09lbzMycXV3V3cwZmhaNFVS?=
 =?utf-8?B?TDVPNFVZS2xJUmpqMGlPVGw2QXhhYU9KZTViZTJQQ3BJZWMwRGc4Zm1aUWNu?=
 =?utf-8?B?MjY3bThLVUp0S1pEc1FxU0Y4ZzJ5MWRMTkJ4TzRhbVVnQlZKd2ZIQk1LYjkr?=
 =?utf-8?B?OGdtblM2NEVtQXAzTzFJZ085STRTalpWTk1vMk5WeFFYM25IY25ZM0M2V0F3?=
 =?utf-8?B?bWhnYmNIZnB5eGFiWFJhc2JtVnc0Y3p6aEM5Y1lpL0Zxam1TQ2JJRVVKdlhS?=
 =?utf-8?B?cDIvdnNLUitkdEwrSHhvY2tYY3htZTdSQlA1K2U3TTFQdjJWSTRSaXI5NTBC?=
 =?utf-8?B?V0twaHg0WHVrZUJJZVFtNG82SGJreHliMlAwSklQbUJYU3NJTDMzTDljdEEv?=
 =?utf-8?B?SEMvUU15cVFCa1dnSFhjVTRaRGpKSkk0bzk4N2d4VFBybEt6ZUlYQkRFTmZt?=
 =?utf-8?B?SzR4ZlpCTmNxYVVKRmdGQ3lISFVsN1BaMlJCbVZLMGZCL0RZQU9COGgxVWQ5?=
 =?utf-8?B?eENjcVZ4QWNHeENHUldPSVo5MXRiaTNlUWs5d1RRVEZqTG9yemVURStBZmV2?=
 =?utf-8?B?eEpKSnV1eDFBRFl3NjdqNHk0SzFDWkxGNnNDYzZkc2VtVE9GYlpYbFYyMXM5?=
 =?utf-8?B?eUJ6V3d1OGhaTHk3ZnpXak5uUWk0alJNc3VYRVB0VnVSWGdOVGtlbUNUT0RS?=
 =?utf-8?B?MmpnVzVSTktyOHViemR4Sk5NN1NaWUt6YVJzWENab2FQSi9ybnA5SWFBbG5V?=
 =?utf-8?B?Z0NjOXdoRG4xVnJreTUxV1lqOEdxdnBXdjkxOVZHb3BTMkdTTFNKSHlHVUlX?=
 =?utf-8?B?Y1Bra1VabWVsbXRYMDY2WGZQdnhNMVpWL1ZwTENLVm1TbTZQdlJOdmZMVFVn?=
 =?utf-8?B?Mkh4NEF5TGIrdFpEVUtqdzk4R2VFZW5CbktVa2drN2tsNHh4Y2NoQjFLWU0w?=
 =?utf-8?B?YTVickdwV3Z1c04wcy9HQ2RIWFAvVWNUTm92OFRmcVFKMFVaeWFycmFUbzZF?=
 =?utf-8?B?SUszWkZIQjZZbW41VWdvRGl6elJHQWhVOU9yRWk5UGEyTzhtTHRwUkMwQS9Z?=
 =?utf-8?B?cVh6aUtSeTRqOXo1Ny9zKytiTkNZWlp5ZkhDb2tTbXJQazkxdnVKSUJ2QjNs?=
 =?utf-8?B?TFZvbjBiTnNmeER3RGd1eGN4VCt5YW1MWkZPODNpTjM3VUNlbkdyRTlCa1pC?=
 =?utf-8?B?U3EzNGV3UmNDVDFQamJmOTh1dTJHRC9KTEppNDc1SW9YQXhFM0ZYdElmckpF?=
 =?utf-8?B?aDlJaEFTcG5kYk9GR3hDK1NDWmNCeFRrWXZlWGFXd3pZcjN4bk1NN0NqY2Zq?=
 =?utf-8?B?UE9WOG9meXFHNkdheVFiYU91Z3BlY1BDT2dzSGJwMGxGcisrdmFHTWxuNjNT?=
 =?utf-8?B?YVNEdnZHeWExdzBUNlp2ZURHSnlWak54SERSeE43d29QbWk1SC9SMVZjVUZ2?=
 =?utf-8?B?d1UzZllsWnBJYXhuczIvTmN4WXFDbFN2eWxPUVVpemJhVHhVY1lKc0hYNnpa?=
 =?utf-8?B?SE9zWlhCZVYzczhOY1o2NHU5YTF5ZFFQUk92WHlYQldRNSsvQ0VRK3cwUkRY?=
 =?utf-8?B?TE1ITDlKSERMMlFwbG5PYXJZM0pVRWZzYmgwOTd3d0JoUWtybVNZN3VOaWJ3?=
 =?utf-8?B?ZitpRmt4aG1kUkVyOGorV0lZWExHMUIyVVlFN1dlUHhUTlFpN1l5RGs4ZWlE?=
 =?utf-8?B?RmdLa3VDUkJjMDRGUWhqQkZIR0tDRVJITmpLVTZKaGYxZGExTFhZZWdkSFVF?=
 =?utf-8?B?ZWJURm50SlQ3Wkc4d3NNZEt6ZDFvOXZaSHhSN0ZtMTNIRlV1YU9zcWdub29y?=
 =?utf-8?B?UjNqdE5uYW1ycnVOall2NW16d2Q5dkx5WmxpRGJLeGNvWVFMZ1oxMnJCSS90?=
 =?utf-8?B?MDZuS1c3TnBWZ3BpSnJMb1lDZW1rNU1mTFRjYXl4aEM2UFM0TC9yOE1ZV1Mw?=
 =?utf-8?B?cThHblg3bjlXRzhTN3Z1MW1EdVNYNzFnRmRTM1psYjBlVTUvUWE1VUVZbTAw?=
 =?utf-8?B?M3hMcFRSZUlEa0pLeGpNS0JoaTRmS21HS2JXKzY3RWxXQm5UdUNhNU93RG9v?=
 =?utf-8?B?RVAxYnFUMDE3eVpUTnVCZm5NZHhDN3RDTkFsNlRYazFVbzQxVm5ORjRCRjRi?=
 =?utf-8?B?dEIvUjhSaTc1R01wVmorTEVRVG9wYTl5M3k3elBYVS9Yc0tscEpjbXYycHpo?=
 =?utf-8?B?b0h3VjBrczRRQjgzUythd1hoc1Evc3hjblRxcnZkb2hmZUxOQTlMZktsL0Zu?=
 =?utf-8?Q?4RYhHyHIC8SWdY5GkKGwvFfLXMeIog9QZjp7B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44031c66-4a48-4393-683e-08df2eca3f02
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:50:28.6034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrq/TtQJCZAthsiVkvlQ/g0+YKNgdEMvRph7ywUhcDqUYgXn+Y+AmPD4cWHu8Y9w0tA8pCE01bt/4LoOtSnqvPZuV3IhLNOLhFogAyvo0FmCvHj3KXGcj7juTnWg9E3y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI.

rsc_table: rsc-table@90000000
           ^^^^^^^^
{	ret  = <0x90000000>;
	no-map;
}

m4 {
	...
	memory-region = <&rsc_table>;
}

Current require node name have to be rsc-table, but no any binding doc
to restrict it.

Since memory node names are not constrained by the binding, incorrect names
can silently pass DT validation, as seen in examples using "vdevbuffer"
instead of "vdev0buffer" ([1] and [2]).

Add optional memory-region-names property to define such ABI. To keep
back compactiblity, use "optional".

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Prevous version
https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/

---
Changes in v7:
- move imx_rproc_rmem_to_resource() close to caller
- collect Francesco and peng fan's review tag
- Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com

Changes in v6:
- collect rob's review-by tags for binding
- move imx_rproc_rmem_to_resource to c file
- dts move related memory region node into overlay file
- Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com

Changes in v5:
- fix binding region-memory-names's pattern
- add vdev1vring0 and vdev1vring1 at dts
- collect pan peng's review by tags
- Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com

Change in v3
- rephrase commit message and cover letter to correct descritpion and
reasons.

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>

---
Laurentiu Mihalcea (3):
      dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
      remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
      arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
 drivers/remoteproc/imx_rproc.c                     | 32 ++++++++-
 5 files changed, 125 insertions(+), 33 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260915-memory-region-name-f950eea2b78d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

