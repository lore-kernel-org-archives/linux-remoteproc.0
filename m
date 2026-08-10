Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB73842D778;
	Mon, 10 Aug 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786381196; cv=fail; b=N6sct2IAigxRZesuLLt/Ve38sIDZNN2AeV+WxAbYTYc7vSnVO4v4crj78thwx6q01DYKCUszFr/ggGCK+qtlRkY8ypmF5LzhAKpS+Ah76r2Uy6KlP9J4D7u1KC/PpAv4N6sQezvekPaLZyObgmAbILKS0CGqUJk9i9xZHa0IYLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786381196; c=relaxed/simple;
	bh=lCQKRultQX2qktd+1CfSTKwMEXofKBnmPE/mOvFpBu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YhR3aSxWbCKYPG0MhmykyLOPCL1NWQ15Sg1I4QVv1Ql4PIkiGEL/Y5xV7DCDaMIEOMgfOIJ6iywmeFo504nn26+JmkfauTuzy8XmtdOWS0E7IW/Y8+Oe0v/ctExVRhmX8fFtqY/tzdpMoacR6Pi/RTPtSfTMGHcjzYSWUWZIjmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QUiLiQm1; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QUiLiQm1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyiInBaU/0LbFLvK86Uh2s8dfyJUCAPC/tOR3+R6+Qal2Tt5h38NiKnILk4hCu4ZnVqeLKaI+5Sa8hiQkPlRfuiCFstd2CmbM5BjQQlkjUSEIF06e7o7bg+lafxPWR1vRzmBPiSAzNnsxe7KySUby+esrBnroS8LPtq+nmxOMzqS5+QF9pCOlGupIQb8x0GEchMIuztnQSvZzdPfyhhPk0k3b7Su03Fy309vQMbys4Ge+opsQRVKMYDJzpXPuXUq3Jrqc/Y8SHqwKkQCzzon+xfYiIcQBRBYN3Dek9rkyFpJyHYGyeM0Vl/mQfJH9xTSOSlnDA4C+Pzi/nNpp5SO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq1HWShj2dy+FswgkhnvBcCXG0s9+cNcUvUbFzImDtw=;
 b=nOyw7tS1vEEDa1p/vXis/jsYHnKrT0bnqoRPaSdh0gk+cuu1xmelI9uD8ZROW+4X8AI2HXHDLNqdsAXrHNaJuVZVIxAnDCXQx7avAEMdR18j9qL0ZL36/Mm4ybXRq80/PFWSWSEqahMb4HnxXsTmCqsRIX+yI9+ClAOSyhmrzXMFJjID+yRyMUim3fsxl2P2cr2Qg2No3v9mN1Bnu3U6965x8h48/H0039eIrzCJqlEXIMOvhMCeL8l6majVcBd0fJTP/IFqUmCKkE3oFxFY0QXHxpTud+XTx3chc4NQ28b/+oVhbSmLzCKRfVbj0IptjU2tKIWTYyKw4VshNWHQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq1HWShj2dy+FswgkhnvBcCXG0s9+cNcUvUbFzImDtw=;
 b=QUiLiQm16V94OjgAXvLaOtCYwH5yAwfxNA1le/dMLW7x6XYdny9YA1TMYeDOtsAdL7i3eNK65O/m+HEJoSD/bHOLgDffeeFPzj++bnNBTgnpWY5lRsewnDLCpxivvt4dE/qovCdVxPg0UDCPLjzzPMBMURA4M8Sx6OwHO4UGQ//shPS5WMMMbOH2eM5s8H7P/z4yNri96pAVgT7R9t1PzBWMSEhJAsIXXc4+rse8Sl1df8vvDkPpqKnnrkcsDIwrrlYcSR9qR/eN6r4rdSqiGtT/BZsSZt97SALXsrajZUD52OxgUKP7XNbX2J3SeNmHfGxq52yKwqWeMp7bvypteg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9297.eurprd04.prod.outlook.com (2603:10a6:10:354::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 16:59:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 16:59:46 +0000
