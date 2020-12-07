Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9DDC433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 02:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64A7C22C7C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 02:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgLGCLF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 6 Dec 2020 21:11:05 -0500
Received: from mail-eopbgr50074.outbound.protection.outlook.com ([40.107.5.74]:24880
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726489AbgLGCLE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 6 Dec 2020 21:11:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HveV5ui8WyLLiY3gYrMgPshCxSyT8rbow4DfS2dzZWzkcDvYodJodapGz/fXbLNkAkG9DVkcuKZ40SibSRj6RdjjSEWHXiDK4Z9DbfuVw6p+o2gxR3722uBqM1NIIAjzmXhiBrzXvPOLwDbkkbNjfmQPU4amC8xzdsae3e277zpBux95Ng2bxxMnc006zk3ckpYxDSN/0zFmGvfEgPzdc5oDKnT2m0CpsPjgjNizcxxcydGHZTJyj/WPtzohX2gmiD+Ipk14CgsCgHL25LHBvs+6szuyny5BIxK9YpW/1pIcR2iCZC1ZgCFF+OyAXOgNFwTo5F5wGYqZk6keLlqehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vsY5Vl0yQb+gZEDnJiPI8GWfAx+pM7ZAwkQtxjVE6c=;
 b=cgoRyJwC1AnkMb771muTER/i0hNH8z4ge6enwtsFnIJEws3M2C7vVk0Y/5NRfiCft6i43aI1D1ByWld0QSuHsWUtjpOMZXcVx5Z/l9g3opSbdl2lal77k4FBtWZB7xz/iMrwauS9wt+wEGVF9jAhhWmOcIvgicVTKr55B1b3stEdaypx2g6oYOV0epLp+Q18ls/dJl0JOYTWVfdwPtLO16rrIkfrZSz41lLf28bgakmQJQs1zUGQYq3c4DsXNU9p4f9Ei17nmHgpUDF4wlKgaMdzvocKFS+3z4VBTtGUUDBilhcecwAXIThTYbEAv+NdWTPRvN6RM6+ACMSrIw9Ozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vsY5Vl0yQb+gZEDnJiPI8GWfAx+pM7ZAwkQtxjVE6c=;
 b=ZEaEKwpP/dS58jF/jTsiO7CGaf3abeKATUP8RaEQ5J+lYfNUoWommUjl8mA8Nch6Dar+2aTTDIIvHitjIt+9KY7aslmd7JbTx7/gqv8ypZDCQr1+N3U+4Ht+fRPOk1hwDVA+eUXJ4HqEEYXxxqJ3BPrc99SMHxPgOFa1vD1fOCw=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 7 Dec
 2020 02:10:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Mon, 7 Dec 2020
 02:10:13 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH V3 7/7] remoteproc: imx_proc: enable virtio/mailbox
Thread-Topic: [PATCH V3 7/7] remoteproc: imx_proc: enable virtio/mailbox
Thread-Index: AQHWygzyWV7eKGJT5Um3A3DC//c6Fqnnq3WAgAM8PNA=
Date:   Mon, 7 Dec 2020 02:10:12 +0000
Message-ID: <DB6PR0402MB276040D350D7BA75BB09BCE788CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
 <20201204074036.23870-8-peng.fan@oss.nxp.com> <X8rX6Rs6xvBkZEn3@builder.lan>
