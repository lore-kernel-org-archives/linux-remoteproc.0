Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259071;
	b=elo+PQaqN/8igDsX5rVkcNLXNsuzXki/NtkxBXXzQdDW3lJO6+0JRjaLKAB1GrwRO1OI
	 jtFnxj6FDvYY5QxsvZBuLFAjktuIcd1EEVWURF91ny/eTZGn3CCkDz0Kx0DQvvZL73Xil
	 3s18i1MAPqF+tk7ZYEeHUjWd7u4iDbpp01/F/6hprzq7DdgoPsZWn5uMFILe+lDkKVwME
	 5evVjHwJ3yTbxlbUw33BHP4Lwf6nK1kx2/LLNCFhFZxWMP7fkPuKNnzKhm5EW7rDAvdbi
	 etC3FHXVP/PVjsyEbS9SJ5WR6K/DULKDZYwahPdzQYbF7xDsCMEkxQ6UkrKBr5BSsGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259071;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XAWhEJML+RbEBI4jXuUcCxL4p75C3Yo2iH9Bw5OmzdM=;
	b=jbXO4bTwk2FjmuaWX2ms1RNfXv8wcDdSlp9edEBgd5BtK9lzylin7rnBKB+k9lV3WrgO
	 6pRrYxYzlKN6SSaZzB7AMUbqRvFdCdvr2Gi0mHDVoQJpOQN4Qpu/iDzFndjJRcy1zcOeJ
	 w3SFx9r/ulC2p5C4fa8GAEvYRjIbgSa3uRThbgFzaF4OPUjtd90g347g5oTn2Y++AdzH6
	 YmJi1QJzPt2ieoHCkBI0ApPzEGclf1f97/18dpab61fRNg8jeN8nDLzZT4g9B00XsVu5b
	 TC07lHUPvR2NFTFMFsSu3WobZtkmoFMt76lclJ3ECQVHeCmGzokp9Yy31rEuMfeiEaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qZoKhg2X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.30
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132FA606A322;
	Thu, 29 Oct 2026 07:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132FA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qZoKhg2X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpdOB5fjaLcwE8Yq/9H+NnGpVVR1Fa+fDQyCTALTLRarWZLBFLXYHgb2d0GgspOHHMNNqH8Gqf2YRtqTbh2jgEVwLw1NH0Tr0VngihOp49XXFdIW4n+A5RicAlqfqVyLVzxP8utwUtI3bzMXHj8fQSjBAccgfOL3BgGmYZtVh6Ym16v/zm0onJ5Z/MGQzaTGSb9FhvB8Nnnex/mpcWK3rLPm3RdEg+W6NPzCGOk6xYd5idqv9fC+4Y7bKXu/4o/00KZajjcHhzITLCzm1SRnmzC4ROB+2pC0hkLpx6uLizlCUWngAc7+iCUymqHSeWcH2vsxdIkZxXrMBqMgLjUxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAWhEJML+RbEBI4jXuUcCxL4p75C3Yo2iH9Bw5OmzdM=;
 b=qLvWGspSquaBtsJW9EH6gEKYvFzNJa392Npp6xq78YdLJQfMhYZmJ9j/NanCtCqbMotONdNb3S7AKrsbtQkQZPZs5wETqi1rwRUGfKmsKlkRchVeJJuluThSaUhLOiHSi4a0EO3pQhEikXthstX2NXknbfNOjOPY3Vl/reDMFZ0a4FgNhg/bnC9Wzvt3y5ixvrXf9Fue44wSmyZqRrnOmkX7EYqDC8t0IbyKs4WqP5YhH64VHwY0T3DUSxxnrS9c/mtpVR5hwT51z+2xen2bkCaH0kZ33eKNTcCjqf3AIEP92H0nJ/5x/Z13uQKxzjse7UWSLzzu+yyYmwVILa43vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAWhEJML+RbEBI4jXuUcCxL4p75C3Yo2iH9Bw5OmzdM=;
 b=qZoKhg2Xwo/1GppH1TYF2q4NWLtjvNLajSnT/TFU/tjOulRSFwcEPkxgKazLxoeZD2wr0fGLauIN57Sqy+91ZEIbEuX/L5zQtZ0AY4i5FOJ51dgxw84GRrqvprO6A6bpZrWaqe+2JYSfu97Zf05AwB7Oio1R3jb/+dVgYduaz+u01qzVq6Zp6d2mG9K5jWuMbijuU9CYsIyqLW67dlxXl4kJd4MzrRM0KFlJo15YET4sNz38op6ZRYxVmtEljofo7VwU1FwXzAQQ32Dvam3hL7zTsVt+XWOWv9YcgJ1E1VlwZwbCH3xKfmVDkvqn3vixCI2Wp+LC4GBMyJq5dBglmA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMBPR04MB639722.eurprd04.prod.outlook.com (2603:10a6:20b:789::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 07:31:08 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 07:31:08 +0000
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
Subject: [PATCH 2/4] remoteproc: imx_dsp_rproc: Add softreset and dbgreset handling
Date: Thu, 29 Oct 2026 15:32:55 +0800
Message-Id: <20261029073257.84594-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMBPR04MB639722:EE_
X-MS-Office365-Filtering-Correlation-Id: a783964d-b2ee-4034-536d-08df358e997e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|6133799003|22082099003|18002099003|921020|56012099006|11063799006|261028144727099003|10067099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	oS3ounf0R6LgJNNUVQiU8Uud+K2/jjFu89/LjCsYzG7iDNGcuz25YPzp/Pi4TfkaiEB4llbQ7cfrKp/hyrtzOLOD38sgBQ1ym/uL5glWH5GVI+NERykzEQbC4SrT2TbH8Vjn8LLwtTSDxQk42quxofxfn/4W56tzfCTM758cO0EMHmpNdd41jzZMvfL12xA4yaVzeSZ8fzUqDhZOn0W9aWm0cGx34kKJgyZnh+B19DH5EA27PiVK0uPmVrl01RMX6G9u5yR9hSsd8r9kfNjcf+Nw+BmcYRPK2NHgMcQhNPo9Y1Xu5SNs95sD211yhOQ5eDYUBCnEhkOJcFySmRJlmNPlqWrfwzFjHbreE1GKhy+2oHfgj1dUrpxx53fm/HUQoOyt76xQ3SQsY0tCY9FIxGWiLRQZc51RqYOCyHDDj+G5cnlK6svu7tQaKm5WmgskV/WlMwljMIFVwdn2T4+3dKKHJhzJlzAQGjPKqGzTVYDS3cYV1Z6vmNMvONPSpEn7ZQsnvUtH2wgS2Y7f6FarYqf7ccQ7FZ5QGw72pp+rzEqvBvDrOhzZO03gxyMfyKsNXJGjyHQbzgfKSsl4/WzjIkpIHp7knHaXr0I6zXyJIkM6UijjgcmvKRaaqNO4zZBPyIVOeWtc4Jl1FBrX2mPn8HHp9O5xffiRdMKHMSTqVa/+JN3jfM/IjH4D2nqrdRI/ss6mT4mY6HZBwoJtZ5DqmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(6133799003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261028144727099003)(10067099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b21CeGtWaEp1NVBRd2FVRVVPVEh2VS9YRFUxN1dXdVVQeXErOWIyQnJPLzFk?=
 =?utf-8?B?SkhLRGloQkpFYXgyRkxWRy84bUZMUjYvTlZEbkptL2dTTmhHUkVyZjZ0QXor?=
 =?utf-8?B?S0dMalRiNm9Xbzd4Sy9adUxQZDdZNnZ0UGp4RWtVbnVnTWlvcWhzV3J4Zkd0?=
 =?utf-8?B?eDNIaEFLczl3NFZhWlZTMDJDa2VSMlllUmJGMFBtbmRXQkVQQ3BNREkzaTIz?=
 =?utf-8?B?M09hUCtYM001cFptYWI0NzNmNjBFQ3QzRnQwUlU5YnBwNVErTjJWZmJwNEVQ?=
 =?utf-8?B?MnBwSHkra0ZjcVNWNFJ1bDRqZGhKSG9rNWFnY1pjYndvbEhKTjEvK1FkK3hm?=
 =?utf-8?B?RmlYdkpqcmorVWF1YTB1cng0R1pnTkwxL3ZBK01JdEk3cXllbUdPeDU4aVpB?=
 =?utf-8?B?Mm5Qc2RCaTNGUXBZbUFqK0dPSFk3ZjlwUWVFSXhpbWQ4T3dKRlVDOWkzb1R1?=
 =?utf-8?B?WDNmMEJCYUFFWVREcVdSYlkrRkZNUjlEM0lmZVBjWmhQUzRDcXdyZ1pOQlVD?=
 =?utf-8?B?S0ZkZGZDN0FQeVNIUmpIbm9XdDZ3bkNjdHUwY3ZadHcraWI0dHZNaElCcU5O?=
 =?utf-8?B?MGVaZTB3VWRJUE1mNHF4Mi96WmNSU1VySzdmazlYTHRzUWV2ekNpTGdSUFd2?=
 =?utf-8?B?Zm9raXJkK1hCVVpaZ0hqdyt5Z3dhMG9lMlVkUXloZFQ1T0dKd1Q2RFRtSTV3?=
 =?utf-8?B?MlhEeXY4OFRPN0NiQlBuV201a1BEUmtnUW1sVGN0S3pmTmRvL3BEaWRyWXFp?=
 =?utf-8?B?T1JDb29CbVB1RGtrdHA1SUs0Ti9MVUhXVnlMQm5LN25wNU11RnZMQ1hCL09t?=
 =?utf-8?B?KzFYTCt0UEs3L3VNSU00ZjV0cGcyekh0UmxsS1dTY2FWeStpaFlZMDVHdWpn?=
 =?utf-8?B?b1M5YlE3LysyRFhkckJKYXo5aVdIT3I3SjZZcm0xMzBUbU9Cd0UwY0IySlN2?=
 =?utf-8?B?bE9XcDhmcmhyU3VQNWFWRENrSHI1MCtMVXpvL3NUeVBsc0dXbHBvODhBdVdW?=
 =?utf-8?B?NFJlcFM3QlZZbzlRTmRHQS95UlFvdERiMFN3NGNNdVdkV2dveUhxcUxYWXlq?=
 =?utf-8?B?WVlqYmlnaURVQlNQYWczVFNUbjZ2N2hwMjNHTmtPMjF5dXRhdmNlZlJibHEz?=
 =?utf-8?B?L3FyaTJrMlFtVVBVcnFRSlJ1TmZUWDdqNW55STc0bCtlS2UvMzlPRGI0c1FU?=
 =?utf-8?B?ekdudHl2R3JEQUJJSWsrQWtZUWs3ejZoUDYzWWtsUUtaWGJ4am0ya3NucE1I?=
 =?utf-8?B?WHdyYTJYbXZHYmwyLzJrNnVvaStIRmZBUllNY1czYTMwWWV3WktVOWN0N092?=
 =?utf-8?B?STkyMlNXT1VPUHB5NnRxdXFhdEQxTXc2SitxbENua2U1eEdTMUR0WEp0SEo3?=
 =?utf-8?B?VVZyUWtKUldRVmRQbDN2aWZYOGZhVUovR29KVklrVWhuL3dUdkttRHVycWEr?=
 =?utf-8?B?VFBpalpNSk9JaHhleUNtMWV3L2hOb2dzUm9mOTZBYm1VNktOUUwwM2YwbDN4?=
 =?utf-8?B?a3duQVN1ZEUwc2xQWFBwRmtBMDhTK3BKVTZYYjlOVkgrSm5WbDlCS0NNRW56?=
 =?utf-8?B?L2RMb0MwMXIyYmZHT2VyMFh1bDdpVFd4MWF6WTFzMUtMZWhZaTB0NDN2TC9T?=
 =?utf-8?B?bTRkcnhDT2ozNFJHNktOMWFZV3p2bVNpMGFwYUtUNW9xZmRXQndqNDIvYis4?=
 =?utf-8?B?NkxvejlyWEo2d1RYemtNcFdxNXhNZGhOczZLQTdOQi9DOWtBbGpIZm5vOGk2?=
 =?utf-8?B?MHo2emtJMFhWODREQk1QNkhWWDIybWpaS21BSlRWUGZxVWdsV3gvSXJ5OXph?=
 =?utf-8?B?eXhvYmMrUGFYbFRVLzAzYkFUTUNYV0pzR2JZWHpMOEh1V3BCcUJBdmVoaDV1?=
 =?utf-8?B?Z0RNdEUxZ3dCY2VNQ3lFY2hmek5qUmM3RVFmSFdvb0FBQUNTVG9DUDl0ZHZS?=
 =?utf-8?B?TlhabDRnM2lqdWJlVXZIaXhDQ0pmdWc0YWdaLy9Gb0ozTitMYy9kSG56WFdJ?=
 =?utf-8?B?SHFDQjhNTVQxQ05sc0c0b3c1d3ZZWnFSdk13d29mRjBQdVRlWWpCd2RiS0dT?=
 =?utf-8?B?UHkyUUVIV3VWNjRVK0VhOTFjNDhPamZrU01hZ1IwQTkydUhqRlhQS2JEK2ZU?=
 =?utf-8?B?MHptZzZ2aE43ODZFVWtiV3JrZGdTSmIrWmw5c0FRM1djNTBaUG1DWjJVSTYz?=
 =?utf-8?B?ZE80Y3pHVUUzcXE3WTl2ZFlWQ2pSbkI1SmlHY0Q5TTBFR3QreXhiSnl4YUVV?=
 =?utf-8?B?UFlXdzAxR2RSWnF3WHVlKzkzbXdNeFN0czBMUlNWaHFwOTJhaHBVTGx6U1Bh?=
 =?utf-8?B?TXZCMFYxaXZkTmdpbHlCWDROc21uVzlGNy9XcllTaS83UGw5VGRDTDgrYXJh?=
 =?utf-8?Q?XQ67a5KiE44Y61e01m3ZEoeZXFy4k+kP4vI5Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a783964d-b2ee-4034-536d-08df358e997e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 07:31:08.7975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QO98T0lFDtSbsGARWn6Ism6Gd5AlSXYMO9HBUVQdmda9emsUTGCqsLn7ew6NR8Twj+/s+bhDRp7tTmhCYjozmhPidp3/ZONQP6rIfQ+ZxJNnTqcUQF6wYJhxNLN/tTcX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB639722

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add `soft_rst` and `dbg_rst` members to `struct imx_dsp_rproc` as defined
in the DSP binding (they correspond to the softreset and dbgreset
controls).

In `imx_dsp_rproc_reset_ctrl_detect_mode` acquire the three reset controls
— runstall, softreset, and dbgreset, the latter two are optional.

Rewrite `imx8ulp_dsp_reset` to use the generic reset controller API
(`reset_control_assert` / `reset_control_deassert`) instead of direct
register writes. This change relies on the reset controller implementation
added in commit 5aac7afc752b ("reset: imx8mp-audiomix: Support i.MX8ULP SIM
LPAV").

With this new implementation the legacy `imx_dsp_rproc_mmio_*` functions
are no longer needed and can be removed.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 76 +++++++++---------------------
 1 file changed, 21 insertions(+), 55 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..0b0042525ea2 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -108,8 +108,9 @@ enum imx_dsp_rp_mbox_messages {
 
 /**
  * struct imx_dsp_rproc - DSP remote processor state
- * @regmap: regmap handler
  * @run_stall: reset control handle used for Run/Stall operation
+ * @soft_rst: reset control handle used for DSP core reset
+ * @dbg_rst: reset control handle used for DSP debug logic
  * @rproc: rproc handler
  * @dsp_dcfg: device configuration pointer
  * @clks: clocks needed by this device
@@ -125,8 +126,9 @@ enum imx_dsp_rp_mbox_messages {
  * @flags: control flags
  */
 struct imx_dsp_rproc {
-	struct regmap				*regmap;
 	struct reset_control			*run_stall;
+	struct reset_control			*soft_rst;
+	struct reset_control			*dbg_rst;
 	struct rproc				*rproc;
 	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
 	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
@@ -243,20 +245,15 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
 	struct arm_smccc_res res;
 
 	/* Put DSP into reset and stall */
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_RST, IMX8ULP_SYSCTRL0_DSP_RST);
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_STALL,
-			   IMX8ULP_SYSCTRL0_DSP_STALL);
+	reset_control_assert(priv->soft_rst);
+	reset_control_assert(priv->run_stall);
 
 	/* Configure resources of DSP through TFA */
 	arm_smccc_smc(IMX8ULP_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &res);
 
 	/* Take the DSP out of reset and keep stalled for FW loading */
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_RST, 0);
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_DBG_RST, 0);
+	reset_control_deassert(priv->soft_rst);
+	reset_control_deassert(priv->dbg_rst);
 
 	return 0;
 }
