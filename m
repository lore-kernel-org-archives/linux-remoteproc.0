Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D8EC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3720F20757
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 02:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hPADKmpG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgJOC2O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 22:28:14 -0400
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:56197
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbgJOC2N (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 22:28:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UecX492w/G/E3Wg3R0/OnujMGCKNA+0PHWTCjj0ylEfETzHMGXmEsrQ/PrIX88j8MAJ5MNRmmJAyC91w8Qk0hlJv3Ss3/b4yG2GAarJbt4fc4e6mfBap4zA/wAdbI/T/HTq+w7pEXMC1lmIfBVKV4k+B9wxXqGfLtvSF4ZuO7VGGPGvGUTe6BHkFwXTr53eGbwLbuTVWrg8hd1+deNMnl69SeB+YoThBb/Bxuve6EPcDvoj5TQKBqRqJWE6qOuayr/J9H4gKe2l05AfLlXwGb5QjpKptT5ay/3Vdc+q9nxtgQQlkQdx0pD6fsmpYRGJmRIPkIhJ1iiMJj6NETwE9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAQBtV0Pdd4Lv5Q8BV5zLKrxr24aOq6kUQyjSCrxUlk=;
 b=VtY7prh4s+jGc9nxLzdnKIXkeoV2KLptuWag+wj9MMgTgbohFSdUrPiebDROHEPFtmO+6wtiY5dL8BAYLGFy+IfNP8BYoPbQW7bksK4Lid+g1tyJjBDNmbjeFnJH0vLVD0RSsVRjJRynJGou1FrHnDRmwq84D6J5UCvPZh/+0ym4fjyKxn51cND5q5qoOhWvhBqbXBt+DPQexk/4kiZWk4soaG+3qzLmYFEu3egOVj/LBpNONiz/S2ytMPAHOVbWIsqyjt2cEmVHsARjO7UjHZVwBQb2+dmQ9xm4xf0SvEczksvKrtHXjphXFhuMLs3UY5IeYDxivKgOecJIfZcM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAQBtV0Pdd4Lv5Q8BV5zLKrxr24aOq6kUQyjSCrxUlk=;
 b=hPADKmpGppJ1D5PlxLX3RGnkmdTDj0ThYjHcZqkhgyBqYXV7pgHExn570M/z97uS23tO3nJStI72qpRE3BNehpSqO5CeGCCoGeu4+c54K3FiLIsv1LFbG/6GAmYMtFCyi1jDNLAy2yAP67mL2+pZg56Qt/I5JMA8Gx51Beg6464=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 02:28:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 02:28:10 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 13/13] remoteproc: Properly deal with a kernel panic when
 attached
Thread-Topic: [PATCH 13/13] remoteproc: Properly deal with a kernel panic when
 attached
Thread-Index: AQHWe8h+wtXoJHKb90a1UyYrkVHl/6mYPQLQ
Date:   Thu, 15 Oct 2020 02:28:10 +0000
Message-ID: <DB6PR0402MB27602C8FE5A6ECE7D10E419B88020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-14-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-14-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3baa5739-607c-42d7-6abe-08d870b1f5d1
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-microsoft-antispam-prvs: <DB8PR04MB6618FD60D1130B3803B26FE888020@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A8ZayYTLkeQiyhphC3RClQiJw21359Tl5brTEqMYcYWThqxZJa7Dyp1zVFSWZqskAAkjqq3M8YVMUCoAusCzHaPzLaTfOUgs0hGKpUdQ0QvrbsW6ZQJypHtTc8meCBCik6HqO8l8/go1v4j7I2lhV2Y8wJvdGtGT9K5ra4sMGTxoqQMIjuXvG5B0IY6kjaY2ercZg752y8mYTOR3Itu9w18/YWTx0lLdnin11RamXHa6aTfQd8B0c/++egV5WbzrcRhH2ZaCU9OXrzSwGQ+ItGSwGvCvlQ7stP+BXGBzZgqDTh17HVYZQ3L4uJaRCm7f/9dyrzlwU+V78I5qeRog0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(66476007)(66556008)(66446008)(5660300002)(64756008)(71200400001)(52536014)(186003)(26005)(2906002)(83380400001)(8676002)(8936002)(76116006)(4326008)(6506007)(9686003)(44832011)(54906003)(110136005)(55016002)(33656002)(478600001)(7696005)(66946007)(86362001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: IEQ1Oq1HCkeGEzNzH+X0NbSsh06UPDkZlfjgwZxFLrdWq7NrpQvDv+Ao61IfUNzkprGgpgpiBQYNH63AeyymwmzFV1kR7ThEfKN1qLNpz5Mcy8q5dab3qCM/zsMADLgtdgbQwRQMrkJPG/rmKmLXZdQNE1+A1Ez7SikxK0eNgS3sfsLmQchSyF66HgQGMh8KnEf4ypQZul5iZ89ALdIxDInmKr3GcuhRJwR5971ISknBEKaftgSxaDrh1ZQf5uPobY4jqBUdmm+dqQrlsJc9JNcb0rWFNILhuxvoKogCvJ3i/J2G1r1Js59QRY5I00sK7JIXSrUx1g7koYoKiCYxxjncDDmwQRkF+rpKMcWDEbl6W0GijqtV3HE6XOLqeSAM5GZf/wcWapM/QfHt0TctH/i+qqaPg1k+TD+sZz9cOzOsfOj1tkcBOI1ipZALr0iOXtgJ4GW2ZvnSKbmVj994ryN9tcd0YOTd8gyJ5JCLWCV5sHRJ8IByhfWkksKDcwHneWTYsgd/ttRcXO+PsKaIc5KnlrC3pOYOh8/T6ND0v5gzvczdcmEgyZgqDNkX5ub1Vtb6al2g24T046BC3unxVjnEjoCxSHzEomQvWumZsxkoxTh1mGUr1fODFthHBUYcl8MWcnUUMgtcMc34MPkIkg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa5739-607c-42d7-6abe-08d870b1f5d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 02:28:10.7620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OpyRyo8UfVv2tPHr+JhuqrLz6SNBtBvimcbbHtF53cwF1FB0LfZw2UgaOvwKkcfElTbzi1Uc6j+0gepkTZZnfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 13/13] remoteproc: Properly deal with a kernel panic when
> attached
>=20
> The panic handler operation of registered remote processors should also b=
e
> called when remote processors have been attached to.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 5586582f54c5..54b5e3437ab5 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2491,7 +2491,11 @@ static int rproc_panic_handler(struct
> notifier_block *nb, unsigned long event,
>=20
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(rproc, &rproc_list, node) {
> -		if (!rproc->ops->panic || rproc->state !=3D RPROC_RUNNING)
> +		if (!rproc->ops->panic)
> +			continue;
> +
> +		if (rproc->state !=3D RPROC_RUNNING &&
> +		    rproc->state !=3D RPROC_ATTACHED)
>  			continue;
>=20
>  		d =3D rproc->ops->panic(rproc);
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>

