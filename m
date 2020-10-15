Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78412C43457
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:16:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AFF822255
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:16:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HsNh58+9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgJOCQB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 22:16:01 -0400
Received: from mail-vi1eur05on2052.outbound.protection.outlook.com ([40.107.21.52]:39195
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725923AbgJOCQB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 22:16:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DccOZp3z6lDxnX4agD0xtOlm41O681mP0sgc7rZBIP3ARPlMycRFcIEeTP994dM5YqGwN+ucxsyfASdotstfFwhyqjjnwtzZRSbInXbDyTj5/QROJZeCUjKmFBbB9s2XBQkuidALC7vGQOlGih20+w7bHwrbK64X76EjUp6rJOOONM+sCDxkCdoCuUMNpHqe+ZkVgz/KoZ2pphsIkpmPWs+HWl7bkkn6paEZMUtDChciRoaqb8LDKrIi0jDi3igwiZpo/glWKA+o5YsfDy6UnMEcTjlgirfHOxO/K+IqswlMqwu2CTjst8ER6cuoZLCcwX8jCY11tJq3HyjwvC5Flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nAypI3ICz5D0jccCnoa0R6lzcDU8psnO1WGmeTJq/s=;
 b=PwU3VbWRxVKekuV0kyASv133+B3oVNwbMdKws4q9GAOHVCyMtndnf0MhIBhZ6ttQv3SqePdrZMRN6FkPSZeur+0JSlV1zlW2zMnM6IxceylCQD+ERzS6L8Jzr2FqT0vjn8CkTptQf6xJJWB7/0PAquHKwPZjVR6kCwoSexaF3pFTnZ5vMgSoYcv8CSxSleZsEIPwaiup5OLeBfTmbQICXividlLKoOXachTSOkR5IGDwuzl4oiPEUMkUW4nEEUiIjwu8EpGKWvVnFP+1oqIUY+bY6l8oCf9Kxg+peg/Fi3S8C1RKeXgRy1FhU6/YddtEQmlWq5nIqFKFQSz6AjV/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nAypI3ICz5D0jccCnoa0R6lzcDU8psnO1WGmeTJq/s=;
 b=HsNh58+9463HhSLAXp9ysC2JQRQjdtLmWjNFou10MVvV+uSApOcbyY2uidqmPVZAEwM0hOyvKtNC5Lzkt0S8WadlnerDjlC1XUMLyl7DEvTG22+YXgQw4XAkOUdpfjuxhzC+LUfC9a7l4XgOGXoDIWykk8Y3zIS04NCMoS1scrA=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 15 Oct
 2020 02:15:58 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 02:15:58 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 08/13] remoteproc: Rename function rproc_actuate()