In-Reply-To: <X8rX6Rs6xvBkZEn3@builder.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 26efe27a-2603-409e-c9d1-08d89a553b49
x-ms-traffictypediagnostic: DB7PR04MB4633:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4633C69467852784AB372ABF88CE0@DB7PR04MB4633.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u9npq008XSdFlIVzQg/L8VUnffVirGAgCOQTlNHC5OcNKXi/K/c1VJoK+moFtm9OYGeKX+zHw9tdvXJ96ov7da0e/xHqDNdMC0l1j/Dy2LOfW/7SJeXBcR6sAtYR50EPqu01t7X80AM8G7aXbE8Elf5a1LSTD/zLv5MvAqbB4kD5lqDJAdB0ZViUcxHEuPkvrqkWIR/vp8WZ2w7nzxZ5kUtZslAOkDidFyMxqHEB1ZPWItTh5K/U3iEVmHaJFe2OId2MKwuFtV942Cag5mAhJi7ggyOZ6Vlfnaxgplttx6stX2vS82xkoQxWGXtdknCZyxyj9RSVWcxH8wW2f3ln1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(64756008)(4326008)(66556008)(71200400001)(76116006)(66946007)(86362001)(15650500001)(8936002)(478600001)(55016002)(26005)(66476007)(83380400001)(52536014)(9686003)(5660300002)(2906002)(6506007)(7696005)(186003)(7416002)(110136005)(54906003)(33656002)(66446008)(8676002)(316002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?P91N5aVoWYqx8AnokESpoCxLw1nPFkGNG9usaI5D8HHCy5V5C7v5ftnak+ZE?=
 =?us-ascii?Q?ba7xdcaj6PPJqPnqZCyh4XOxTF58c+M5PsZ3F1XPKvwn3veOHz4zGVts4wKg?=
 =?us-ascii?Q?RwkOs31dvpYgocl+siAi+pdRiAmQmVtvmDwM19a5iAWhhV5/T4RPbWQ4+2kB?=
 =?us-ascii?Q?DVED00bj6iDe4YGACLtWaJWShjSaVhmGE3ILdN4fjKhRF24gt/3QwWUFUF72?=
 =?us-ascii?Q?gnPbBRpBM+X35a2H+8wbdklpP0LXqrRUTyVkoSy/FkjIwm18aAT3TA1j+e8h?=
 =?us-ascii?Q?/N8c2bQYvoH7lrXz7/9n+lpz0OqHIHrzNU3fB6b8p6YLKkyHUcNh1YutHv7G?=
 =?us-ascii?Q?NGOcpLA39E9z3dVpPv2fCOktJl/e40fvoq6akfqpthfsfzYbTWhEk/FNmjHz?=
 =?us-ascii?Q?ljy/gU2fIsZMWf5pEppDLx/N97Kx1YEP6ObnD2FsG6l6dQANWgd7tQKBasvL?=
 =?us-ascii?Q?5V53uvyf14+bvGrVB9SV203POshanijhX4iXM3aAx6zSNP6oOKsVykyfUVTF?=
 =?us-ascii?Q?tmtninWdCNDfFoO8YSboUuD2LscvIuyK9w69+NsEUjAteFfq5Je/JnG0dt9l?=
 =?us-ascii?Q?nqGsEymNEbjLR06v3FbhM9CENQmY+HIx8ArNev9/NMZTiLXYXn1/jxVilCju?=
 =?us-ascii?Q?wzk3FZ48B4zUCLCzuaftN7N8zwnAxni/5Yv9jzHTBoEygutMdfFB1pdLiCZW?=
 =?us-ascii?Q?85STntiNLVOjQSma9fOr67LZ4+mEoQTIRWv/5DNOqQ43JCwxYpaX0jlMQqlT?=
 =?us-ascii?Q?tzSZnTmzeyRoU5SH2EexbGuA9Uo+MxUwz++UFavoewurAl0YGUj7lON+ggHz?=
 =?us-ascii?Q?wp59qAyi+BCmS19/nF8BNYmk6CwM79MPwGAz6y24WWXkZOJicM5rUBHs4rDV?=
 =?us-ascii?Q?vuWjFdCdR+foPTSD4yCosLKiG0f7Csx9ffflrWlutgui4zYC6WtwaPvnHqJL?=
 =?us-ascii?Q?2W5TbQAvO6AnLjMthyHkdNpE6+iZQIW+e+7TFxRUcN4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26efe27a-2603-409e-c9d1-08d89a553b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 02:10:12.9674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvDzE/tjQow8ChOTj/5MpErW/YkAa3x4C3P4LlbhOu6QXnZlorgsMv3DPiHfEMg7NWgdCmUpbYxjAfaLA31LLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V3 7/7] remoteproc: imx_proc: enable virtio/mailbox
