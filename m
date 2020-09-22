Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386EAC47425
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 16:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D426923A1B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 16:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="kedWL/zX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIVQ0n (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 12:26:43 -0400
Received: from mail-eopbgr760084.outbound.protection.outlook.com ([40.107.76.84]:4871
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726526AbgIVQ0m (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 12:26:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpD9G7Y0tyhJ3z3wmViirY63HmLAAiHqwCAZ/z+tu+fpdbGaOo6aO5FigwC49qW+zvbGPebVQZGVTTPZl92Jr+lH3Dhn3sumj/Sgci82m6k08LREG4v9Tj11v+7Yeo0L96P+NHl+IuaUSMgwtvwIpHNMdHduGiCtlNb7BHEOPzJ3YPwbZPW7jJtrwOihUqIV20f/jvHCtcHwRFavRpzJH27FktLSGmeHB6xUtVKjfEjEmqwZZGvkFLw0lBkwqz7PTRk+5qOn5RkD+h5mp1ur489dql6UPzOwZ4h5ZEqdzZ5CdE3QCor7p971rH/mJjQHs1xGXWO6Nfvu+r27bUMdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaLLL6vWVzpXuO/YauJAYNbzOfqa7e1t4rkEL6LrmCc=;
 b=PYadQI2vPiz7XfXRmVJvCJJXIi35/c0NX945xNilgw711etYSD2a4tb6aRGGAaYg5E8ZZWKuycvFugdoP6hVRgww9PiR2CWUH9g12qaeFFeu2ndbxkMh5uf6FE11kt5+iJAT0qekJuhw38x1h7vc3XCXJhaHJyIaFpxXDz6CqLqcAutph0QJPYtMz7xejpdLKRwPywDEOGEBsmiIN+It6l35bNW5CZ6lISsWzyIjn2h6mBk38+/tb2myXtdSNzPYWXzpEQvezLMYwOawvRZiqGzqOqgbMbtsbv61nLtl0Xxb9u7yDgaSUV1c1IWcbM2TLiO0IKxHNT1Mnj9r+IZ/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaLLL6vWVzpXuO/YauJAYNbzOfqa7e1t4rkEL6LrmCc=;
 b=kedWL/zXQWuaZVqs6O2j0ak4SlQvAS5OoNeS1T3U0HeozvUho3MM6xhBl67kzmzrwXXYAR6PWegHHKAci2Em798sJJ0DQRYLou3sw2dNEAV/mYqA3AQWlADqnHQLB5ls3mAZr88nOxhN6EFl7Q6ix4HD1RKDCZ7rRZaY+T9ejWc=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BYAPR02MB5832.namprd02.prod.outlook.com (2603:10b6:a03:123::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 16:26:38 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5%5]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 16:26:38 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>
CC:     "sunnyliangjy@gmail.com" <sunnyliangjy@gmail.com>,
        "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "Ed T. Mooring" <emooring@xilinx.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jiaying Liang <jliang@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "Ed T. Mooring" <emooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Subject: RE: [PATCH v15 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v15 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWkDJngWvzltWQj0Sewo+kA395+KlzqBYAgAEgZiA=
Date:   Tue, 22 Sep 2020 16:26:38 +0000
Message-ID: <BYAPR02MB440714F437CB532171B9667EB53B0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20200921161406.11929-1-ben.levinsky@xilinx.com>
 <20200921161406.11929-6-ben.levinsky@xilinx.com>
 <20200921221206.GA296714@xaphan>
In-Reply-To: <20200921221206.GA296714@xaphan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c28f67be-f652-4f5b-86d8-08d85f144810
x-ms-traffictypediagnostic: BYAPR02MB5832:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5832779E84AF681AC43062C1B53B0@BYAPR02MB5832.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JyeguAXj5qP1Dx8xq1lq8Aiww7POFz5eOloFhteHj6+Vkm8+KkTzf4v46xVFR/aImT5x8QkOAdUifXmLhaAyqW9YGjPdkTsge/efr6OAGaGMv5NpMNFGQ2cNJpMuMZRkHV/Y3GOFLHZs/tSrbVCY6tQ7CDed8kTzZqdm8DWpM7mUWvy9KCQO7T/i3RId5pDNt8lDvMg8IPLS2tTRDcFVDHwxFxXT317pdKo16vo1eE/TuS1vQ7siT5qI4xEZr74+zCOOlcqsepWmf/x6GrOH7kDrszlLTHZ4jfaeKragqYeGjj0Tkqj+cPpi6Esz4cNYBnLi6l5y0AKAfTMISHsQiTAniH3QVz+4cdonSjFe6ciHtt1TPXFi63AtSVo40Dmkh3LIVsGOgQWA4+YXFTkV0yUCpdvcxzzCIeH8Z0aa8X1IyGWTgD1c4ueb9njtZnXK1aqtTZeb6kmYdyBjevf4Zw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(39850400004)(366004)(66946007)(83380400001)(966005)(6916009)(54906003)(2906002)(9686003)(316002)(33656002)(52536014)(55016002)(66476007)(71200400001)(5660300002)(7696005)(76116006)(478600001)(8936002)(66446008)(64756008)(66556008)(4326008)(6506007)(53546011)(8676002)(186003)(107886003)(86362001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: X/TG42aijFpSLdNkVOVB/tf3MAMhHlQtOrAt1zGSzHWS92QQcaJsZN0OTe5c0UuZBiG/QxFMR7IhGP0OqgElmCIet296sERnxowk0t0PkELwAWYeJkPaqjm+leZFaUq9DKq4kryFoHcEgXc1dAjYofwAOHAwOCOaiQRW9rV7LskPdCi0iT36iNzBf6PwoLwJEcZToD2TQgVAqXMJjUBHJc3j3051ByQIBHKkRYUhOiJXiYdysUkWZpPdeoG48qBWss4FB4FZ72XADs1zphyB7FDZM1/lD7sQfhV0SiQ/MB+abi+0WfMqFpwG9IKzDQL0enSiKZEsijMSxPSs4pQySbpv63gbh2YFI+KK1SPl/9hesD8d0D9SHmynHp6IjQCqGrNT4qqN7IeFZPGdqkmudXr9UIFGIzF8XR1M5k+KDCHCQS5nPYvLHoX5NPFIoczSQG2xgQEnIh1CLoGQPFKJqnGOinOW9VbUA6nG601X77o4qS7NXgS2nN+1wlsx8q83MHsO+XMLfaELkU09bIbFTU8hureXDb66cY6jOG1nGna2yUeNVtUJj45MnPDO3Fw/61wzK2QoSIZUdrBJtECRPFudC9rpYHVHVhfUEDxU8vwYfoQYxXrQ8cQrx0xM2lF0tBhBlyLsP4Cpf9wuuUGEag==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28f67be-f652-4f5b-86d8-08d85f144810
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 16:26:38.3973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8nPMoA5eHEOwBqWw69MYb3oQ+RBaTA7V2O93klQb9xPfaYYSfXt1ND3BHhjEUoxsE7lRaIj7XF2deAJEkvhMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5832
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Michael,

> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Monday, September 21, 2020 3:12 PM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: sunnyliangjy@gmail.com; punit1.agrawal@toshiba.co.jp; Stefano Stabell=
ini
> <stefanos@xilinx.com>; Michal Simek <michals@xilinx.com>;
> devicetree@vger.kernel.org; mathieu.poirier@linaro.org; Ed T. Mooring
> <emooring@xilinx.com>; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; robh+dt@kernel.org; linux-arm-
> kernel@lists.infradead.org; Jiaying Liang <jliang@xilinx.com>; Michal Sim=
ek
> <michals@xilinx.com>; Ed T. Mooring <emooring@xilinx.com>; Jason Wu
> <j.wu@xilinx.com>
> Subject: Re: [PATCH v15 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> Hey Ben,
>=20
> Thanks for sending out the new series, this patchset is functional for
> booting both R5 0 and R5 1 in split mode.
>=20
> A few comments below, still working my way through the rest of the code
> though now that this works.
>=20
> On Mon, Sep 21, 2020 at 09:14:06AM -0700, Ben Levinsky wrote:
> <...>
> > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > +{
> > +	int ret, i =3D 0;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *nc;
> > +
> > +	rpu_mode =3D  of_get_property(dev->of_node, "lockstep-mode", NULL)
> ?
> > +		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
>=20
> Extra whitespace, and of_property_read_bool would read a bit nicer here
> (does the same thing in the end, though).
>=20
> Since rpu_mode is only used here and in r5_set_mode, I think it'd be
> better to plumb it through zynqmp_r5_probe instead of making it global
> in this file.
>=20
[Ben Levinsky] will do
> > +
> > +	dev_dbg(dev, "RPU configuration: %s\n",
> > +		rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP ? "lockstep" :
> "split");
> > +
> > +	for_each_available_child_of_node(dev->of_node, nc) {
> > +		/*
> > +		 * if 2 RPUs provided but one is lockstep, then we have an
> > +		 * invalid configuration.
> > +		 */
> > +		if (i > 0 && rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP)
> > +			return -EINVAL;
> > +
> > +		/* only call zynqmp_r5_probe if proper # of rpu's */
> > +		ret =3D (i < MAX_RPROCS) ? zynqmp_r5_probe(&rpus[i], pdev,
> nc) :
> > +					 -EINVAL;
> > +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> > +			ret ? "Failed" : "Able",
> > +			nc);
>=20
> It'd be cleaner to check the child node count before the loop:
>=20
> 	rpu_nodes =3D of_get_available_child_count(nc)
> 	if ((rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP && rpu_nodes !=3D 1) ||
> rpu_nodes > 2)
> 		return -EINVAL;
>=20
[Ben Levinsky] will do
> > +
> > +		if (ret)
> > +			return ret;
> > +
> > +		i++;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < MAX_RPROCS; i++) {
> > +		struct zynqmp_r5_pdata *pdata =3D &rpus[i];
> > +		struct rproc *rproc;
> > +
> > +		/* only do clean up for pdata with active rpu */
> > +		if (pdata->pnode_id =3D=3D 0)
> > +			continue;
>=20
> This seems like a bit of a hack, resulting from the use of a static
> array for holding the zynqmp_r5_pdata for each rpu.
>=20
> Consider allocating zynqmp_r5_pdata in zynqmp_r5_probe, and adding each
> instance to a linked-list at file scope.
> 	- memory is only allocated RPUs actually in use
> 	- no need for this pnode_id =3D=3D 0 hack
> 	- MAX_RPROCS can be eliminated, just traverse that list in
> 	  remove
> 	- No reuse of the pdata across probe/removes, so all of the e.g.
> 	  condtionals below ("if (rproc)") and NULL assignments can be
> 	  eliminated.
>=20
[Ben Levinsky] so parts of this I can do..=20
- can make the rpus a static list of ptr's which I think is equivalent
To what you are describing
- can eliminate the pnode_id =3D=3D 0 hack

For the rproc_del, rproc_free fn calls, these should stay. Just as other up=
stream remoteproc drivers do, this is being done similarly.

For mbox handling, I am mimic'ing upstream ST and TI drivers https://github=
.com/torvalds/linux/blob/v5.9-rc3/drivers/remoteproc/stm32_rproc.c=20
they similarly check if the mbox channel is not NULL, and if so call mbox_f=
ree_channel. This is similar for Xilinx remoteproc R5 use case as the mbox =
 can be unused in 1 remoteproc node. Also, similar to TI and ST driver, htt=
ps://github.com/torvalds/linux/blob/v5.9-rc3/drivers/remoteproc/stm32_rproc=
.c#L321 , I am setting the mbox to NULL at remove=20
> > +
> > +		rproc =3D pdata->rproc;
> > +		if (rproc) {
> > +			rproc_del(rproc);
> > +			rproc_free(rproc);
> > +			pdata->rproc =3D NULL;
> > +		}
> > +		if (pdata->tx_chan) {
> > +			mbox_free_channel(pdata->tx_chan);
> > +			pdata->tx_chan =3D NULL;
> > +		}
> > +		if (pdata->rx_chan) {
> > +			mbox_free_channel(pdata->rx_chan);
> > +			pdata->rx_chan =3D NULL;
> > +		}
> > +		if (&(&pdata->dev)->dma_pools)
> > +			device_unregister(&pdata->dev);
>=20
> The condition here looks very wrong to me, as it will always be true.
> What is this trying to achieve?
>=20
This was originally because of the static rpu declaration. By instead using=
 ptr's this can be removed as the zynqmp_r5_pdata ptr will be NULL so I can=
 check that instead. So will remove this.

Thank you for the review
Ben
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/* Match table for OF platform binding */
> > +static const struct of_device_id zynqmp_r5_remoteproc_match[] =3D {
> > +	{ .compatible =3D "xlnx,zynqmp-r5-remoteproc-1.0", },
> > +	{ /* end of list */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> > +
> > +static struct platform_driver zynqmp_r5_remoteproc_driver =3D {
> > +	.probe =3D zynqmp_r5_remoteproc_probe,
> > +	.remove =3D zynqmp_r5_remoteproc_remove,
> > +	.driver =3D {
> > +		.name =3D "zynqmp_r5_remoteproc",
> > +		.of_match_table =3D zynqmp_r5_remoteproc_match,
> > +	},
> > +};
> > +module_platform_driver(zynqmp_r5_remoteproc_driver);
> > +
> > +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.17.1
> >
>=20
> Thanks,
>  Michael
