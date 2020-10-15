Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E13C43457
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E911922257
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="bgD2o5Q+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731814AbgJOBdb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:33:31 -0400
Received: from mail-eopbgr80059.outbound.protection.outlook.com ([40.107.8.59]:35471
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727025AbgJOBdZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 21:33:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkbcRsBs1cVW1nCkVGC7BCQyePaCbMmjMRnFhCGnbyFUob+Texa6LoEBatq4nIIgsK/+w9AYqDxj2ssZMOryUiaZtXu4dEh8DxnIfMHLsZSZuy8F0y6mAUAtW8V/YzYwhMbcALUNLbA7yJIDan+7e9TzqL8+weFuuxDEsDuQxUBKJroLz9YD7G8b/Q6T/OIHFG24SjbDeBNTGSFHcGNmrkGd1cNIh9XJ/LIzkfHj8qqZRNz9Vr3WUFLRSBQmWL+G0JaDMFFptnen50m05Y+gQnjM7YTCrRbdd3mBpNiB/0T561nuNcj1VQ/WuPdeGFonKft1VBkt4afX+syuhEV0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLPAQ4w/LW5/34r5Q5NnAMcoQLUnSL0nSHMusZH7SDI=;
 b=S+iaxd16R4Wr2W4f8gnWc3Z9lb92PphWEukCgsH4DfNoh7HZD3cG5W44cf8pVmhYEr0UvDc67lL9GZ6IvUiwl4zmodT0OtwAThz+SKzKAaKgPmJsEp/MfRyET12s4SHxk8r7T163DURmGtxJyeIf38O5n2Rxn3lmXZ0bdoRr3ms2wUCr6G6lnrJvRGUcVNGuC0zksqEgl6Z14tdN/Mw+t7FMGdmDFGoNJtrytm/oj9OXUtJ8BfAVexd1aqajUCu5xpJI+D9sKh+I3+Fu3vmWkCDiMRdwPzAxT4VfbOd3jyJuH+hmYhN+fl+rKwlSRM+CYPwxCkMmFcVEeaP8FH7Q7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLPAQ4w/LW5/34r5Q5NnAMcoQLUnSL0nSHMusZH7SDI=;
 b=bgD2o5Q+cnD9hHpZS4Ee6lhY3vJ87bvmvsiSn/xw44s7mEmcpddhAFH1Fj/rWOW+BBPIxBXmyGboCbBMFMeX0LkS+Gzto+Dj8FBcTjPfBM2tZKX3VsfYk3S5FRtoC0qSTsu1XB2lRV3IibH1Wg3c6yrYOb7PfSY0CwwvxVgb974=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 01:33:21 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 01:33:21 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/13] remoteproc: Properly represent the attached state