Thread-Topic: [PATCH 08/13] remoteproc: Rename function rproc_actuate()
Thread-Index: AQHWe8i2FY2XICtKNU+E0/X+bT23t6mYOnnw
Date:   Thu, 15 Oct 2020 02:15:58 +0000
Message-ID: <DB6PR0402MB27602C9085027346DE35F3A788020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-9-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-9-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d3ec6e61-2b4a-46cc-890f-08d870b04131
x-ms-traffictypediagnostic: DB8PR04MB6857:
x-microsoft-antispam-prvs: <DB8PR04MB6857F783B576B41C2BAC00E388020@DB8PR04MB6857.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0POU5lnjdRFMyNQmEvLlETiFsfML+N3+md7CyNrTZOK7iUIBuEqEMsogPe54XO6O10qoQIi0e9Bg6NXpJW/Eg/OrO8AOS5wsvoyfyc5vrVWJ36FfF5Kh4qJb+RIonVlE4lfIF9d+lvlVa9qoEMaeHD7+CacZ/CBEPOvOcMSnN5GAONRox/u7U8IXseFHz6JdwT4GJzi0apSfyIvlysxYMMiMazZ5fGIR14rlyDAZ2w0uT+9lkohZWIIWaR8ZADDyipwIYlun/GKcbliGf3uVs5f3RYaJsv2U8ClBBnyvf/reLQ5pvWksDb/mlsIs/W+72fSzeAH+/gJUWgXrefStkw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(6506007)(86362001)(186003)(26005)(83380400001)(478600001)(55016002)(2906002)(8676002)(8936002)(4326008)(71200400001)(110136005)(7696005)(52536014)(9686003)(316002)(44832011)(64756008)(66946007)(66556008)(66476007)(66446008)(5660300002)(76116006)(54906003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: kFpEAZoLSWLHvSVk1QgaJlXDemDxm/WK6hM2EQmZzDdPbCNm4rnC/wJM0QeXlcAl+7DokZCK8fAKnIVFv0JCgdXOzHLuA+abynjKzJGf6D3t4Ugzuh47CHmrTvU6KlYNABkdgRb0H2TC0qOU33YzzwmpOSsyx23g613beLDBJN4FxQQCQlg9i2CVKoPz5Z6GIosp3GNUGInA+gYVU5zvNDMmYcQ3pSrfJwjkKl22YaLnCqdqqhCz7fsbq6hegciCxPpZIhZRGH/rH6Ja2oy9XxGRk+eGytzcJNuG8Qgq6ayT3Ps9NNkr49Ysv22JEmPvGsCeLcMAX4kdTlejlKercrmf0+By8SWgrvkJ5FODpUgg3UA1K8UeOyx2m+C3cCXUgfo5+0yv26FF2ic2d5p6f66gtw9RjOb0jYDcHxQWevBsAtrsghlNUfQLzPPxWiMvNWrE/oP2DS3o5imLd4DcRcogF6Jk7MHkIL4uMcxQRMWbrM73hdH+DFXl5aBZN/EW3AEPtH8YuE+PikyyMQVtQEw6XuXcweFfc6Mi9RSX7jXG+VqyPEJFeBWGka9kX/EWMJ7M1EnPAFr5bmvxJmOPfe28PWfng0MAq0VIg4/3UgGPZ7O11ir5x8/JeYcULyDakXvu45fYD57pZ5QSPlN1jw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ec6e61-2b4a-46cc-890f-08d870b04131
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 02:15:58.1656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wffl3rVzavlEJanlfydhsI3NtSIKTXXDa8tSFu7NpQNp4uOWKXoWmonDLGp+KAMtt8foZmYftx5y12fBqC9uNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 08/13] remoteproc: Rename function rproc_actuate()
>=20
> Align what was done for rproc_detach() by renaming function rproc_actuate=
().
> That way it is easier to figure out the opposite of each functions.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index f3943a1e2754..c4b80ce6f22d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1393,7 +1393,7 @@ static int rproc_start(struct rproc *rproc, const
> struct firmware *fw)
>  	return ret;
>  }
>=20
> -static int rproc_attach(struct rproc *rproc)
> +static int __rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev =3D &rproc->dev;
>  	int ret;
> @@ -1518,7 +1518,7 @@ static int rproc_fw_boot(struct rproc *rproc, const
> struct firmware *fw)
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
>   */
> -static int rproc_actuate(struct rproc *rproc)
> +static int rproc_attach(struct rproc *rproc)
>  {
>  	struct device *dev =3D &rproc->dev;
>  	int ret;
> @@ -1558,7 +1558,7 @@ static int rproc_actuate(struct rproc *rproc)
>  		goto clean_up_resources;
>  	}
>=20
> -	ret =3D rproc_attach(rproc);
> +	ret =3D __rproc_attach(rproc);
>  	if (ret)
>  		goto clean_up_resources;
>=20
> @@ -1802,7 +1802,7 @@ int rproc_boot(struct rproc *rproc)
>  	if (rproc->state =3D=3D RPROC_DETACHED) {
>  		dev_info(dev, "attaching to %s\n", rproc->name);
>=20
> -		ret =3D rproc_actuate(rproc);
> +		ret =3D rproc_attach(rproc);
>  	} else {
>  		dev_info(dev, "powering up %s\n", rproc->name);
>=20
> @@ -1893,7 +1893,7 @@ EXPORT_SYMBOL(rproc_shutdown);
>   *
>   * @rproc: the remote processor
>   *
> - * Detach a remote processor (previously attached to with rproc_actuate(=
)).
> + * Detach a remote processor (previously attached to with rproc_attach()=
).
>   *
>   * In case @rproc is still being used by an additional user(s), then
>   * this function will just decrement the power refcount and exit,
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
