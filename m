Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5D2E03F5;
	Tue, 16 Dec 2025 02:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852020; cv=fail; b=ODBqtgRCHIPhy/2h9ykqDqX6Kn1BfYlOCRDOy8v8GN9VC7SNuJPL78BxLLCI/izmEY3Pvh/4v4g22pDXixIHxUvwpdS1tJZCJT4GW8oi1mdqlQYCIY8H4Qv9lS6pcp52O/OrTV/JmKW1vwtbAz0JHX+59NoJoLf6tgJizNZqV+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852020; c=relaxed/simple;
	bh=GehYneZP47mvyDpKd0lyXvh2bZTSvD2DBbuqU5hdf6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KNY3aHCM3EiVAfslhc7Y+qTPBlg0DgzcQKU1OtIA2cSsKR8hajuCViUE7dNRge5e8hmqvf9jFPbeMeLX2hjoZRMto/tBXz380wJWLQ8a/doMavQ9ceFysoBrzZ6G0aTW2SbZ3bgUs3arfy8g5Dr/DGVGWZU9UrLk7bpWdnlZobE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kuR4Hxoz; arc=fail smtp.client-ip=52.101.83.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kuR4Hxoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8XsCZpXiYDZuX2thIPRrKvjPcNSlE2LxxN2KFpjrnd6snNdvpVn51QWaSsTXVLXKrTDJLYY95T9vzhkaCmKvYfvT41Vz4kGhj0Ul5dqysi6ogQ5lIDeiGzBjHWDrqgTNEXixD4E4eKIHyTi1fBrvEW+ePJK6JC9k5YF9nbXAp2lrpD9hJ+JTiwOBt4FZiuqqw7aVUKS7kIPw6/at0oaRJJG9I90hTaOHhzHD5Wr0ZjjeMTGVnwH6jw2iC+48O2EQR0bHBDa/wDTnUoZCW/E5ushQp4MXbvb5O5mDRObMDSodxatBtjuinVBV+4B6Mf4OC3wxKNBR2U+IEsrkAB8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QSMpFi1VTAil29uRkTcwHBV5atBfTdJtTP7uoshH/Y=;
 b=MT2Jt6FYz9RyCnEGVHqQHshc+GKttCeT3g0nihulATTwZaHUdU/jpZxVe21L3XmySa8iMEQPKzjTiz0uQzS5pcHIIFqV30B75g8APfAmNfZYmp0UIqBtMexzZWxHly0NYV2GMP+rotSvxKkx+A4aJf6hewnrT3Txo0QhE1/lRDlTgUBUu0/yRrbaKYfmhsfEqnZNhnKapEhwNp+nOrq9VSwOmbK2KQTFQIpvIkfElpH9lghyvmylgiFvN/TZ7dCQ9d8gLAowRsZg2xAgH89TIq0Zv8C8+xatYXMqc+qJq1jkXHzqgB9GzqytFe/V/WVyx02l754DxuTe3RnBFTKMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QSMpFi1VTAil29uRkTcwHBV5atBfTdJtTP7uoshH/Y=;
 b=kuR4Hxozl5eRStNXQuOFf0DCSF+0hPEoGe+SMaaQrbG7eJtmnPCbmD4XsGpvLmN4ecz0zZGjfWLZLOje2wQga7EKEwKpM8/z3rFjIfQDcXRMqtZv0sssCyMQ7EE/cqmAqoRmItyRfGll5n9ssDkoG5dBzS6CsmTMlIepnxLWGSL6HGmF14OGtr5KjOHuNf53jr033pkGKrkh8EhKt3bTQvLbNvF0Pab5yPyllLkQn3N998tEVt+bydVQQVuAEhN5hmPIN76BO4Jb4TLBz+A93aI2R7QfUsXIxmQ0yG6fQqqqjYCXuKVMOqvxxyYH4Q3WUi+XQYFuEsK1GuYOguzt+A==
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:26:55 +0000
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d]) by VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:26:54 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callback
 for i.MX7ULP suspend
Thread-Topic: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callback
 for i.MX7ULP suspend
