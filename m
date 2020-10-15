Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639CCC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC60122257
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GX8ioI7u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgJOC31 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 22:29:27 -0400
Received: from mail-eopbgr60043.outbound.protection.outlook.com ([40.107.6.43]:13121
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbgJOC31 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 22:29:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJhK/44ukMYeyF53Ml4UBz3C/lvBJUy7HyiFkl0trCP+2AmtnLyFqo+5DSA9shgTffVDjNZfx5O/L1BkMtvLC2RGXi4zE8PbVEzFF7Lb8PHA3PBhjV3EgveYfw4V2Gq0RDTALNbhCbgl7/jOPaYT2V8ama1JKepUx0YgM4Vci/M93+QLV2yMZLOIl9E0evBDi595BpwMKDa+GoWoP6EeJQIXTbqyEvYzB+u+eIMWnllWc+mxUC+I3vzcFBy/kTjUhbfNcMLYjcp/p6qULaYwLRezWkoUSjiYb130eb4+Mc/dsU0dELFEIXhlSOylZdO3OWUMUrS2KVGMy53qqQswGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a2x1IjZobOUYJo1TSzoOIMVygW8LWHqSC1FqWTIYhg=;
 b=XSYUbclKLJgKzxUSzm0vQgmSQ5GA4v6QfrrThnb4iIJCwilkilvsq99y/rL8K7hw1/B+TbwNY9xS71wzz6omUxxufeTXoqs1FD7apjNugLYj3mIXYDXQ+dcWCNH3vgX4zGEO44zMKDM+BQp73VgVXvxJ1/GvNkQsJ7HWk8NGJVRjmrtY3PMSx6de46qacgzvhQtuwg4C4v5KsZuK4zmjlHVgn6Ez4ZhQP0X9WAm2Dl1e5L9QGnat3yUSZ7/aiwwQMo3u+7NJWgJr/g978EWvNMh7aNY06KuSsKBMUV9pOLA0eZl7EzehQNqIIhpntJ856pivElMoC/FQovZB5N7qag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a2x1IjZobOUYJo1TSzoOIMVygW8LWHqSC1FqWTIYhg=;
 b=GX8ioI7u6P1NlOn8/pbb28Hc+WLFXbYiQPFUYLXQG9jLscWPgokPR7LscWyBcBEcbMovTpop04/5wNSobNwpVy5lCzVDqDNNhieJW6pJ7W8a4w8OZ9anx+ZE7i7fOSA+7qBSLdJNkdBjuB7sZ60kQyo+j3VrzgpNzmX++n4k/O4=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 02:29:24 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 02:29:24 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 10/13] remoteproc: Properly deal with a stop request when
 attached
Thread-Topic: [PATCH 10/13] remoteproc: Properly deal with a stop request when
 attached
