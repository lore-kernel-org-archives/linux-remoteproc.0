Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366922;
	b=IDeU9vn3kiS7ktzTqiyUJWmRx5Zy/C9redoN4hRFBVE07nd6LqPVqxBuNnrqprKG1qQS
	 zIpmlIiGxpI1oO2RR/w0+JybaAkI3/5oHo8I506A+67ky+4F2I3ZBC+Hjq5X7xusjUcbp
	 rL60w5DQKXpSlohikatDWJy7d3j91Kk2/kExpVew/Zre/75YOTv79w61/siazi8xacomA
	 x2cdRAfD6ZBYqfAPXoNNbKZrkONtszv0HkIBPHRELZiS+8t6q+CF4un0/2idvQ3pEE904
	 su2tG4vJj9NZUCX8MvbvKl2Boi60xCA6SVK+Iu9b9Jd8Ef/yV3JESaZnASsMfP5jwaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366922;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
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
	bh=fcllL3SwdtxcppRBHbAJWpX7iiGrZzxMFfvEKgWuM10=;
	b=AT1mcnjiScuHxgSk9lI71wChovWb5UB4z1w0SKYZsT1qeQxdN8cSVy5CxUxQ5vZejfMZ
	 e3qyBKtT1VJwDNdmd7167H9HCUneXQPpIl8qwM1iEcMEkG6LOFaSBKelUs8ycSXII8S77
	 lBegB10mHI9Ok18SrwKyoDv4EI3wDKk5KR2bn/UiYeSQNvjjUJPfPF9QqsJ1Jq2PCpj0c
	 9Iq+WdJceiAGbTQto+FVxkecolxYjqlB2Dq2n4sNOOFQwts2Al8IUc1Fz/XJkW4A61Ddo
	 ji/V3ApMuqrK7Dyf2EFjvPOaKxEsIKQskESPpHmoV9d1pHNOVDdZo3YOzozzhq+F+3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A2X0Du3F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.1
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAC60A2601;
	Wed, 11 Nov 2026 03:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDAC60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A2X0Du3F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+jzLRR+7uF15tozETzgRzFRsemql6q9vHdpX3XhmqZhrQ0N2KHvOmX6LBCihNEgJgiH8tSF5tiK2X5AqCo9rdRgGbdy1gQgXpzjpMI4tFcTFxLYTj5W9MKFpFozMfYUSLFkKCboJM+U52NmKxwNGVh20M0p/+bCE4TZ0Fm/5a+hfeba+ZVonswHPxkLP28B+XX+HScmnUBAZAKwoENns/Z1tkbzMZtdCnX4M3X4Ly8IxLUvNK61h5XrwLucX/mpALnUIYLP2RpsX+GuunJHDjYqBUwXWK1ySfDeiokei3Rco2bAbA0uhsz1GUpm5UDt6RA5uPHCWcAQLO0KkU413g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcllL3SwdtxcppRBHbAJWpX7iiGrZzxMFfvEKgWuM10=;
 b=tmlSy1TUixFmMocowDSjjLPeMAdlzLoi/tRW5zK9fmvvgzRzrGEPzw0/1yyLcsRKkEqtLhUKWCHik40x5Q4dpfw433DxlNZpJMfb2Kb59Y5lxldd1we1AXZAzleDj6rtLsBFH1eS9wERgnpa96BsoOLRtflUMSwuxW5Dr5JfVoYOLrjHDkWill40VE3SZXSrdrtgBny80SdtJJXNRck49pe4jknDK3IUKyZGdOQL9S45kdanAGgyxUmm2KHuTB2ImXFwwUyNJcE9TaaVazgfc/pOxdZ4H+Hih3j2RefZKAhEoiIv3/iOjUb5Qyo2z42sqRF0MMTAoAdIZKxm4LuYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcllL3SwdtxcppRBHbAJWpX7iiGrZzxMFfvEKgWuM10=;
 b=A2X0Du3F3kFldgeaRb2Xq9434zqL1hlE/0Ayj/7ZYiipzq98EA7DnSjIn8NGawgsnyGGqOEcqSg+wKSY5SY9lDu9cxPfbUFOqnyKJb8r7hz0loOFYMDWWJbMuUFgp7gQpD+XD+qGW6ShTLQi4AaqgREgGhWBgRKiHaOk9cTazhuUPc/85PK4lmO3BMKDQbi4FsfWB4lVeo6x8cA0v/6ENPAU6/7JHy/anRHkfAr7k+cMuwoNlgrpOQYvEdO7KRVBOWkLbkh48YjHXPTKIxKqNlXb+WuFl03Nc+NV+tbSmnYqwmq0GiZcjPZWV8yUNv7IYneOArKgQY0izfhEzeW2TQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 03:15:15 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 03:15:15 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/5] Enable DSP device for i.MX8ULP