>=20
> On Fri 04 Dec 01:40 CST 2020, Peng Fan (OSS) wrote:
>=20
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use virtio/mailbox to build connection between Remote Proccessors and
> > Linux. Add work queue to handle incoming messages.
> >
> > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 133
> > ++++++++++++++++++++++++++++++++-
> >  1 file changed, 130 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index afa650610996..584584a00921
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mailbox_client.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> > @@ -16,6 +17,9 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include "remoteproc_internal.h"
> >
> >  #define IMX7D_SRC_SCR			0x0C
> >  #define IMX7D_ENABLE_M4			BIT(3)
> > @@ -88,6 +92,11 @@ struct imx_rproc {
> >  	const struct imx_rproc_dcfg	*dcfg;
> >  	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
> >  	struct clk			*clk;
> > +	struct mbox_client		cl;
> > +	struct mbox_chan		*tx_ch;
> > +	struct mbox_chan		*rx_ch;
> > +	struct work_struct		rproc_work;
> > +	struct workqueue_struct		*workqueue;
> >  };
> >
> >  static const struct imx_rproc_att imx_rproc_att_imx8mq[] =3D { @@
> > -369,9 +378,33 @@ static int imx_rproc_parse_fw(struct rproc *rproc,
> const struct firmware *fw)
> >  	return 0;
> >  }
> >
> > +static void imx_rproc_kick(struct rproc *rproc, int vqid) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +	int err;
> > +	__u32 mmsg;
> > +
> > +	if (!priv->tx_ch) {
> > +		dev_err(priv->dev, "No initialized mbox tx channel\n");
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * Send the index of the triggered virtqueue as the mu payload.
> > +	 * Let remote processor know which virtqueue is used.
> > +	 */
> > +	mmsg =3D vqid << 16;
> > +
> > +	err =3D mbox_send_message(priv->tx_ch, (void *)&mmsg);
> > +	if (err < 0)
> > +		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
> > +			__func__, vqid, err);
> > +}
> > +
> >  static const struct rproc_ops imx_rproc_ops =3D {
> >  	.start		=3D imx_rproc_start,
> >  	.stop		=3D imx_rproc_stop,
> > +	.kick		=3D imx_rproc_kick,
> >  	.da_to_va       =3D imx_rproc_da_to_va,
> >  	.load		=3D rproc_elf_load_segments,
> >  	.parse_fw	=3D imx_rproc_parse_fw,
> > @@ -454,6 +487,77 @@ static void imx_rproc_memset(struct rproc *rproc,
> void *s, int c, size_t count)
> >  	memset_io((void * __iomem)s, c, count);  }
> >
> > +static void imx_rproc_vq_work(struct work_struct *work) {
> > +	struct imx_rproc *priv =3D container_of(work, struct imx_rproc,
> > +					      rproc_work);
> > +
> > +	rproc_vq_interrupt(priv->rproc, 0);
> > +	rproc_vq_interrupt(priv->rproc, 1);
> > +}
> > +
> > +static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> > +{
> > +	struct rproc *rproc =3D dev_get_drvdata(cl->dev);
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +
> > +	queue_work(priv->workqueue, &priv->rproc_work); }
> > +
> > +static int imx_rproc_xtr_mbox_init(struct rproc *rproc) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +	struct device *dev =3D priv->dev;
> > +	struct mbox_client *cl;
> > +	int ret =3D 0;
> > +
> > +	if (!of_get_property(dev->of_node, "mbox-names", NULL))
> > +		return 0;
> > +
> > +	cl =3D &priv->cl;
> > +	cl->dev =3D dev;
> > +	cl->tx_block =3D true;
> > +	cl->tx_tout =3D 100;
> > +	cl->knows_txdone =3D false;
> > +	cl->rx_callback =3D imx_rproc_rx_callback;
> > +
> > +	priv->tx_ch =3D mbox_request_channel_byname(cl, "tx");
> > +	if (IS_ERR(priv->tx_ch)) {
> > +		if (PTR_ERR(priv->tx_ch) =3D=3D -EPROBE_DEFER)
> > +			return -EPROBE_DEFER;
> > +		ret =3D PTR_ERR(priv->tx_ch);
> > +		dev_dbg(cl->dev, "failed to request mbox tx chan, ret %d\n",
> > +			ret);
>=20
> This is worse than a dev_dbg(), something is actually wrong.
> Also there's no point in jumping to err_out here, because tx_ch is
> IS_ERR() so we're going to skip the first part and rx_ch is not IS_ERR() =
so
> you're going to call mbox_free_channel(NULL) and then return.
>=20
> So just replace this entire block with:
>=20
> 		return dev_err_probe(dev, PTR_ERR(priv->ch_ch),
> 				     "failed to request tx mailbox channel: %d\n",
> 				     ret);

Yeah. Thanks.

>=20
>=20
> > +		goto err_out;
> > +	}
> > +
> > +	priv->rx_ch =3D mbox_request_channel_byname(cl, "rx");
> > +	if (IS_ERR(priv->rx_ch)) {
> > +		ret =3D PTR_ERR(priv->rx_ch);
> > +		dev_dbg(cl->dev, "failed to request mbox rx chan, ret %d\n",
> > +			ret);
> > +		goto err_out;
>=20
> 		mbox_free_channel(priv->tx_ch);
> 		return dev_err_probe(dev, PTR_ERR(priv->ch_ch),
> 				     "failed to request rx mailbox channel: %d\n",
> 				     ret);
>=20
> > +	}
> > +
> > +	return ret;
>=20
> ret is 0 here.

