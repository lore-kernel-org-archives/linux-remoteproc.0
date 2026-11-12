Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794483098;
	b=le2a8siqWDvdAbw06DdwhS9WgTR9Rt/mMxXn7htYsuyNKztUBH/+UuKqtalGfmgA3tKS
	 TVlOISLvqlhUPT1tgQJuZC40H8ogT5IcsedBcCVVBrutkTTAvFVd44Eaeat/KY82xstgb
	 gMdRKjbhm1h3PAZ4wxInWreD045zduLhycK2UgJOdliqUKN1AN7qoZP6wwdgvkfmZaabV
	 4WsaoOQnC+cfxQqaf8oFnW2tJpZV818d+nNtcabXcZIIs+6Weyqm8wXKHtiwdo5eLXPuk
	 nGKvQx3GkuzXxx54QylrJ1MNoUe3feq6DULdVPWDkhYA7hKjgDxavK2+Akrlqicz3sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483098;
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
	bh=4cvCl6aqrwq9OktfPI03bqbGDGXnJhTyM7lJh5qC0aM=;
	b=zVZwzKxSgflCJE3PwzNJqqKn1ZgBKOPdgVRmxzOOKd8WUI43DpISMQXEIk/ue/TtIHzX
	 llEqiVLzeI7/mej8CQXI/YTwKRK7zWITyH6oZWinnySLAanQNyI93ImzFipyiOWb+K5pK
	 W3AJQXX3X/Z+JocR6D3tJR2Fa6pebkUjWKWJb/dE1ZmYGrw9ATQueqEZTz41Rlm6pnGeI
	 9+V5biPrz15jvEwTFtdSO8jVgKL9vLwZGZZ2d4eqRfaVcbX+ZF5snDkkPKyBor5y1m/TQ
	 tRiFrXFYX4SXM6Kjbb9TgdikZY8jBm/5JMKbZ6lR94zjfgQxVe7BAmnJouBwvfk8gcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wiq2ZR3g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.29
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A37606A334;
	Thu, 12 Nov 2026 11:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A37606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=wiq2ZR3g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jc5OjQ4DqmiuLpT3dza/kQ6FLoreQWbeaFP9Uvmknb4IcqTYaaOJBQbD2G93k1rXgKLBo7AUcaw4gsMMAhs+ieyGFj02meF9jQxAFiG3KJmlYBg+Wz4Ik1517mtponemXpetunj35xUaKTh8MQEWWREs37/kH/XO61uQ9npD0Xa1TR8bM1HijnE3f1edk7+Ke1Rt24qq2GBejgEsd26QB7q87zt4Wh04M4eiB/0Niz7+mNFzfLDFtvQGo4w7eeGsOTGFviT9xFQl7vZ6t8OLKHSXnkNO9eXUZK1rkojZU1CZmco5h7VMCaNOOmKgvoWrh1U/N0nhx5J0LDHcrAs7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cvCl6aqrwq9OktfPI03bqbGDGXnJhTyM7lJh5qC0aM=;
 b=aWL+o59ncbhrye8jKno3JVckVd7yiBIfyi3WckVKg6DKy3+q01GJqB2Pvk9yB3zhyWxja88dAT+Dmq0AlBaAssn8b1bjw1fryOnuaS3PaC49BRq68+CyqtafeTejhCToo9WIGAaKhVDpZoDWyLVxX1PTsna/LPGO6WcgVPvQ5nBjPpzOpQv0JWZZA2ix629oICCkkP5i+VdsRzyDiEMNoYmPtsnG454nopfuO7c3u1xd3hWHF1HUlGy3ZspkKweUxgFhWJ0sXaN7gmvNnSuVA/0Dq/NLOMn1Z+cnT1RNKRtfaQcrcKSuo1f3h49ol+QRqyz7ip64TokiQXC4P5xn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cvCl6aqrwq9OktfPI03bqbGDGXnJhTyM7lJh5qC0aM=;
 b=wiq2ZR3gaQpAMeEJV0gG+/vzHmRQjb+1ExIvk5lZpGxTYG08JjGuCxQJRhfxU/zUsBuR1J5YxfsABtLquy8A+TsbuZ03HUick6i4vuG9Sja02Eb9G3CsrT27Wkf+THOowlApNlDrpzMyq6Doey8hE3Iw8wmwczrHDYwG1u4FnN3/MGcQe5K1H5C/EAgymk4NUo05dMtf2d8+zte/mlG28YCdyhbecD0gpQpAcx6jxFj/zZLgCNQ55euyN05JV+6sqzQ/We3QkBRdkA593kg4bYGlrZu34xb0LuDUbmqKUXd4T2GXNs915JOHtO31ofhs6A/UPYKGdRjCL6BPTgqluA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAXPR04MB8125.eurprd04.prod.outlook.com (2603:10a6:102:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 11:31:32 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 11:31:32 +0000
Message-ID: <0e002d54-e94f-456d-847f-5d092f9461ed@oss.nxp.com>
Date: Thu, 12 Nov 2026 13:35:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
 <20261111031808.570680-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261111031808.570680-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To GVXPR04MB12316.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 383529e3-ffdf-4510-cccf-08df40b08054
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|921020|10067099003|4143699003|11063799006|56012099006|261022105027099003|261028144727099003|261026140227099003|261021135927099003|261021121427099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aOPdtlUaO+Nq0oX+p3+JZlL+erN/bibXoJNBE7gJVTMmBEM/Sz8MVEHGP2jJLB/0PK+L5REoSr87sOOWylxYDpZJbaXpmWAaOJcMVMolkvf9Va6Qv1ziAzcUAL5YskiaJRW3sVhC6upxmbSyBfttm1D9xQokwLDK6SrKFVM9A2Ey0poTe0OD5e6Vg//aHsi5kAp2m2HZTDsO1ZfHOfhPmr4StLm5FNlsKXxxHGw6dfg7y+KGZRFruQVimukJtFXL87kxVcBZbu4PL6LcyRg0NxZAMuCqnM4qJRqXM0tHwCof7aKeK3P5Rejp6Z8ZQt9P8xYc6bvTC1PO6TlAe3oPppU5vITjjOg/XcCTV+ELKvKbdrI8zIfUuZ3GyDYid8PADG8eRzvWjaFb6qDPu0x/dTScn41dYfDVxJI7IY016hCP5dDgjk3EaEKHGb1WpkFZjxhHLNQ6K7Q81A0akz1/M1JX296buXTEN+/lpW7v5VV9Eme2QNxWutwIA/8mBJW26V7wRK2YZwGsUr9uDar8/gNEDdMSmaI4FxjnanBuxOcaEGQ8gDYcMK2R6lwTRQMQ4D4+LmVB4yWgj6UnraUsHvQAdg7AxVcXc3hHp4JJGnTuGK9GO46GGQD2Q2+kiy0+3mHZhGHiBCXWyddy8W+v5ksGWRztmPr4B0965BcljeYASWv8yjDdfTJDmYIbxJ/oq8himALQ4R3EVosrB3tWKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(921020)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261021135927099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3BBZERaUWVjb1hFc0lUTDVIR0ZwaHZER0JKaGFCYXN0U0pRZ2N3NlArNkpt?=
 =?utf-8?B?MldjMWp6MFU5Mm1UMDFZdEM1ZkNTdllWLzgzVmxSRHNFcDBSMGtTU0cyRTBo?=
 =?utf-8?B?SWxPdXRFTTZnS2pCRGdyWWdJcjNxNnhuSmRYU2N0M0lwNU85RWVQem02UWpO?=
 =?utf-8?B?Rkh0VzNIcnMyTXgvZTZlc0d5R2dyUG43dVFUcy9nNXR2L2VwbUlrWU10SGsx?=
 =?utf-8?B?YThVNkl2ZllJaFVjTUdKRkZRYVdkMHVJeE9Bd0pzZmowcXZnbWlpMVNPYzNn?=
 =?utf-8?B?ZG9LRm1CTXE5UmtYRFJpdUUvWFU0Z05UeGJOUzJxek5ydk5tc0tiSHhGSFp1?=
 =?utf-8?B?aUFYeW90RnJCTHBGZFk4anRGZFpXc1BGd0FsSmFIelJBMUNBeXN3YWRhZm5z?=
 =?utf-8?B?WnBHQXNCcm1YYW9JWmw3d25zVDFzbENxRmlqU1NaTXBPNFVpcVdia3dwQUVL?=
 =?utf-8?B?MWVzbWxycGhRd1VhV20wMWk4b1dCUVpXM05KV0tDWGo3cFFBVnlnZVdySlJ0?=
 =?utf-8?B?dVNpT0d6NmNRV2N5N1kxVDdqajNMMVpLaFUvZk1DNXpmTE5tQTlwM0tQdkFE?=
 =?utf-8?B?VytkTjBJZVhHWG1pd2NYbkhVVXVXQ2ZjVGVxenJjM0JGQnBBK2dCNHRpYVRG?=
 =?utf-8?B?Vy96dXVsMlZsOFl0bGpZK2NrNjQxa1hGeGhWZ2tiQTFrVlZiMkpsM2Zqbk9O?=
 =?utf-8?B?VmFMTWZkN1UvU3M2NXNGY1lvS05XOEdIYS9IR2FPZENpaklXY1pGR1RLL3RK?=
 =?utf-8?B?bjNhaVNKMHl4MDdadkhGUS9PVThwMm9NUVpUWXJvRlFTczh3ektPaFRGRkUv?=
 =?utf-8?B?czJTQ2x0Z0tScVgrSUdKVm9JenZlSXVGc1RNYllQbEhrWmlGR1hIUEpsRkVT?=
 =?utf-8?B?eVZMMnV2TnJWdFNQb2hZUHZoU1RvZkRxZFZoY2tUUUo0TzhpTHdTekk3VkNT?=
 =?utf-8?B?TEIyS01aNGNOdHp2dGpLOWNZUFZacUcrS1VOZ09XdlVudnZDc3BFQWY2Ukp3?=
 =?utf-8?B?TW1keUFwYzhLUVR1VVZET0dDK3lBMmlHTEwyOGxpbjN6OUMvRjd0THBqbkxi?=
 =?utf-8?B?MkRvZzAxN1NzVUE0Zk5PYlNWRGNDdlFCZjZjQUR5VzRsZzIxZzY2R2R3am91?=
 =?utf-8?B?WTRPbmtmRURZUHlWV0JiREs4QzVQS29YZ2ZFMGFHaG9Yd3hOYXNQZy9KdENo?=
 =?utf-8?B?WW8ydWV2eEdSK3VlMXZ2dHZHZHJoZjkvOEoxWSs2bjl5MDVkODNlQkRaSDE4?=
 =?utf-8?B?cjZ3TzJHMnhpYi9RWkpWeVVsbFk4Z0lISUJ3dnl3UEJLVGhOMDRhNXBPQlZV?=
 =?utf-8?B?RHA1OUZuS1BOa3lOb1NRajIxcEovc2N4cTRYNk4rVDVpcUx1L0ZzZ0tucVpp?=
 =?utf-8?B?YXdNVzdjVVljK1lQb0d5ZDQ2R0ZSOTJTSWw1ZDQ5dkdlZTlzazg1a3dVcXRz?=
 =?utf-8?B?VHhQenpRUEgySUF3S3l6dm5FUGx4eDE2ZnlVbnpjMFozYlVOK3V5WVVjOEhq?=
 =?utf-8?B?NVVVZkxtT0JjS0I3K0RCV2s0MlBuTUJYeXVPcStvNnFGUk5WSXVLbmRjb21w?=
 =?utf-8?B?S2FDWEtiZzNTc3JkZC9XME4xM29RYzQwckcydm9aMmlkdWNTdGVPUk1nb0hr?=
 =?utf-8?B?K3EyM0VjWFlEQjllOGJOQWRkR0U2ZFlNK2Jwd1A0WHJIZnE3NGNzZVV1K1pi?=
 =?utf-8?B?b0wxMmhpUHp6OUxkL3lZcFo4dUJ4UnpmViswZHVUc3B5eS84U0lRNW0zTGh5?=
 =?utf-8?B?ME5QSUZqdjNrNzhvbUF2R2o0ek5jbVpPN1llNlNUd3ZsRmJ4YnNIeUlkYzlw?=
 =?utf-8?B?a1pSNWRuT3ltTzZyaklsQ2VoY2U5UjBTbzNLTi9uR3JYTzA3Ky9PWDFuREpM?=
 =?utf-8?B?NzB3NUN4a3NHNndBb1lLY3BVa0gyMWw3anpQZkZHZlk1NnJSUit6Tm9kSVBj?=
 =?utf-8?B?VnUwUmt3NFYyU21pNWp2QklaK2pMa2NSSFQ0YjROM1ZhYjg5RFhTbDZsSjky?=
 =?utf-8?B?a1dTaUlDa1lvZUlOLytPMUp6a1FCOWlhNGRSZnRMRktnK3FEUEoxL3JDMmtR?=
 =?utf-8?B?TUFCTm00aEtyUFYraUt6OFlLSitoVlBZUkxkVVMzVlNua3BnNnVkN2kwWVNX?=
 =?utf-8?B?WWdKZCtQbFpFeEtXWXY4UFNyaEZzcENmUmFKeHE2c1pVazFTNWNXVUR6WVJF?=
 =?utf-8?B?aFlWQ0lyR0ZlUkh3RkN6bU9CVTRWRlFUWGh0WmJLTEhTY0VyZ1hEZnYxdVEy?=
 =?utf-8?B?LzVOMWxCMkFUK1FMZWduNkRsQkdNd1JqamxjeWR3c0RqOG4wR1YxT0xQMjRm?=
 =?utf-8?B?YVdQaGMveUlCSmtRU242emFwa0c5OEtyZ1ZGWHNKZnJqZEpvdE5CQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383529e3-ffdf-4510-cccf-08df40b08054
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:31:32.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGD2QrnOLaMC8gDuj0CuzNz6uLXnFxrKV4ZhGwc2gOKByGer7KEuORMZuPPf8HVF6CQCLEpjOtifNX6pthGrDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8125

On 11/11/26 05:18, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Configure the HiFi4 DSP clocks and memory regions, including the
> vdev0vring0, vdev0vring1, vdev0buffer, and dsp_reserved regions.
> 
> Enable MU3, which provides the mailbox used for communication with
> the DSP, and enable the HiFi4 DSP.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