Thread-Index: AQHcbZPtmYtmAW/A60uWWYK2pDOcK7Ui4AuAgACklCA=
Date: Tue, 16 Dec 2025 02:26:54 +0000
Message-ID:
 <VE1PR04MB721317F24C6F99F7468DE02B87AAA@VE1PR04MB7213.eurprd04.prod.outlook.com>
References: <20251215-imx7ulp_rproc-v1-1-4e96cebc4bc6@nxp.com>
 <aUAzaXp1t+fTVfyT@lizhi-Precision-Tower-5810>
In-Reply-To: <aUAzaXp1t+fTVfyT@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR04MB7213:EE_|FRWPR04MB11246:EE_
x-ms-office365-filtering-correlation-id: dfd01935-d658-4799-79a0-08de3c4a9451
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PDvHDXSUvbwAirugBJ2UgyJ92k2etAChxKayeibic5gq77emyMof1UdCLn9p?=
 =?us-ascii?Q?e+Yq4Fcww7zwBzyKzo6IcJaQG4u9X+nh5Rq76A7jUK/a3gPIa/JpcZF/4JQa?=
 =?us-ascii?Q?oJd1eyboDxX/qptjs/4hQHJHZNfHGXEhj7NkaZZM01kHVU3T2vts67daWlOn?=
 =?us-ascii?Q?weWTIqwxnIpCGS2Gb0JCyZ3Vgt/R+KXzwbVB1lGBevtmfx3gbY1+BxgqBlXD?=
 =?us-ascii?Q?jI/k91w1r5g5qgkGATaKrbqLvqxh0Xzr0jVrJWVyjgrT5LsZJQgZBHSPEoPt?=
 =?us-ascii?Q?Baefckme0qYvSjb3qZAoKfXXVv72VGz1H+ZdcfL1YxxFlN13N0W4e8CPNH4r?=
 =?us-ascii?Q?4Icvose5NT3/wyIQGUEa45kX+wDUA1r5gmQjqltvmpsSelXaYEsgxvQwvtwM?=
 =?us-ascii?Q?EJdXjMdlgfG73crH+ZzIOeA7xgBK6nEdCgr9pRIJMwPqHB/bRu3Sj0gGxDn9?=
 =?us-ascii?Q?V1DNzwl0jxBTu+hImefWrdbXessBjruoX82f2uaJrGn5z6FmqVNVvHN0sLL/?=
 =?us-ascii?Q?htRI+6QkmrD0OoqESWQzuNiRNlJiQpqADknv6GONrSWOGb9TddtoxrrYixJ5?=
 =?us-ascii?Q?J+DDTsswfaxCD4e7tzPiNg++YGmhhPosryfzufyz9nlCUt905mc+WyopoTnn?=
 =?us-ascii?Q?Hpwd6CFa9Nb5I/4jEe+JTyx2OTrzS7MRZqTLLrYqW+mLwdpaCawJa3w0MZdk?=
 =?us-ascii?Q?pwJY1fh5UUFzL/6iZWwrR9JmVqnAjb7nzLjajrSWv4vjyYDMl8Ticb8l3VQg?=
 =?us-ascii?Q?d9wrPz7Ce9Wp2lGluF9MVvp+PmuwGlD3tycxWbjUljMym4B0EVAp6j0iT5ip?=
 =?us-ascii?Q?Cd2LFMKWO4BG6GR1OLI32c57YxNyp5G3Z/yqrAV2jPR2KlnAU+nhCsVzR+U1?=
 =?us-ascii?Q?9aPIbojh5WBDTRSKmTgBmrd/JrsJqH8kdWpH55ovFEmnp13DQ5m6Mi5ljKuQ?=
 =?us-ascii?Q?lj9nYtBN1JSPAEBx+gih2vA1a9MFbKEyr7gObdbg246j86gusogVkgI8BHjU?=
 =?us-ascii?Q?LDrfH2FbHuuzzcgOZFCPQ4F4YTzcUO4/9PQ/jbw+dsTZZ5xU//yDDylAzirg?=
 =?us-ascii?Q?LQDghQP6mApZuYDKrh0+yHuHWCf9KiajuUFNRvIrqqrdUj+doxvWJvEiEiLS?=
 =?us-ascii?Q?91tVrT6fShevHP3qK3fYi2wZ4MogXmpzjRGEJkVcrpqtCtsq5nIVBTUwoJ8u?=
 =?us-ascii?Q?+JCSkCtq4z7xwhY4YS6nrwX7vFdbaY8zrHQBNhTa09HeoigAhXetAKcT1AD3?=
 =?us-ascii?Q?jFHQxKhElOejIRHr4Ch2BHqbBNpwS6hHYC0AT4eFFc33du45vnFzozwPX5ug?=
 =?us-ascii?Q?tTiv/8zEKBKd0GHyBownYWy6LOykNXJsW5DJrZYgoJnSseSgpJyM5vmgn2yS?=
 =?us-ascii?Q?Hes3my0P08VSFYWW//ul8EozS60JToXPhcSrm5B4Ld6yKqcw1zHegG2SQWUC?=
 =?us-ascii?Q?vIaSolaEHgvUV/EK40z7nk7LrdISgl75MG6msnCEJwBSUGRt71OJLR36PNpz?=
 =?us-ascii?Q?layzUndVydl7tOUaU4yNOppTGvZz86EUHexa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jkaTrhJWGCYYPfjtvO7FkDS0fHwhVhf4erIMHR8RBrfk1nuVAOgnFbbbYkf8?=
 =?us-ascii?Q?H2wgWVyNzFACpyeYI4UraF6OOBsJqd9b86+cTx3YzuwewtXpTJTQCwHt6hZM?=
 =?us-ascii?Q?9I//QzYK4O/oIsodelY8qEFv2hVVTJ7J4R5J12IqpIHPs2hIowhTPiwy+4yQ?=
 =?us-ascii?Q?kZiL1m+AbhPzaYfO6uwbv3RZcs/QNZBkpD9sGVvtZvBQ7n1OVjXWIjZg0qVv?=
 =?us-ascii?Q?sns97xV+pu6iJaJdw6iOy/SiOltZf21DPhYWAGwjpC8FE4ivQggyhV+rr8c6?=
 =?us-ascii?Q?KNet9lA4jNApNSD7+S/MijTe35A0302qwZARg6hckbZMUletBsAgkq93cYE4?=
 =?us-ascii?Q?uo8yaXwDrxnqIhdEpON7z4Ve3jDal3A9eSJU2T5IzxnHMRyQyOWb+f/kslX+?=
 =?us-ascii?Q?qZKtTXTZnRHHQj4PhffUEhMOkwjmUHNAHe0cRHQOXRjrXTrEV8T8pCE1gqfg?=
 =?us-ascii?Q?Cz/ZthWvDXOpHqPNg0SstF56mwVvWLhQg4nzuuS9uon452S5FdSO3U4cFAEa?=
 =?us-ascii?Q?9t/G+Q5wCxBHVJypFC7A+R+wk02wl2EzJ9POBr075GP/qatapWLfOsKlSa1q?=
 =?us-ascii?Q?FuAByyEq26KBNn+A2C/XwesySozUbUo+5LqYNpcW4T1l3+C+QcIfIFrKgM/u?=
 =?us-ascii?Q?VEnPFZGFuMufBtyWt9A7jppcb/XJaWY5CqDbc2jjvK2u8i7LAk9aEDi3PWZK?=
 =?us-ascii?Q?0PvN7PAOC74ZG6dNJ0mxxBiNkbHHnn0HDUtad8NUYZlRNVm1ZMbKtEvpP6N9?=
 =?us-ascii?Q?E/4uvTnm+yhNs0H7sU4xhNDLToqamCfwDt983I1H9fIguRx3HoAxDbeRuLV1?=
 =?us-ascii?Q?w4wLPiaQJ6t6Ta37HyXQCr6hqoSEoyrHRFxigGUdX7mLXuawTqwh/nQIRm3Q?=
 =?us-ascii?Q?KkIaFAziaxQVL6/N8fGhsHbPW+S6b1c0iNKsDKr14vfWBNyj4DWy3H2YhiWJ?=
 =?us-ascii?Q?HJxjKBnpkCP4Y9F8u8HEGTxZy0VXHJjVBmkdcVQ5VluvL4VHIXNqWWdqjsMS?=
 =?us-ascii?Q?JFt/037JwoXcXQY/dMvs0neVl/FKU4QI9AYcs9JF5GeflXhaENoT9s+m+rSA?=
 =?us-ascii?Q?9ZqSfMp4dXnt6+fdBTkCJzoTEZ1Z092xDxLZ/MVUScOkA9WaCaggXJ9hlOGP?=
 =?us-ascii?Q?7kiprAJ07iKUkVuLi+7fHn8LMiQhfL7AD/rfkk3pH+tzxutFEfe1jXpTiRJK?=
 =?us-ascii?Q?IXYJnOJkJoy5otfOFjf5CQ4sG5FLdQS0D5Uzsx9SkZZkysgQfXKURXG6QAJY?=
 =?us-ascii?Q?JIN5veO+OI7yd8nJq/7ARv32pvfMfhIc/7t3wAvLi9cQE/DSL0Vf2/IdgRgx?=
 =?us-ascii?Q?5Q5oa+RaIaubkkINHdjU4y5RPwmImWMaLNy/drbQqT23s5qfTk1in5yKc8o8?=
 =?us-ascii?Q?B9i2UbyYmW4f098mV68C/arrqCmIesVhOls2nTu4EzokIfeodgVit2mXg1xd?=
 =?us-ascii?Q?DTO7/cqAKExyRYbiUZxaLGCpuoHm4Ne/FzZ6DNwzImRC/nw3g5hAINqUE1pH?=
 =?us-ascii?Q?bWNL/lF996W4Q60m8pF765sksw++I1oDAOOThaQYM7dlOzgAuijcxpHP79P8?=
 =?us-ascii?Q?s5K9ji0KX7NuY6wYgDk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd01935-d658-4799-79a0-08de3c4a9451
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 02:26:54.6705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bsbl4H8NgX02zM1VH5NJi2DA/pRE8DnJrYyISaDbjxpzx0r9bP5mD0vFeKLERa4JQ8F9Duyjq7jSWH47l7N4kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

