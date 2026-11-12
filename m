Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794483162;
	b=LuVCKZ+2VWXRwCGIM9q7v/O6DdEuEgq7ZCBOOt4ipwu617WompRdkqsAfHclNAX7Iyb7
	 4YvqKdJexCJsToMrx83rGiocSbr8u7F9PFFGEE3ngknTmCB/FssVUOM+Dkd86/vW9Sw+H
	 W8GcG0MfUAZHRSpLZpGmSwHTO3e1s5lP5UPaEgvoKeoZgZDkRN5dv1LlwoGO6wI9MNmfM
	 pxqoMJL7Blh0KJPrcI9zCOaG8Huvsk2buvlV7tQQ9/JSYvj54APxtsN2La5WW+44nZkLF
	 gSsXsnVPxZj2FnmaDw45ZFTIHNuYLXiWk+Q4z1gTfcBiMDT2F1JSew+lQIuaCKiaO8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483162;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=mzkg7EeJ+qfkjoClyJhQCCHqbChGh+83jgUbWmIlMMY=;
	b=ZrVaLD+IEtytH9vR+z0khQM78TdM0BDFyZB4ygqdTZ424EyW5PUnUnjtjROVBcQIOygX
	 JSrS/Y9J7svx6ZUnGzeL+bX7R3nvmMyUT32x8NqKZgWiMwwV2SMfzdnkOsPTMGHvu7imq
	 /XAywwB3WOvTusB5dDJAjkv3LIHySGGvYUc1m7slS4feWWuzsXJb1/dwen9V9ffXm/xs/
	 YuuUDFaSAUuIy5aMJ0052l+W/bxkOmKIRE6PHPOVDuFAGr2CMpegVbsq/sEwphAfYEYGQ
	 jCUYZw76afly0MyRMbBaTm7uvvF4u70o6au7T1Nv30uKImPZM3jwqsGGG02RUT2260g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EGfsewcx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.5
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042B606A88B;
	Thu, 12 Nov 2026 11:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9042B606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EGfsewcx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm3tGkRkTAnnIJgU+GoafiQ2sg5ZO5Ayl1WZPvsYTgWnLSRSS/zv+in0MCaOBuugmWHzVLasQKqnSecejHR5UvHroXI/e8RI76cRy7IN/2agXKqXo3jrNCpDEKn7vAxEglETLe2lSDetjby0Cv8Wd3EvC94jp36oRTyCivJdNIMYRrVRETP6V573su1z2lnjr6s8gwfWwWHlccaUsjKt+YrUQq422AV1+xbi62cLVSROEdqAq/aFc9byJhlLF+ZHPlJM8zLKy0qpAaK18f+kd4/2GIFGyQaRUO21kEXsm9ag6dZHgZdW6hnnm4rQ+HbCPkOTiK/chc/3tI+ZPGPjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzkg7EeJ+qfkjoClyJhQCCHqbChGh+83jgUbWmIlMMY=;
 b=ZhDrkK7QMDXxvkXmpslP+2DPj6bnji35sXgDbQVWFbldqe5Z+wKnIiFoTCxEaghsXzIkX2wY82EklbXNdQmfPJHiaZt8dt4UoL/OgJxyTkWeJ9WfHW+ikL14pgLRhQuQimVKwDiNQxOo/26tuchCCOI7aIIJ3YnGU/z1xEY1AB6uVFAkpJMcT4ENe5U3nlga0KE0047+Rbc+KjE7EwXVRpnGW/9qwTbmItOVluXC2f4eC61Jm3f30GCb4a3CUW58vSNmYYpyXZW6pS5y7xwVF82FEFd5FrfYMOpNRFiJvVgGPFqJupIbXmgE0iurXBMmqDg6k6ALXO8gz0cargRsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzkg7EeJ+qfkjoClyJhQCCHqbChGh+83jgUbWmIlMMY=;
 b=EGfsewcxNpnaDqO37BzLUS6iSxBeWgcbwBSAKH9SzEon+pSqcNzHQg/WRkCtChg5V3INTFwL/8HY9PTPpzvmJViyjyHLzEO35j/bRuiu2bzkNR/NSYqop+erGApOwkMdVsd3QIcBedu3Wz9s02Zkq51zQw9Au8hQIj4W8gEJAPe2AqvDJAXXUc0GNhbVsaIz2Hdc3AkmShjSK+zy0ZXXyXR6e2DKMxJwRcnhe2+wQ48FVRtUPQZzcK54MG0EWPVumSE+p7RcijKo6VbGWkvsMvhQhTDNFSnqYv1MkJNtL/2UJEQdmZB/t2ru8qde8C0OJuCegvme1++G1tmiK6MNVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAXPR04MB8125.eurprd04.prod.outlook.com (2603:10a6:102:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 11:32:37 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 11:32:37 +0000
Message-ID: <0624c22c-4cae-4698-8c00-346558935d10@oss.nxp.com>
Date: Thu, 12 Nov 2026 13:36:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] remoteproc: imx_dsp_rproc: use reset controller
 for i.MX8ULP
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
 <20261111031808.570680-4-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261111031808.570680-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAXPR04MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c3f675-84c6-4b3d-477f-08df40b0a763
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|921020|10067099003|4143699003|11063799006|56012099006|261022105027099003|261028144727099003|261026140227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p2t0wo3NXtwWGd6/hH9pzIUxUk5icS4HvlZENr8UJToJftGjYYthza7En1EIHyaezwycLhNVxm4rxSunxE3hCzPBMY6gyFZNzHkYbcjuLiqjMjAH4MY7zTQ8nU0CA1yZ4O9xMejU5fg93gAsGgH42pg7tvzNylk2G3YdPKqdVoL1bqp0uYVIxBdc0W2kMQHaLd1cUMG1+tzIIXO9KqP/p0OkKiFQFVUM2RByJvIBkPK7+RrixBoAqvvuROwE3OM/hNIeV1rVj1Cbt0XzmKrlR5SupTitm23gB/ERk+tCWgQuieA8/rD3XKeKHNmUPX0UZ09ynp9k/MiYi5Kdicf46fbCSr8qdbkk1IPQJxVLHB/VLY/aSXjcicKGlHt9GdnF9APaPzgvHQ9nIPXS8heiBcV6vWVw/uXEtLRBaNwe54DMZPR33IJH+ZVYoPMXBWpz3nb/2HEZhvjfDYVnWFaPI+2C4yMy8bsZqBFHyJBpqMJz1sqSdLceLKOn3wsRD5Igq+AQh2RsWFCn2E5f0I8LT+Gs6pz0YodNqNDEISrGOI8/cmHQNHvMxAtLpVWDtpw7aMj8VspTNLLWmmCOb8Lz3CWnROSte6qUCWUyKUoOQmns5+GNWGcJeFeqoR4pnkTqfb1mrhgJq6I2pkbqTDzqCNAWQM1DicuK5lCvWGYDQWzeAxH9fnqfkA71rmzbfhz6UvEij9LHbZzXJhzWv/zLqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(921020)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2pZU2JzeCtXTEgwdXg0NzF3S08vbzByMUFvVGdOYmdjcXBRQXFESzdXTGJ2?=
 =?utf-8?B?bzVhcjFmRnhIdU92cHRycXFjc3p5bEJHdXhaVXFlNnRwZUZFMTZEbHFHTXJW?=
 =?utf-8?B?c0pFQzVURmNlcG1PUkJNMnhzeVlaVFV5K2w4VjhGMWM0Y2l3TlhQQU01NnhV?=
 =?utf-8?B?ODdkOGI0NVREMEh4M2lxNlBsTVFkSEFReEt4bzMwaU5QZCtmczRCelVnMURM?=
 =?utf-8?B?bkNPZ2VOUDBNZEVDcDBoZHRLbktGMHZqYkZCU3dvVldhSmc1QVZEdWNsYXN2?=
 =?utf-8?B?Q0lIUFBmSDhkRWs4cjFseVZBaW1jeUZjM2tCTWhmeDdQSURFYy9RUFhidWw1?=
 =?utf-8?B?UVZTdE9vWTk4M2NNUlhqcGZXaWRLMEp3Ym5TNkRrZUJUaXV5VzVUNFhRUFdI?=
 =?utf-8?B?SW41cW1US2NseER1K2l3RDF3ei9veWlnU2dhQ1ZDRHczMXV5WEEwSFV2dGpV?=
 =?utf-8?B?VEF3c3kxUitZZkJtTkEycUl3VjJNamlvY3FObmdBWm5wcWQ4b1luTEIyeVNE?=
 =?utf-8?B?L1VEVVI1enNVUXo3TW1IdVhFZm9tZ3RJdGlaNFI0QkM0VGNGTEhucmdlVTdI?=
 =?utf-8?B?QlVrSEU4K3gxS2RFVGlSc3d0RDBoVyt5T1YwaWFWUUV6cTdvRmhvWjd3MnBm?=
 =?utf-8?B?dkEvNUZ2SGZEZ0JCdVkxa0FTNEduQXljYXJXUUwzOC8wVWhhOGd1Vnc5TDNa?=
 =?utf-8?B?RHUxZWtFWWZuNUJLQzhBcUFPNTgzVmVQYWowVWhyUHFVYnRHeG02Zy9abXJ2?=
 =?utf-8?B?NTFLS3ltcEZVbVBpZ1piU1BKNHhxU0hUU09kWFlXSXZVTHJtTUdXaGZEUTN4?=
 =?utf-8?B?S2VJRFpKcHdKS2srT1Z4NHlkVnBoVDA2bTVna2VWczZoZ3pPaEFpSGY2dDZS?=
 =?utf-8?B?N00vQytWYVZWSjFoRjZLQ2dtaUQwY3dzak85K0E0N2Roei9FZThoRWVtNFMw?=
 =?utf-8?B?dkgzV0xodmlBQTNXNmEvdGdsZFZHTUZGcnBIdUR4QTczbFV5L2l0TmxKNHRW?=
 =?utf-8?B?RDhNU0pneStJbjd1TkJoc1A1WUF0TnllNmJKZHh3bVVPLy9yZmNyY0swU2ox?=
 =?utf-8?B?M0l4d25UalpvYlZrRXVmZ29zVG5CMXBsN0t3M0wxRXlEcmoyaGRRelRpZ1Ex?=
 =?utf-8?B?NkVta3NtWis1UmN0WUt0bkZ2OFhUNWhFQTNCaGVkM3FlYkFXbFJWQkNGZjFQ?=
 =?utf-8?B?d0VzL3pWMGtScGlObW1BeklUV3E2UFIyc2Z6UDlNcUgvaWxWYTVCK3RFcFhG?=
 =?utf-8?B?ekcwaGpEbDJMNnB6SndBeE0wNWRmUmNKSnNnWTU0Sjc3UWZnY0JZaGUwNGwx?=
 =?utf-8?B?ZDdXbWgwTVRSb3E3R2paU3JQNEZsNnhicUlXbWQyN1VRcDVaK0RBVmZaNnNH?=
 =?utf-8?B?empLLzZWMG5VYUZ6UEZVdTY4Wmg2K05FY3dER1ZndTcwYi9sWE1IR1duOURP?=
 =?utf-8?B?ZmZyNFU4NjVxcEdveDNsVDJyK3JSR3V6UUZmODF5K2JqdDcrZS8xM2VYZGR6?=
 =?utf-8?B?K1FxZ3ljWG93OXQ0OGluSVJxQnpLajdXaG9XNEc4Vk9GSkx2WW43SkFPZHYx?=
 =?utf-8?B?b1NzZWQ2VGtVYzdwQWRYdGFTZUNhM2Z1RWVHOVBWbUZOMFBwZFJPek5YTWhK?=
 =?utf-8?B?alhCMTZnbFdDK0ZiMmUzam5hV2VKS05zYVFtOHp1dkhlM0FsU21yMjUzOE1q?=
 =?utf-8?B?V0hiazJSbk1yNGhzM0FsRFJROVdoV3VQZ0I2VTdZUnM0UDhPUk9rdjgzb1M5?=
 =?utf-8?B?UVRJakQvTW5vcjYvK08rVEFvbjlMbWpNdmRJdmh4Kzh4MEdCWTh2SmZhbEN3?=
 =?utf-8?B?eEF3T0tBN0NhZndIenZsZE1TOGY3ZUt3MTlvQ2k2a29FRE10UTQyeUk2NkxZ?=
 =?utf-8?B?aXhKaXQ4MW5KWGNwK1ZSUzdBcWJhREcxa3NZUEppam8wU3RDUEFkRXk3Mmkz?=
 =?utf-8?B?RmFxZjlRWW5VTy9QeEp3cncvaTNiWHg2Z0V5c1BYbGdUMWRPRnErMDJZNk5j?=
 =?utf-8?B?cU40WmtPZDR4c0NweXNTYkpKVFlPOGN4VWp4NVQzRE5IaXdCTXJDWHM4R0l5?=
 =?utf-8?B?WVhxRXRXbFVieEtKZHpwMjRaMzNNYWVNYkJsUnhFd25HbHEyQ2pLQ2NkZWYz?=
 =?utf-8?B?ODJxQUVBZFg2bStMajRjTEtsODR2K25IM2FsNXMrNVR0MHQ3anQ3TUlGRnBv?=
 =?utf-8?B?K3U4NTJwanFYWG5pNHc5SWNrM1JSMysvSWNwbWlNR01seUlxVFVnWVNCbTNY?=
 =?utf-8?B?eHQxQnRpZUdPOENvdWwvbVRudkRHU0ZtMDZTOWxBQTNSZlNGeWhtYTRvNjRv?=
 =?utf-8?B?ZFR2czVsK0JmU0FSeVZpOHY0ZVpOc3haWVY4RE5xbG96d2tXamdxUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c3f675-84c6-4b3d-477f-08df40b0a763
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:32:37.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzAnmpZ3danVs84qzZoIwDvBPxT/J6cj7iRG687mZAewnN9QTT7Y+L2admAGKGQHfOdfEqqh6IwIhMMaaMJL0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8125

On 11/11/26 05:18, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add soft_rst and dbg_rst to struct imx_dsp_rproc for the softreset and
> dbgreset controls defined in the DSP binding.
> 
> Update imx_dsp_rproc_reset_ctrl_detect_mode() to acquire the runstall,
> softreset, and dbgreset controls. Acquire softreset and dbgreset as
> optional since they are not provided by all supported DSP variants.
> 
> Update imx8ulp_dsp_reset() to use the reset controller API instead of
> accessing the reset registers directly. This relies on the i.MX8ULP
> SIM LPAV reset controller support added by commit 5aac7afc752b
> ("reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV").
> 
> Remove the MMIO reset handling, which is no longer used after switching
> i.MX8ULP to the reset controller API.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


