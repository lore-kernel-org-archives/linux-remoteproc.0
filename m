Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B39C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A31A222254
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="EbIA4+iB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732290AbgJOBaD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:30:03 -0400
Received: from mail-db8eur05on2076.outbound.protection.outlook.com ([40.107.20.76]:5313
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388728AbgJOB3x (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 21:29:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWotiyz/yWTHBw3E1SNYOQKrzT7UrNJbRy393oqhtsoChJCHcs7QUdYs3tusuu2zQjgN8bcdQOCO/ADtmS/uolX7uDR3t7dbGMCb9RU4mJDsDLcjMWnEzoJfPggqg4hGfEG3Ok5r9bjDDsoZaW7wf3E68GdKKGP/cKHTTmkaoJowUNhH34aMahwLloFxA55XHEMla265oX/e1nQuArVlZPyXYzERy6AHXQpRSSK78NuUJjoQOXvg20yAUJOx3I2/E2BwTea26Rgr5o1cGhvLDNTw3jUjNjLLch4kxK7JUa8jjA1sIoLX7gMSHNvHmfellvWUuCu1qP6b2Ui9mt03rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKY4AWzJJLQtycdWcdQ0Em4J6KSpm8q2iTiV++J5t7I=;
 b=Dr4ewLDp57MxAx5LrXeCN+iWJD7DA7ofYxLPdOr2BHjh+s79n0QRVVqyRz/yIdF0Ag6pu8IfyaSTh/uGR9jRqEgVLKE5Z7vabZ6m/dKcOIBbXo4PAX8DLoEbOZguqEBe7vCtBUv9HqxJiQS/6I02gEp2VFC+WNrRNJTwXOdNTfh9TmVWrbfgBy4j5s2VmJmG2vzibHgrB2Z7ehxUCJrbqHNQiC2UBg8BR/gAAGTOH4mOwTTDrv8oT9vns9We8bb7pBXtLvOQqgopGWugecyztTfH1DSZjTbtWs4zYgqLEHDMfG2Tk5icuwdPPTqfr9txSwuNOiTaegKxjTk22KuufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKY4AWzJJLQtycdWcdQ0Em4J6KSpm8q2iTiV++J5t7I=;
 b=EbIA4+iBPeNgNCdcS83xuHjt938Uew8QBXRxXyY6lFFbqHC718uZA2swzbeXilcVF/LuKqrVqKI7y48VDnf/tSLUeqEdkju0xwzYdauYew4C1VeUMYcviwaHqat+nwYyUVJ8kt1Jr+9D4W5r118ee3UezEA/N2Cv0j7o6wFDckY=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 01:29:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 01:29:50 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 02/13] remoteproc: Remove useless check in rproc_del()
Thread-Topic: [PATCH 02/13] remoteproc: Remove useless check in rproc_del()
Thread-Index: AQHWe8jI0ecK6DCrPEyHUcE0GW/lSqmYLaxg
Date:   Thu, 15 Oct 2020 01:29:49 +0000
Message-ID: <DB6PR0402MB276025A8C537BC126725389588020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-3-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-3-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 127a605e-8523-423c-1820-08d870a9cf46
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-microsoft-antispam-prvs: <DB7PR04MB4090BF0115A640A0AC01788388020@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bsx/rstsTVMaOUFMzhE2ERD/MFEKtadc4wO1AfDi7s6emcY/o7mMVGgpBrOhFWTQvI/X5g8ucvLjF2UfxUNyhLNswp/1aUePdcaHY+rfv+zNBqH2UMy0vxiK8a3tu582RYvUxtc41Vfo0FLFp/ppp90YWaJzBFbEWwblRU1F/1WCVe6jllzoe5beMvbLLEYs0uolY8DWV+vxEyn+KmFuFOWD14CycPvsaoDUMCDQygrzGT9doPuo0pqekCip2OQ1ePM6eAE2GFwJ8Ar8KMUK50VyZtVkvYj7Uyjj/jKfPYIZfvcPPuXIsSZdQXwO/HucODtLHeA1lgWOtrwmjXGnjw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(55016002)(9686003)(26005)(478600001)(4326008)(8676002)(2906002)(7696005)(186003)(8936002)(52536014)(44832011)(64756008)(83380400001)(33656002)(6506007)(54906003)(316002)(110136005)(66556008)(76116006)(66446008)(66476007)(5660300002)(86362001)(71200400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rAn8Bu8byE/Zv/vF5vo8J5ikCfHk/2vJ+7Jw1NnMjPO+0JmcRqrPyd35/4CDdSTSCRzdMXxeYSL5AR2NpVZlx17Gy+6+skZpL4VZA8UgZc4SDsAconxlt/H1vOOyK1Yz5iOR4D6oIePD6BRHQJ/TkP+NqSeDXSqv+nb0Y36nRcmyB+izTVxr8F00vaESfemj5qGd+/Mx0dqsZDh3CKiqo0zb6cV3FNDDB7H60SRp1iaQiKK1xni/JoSRVsayyVjDoROnnrfUJLKsYlQs6Z4ya7WIesC/qkmhKwKwd0erhdRrFSRg1qRlGsNuDuN3QC2KKgR2J9oUnT3HmkXYMXUQi/HT9ykeQ2YONKjjW5qLZn1pD5+oVz5/9IJnpRe7E/A01ivd10ELO0xXv/rdPvrw7uAs7dkThGQJ0hQ3XOauV9iwtZhyGedUnO1l+6ReIBY5qG+lyJE+iAHlgsba6dD2qcJ4/XIR1sziAjlyinWq7T8+sYHpNMnQ4f8XPzeEbsWcW/UO2mPEWOt+LzmUkcDoYyrxgYaNRUJpR/Yyuq2brZpecTNLEalHuRgFNm80WFngBSayugY8adjafF2v3DWnTfD1AE2MNBXGixnjajjNBMeuOAc0YATlAtFS/u+BOWuU0Mz3uPDpexDyEg4I6XG6YQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127a605e-8523-423c-1820-08d870a9cf46
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 01:29:50.0867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70GKkHOKNFr92hOOlpQhkB+2D750Z7u0c52FsHgQH1A/Wr1hIUz2O9F6sc0p5zsSwnW5eBdvphNTAB42kEmnpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 02/13] remoteproc: Remove useless check in rproc_del()
>=20
> Whether started at probe() time or thereafter from the command line, a
> remote processor needs to be shutdown before the final cleanup phases can
> happen.  Otherwise the system may be left in an unpredictable state where
> the remote processor is expecting the remoteproc core to be providing
> services when in fact it no longer exist.
>=20
> Invariably calling rproc_shutdown() is fine since it will return immediat=
ely if
> the remote processor has already been switched off.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index fb2632cbd2df..7d78c9a9d88f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2260,10 +2260,8 @@ int rproc_del(struct rproc *rproc)
>  	if (!rproc)
>  		return -EINVAL;
>=20
> -	/* if rproc is marked always-on, rproc_add() booted it */
>  	/* TODO: make sure this works with rproc->power > 1 */
> -	if (rproc->auto_boot)
> -		rproc_shutdown(rproc);
> +	rproc_shutdown(rproc);
>=20
>  	mutex_lock(&rproc->lock);
>  	rproc->state =3D RPROC_DELETED;
> --
Reviewed-by: Peng Fan <peng.fan@nxp.com>