Thread-Topic: [PATCH 04/13] remoteproc: Properly represent the attached state
Thread-Index: AQHWe8jHBhVcjpKGeU6R9CCJtEvMZqmYLoig
Date:   Thu, 15 Oct 2020 01:33:21 +0000
Message-ID: <DB6PR0402MB276089D3879EBA0C1AA3F09988020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-5-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-5-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34ee6980-a612-4b40-c793-08d870aa4d1b
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-microsoft-antispam-prvs: <DB7PR04MB40904E2C8BCA16B932BE346F88020@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xy3paGPHXFhZwtYldiy+INeZt3XIvRWzO2lhmexkA+LEcoHdWw3c9qNLBaw7LQjomu6AqYnGi5950T6AggXPfOIRjo8T9IQCgb5JxrjmybrLGVWI55u77CPmbHVgIs4UfTbev21CdPDMvmGXn/PJ7WJVrrLmr97UJFD+G/MyzNGHGPyg2osDf81EiVygt5MAvanU81EgT3oU1YF+FGLuNMTdxLPdFpdyYhgtkWsN8Xf8F7lB3pOEkbIGFZGgQACHj/C6vkuZhgZq/CPf4t4l98mT4KozQIT9/Lo4rj3uXNHzWVjtlx3bN0zppsyNWlv7HkzRRgKdgyFcz1PlzsrvDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(55016002)(9686003)(26005)(478600001)(4326008)(8676002)(2906002)(7696005)(186003)(8936002)(52536014)(44832011)(64756008)(83380400001)(33656002)(6506007)(54906003)(316002)(110136005)(66556008)(76116006)(66446008)(66476007)(5660300002)(86362001)(71200400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: e3E78AK00hWIG4+bhcvZYbeHE9THLlAm0Npo+rhsVOGAbXij1Tszo4H3/pRjbthErJGsVXi4qGvF4cyyRX0J8ggI+D33K0Ky65QyTdwBuo3vR3+LamRIWUmIs1GXyL0PSl6iglZN9JdGRg3/m+QW1Fi+BOqO7RJh7dyBpD68Ftf0YZV6+pVvXuGKMEhOkTx6NwKHck3IpkvIFsP6LhymCSfGm9m4a3P+tLiDK1Nw+jqHW7rPBPD6KTw0dyBAZB7fkJxFwXOvUQ9MSA3QqDZ8PXFSiEewsE70mJH20pmThId1VAkOl2uc8ugSvS+k7Dh/jjeYmexj9yE2mn8XiaOP4RL/G0me+yiTDtEaA7D/cS5gXYVTG5SuB7/k0B0s7BtOHrrO8LPJo+XKRU7e4SGnRpiWVCgzBThk24dcuq0Cu0TwBE9/qaKF/fHaJ4p3yS66rsD//NUGOvVfVmBRNiGDw5yOnNdjWbMpeX4QyK0HXCXNOGyOvP/7TrH+NSCtQv5Vn3jbjnBSedvbgBtagR+JEck8Y8swHw7p+pz78ys4pRhhOipZWvhfZeEfOgtgHNkW8VCCR9hM6GRgG2e2nZvpzy+V0JS0EP19b5g29PC2URyyRkZj81jqpA/fO5BsTODL5Nq57Llm4eGjKnC26YpSnw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ee6980-a612-4b40-c793-08d870aa4d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 01:33:21.1553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PQjaaUtrkuZKBGY1Y/77uNLrxf5EdlgoUJ5b0rFenh7xpkuhj0gwSTrDSqzLumH5AdljFl0/b7NPyGVGBcYDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 04/13] remoteproc: Properly represent the attached state
>=20
> There is a need to know when a remote processor has been attached to
> rather than booted by the remoteproc core.  In order to avoid manipulatin=
g
> two variables, i.e rproc::autonomous and rproc::state, get rid of the for=
mer
> and simply use the newly introduced RPROC_ATTACHED state.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c  | 20 +-------------------
> drivers/remoteproc/remoteproc_sysfs.c |  5 +----
>  include/linux/remoteproc.h            |  2 --
>  3 files changed, 2 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 7d78c9a9d88f..bffaa9ea7c8f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1421,7 +1421,7 @@ static int rproc_attach(struct rproc *rproc)
>  		goto stop_rproc;
>  	}
>=20
> -	rproc->state =3D RPROC_RUNNING;
> +	rproc->state =3D RPROC_ATTACHED;
>=20
>  	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
>=20
> @@ -1636,14 +1636,6 @@ static int rproc_stop(struct rproc *rproc, bool
> crashed)
>=20
>  	rproc->state =3D RPROC_OFFLINE;
>=20
> -	/*
> -	 * The remote processor has been stopped and is now offline, which
> means
> -	 * that the next time it is brought back online the remoteproc core wil=
l
> -	 * be responsible to load its firmware.  As such it is no longer
> -	 * autonomous.
> -	 */
> -	rproc->autonomous =3D false;
> -
>  	dev_info(dev, "stopped remote processor %s\n", rproc->name);
>=20
>  	return 0;
> @@ -1994,16 +1986,6 @@ int rproc_add(struct rproc *rproc)
>  	if (ret < 0)
>  		return ret;
>=20
> -	/*
> -	 * Remind ourselves the remote processor has been attached to rather
> -	 * than booted by the remoteproc core.  This is important because the
> -	 * RPROC_DETACHED state will be lost as soon as the remote processor
> -	 * has been attached to.  Used in firmware_show() and reset in
> -	 * rproc_stop().
> -	 */
> -	if (rproc->state =3D=3D RPROC_DETACHED)
> -		rproc->autonomous =3D true;
> -
>  	/* if rproc is marked always-on, request it to boot */
>  	if (rproc->auto_boot) {
>  		ret =3D rproc_trigger_auto_boot(rproc); diff --git
> a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index 2d575e6c9eb8..c152d11a4d3c 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -21,11 +21,8 @@ static ssize_t firmware_show(struct device *dev, struc=
t
> device_attribute *attr,
>  	 * If the remote processor has been started by an external
>  	 * entity we have no idea of what image it is running.  As such
>  	 * simply display a generic string rather then rproc->firmware.
> -	 *
> -	 * Here we rely on the autonomous flag because a remote processor
> -	 * may have been attached to and currently in a running state.
>  	 */
> -	if (rproc->autonomous)
> +	if (rproc->state =3D=3D RPROC_ATTACHED)
>  		firmware =3D "unknown";
>=20
>  	return sprintf(buf, "%s\n", firmware); diff --git
> a/include/linux/remoteproc.h b/include/linux/remoteproc.h index
> 4e107615121a..fe383392a821 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -510,7 +510,6 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-start=
ed
> - * @autonomous: true if an external entity has booted the remote process=
or
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   * @char_dev: character device of the rproc @@ -547,7 +546,6 @@ struct
> rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> -	bool autonomous;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  	u8 elf_class;
> --

Looks good.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
