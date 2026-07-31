Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B87D3E8340;
	Fri, 31 Jul 2026 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508506; cv=fail; b=dwocd6jhEaB56MNgeNR24CktKDBTVu0aJsjIGQFvO+1VNUd8HXMbYMYbG1h7fWJbE/Hmko24KfG89L81OTFlX+KB+151O//bmBiAlEFfQQc5rSdLTWnuokh64IpmrDvyNv69UGPZ5RFoInhx07PfHZH+SvYVjjF8OPSNnNwDutA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508506; c=relaxed/simple;
	bh=dh0P+93L51GCFKh+rO746awBEldTxRICqKOYXZ0Q0r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AXzgxdpvP5gM2QFXWdaHmKPyxtHd+r3/kC889kAx5TfAPwZ0Qkaxz2k3TsgQWNrR68vcWQRtYq0OSkvHpKBTOS4VebyqPyYF/LtVXyVazaE5v4eXpUKBYYvc6dsumf3kYX6AvlhMwxLpDwNzs5sWjKK/lQ8zR8NS932pzdnSzIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ue4Xa/R+; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ue4Xa/R+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkyFM2M9tYWO5/l14ia0mQk4Je16skcW2HwGBfVP5Mj9k0Ujo1glUBMp8fyAYbspmxMvxWvSVs8694JKsXc7ZCJ2JTrGXQHCWMRo4K8zNTlwX8JVMLYqVnRzHG77CKiEdRpwjWbun7GwpFOjVcCncJDeoitFJd/dMyxCctyR0DM9IdZAFzFxWAANah3bT9NEr24i738t9ahxCIFOKhiBbmWxDfcLCZkm3FUhW1WAJgGYtH1rJDNK2dzhuRVxtZsuzYyU+m8ACvmi/wxEdc6LluheZEXa9wqorOKd44pp9sb6T9Fjg0UIX98SCGwUxtLhb2fihXhnga20LQ5B8n6ppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkkF2QADZ7tjd6CuduAI5HuDQ1qKaOJGa1srS6n09ho=;
 b=DrUkTdSRIqzPmV6x3T4ASzokO7ovBy8qp4vFwfKNkiV83FVEctQwQsjHDpMEDkHmdg7ZBTWgWFsYcLsDWdEhlnGRod7BJ3ihM/+7FDGAeT72I7+rjQfe10n4iws+eet4aYrqYoYciqvg6Hr0e4Mh2s2lwoz6wbYteqKvAtVXaGr2S+9atswVFL3b8QYuXvYQgmtN8K5ZDnogsIBSu0XFdPUEgmwDI4QAWQCLN/o/c7muIfhJ9ERikC4q8COUBvAPbrxyZpoy0DBRcRYX0WOshaar8i8bHAGS+0zeHbzu1KiAapxycrFEGC8qZIb42zCRKfAIr+n+yNBynXWwXas58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkkF2QADZ7tjd6CuduAI5HuDQ1qKaOJGa1srS6n09ho=;
 b=Ue4Xa/R+Hr84lCYZTx9caTOQ+aO3NZ6XK1LzQYfQetHKtalTdakhONKUUQaEUW3772Bu+2b9wxdQRQdou9t+sHr+438iWfJQZmKSViFS11jjerps0ZDiAPjl9k7gGNj7lUxR7EA/JikbJQYrhXodMcDpNZz8Fp8rFMD2KuG/0V6t47hmruqAIjGwoqQ6USFFEvpNDZTjSeCi4zd9hECQW2YC+xmXHrSnBSgkSIk9dcI90hY8iiUhO5obi56aL8cImeWzf1UxEIWjrPBKyZnACL95s9cY57R1AXtDInVc5WKnYy+hlK198i3GpkmVn+0wWk8JwsZQVZBm8VdMfTdt/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11032.eurprd04.prod.outlook.com (2603:10a6:10:58a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 14:35:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:35:02 +0000
Date: Fri, 31 Jul 2026 09:34:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <amyyjM-LOw7rVNnG@SMW015318>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
 <20260731-merciful-whispering-serpent-3a8eef@quoll>
 <5267c0e8-e20c-4e9c-a1fc-da27433e8523@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5267c0e8-e20c-4e9c-a1fc-da27433e8523@kernel.org>
X-ClientProxiedBy: SA0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:806:130::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11032:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eec6497-b7ea-49d6-fe8e-08deef10e776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|19092799006|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	WwTiirl3kYtYhtqRQqOazH+knDtNp/LF+Nt/PNZ1iEvSKJ1phjAJ00jkD2YHyPJL8zPM3DbMZalmdY6DFNThlJ9qw9qIrVwg/TgrqstF+aTbLE5Rpjz81QRveR56UCA032N8RY1GugJVv/+vMlNEJA93Tkfe8BE+P4wy+wa9eT3CoDpSKLXj6ys7Q1EwOqsUIwjGqskSB3hXr6nA54/axJhdxkFWfpn0iXG/5ATL5o0O+Nk3ZntURsmDIPpvqhi9uNYI/WlOSejqN2LdEjLBQi9jaA3JnrAd8R/g60TS2FxPX0AjokNatDQM6AZuxeGhYlEkiq1s9f236cFu4G5+NXTRwatUz7IsLWockLedir4ksj18TIZdWdZPsvFeg5lxSvVyyXoMUTcEH2rsU12ocTz8GXf0m1PwHs5LrU/S1NSPoZBJQ/+wbAPKPtJxIhjrovNM2Cg3uNzKLcNtdhxAHxLncwPZj8hJeQ9FkO+awb5B0pHO7lQqaNR12NODugfTel0IYWnWu30kvcvJBxqMkRyQyYsW2GaST3bdPd+wHdn0iXOT9d34bNmiTAKws81Ba7oRUlK9l6Pqrwgxx1Z8FE27ubP/ikbXmXQXNFGJZ6GdM9oDqZZ9WNCnW/xe3fkXwy8IhvyTFOu87WI4AhPcdeFO8k8ZI7QOOV5yeGYLDXM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(19092799006)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+wesstRqGeuNas/JdJMGI/gc8mhBtQMH4ozi0a0CNbTHlmyRFKGX46XipYcZ?=
 =?us-ascii?Q?YU1CJI68MhxX8+pMXLJ3ghF0qCvWcTocFAUHo1Zbc0tmPWi1ZFk61gBX2Yy7?=
 =?us-ascii?Q?x3OFgpDauTJxzuLETLZZYa4G6ah7i4ZvxjCba1uJ6s0PptvEKeODMk/CtdWo?=
 =?us-ascii?Q?Ho79yc7YsRDU+9NEEs7pVuiBEBJZKDwOjHJ6BukWdU0NF/fq6gWCtiHpeJGL?=
 =?us-ascii?Q?+KxDZJhZ91J9Vj9d386bCjuP9QG4D1R93jblnsFJ/jYtyurIyU/1qxMX+HOO?=
 =?us-ascii?Q?OXxUTLxnIMwV5acbxHqy7VyvpdTOHmoOo2noXRb9R8ABev96FJJGyxllxPSH?=
 =?us-ascii?Q?D/v7PU40DAVy4861RVVhHw5fiHnNuYusu8aGEfwVhG6MIN+JxnOIm4q5N3n5?=
 =?us-ascii?Q?gnpAgeAZ8ofyYV0ihWl/2Hug6bk6ONReoQSZw1OHxb+QURC4O3Rcnp8ekyXW?=
 =?us-ascii?Q?55CCko3qGl1365JzIFppez4IUqv49Kc1LRwKVgaKCSGfQWkIR2bxuOWB1U6b?=
 =?us-ascii?Q?bFGuvu+yD/q9xZ8vP923pXqVcwbk/Uy9kreIkf6BFlAerGaxK8LS9H5PdZRf?=
 =?us-ascii?Q?saq10ARCR7YFxQJpAHUvn896Zda1Y+pYlSrfq+RLzDOnAjJfftO8+2LpRf9p?=
 =?us-ascii?Q?g9jwIzkfn1rpkxPPxvIxmUD6qz9G1FydF6PQk33OSK6bTsxRRarflnDvJEne?=
 =?us-ascii?Q?csLU2WfcibdplEKBNbXO1OO9i3d5F+ETjn2KQx3ZEGI0jIOvEdAFBlvlRuS7?=
 =?us-ascii?Q?4El2p3kgMGHepVLD0WRcaPKHyy1zKsqljsbnboK5QminHbp2aNMcqsJiD7P0?=
 =?us-ascii?Q?ltFp0tlmNIUCE0/CN+kL5TvCSHs8ofpFntNChiGJU7z3zcnRYAc/2uRmT+y5?=
 =?us-ascii?Q?iCaa8hoP9oo6i7GhPkcLRJPfpEqmVr74lPY+SPpd5Xv64WBK8pnNT1WNcA23?=
 =?us-ascii?Q?alJaNb1XI1yl4ChZmXnJdHMbBn8TIlm96IyMUH+TSsp7Q+tJWOr4nWrbUF4j?=
 =?us-ascii?Q?PSvg8A7UaNHAp/XP2kcERe4C2Yo9UcetDwQFwpUKqaVacFzr/l21RowMrycU?=
 =?us-ascii?Q?/Q9bsyBlTJgqeHoqAVNRh0kDJK+z6Kt7HHnH3IsxT05nzXWxyw1uLsNdmJa4?=
 =?us-ascii?Q?r64ZQcU0Mh097gPkF6aSj8f6LUhkIXZmehBumHxLu1QNJnl0S0yD70PnhSD4?=
 =?us-ascii?Q?ofFhHa/aXEztJJLDwCRIFwBzfpaKU2csKbaBFfQ9OGR9c0Njh98fQeEWoyRk?=
 =?us-ascii?Q?W7gKDtKnLTyQqKmYyICCD5yd1ECOIvBDRc3jDAujecQg2u8HBE2jrJwL92CF?=
 =?us-ascii?Q?gBdNHsX5OFpklV9nhrAhlqm7eCQj2m7Re5c0/qFwM79X5a3u/GBP/QXYXcZL?=
 =?us-ascii?Q?AtCXJgizd08dWFNLlzt0jA2LzdmQy8iBNyjqyK5ggRMT3yHOIy9BSB6zigIY?=
 =?us-ascii?Q?JkufZeljOsUyZQcaYxDvGZe/+H1xaaq5/YYT3a7bONw3CDS6dZ/SUcWnmBzV?=
 =?us-ascii?Q?7ieZfIzSICd9vBfxfc7CdPTVNphxOjg8ggcCw2d5p8kQYLF319dfSSzPOBw1?=
 =?us-ascii?Q?4ACnm2NSL4rndq8/iOQYVrkBKidb9M9vSWJ9A+ulnzbozdwafRi7lTH+Nkcc?=
 =?us-ascii?Q?zud5FIJ3DJcAL6o6PmehZXQfawsYjWoRF5DqoRZRdzM44B3JnevLbJ0Z7DM4?=
 =?us-ascii?Q?8Ggx6afxoFG8h9pFE+D4XBUjOMdzhHAV+vkwi7OyTvlcEjR55PFLFeGtUMrU?=
 =?us-ascii?Q?pMo91O3AEUxCE0CEa++8+UnfC+YwYqpFMN1Ydc/9TyN1y7TP9YSL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eec6497-b7ea-49d6-fe8e-08deef10e776
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:35:01.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yjewblRIc4wPMmGeqPxLldj6Ec/KSfov7owjKAztpGj52dVm6OX6Bu+VuXOyc2oHMMkqPODJz4U2yOA2jskOvhPfJ7pCyovP1mLPQdCrdlEA1ObI9Fd3d3N4eySnkqb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11032

On Fri, Jul 31, 2026 at 11:39:52AM +0200, Krzysztof Kozlowski wrote:
> On 31/07/2026 11:37, Krzysztof Kozlowski wrote:
> > On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> The carveout region names are derived based on the DT node names. Because
> >> of this, the DT node names are ABI, which is not supposed to happen.
> >>
> >> Fix this by documenting an additional, optional property:
> >> "memory-region-names". This way, the software will have a way to build the
> >> carveout region names without relying on the DT node names.
> >
> > That's not the point of xxx-names property. It only serves as a helper
> > to get the resource.
> >
> >>
> >> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >> ---
> >>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> index c18f71b64889..8e3e6676a95e 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> @@ -62,6 +62,10 @@ properties:
> >>      minItems: 1
> >>      maxItems: 32
> >>
> >> +  memory-region-names:
> >> +    minItems: 1
> >> +    maxItems: 32
> >
> > This cannot be flexible and unspecific. Why "yellow submarine" would be
> > a correct name?
> >
>
> And I already SAID that at v2, so you just keep pushing this without
> implementing feedback.
>
> NAK

Thanks you review these patch and I already sent out suggestion, could you
wait for me check it firstly to off load your work.

Frank

>
> Best regards,
> Krzysztof
>
