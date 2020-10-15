Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32091C433E7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:30:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAFF220757
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FCZv8toE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgJOCaO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 22:30:14 -0400
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:48357
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbgJOCaO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 22:30:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVGjNNCYxmKFmMMvh0cn9hEZmiUiDWX1pb6t/ZRqIcVxMPjdNaT17Calm9jdWzGXR+I2ED5/XC6N5tUCxyu4yeqrHVq5C/Px3DTzYT14nRdT8JIrTEXTO4O/8034MUwma8rCMztmIo6QY8sZ00PKJd2xr6nYzQGLrp8NhDOH27hDyeD60ip5cNcrW3TNJGvBgDvVefTRbMG1P7eutBeXGUwKViXw9eOPohLuukhnkufbAG5kdAhSuPmFIIUipG2pZLLn3+clX91RXpgStBZn7KRydEhe/9H9e+NaJ7mjrjGiMRH7zBANjUywa+n8zBieywJTZ7uGWEqoJ4aJhSZ9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7MWCW+PRYv9kN3lH03G0SQ0znIVkiG3VrVLh5HUKUM=;
 b=nK5Wbu7ygTR+tbjqHgTGwmSFbbellPPEMFem1/1mk0UbRv4/qIDAajNYq2VE2MV0QA1yLwA/4TKc4hz0mnStDQ/DVVOWXhivEzazPbipk1YwgXlYVSIer37cSM9wHtFrso5zgZNgsrwppgn4hkUMFFJJcStNSdEpdWpZ3EE7DnSuIW83A+GHQiK9wwKn5Rjm/5HWvt2VlmuvCmrm3u3mnB2SpPvJ40/J+K8FTxe7VDZSb+R0d1NHmMnJOMuOz4Mg217I6DwCaEaGCUK32qBh7P3tKgo/KCWV36oDxBcVyj9WdAEuQj6WmrTc3wsu+VtTZ1e8qyaGXkLBH4D4RhZ4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7MWCW+PRYv9kN3lH03G0SQ0znIVkiG3VrVLh5HUKUM=;
 b=FCZv8toEqKNfxViR06+XK2WDULPs/KswuTRTjjoczOSJEzGHnusr5dQ/f8gORbiuTaAmlD4YDtCQJnWkT9sidjiR/Y+hgGwswih//t7I62X8co0LnBg+peoDil9HY+rsxjGH03oV1xDIPMmCunAtNFzsjAEQ+DB2+oBgxFF9LWI=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 02:30:11 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 02:30:11 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 11/13] remoteproc: Properly deal with detach request
Thread-Topic: [PATCH 11/13] remoteproc: Properly deal with detach request
Thread-Index: AQHWe8ilgzet8FtReUWF3NILfcsyS6mYPobw
Date:   Thu, 15 Oct 2020 02:30:11 +0000
Message-ID: <DB6PR0402MB27608C80AA68CFB8DAB3C6F088020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-12-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-12-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fce2cb08-7692-4a5c-44c8-08d870b23d8a
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-microsoft-antispam-prvs: <DB8PR04MB66184FAD2052A3E6619D5F0588020@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jXffkwQJAoYtylqYLuimiRaptP8vc6PaXY6yTYQkqkT69A+LP5oEvqihdyUSEfSm5jPWR2JpbK/ykNaVtgIN9mq2cVZETc4W72OhHab4J+D9RtBW5dS8dFvGjMGx+bKdykQQ7oIUOFKWgUDlWQMrPnxdUgFxRi7NBlEH2OJ2/vjfiuO6TPC4wxLFyKi8DFE8FL/iyanvVVuoAPhKmTAJpoJFKhQSbihAetqqkpSIPC8Ysx/FP5ZSp1h0hlLWyrEwANNDPptb74/SiWnFRTbrLJvWpFK8PrHsHanZbr4i/KVtbY4QGu6b8D/FkZTtvj51fFkOSb9mYtpa0XQcjujkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(66476007)(66556008)(66446008)(5660300002)(64756008)(71200400001)(52536014)(186003)(26005)(2906002)(83380400001)(8676002)(8936002)(76116006)(4326008)(6506007)(9686003)(44832011)(54906003)(110136005)(55016002)(33656002)(478600001)(7696005)(66946007)(86362001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OTlzxCp2cFMpzGpCtwqbCzED/QJI5P5/7xwd9pMATQJ+bzLPI7CRcJdf78L9/yLKrCmxptxy67orY0gfPDB+pxllU59VkAafM/688j197Z1BSzONNbl9hsRkGiAAD8Zfeul0e5+eP3XcqgbhRFxvzEKLIapXy3kL+3tqdOlQ6kqbg+lZcGaBDBzLNUmMVL67iQB4DIEbPZ6EdQRlSu6gB/qmOPhATWF4Qpvw1QTAHfk4eaO+MQZbV4BDDKsUlaX/jRoKm+wVp+kEAabzSKcpp4O5cwcLjOfx7jGQ8EMHQfLk9dTo4vzw8b0fkxArMVMAlGfvfnEmUL/dw04Mdkn793HupgaakXgz5Ai4HHgXTV6JmZCL9jyU+wMSULjE63ugGU2lp4dS81BFqmt/tRw9GPxBoQn6J4abv1ZwCOuYOLiEfhIYFwkyuRIwcLOrN8nOu7+H72HMr96KXPw5C8SB7dz3uqC2wRaoTU+dsXbRAVsw2mToEmoko5LBLxsT49S3bEY41gSYaWdrlo5z4zRA5b8Pn7vuCf8/Fwpl8bkonGG8Btkrzf8MGv9mWSZFWcCgcq7CxUMYbWbtof5v3IAfrj2SQlhdE6xebVRn+7BHP0AO9imwCwHzEstFqEoNpiUGKkkx0BwRQOcU+x5i1V1irQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce2cb08-7692-4a5c-44c8-08d870b23d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 02:30:11.1276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ljxV2C3GYFvrPfKoGKnmFBGJhV7+Jb0zI36dSDSxOD103gWQySawSEm00U1h1cRKbvDWPb8wLg4JjNhWj832AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 11/13] remoteproc: Properly deal with detach request
>=20
> This patch introduces the capability to detach a remote processor that ha=
s
> been attached to or booted by the remoteproc core.  For that to happen a
> rproc::ops::detach() operation need to be available.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_cdev.c  | 6 ++++++
> drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_cdev.c
> b/drivers/remoteproc/remoteproc_cdev.c
> index d06f8d4919c7..3a3830e27050 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -42,6 +42,12 @@ static ssize_t rproc_cdev_write(struct file *filp, con=
st
> char __user *buf, size_
>  			return -EINVAL;
>=20
>  		ret =3D rproc_shutdown(rproc);
> +	} else if (!strncmp(cmd, "detach", len)) {
> +		if (rproc->state !=3D RPROC_RUNNING &&
> +		    rproc->state !=3D RPROC_ATTACHED)
> +			return -EINVAL;
> +
> +		ret =3D rproc_detach(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognized option\n");
>  		ret =3D -EINVAL;
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index 6134d2f083ce..013231f69837 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -118,6 +118,12 @@ static ssize_t state_store(struct device *dev,
>  			return -EINVAL;
>=20
>  		ret =3D rproc_shutdown(rproc);
> +	} else if (sysfs_streq(buf, "detach")) {
> +		if (rproc->state !=3D RPROC_RUNNING &&
> +		    rproc->state !=3D RPROC_ATTACHED)
> +			return -EINVAL;
> +
> +		ret =3D rproc_detach(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>  		ret =3D -EINVAL;
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