@@ -338,14 +335,6 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 	return RSC_HANDLED;
 }
 
-static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
-
-	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
-}
-
 static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -391,14 +380,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
-
-	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
-}
-
 static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1024,23 +1005,6 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
-static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	struct device *dev = rproc->dev.parent;
-	struct regmap *regmap;
-
-	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
-	}
-
-	priv->regmap = regmap;
-
-	return 0;
-}
-
 static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1052,6 +1016,18 @@ static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
 		return PTR_ERR(priv->run_stall);
 	}
 
+	priv->soft_rst = devm_reset_control_get_optional_exclusive(dev, "softreset");
+	if (IS_ERR(priv->soft_rst)) {
+		dev_err(dev, "Failed to get DSP soft reset control\n");
+		return PTR_ERR(priv->soft_rst);
+	}
+
+	priv->dbg_rst = devm_reset_control_get_optional_exclusive(dev, "dbgreset");
+	if (IS_ERR(priv->dbg_rst)) {
+		dev_err(dev, "Failed to get DSP debug reset control\n");
+		return PTR_ERR(priv->dbg_rst);
+	}
+
 	return 0;
 }
 
@@ -1316,12 +1292,6 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
-static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
-	.start		= imx_dsp_rproc_mmio_start,
-	.stop		= imx_dsp_rproc_mmio_stop,
-	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
-};
-
 static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
 	.start		= imx_dsp_rproc_reset_ctrl_start,
 	.stop		= imx_dsp_rproc_reset_ctrl_stop,
@@ -1348,13 +1318,9 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
 
 /* Specific configuration for i.MX8ULP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
-	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
-	.src_start	= 0,
-	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
 	.att		= imx_dsp_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.ops		= &imx_dsp_rproc_ops_mmio,
+	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
-- 
2.34.1