Yes.

>=20
> > +
> > +err_out:
> > +	if (!IS_ERR(priv->tx_ch))
> > +		mbox_free_channel(priv->tx_ch);
> > +	if (!IS_ERR(priv->rx_ch))
> > +		mbox_free_channel(priv->rx_ch);
> > +
> > +	return ret;
> > +}
> > +
> > +static void imx_rproc_free_mbox(struct rproc *rproc) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +
> > +	mbox_free_channel(priv->tx_ch);
> > +	mbox_free_channel(priv->rx_ch);
> > +}
> > +
> >  static int imx_rproc_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -496,18 +600,31 @@ static int imx_rproc_probe(struct
> platform_device *pdev)
> >  	priv->dev =3D dev;
> >
> >  	dev_set_drvdata(dev, rproc);
> > +	priv->workqueue =3D create_workqueue(dev_name(dev));
> > +	if (!priv->workqueue) {
> > +		dev_err(dev, "cannot create workqueue\n");
> > +		ret =3D -ENOMEM;
> > +		goto err_put_rproc;
> > +	}
> > +
> > +	ret =3D imx_rproc_xtr_mbox_init(rproc);
> > +	if (ret) {
> > +		if (ret =3D=3D -EPROBE_DEFER)
> > +			goto err_put_wkq;
> > +		/* mbox is optional, so not fail here */
>=20
> imx_rproc_xtr_mbox_init() returns 0 if no mbox was specified, that means
> that in all cases that we reach here mailboxes where specified but an err=
or
> occurred. You should not ignore this.

ok, fix in v4.

>=20
> > +	}
> >
> >  	ret =3D imx_rproc_addr_init(priv, pdev);
> >  	if (ret) {
> >  		dev_err(dev, "failed on imx_rproc_addr_init\n");
> > -		goto err_put_rproc;
> > +		goto err_put_mbox;
> >  	}
> >
> >  	priv->clk =3D devm_clk_get(dev, NULL);
> >  	if (IS_ERR(priv->clk)) {
> >  		dev_err(dev, "Failed to get clock\n");
> >  		ret =3D PTR_ERR(priv->clk);
> > -		goto err_put_rproc;
> > +		goto err_put_mbox;
> >  	}
> >
> >  	/*
> > @@ -517,9 +634,11 @@ static int imx_rproc_probe(struct platform_device
> *pdev)
> >  	ret =3D clk_prepare_enable(priv->clk);
> >  	if (ret) {
> >  		dev_err(&rproc->dev, "Failed to enable clock\n");
> > -		goto err_put_rproc;
> > +		goto err_put_mbox;
> >  	}
> >
> > +	INIT_WORK(&(priv->rproc_work), imx_rproc_vq_work);
> > +
> >  	ret =3D rproc_add(rproc);
> >  	if (ret) {
> >  		dev_err(dev, "rproc_add failed\n"); @@ -530,6 +649,13 @@ static
> int
> > imx_rproc_probe(struct platform_device *pdev)
> >
> >  err_put_clk:
> >  	clk_disable_unprepare(priv->clk);
> > +err_put_mbox:
> > +	if (!IS_ERR(priv->tx_ch))
>=20
> With above changes you won't get here with IS_ERR(tx_ch) || IS_ERR(rx_ch)=
,
> so you can safely remove the conditionals and just call mbox_free_channel=
().


Yes.

After we agree on the new method of patch 1/7, I'll post out v4.

Thanks,
Peng.

>=20
> Regards,
> Bjorn
>=20
> > +		mbox_free_channel(priv->tx_ch);
> > +	if (!IS_ERR(priv->rx_ch))
> > +		mbox_free_channel(priv->rx_ch);
> > +err_put_wkq:
> > +	destroy_workqueue(priv->workqueue);
> >  err_put_rproc:
> >  	rproc_free(rproc);
> >
> > @@ -542,6 +668,7 @@ static int imx_rproc_remove(struct platform_device
> *pdev)
> >  	struct imx_rproc *priv =3D rproc->priv;
> >
> >  	clk_disable_unprepare(priv->clk);
> > +	imx_rproc_free_mbox(rproc);
> >  	rproc_del(rproc);
> >  	rproc_free(rproc);
> >
> > --
> > 2.28.0
> >
