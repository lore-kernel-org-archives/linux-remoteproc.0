Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07678C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EE4422255
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LZfJ/mr3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgJOCVo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 22:21:44 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:55791
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726575AbgJOCVo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 22:21:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4qf/JueMsCQfxSRBBVzKKuukJP6sX2CcNlUhCZLFHL3JD2enYEdT2pqipwhGVjaQoAweesFJkVDNKrXOiOUYDKgFxkFb5YCwBNiXxp/L+0+kIfBtTqrM7hYZ02MNRE7+awvW9Co6Up6yUs6mXOYFTy38EYdeE2hb06nfjB3EmieTJpZl53cb5aGMBgbdG1jSeZDwzlGt1QsGmx56RYgmlTSswUHmqXJzNMb1ZApHAYPUGqxcKsaSWh0NLmzMyHvWNQMkku5hUT4jCzLkDhLG6S3wyu7oTtOnb1C3yIIvs8oTNKNn4qFpsEZwfi3SJ8mSm7Nqex7nDkl6G2y9bHGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYPy1uYlTt8bJ8Q3vwTboV7l405WwHOf4lLh5yjcxGk=;
 b=fBIZPnhVXRaH0+TYpaWKacJ4PAQQz7WhtkML52gSZBXSAxVOq4ZYWbHo7EqOsDrRE0Ol0zafaXc+CNpkxstqQA/kMD0+41eMGApMAqYA2ZT+k+xfYRNfNjB56CYT+xiOfDBuAr8APdqnf5a6/PnfDoxcOeWPeZnOQQ+jrn84Dos0j5E4cCIPkhU1T04RHkP0+EhAEhM0uH5avBTSLQl6qUJYIkikArA2sgKomplWKRwVKqIBYc1SAM52CSIn3jIIlR6ePXuY9yX2rJkrX13OgxmiQ1antpgXEsqmtUFkihBerPk9g1bAPsE3DrQjjsI+pxybbn7YMmgL98oiAyYLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYPy1uYlTt8bJ8Q3vwTboV7l405WwHOf4lLh5yjcxGk=;
 b=LZfJ/mr3b5876cobjpXsdtfqTNrVnNdfa0fVvjz5cAeTe6xCnc4NezVSAsQRSlL1JPKMyadcae1fF2qg8kkNRzILdVNu0fQOAF4cv6HcQr24nKEqqargOpwZp1IHKJAy07X+BUxtbXNhI+JtoPcdRVLxefIpVMYlX65AqtfDraE=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 02:21:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 02:21:38 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 09/13] remoteproc: Add return value to function
 rproc_shutdown()
Thread-Topic: [PATCH 09/13] remoteproc: Add return value to function
 rproc_shutdown()
