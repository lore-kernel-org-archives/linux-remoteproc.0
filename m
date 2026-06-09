Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A678481222;
	Tue,  9 Jun 2026 17:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024817; cv=fail; b=hp660QzHS1NX5DQwwAqaM3gzRG2IeRWlQTyv1zj+9gqibBkDxBt0edQzOj/gY/PS1vFkkMWSG4ka3y284F4BgPbxxWSH+AnTSSFJzTRWVdbL6T3c7q3mPGBBBk3K38RNg03JrEhejpvB1h4L0TuqRE+UGBHm7L3lVHx5q7cItzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024817; c=relaxed/simple;
	bh=D1OTSu9HcJPCz4VC7X6twZ4DwzAiBmhqpY4VItaKVLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hYNNZ4/I+QWGp6ahxW/rW6oznZvwvEw1pN4lv37gQO9i3f/230DSEX9x/AX37aA5eWhA46Fi5EFQcxmW2FjvRI6bz8hErovf4c6+SmjGNIkzlcL6yds12g/DiwDwN3uZtiG34MTBu+CSRBtR2GERKVpVkjx1NMrV8Ov0vjqLCtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dg5zuFBw; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dg5zuFBw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWE2IYLpNidGzKZ/PUW193yrxWWXJjqG8nyaVQpPyrL0s/XR9Wa9WofZdj9R4De5CQiBbWICPHf9n+mPYRuB9vYNd+U8icZn1pjl8o3IjsosNGFo1+y1Lk9hmfU5RTx9agGbAMFoeBKA8GPNiMaFdD6BAIk6FACBwWG7Sn5x6XcxMkfYn35SkKEpqJBpIE3loCgtYFe/gq1dhqnm3WgqJoFhwI+CVnF/LKqOqK8XChEBGwFCrzcmgX8s8ZS0XS2HuqmaDXnXbTnCQRuCj7f05RKBGQHjZTF5kwuEtUImguVUpFv/8yn5uxK1tWbv4hO+X5mSCcwUMBr/lgxjWQjcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRG0raM0hl8/ZVV+9zJpR2BhgfYZVaCfmmXZwTGzByA=;
 b=SeJzaVejwX0fTqR3z0e453tJ8GWuRr574JCwYnd6uBLrfVAqUBwZyEmLtU2AYMAtHG9JAD9xqDlD5Ul6ZabNI3C2tD3ak3QGcQqyNlO36njh49WyVcBLxceAJyYXWNZ66LOnf8q7BnU5jCo/8Kf5rUj1G29+oSBB/7hHsaWXjRi4W/AEnmJqOFC+reBBCP2XgSt8QKH7b2MTzwbkc4nyj0robJ7PJTwA/jgHL40J7GLHoAiSBV6HRMVGIHKYMDJ9/tI/G2JGOkIoO/j8e5YvDIT6tPmgEya3RS9d6tL8aTXNs4GrtXYlRHW3T1JtUAJrrWqiE/YFgnjrNTNU+pwWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRG0raM0hl8/ZVV+9zJpR2BhgfYZVaCfmmXZwTGzByA=;
 b=Dg5zuFBwsvC5SrGZTNbCxVpawY9295fpsm0v5lbJChyfp6Z2KwNA9RzBylpS3bBTlzX5WGNKe7jv739A+Oa47HmFy4rNBSFEsrtzxp6yThd3+yumJ3G09Gn9R8EvwIM/vAP3AbUMXAlney5bId9zOd+hWsKwIkwBC98yT+QjRsxryyfwD6LHwbz/vODq2/MkGo9cqKcsS1dNQLZ/SGgWWzTCApSW2KoJ8NHupSKiVJH7OX3Qr5hO9EL3LY62P0WOC5TNDW8FW6UOHtUxaRegwpephReumB3/78LNTTaaeGsNPOxKwPeAe1KwrLlJgRwyy2dVWk4Sb+tr7+1tk35fNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB9854.eurprd04.prod.outlook.com (2603:10a6:20b:673::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 17:06:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 17:06:52 +0000
Date: Tue, 9 Jun 2026 12:06:43 -0500
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
Message-ID: <aihIIwt_9T7yYxP3@SMW015318>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <aihB5rVLsVqzg6cb@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aihB5rVLsVqzg6cb@p14s>
X-ClientProxiedBy: SA9PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:806:20::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB9854:EE_
X-MS-Office365-Filtering-Correlation-Id: 3faa01ee-a6f4-4e44-0bdb-08dec6498032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gHts3zrHbzHd1GS7gFNAcnJh1+u3tekVudN6z1NjHCpccbX4E6v2Fq+vCEltl4+iFFObgkJF4+ujoKBO9YJ9bpbbt0bMPBIbuv4cwvMpT/o0sXr2zR/vaVy0yCCmPzHr8Km9tyVa/9c4YXyVGkT0SB5Js2fgvLxCkxJiOsPllMEc27xWqul1lGKQR+HCe4N3OWak/k6gm7Ol9ptUZlwzrm35oMITLXUhQEC07VkxiHaCOfqJWE3n5EpGLw0m1PRjd/Ml2CLUWS8E8oKZES1NfDWU35Wgrh6WXhQNrQ5dI9j3xqJTfdDqPQWCCiVrOElPt37dFM4ACu44YdNnEDxS/eQvG5viOAvJzwdLt0NE8MbyDlxadFtlN4GdHuabRI65rJStEJ9UsUMKMJ/VZVtDkc0RcRmbG/J7I0MJfRjEOeU6Vyv7BXGlNwxgHcfBZRW3LUUAPTgoSpWqqtNOKpJHfUiDmcqrkBtUWCO4sAmMzBcewWu58ZO05tYAEwHSgXlNQG+K14RNKuxrAzqBS6+5PXEpO8B/HY3SgZpMo6yv12QO8X+qwRm5BNmW5ZhS6acTLW0Y3Gvoy6Ohwk4Uv/BDa5cZp6UNa3WQqUC5+KsJHGX5uK42ClMlIjHkTArEcPm58TnDuQAXMc67CQHgYpNgGWU5Ep3vk6oOWB4MbedinN7GsaE6VXNGcDctnwZ63nYi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vd+tW7BAfwuuuHkGhaSn2yaP0PWIPT2dQC4TLpaIHD1HmcTVfKWoafNcl0A7?=
 =?us-ascii?Q?w4W+m8PvugQxf3VpieW9ugqekDfFH3Ka6t/PCwzs3db+23nXnTwNkORuhm4R?=
 =?us-ascii?Q?uOFFFs9IVd2e/yjqBzi4m4p5TqKCBM4tay0qAWBuBDdNbT5aflxL5Scths88?=
 =?us-ascii?Q?pbKMtoW317K046PSctAoQDwridl22f3epyvQqt2nCNpq2ySsSXDNJBQV90fl?=
 =?us-ascii?Q?RlIW0EF/i8zF9umxm+UhC365EwB29/hG0UOhvcjHTkfeRtGW40XL8LWTU/zB?=
 =?us-ascii?Q?RvYJ7vA081YS0fsU3XegjnlJb6vygRuqqwZn0vpyg8mT3z2bqGLVXVxfNzHO?=
 =?us-ascii?Q?6FMixQpRDemn1kbnn2IjVpzPZrE/bz9WkqqxykJM5v0ELqnpy1dTUfZxPUf3?=
 =?us-ascii?Q?qIqAlIA8mqTFDgjnvPtw8mrgE6kCrZz+KUqa3KZNBCeYootBLCZ4OCppTrFK?=
 =?us-ascii?Q?2qstebP6pVy6XKFSge3HepyZSsg6hHnuW+JHk7RxDjWszhsb4BgIWANKfDwy?=
 =?us-ascii?Q?o7M5V/JCtS/+dlT8qYeor/Ma6XnQmZce48GjA0R3mHYYcG10MqlRkqgx5xID?=
 =?us-ascii?Q?VNn4s6y/nRDJn7/eKyFFY1fB290CL6sXW8sPbKObDt21KibQeMK+50lED9zw?=
 =?us-ascii?Q?catyHO7j4hgXgEmBZ6ak6CwMSdlDt4Pv8AyD8booeGWRIOdOef5ob4SpaL9i?=
 =?us-ascii?Q?pWVSuBWy7WSm3USqDAXsX0TZLBcnc1j81yB+hiCpOYTjPkGQ+Pirh73xoOOl?=
 =?us-ascii?Q?EwcFhdeKlrpbkaK403mu1yFDN90FnRptG5+wUOBZz9hfNOaDPySm2A6zXmb8?=
 =?us-ascii?Q?waFslon6b/n3mZfSlC2vwhvnRc8XGTb/ETbLOhoqTLASiaRfoBC36TB9BDV+?=
 =?us-ascii?Q?uJ/E+0rHjxqgez1wffLhFM8PKB1T2rUem7zfoxbyBI2tKHlasBYZVumxypLj?=
 =?us-ascii?Q?E++4SS55J3TpiBWPDcd1u9LCPjGTmU1eq3vKYhvwWxpkYlteISDgd17s5i0/?=
 =?us-ascii?Q?+Mf6HDJCtUOHqZNeKH9iF1C9UEWX2DqUhuTAZW/zmYItePHrzv3j0zzI5jpQ?=
 =?us-ascii?Q?4w47x0QzaCANQj7gmj2zUnu+GfVKWSOSxk33IjbM9G2yNeUk6HTRCKBkFNh4?=
 =?us-ascii?Q?jYkPCFfla2SGkla91PeMQgb9eTe85nX8SETbttakCzynGK2x+NrWcVC/CmQ5?=
 =?us-ascii?Q?Nq37tesiC6HsLXj8W5zCoREvGIuzi2V0cAItjScm6tU7b6xs3EW+jvR79qAk?=
 =?us-ascii?Q?e/UNFmOxp2LhxjrrdhAqV5CNvZDuj3XS44f7ymkzv0IyiTuWw/QGIuH4YzcS?=
 =?us-ascii?Q?WIlISZiHSnHmS+AAvO+hrU5lQC1cnfAaKy/5+dnTojs2hEJk00ky0ONRGwxd?=
 =?us-ascii?Q?tEoS6WTcQH9xKfCm5sRyOcKTsX3aA1nh3paYtrTlSHQvu57cYkjQ6F1/hGKW?=
 =?us-ascii?Q?Ksktms72GbhVHGPbT+lLM+zCU8LcGIbhSheAR2ZgBCPn4/ropGNVopZkeBhw?=
 =?us-ascii?Q?055A4H1RijbHnjTHH16qLPBKHqJ1mOodBfxKgwpJh+jOQIClZuWb8+Cdco//?=
 =?us-ascii?Q?L7eNxgh6zTudjMgbS4e2sISv8QYLm41oOoeSviNldQRHB0NsHNr1IEPFz/Pr?=
 =?us-ascii?Q?PhJYZ9V03SwCZPB6bCZxmS5HTBFioBZ6uj8HhZu09LRoaoZ81ilrH62MsdUQ?=
 =?us-ascii?Q?Aud34z7mNUZp40q3UYM44aPDTOSXW4XYOSrj/9Rj9PiLYPEiqXpZpsTdjoj6?=
 =?us-ascii?Q?2wjntmbL0HHIc42Uvpm2WzjyCQxhLY4edENJ209VFqvRAtJ0yHVt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3faa01ee-a6f4-4e44-0bdb-08dec6498032
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:06:52.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8zpqaBMLEngVdsZgnolDi3iq1kAt9p+X+E/DigLVyFwsfjJdgA8uOCswHmbWrF9Cr9O5MSgO46p1PG1QQvMH6AaPx+ht7oHlksm2ahI808fzRNtro3aHUrPby0g7L0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9854

On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > The names of the carveout regions are derived using the names of the
> > reserved memory devicetree nodes, which are referenced using the
> > "memory-region" property. This adds a restriction on the names of said
> > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > specification's recommendation, which states that the devicetree node
> > names should be generic.
>
> I don't see what is so restrictive in using the node name of the reserved-memory
> regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> parsing, packaging everything in a neat and easy to use "struct resource".  What
> will you gain with this new "memory-region-names" that can't be done with the
> current solution?

DT Binding check can't find such wrong if node name is not what expected.
Binding can't restrict memory's node name because there ware not specific
compatible string for it.

Frank

>
> >
> > Fix this by documenting an additional, optional property:
> > "memory-region-names". This way, the carveout names can use the values
> > passed via "memory-region-names", while keeping the devicetree node
> > names of the reserved memory regions generic.
> >
> > There are no restrictions imposed on the values of the strings passed via
> > the new property since the software allows any name to be used, with some
> > names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> > special meaning.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
> >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > index c18f71b64889..8e3e6676a95e 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > @@ -62,6 +62,10 @@ properties:
> >      minItems: 1
> >      maxItems: 32
> >
> > +  memory-region-names:
> > +    minItems: 1
> > +    maxItems: 32
> > +
> >    power-domains:
> >      minItems: 2
> >      maxItems: 8
> > --
> > 2.43.0
> >
>
