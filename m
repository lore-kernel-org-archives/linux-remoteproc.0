Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D8E8836;
	Fri,  2 Aug 2024 04:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722574798; cv=fail; b=acHnulmGRQyscbGNQBNVFNvwtvdSTd9+HFXa1lU7Sb8EyOR9XmA2zrGk0XebFmkh3XHW+ZWhDD/ZDY70ezHtFAtHoMwvzXo2EAF0/gsj3LfsDyrS3uh1Tw0NysfB5YS9PYWjquYOlwovcA5p7v3U3ABR/VcelRrveeL+jlDAAOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722574798; c=relaxed/simple;
	bh=q4I3w8mneVncbtYBncIgEnKSE73ViTu//qFB0tSN+JM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LICtjm5uvArUzA8CpdkpRnbZKdNyf7KafNHuFikSSKSxlzxKrL4MIZtIzJrqZG1kA1Z5F/n0yuZtRhNHuFT6kTjtpDu4KQ2pB57BHA39uw/W0vknU77ARmhBx8kZAjf9M5najujaxv8mwC8dueESdM/++KOEcENcf1ZndtBMFsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TnmkeUUc; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TnmkeUUc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN6uemDsQkbmbrm75eIqQ26QTTXgkD5/YPHbpdL8/2yJEoldicSenf9RH5QiJg0dxaYduxcuvhUUlG1O8L5ll4NnNE5V6q3ekfg+7XJIn/gvQM+ySAgGuw+M8eqc2DJQoU1E6KRMaiIMUMZZREtCqlrrA6BSaIb9DRBV8cePEpONy74uxZApctLFkAiXNj6RJ8Ylla8X9vDWCUSr8TI3z4K1BZouKlrnxwM2tAP5yNeZgyju0KUcI+smCEPmHtUBb2RK8IvJ+w0jHv0GQxXQU0RRY6xKsLacx78kuUk0FdXBuXBV0vgsnfe3TSdjXqYZpiboUbbjW6J2Gh+970cXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiuIBqQWLeBkQRVYzAj/AkvfspxN+gMff4s+TjO68zA=;
 b=JNub0QLy4l0W8LtdwwMfI+7kWvdcMtb89m8sdxSDdBYrZ6oPU+/Tiky3tegrMHp74cmsygoiRqFLQwkbEn+MHGyi87evZvp7/uwcBxght9v1N5odA1Jaqf6+Z0sTI7y4C7St03y6xfxPJjmdjP7kAbulbUSxQVGQyh25J9XYK5wLHg+qKpfqIy6k6WUvNM7pX3Iy0Ta4BGapB3WCt5e0A8lvM/4eXJEgThWFMrLmUDfANdcoCO07g62pnx30esL/JIjQRm4opZ+1ntq9Al0+vHZ/3Dz630sL19tDkpMeOwdw6bw3Sms8rzO2FtyquQEHqOf48FVk/Zl0Dnha58L4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiuIBqQWLeBkQRVYzAj/AkvfspxN+gMff4s+TjO68zA=;
 b=TnmkeUUcB3yuIO34uB4yUQDNLCZO0++swWQUWgC7sxbMWbUy0F6ydWs7XqusiIs53BtXPvNfV9RlIH4UEaCQHQtJsOpGrtYdcpNT4BaoqGzCM43pDNVnRWHE3R3YshgwJzOkv5hLQG0YQJtqDo+gxVdq0LYX8V6zd6NUwI0JRywJFqPtqszvKFJhW8NVKp10uLtlY/dErggpCfuR8pxuOEzl9TS2Gx37e0lBkbXvAZZXPB7Lj40zGZMw0go0XDgJ5GTx3wWKevqib01UY8OuvigO4qBCMxAAv11NWp3dZlZsoS5Q+I5LYzPac3uhSG31UDzGuCRbnESneTKGwFZWpA==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA4PR04MB7775.eurprd04.prod.outlook.com (2603:10a6:102:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 04:59:53 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%5]) with mapi id 15.20.7762.020; Fri, 2 Aug 2024
 04:59:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut <marex@denx.de>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Thread-Topic: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Thread-Index: AQHa2bdERlEy/iUIMEm8jNjZj1/DHrIN5pMAgAESTTCAA339AIAA+9Vg