Date: Wed, 11 Nov 2026 11:18:03 +0800
Message-Id: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::10) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 88380f54-ad0e-4a78-0515-08df3fa201a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|261028144727099003|261021135927099003|11063799006|261026121527099003|261102123227099003|261022075727099003|261022115727099003|261021130227099003|261021123027099003|261021121427099003|261022113327099003|56012099006|261009223027099003|261022105027099003|261026130827099003|261026140227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	c+rMX0nE2IY2CwqMyqq1PM3BrNVxBtPQVuBEqZ71XkpDxiDeh5GizeWEiyQyhOKvhfryPPqETGByc9DlRogXsdbzwhiu3gyPzBSNiVdQ6fgwU33FR3Pg99oKU9lN+j5TuCLS6ZDPhyRo3x5YDLtcTlCF9gLH/eP8XvAkCw8s7SX8HC4rKp2d13OV7qroT7t6t6/noVAFOjXTMzcH2x7y2s1llBVPFr0UDOguXf+dL659wVOaBCsG0scEjWjU+rpS8fOir2IKdgcyAntXcTKipF2loV7WSI+4qmn0EWgoBQmLQFu/M/vqN+k4U25EUjlHHbgtptnlFQEr1dugxq40JYwyarANqFSFNBG3eni6Lqjz1oLDLPvUmwqEBX+Kdjspg2R3rtW3r+qX2P2IIZCtu9WUwKxuT7f2i8JY83F5GlYZ6dqqtYMaNPS2qCYHZAC0TVGRPjsqOXG4QLH75tm093OqJgomeVCRQyzCnC9BUwf4Rv7Rtu7VsAlz/o3T2N/3LyziCl6g4gXpTGbLk6+GkE4eRuoCQi3MOrr4EanneWjhb99c85P2ANWAPMF64nPLPglvgTur5jmUB3v4GeoFfqEP/emO11f6BG4b0Rxex62g3itIBuprHA4vKuLvb2LqczTwwTd7zRxWcz8PwK/TatLPuND3+X4do/ylV+ViuWDQZr6Ylpw8U8L6So2AYc+SeL8P0fMYmVm6QQDn2J0huw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(261021135927099003)(11063799006)(261026121527099003)(261102123227099003)(261022075727099003)(261022115727099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022113327099003)(56012099006)(261009223027099003)(261022105027099003)(261026130827099003)(261026140227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qjd3YTFlRnhzdmI2cFRCUG1iM2VrYXNhbEZneUQ0WHZBZll1NjZnWC9sRlNw?=
 =?utf-8?B?K3FSUmdya24zUCtEeHdRcVZKSExEdm5TTkxCTVJDQytBelo5REhFNUhyeElr?=
 =?utf-8?B?OEIyVXIvbXlhZHQ5ZnZrYTQ1U1ZMZ0FrbC94WFNLNDY0Z05mMWZlZk1oRmlX?=
 =?utf-8?B?TGZkQ3ZJN3ZEcitqNk4zUDJkQlFBSWxaK0IwRDZhbzZtbm1FNjVkeE1CZnpy?=
 =?utf-8?B?d2pUUmpNdlZJRGhLZW55SFE2K3RrbVFVV2tRSW1qbkdEcEVqNXZ5MHNTWFhv?=
 =?utf-8?B?ODVmUFh5UTBxT0g5NkhBQktJeTFMM1ZITTgvTFc0QkhiYzd2bGM3UkxkWVBS?=
 =?utf-8?B?RnNsNmo0SklYMFRFbHY1Zzkrd2gwK3lqZzNIWkRZdlgxR3VjQjRCUWtRMDAw?=
 =?utf-8?B?cTkyem56OERKZXZGZVhGdVdHbXZyYXZhQ3Z2U0ttWWdDR0ZHSWRGT3hoVjVK?=
 =?utf-8?B?ZERvWitGYk5CUEVKSkhWWlZMNFdsUWpwSjhhSmpFYWwyUlJldlpsbE5HRTZQ?=
 =?utf-8?B?QjVSTW1mWFpaalUyeUJ1OGc0aG1DQlgwbzdBUXpwRTljWG4rSDdiclZLQTV0?=
 =?utf-8?B?aFZpLzNzZnlvemhmMGoweEtXeFdUR0o3UFdEdWF6cTZPSm9XVDFJcGlrVEhQ?=
 =?utf-8?B?bllyOGwvbVBtb3JvQk5MZzN0OC9GWk1SSUtuYWoxNmlHUGRIdWtzdE9BMEdS?=
 =?utf-8?B?eEJZZDFRSWFlQTIxU0Z0VCtkayt3VkFQTzgzenFDWnk5NllqWDFwWEx3d2dq?=
 =?utf-8?B?R0loN0ZFcE1CcUQ5M2lGZDVKbVI2cEptRCsyNGJoT2FwNWwveS9NVG9RNUZm?=
 =?utf-8?B?R29WV1hWeGhYc1h3U0IvR2UrSmtLNXRtTlJpc2RVK0hkVzlSZ1A1WjlzeGxF?=
 =?utf-8?B?K0trT3FUT0tBRXVJa0dRN3JUajVpVVMxTXhJUFhOR0todFppeVZVc0JIMHVy?=
 =?utf-8?B?b0tWZVQvUDV3SjVUa2duclZ4bGxTNGE1QjF2S0JNRE9BSHFzRHJKUlp6cGpl?=
 =?utf-8?B?NzB5NUJvZzRYaUJRbXRHSFBHVS8yR3lUd2dMV2NIUzhRWWd6Yk50QkJwTWVS?=
 =?utf-8?B?SHV1angxM3kwYWF3ZGY0MnJtTG51amhEbWc5TDJKcDg3VEcyZzRJOUVhMzhp?=
 =?utf-8?B?TEtJREI1TTM1QWl1cHlQWEwyS3NiZE9qYmpDVExxOFNzcWt4d3FtQnlSZ1Vz?=
 =?utf-8?B?UjNVRjVtaHBuWnRleXdWbnZ5bDhBWmV1WWdBaWQxWXJYZ0t1aWRMeXNhSm1C?=
 =?utf-8?B?YkRZbnNNSTkxQTRucGFLdTB3cTJvN3I4TkZNSnI1ZlVSbnVFVThmM2YxLyt6?=
 =?utf-8?B?SWxVK0ZwVXlOOUc0L0NUY1FHc0R3aWI1Q2JUUVRNMHVTZU15SHE1Ukd0ajJh?=
 =?utf-8?B?YUVlQm52aW9JT1RndzYyUi9leHBNanorY0R6SnhzSUYrbnkxZE1GLy9LRnZ3?=
 =?utf-8?B?L3dmcDVrL3JMWllJQlhNWXNhY0t4a3lmYkxrbGgvTXlqTWo2bFJBbVBTSitT?=
 =?utf-8?B?S0dKNDRkYlhIWnh0bUJRaktETGpXVmZTMHFBc1B0Zy9id290OXhjdzIxOUxq?=
 =?utf-8?B?dm1na0NhNWJXUHovSVByUUhDc20yYVpCU0dRdWJ3TFNDYTZKTWIzdld1WTdq?=
 =?utf-8?B?VnFWcHI0MDdDcVFQckV4VzIra3FPbXR5QTh5L0lRYTBJZ1phb1Y1VUtrdURF?=
 =?utf-8?B?eGlpYkswaXlPeGhlYjFlQlkvbVdFcWRjNWFtTWNNOXJWcE1FaGk0V21qMW05?=
 =?utf-8?B?OFpnR1I0SnZSd1Z5Zm1uNUZZeEY2OFRFdHlRUXhibVV0a2srWG4wNHMvZy9h?=
 =?utf-8?B?YnMxaEVzZ1U2MEYvRCswdVJGTk1aMjdwQmVaSXJLazFLZWJvNjlUOFNRYlB5?=
 =?utf-8?B?SEdhN05YWG5vZ2k2azA5RXNUY2YwY2FZWDBpL3k4YXh4SFBtSWtzRFdPbGpt?=
 =?utf-8?B?RlhJK2tTMkxCeFE2R015cjRKZE8rNWtkM3M2V3ZkNGxZNzRPcGhiV20yT2FZ?=
 =?utf-8?B?L1kxck5HMG54MWUvSDlaenlTREV3UmE3UDhDQTRyMmJwTmQ0ZTdNTGhaMEs5?=
 =?utf-8?B?cFNMM05KaWNjdmExeDNWaDVNZUxFaHQ0ZGJlY3MwL21FOS9kSGw5cy9nalc3?=
 =?utf-8?B?L25xb3hMUmo2N0Vici9BbFMycm9uU1lNNHVpUDJod3M5TTF2RWJURzBaUHhl?=
 =?utf-8?B?a29Vb09ZTU4vdHU2cjdZcjV5Vm55MVp2RnEvT0x0c01lSUljYmpzYndPS24y?=
 =?utf-8?B?ZGdTbW4xdEdXM1pqY2RzY0wvb0RxUDAyQjh0N1Q5MjVoVXRuRWoyQ2VkWHo3?=
 =?utf-8?B?bWJkMFJQQWtjSEpxMWR1NjNhU2JhYllJNjc1SjUyeXNPVmxpSjhXZzFsSk1V?=
 =?utf-8?Q?tXBrj/Lw/DPcSmq6Zua7KhOOAwQhxtnasMSr6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88380f54-ad0e-4a78-0515-08df3fa201a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:15:15.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEdxWHnIOwfYqI/Qu5FraQWFZSL3I3hiFRxRnE1F9S2/pzhAjECht/SnwISkscVrSBopL/p1WqlVX2VS+/ujGdOd4uW/dPMoLmKEUsSbJNqccejbse8/G9GPpYAJ7BiL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
by the debug interface; add documentation for the optional debug reset
controls and update the driver to use both the soft reset and debug reset
controller APIs (the soft reset is already documented).

Add a HiFi4 DSP node and enable the DSP on i.MX8ULP.

Changes in v3
- Split the previous patch 1/4 into two patches
- Update the commit message to explain why the reset properties are
  required for i.MX8ULP
- Update the commit message of patch 3/5 to clarify the switch from
  direct register access to the reset controller API

Changes in v2:
- Update commit messages for all patches
- Require the reset properties for the i.MX8ULP HiFi4 DSP in patch 1/4,
  as suggested by Sashiko
- Use sim_lpav as the clock provider for the ipg, ocram, and core clocks in
  patch 3/4, as suggested by Sashiko
- Rename the reserved-memory node from dsp_reserved to memory in patch 4/4,
  as suggested by Sashiko

Shengjiu Wang (5):
  dt-bindings: dsp: fsl,dsp: document debug reset control
  dt-bindings: dsp: fsl,dsp: require resets for i.MX8ULP
  remoteproc: imx_dsp_rproc: use reset controller for i.MX8ULP
  arm64: dts: imx8ulp: add HiFi4 DSP node
  arm64: dts: imx8ulp-evk: Enable HiFi4 DSP

 .../devicetree/bindings/dsp/fsl,dsp.yaml      |  4 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
 drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
 4 files changed, 82 insertions(+), 55 deletions(-)

-- 
2.34.1