Hi Frank,

> Subject: Re: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callb=
ack
> for i.MX7ULP suspend
>=20
> On Mon, Dec 15, 2025 at 03:26:05PM +0800, Jacky Bai wrote:
> > On i.MX7ULP platform, certain drivers that depend on rpmsg may need to
> > send an rpmsg request and receive an acknowledgment from the remote
> > core during the late_suspend stage. In the current imx_rproc
> > implementation, rx_callback defers message handling to a workqueue.
> > However, this deferred work may not execute before the system enters
> > the noirq_suspend stage. When that happens, pending mailbox IRQs will
> > cause the suspend sequence to abort.
> >
> > To address this, handle incoming messages synchronously within
> > rx_callback when running on i.MX7ULP. This ensures the message is
> > processed immediately, allows the mailbox IRQ to be cleared in time,
> > and prevents suspend failures.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 49
> > ++++++++++++++++++++++++++++++++++++++++--
> >  drivers/remoteproc/imx_rproc.h |  1 +
> >  2 files changed, 48 insertions(+), 2 deletions(-)
> >
> ...
> >
> > -	queue_work(priv->workqueue, &priv->rproc_work);
> > +	if (priv->use_sync_rx)
> > +		idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
> > +	else
> > +		queue_work(priv->workqueue, &priv->rproc_work);
> >  }
> >
> >  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool
> > tx_block) @@ -1009,6 +1015,38 @@ static int
> imx_rproc_sys_off_handler(struct sys_off_data *data)
> >  	return NOTIFY_DONE;
> >  }
> >
> > +static int imx_rproc_pm_notify(struct notifier_block *nb,
> > +	unsigned long action, void *data)
> > +{
> > +	int ret;
> > +	struct imx_rproc *priv =3D container_of(nb, struct imx_rproc, pm_nb);
>=20
> 	struct imx_rproc *priv =3D container_of(nb, struct imx_rproc, pm_nb);
> 	int ret;
>=20
> > +
> > +	imx_rproc_free_mbox(priv->rproc);
> > +
> > +	switch (action) {
> > +	case PM_SUSPEND_PREPARE:
> > +		ret =3D imx_rproc_xtr_mbox_init(priv->rproc, false);
>=20
> Any risk condition if on going message during free() and _init()?

After some further investigation, changes in remoteproc is too complex and =
many corner case
to handle. Plan to solve the issue directly from mailbox driver. Please ign=
ore this patch.

Thx for your time.

BR
Jacky Bai
>=20
> > +		if (ret) {
> > +			dev_err(&priv->rproc->dev, "Failed to request non-blocking
> mbox\n");
> > +			return NOTIFY_BAD;
> > +		}
> > +		priv->use_sync_rx =3D true;
> > +		break;
> > +	case PM_POST_SUSPEND:
> > +		ret =3D imx_rproc_xtr_mbox_init(priv->rproc, true);
> > +		if (ret) {
> > +			dev_err(&priv->rproc->dev, "Failed to request blocking
> mbox\n");
> > +			return NOTIFY_BAD;
> > +		}
> > +		priv->use_sync_rx =3D false;
> > +		break;
> > +	default:
> > +		break;
>=20
> imx_rproc_free_mbox() here? if other notify comming,  mbox is free() as
> expected?
>=20
> Frank
> > +	}
> > +
> > +	return NOTIFY_OK;
> > +}
> > +
> >  static void imx_rproc_destroy_workqueue(void *data)  {
> >  	struct workqueue_struct *workqueue =3D data; @@ -1103,6 +1141,13
> @@
> > static int imx_rproc_probe(struct platform_device *pdev)
> >  			return dev_err_probe(dev, ret, "register restart handler
> failure\n");
> >  	}
> >
> > +	if (dcfg->flags & IMX_RPROC_NEED_PM_SYNC) {
> > +		priv->pm_nb.notifier_call =3D imx_rproc_pm_notify;
> > +		ret =3D register_pm_notifier(&priv->pm_nb);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "register pm notifier failure\n");
> > +	}
> > +
> >  	pm_runtime_enable(dev);
> >  	ret =3D pm_runtime_resume_and_get(dev);
> >  	if (ret)
> > @@ -1202,7 +1247,7 @@ static const struct imx_rproc_dcfg
> > imx_rproc_cfg_imx8ulp =3D {  static const struct imx_rproc_dcfg
> imx_rproc_cfg_imx7ulp =3D {
> >  	.att		=3D imx_rproc_att_imx7ulp,
> >  	.att_size	=3D ARRAY_SIZE(imx_rproc_att_imx7ulp),
> > -	.flags		=3D IMX_RPROC_NEED_SYSTEM_OFF,
> > +	.flags		=3D IMX_RPROC_NEED_SYSTEM_OFF |
> IMX_RPROC_NEED_PM_SYNC,
> >  };
> >
> >  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d =3D { diff --gi=
t
> > a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> > index
> >
> 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..0e3e460cef4ed9340fb4977
> 183e0
> > 3143c84764af 100644
> > --- a/drivers/remoteproc/imx_rproc.h
> > +++ b/drivers/remoteproc/imx_rproc.h
> > @@ -18,6 +18,7 @@ struct imx_rproc_att {
> >  /* dcfg flags */
> >  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
> >  #define IMX_RPROC_NEED_CLKS		BIT(1)
> > +#define IMX_RPROC_NEED_PM_SYNC		BIT(2)
> >
> >  struct imx_rproc_plat_ops {
> >  	int (*start)(struct rproc *rproc);
> >
> > ---
> > base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
> > change-id: 20251211-imx7ulp_rproc-57999329239b
> >
> > Best regards,
> > --
> > Jacky Bai <ping.bai@nxp.com>
> >