Date: Mon, 10 Aug 2026 11:59:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <anoDeJ3OCPzWA4k0@SMW015318>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
 <amuUbkDM60eFzvJo@lizhi-Precision-Tower-5810>
 <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SA9PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:806:24::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: de9027c2-a464-4a0b-9e0c-08def700c7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0+iotYzC7HFCWpLmb28xju0iXgc3eZ2qDhztq2bGVI3a6mNaQ4q6mXmYQGae2YGaUr7vt6/CUeHaw92zF7J1eIrZBjAqnj1ckSsgC8GFTQ7fydo7vNql2FjuAY2+zVQuakrVay8jzdnS2V9Jha6CC4SUZ3AYgce+auBKotpOnRF4r8mNC/785x2udFkGPVoqFQxystMUOWPacflBO1NyxkCmqZTD0RqM9GFXTE24rH2TKsyRr7QUJfIIdohcLeOp6pU9H97VumKbrylMjjaT2K2bApzcLDijzlNb7uMgAAaN/pIny706+JWdI39O8jfOoauGx1VU87lc8mK9qdEfdI76WhezpFmZH1EDmxHQmJAU2IAoJV8sMokSENQLBu1T+aOiq3OTvShcs03aTHiUcpIkHwgLaDep3I1/Acaf9OHHJrAnsXWeDwEoGSRAB4L+BIhMqNfMOeC3iWiI2XDrXm3M2ZLu3WUk30NFHgm2TrLPJVINGpiex31o188pEVVVQ3WE+7WLgQiMuFJ+eQwZACUkSaZ247cAnK2/gRpuSEyuH8gJS2715Hy8Rftsm5/R264RAL7ZLhHmCSPCmfBM9xbRwC/uPTmcgEH8vdlSFA44ySFltTplHnchlwM2lyxLlkHZ19RCiOJxhAVV0fwUcWNO8w+hAHlMlN/aZ6UrTsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qh8tJQlJpR8DKQZHIOv4PVHGkzcDKYDs9lP/C5WggU9VwxgWkrsr2gPtIoJg?=
 =?us-ascii?Q?eMeZLjrIcilM2BUsAWWKQximmhjhyzxG/7q7NKmP6lm9LcDEQ6xTOTWd+334?=
 =?us-ascii?Q?wg37Hl/QQFzr8Q9IQKgW22EWGX5hQRByeRfj9yQkTAoJzWrlbVNj+feXrVj9?=
 =?us-ascii?Q?Xs8bFeXCaAZ7TB5tJ64P/L9Nv9QZqmVBxmwjpfpzdOkoVN4tXyMf3M2MHzlZ?=
 =?us-ascii?Q?1wBjOcdrrFpTkSjOSBeaxwGSJF63gzbNIrx9DrjjovPLzClhChTCdmzRrXq3?=
 =?us-ascii?Q?WK23sYLeBTKH9NTW7Vtwp3uyZ4NHbNujMP0C86QAW84I57rOOa5PnGh5EzWG?=
 =?us-ascii?Q?KZiPa8lrKcerrnWVBwV7BTglCMCHdQ6I+QWuc8kGl1Ny5tFZHwQUCB1jBC/R?=
 =?us-ascii?Q?+MJROL8ucuqOmk5Q8gSJOZ8fPyq/fASy6Kr2uYWmq3r8ypH9fGFpRNzYhA6T?=
 =?us-ascii?Q?qzL4gofM+OKfO+8vrrHuoAgQyv02zVe/BLMzGnR6irAl1j2HQvtIElEmVPFo?=
 =?us-ascii?Q?35jkm/VKo3iJwJJq7U57QScaDoHWWdCnu7Klus64akY/c5xybIiuCLShpX1d?=
 =?us-ascii?Q?qFls5ZYewdKMfBjwPVfKzcBR7fKjM/puFmHgxz2u+PbwBJUIRULJnu/ZWMeI?=
 =?us-ascii?Q?p87TwOcOSfKtLjMGbNQPhYF8cfYln9uCv8kLp5/5X24pnN70F7tlayx2OZuh?=
 =?us-ascii?Q?FQWXrrJ9px/7k+6x5jYdPMCzKFpRHMeFDuMEcVaC8u5QZ5ln3nuLteinBOpQ?=
 =?us-ascii?Q?72IdefDQLPCrnrxyxHW64HxJKwa2uGhmYMsLVV83hhQQuqTmPEL+2mRKqW2p?=
 =?us-ascii?Q?W0cUWWJY2lFpSOyqI65Sf54GpoeOhnpY/+IbLgZaaJr6bZRAPealQjyWsbmu?=
 =?us-ascii?Q?3/JLeqvHlWyL+ChoNspC6B5RmEr17XFD4PxhWFHuy/MwrCSUCtIHXkSB7353?=
 =?us-ascii?Q?LJKbPHuuR9Qnf/4VoOedWUp0kLQ5VkfjMG6H3RFrfhCb3FauPZIBbU3su7OA?=
 =?us-ascii?Q?QMyvKvWn8EK2Eko5VpkIDC8DPnc+MUhwYw05Z/eAl9ZTb+32eYEzdXIcYfMF?=
 =?us-ascii?Q?uwYt8LTrSMxeVORrjJS/Qey6xad2lJ4jJ03/Kzng4ZXN0vdmsfXhIEbyo7it?=
 =?us-ascii?Q?qshs0pexJDe84HnRRI83rOhYVpFYpdjABY/Rh0Fld7g7NfqekR0Pv6WDvRG3?=
 =?us-ascii?Q?K1ReRXwMD1iYQBzHqnvWRWpmDpUO+cH6vWfWjKTLMFgMYZnWMZAn0vxPPqCE?=
 =?us-ascii?Q?MoDQj9sJvCrKcQoUJq+zYJ9oKoIcTGxkfYO9UqVecJWzEDXoBL5HY++YO9jy?=
 =?us-ascii?Q?TIktQ017SfSjaGz6SC/J9Kdiooi0KrDU179FK+NiQIEwYUj2FEZg5h67LrkX?=
 =?us-ascii?Q?m1BnEluJjF78ZLsYXQZOIvazIRwoZ4QCSv3E9l3FXwr9OUGFau2bg51zKhzs?=
 =?us-ascii?Q?G0UF2G2w8pzjcG6kV2PRoHeiNsF3q/0MW5w3Ay8Wmr+qxOSN4jA+3Uf8mLcu?=
 =?us-ascii?Q?lnSHdcEvQIBnP6KQStLXeIeZJeqT6l9CaVJqSxlp4YxNJUAudSy2ArozUwmN?=
 =?us-ascii?Q?foneD0VWhjwHlEzC+pXJhAwK7NMUpxmQMsnz7BEtVm+mJkQBluXojxHIiH1p?=
 =?us-ascii?Q?7WX8mMzY4x6aVtiQa8jzPppcBAVFJsZdlPXrRgkqVfnsbSVVOjjWkUCg9amj?=
 =?us-ascii?Q?9B5fqRixgK9Q8FVzIhF99lmo8fy258S74XUQHCjWGnnU6ojlkEHTjFEGl0wR?=
 =?us-ascii?Q?b0gORjcJi5TEEmf/kmu9g3o/t0nHBz35BIybhf76qVRul/IPTd1w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9027c2-a464-4a0b-9e0c-08def700c7eb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 16:59:46.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugn+Vu0b+WIXFFRIuF+baehE6ObUuw+50n6vSsboKW9JN38zKdzjud+63M5jwPUh/gw9/YWVmRRZwjo/oOYOinncfnJt8CcEpLYAMb9RJkjEvyPFx2FBC7pAxF5emZtq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9297

