Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792695922;
	b=BI+QYFfLjdzWTujv0ve+yEybBhpMPFK0nejK3iJx+FvZAOb1YIYOAK1z0fJp3RUbNWW/
	 DL9sKfWQ0hZp57gpI3+C7BB51rnR6eketliiHdO9fWwy9MQWHuAJNEk7e/5sr0+KlXFh2
	 6HNuear3ZDAmVe8g3cwEhmdhuPIyiRJY3TJXzSUT3XkzwEz/P6n9QJ3fry0ZGh+ob8xnQ
	 kxGa7hRlRPsdvGAyNTknQ5rb75z/ReMgsQTNKQSkrgWPSh9ob9K3DlR7+Sh8GPG82jnOY
	 n4iUHPndN9F+Vb4xiZqqT/5swGBMvKn6VdGzBe95mTBrB0y0jOyCS4UPg+wY8R26LXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695922;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=EfrGfPHfuBdrqr5iRe7Qs5D1k/vZJv+GLvXr3VbRFCY=;
	b=XzJLv80PRemyoJ608sdB6vb3AMrlw5vauXuY7xiaVR9akE5pH30AHzea6WoVp7UOCcUM
	 91WeusfrzXkk+yP7jPOCKzvOysfqKlQC4v0n+Tuz+cqTPnpQaAOnXJEEAyFwYmAzVGnnM
	 GeXDTt2Rq0+0ROS4dnC99nTHoC2U08ErUNH+s9KurW/XEnuG1+dXnK+9LSpm0yeO9ps6h
	 fT3ZC/LeGKbtvXfN3U5dXvkM6WWfloUSGTdfBhAiNJJ8obapN3XiquucpYGbcAOiYx9wc
	 +fn5KnKyZvuzIE7V1NYWT1Qby0OAOhRHaDzl/3lGFjEiOm2qsKpe0k8YL8JpkA1NvDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vzKf4xbR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3B606A321;
	Thu, 22 Oct 2026 19:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vzKf4xbR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqml5jMQ4V5slkzPxeeH46lyQGgKA1y7Yu81qIu+uCJ46qRxoCNwVMnl2s69iav1YKZEvIKhcD2HyQDaqxZx0wWDpqxFkNs+snFQatE5bsxihx7XJbgvbPn/NAuHqMfF9okY2GrBn2/9RgBgXhlasI47rsrRAsmpjuea3qJ9yUU/JP+woGlm1WAT+gkIYTyKnGeuQjCJFQhwqPZgcn36a6XdLpOGDhkmjH1mOTAT8HCrKxInZ0ePNo+cZ9itNB2J7rvWleo1namOpCiG08i/BEkWG9UThIiSZ8CoCsCW+jBtKrNdD1RHLQQkH/1OuSE83i1HrhC9tDDdhJ+Yx0Q5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfrGfPHfuBdrqr5iRe7Qs5D1k/vZJv+GLvXr3VbRFCY=;
 b=UABnHTUlsYGGdY4SRIK4BDDLwAhIbS+TXZLzzYUtgUv5WtIa3MSky0CSjUnT40+OQjcCapLFFLlhH6AC5a7M+7/pAWZbmj2pZ6BL8RnnAxhDBD9ZRVAgghWqv5gfiS2agFzaUNNlIDb1poZFJYq5SfFFXl4s7GSR4KR7kAq/IXdErpJceckecpCmEPvkSX7W2iqb2BAXkjtAH20oEGu7AQrNYPEsji2n2/nk31mShA9/qOQMa5p1jts1ir/BUpRpPBfBnNe+DZEXMpThqJ9OFZW9AUdIWDkuDhbYnXI+4qDctapbXUbosfCl1SIZMjUiWfwl7xmRAHZBca74tgQSRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfrGfPHfuBdrqr5iRe7Qs5D1k/vZJv+GLvXr3VbRFCY=;
 b=vzKf4xbR0AWO9cHz9sU2CPg+k7VHOxOwSsY/HiG8PZkX9WX2Go1rsr/19L/33hfVV85f9Tpff4Ux+HU1cfRestgtNVbArp2LYnf5O0bc3we72oUNZYpdz8qH+HH9lHnzH9hY4JQtxTb3z5htIw41rWl8uCxDD24u9dBAchRdDNBJZ1ElcDIoAV9n63sg9NEsrCEJ5cPM/86wCPDoAWbPZgt9PoJvx3mFv7dWUMGqb+RpTFtrj4o32yYH8Kxd+AOk0BFNabBpjtBKahdfpAu6UV7fpLra0RqDcjJEnSuWla0WdOcNOwXgjhbXZexJnrDAOG0p+m+okAjIIgYffl2iAA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA3PPFDED8D103E.eurprd04.prod.outlook.com (2603:10a6:108:1::b4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:05:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:05:19 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 22 Oct 2026 15:05:00 -0400
Subject: [PATCH v8 2/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-memory-region-name-v8-2-ce5ce514a550@nxp.com>
References: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
In-Reply-To: <20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792695904; l=2670;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TB0amgyI7MiSmQCcW8rbbX/E2ukmi9QPHn+MXk9iitc=;
 b=OcmTX22sKPV5zjY4CksE3oKITgbQlmPe0kVzvUMLNeg8qioOOQMFKi/bO2rSH5SFt7uYZ28W3
 YWJvRESwrzeAeykv8NIFfSzHcXIvPjsPylKM3Ebl9Ej3YFFqF1PjHlz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA3PPFDED8D103E:EE_
X-MS-Office365-Filtering-Correlation-Id: bf09c7df-1761-4a88-8185-08df306f6a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|19092799006|23010399003|261021123027099003|261009223027099003|261022105027099003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	/BCm78u3CNlq3Wgel1K/NoseALka8UDSEbg/MmuCuyFRDuruNAZwbtorJaKTdQ1eBYOLPoX4dZX7wjkx1ExjINut5nThPXal964laVrLSmFwcg2Msgp7Cil7876lrndDGePloq0eD6nMVQVQHKAqBtT23KnQetidGd4cs5RpUASnxgAzwcWStxLUR3HcScfyVNnZD6lD4hsJxphW0CK7RR1CA3hmuyQNnPh/jGJqtybRv3fpfzuO2+Mlj0x1s3KMAytXFh/nYGskCyuGdWqNfasoqB6sEWLcJYCueXDsIVpRjSbZu5zx4AmfJ2W3IzKwQaJPvkncxS/6ZwSWIZjnZLnV38n06moZHCi/E3nUR2JRdwcWSJQOWHPq+S62c0eRIP4RtaXYcwYYSz9GDLiuVEJxoZTm4M2nwK4omFj4hLxbg4DekjkHF/1SYy3mfAWKlsHZNobpyzz8A8OBA/yarQMn1wzDWpmvEPHm/BsrPmbUFv1en6gMJ4yckzpOzi5fj2Dbrf4HjWDh6Fw9GYZn935IdsJzWqsJgUz5QYL3SQF1y7b6VWcFF5yIco/nrcaOWJEdIS0IpeGJuIR95Wu/cyHWNDcjqJ4aYGkk/O7nZBg/IX7trQNLqYJVf4uF0TTH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(19092799006)(23010399003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmJUazdMbGJCd3U5bllnaVpHSXlJYzl6R0c1UW42eXVWOEovSW04cmhhQ1Iz?=
 =?utf-8?B?N3JzYyt6eFBObFNqb1JocnljZFE2K05uTTRtV2RmT1lNd3locFdjbDJKTkl0?=
 =?utf-8?B?SVVIZkcxR3dFR3dod1orVjA3ZEg4cFozZy90RDRoSjQrNlVDMW1FTEpubFNp?=
 =?utf-8?B?QlZZNE1zYm04R2w4Z0d4NTZHVC96VjFZaFcwSkEyK2EvNkdWbDFDTlZGWUdG?=
 =?utf-8?B?Ym1Ta2FsZXp1TnMxdDFMRlZmckRQSWxmc0UvVzF2cmVnOGRlWXB0NGNtbTNw?=
 =?utf-8?B?a09QdWJ6cDR6YWZGWktLMlVrVGlXeCtwMy9WZDg1aFNtSVIwZGdIM2loNlZO?=
 =?utf-8?B?TnpIODFsN3Y5VmxsSGlGdWZWSnRRcTlKMC9Ra2ZDcEtvWGhkTUI5Z3NiNXBi?=
 =?utf-8?B?blppOEVmQWZmVTlTSCtpQVBvVWVFMEo5cHFDWWh4T21hN1h0NFBkbFkwWFNO?=
 =?utf-8?B?aUFWMUYzODFCa3ZMcnlyVUxBbDc5aE44U0duNGpMV2puUXdhdUI0OVFSa3Vo?=
 =?utf-8?B?RWlObHVIellhbmMzRE90TmFwbUlVRTQ0RlRHTWJmUEI0ajdkK1NNNkxzUDVt?=
 =?utf-8?B?UkR3T3pVdzBHUWtMRm9zYmZ3dG1ySDNHMldtMkh6NXQ0UzA0aEdKWWhVc3VP?=
 =?utf-8?B?MWgzUFpwQ3RHbm55MFY4RGs2eGNBWWFLekN0NnlKL0VSb0FPUUk0Y2tkaFE4?=
 =?utf-8?B?NkNaZ2U4MXNhbkFldk9oZ3lSU05HREtLQi9hSFg4SlNIUUlxVHBjclg2M1Qy?=
 =?utf-8?B?WFRWdzVGTXNnM2lGYUdTSUxoMEwyUE16WjRkS0NZVmpzNUlPaDJGb3VDS1Nm?=
 =?utf-8?B?cDIzN0Q4VnUzM0Z5Wmhpd1ZHYkU2S2FRbTJST21vWW1sSGFNb1FkRW16QnJQ?=
 =?utf-8?B?YUlSR205bnh2ZUJhNWxuYVl5bjVvK01DS3FCd3BBSmpYK2NrTDM3aG5qYjRx?=
 =?utf-8?B?UFcyYit4cW1lWDJYclpuUHlmcC9rQWxFdHZjMEovQ1pEdG9oeFB1a0V3b1Fw?=
 =?utf-8?B?c3JYdlg2K1FiOWpjbEpkdHVIKzZ2Wi9tMStsd2ZObWdaV2JWdGdWRjA1SG5v?=
 =?utf-8?B?YVJWaUJpTDd4K3VMTTYxMjc4VGI0c09YQUpFQVp2d1krajIzMFNFRktFcmpn?=
 =?utf-8?B?dEtJb1hDZjF6TjVjY3VocldhMHJWZ25CcWxkeC9Fcm1sZWZVTFBRVFpINTBQ?=
 =?utf-8?B?WUI3UEZINmlpUFBpcmlDMXhJbEt5czJ6Qkg0MVpDUkJRNjk0dFR6aC96djJi?=
 =?utf-8?B?NGRqbk1JZkQydHV1Mk95TDBraGNzZ2VjZlgvV3E0ZVlWNXhrQ3Zrc0Vuek94?=
 =?utf-8?B?L0pwa0oxS1pMN21pNmQrN3hsVU9haHdCdk1LQUNKTjlsMkYvWFBIVHJob1I1?=
 =?utf-8?B?UUFmemlBR2NVRVZtUlB3Z0lJWUJVcTNUTEQ1SXZrSkNMUmJvb1lWVGthR0lx?=
 =?utf-8?B?aFd5ZW1HTG1YSm5lOFZkMiswZU9wQnJ6dlp1cGFac1BpNDd6d1pQMmhoU1A0?=
 =?utf-8?B?U2k5QWFWTjhSaXpqY0pUYjNWZ2YrN2t3UWpmakN5UW91ZlJoc1h3RnJrRjhn?=
 =?utf-8?B?c004L0d1a0hnWjVVVTRwUHdGcHlUZjlaZ0Y3eGducHppT0VZKy9rbDcxVjVD?=
 =?utf-8?B?S29qbjBnK0dJaFZmMWJKRUJaMkRYRytodUVIdUhsRVVhdGhsWVYvTWczTHAr?=
 =?utf-8?B?UUdrK2JtcVR6cVJ1RXE2eHN0L0d4QzdkWS9SV3lnMGprZ0tHMEZCY2lXVTdM?=
 =?utf-8?B?QjNaS3NQeG0yWXNpNWVYakdPdjhoSFI1czdpbXQ0OHNENWxVb05NWXR5V3JM?=
 =?utf-8?B?SDVMWlFhK3ZoQ3NXMWlMQ0ZsVHBFZWZFTnVhcXZIVlNzQVNoNkdZcmxNa0Jl?=
 =?utf-8?B?ZFFaT1lIUTJkTHk5ODhuNk1YcDhkZnhMR1l2NFYwZ25UeCsyQmVNZlYyQWlv?=
 =?utf-8?B?MGdaTGIyb1BEODhQdllWNEMzTXBjTTU0aFMydnhlcHNuNnhkVHJwSXNzdGIx?=
 =?utf-8?B?L0dLMm9HVVFkbytPVnM5TDU2ejhRYTFNNlV3V3hONG0zM2RKQ1NhSStHSWxt?=
 =?utf-8?B?REZSTkhQeTRLc1JzbDhPaDQxeFNKYXlPOEh5YUswRFFRdjZkR1dCVWtiT0Fj?=
 =?utf-8?B?SHZmeWZKSnFMeExsdnFKc09TM0FvTWJ6Nmtqb01lYklheHpsUW5VTGVMYy8z?=
 =?utf-8?B?b3lUbkM4UW9qOWZFUFFEVVk3Mkd2WUk1Wm4rV2lVbHlyR0lLd3ZjQkg1Yjg0?=
 =?utf-8?B?SUVpZkJlakFOMmxzb01rUEFJZDI1dndpKy9EazIzTFBoRU9MRmE3aGJwUGZo?=
 =?utf-8?B?RWZ4WUtGNVJWTEZCcTZkWkt4MkNyMmpLaFRFVnNxSjRPMC9IR0NJZEk5enRI?=
 =?utf-8?Q?qco7ZmUBE+YjYtHk9fJEUyFQfQb0mlniL6HWc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf09c7df-1761-4a88-8185-08df306f6a53
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:05:19.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGnNM6GqqZ+JvglCRBIkj/lNUGQKooGLdCD5N+LpIOtTLrRW8bGMCsk0pP+W04vOitVpSQ2dpflraDMEnAOK7xs/WT5VRCbrI2E62HNBNU5IKU0PtkxbjWnKyWU0JoR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PPFDED8D103E

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Parse memory-region-names to identify the expected memory regions and avoid
relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893f..2707040f16d06 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -635,6 +635,25 @@ static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_rmem_to_resource(struct device_node *np,
+				      int index,
+				      struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -823,11 +842,17 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (of_property_present(np, "memory-region-names") &&
+	    nph != of_property_count_strings(np, "memory-region-names")) {
+		dev_err(dev, "invalid reserved memory name count\n");
+		return -EINVAL;
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;

-- 
2.43.0

