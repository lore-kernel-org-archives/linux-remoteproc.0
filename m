Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FA2AD5A;
	Thu, 15 Aug 2024 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723692776; cv=fail; b=KCts7mV86PcmIXQKbS0OBJAcvSlVwiW+FRG89GOXdB/KUwhvhpCxNM3GX9rNlMFFh27HDArfx9zsQ3vZlXz3sLRAcpWwm5BUgUR5hgT/uvrozXNFG6S11pZgDDYDWqi9edagN5sEdat8K2/2oM6W3iRqSfIAoNZ3CtbtJGnG2CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723692776; c=relaxed/simple;
	bh=AP7f76EFpS4Ya7OLWF02xHfrOtyOgGxs3sjy+p0JAaU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WsRYcP+RiJXYOUCvUzpcvP1x2QORC45b0Bk+0zJ6ZiNbfQuzF2Hiqk+ZNDWx77fDiaAECm5we+CPOoxeQrk1/YKAlF6icaqq0ir6UgVEg20PFmX1g5gateSZnvpk14xuo36E7Ms51P3+tuiI7dUR2n+Dcl2WAMll0J3oFid+z10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CZNcZc9e; arc=fail smtp.client-ip=40.107.241.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CZNcZc9e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0+GMVxGOpgRLHQYsK9YGQotiIGa42JljbNYSldi+C76A/lATiMXltDuJiDH3qkOwOChLoiiSu1+jFEnAOIfd9Cs00jPdxcSxnaYFKv2nUo/4natVGfWrGvGDg4C26ruFWIYLoKB2EPVrljksjdHzdOo8Ti9L/4tU0YyxSwx/OunORC9b3chEewS+6rO5q9P9PYM2R/maYevtual0HqoMDw7kjCJtnX5zDv9b08o7/7Hh3K2tvtMVdUa9wg98fZW786pdIMjC+Q2jEosLxs8eY+s1EjeHwxHCELqocbe6kuAEgXedx+flYmiW+Utufd6459kPH+piJ/7QVdHweiyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZoQqvoQAMOjy0oAHe8Fk9caiYWCHkgHcZeDFUxBGu4=;
 b=RYUZhN/CE3qUi3J4q6JSc0Hp6Pss8siTD8fsMux8lizzQLWNXeuhnKmwkpUS4k7itNNowrPqp0HEVZi+cO2ILyZbSOWRQD9vBccH+sh3NPcr7nQ9XRg0o7SejLL6Z9HyfCbkYuthg4Mk4U01NDsrE9ahNH9jniIVra4A9OGdHZbUqFKyqfp1ivWj2ckkmcUaKwmZE5MsYoSLpOa0lRuybFQ3BqIL0bg6sUHskac/4iADt2rnFpQttda4krAKkUd0X6TmqFiPd1OXQUyXmMKPjYrTubSpsqiM5xNv7CO2pGMRJHkMIl3p0NSVpwM1aExIUw7FYFumSaOTV20MzIXtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZoQqvoQAMOjy0oAHe8Fk9caiYWCHkgHcZeDFUxBGu4=;
 b=CZNcZc9eyI+KjOkuZCUYGL20JMpFl1umALvc1qwGQrqmIF4wlGAPMiqAHqghZ+24bD9na13ohgw9+n0dWFtwYIZKIlWvXI8fW8T0j5m+VCZHgZR4rYJioqS/FNEThj8g7ZPGcfQ6YnLht5nGIvp33Lmhc/Thjt+RNGunwXvIvNpVe4VI43YYJgFqb1We+xvMF136USIBQ1H/ZO/yrA51kKXDBG+35UAmgc+LXgwaWHT9WPsXGOfPeDxoGG3r0qOfMfyCLLhDCN7lysY1tL8HSwqDydXTFG0bQNuaO/ddI70YCdB90Yj+SJIjYJxGwF/HK3PVqNpDVnNJ02x5JbmlgQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10834.eurprd04.prod.outlook.com (2603:10a6:800:275::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Thu, 15 Aug
 2024 03:32:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 03:32:46 +0000
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
Thread-Index:
 AQHa2bdERlEy/iUIMEm8jNjZj1/DHrIN5pMAgAESTTCAA339AIAA+9VggBOPM4CAANFa4A==
Date: Thu, 15 Aug 2024 03:32:45 +0000
Message-ID:
 <PAXPR04MB8459A097816083454908840488802@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
 <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com> <Zqe23DlboRPSXiQO@p14s>
 <DB9PR04MB84615384294C38EEA5B95F0088B02@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <ZquK5CNtRJTTtlkD@p14s>
 <DB9PR04MB846152D0289467468CE0077588B32@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <ZrzGfS/7vv90F5C1@p14s>
In-Reply-To: <ZrzGfS/7vv90F5C1@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI2PR04MB10834:EE_
x-ms-office365-filtering-correlation-id: 094e5fcc-daff-4b4c-32b4-08dcbcdaede7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gC4DfOA4olNk+3bKeiBShXoWr2NaSR8Ed/jRIG7uc2BfGg+WiPwrmTMsHzID?=
 =?us-ascii?Q?1r+5ouv0M8SsX/Gf/y8FxfU2Doy6Tcd/YRI15MHRH+y6TYJwHG3n9TuhQqy/?=
 =?us-ascii?Q?EBk6tBzSqTmopToUJEavEOSdHImz8bnsVFnU5O/tCb/QryHCLTPV/w+vy+QK?=
 =?us-ascii?Q?VbNl5+H7krtN2pB5j4wTN5X8aISHfY1vnF3RpegNoO/JjyKiUMFtrJhbXd87?=
 =?us-ascii?Q?55JEB5KFndeFehKfgbbXbqPE1yFKPLzSpNfUwHbr1QdFoAJkRxvK4t1kXzaD?=
 =?us-ascii?Q?GylsWceOyWbAs0gbFFg75BmhDUExweiqw1Ac7N6LgUkuf1dRndToCpWR2jjA?=
 =?us-ascii?Q?ZwAZe0rqIQlUPUpARfisw0pGgwJH2fk9fGJnZ3l8u8qy0uwHfAC5hDKjtYFE?=
 =?us-ascii?Q?39hgbI6cXB7VbydQExd9sQfuE0gg59JfwCg6Cb4/m7HRdm8Y0hQaXFT7X8QR?=
 =?us-ascii?Q?yQmmd8yQMArym9C5RjwfjRFEyM31s34CIISh20D5l0PVDlpYAKJkoGbSOZV0?=
 =?us-ascii?Q?5s2x0zmuUl5egcahrgEdXj9COY5mQfpzD90/mgtm5GHl4LxhaFD8P/aJxwYz?=
 =?us-ascii?Q?6TqSdeDFRThwP1Tu6Hy44A5syDnNEbPkm64lrPCvBwI9XnnEKVseln36FnaW?=
 =?us-ascii?Q?4BWvZh3mCn9qo0y2N9jG/HCHQXCnmhJYBY5ESv4aLDOP6jDwxUjqnlze5AWm?=
 =?us-ascii?Q?ILHcbYE+pZx8TL/OJ4u6mWObxuijSeAkHzASIkPtHFmRj9HhNc943VqSzoUt?=
 =?us-ascii?Q?cFhrQdS16lBlANDQNbyvRgLT5RqWWuttqUQKyNZE5adM6lAGIya7nUQhJOHb?=
 =?us-ascii?Q?K+eP9CljBILKq6wQ3ufUwCvYVccWeMiVU88wrG9hUn90QLMGdlmbrHt9X20V?=
 =?us-ascii?Q?91tX4sIJs5CIsg7U2zURlIdKcNAWXoWrplpPLL8SvvjWIcj54jhAbuWiYCFs?=
 =?us-ascii?Q?WSL8wQTT1OqicPezfDJrfTZ/bU1oN75QaSez0bnMqfZStUHpVyf9oVzEnEBv?=
 =?us-ascii?Q?GiQCbOXkfChKTRFCeFj4mYm+Lbl0C6AJx3PKMFCGhMsLVOW+NkE1cqHFK0fP?=
 =?us-ascii?Q?RqO2XFYuvLBxo9bzGTCiNQqVlPJXHNwYBba2aelzp2lWGM/GEl8P0glSyz8n?=
 =?us-ascii?Q?TPuTLKJ53RqW9A+BA+GjQdw993uiqzyvK2cHm+3Oslyh6hKKxNK07T8IjWo3?=
 =?us-ascii?Q?CCMNeYgYxqfcD6FkzSVSMHCNmf8Bqvb1lR9Yu6pTagWqMGctL6MnAHLI7k0g?=
 =?us-ascii?Q?0CqzDMQoODnLSr8Urvi+gmryyFc9dNCV1jmsM0Vx4eaH69xYErHzA59ATAog?=
 =?us-ascii?Q?/55APkEnRBIrwUnUbqIwAlL8RxJi9N0tc6diwiFy8QkYpb2MjW6k9jbgIdWs?=
 =?us-ascii?Q?pmrcDr0YlU0ZJ6L99iu1hTzWxhx0ELBTnzJummKzyV5d4mQduA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iSq8k05l1AHV/+YUTYulzS5mOekMnviYaWVkNrrV4oYQcVn2KpZCA2c+mvvs?=
 =?us-ascii?Q?2rmvCwRLIlylcKVJCdyFzbAO1z4sdiyusKYBvOLozE8VM+8nsiZjmfzG1QbI?=
 =?us-ascii?Q?NUlXp5L3e7KIXpl5WHR0qXlfvtvuVBNZat6430Gd1RZdysJaKxApVh5t31fC?=
 =?us-ascii?Q?IoMdUWj+qyN6yT3o5DRIigp/UN5/+1xtXck+gJQqCWXEQSivyPnGzCX28gf/?=
 =?us-ascii?Q?YEEy0ZDtljM8gKOBtLSyk6lpJs9Asysa/2aqCMj2JbwnZmii/dkkmAZ3bDpZ?=
 =?us-ascii?Q?TxPZdca90sNWssOZc9Cyb/l7YybrhqifkQxaf21f2LjWHmAwe+G7W6kxKtft?=
 =?us-ascii?Q?PEHfVjJvgTgvtKb7ea23eLcLUXmb1SJoEyXTvzsaOZlkDK38FWuMMUSvssMI?=
 =?us-ascii?Q?KVEs8y/A4cbk1GIVoUx+ZON6ui4CeBigYUbf/TaLJHmcxeKM4nqk14Yca06N?=
 =?us-ascii?Q?Y8xpMNSvGb0xCnBCXSLYaI9NFGOZbX88rDGDPi8l+jBjDZtp/CWqzEsMssKG?=
 =?us-ascii?Q?SunViYvZUDoFqzIbxHPwj8w4IUWVj/GLo/+FjeZlUxa5mU2xirAhs7jsK+vI?=
 =?us-ascii?Q?DQGGnAUsHteXrWYF6aMuIAF4PXNsD3yfar4sXk+tFFiicOK4fOLXh5xbhl2U?=
 =?us-ascii?Q?0XLEwPEPWWfnJEYfE6lz9AYfV3W4bvtptE+P5OO4yDCR6NqTnZrUnrFrLP4j?=
 =?us-ascii?Q?H2w4rMxba0U1APHNFiNUFn1s5ZfReexhwwJ0w/zJMdmcuTB31Vv7W5W+aKJq?=
 =?us-ascii?Q?yZbIVoHHdDNM8LFYqm9ihqVgyNBNVnHYMHzhDQ8etDtSs/wzVJsLcxfYQUX/?=
 =?us-ascii?Q?GW7A+uq1LrZCn70KGBdxcDxfKdK3kE8EsljsHAK2IpIzmCSn+MlPVvj8h0G5?=
 =?us-ascii?Q?+MfvlFCSHEnuPm7z6LrGfEXD+KmF+NzWjZiRPPMKjI5+f/L+NXgaLvma+3cm?=
 =?us-ascii?Q?CB4te2vFHdfY9MLc3FORG1pqOPoI5JM00HGO0ucYJOcAJW6g6ZgQ9R5AbLib?=
 =?us-ascii?Q?5jeY8GpWZcFfyjWp9fuBEAESXYQIPZI9hzWhU8yFopQQiWLDUgMbZtzQSK8V?=
 =?us-ascii?Q?CjWDdZIoPE7cd4w3ddPnKESd8IBu4Jph3g+WeOkJS/elQViEpOEZnpZaccD4?=
 =?us-ascii?Q?7xTxKg3vZz0UI6dqBKrkrx2Y7KpiYGbYdKK+4BzMR1JtjPpayBDaF8788PBG?=
 =?us-ascii?Q?FOg8JcggzgwUkl1qyIHpqqGVKEkP6vGxuaAifiYbMuEtOIP5TsNeekrgOFEe?=
 =?us-ascii?Q?qpOBoFDMExaXS4ClD+GAM35Cb6DFyzdiQ/3Pyr7dQ5aSr7Zug1DY4WNC653j?=
 =?us-ascii?Q?tB4D8kaQxeU2IjnTeYOeJtTr/VU82vUE2wguxAZmR+7htSHNO47XyFErHEvW?=
 =?us-ascii?Q?eeWcy//a+wC0GJObfFxKo1JkAwVHFRkIaYl8Jw+zt7OO/XLDrmCOgTtrtPJU?=
 =?us-ascii?Q?n6bTwXofgIiTH5F8SOvJClfOiyRiYS3IZSOmHHET2zJsUt9iFfMMUOpWSWlc?=
 =?us-ascii?Q?oUyakzqCWXCfjxgR/hMtAO4Nlbd96mMagVmBtomvrYNoy74woQFiTmJW7GRM?=
 =?us-ascii?Q?K8ygfOR85058wLFP5DM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094e5fcc-daff-4b4c-32b4-08dcbcdaede7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 03:32:45.9384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fem8tx0pvjhYH3L6+IxbhSTHs8UpyJffyTqmVt8Twd0x0rKgIwwGALSyGyuHyrkPv1v7GZmJBZ7cN1WItgNGYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10834

> Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off
> for i.MX7ULP
>=20
> On Fri, Aug 02, 2024 at 04:59:45AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system
> off
> > > for i.MX7ULP
> > >
> > > On Tue, Jul 30, 2024 at 08:06:22AM +0000, Peng Fan wrote:
> > > > > Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle
> system
> > > off
> > > > > for i.MX7ULP
> > > > >
> > > > > On Fri, Jul 19, 2024 at 04:49:04PM +0800, Peng Fan (OSS)
> wrote:
> > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > >
> > > > > > The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The
> > > > > i.MX7ULP
> > > > > > Linux poweroff and restart rely on rpmsg driver to send a
> > > > > > message to
> > > > > > Cortex-M4 firmware. Then Cortex-A7 could poweroff or restart
> > > > > > by
> > > > > > Cortex-M4 to configure the i.MX7ULP power controller
> properly.
> > > > > >
> > > > > > However the reboot and restart kernel common code use
> atomic
> > > > > notifier,
> > > > > > so with blocking tx mailbox will trigger kernel dump, because
> > > > > > of blocking mailbox will use wait_for_completion_timeout. In
> > > > > > such case, linux no need to wait for completion.
> > > > > >
> > > > > > Current patch is to use non-blocking tx mailbox channel when
> > > > > > system
> > > > > is
> > > > > > going to poweroff or restart.
> > > > > >
> > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_rproc.c | 36
> > > > > > ++++++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 36 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > > > b/drivers/remoteproc/imx_rproc.c index
> > > > > 01cf1dfb2e87..e1abf110abc9
> > > > > > 100644
> > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > @@ -18,6 +18,7 @@
> > > > > >  #include <linux/of_reserved_mem.h>  #include
> > > > > > <linux/platform_device.h>  #include <linux/pm_domain.h>
> > > > > > +#include <linux/reboot.h>
> > > > > >  #include <linux/regmap.h>
> > > > > >  #include <linux/remoteproc.h>  #include <linux/workqueue.h>
> > > > > > @@ -114,6 +115,7 @@ struct imx_rproc {
> > > > > >  	u32				entry;		/*
> cpu start
> > > > > address */
> > > > > >  	u32				core_index;
> > > > > >  	struct dev_pm_domain_list	*pd_list;
> > > > > > +	struct sys_off_data		data;
> > > > >
> > > > > What is this for?  I don't see it used in this patch.
> > > >
> > > > Oh, it was added when I was developing this feature, but in the
> > > > end this seems not needed.
> > > >
> > > > >
> > > > > >  };
> > > > > >
> > > > > >  static const struct imx_rproc_att imx_rproc_att_imx93[] =3D {
> > > > > > @@
> > > > > > -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct
> > > > > imx_rproc *priv)
> > > > > >  	return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int imx_rproc_sys_off_handler(struct sys_off_data
> *data) {
> > > > > > +	struct rproc *rproc =3D data->cb_data;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	imx_rproc_free_mbox(rproc);
> > > > > > +
> > > > > > +	ret =3D imx_rproc_xtr_mbox_init(rproc, false);
> > > > > > +	if (ret) {
> > > > > > +		dev_err(&rproc->dev, "Failed to request non-
> blocking
> > > > > mbox\n");
> > > > > > +		return NOTIFY_BAD;
> > > > > > +	}
> > > > > > +
> > > > > > +	return NOTIFY_DONE;
> > > > > > +}
> > > > > > +
> > > > > >  static int imx_rproc_probe(struct platform_device *pdev)  {
> > > > > >  	struct device *dev =3D &pdev->dev; @@ -1104,6
> +1122,24 @@
> > > static
> > > > > > int imx_rproc_probe(struct
> > > > > platform_device *pdev)
> > > > > >  	if (rproc->state !=3D RPROC_DETACHED)
> > > > > >  		rproc->auto_boot =3D
> of_property_read_bool(np,
> > > > > "fsl,auto-boot");
> > > > > >
> > > > > > +	if (of_device_is_compatible(dev->of_node,
> > > > > > +"fsl,imx7ulp-cm4"))
> > > > > {
> > > > > > +		ret =3D devm_register_sys_off_handler(dev,
> > > > > SYS_OFF_MODE_POWER_OFF_PREPARE,
> > > > > > +
> > > > > SYS_OFF_PRIO_DEFAULT,
> > > > > > +
> > > > > imx_rproc_sys_off_handler, rproc);
> > > > >
> > > > > Why does the mailbox needs to be set up again when the
> system is
> > > > > going down...
> > > >
> > > > As wrote in commit message:
> > > > "i.MX7ULP Linux poweroff and restart rely on rpmsg driver to
> send
> > > > a message," so need to set up mailbox in non-blocking way to
> send
> > > > a message to M4 side.
> > > >
> > > > >
> > > > > > +		if (ret) {
> > > > > > +			dev_err(dev, "register power off
> handler
> > > > > failure\n");
> > > > > > +			goto err_put_clk;
> > > > > > +		}
> > > > > > +
> > > > > > +		ret =3D devm_register_sys_off_handler(dev,
> > > > > SYS_OFF_MODE_RESTART_PREPARE,
> > > > > > +
> > > > > SYS_OFF_PRIO_DEFAULT,
> > > > > > +
> > > > > imx_rproc_sys_off_handler, rproc);
> > > > >
> > > > > ... and why does it need to be free'd when the system is going
> up?
> > > >
> > > >
> > > > Sorry, I not get your point. The free is in
> imx_rproc_sys_off_handler.
> > > > During system booting, the mailbox is not freed.
> > >
> > > Why is the same operation done at both startup and shutdown -
> that
> > > is not clear.
> >
> > The below commit shows request/free done in startup and shutdown.
> > Hope this explains what you ask.
>=20
> Unfortunately it doesn't.  I just spent another hour trying to
> understand why the same operations are carried out for both
> shutdown and restart without success. =20

Thanks for your time.
During system shutdown or system restart, we have other
drivers that needs send rpmsg message to M7 core, but the
system shutdown or system restart notifier callback not allow
sleeping, so we need reset the mailbox as non-blocking.

I am out of time for this patch
> and have to move on to other patchset waiting to be reviewed.  I
> suggest you ask Daniel to help clarify the changelog and comments in
> the code and submit another revision.

ok, I will ask Daniel for help to improve.

Thanks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> >
> > commit 99b142cf7191b08adcd23f700ea0a3d7dffdd0c1
> > Author: Peng Fan <peng.fan@nxp.com>
> > Date:   Fri Oct 21 12:15:25 2022 +0800
> >
> >     remoteproc: imx_rproc: Request mbox channel later
> >
> >     It is possible that when remote processor crash, the
> communication
> >     channel will be broken with garbage value in mailbox, such as
> >     when Linux is issuing a message through mailbox, remote
> processor
> >     crashes, we need free & rebuild the mailbox channels to make sure
> >     no garbage value in mailbox channels.
> >
> >     So move the request/free to start/stop for managing remote
> procesosr in
> >     Linux, move to attach/detach for remote processor is out of control
> of
> >     Linux.
> >
> >     Previous, we just request mbox when attach for CM4 boot early
> before
> >     Linux, but if mbox defer probe, remoteproc core will do resource
> cleanup
> >     and corrupt resource table for later probe.
> >
> >     So move request mbox ealier and still keep mbox request when
> attach
> >     for self recovery case, but keep a check when request/free mbox.
> >
> > >
> > > I am currently away from the office, returning on August 12th.  As
> > > such I will not be following up on this thread until then.
> >
> > sure. Thanks for letting me know.
> >
> > Thanks,
> > Peng.
> >
> > >
> > > >
> > > > Thanks,
> > > > Peng.
> > > >
> > > > >
> > > > > > +		if (ret) {
> > > > > > +			dev_err(dev, "register restart handler
> > > > > failure\n");
> > > > > > +			goto err_put_clk;
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > >  	ret =3D rproc_add(rproc);
> > > > > >  	if (ret) {
> > > > > >  		dev_err(dev, "rproc_add failed\n");
> > > > > >
> > > > > > --
> > > > > > 2.37.1
> > > > > >
> > > > > >
