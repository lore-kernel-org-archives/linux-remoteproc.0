Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9F0C433E7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D43A622257
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="QtcE1qJb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388471AbgJOBjW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:39:22 -0400
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com ([40.107.21.67]:61537
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387776AbgJOBjV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 21:39:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpyWFs8M7S+cZzSIyGMuW0qlUPWEmfy6v28IDVbq97hyaKFCG2Ed1mX0eAchkdFp0ocQJImZIs3DLtR+l/PmUgA0n2Nb0JTlRMmCB/jO3Ok+YIyyMyILGHhZcFjlVrGzEGhm43qTOCysWe9PbDWda1WdoH0dQFB04QOluZ73r9mYMdqsEw+X6D/cXdBxDjd85xwWK/AfxDMBHQs0jYnobkyK1XpMA2iZ9zL7vtzLBkXcJRUAsi1LJ3sP3aWlaOFlyVdykSDZr0js3ChRlG9fv9h185HiRzXE90b08po/QZv64/Yu6SDJVVcN9NtwMuP6Pb57hULdwK8pvOCutndmwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AFsYrKo/BhfrHFtFVi6wkLEDgB3kipiHXe5X6FyOYA=;
 b=OLsCXE+jHj6edO/AlEfIuPoeyqrC1PVZ6Zy4WfP53R5foDYMx9N0o5oc9k2dnow5nkVik1xIoyOiQBp/wg5z+V7s4YCY+wR+bwTamuZjvUj89uFEdCbU44pG1Zfg+HKQzWlKmJukGzpvDvmMIbNvJ79z/Fag/l9TDmUxabMQC76zY3OI+RYpxeqtCjxM0wVSitkmRguMmyok5PXa7BDbpu0R4ViMXWRO+LFY5IYz9BcVSTmOoMeEmlCTplp9g1as6hQnkgTIwaijC71TQdKcNR3nAhYrfYWog/MKYD3mJVSiktVb2yoISYDgkNu+G9ev12AyKwJydy05Y5fUSbh6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AFsYrKo/BhfrHFtFVi6wkLEDgB3kipiHXe5X6FyOYA=;
 b=QtcE1qJbd5ovNNZg/HyGYTMxWVho/8G2r7kVHZ5xTfPx7GCXsiRMIa+0rcl0HpF3fnKG7aV2u7TuCZimxg8JD6fHko3qC9Nblxb5hf+iJeJIZIr5PHJfQVPu8o2qh9rRaJmVLFiYFHQ0k6MEcCz2vwCiFPCTeGIBwaDaxvItsZc=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7657.eurprd04.prod.outlook.com (2603:10a6:10:1f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Thu, 15 Oct
 2020 01:39:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 01:39:18 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 06/13] remoteproc: Introduce function __rproc_detach()
Thread-Topic: [PATCH 06/13] remoteproc: Introduce function __rproc_detach()
Thread-Index: AQHWe8hghvjg60uXcUW0DuhcpfkAcqmYMFYw
Date:   Thu, 15 Oct 2020 01:39:18 +0000
Message-ID: <DB6PR0402MB2760E4ED64A4F674B3207DB788020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-7-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-7-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4ab5c9f-f8f9-442a-ceb9-08d870ab21c7
x-ms-traffictypediagnostic: DBBPR04MB7657:
x-microsoft-antispam-prvs: <DBBPR04MB76574B1C3888B6D959D2D58488020@DBBPR04MB7657.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2OzhINdKazuRgEDmMMKbC++3ziidAHxPOXTX0j2t167kSps5lsJXUtCKxx3VbU6AceOK4xigtR+5dWj1TbHQRDT/tiZXORs9c4yjbY21Z3zVlynvujCuuOTRTn1dXRXEYho9UcBzJT0g7/zJoclZnC4771T92hJwUV3NA987vXdKoxGCiad5RdI21/lGGHQ/hQPwJl1C//+NF+TTC7E1sqSi54Nph4TMjIyuprTugzX0iZzVBHAV5GiFmC0U/AAc8dXrcIsFC286QuJMnWjq3Yl4G/M8MdwGNxLXGNu7AHHTJHQSgwIFaSh5WKhvyY13YqCcX2iIiiElkZDvLDWBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(66446008)(76116006)(44832011)(110136005)(5660300002)(54906003)(9686003)(316002)(71200400001)(2906002)(4326008)(8936002)(66946007)(64756008)(52536014)(6506007)(55016002)(7696005)(33656002)(26005)(66476007)(66556008)(478600001)(8676002)(186003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NpYxfK57tChcsiOFavCuL+6rL7rb7uGLJnQjiy9GRti3GqB9kldqmJQ9p9TSM3dDd+VJc0TdA60mlSfIhm1EbL+1G75pYjBfD32tb1GjUAObK+HMgd2IWwg4igUFm23a1sbL/E7zG5fM6weZ9qUE1i7J5FmAuJAaWxR78/TJ0pRJ556kUaNW9JqnOLg/zHJvV+dlexx9Od7t9/GFIbxjtF2SY1io+lM89sickpbckJVhkhuvaF0yRAiCPE5BUgPl0M5USbSP7R9TfmqiBSoWLoQK9KdjBJo62TtUqALdVfW53zEywA0F7eQUctgcwIDFIZLr4hpDo9FIhfYp5ho02Kys9mYj0MFdVC5eiBc2Pfbj6uB6wh4op/Nhc3uPtnzFKPBqs07bRKJnpP7W1+W0Vasig0TlOqphOgY+spnhcBdY35jLfHQ19vgzXfy7uW+cNmE4I7HY92GJ/rU4UGGIkua3MVb1vraYnBcGXi2SZADNGeTs/V4oW8wQGTm6dUSxThDisCm4czRVjh/SHrqljEk223iKtcPdu65QDrs/s9rlI/17TJ4pihZUmA+Eg5X3IpW9IgfvNwrq28VkwVHu6Y26ruXfhjpAjUl8s64MAyALgYn6Yyslv9jK7iheaYS8MD0K5He74BLMF0lAMhqR4w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ab5c9f-f8f9-442a-ceb9-08d870ab21c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 01:39:18.0346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WHo6A/31CibYo6i5ADXstVUd5sYfVufmBSHLufhw0ycs0jLgERQRfdnfHWQ6XKHJ4tAq1kKDrVkLAXEsWQ+gng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7657
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 06/13] remoteproc: Introduce function __rproc_detach()
>=20
> Introduce function __rproc_detach() to perform the same kind of operation=
 as
