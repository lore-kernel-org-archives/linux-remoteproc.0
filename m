Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397FC3D1A97;
	Tue,  9 Jun 2026 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029138; cv=fail; b=av7fG/Wuya/KB4McjyzzE06lPS8woNOLJPyvj46BSzj7+7zWN/YDYhqqoRWpFjzGBtHDOPUarLtIsffTdJQHajNQu67iW3iRrQv9HkBH5IDHpK8fvDJ0fjx8oMw2ZKfHxt3zHSYtv4TeYBaRzm34onWpSRHdSf2SU6eDuBsa9Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029138; c=relaxed/simple;
	bh=1CnAhJY3CQFrfYJHG7jh4N6/CeZeW8cG5tAOu5EW3yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o3e8LDFMRTtw7gzw/lb4pZEM6KB3ITH31J73S5RfzNcI4t1eY4cvGTgP2ECdvY8Zw8Gy4U5OFBEs9nVm9KtBDj8TdQbkFSMUR/iKuYkxVVV18jZlE6pIat2CAwSnSv/UaSeZE61kUpgI210igEhblE6wox/D5rVSDju3S1yCHME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vqk2o/2l; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vqk2o/2l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLcShSUve3C2g/oZrKHHKWi3ZspZyAOOevKCw7OIXgvJcTkJq6K+LMIUB6HF1SJRt4ez6O1goneaiJCXuDUK3IBzV335S3JaZ6mrr5fdAtHuJhyQaMJpvcrh7O49ZxULBCVTwzPw/8l6NAJsN8uqV1bWopI1BRYPfd1o+MVMCSw/X2w5XqZB5YaXTnlCLL894up5VZvhAnUKc7k5nvsYx2iIdekmcnhGXJF/vQ9ISSZFmpzEEQiwQvP9MgscT1bSZ3phSHbUPnikd21y9aAxwbBKVvcIjj2jZDQQN4fB+qK2NuT0I2SBL34TceRUB17/wdGB1iRCwDIlAzikwLS2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqnvk+IqNSgxtN7lgrT9gTWIrgCsQaSWQxoR1KyhfjQ=;
 b=XkS25RUR2GdX3Zm3e5dP4UlzCxyCyxhXeQE87ilSL/y6KQIWKCfuEmStzIsMcXt1CBlByf+aTv8hX93mNC3NqnztvcB8eF8T9R7AyFxr1cV8Mtr5oUtVaQEp5mK+xRqt089xIyzz66tEtXr1bSIUpgst/UBO29M6s0ZfVoiVC09cRre2soa+qlz7Xouj0IfmSPaLndif35KAyjQieQ86uCiTbIKj830xAX/h7T2P8aex877b9rdPBeANIe3mHVgzTn56UcCfii7fLwwsnVf+Qp+qgQ13dUZyhXXHSjzojmFFoAk8WUN96AnnBdoTy7U1DZClXYbQEL2zUBH8tcno0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqnvk+IqNSgxtN7lgrT9gTWIrgCsQaSWQxoR1KyhfjQ=;
 b=vqk2o/2lYYeAJYZB4EgEJwAkioQRxEW0Dvlgnepab0u73jQPejbwU3Il+R8NLuj/uCIhMdtcTWRdJPXGPZCqRxC6EaLca/VvL0pEn3p7Eost4MTXEoUDjxmok0Qlu6bDVRxXxgzf6llH63MxtUxpSSvkkwIXJ2BZ9+c4zVhCdcB5iYiFXp2SLpVq3L9prf2Qp1obEFXy483MkYdHRLpHncu5Pw7GdjEMjI9QsUQ6UBzDqDoVhRwKHjNNfObS+7LTJZrT6ypIWpluy5mC+soNE0mKmLz/NesRQ1jLCveqeI/WOjm8Dhv4O7BudMAietucpr9GRW0SwEtl0J8dH9NVZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB11013.eurprd04.prod.outlook.com (2603:10a6:150:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 18:18:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 18:18:52 +0000
Date: Tue, 9 Jun 2026 14:18:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <aihZBB0rMob3a23f@lizhi-Precision-Tower-5810>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
 <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
X-ClientProxiedBy: SA1PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB11013:EE_
X-MS-Office365-Filtering-Correlation-Id: c87dffcc-34da-47d7-e35f-08dec6538f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|13003099007|18002099003|22082099003|11063799006|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	OGR1q8gZ+tKX1Vpzb8h1ITLSH05LXzqhnzrAHWLf8t7cYpDGKGkFzmziziZxu92T9dFovPELGzD3EnlwzhAQhd/lIbA2ygVXshFH9O8bkDDRO0jw7WrKinSrmsHFE4XV9MwOrztAbP5i3Z7MJrLMiZZX115n4AipA1eghNjO5IS/kgKT5RnT9MSCcTaMUjQG0gu9vCxP6Gdp/5vijXS6uckeG6igRyumZnWnDK9LN6AjugyY5NIigzYlPj/8Bb/5Q4B1hDRRK5XsMYcRgrN+r9Y3Iqzsr1Ghu7Kuna6PbZ5qjFs+NPNCoZOaqJ2XQDMrLZ1Zu215kksRazVy9JtFbHnDXxDVUVfKzuRBs+g3kFkbFXbe4NtQv5dmg07NKLPkxKy4p4JF4zBV+0sblXUM2JHdBzbC62JXB9aQ5puuFoyNqQbCZ+xPxSLNQ0tWeQ1VOO+LqpUEF7qsdivkDAQQDOuCjm2JcnnOkjv38U8QCj1v4gBCDyDoBFPkNyWiGmCNnBaf/o8jhJJjUBuS5xxL/bGnJJFptDH6lY2gsnViOcyGXid5uYmXmJbN5qpi0XeBO8X1Zay+EgGlnM1qWEVqvPe09tOquBCico0HFmL1oDZh2KJrXHL9R5AsqIc8N30GWi/f4nUux3t1rVGuhPMKlpnKy3sPL8UKCZKYwtEKN3CTo2hkLNSzG0KFa5+8jgK0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(13003099007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gTNDpuVln3jS//dtQWkibK9FMmAqe5RXsf/87zm07z0O/FkCZv96kAkW94dL?=
 =?us-ascii?Q?rMy/MSJcskpOO2AQJZvSqidr/Mdn7guHQjScOWjGXXHH3ud28rL4z5wKSsnU?=
 =?us-ascii?Q?oUVVqaBTJzgunGUH3UmduRvUdq0gqJS96vFx5GgiRK3BAs83gnhCjFDOOvXO?=
 =?us-ascii?Q?/uNEI8w4yDsH+p5HlML6+S1lpGnaBKeFWLGPoOYKiOcqj9cZumAyQzjh8Xky?=
 =?us-ascii?Q?rpOGzIUOZByrP1+Wl/Zzekdia/38OFDGPFhgUMSxuI59/A5bBJBToPzcmdyw?=
 =?us-ascii?Q?4vqkQ7ZCkZJJxwViYnCShymdyrX9ftmKgzDoAJsuohLAheqRgOUEQzGi47vG?=
 =?us-ascii?Q?0m3T277ytnF7fhGTRRCrECwhxwFE5Sx2nX/yY/XE2dhHTT0f7pYsVgJqYh1K?=
 =?us-ascii?Q?LgNawYCu+6MrQiTByHjbrdKu0FzNLJg2+yFwNLaG4b/9Kmkgxh9oEQL8G7bJ?=
 =?us-ascii?Q?dzmLCiQsg+P8x59rkefjFGF2f6vEY1BPAeqgtp/nCfxiLz2YwZxyfv04Zkut?=
 =?us-ascii?Q?2umQcp0JOQP0ec5IIOZ0VSJUgYgusTYVgemtfyujbmzQFGIt9duBFpsM2PEn?=
 =?us-ascii?Q?t7IK3t15oNdHWELyo4wggOrG66ZObXYhwZ445awUw60pEnnmPSWGEJNNFdxh?=
 =?us-ascii?Q?Qb1oZVtcs+4/Sk12ERXcffBR8pwke9/rh18xsYjzmfpbGlRZHG6UArAKd1/L?=
 =?us-ascii?Q?k8ls2DO5WQAM7sVJujTUO89+TRWuc3YLGHMEpVISIKRtRKPCboZbvHBaDdpv?=
 =?us-ascii?Q?+WutnbO+czf97JNyMUadD2TnUmKC1neF04NsFScWNr+P41IpmCylly13pP0u?=
 =?us-ascii?Q?XVeQVianq2CT8mGuoYC3TTXaDHxuELXOQRu7yp+yvOP7CCU+SzeT7Ct6eaMo?=
 =?us-ascii?Q?Xe/sqYuTq5vgBuIOOemp1SQtvr/CN1ZHIxXFrAUUGOmJbSW706BqQREdQPS3?=
 =?us-ascii?Q?XG1Z4KBO/GomXpSkGjabP7DxlldHBJc5uqOvg9y3tInNpLXexc01EtpQdhXO?=
 =?us-ascii?Q?Ce/bh/LVskA3aaomdQqFonb1UfSFIKRPoRH3noLn6yx+Dusv1uuTj/pgiTeg?=
 =?us-ascii?Q?TNXQaDFONMLCC99pZ2Lx97bLXj6HjCS2nBD/pXAmEh0vGIvQTim4FK1SEtBa?=
 =?us-ascii?Q?3ObeiP2lFnuXpjdZvTqKKUZoEQrkH3dETb6vcvqbFNq2Nh9Vju90OQW2pmwV?=
 =?us-ascii?Q?ziCbeNs/p9hHr3IOFp9vnSSVKXz/yWtzcS/4M4FlAZ+6TnZcT1j38hWq7TS2?=
 =?us-ascii?Q?3rzC6RKzeAJE6n8yzC0AliYk+I97UTFNz31KXeXS0Nv65gpEEQPyFPZuKdGX?=
 =?us-ascii?Q?VwueSoY979OcYp6wJHkC3CX4arWwSLf78Ev4JS7/2zvEk5QEfS7ahLBbDZyC?=
 =?us-ascii?Q?H0T6EC+i9qApVHknvkpw5dE/8wPra3ytCA7kN112r+KmwZo3k/yjTyViNPOk?=
 =?us-ascii?Q?7PMvxOPSnoVf9wN/QuKrdM5zXGcvmfh0SWB53huwJ38KpYyRg9M/aAHNmzMi?=
 =?us-ascii?Q?zox8G8kvnMbDtOzXvFHnh8kz8/f31SxsHtVYhQ99/aHudhOGxx1nZr2o3YeP?=
 =?us-ascii?Q?VRK2Fqp6NaWxhOXWhWte4aADKha8yt8ALh/fkRTq1HEzFXfXHF82/pB63L/f?=
 =?us-ascii?Q?J+RsBd4b2QaqlIuzeFb6CxIIz9bXpikpNvI0AGFt+++xcYjCMuGMLdBoO+h5?=
 =?us-ascii?Q?Yp5NQTAvj2X+aLxj1UdCZjlQs5o7TycmRvSXJhrrg4U2HDSmgp16WkMJCw7a?=
 =?us-ascii?Q?NyK/o/VzI9SDbjcUbAlS5miySdIVeU9fY/JQxtpBmoVFoPPSy3RO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87dffcc-34da-47d7-e35f-08dec6538f81
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 18:18:52.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CA2pU0oobHArsCfzFBQC43xJ3+x/kpAmFktLn9ayLBo6iD2ApV5F0gTCIvoSufuz+BXzsW2E1IfRd3Q2YD16XS/Og9DONvTgCdocm2GMRMORcAdro45f1XeXmPkQ7Npt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11013

On Tue, Jun 09, 2026 at 11:33:03AM -0600, Mathieu Poirier wrote:
> [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > >
> > > > The names of the carveout regions are derived using the names of the
> > > > reserved memory devicetree nodes, which are referenced using the
> > > > "memory-region" property. This adds a restriction on the names of said
> > > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > > specification's recommendation, which states that the devicetree node
> > > > names should be generic.
> > >
> > > I don't see what is so restrictive in using the node name of the reserved-memory
> > > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > > will you gain with this new "memory-region-names" that can't be done with the
> > > current solution?
> >
> > DT Binding check can't find such wrong if node name is not what expected.
> > Binding can't restrict memory's node name because there ware not specific
> > compatible string for it.
> >
>
> But what "wrong" could that be, and what kind of restriction are you
> hoping to enforce?  What specific problem are you hoping to solve?

The sometime miss rsc-table or wrong use rsc_table as node name, dt check
will be pass, but related driver will be failure.

>
> I'll wait to see what the DT people think about this - I personally
> don't see the value in it.

It will align dt spec and align ABI defination requirement. Node name can't
be used as ABI except that is defined. It will elimiated this kinds
hide ABI.

Frank

>
> > Frank
> >
> > >
> > > >
> > > > Fix this by documenting an additional, optional property:
> > > > "memory-region-names". This way, the carveout names can use the values
> > > > passed via "memory-region-names", while keeping the devicetree node
> > > > names of the reserved memory regions generic.
> > > >
> > > > There are no restrictions imposed on the values of the strings passed via
> > > > the new property since the software allows any name to be used, with some
> > > > names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> > > > special meaning.
> > > >
> > > > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > > index c18f71b64889..8e3e6676a95e 100644
> > > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > > @@ -62,6 +62,10 @@ properties:
> > > >      minItems: 1
> > > >      maxItems: 32
> > > >
> > > > +  memory-region-names:
> > > > +    minItems: 1
> > > > +    maxItems: 32
> > > > +
> > > >    power-domains:
> > > >      minItems: 2
> > > >      maxItems: 8
> > > > --
> > > > 2.43.0
> > > >
> > >
