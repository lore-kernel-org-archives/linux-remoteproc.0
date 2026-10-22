Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792694995;
	b=TMUVIuC2EsHOQ2O8z4zv7TZX4DlSHDpSV9exVaj9TWgt7d1ULR05yZDQY9I2FLsCdT1r
	 Oy1Me0jUbOjCdUUiItwYcquDKtZ5e5WPfwnUh+EWqYLDkjO5LE5LECtj7sCtHJ8yFv5rh
	 /paOIAgSQ2Hm1anWriMQCQKHJzRl4ulflRBngOwTmz+5SQoMAAnZcendllovAVKDye2ku
	 xAipUdp6qNp9ZrTvqri92f9B/5OhMlzVzP3K96dGiwkXVZc78Lr+hmv2neCC1TbfWz1Lo
	 cJjYPc5c+i9IzzC7xox/SRT0KOZxmIuGt3GTPL0oMo0rNok7l2qXR7RJu+vVRaCZ4qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694995;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=v/Nta+70iQp5sygj5KWBvoIjhYBcWYgkBvnjqHCgqTw=;
	b=pvt5xf12gci8nRPCCsAZFqEHNvG2wh9cJcI6t6vT4XPTkUon9S7FBaDcQTPRGEffDqI2
	 ESgemVbA58uxFfi/yKI+7KjrhF3icqq6UnxDX/IbBCI1q49/vV4VVUEPROqAF98sQfGRD
	 j5Ct0BoFShR3009FPfxWK4cgcPyaHpGY5zp7Wy9y2erIuw4UsNOqQpbkDgcriTr2kAM7u
	 Ph0q+h189hbSs3bNuOnh8ry+e+yIbxOYxaeN09tn5Zh1bHdvKhn5SxRtR1bVS+XwAwq6U
	 yde1Eifo4xcTYBoPQRnPqZzIJamjZ+kGfV8z7BJ1bBV6voG0W+7udwS/cIxEo/f3nxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L2igpDNm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.70
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4991606A319;
	Thu, 22 Oct 2026 18:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4991606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L2igpDNm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2QjtpfwqdC/AIktVVOM8iEyo70wTvRwsEixrIADkYRkmIZmw5JJdujQl49ZRihJdHue2hn5rxXHNeDzI6MvE2RACDIOF+EiVi1Op3wgHIfafGIUzqGCFX/tq+3gOS5N8LAnK3FbfdZTKu8yuCBbXRD6SX6LfnDHrpnmJwH+aLO0pyCG0PGm+uaFdm++c+m/fKxkcQJzGtUIVL7Jo66V49c6XvOsAoeGbAuy6QOnaG6c+kVbwghOJdpAP4Xrpu9OjyHQFU2ywqj8dUzhWu/q9ODuJgmSRQbiYlwW+bFGkInozX9H7D3BBJVKujIFTBiaCk5oqffs3PtoauMJdPHAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/Nta+70iQp5sygj5KWBvoIjhYBcWYgkBvnjqHCgqTw=;
 b=BGrVuRJ0hbRdoko8c3UaHiefUrMbx6Sfyl2VauzH4a74Rm2dv2g0RzJ5sS3i4onb/mCUMsqaCULx+UKKO79kGigdzxbRZ2OwVaRpONMppN+5b6oAcC//NWwvsvS7M1F4H78ZMLs2bwZw4P2OLDMseHzq8d+metbZb53n0Ha122Hg60xZl36a0DttoeBl2Bw69gslOWMAg0+aaeIjTLaDxT8iFUli1XHDzG1DfkCGN39FLtg80R9a5F7B7Qbx0WCEWlUkrEVB/mDAjiB9Op3t98NPdKPeCfFbyv2qVHK83jGwOI8TrNZaYUe5YwdBvcldDpZlLaF07Tdk9KJnqqSUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/Nta+70iQp5sygj5KWBvoIjhYBcWYgkBvnjqHCgqTw=;
 b=L2igpDNmwUcNq2B5Ofz+7sXiIl3pRozeMASdL5qCq8EtIqeZVvB6gHE/S246L3evn9fCU9ANgOkoMnJYPpTtdyIIGpXYq85n2WUrBK9FNYWT/WKTmj/Xx2UzmZlnR5tvjYI7l05imxdkcssjEDPzYye4ZM3yXIF0nKf5V9f7PL6iDOe/sBSRNNQSXkxPhSP+Ko4uoxRJVqfPo9s08LQpEINmGfIGWz4jMukyMiGB2bQzBQX3DU5Ny9rlyPAiG52Pz3SH5ZK2sv1LacSA06pJumx5hG1gOM5iIXq7nhCdDtV6EdGiV0bxwYkpYAMbjZp/+BnjCmxYfAqYZFtkfyiwwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by CPH1PF95694F931.eurprd04.prod.outlook.com (2603:10a6:388::3ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 18:49:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 18:49:51 +0000
Date: Thu, 22 Oct 2026 13:49:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <atpaxMsMePsh69JJ@SMW015318>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>
 <atpGv_FiRlgPh4-4@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atpGv_FiRlgPh4-4@p14s>
X-ClientProxiedBy: DS1P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:44b::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|CPH1PF95694F931:EE_
X-MS-Office365-Filtering-Correlation-Id: 48760b60-1375-407d-d8cb-08df306d40e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|261022075727099003|56012099006|4143699003|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bBvoLjMADtzU0qkzXzWCIqaYn4jUHWD5CErD+VX/5SzPIRD1jMH9se4PcPgC3t3DrkS0s6yvj1e7oAil21tlr07ZBRToj+oqF2gN5zkNJJaLR3gScyOtcgzWWL8j/z6X2UfJI8/jHYBb3wnrB7T/LsYqJPpSzrLsFmPxlRrCp+wEi4z21fClx5wlJga/hXbRmPLXg9UHjNDSugtf/sT5s63XT1Am9WZRyauNnYazFalNTGvyj/mwIA4r1azjzMxq6D379Lviy4FfNUBGMOLiV2b13x6iQEGbElWZBLF/hmrmr/7hiVY9VPRFiG5L63BOjyo7R/do1+xy0rysCb8sH3svxPxmLBOl8sML+rmIhz+5lHmOsjZfGPbJMsv0kINjfu0LL6am9RGzkxuoTMEptHfKPQNkW8R1y3P5gnVpGSYM4h8REudzBr53Eynk7hkS5g/CJIhE1yU8AXsS7zO3xCByuYAO7+g17v0mI8w6EaHrYc6DGpB9s+Y63RMS5n+mUJLGxGAl0iwhYL+waHp6Xi6wbDT5o/loRQg0rSdHJJEqA2+uIeU5NNYIyf/RLYBLDwHcRBpkz62MbDoU5424Jh9ZKv17lidu9pfe/4ylMJ1QRrRYSu9sJQ7vKvwTTSTBdOauxvDrVRQCNx1/yQThJZi98zHEt8rmoWFzNVH9uBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(261022075727099003)(56012099006)(4143699003)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MGSJFsa/uaugL+I1p9GFTzZtA4tgi/COUcfrkdzgxZ/p+1YlGjNhis9H/6qS?=
 =?us-ascii?Q?sc+5JZBrga93Jp61lcEoy1nqk/hN1j6yitb27VyluZpyG2UyEuKZkc2R4LqF?=
 =?us-ascii?Q?BUv7/rfiwxyBSnP49gsIJU5h9clmix7OOo45tgnlgIGUmufu2dNdEcKuBu1e?=
 =?us-ascii?Q?iGaLI8rWkv2Jv6ypFsdz3EU2faJdRZd4pERkI0XjOiDyXstbfigsmzr/lLGH?=
 =?us-ascii?Q?4G/1U+x0ZP3qv0MGe2p+mQJkNM2+OTY7UcYF5V5HuhAxj38LZ4cqAAnGA2gL?=
 =?us-ascii?Q?RjpnDXZQiyU8gAM3ziDTLAcOJ58YX8mmoVNhIQg5LBe8n5JoyWUfrQJCGnzs?=
 =?us-ascii?Q?kSRtbiRDF6mps2jI1jsDRCY/ls2vw8PrLFhg6FTGonu/GeAUEE9Ay6dJzSK4?=
 =?us-ascii?Q?oEI3JumXhflcgZ4ZLZ/LC/zUybAsXxoT7K0lchwNyAnDWevPNYCMnUGmtJtf?=
 =?us-ascii?Q?9BC0aGD27w32Uub/ly3ClZiYJFqxP7uA1ZrMGJrkFIEcRj7M7brvPDYvwUFi?=
 =?us-ascii?Q?fvz8hwgcIiSO1y0WokExBOwnkH4ZaOD6+aXUVRpTKpJxcRnFx+l2mSAmPo5L?=
 =?us-ascii?Q?i21JpJY4xKgTy+WDXwbS63EnP8R3qTs7X6w5sFesDl/O7eL0NGM+GHHX2NLw?=
 =?us-ascii?Q?eHp8wqToYZtXJad2YFC6gSv6w+HdFjDe96CmgjQ6Owj4ktbGARTO2STWOVNp?=
 =?us-ascii?Q?ncXNsiYfLmZ49NYR5paiTiDT/kvqZltAqke4gSYGCWUP0NBX6v0wQI73rbsB?=
 =?us-ascii?Q?Gu/T3UlIj8Tj2lgYGKygWJW5ExUp2twNEOPti/vakrPWs7Nb4p0kxDGqsznz?=
 =?us-ascii?Q?FtzNvFfHBxlCOWocTHZCHHA6rjqDo/Rr8JAzjYRyNiRQiMod0SRArtvfpIum?=
 =?us-ascii?Q?8o1BHm8VHVcMEc//zzkKKrYGxIcMUeNweswhWc+FBbnrSQkdjbYHPJx7pltu?=
 =?us-ascii?Q?y368f8M9PX6mf3tB4BDCUP2xnY4MCHGU1yrfc8UU4Fho7T6UZiG6Y8HYFLu1?=
 =?us-ascii?Q?2t/e09blf4tdLsC7JnPscAGjE1oDd0Mpex/A0zrXKqywv4gXqtqQf+ewb9kO?=
 =?us-ascii?Q?MUwLYe2Obk2GJO9/No5ulDQmDyUrNDi0LnmpdBXOiAwErtdjpxUvWsjACidn?=
 =?us-ascii?Q?74iC0Fcort9vQ1vBqoyzBd7t5CNU2Ppwy/9bci8RZKxRgb9jEHJbwyLLNhdz?=
 =?us-ascii?Q?xS+Sphj/60WFYekESwWGghBF7sDelOEeYzKc60MGRSOLJaAWja07h1Zfr1Tn?=
 =?us-ascii?Q?jEa+gclGu7ebff9f6DppJjNuSuMRL2Ev1rn9+od+ma2gXb9/Sl2UXYudox2X?=
 =?us-ascii?Q?R7/Bvg7gkosyG/A4S8JrmlObmFq9QqmaVL0j46OEt/eIGafW6yAEBhw8wt5k?=
 =?us-ascii?Q?21UJEhtyrrED8zU1pLRN1P0TqobLdJnOKVJ4wOsNtd6vme72XWGbStvUGs3e?=
 =?us-ascii?Q?tDEiGcb2z2gFgeLxOORUzIP5+ySss3r1KZo4eaeOhOh4NltroG40PJoLugRP?=
 =?us-ascii?Q?0Edr8d5V4RbVtqbMbnoZPzSz0/mHg6xdm937Ml0pg9CGX0pUpqpxmxTL5z1J?=
 =?us-ascii?Q?MIHREC9FpLZDNDHUHbrh+rE3gNc1exbv4Cy3K7lWdpu9gBZd4e8uDzJ7Q2Bs?=
 =?us-ascii?Q?6Lo3Md3NM5+0rtOuZ1ESG8EPDT8947BhZ/VMyjMDYe3ixY4av6oJZaRiB7Ph?=
 =?us-ascii?Q?zc6hFRHHq6JuUjZV+RMOMM6NWbLZ3eIt8MozzV4zgQkCiX/YVPXdzE9Rjf21?=
 =?us-ascii?Q?jcxd2auGueNJq9HIKK22cIpPVGH6K9iejIH6N4TPf5rRq54BAike?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48760b60-1375-407d-d8cb-08df306d40e2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 18:49:50.9918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAkADq4zL7a+1WYfVZ8vpTxb2EoD0uTyte6UnQmcbkILYw1W5qdLBa8vLmIPYSIadcU8LSM/M52YTgGGYNuStE//OHOMEupo4ICT7FOExmULhibpG1VpW00TZUCk7qJf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPH1PF95694F931

On Thu, Oct 22, 2026 at 11:24:15AM -0600, Mathieu Poirier wrote:
> On Tue, Oct 20, 2026 at 12:50:23PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Move related memory region to overlay files.
> >
> > Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> > to be used with the mx95evkrpmsg system manager configuration for
> > remoteproc and audio over rpmsg-usecases.
> >
> > Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |  3 +
> >  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
>
> I will need an R-b from Sascha to merge the above files, otherwise they will
> have to be resent separately.

I will pick this file by myself. b4 -P can pick subset of patches.

Anyways, I will skip it when respin patches.

Frank

>
> Thanks,
> Mathieu
>
> >  3 files changed, 84 insertions(+), 31 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index a80cccf34eb56..f3b19f3b1488e 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
> > @@ -984,6 +985,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
> >
> > +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> > +
> >  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> > new file mode 100644
> > index 0000000000000..c3deb277edabf
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + *
> > + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> > + * configuration for remoteproc and audio over rpmsg.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&{/} {
> > +	remoteproc-cm7 {
> > +		compatible = "fsl,imx95-cm7";
> > +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> > +		mbox-names = "tx", "rx", "rxdb";
> > +		memory-region = <&vdev0buffer>,
> > +				<&vdev0vring0>, <&vdev0vring1>,
> > +				<&vdev1vring0>, <&vdev1vring1>,
> > +				<&rsc_table>;
> > +		memory-region-names = "vdev0buffer",
> > +				      "vdev0vring0", "vdev0vring1",
> > +				      "vdev1vring0", "vdev1vring1",
> > +				      "rsc-table";
> > +	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +
> > +		vdev0vring0: memory@88000000 {
> > +			reg = <0 0x88000000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0vring1: memory@88008000 {
> > +			reg = <0 0x88008000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev1vring0: memory@88010000 {
> > +			reg = <0 0x88010000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev1vring1: memory@88018000 {
> > +			reg = <0 0x88018000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0buffer: memory@88020000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0 0x88020000 0 0x100000>;
> > +			no-map;
> > +		};
> > +
> > +		rsc_table: memory@88220000 {
> > +			reg = <0 0x88220000 0 0x1000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	sound-micfil {
> > +		status = "disabled";
> > +	};
> > +};
> > +
> > +&edma1 {
> > +	/* reserved for M7 */
> > +	dma-channel-mask = <0x40>;
> > +};
> > +
> > +&edma2 {
> > +	/* reserved for M7 and V2X */
> > +	dma-channel-mask = <0xf>;
> > +};
> > +
> > +&micfil {
> > +	/* reserved for M7 */
> > +	status = "reserved";
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > index f82e149323d34..3ab679e5a4740 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > @@ -189,37 +189,6 @@ linux_cma: linux,cma {
> >  			linux,cma-default;
> >  		};
> >
> > -		vdev0vring0: vdev0vring0@88000000 {
> > -			reg = <0 0x88000000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev0vring1: vdev0vring1@88008000 {
> > -			reg = <0 0x88008000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev1vring0: vdev1vring0@88010000 {
> > -			reg = <0 0x88010000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev1vring1: vdev1vring1@88018000 {
> > -			reg = <0 0x88018000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev0buffer: vdev0buffer@88020000 {
> > -			compatible = "shared-dma-pool";
> > -			reg = <0 0x88020000 0 0x100000>;
> > -			no-map;
> > -		};
> > -
> > -		rsc_table: rsc-table@88220000 {
> > -			reg = <0 0x88220000 0 0x1000>;
> > -			no-map;
> > -		};
> > -
> >  		vpu_boot: memory@a0000000 {
> >  			reg = <0 0xa0000000 0 0x100000>;
> >  			no-map;
> >
> > --
> > 2.43.0
> >