> rproc_stop(), but instead of switching off the remote processor using
> rproc->ops->stop(), it uses
> rproc->ops->detach().  That way it is possible for the core
> to release the resources associated with a remote processor while the lat=
ter
> is kept operating.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 31
> ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index bffaa9ea7c8f..7a1fc7e0620f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1641,6 +1641,37 @@ static int rproc_stop(struct rproc *rproc, bool
> crashed)
>  	return 0;
>  }
>=20
> +/*
> + * __rproc_detach(): Does the opposite of rproc_attach()  */ static int
> +__maybe_unused __rproc_detach(struct rproc *rproc) {
> +	struct device *dev =3D &rproc->dev;
> +	int ret;
> +
> +	/* No need to continue if a detach() operation has not been provided */
> +	if (!rproc->ops->detach)
> +		return -EINVAL;
> +
> +	/* Stop any subdevices for the remote processor */
> +	rproc_stop_subdevices(rproc, false);
> +
> +	/* Tell the remote processor the core isn't available anymore */
> +	ret =3D rproc->ops->detach(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't detach from rproc: %d\n", ret);
> +		rproc_start_subdevices(rproc);
> +		return ret;
> +	}
> +
> +	rproc_unprepare_subdevices(rproc);
> +
> +	rproc->state =3D RPROC_DETACHED;
> +
> +	dev_info(dev, "detached remote processor %s\n", rproc->name);
> +
> +	return 0;
> +}
>=20
>  /**
>   * rproc_trigger_recovery() - recover a remoteproc
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
