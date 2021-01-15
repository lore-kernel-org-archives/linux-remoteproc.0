Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4354CC433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 03:28:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEDD920825
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 03:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbhAOD2D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 22:28:03 -0500
Received: from mail-eopbgr40089.outbound.protection.outlook.com ([40.107.4.89]:38469
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725950AbhAOD2C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 22:28:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSaU3JYgRHKgD2SB70wq8WHs0EpDoC3CKSk2SBoCR1PBc7EgMyUqxBvPSG0nKjlNr/IXnNS7KK/iZR02PlF2uH/TzWIfYVZn901o/AcsTrjrnTCUgswd2vFj4DCCVjwW8uGNBMhMe/8R9Vjverc6Z39Db86ANlheWDmOMm2XlrziORBrHSirf8l1Xa/6JPgX3Ar5arCA7omnHQFNvBV9vy9C3MbZ07lT2EfwGhR9n9AzNgKp3VgAKe0q/BTxTsRRL8TuaxDkSCVxyZFQa+mvAJACX6/VCycV+EcEPmLDqIhH1Xk8wJDxWqoGQ1Kjub9cLxnc1T5YccXwvCWsxgBWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUX1R45TftCNE5w/wqzAmt8ivTe6rs3IIwF5yv0HCiM=;
 b=OGgsI1khk2Lf6avgDwHbA+8wnx2DJeUydUMGxCD9vZfOIsx6NImMccRrZ7eBG9eI7Pap7jOGq8mdQwrx89Ct0TLRrwwVn6zrlLsBpsgUVISx05fy30cOpMRTXgRIlvH25GfUbyK8zMAkG79yqqgGi46O9BX14UqB6rRmDjJClrybA9ylcBY/MpsMUjJekxhKIfMUHxl3j9blOEyd3D0e5hDs48f++EUDr8htkRg56veMg/Nw6dvqOaq57WCkf0KdjvC99PP+WidvbReRyr5AyRmHkIt0SI4nYOZ0y4Haw7ZBJgYAWKB1rvdcB+FmL+1pa6izcVq1J69BrStN1fwnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUX1R45TftCNE5w/wqzAmt8ivTe6rs3IIwF5yv0HCiM=;
 b=HMtrgz++QZuJ6YEp34gXKDADOEXMH08uvqoXSQctZzpk357MZtogs1QHZLOOrxnHblxF2gB6fDUZ19ip1NhfM1MHbtbzVYTmHatGJSQ7IWUVa/gYVx3Rcyj9xRloQn4aeOIbMK+h8oEtn+tlcal90OaWcTBL4T3FLOA+V87YXS0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 03:27:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 03:27:10 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
Subject: RE: [PATCH V6 10/10] remoteproc: imx_proc: enable virtio/mailbox
Thread-Topic: [PATCH V6 10/10] remoteproc: imx_proc: enable virtio/mailbox
Thread-Index: AQHW6MhSdM6SRHZ3V0CV31S4IlirBKonqPYAgABh70A=
Date:   Fri, 15 Jan 2021 03:27:10 +0000
Message-ID: <DB6PR0402MB27601A971ED31EB174B2BBA388A70@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
 <1610444359-1857-11-git-send-email-peng.fan@nxp.com>
 <20210114213606.GD255481@xps15>
In-Reply-To: <20210114213606.GD255481@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0049d9d3-6a9d-4ffe-4caf-08d8b9057176
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB66180BD2A2842F2764D4724B88A70@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s3RQ+aDGps9p1qh9zuaD4QZvhvd1duCexxhtZJ6ap9G2grMFGEzum2zvyqBFUrFSOH3qKrRY4rofXOxifEZGNQD0GZLzH+gBjrChOc5jleYf4IgSKjvl9NLkx48NnZFmA6Yc2dqulix+M8p+J2g6+B1p0+UGkPw6BAAO3AgkJ/RjERhy3vsC1/1Di2f6AMNXgmWrd4PihDt2Fw1FlCQK7q4g8PNkZxjmvXcVBVxGJQxo5nmWw3MH+cakCmrI4XjnXxwcUX1OWrr6eRg2HjVjmKqiAQCJrSJDjjVwFLh1N7XbJI45+mKi/jh9wrbfJKbjpn4mVzPHv8sJNuziTOC1KRgkgT+p5OTv+i+83uEsrjInd7hwbTVE/z1NmPTEcGKju5TZErUNN2j09AYJBOcV/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(33656002)(5660300002)(478600001)(55016002)(86362001)(83380400001)(54906003)(4326008)(9686003)(44832011)(316002)(6506007)(8676002)(26005)(52536014)(15650500001)(76116006)(186003)(66946007)(66446008)(64756008)(71200400001)(66556008)(66476007)(2906002)(8936002)(7416002)(6916009)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rLGG2O0OkFIUVFmblwG8DKgDps8QQLxzip4Wy0/zyJTHTnh+XDrnuGtdCeYb?=
 =?us-ascii?Q?IPAf6VWIhW6oM0MG49KnnmEHOjfm9PjRX1QPWo7dAjMAOIAtS9EFIcHR37+m?=
 =?us-ascii?Q?MOL33VKrdFqPOyywKYCbaHjxPAUmNtyHmq+gd8G1fNBccJn4deSstXr0x5wt?=
 =?us-ascii?Q?FNIYjfys3cHOGtzdaws2jfnU+QU41Subg4AENTB5eu25ewbi7Eulu98uMxN9?=
 =?us-ascii?Q?uswb+fgMp61ATETYMJjVro+YnADsYL9McFb8dClDZo1YRLgg0dB4EoXYO5nz?=
 =?us-ascii?Q?mqh/L4+Do78UeJwpoxGN8lW4Y85CP3vzneal3XA4Py3mjJNxGczNYdusuCLv?=
 =?us-ascii?Q?Hx5ucHF3PCYydZhWlPSBqOitBY5BZOfV7rGXTPMM4PGG5Icu/xhFlfM07yR2?=
 =?us-ascii?Q?ghJ+Ab+1VPOt5iJ9GmjgaE4I9uY4PFeN3Ioiy8P7qdtVW2mxRmI652KmRWR3?=
 =?us-ascii?Q?+E8wLmYBDtvTj3VpvCNJ9awVb1aO3fg7YPpEh+NQs47QnJH4chsFDeeYsGui?=
 =?us-ascii?Q?xMPTpqyWv5iNfHSb/5WLnvbXioAOe5YgILY3VgMmGB0SKQMrbm72Ewhrc3yy?=
 =?us-ascii?Q?PUMPudzpVM8zcq2pC5JV8JTadNd66FpqAGUlBUZoOFIgMW9j/9IYJs77j3BL?=
 =?us-ascii?Q?UB5gkD5y+CMSpf0Ww+b+DKws4AKQNeeb0XtH60mFRi5lqkz6cghin03jG5tF?=
 =?us-ascii?Q?ZdrIoKUOlIuLdLDUT+f2WsGwm4MJmi9/4rmLuKyOfiW6v/ceBac/mnHRSyA5?=
 =?us-ascii?Q?PIxJo/TRmpKH8W34gohi4N6ymOH8mX4He5RciXW4jtO0nuKLxC3BWV8QR50n?=
 =?us-ascii?Q?b6INQgoe1AgAkYnN+Y4T0tWRRBonziPuAMp+Q7cJa8C+6CrwgWS4hZ9vmCZj?=
 =?us-ascii?Q?YVYaWw74zbiLqg9ZoKiM7s2SyniMBte6sTNPj0MKCyDe8BnWDeZRhm1fn9UA?=
 =?us-ascii?Q?oTDmFghgikSICbCbLAO/el4jbS1aNZLMfOsnFtQ0SXQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0049d9d3-6a9d-4ffe-4caf-08d8b9057176
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 03:27:10.1069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DzX/B/b9ATzh/zgOp6fG81SuwyG2B02XaILS6vRwOFxT5PKXbZiaa3eQFu/P9IFjVLH3BFW94FpK6U23Zzaqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V6 10/10] remoteproc: imx_proc: enable virtio/mailbox
>=20
> On Tue, Jan 12, 2021 at 05:39:19PM +0800, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use virtio/mailbox to build connection between Remote Proccessors and
> > Linux. Add work queue to handle incoming messages.
> >
> > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 115
> > ++++++++++++++++++++++++++++++++-
> >  1 file changed, 112 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index e62a53ee128e..812b077f1282
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
> > @@ -444,6 +477,65 @@ static int imx_rproc_addr_init(struct imx_rproc
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
> > +		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
> > +				     "failed to request tx mailbox channel: %d\n", ret);
>=20
>         	return dev_err_probe(cl->dev, ret,
> 				     "failed to request tx mailbox channel: %d\n", ret);
> > +	}
> > +
> > +	priv->rx_ch =3D mbox_request_channel_byname(cl, "rx");
> > +	if (IS_ERR(priv->rx_ch)) {
> > +		mbox_free_channel(priv->tx_ch);
> > +		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
> > +				     "failed to request mbox tx chan\n");
>=20
>         	ret =3D PTR_ERR(priv->rx_ch);
> 		return dev_err_probe(cl->dev, ret,
> 				     "failed to request rx mailbox channel: %d\n", ret);
>=20
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
> > @@ -481,18 +573,28 @@ static int imx_rproc_probe(struct
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
> > @@ -502,9 +604,11 @@ static int imx_rproc_probe(struct platform_device
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
> >  		dev_err(dev, "rproc_add failed\n"); @@ -515,6 +619,10 @@ static
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
> > @@ -527,6 +635,7 @@ static int imx_rproc_remove(struct platform_device
> *pdev)
> >  	struct imx_rproc *priv =3D rproc->priv;
> >
> >  	clk_disable_unprepare(priv->clk);
> > +	imx_rproc_free_mbox(rproc);
>=20
> Function rproc_del() needs to be called first so that rproc_shutdown() is
> executed (because rproc->auto_boot is true).

Will fix it in next version.

Thanks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> >  	rproc_del(rproc);
> >  	rproc_free(rproc);
> >
> > --
> > 2.28.0
> >