Thread-Index: AQHWe8i11hJitluPOE2eW7GIU2JGu6mYPk/A
Date:   Thu, 15 Oct 2020 02:29:24 +0000
Message-ID: <DB6PR0402MB276006E781EF4EAEA3C242D088020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-11-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-11-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ee6c7b7-af5e-4cb4-2b1f-08d870b221e4
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-microsoft-antispam-prvs: <DB8PR04MB66185B573B047C55E36F463688020@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oaZ1m7kzYZ2LY25igoIxrj8zWvRS1SpT55cZPMuFlm4WvHpfq2XDcbTDz9jP6PB8VDhw9AVpFOyAoqJs1Hj954ee4KdO6iPIDiIGLUgk1wwA0v7GVfAUHnwxwupf7vFNzUDKm17rD3rl+Fxvx/WuutCQpiULRvcLIKiXOrU/K4uuEFbzy/nT7bGwCxXFf+QQpwP9BhpenKFncHJuQLUiGxSx7nVDJi9spJI7ZfAskbcp5I8mjhkD5/lLaSdSvxsg8MJfF1pafrSGo+f+4LkgXUSLtLUVes7al2p3oeNYj0gl6b+pItLw3KX3ehHY/m12FkLaob0pzuZN7CDEXtjsXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(66476007)(66556008)(66446008)(5660300002)(64756008)(71200400001)(52536014)(186003)(26005)(2906002)(83380400001)(8676002)(8936002)(76116006)(4326008)(6506007)(9686003)(44832011)(54906003)(110136005)(55016002)(33656002)(478600001)(7696005)(66946007)(86362001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: bv55HqTxDOTXmRIzLuz2Hgzc8d3UzEiq0J25c9MS3qkpU9B7eS5gqarotBMDk5G28qKYjWsONRiM2OIKModfNYKLGRZSaY1Q3QT9An+S0Ne/ZegdfYBsU1s311V9yKSBt6vcQxLGeV1GkdIjXPzCtwT41F7wHtVoHaPiMC6Dad7ocRFGFC2HtBR99RXsz4RkkBjKmMYy/igpkXqYAdSMh4IrqHwdq1cdiZvMo2YUrsnIJVtk8jQNMGLQwasiCOA/1G65B7aAc/C/JHewqMJn1FrC1Re/cNns8irdkG0NBKQQ2HH4OrKUexqC62muRWzKvTsvo3B0Lx1G3MVHgHi/WSHDeSJLuO0Hyt3lyXedn7jldF3igzkuiCZdmGedAktc+0shZes7XdM3XrytvILpogc6odx8o8hmxWL/vacixeTfzPB//IsiX+8Fyl6+ncgUjEmtMdRprhlnuUKpwzqjs6O5cQTHA2638j7FFcuy/yuOmfqou0eJKA2+QKVTVMjj0wchDXNouQcaonMVDLO6SgV1ipf+SVRlHCrCPJTjyn8ejZFBbOtpbFavkf8qlC8MinoJIEfEFyA2CKWe6YY3QmwfiWYioLob45W72bKxvX84ECSVqXAHnqqydxOTgT6yyIWVt6EITkk8mAxj6hpHmA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee6c7b7-af5e-4cb4-2b1f-08d870b221e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 02:29:24.6426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5PjI81lAGvLoNZvbGdDMdfCi5BSDdcss3KNYnf8j5xLc8+YFD0+nM08aIateXwgv4/PI7j4bLkPcMjs3mVVRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 10/13] remoteproc: Properly deal with a stop request when
> attached
>=20
> This patch introduces the capability to stop a remote processor that has =
been
> attached to by the remoteproc core.  For that to happen a rproc::ops::sto=
p()
> operation need to be available.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_cdev.c  | 5 +++--
> drivers/remoteproc/remoteproc_core.c  | 6 +++++-
> drivers/remoteproc/remoteproc_sysfs.c | 5 +++--
>  3 files changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_cdev.c
> b/drivers/remoteproc/remoteproc_cdev.c
> index b19ea3057bde..d06f8d4919c7 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -37,10 +37,11 @@ static ssize_t rproc_cdev_write(struct file *filp, co=
nst
> char __user *buf, size_
>=20
>  		ret =3D rproc_boot(rproc);
>  	} else if (!strncmp(cmd, "stop", len)) {
> -		if (rproc->state !=3D RPROC_RUNNING)
> +		if (rproc->state !=3D RPROC_RUNNING &&
> +		    rproc->state !=3D RPROC_ATTACHED)
>  			return -EINVAL;
>=20
> -		rproc_shutdown(rproc);
> +		ret =3D rproc_shutdown(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognized option\n");
>  		ret =3D -EINVAL;
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index c6c6aba66098..95bb40b4ebb3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1619,6 +1619,10 @@ static int rproc_stop(struct rproc *rproc, bool
> crashed)
>  	struct device *dev =3D &rproc->dev;
>  	int ret;
>=20
> +	/* No need to continue if a stop() operation has not been provided */
> +	if (!rproc->ops->stop)
> +		return -EINVAL;
> +
>  	/* Stop any subdevices for the remote processor */
>  	rproc_stop_subdevices(rproc, crashed);
>=20
> @@ -1857,7 +1861,7 @@ int rproc_shutdown(struct rproc *rproc)
>  		return ret;
>  	}
>=20
> -	if (rproc->state !=3D RPROC_RUNNING) {
> +	if (rproc->state !=3D RPROC_RUNNING && rproc->state !=3D
> RPROC_ATTACHED) {
>  		ret =3D -EPERM;
>  		goto out;
>  	}
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index c152d11a4d3c..6134d2f083ce 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -113,10 +113,11 @@ static ssize_t state_store(struct device *dev,
>  		if (ret)
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>  	} else if (sysfs_streq(buf, "stop")) {
> -		if (rproc->state !=3D RPROC_RUNNING)
> +		if (rproc->state !=3D RPROC_RUNNING &&
> +		    rproc->state !=3D RPROC_ATTACHED)
>  			return -EINVAL;
>=20
> -		rproc_shutdown(rproc);
> +		ret =3D rproc_shutdown(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>  		ret =3D -EINVAL;
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
