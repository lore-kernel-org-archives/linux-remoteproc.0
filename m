Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D650BC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:49:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D7BE23787
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392598AbhAUBql (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:46:41 -0500
Received: from mail-eopbgr50069.outbound.protection.outlook.com ([40.107.5.69]:12608
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728323AbhAUBWo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:22:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQ7MvwFI2+QH8ZA/HVMz/3SEg1ker60jTQEWNPTBOWwC1Hl8WS1hQIZoRVWmcH4yGekMoPj55/wqvT6/w0tv/YgKeJfbtHMc+Hr1+FupaVJbmxRAvGY67h6D6uxb8rGMCwwietb5+ZErjMR5Jd7tP5GlesWtxn58qkGs7j6jxm4dEraYZdO/w8u1kpIJ7IvJUWzCKsBjZPtSdzK0X029K4vhzsXGumFFEN57XMhV/dB703e3x60niBpK9RRnBetRc1T1jYDjc8U3uptbGUMNxcn41u/SpdgSBADFixb4rUScavvCsNZ63BX/CQ2BCjZDY3acGeh84s7CX6OqcgIKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVecKVDmNetlkAx40CW3xP1cuH2IOH6u7H8evx3Hh3E=;
 b=Ze6wOVR6T+MslY+P4YhoCyojM6Y8VwZPVGAzWBzw6DwdLbC9TCuYUYndcYU5wKt1vJoNmKlIqsxUVuPMhyPWy0ROsMidTGml5vxQvsov1VTIr1K6B0hkbrHWPQHkMjuCoIbPHuuITZI0qAEx3QL6csSEpTjefbor2oqawl6UXYUnrJEQem2D2ZkoNcyb8Glz2aBryl7Ga47/YACL+CGz+qp2KV4o/+kc7/h0y8d48nU765GJG744LFecPy/DxiIq6ZhuPdB13huf1vxAnTGOPD9Uv/R24A+7cNpGyC/r7cW/jpgJv+0Z2uL5H1ck3U3qVIxfQgqNdBoDLhXKIredpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVecKVDmNetlkAx40CW3xP1cuH2IOH6u7H8evx3Hh3E=;
 b=P6nttAw/lcdGs28Slbd0pIQblbq27XUA6cryWANYtSKs4OOndZjSeAIGm8AEHmmMD1w5LSmE4kYVIo1lQgnh+PyFEpfQrSpbkuloGf7ztYzS/kZKSLENNwFQ59hfrY+tb/wFV9vLP8v1TzrZUiyH9fAbdo6RPs8lhy3U3KHMTbg=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 01:21:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:21:51 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: RE: [PATCH V8 10/10] remoteproc: imx_proc: enable virtio/mailbox
Thread-Topic: [PATCH V8 10/10] remoteproc: imx_proc: enable virtio/mailbox
Thread-Index: AQHW7jc1x/iKzwWwUkOaIE6ju9sDRqovJvgAgAIjzYA=
Date:   Thu, 21 Jan 2021 01:21:51 +0000
Message-ID: <DB6PR0402MB276074D0A10866EDA016F9BA88A10@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
 <1611041711-15902-11-git-send-email-peng.fan@nxp.com>
 <20210119163948.GC611676@xps15>
In-Reply-To: <20210119163948.GC611676@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [114.220.136.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7e487fb2-0bd3-4d1a-6c46-08d8bdaaee7f
x-ms-traffictypediagnostic: DBBPR04MB7948:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB7948EB5679717BF09BB1CA7F88A10@DBBPR04MB7948.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 63k4exHgSkyvLUz1qlOfDOTLE/WMRPuuDGcoqRZmm3JiTw5wANMIcpYgojtgxRkYH7ysrym6BWkvbWblFmvaXwtUr8xgUJGZu9WDdO2ZdgNhx/WNHHF6qJWB1ZHnNgtykyH5Nse8YP+7dOF8TtZ9YI7BFTyLH9mBdiptLAjBMpysBGyW0YcSB5hTwX4UUvqqWF0kVScKWqAx7cDWMT1btfuN4YI/9EHsJI40cAlhEWHZTlX5JW8G/6qjshbMiMNcFHwc7cVTLALvdWuad5IY3JDAXCcYRts6hoH37rVLhbMgXu8ysJ2DzhjSASYbwWNsDkLCBE8Oq5/L+qqFWDtWevqbEALnda6g1/JInbMI5Itbu8Yth58pmCbWWljy3arAmvo6Zgngd3F/BjShYz4CDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(66446008)(6916009)(71200400001)(7696005)(64756008)(478600001)(52536014)(66556008)(86362001)(8936002)(9686003)(316002)(54906003)(6506007)(8676002)(2906002)(44832011)(186003)(15650500001)(66476007)(55016002)(5660300002)(83380400001)(76116006)(66946007)(26005)(7416002)(33656002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jsq6M8Nu73M5VEB/CTXHYzezXex88vBqzWq8EmYx1lcYrxPdVNSEmZdPrl2T?=
 =?us-ascii?Q?u3h+eyb43tHYn4x8T10zv8TwSGB6wH37BRidqrk8S/YoggrzYjtJM3NM5zW9?=
 =?us-ascii?Q?rjUAbevbeoNh6vDlClnxQoCfZpJFtjevu2PVNHzClX2rzVKLpBllP2+jtfYi?=
 =?us-ascii?Q?YVcUMNldZCVhzOa4ZZZuHvdqsW2UcYV8heMF7W1mhNKkVKIofubm53yIhKpS?=
 =?us-ascii?Q?oRdkSMegPCenHPUu8da8DnBx94402QiLYDvDqEAoVHu180uwxrVs6H5vou9s?=
 =?us-ascii?Q?scJY7mJlwDWaigh2hocPrrVk33hhFv7ipDn1omDPyPl+Rr0cjyX/LFXXYdLo?=
 =?us-ascii?Q?y9TqHwBI3E9jWKO13Vc8SEC/hSa1DtG0VQVVmUhrX11mLKWhDKmR5m8vKUvx?=
 =?us-ascii?Q?3Aa2g8s5XtcUnVWOBhlqB2AmKnfG1QcKolI6IRXUrdzCceoOojHQ+VDkwL3r?=
 =?us-ascii?Q?2GdsRyj+fzxn5idoELeriBxgQR8FfcKvHUUeD8enW569SXOcQSk4jiRgs8XD?=
 =?us-ascii?Q?7aNijjHGA7ralHnV0p9lio8gG+jfIEz9Ek5UTD1TMMf555AR7k05nal4FitL?=
 =?us-ascii?Q?v/cpZKMSwNRiwWzQiIsxA1KddwydtETE24n8U5e6kKjbCJoVTWEdYvJpMeLM?=
 =?us-ascii?Q?+P4InG7I6ja/M+xttB12CGsoO27tsaDzyxX5QMG9RebZshCO06/b+YELiQbP?=
 =?us-ascii?Q?6xPUhdVPPsL3CHH4LTQ6i3Zcqk0CyzCwyGujberW+xgKxN1hkwUjOau2mmjX?=
 =?us-ascii?Q?TZVksj6ZfMnY3OiK5ZgwpRDp+tRnLSbOzTWhfD+mZP/kgYR9FAe/MAzww3tE?=
 =?us-ascii?Q?XW5xl/wTU8hqrwjDzP4DLQrDNGVfKnqo+9feWRvYCgatKW3+lGoOJIGmhtH6?=
 =?us-ascii?Q?O3p6f0NZ8gLS6WUcde3u0cw9OZGav/+uNabp9Zs5jMnaZi6/hvz6PLYq7P2K?=
 =?us-ascii?Q?99iqGZxiYiLHrh7+b6CZyGIbHwM3/ml33sfD3jFJ1eU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e487fb2-0bd3-4d1a-6c46-08d8bdaaee7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 01:21:51.5223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FLxxSkbztj3kedSWe+UPNSh79V5fJheSyFV/deK61kSZMW9XXQt6qhUKR5ToLa7dzxs9AifO2LQOkMPgK9GbWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V8 10/10] remoteproc: imx_proc: enable virtio/mailbox
>=20
> On Tue, Jan 19, 2021 at 03:35:11PM +0800, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use virtio/mailbox to build connection between Remote Proccessors and
> > Linux. Add work queue to handle incoming messages.
> >
> > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 116
> > ++++++++++++++++++++++++++++++++-
> >  1 file changed, 113 insertions(+), 3 deletions(-)
>=20
> Reviewed-by: Mathieu Poirier <mathieu.poirer@linaro.org>
>=20
> I will pickup this set when Rob has reviewed the DT bindings.  In the mea=
n
> time you might want to fix the title section in the the .yaml file, the K=
config
> and the MODULE_DESCRIPTION and add a reference to i.MX8.

Thanks for your reviewing efforts.

I have updated patch 2, 8 in v9 to address the issue you mentioned.

Thanks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index 54ac143ba033..c16a91f8e410
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/err.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mailbox_client.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> > @@ -15,6 +16,9 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include "remoteproc_internal.h"
> >
> >  #define IMX7D_SRC_SCR			0x0C
> >  #define IMX7D_ENABLE_M4			BIT(3)
> > @@ -86,6 +90,11 @@ struct imx_rproc {
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
> > -366,9 +375,33 @@ static int imx_rproc_parse_fw(struct rproc *rproc,
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
> > @@ -444,6 +477,66 @@ static int imx_rproc_addr_init(struct imx_rproc
> *priv,
> >  	return 0;
> >  }
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
> > +	int ret;
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
> > +		ret =3D PTR_ERR(priv->tx_ch);
> > +		return dev_err_probe(cl->dev, ret,
> > +				     "failed to request tx mailbox channel: %d\n", ret);
> > +	}
> > +
> > +	priv->rx_ch =3D mbox_request_channel_byname(cl, "rx");
> > +	if (IS_ERR(priv->rx_ch)) {
> > +		mbox_free_channel(priv->tx_ch);
> > +		ret =3D PTR_ERR(priv->rx_ch);
> > +		return dev_err_probe(cl->dev, ret,
> > +				     "failed to request rx mailbox channel: %d\n", ret);
> > +	}
> > +
> > +	return 0;
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
> > @@ -481,18 +574,28 @@ static int imx_rproc_probe(struct
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
> > +	if (ret)
> > +		goto err_put_wkq;
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
> > @@ -502,9 +605,11 @@ static int imx_rproc_probe(struct platform_device
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
> >  		dev_err(dev, "rproc_add failed\n"); @@ -515,6 +620,10 @@ static
> int
> > imx_rproc_probe(struct platform_device *pdev)
> >
> >  err_put_clk:
> >  	clk_disable_unprepare(priv->clk);
> > +err_put_mbox:
> > +	imx_rproc_free_mbox(rproc);
> > +err_put_wkq:
> > +	destroy_workqueue(priv->workqueue);
> >  err_put_rproc:
> >  	rproc_free(rproc);
> >
> > @@ -528,6 +637,7 @@ static int imx_rproc_remove(struct platform_device
> > *pdev)
> >
> >  	clk_disable_unprepare(priv->clk);
> >  	rproc_del(rproc);
> > +	imx_rproc_free_mbox(rproc);
> >  	rproc_free(rproc);
> >
> >  	return 0;
> > --
> > 2.28.0
> >
