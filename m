Return-Path: <SRS0=dp89=DP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C29C4363D
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 00:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFB0420872
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 00:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="g5HKEdzF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgJHAwk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Oct 2020 20:52:40 -0400
Received: from mail-eopbgr20087.outbound.protection.outlook.com ([40.107.2.87]:43726
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726323AbgJHAwk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Oct 2020 20:52:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGocGGHBj6KTI7mtUTxk9pyDs9KFu05wDcdUn8d2DB8hLxxPvERHMbg6VOSf99EbB9guWvdeB65J/5X/AgeFq5EVmYw93dVVfKBnKQc+bFiz1aCbFNm3pp8jX9uhmJKnYs/Bc05mHRBPtdvJbByu11L+SfzL5j2iGkNikLt5XPCeFm4RGJHlT8ORkuGcdTyaIdPx3P8zldDEeQX+OEu18tDg0y/vErbCYoay+k41+6lW9KrE7VkCGDkO+7W7GrY+Ojd4eht7kqLxRVpVPcoVbbdnfU5GrSs+Tcf/hSuk57xO0TOL5P0284U1vy77AVVN9UIGMJZTnF+ON6Hyx99uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGv+rPvkTGNhfBYCbgpwoJ8mFdNBMcj2M9noLTx0UAQ=;
 b=McnQVi/gLhlgSG2f8qrc+gbqrXOuNkPvT7oJv+udeHiB7xZM6qVpdyrN1k9R0VhvQBEhe8cnwbOgC529lt8TDPlwEInOMBJ9y/7o5IlDJJPHt+NNHIQlfeHMhBjklq0fnN8uXbaLS000hKNKaVzrjObDFPrVTW6XHLEZb6+iGIFi2VvyFyNXact/YUP2bzIj74DIrl/VV2tIDYzyIs35hEuvk4rqWmomFl1cdBzUIyPvwe/SiXERE+UDE/lpEvMZosj7TFshR7E0dgVYOPLPkTBEvSBP5XjZ2tlj15a4LeV791lB5gh7umuN31h51n8jYokwEjbahLywDEZpxCAYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGv+rPvkTGNhfBYCbgpwoJ8mFdNBMcj2M9noLTx0UAQ=;
 b=g5HKEdzFGXOAuAGS1W1dwsf6oBjicdPqWcuidyO5BdA/X4Fui6QvV59uxWh4YcEh9yH9KB5kPe7eBUSQ+pq+HjKb22javt08zROJ56ZdQaCNXSOYpz1e0NgVe0uV0BaWXAbg4RO+6S6cs+NPfj+PAkkwCPZ+CXNMqDgIFC/snOA=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 8 Oct
 2020 00:52:34 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.022; Thu, 8 Oct 2020
 00:52:34 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Topic: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Index: AQHWlJWVukYQqBZsrEmEkGtIBsfyNqmM8R8Q
Date:   Thu, 8 Oct 2020 00:52:34 +0000
Message-ID: <DB6PR0402MB2760EA531095AADAA1B967D9880B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
In-Reply-To: <20200927064131.24101-1-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8705cbff-ce30-4011-b720-08d86b2471ff
x-ms-traffictypediagnostic: DBAPR04MB7350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB73500B12B952A3AF9187A9BD880B0@DBAPR04MB7350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FNyZd+Lw45kXVc4IrsWnmKuN3QoT5lZykuUFQOMv12BH1ILGkK6UznZSlNvMGI1bwqCoDrfNY2Uf08ZVPBR/CnbBT6W4jwix+JuSNgiJ2eqmpj7p47TfkdrvDIIUQbsPmf7Y1AkzS9hKN16LsXvqd4g4BIFUlLAtpjkPSw5fx9DZqO4ZRGuC6IeDZTMnHY9E4yFPpBjmxXBqQRyOtEnxvmlh3Hpo+ewId008UtVEzJipiasxzqbiYVon8aG+QOqVoGD2HXdv2eotAEpaM++Hw3Kw0uAjzfTqlesNssdelOmjsAGfThxN0g7KRGpwJ364twn3isi+LXXul8R6TTUJc/7wFJ6eiyOGuZ59FOI3QVfYpp2inNq/8kzYa9pADLNC9gjHMvNDZ1pc4D7hGOd4kI83Le0TEu0CGcG5+0ewBacgsz9RcNVtqWjsD0xZBZOWstrVEiqrXxtkgfZyLjxoJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(86362001)(316002)(8936002)(4326008)(33656002)(478600001)(966005)(9686003)(8676002)(110136005)(44832011)(7416002)(186003)(26005)(54906003)(83080400001)(5660300002)(7696005)(55016002)(6506007)(2906002)(66446008)(64756008)(66556008)(66476007)(66946007)(52536014)(76116006)(71200400001)(83380400001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: A5ug0p8laqC19WlCL6TrxIfgFuGoXZ8/N8mN1z8AdmL1IUf43UrBEsaoMNc99jCnI0ROdB6xZ0JFj3VrwG01pBhs1ADPQ1Q9OTwQB714GqzDuiXaIt15DwKo1Pf8FQzmGP+WR4cdbEbRdaCYDO8oXMqKP630OsNGPBG1t5EpWGpDK3Epc9cyfyM94/B4BFWkDJF0oz0BnRU9BoD2m4p3O5T9m0Y10jmNM43H4n1VsUfixnBkhXik0Di77MLfDi+7KcDb15O57cg7YZYba3fzJPJP0urq6mIjrJdBcromqqBtLZrVj9azvKhd2iwcgKI5Ha2ScmpN8KlcUEZGxnAHIyOofNADtI/sDt4Oj3pHf884HIKpAsU0z43hJOiddyf1ply/8tnAs8alzvSmJ5eNnxo34MAVhesWEbPLD+sprgdgAcF1qIPiwQw1tcorTpSlJ4s/kP9ndwn5NDlk2OisIa6es3xFwPSdPk8IbMn/6WsuYUPv03pMSyz0rlCDmY1dgKPDrzgdhT7sB1yhS2BNNXGakq0gya0cBwzBV7piKbX6/4GeITY71GhSjVlwEFkX7skS9u+wrgrNxXQT5gI81LCLek4nYpXtGqlgKUxcftEPpeZLBPvZaskUvxjqsSq9RiYDrIj6e+tnkMJC1x27Og==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8705cbff-ce30-4011-b720-08d86b2471ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 00:52:34.6974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLQgzx+WgRe5erm/G5Xzq8J9fowHrVZfwMaN2LASjEdikPYuFbEUC4qpvUfvbixIk3IklOV1bqRtT4KpbpSGCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Mathieu, Oleksij

> Subject: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M

Do you have time to give a look at this patchset?

Thanks,
Peng.

>=20
> V2:
>  Rebased on linux-next
>  Dropped early boot feature to make patchset simple.
>  Drop rsc-da
>=20
> V1:
>  https://patchwork.kernel.org/cover/11682461/
>=20
> This patchset is to support i.MX8MQ/M coproc.
> The early boot feature was dropped to make the patchset small in V2.
>=20
> Since i.MX specific TCM memory requirement, add elf platform hook.
> Several patches have got reviewed by Oleksij and Mathieu in v1.
>=20
> Peng Fan (7):
>   remoteproc: elf: support platform specific memory hook
>   remoteproc: imx_rproc: add elf memory hooks
>   remoteproc: imx_rproc: correct err message
>   remoteproc: imx_rproc: use devm_ioremap
>   remoteproc: imx_rproc: add i.MX specific parse fw hook
>   remoteproc: imx_rproc: support i.MX8MQ/M
>   remoteproc: imx_proc: enable virtio/mailbox
>=20
>  drivers/remoteproc/imx_rproc.c             | 273
> ++++++++++++++++++++-
>  drivers/remoteproc/remoteproc_elf_loader.c |  20 +-
>  include/linux/remoteproc.h                 |   2 +
>  3 files changed, 287 insertions(+), 8 deletions(-)
>=20
> --
> 2.28.0