On Mon, Aug 03, 2026 at 09:03:58AM +0000, Peng Fan (OSS) wrote:
> > Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
> > document optional "memory-region-names"
> >
> > On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
> > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > >
> > > The carveout region names are derived based on the DT node names.
> > > Because of this, the DT node names are ABI, which is not supposed to
> > happen.
> > >
> > > Fix this by documenting an additional, optional property:
> > > "memory-region-names". This way, the software will have a way to
> > build
> > > the carveout region names without relying on the DT node names.
> >
> > "After update all existing DT tree, this will be required.
> >
> > >
> > > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > ---
> >
> > Additional information to help understand why it is important.
> >
> > 1. at thread wrong use vdevbuffer insteand vdev0buffer as node name
> > https://lore.kernel.org/imx/20260705202439.3F5771F000E9@smtp.k
> > ernel.org/
> > 2. similar case happen at
> > https://lore.kernel.org/imx/20260715071741.79CA81F000E9@smtp.k
> > ernel.org/
> >
> > Suppose these problem should be detected by dt binding check instead
> > of sashkio ai.
> >
> >
> > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> > rproc.yaml
> > > b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> > rproc.yaml
> > > index c18f71b64889..8e3e6676a95e 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> > rproc.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> > rproc.yaml
> > > @@ -62,6 +62,10 @@ properties:
> > >      minItems: 1
> > >      maxItems: 32
> > >
> > > +  memory-region-names:
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +
> >
> > Need restrict names
> >
> >   memory-region-names:
> >     description:
> >       Names for the memory-region phandles. Each entry must be one of
> > the
> >       following recognized names. "vdev0buffer" is the shared buffer for
> >       virtio device 0, handled automatically by the rproc virtio framework.
> >       "vdev<n>ring<n>" (e.g. "vdev0vring0", "vdev0vring1") are the virtio
> >       vring buffers for device N, also managed by the virtio framework.
> >       "rsc-table" is the resource table region used to share the resource
> >       table between Linux and the remote processor when it is pre-
> > loaded in
> >       memory. All other entries are treated as generic carveout regions
> > that
> >       are mapped and made available to the remote processor.
> >     minItems: 1
> >     maxItems: 32
> >     items:
> >       anyOf:
> >         - const: rsc-table
> >         - pattern: "^vdev[0-9]+buffer$"
> >         - pattern: "^vdev[0-9]+vring[0-9]+$"
>
> There might be other entries such as m4_reserved or m7_reserved

You can add
	- pattern: "^m(4|7)_reserved"

Frank

>
> Regards
> Peng.
>
> >
> > Frank
> >
> > >    power-domains:
> > >      minItems: 2
> > >      maxItems: 8
> > > --
> > > 2.53.0
> > >
