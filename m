Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6076EC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:31:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD0CA20757
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:31:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="npjRN/ye"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgJOCba (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 22:31:30 -0400
Received: from mail-eopbgr60070.outbound.protection.outlook.com ([40.107.6.70]:3652
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbgJOCba (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 22:31:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lODj9B4L4VzqMWvER5FGrtcTfTDkJNyeaJdwQg+okV/X66QfcxvbyR2Wwc4LAKj6VvNriEduRQVZnFOqsBYfsuYoUBKrLbXhGD4DkjgJifkZVDNj2E33MfRgBopL3yEG4q1WXycqClbo/5PvG91aohimWcnHY2/s3ten7ZUtBy/AXqV3bkG3/9ZffRVWM6qGIDOeYgBbNooLyD3TYAw20xsRPUI3ifrqbRu/zJau9T+q7ZrQ3wtqKsGm0GM/lMkJ7yFrMWcxx0hBF3p/AA95EKmQcPotYtRlYCV3lJQ6sY0s+anjFktIBygk3dawbALYsE6ixqbMozGrSM3Vq7ADsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qnnt9OtDEziQp0s6vrPWoa3wgt38uZYn4tjrQPtZVJk=;
 b=YQnqxw6slE2/O7i9GGmrLokIBEW7n3USSx4XIdq3MlHjMzb6EZYc5RwNDsYia/TvDQcM9NLqg6s8mg6RmrKIjcEA6h3akO3mrhP3j7W2ESWAralz5mNlPdrl0miChYrTsVgmCd7Y4IawCYJPj36ODkPWoSBU1GQ0tofMjD9AuGKK+Fw53Ab3w+UoEkmmBe/ZtfHjIolI4xgwFVM/LEvr3EQw2tXX3XZanIHdLAoyTs+dUl0/ARFUfz7RpJA4cEJL+6cMFsogmR+gpUsnFJ2LWiBXg9phND7KlYQdMi7eqa7989VuYtPCRSFkk28pgUL16G9xfAZ77nx3KvDnj51CGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qnnt9OtDEziQp0s6vrPWoa3wgt38uZYn4tjrQPtZVJk=;
 b=npjRN/yeX+ZSBtOh34qudYY8ogH0SK6SSfcbXx6Do2RDgePOf29lkIKhrAxJ8hSOedHZ5xSf9KFfSypHL1TLprUuZU/VO3k4F52Yuru2B/Fn8K+XAwrBc61ABKBOUxEzZjsYhtwV742uIe+hGB7sWrh+k3Z6RIxuuKZYc5JOSD0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 02:31:27 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 02:31:21 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 12/13] remoteproc: Refactor rproc delete and cdev release
 path
Thread-Topic: [PATCH 12/13] remoteproc: Refactor rproc delete and cdev release
 path
Thread-Index: AQHWe8ifBTo7u9IA2UasNKAco1Rai6mYPt/Q
Date:   Thu, 15 Oct 2020 02:31:21 +0000
Message-ID: <DB6PR0402MB276062C22F68E533AD9BAC7488020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-13-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-13-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22b01616-7059-4256-a3c3-08d870b2674a
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-microsoft-antispam-prvs: <DB8PR04MB6618519C3CB3AE280CB6447A88020@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfA7rn8YrzCVMxjZHLmuBwFyJGRDwKtAi7IOx4KQpu6xT9POb/La1Uou5QpyipFRfWBfBl0G57uvoyzM7ctoY7Q+IqhcXDbctPBu9az7QKQtCJU2viPSdVmo559eKk40BIxwMmXUKC1BewROClYjf7V3Cd1l9Ywl95KkeI0RpJK095j7w9VTYUBf3CdvYpH51uc35fzo7ovXC4zQLk6gpbYztjW5FP86Zzzvl4Eo/ZnOEYl7wbSoXHC/wqBIqUioc1/FYNFTAV6UQpsuu5eSGmKcWOmjMgX09O/UQYcRpClYXR4pM89Zj433W8Fspekjx/HPDp2Xl0xpEXJ4yw0Mrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(66476007)(66556008)(66446008)(5660300002)(64756008)(71200400001)(52536014)(186003)(26005)(2906002)(83380400001)(8676002)(8936002)(76116006)(4326008)(6506007)(9686003)(44832011)(54906003)(110136005)(55016002)(33656002)(478600001)(7696005)(66946007)(86362001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: YnZloOQuQUMLYYV5CSHqhAEnSXKlqSSelFaVs/bygWEJI1ITZFiOal7VAQVWWPmSTmsj0x4au5lJrpvmwlPdZ2aoxn824GWBt4oRbLi5vze7ZThBUfjv/pB8G865aRGqXvKFarrsQ3aMTPm/OyoYvNRz0nRfCq3N2kvRVOz6WpDTB+WpM2ud+6w2OauLWeKeuv2Jeu+Z/AdmjrXVSphcIp/96ZRFgbeWRn6pYQlOqQz5f4+6gdwaRrsJFdVkRPDD2iEQDg4fuFNI/RRTmds3eXcL1L2xD397vFf88OzcaeRKmRrrQ4yZ0gpBJh3Ks7wyVqRBKR2DYy6r5l1qGjrA0Q7uKEFrtO6I/X3WIcjxZcRf0UVGPRIPW4rYiQKlkyc8YSyv3KzrvZMBendzSLywBHwe8yiZEmU7kD1K8V9p+53j8neAkAOvshZ9Gsx/+/q1Na9zLqknVtSmqAq0gO6xI9Q9MxcGkAfpZdU9pSwfidI7TMYFpgrNgWC/TcplJfplPELl+J40BEXLG3nq/K0sZI7ZHjXS9qQI0O991yaR1VKx9F4wFzOXyfMnM4AMV96t1pIdKt7NIn/omhrmRPfxHdNvPpdzSiEEOFMPzVrvdtQ3QDr4/V+CA5ZTj2P3AMXjAzdvF/o68onFFkO8Z2W5aQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b01616-7059-4256-a3c3-08d870b2674a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 02:31:21.1470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTXMDz5QZK8ySJV1pSTOk5cM8wS3rhd/8jgwbAFnWeF6RJVuKJgVCCOnQiqSYKXQGZObiJFcRQaCqV1U13EHQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 12/13] remoteproc: Refactor rproc delete and cdev release
> path
>=20
> Refactor function rproc_del() and rproc_cdev_release() to take into accou=
nt
> scenarios where the remote processor has been attached to.  If the remote
> processor has been started by the remoteproc core then switch it off, and=
 if it
> was attached to detach from it. This heuristic is simple and can be enhan=
ced
> easily if there is a need to.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_cdev.c | 7 ++++++-
> drivers/remoteproc/remoteproc_core.c | 5 ++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_cdev.c
> b/drivers/remoteproc/remoteproc_cdev.c
> index 3a3830e27050..18cffbe588c1 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -87,8 +87,13 @@ static int rproc_cdev_release(struct inode *inode,
> struct file *filp)  {
>  	struct rproc *rproc =3D container_of(inode->i_cdev, struct rproc, cdev)=
;
>=20
> -	if (rproc->cdev_put_on_release && rproc->state =3D=3D RPROC_RUNNING)
> +	if (!rproc->cdev_put_on_release)
> +		return 0;
> +
> +	if (rproc->state =3D=3D RPROC_RUNNING)
>  		rproc_shutdown(rproc);
> +	else if (rproc->state =3D=3D RPROC_ATTACHED)
> +		rproc_detach(rproc);
>=20
>  	return 0;
>  }
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 95bb40b4ebb3..5586582f54c5 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2346,7 +2346,10 @@ int rproc_del(struct rproc *rproc)
>  		return -EINVAL;
>=20
>  	/* TODO: make sure this works with rproc->power > 1 */
> -	rproc_shutdown(rproc);
> +	if (rproc->state =3D=3D RPROC_RUNNING)
> +		rproc_shutdown(rproc);
> +	else if (rproc->state =3D=3D RPROC_ATTACHED)
> +		rproc_detach(rproc);
>=20
>  	mutex_lock(&rproc->lock);
>  	rproc->state =3D RPROC_DELETED;
> --
Reviewed-by: Peng Fan <peng.fan@nxp.com>