Thread-Index: AQHWe8hoUa5h34tlykGZh7rEbV5cM6mYPChg
Date:   Thu, 15 Oct 2020 02:21:38 +0000
Message-ID: <DB6PR0402MB2760A4407DD4588947A0AD5E88020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-10-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-10-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 14598fe9-e564-4d42-78bd-08d870b10c2f
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-microsoft-antispam-prvs: <DB8PR04MB66187BAC1F84FDBBC6E83AA388020@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o6YJc5UV3PvUxv4qTT1NugpdireK78IdZEgQ8mK35uIKS6PDPf3R1obAk3/Yz7J2v/e51g5yoXF2c2aZ6Lm2gyQdYwaivvBlDUCIgu964lbW3bNgwRMd8N3IFwIJsZFD9YrceKZiWL1TZoaq4VN6bbnY1XzuCK+Ioo6qw1DwzKzE1tpleeJe2lsKQf0ciJvDUTz1dAUD2A+92WN4K/LUPh/a8/m5tR07aiKHD6+dRwI6NdIT7Z1rmhpXcV6YHu0vd+iMG2XXvrnzMmlsTaPK0iPUpswz8Sg7DVl8n66wN14zJTlhUIq/qVqEdUEmCoUx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(66476007)(66556008)(66446008)(5660300002)(64756008)(71200400001)(52536014)(186003)(26005)(2906002)(83380400001)(8676002)(8936002)(76116006)(4326008)(6506007)(9686003)(44832011)(54906003)(110136005)(55016002)(33656002)(478600001)(7696005)(66946007)(86362001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /2ZMhJJ6WCQ0GTpI+YHc0mZnB/8cnYww90Jwl4jTCLd1KIu7h76FEdNJZVYuVRu3iCvcONGphNTNccKnRAwXC8WY1HCwkMGf1coX1Ec1WCfLvtwJNLv/eYnxLnPkZt+7rT4JO4A36wgTJsU2twuJ2QvPHXwhKFly+Xg9sXiZuaD+CR9CJ5DSXJX85HJh/kMzZ3vsfYXtpy8MhUzIjll0ChAoXz1jn/FKHtkOayJRB6KOkrHIS25BNX1VfWyE75Uv7LIj4Y4GRt3MswZlHTCPsVHa6ogbAYAqFKQn1X7fbZYlmgJeMTjVPsYZMwRTN7TtWdXuuQmcjamMjsfKbbmiNRbOyV9O4HE2sbIGFrvTx20x+bKuuFRcvkVZKrVcHkqomipOVglzDhe9Bz0qX1FxxABPGctyWB3VP/1B998ZAV2dUADVF1EiqlWGLA9IG8rBgz+sUa+6278biP4iEbCewFs3xOpQu+pAX4ZlYFfF0LdbqQMg4W1ZJNzgl7dTIa7XWnmDApGwHPygQibQnTBjdriBQusDlmcZPnhdt6KhcQO0eUOEAKmgeNfud9ckcmM2f94DUrbwuuZdkelHyXoU44Vu+fEYBesUuhj3SJbYLyNz/iVK0u2s5uosOGZvLW8RvxNc1AnhaNUAg0wP93wbBQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14598fe9-e564-4d42-78bd-08d870b10c2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 02:21:38.7375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szqqKtRxfq5Cm7cHJAoBxyZzZLvWM8ijamJij5xaygMabgruSRbS6cLWc+IpPG6N5w5NzWSku5F9ugJjI7BBhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 09/13] remoteproc: Add return value to function
> rproc_shutdown()
>=20
> Add a return value to function rproc_shutdown() in order to properly deal=
 with
> error conditions that may occur.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 13 +++++++++----
>  include/linux/remoteproc.h           |  2 +-
>  2 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index c4b80ce6f22d..c6c6aba66098 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1846,7 +1846,7 @@ EXPORT_SYMBOL(rproc_boot);
>   *   returns, and users can still use it with a subsequent rproc_boot(),=
 if
>   *   needed.
>   */
> -void rproc_shutdown(struct rproc *rproc)
> +int rproc_shutdown(struct rproc *rproc)
>  {
>  	struct device *dev =3D &rproc->dev;
>  	int ret;
> @@ -1854,15 +1854,19 @@ void rproc_shutdown(struct rproc *rproc)
>  	ret =3D mutex_lock_interruptible(&rproc->lock);
>  	if (ret) {
>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> -		return;
> +		return ret;
>  	}
>=20
> -	if (rproc->state !=3D RPROC_RUNNING)
> +	if (rproc->state !=3D RPROC_RUNNING) {
> +		ret =3D -EPERM;
>  		goto out;
> +	}
>=20
>  	/* if the remote proc is still needed, bail out */
> -	if (!atomic_dec_and_test(&rproc->power))
> +	if (!atomic_dec_and_test(&rproc->power)) {
> +		ret =3D -EBUSY;
>  		goto out;
> +	}
>=20
>  	ret =3D rproc_stop(rproc, false);
>  	if (ret) {
> @@ -1884,6 +1888,7 @@ void rproc_shutdown(struct rproc *rproc)
>  	rproc->table_ptr =3D NULL;
>  out:
>  	mutex_unlock(&rproc->lock);
> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
>=20
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h inde=
x
> 6250491ee851..40eccfbc1357 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -655,7 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev,
> u32 of_resm_idx, size_t len,
>  			     u32 da, const char *name, ...);
>=20
>  int rproc_boot(struct rproc *rproc);
> -void rproc_shutdown(struct rproc *rproc);
> +int rproc_shutdown(struct rproc *rproc);
>  int rproc_detach(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)=
;
> int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t
> size);
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