Date: Fri, 2 Aug 2024 04:59:45 +0000
Message-ID:
 <DB9PR04MB846152D0289467468CE0077588B32@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
 <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com> <Zqe23DlboRPSXiQO@p14s>
 <DB9PR04MB84615384294C38EEA5B95F0088B02@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <ZquK5CNtRJTTtlkD@p14s>
In-Reply-To: <ZquK5CNtRJTTtlkD@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|PA4PR04MB7775:EE_
x-ms-office365-filtering-correlation-id: 41599efb-cd9f-42fb-8607-08dcb2afedfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Mo7mH41yGgPs2G1HVAy183D7iootaBURI/S8moi5KCKV1GoHSmwjvSzEc1NZ?=
 =?us-ascii?Q?I/+T+x13K7QYxXXMsPKEfb5YEzMYQGXZeibaD0OfAJpHSSP/T8E5yeytm25j?=
 =?us-ascii?Q?3oQwP9pDC+arcrWK/ULmTSghuZCFakXTb8gbM/eg3F0gkNZDV3uheV9sVFuz?=
 =?us-ascii?Q?GH7T9Cx/OSfYDlzBVgHV9AclSWlmCbiGeNtqplnHw3ZUfcMgGAdw9C+s0BpO?=
 =?us-ascii?Q?LcUzFetrvwdp5MRfaL/2lTYkzDxo8umNGkrcLjM5smLtsT7NbxSqULknM+Zm?=
 =?us-ascii?Q?/lROrSh1mFJKKDh9TAIjIU84/JJuGC2TVXF47V/rczyrC6/jGPAj6QXONluB?=
 =?us-ascii?Q?0A7ElTq6Af5R5Lk8cNvLMPVVZO99/oqhfrBkDsDP80Ow2MQrXWsvt95hspzb?=
 =?us-ascii?Q?/AGU6YS6hk58jr1fqOVVXSMlgtp/T95QADMiPOfNLWabxqDb3u2wg1o3FZHJ?=
 =?us-ascii?Q?rCbfMsNxv++4jO81LdvJFVBhkAbTL3x6z6uFG1CYJ4KBlomXJAfq5pLGH3Tv?=
 =?us-ascii?Q?00O0+O3U0MYgAa13uAN8iHxgsE3qZQ+6nv7aKkx2j54ivQP+6Bl9aQWP9kWN?=
 =?us-ascii?Q?S/UrHBhFkC3DtXDzEggWjWatkxBms55lG6osu8X+kn7bOn58GVB5tPXp6e0X?=
 =?us-ascii?Q?0NOaxidQg+VRpMQeooixJHkn26GwGvetVOVIfks5cAxGxmmTnuBv86to72Hn?=
 =?us-ascii?Q?Ta9JDaHixamC8qr1zeqKThHzK9iA2nAblieIox2lyx1bF5uZ5IA/MITicm00?=
 =?us-ascii?Q?eHDqQC4gysl/NsoCSOvx7o38opKP1ItPT2eJy/dq02++mABT1OdZmN1+qxt2?=
 =?us-ascii?Q?HD7yyYh0dSZYQcmuRl464bUn4s9NM85F4SQFpgxCVX6jk/mLwsKq7bkgccVM?=
 =?us-ascii?Q?h6s9C+sP/NelBUzAFkFvP+vztlRWs34d92wfG+6OR98LYCpSAIn/9QpDh0Mi?=
 =?us-ascii?Q?yE7Wwh+Yhm+3PSw4GGLKi00k4BK30RTFKZuSLYqob4bSTiWevGOnDNb2D1eD?=
 =?us-ascii?Q?D+DfvFtJmfd18imtGG9JTwW3YbO+63fLI/QuNK2nZaZCMR4h/pXUFlZeaUyx?=
 =?us-ascii?Q?6DMhp2/Lt4rG//PhkrsJvrAWoWcpNO8+LBiv+MKyQYTL03ln8puOjexDB0Ai?=
 =?us-ascii?Q?iu+rTxI82ZQ4rHcBTlYJJDUe+hN/lUUhiIvunOVyR3XcHH2EE+/VbfZqmIUj?=
 =?us-ascii?Q?l09T/uBXh4zVAmWfz0A0GuqdDbnFYq11vdm1QwCXhftiiBXWr0pAMIm3NkoJ?=
 =?us-ascii?Q?9kSFpF+2H+cxPDiSdmGR/GcPhSd70673bW135Ns6rgsgxhAJxIkNB7e0Jcbx?=
 =?us-ascii?Q?sJrLD/2rftLbT6+TYTD+5FcwV0c7+VvndrsjMiB0lpxQw3bB5pjBcV52Ajzt?=
 =?us-ascii?Q?z3AGf7Ye7Nyf/Ne9gKFXL6ejZn7cBohcJf547ZIJiY31QwtyQw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CYKG8C89oAIuAMe+BYsZlEANmFkVbMBslsAT6vts612sL17bWE9K83KtuVXb?=
 =?us-ascii?Q?ixcLJdkq4WxoBd6nrIq5DtsjxM6HqAZ8R3jUwq0MkqgEh+q0dVKfTcFhzR/s?=
 =?us-ascii?Q?iatEopbg2qM7k4zF7UwmdupaTtWvY7IaWc4UnpXgJDkrUFXuTYg5px9m2ydj?=
 =?us-ascii?Q?fHjmkFZBOfwbOW9E8B0IaXQzn1ro2Fw+b4EsQglVW0QtM5hJ6Jd0UCj8Kxr3?=
 =?us-ascii?Q?KJKOrdIdiisDqAWhmQdzi6p0UaZsDyVx9dm8hJKmGFGeS6r/+kDykQ/k1N75?=
 =?us-ascii?Q?gbXdue+bwugsnJdUsMbyr2brshn/G0AVIBrY/UmsJp8BA57RUf6Kv3NMFhEC?=
 =?us-ascii?Q?BJHueVl6jRisqZ65OJOFjLVOyygzcUhh5AnfqKrQDtEdreR8lDafxXzgPONI?=
 =?us-ascii?Q?XVCiEYDpfKTI3+eP/uEyWOXykVxOgw45oKiHIy/BUhjkh+5jc/mWpc66NooR?=
 =?us-ascii?Q?kvNb44ptoZ7v0QxWyZCurm9Sqmi9/Y1xgQlVn9R1NEzVq9fP4aqlrfAp8/AP?=
 =?us-ascii?Q?YlhvkTju5zJIdHLuf3QHNfoYQLOZeJHPq56G8McFdKFG+5bxdsnzh2P+tmCl?=
 =?us-ascii?Q?y/oRdblY1uPBv53yVTdsQC7kQyul0m1mbWTfvkQPcc+Qf3cYs6spgFgDIdhy?=
 =?us-ascii?Q?S8UeoEE4u9KntoIJ7J5iDecJQJiGQjEpZzZAIQnrRBojWFeiemIBIsVNNb60?=
 =?us-ascii?Q?Nvc8ztD/hyazBhUA4KRlxkKxQULF+EzK1vV/cUJlLp8lPXLNrbu6AusEsXZh?=
 =?us-ascii?Q?b9us7aer36mjTqZNcAWRZqPVggpWI2b9kZm9HcAr9EUMXfx2hdn446My8aee?=
 =?us-ascii?Q?tCp+zfqurOZFI34bAMrllm7UVNrPyBiRmROlruQdd6aCUMeKZiU64KJDIsO6?=
 =?us-ascii?Q?dQwO+yic8Rm6a7IFtHXAIoz8F68spa+X+FtzPTqcGWOm8c5IZAZtGOrLq63F?=
 =?us-ascii?Q?py4VeeySOmn03OgaCWzmxcjdELBKOdr4VGeR4B0zReAhrzAcZAStbiqamzN5?=
 =?us-ascii?Q?AzageNAfQNenp6peJKBFK+mYbmu2j4XrsD3yyX1opCYFdNIdBrBdxnOS2sVT?=
 =?us-ascii?Q?LBEXoVxX4DYE7f3SqR7horKnPh6E694TgOwPzD7nS+L8EA5DMfxUQ5EzhvQd?=
 =?us-ascii?Q?NsAmpDhzU9i7mQ1Px69ks5xTkCPMXTarp+fjMbYrAtntZORKgK0F5fmvhZiI?=
 =?us-ascii?Q?GgeLCRQ/v1sfSEYmwKfOTwKc0M32bhW7vQLOfy15lzMUAhoCsjpYNCi+HFpt?=
 =?us-ascii?Q?75YliEsbSyzQPmJDmQY7XpSNl8XCzLmPvAP6hrWKf4wDPJ+I5LeWTOuF9EUs?=
 =?us-ascii?Q?pMW6TC8f6zvcSIJbuu55ms6N0ppEuFqSsEk5putpZFsAGrsjMgk71QZw5dga?=
 =?us-ascii?Q?pS3B/s8LCJ8iiGGMu/ldakoW+cBUs5OVXdcAZI7h6k5CEmNLF2y7xcd6Fg0p?=
 =?us-ascii?Q?z0wqnrHIIVjhMVZEZbm/0nRYKjAMQcHYw8z1J2vD2nVgQjsAVk9x4RBuE8z1?=
 =?us-ascii?Q?iu94oozDjA/HdR2WO2QsQlJuC8hjREO/UCmDdDhMmdll13w4/yYt/ysvT2qL?=
 =?us-ascii?Q?m0buHN+myJnc5Bj/wjM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41599efb-cd9f-42fb-8607-08dcb2afedfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 04:59:46.1136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFwkUKyvbKmQIN11uArqxR+x2Ij/zDVLy/H20ZAEEa6rZ6F7PH+vx+Fw7BtNgnbFrdHud5pEftJg4+L8bjTHGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7775

> Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off
> for i.MX7ULP
>=20
> On Tue, Jul 30, 2024 at 08:06:22AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system
> off
> > > for i.MX7ULP
> > >
> > > On Fri, Jul 19, 2024 at 04:49:04PM +0800, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The
> > > i.MX7ULP
> > > > Linux poweroff and restart rely on rpmsg driver to send a message
> > > > to
> > > > Cortex-M4 firmware. Then Cortex-A7 could poweroff or restart by
> > > > Cortex-M4 to configure the i.MX7ULP power controller properly.
> > > >
> > > > However the reboot and restart kernel common code use atomic
> > > notifier,
> > > > so with blocking tx mailbox will trigger kernel dump, because of
> > > > blocking mailbox will use wait_for_completion_timeout. In such
> > > > case, linux no need to wait for completion.
> > > >
> > > > Current patch is to use non-blocking tx mailbox channel when
> > > > system
> > > is
> > > > going to poweroff or restart.
> > > >
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 36
> > > > ++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > b/drivers/remoteproc/imx_rproc.c index
> > > 01cf1dfb2e87..e1abf110abc9
> > > > 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -18,6 +18,7 @@
> > > >  #include <linux/of_reserved_mem.h>  #include
> > > > <linux/platform_device.h>  #include <linux/pm_domain.h>
> > > > +#include <linux/reboot.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/remoteproc.h>
> > > >  #include <linux/workqueue.h>
> > > > @@ -114,6 +115,7 @@ struct imx_rproc {
> > > >  	u32				entry;		/* cpu start
> > > address */
> > > >  	u32				core_index;
> > > >  	struct dev_pm_domain_list	*pd_list;
> > > > +	struct sys_off_data		data;
> > >
> > > What is this for?  I don't see it used in this patch.
> >
> > Oh, it was added when I was developing this feature, but in the end
> > this seems not needed.
> >
> > >
> > > >  };
> > > >
> > > >  static const struct imx_rproc_att imx_rproc_att_imx93[] =3D { @@
> > > > -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct
> > > imx_rproc *priv)
> > > >  	return 0;
> > > >  }
> > > >
> > > > +static int imx_rproc_sys_off_handler(struct sys_off_data *data) {
> > > > +	struct rproc *rproc =3D data->cb_data;
> > > > +	int ret;
> > > > +
> > > > +	imx_rproc_free_mbox(rproc);
> > > > +
> > > > +	ret =3D imx_rproc_xtr_mbox_init(rproc, false);
> > > > +	if (ret) {
> > > > +		dev_err(&rproc->dev, "Failed to request non-blocking
> > > mbox\n");
> > > > +		return NOTIFY_BAD;
> > > > +	}
> > > > +
> > > > +	return NOTIFY_DONE;
> > > > +}
> > > > +
> > > >  static int imx_rproc_probe(struct platform_device *pdev)  {
> > > >  	struct device *dev =3D &pdev->dev; @@ -1104,6 +1122,24 @@
> static
> > > > int imx_rproc_probe(struct
> > > platform_device *pdev)
> > > >  	if (rproc->state !=3D RPROC_DETACHED)
> > > >  		rproc->auto_boot =3D of_property_read_bool(np,
> > > "fsl,auto-boot");
> > > >
> > > > +	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4"))
> > > {
> > > > +		ret =3D devm_register_sys_off_handler(dev,
> > > SYS_OFF_MODE_POWER_OFF_PREPARE,
> > > > +
> > > SYS_OFF_PRIO_DEFAULT,
> > > > +
> > > imx_rproc_sys_off_handler, rproc);
> > >
> > > Why does the mailbox needs to be set up again when the system is
> > > going down...
> >
> > As wrote in commit message:
> > "i.MX7ULP Linux poweroff and restart rely on rpmsg driver to send a
> > message," so need to set up mailbox in non-blocking way to send a
> > message to M4 side.
> >
> > >
> > > > +		if (ret) {
> > > > +			dev_err(dev, "register power off handler
> > > failure\n");
> > > > +			goto err_put_clk;
> > > > +		}
> > > > +
> > > > +		ret =3D devm_register_sys_off_handler(dev,
> > > SYS_OFF_MODE_RESTART_PREPARE,
> > > > +
> > > SYS_OFF_PRIO_DEFAULT,
> > > > +
> > > imx_rproc_sys_off_handler, rproc);
> > >
> > > ... and why does it need to be free'd when the system is going up?
> >
> >
> > Sorry, I not get your point. The free is in imx_rproc_sys_off_handler.
> > During system booting, the mailbox is not freed.
>=20
> Why is the same operation done at both startup and shutdown - that is
> not clear.

The below commit shows request/free done in startup and shutdown.
Hope this explains what you ask.

commit 99b142cf7191b08adcd23f700ea0a3d7dffdd0c1
Author: Peng Fan <peng.fan@nxp.com>
Date:   Fri Oct 21 12:15:25 2022 +0800

    remoteproc: imx_rproc: Request mbox channel later
   =20
    It is possible that when remote processor crash, the communication
    channel will be broken with garbage value in mailbox, such as
    when Linux is issuing a message through mailbox, remote processor
    crashes, we need free & rebuild the mailbox channels to make sure
    no garbage value in mailbox channels.
   =20
    So move the request/free to start/stop for managing remote procesosr in
    Linux, move to attach/detach for remote processor is out of control of
    Linux.
   =20
    Previous, we just request mbox when attach for CM4 boot early before
    Linux, but if mbox defer probe, remoteproc core will do resource cleanu=
p
    and corrupt resource table for later probe.
   =20
    So move request mbox ealier and still keep mbox request when attach
    for self recovery case, but keep a check when request/free mbox.

>=20
> I am currently away from the office, returning on August 12th.  As such
> I will not be following up on this thread until then.

sure. Thanks for letting me know.

Thanks,
Peng.

>=20
> >
> > Thanks,
> > Peng.
> >
> > >
> > > > +		if (ret) {
> > > > +			dev_err(dev, "register restart handler
> > > failure\n");
> > > > +			goto err_put_clk;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	ret =3D rproc_add(rproc);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "rproc_add failed\n");
> > > >
> > > > --
> > > > 2.37.1
> > > >
> > > >
