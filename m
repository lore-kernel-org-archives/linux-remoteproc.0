Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CD0C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 03:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B50B623AAC
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 03:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbhAOD3R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 22:29:17 -0500
Received: from mail-eopbgr40074.outbound.protection.outlook.com ([40.107.4.74]:8415
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732483AbhAOD3Q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 22:29:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7VNW0HTIlRRaUnum66SV1FP1//0uzSIxQtGnZ2Fwmi+BHO+LZoT9RPdkJaluVR5W1mn5RNSxpYvVJ39wRxfy1DrAMlGW2tQEgtqvtWp9EmiiJVhPdq1L9Azu11f4cF5CqdFwnYTAerMK3s+RYDzHgR0yn/6tlePogOANVukeqMC8yXDrUmepYmLDtRz+HTCgian7t8PHmEKhqzecOgB9AgEUI2RtdnTTezppZ5R92w/2Boqpd2YnlBsEldaGZKOMTcj7g1F6kMuyb8Op9qv/UI2qrSFQayxCUKpdPZNN2+cAs6k0dQijnYGuxqNJFo6nTpY1lR3GnG1GNt9KvvS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyKnZLsHQ9SMvk4MA/sxEr28E38xHlLBaZZrScAOz3k=;
 b=gZBSyiqr7dvT0qvTahY5LvZN1jp31zGRTvtb2Trqc4jVaLkTazA3AUxjxXiAzycsESIB/10y2lv7T2yj/kuZhQn8onXB0KrrgP6yRd77YxysrerUmuvrk8gxmuLk+NKnGJkCELGznwpki17xNVctSvLNl0MIfsFV6tJviupXtd4DjOTJ7S4xYbuSoZOSbbfyN8jXqtynSGijHsutS3P9DKxUGQ6UFLG2qJWtdnZIcAPa558N2lKApvEo4Qbe7BxuuDD6+4FShyazo6+yEYjgjwQC+IYE+QGm1YnNo/zc20r21t3mPvc6KCD+rk1S5khGBdfDKG+TJgQyhbOnfDiaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyKnZLsHQ9SMvk4MA/sxEr28E38xHlLBaZZrScAOz3k=;
 b=Dae6rgUP8XBE03Wl2dGJvd5UrvMXHz7xEykT4I70LPcEEG2weVh+uYCZ1XLkRTOd5qYx17qUJoL+a4SD7Jl9N6p/DIUDzkE7PiU1BWjI8sRIERpXPLMm0+A6OC3UUcKF1EcLixvCAksBpmPkPZKz0ZcqDenj5iCvN9UOfFS4Rck=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 03:28:23 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 03:28:23 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: RE: [PATCH V6 07/10] remoteproc: imx_rproc: add i.MX specific parse
 fw hook
Thread-Topic: [PATCH V6 07/10] remoteproc: imx_rproc: add i.MX specific parse
 fw hook
Thread-Index: AQHW6MhJLbEvONcdPEK39eatOPUGiqonqYMAgABhi4A=
Date:   Fri, 15 Jan 2021 03:28:23 +0000
Message-ID: <DB6PR0402MB27606EE494A3D8E08A2E719D88A70@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
 <1610444359-1857-8-git-send-email-peng.fan@nxp.com>
 <20210114213804.GE255481@xps15>
In-Reply-To: <20210114213804.GE255481@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a00e0437-854b-42fc-9e45-08d8b9059d67
x-ms-traffictypediagnostic: DB8PR04MB6618:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6618D4F1D8F3E41A623DEFF888A70@DB8PR04MB6618.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t2dEU+7/zh2XKbLMPPOrf5ZpOWpRNf39mp5IAOcXawyrYHrWJWuMes0odDpnaIJe4cYj4dm4qKOdhNndqxonLhQlWsHq98c3/5cNR7p+yHgBQoVioAbq0sHCgydk2+GJUjsr/jCFReO37CoRPoCAqAs/6gTznxYbX1XGQqMYJS/Us8ZJfz8Y1Q83Yer9Kf+rnSAOJPqcRjrqxKUGhChK0wu662BmPpryZZxfbVUMaqpiA1RuTS4FXBbWucHV6naK18F9yOACFLk9Wd5qb37UiGzHuMrGnMh8u7igqxSIVJ9lHuLRFQAR2Jiv8o5mXYBjgFsk8nCa/y94kFkBFEa7YN14OO7q21woq69vsYgBMFnTp79/nejKAcVguc87P0DL6lsPz45LMknqMi2QXMzqPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(33656002)(5660300002)(478600001)(55016002)(86362001)(83380400001)(54906003)(4326008)(9686003)(44832011)(316002)(6506007)(8676002)(26005)(52536014)(76116006)(186003)(66946007)(66446008)(64756008)(71200400001)(66556008)(66476007)(2906002)(8936002)(7416002)(6916009)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?i2Wgb1dxfhgU0uohDnVtvM2mhpY6MT9W2ZLeEKdSv3zsFbTGzQ4ZOBqpQyW6?=
 =?us-ascii?Q?Ia8Woox5lbok7bCRranpjL8sCOqazAzvF26Gc5Ogl6dAKaJBr4mZm/ru9y+P?=
 =?us-ascii?Q?NZpoC/N9XpNMDM2+DcQOK5sbb/9fZ9kg1RyYcBaF46FDmd8sZ5CPPHdt1oxI?=
 =?us-ascii?Q?2Z7o6UgcAwtu9asNCNDGdBcfkdIb+9a4Vn2V9dvXUvd5iaMCUu7buY2q1NxQ?=
 =?us-ascii?Q?Bm+9LzLp412fnF+s/21+1BPIIAgeI272eCiwS0JFlpGpdxmyGe995KIHEeYa?=
 =?us-ascii?Q?wuLdLHPj7/S0op3DyDvulOSi0zgsA6CFRpv9dFZQ478C/uBIWLnu6M5WoxId?=
 =?us-ascii?Q?952F4UraWZs5GXvunrqzr6gO+Q12mTgoEWIF/JWt+1iLlE/p7vbfWV7xJuXC?=
 =?us-ascii?Q?KYlA2JefLfvdsRds3v1wRolqg0a5Uw2isyyf+X42joXbJ4iNXnVJIhvbcDV/?=
 =?us-ascii?Q?IJCwiYUw84rq9UK2juTIh/zSSYpNAdKRTu4YIkdZFqq82Wj17cao3rt18aFo?=
 =?us-ascii?Q?JHfXsqpTaqgXMiB/yExsKPkesTpCULC5NwNmrdwCyrBebDboaZ6B/uEYDTSJ?=
 =?us-ascii?Q?lW+z0uloS9ue5mKLYD2dY8ue9TGjsgJCUdU9QYmFCV6TNvV6MwM9R0/ykKwm?=
 =?us-ascii?Q?+6CiPYWHxU8ViB1MX02xV3B1VlsqK7z8ZXBlvzdw1lT86Z3e8jT5T1j+Xhmz?=
 =?us-ascii?Q?4Q2W2fJ++Bgj7OlqZ+2kpFMDE2RJ+FkfrGhm4ZAnDms6MlPz1n2gHW8r+24q?=
 =?us-ascii?Q?IsdIJN2JloiPF2wEI/yJImkmIHeS2lTGFVkapynDfJtnkkOJEI405oP7OHrK?=
 =?us-ascii?Q?wKNY1KiovIlpgldC6OWq+Lp6nUyPnMmYJ4/oH5bB1IVDGY0t1ieugaYZmrrz?=
 =?us-ascii?Q?/sismdjkFMDk42z+2Y7uAX81C1gGvbHuI88zi3JNp+pS5eyyi7FyZ50CwBxr?=
 =?us-ascii?Q?2PlwDSZQcSwarUrZc0dskxqDz4/l0i6TaTM6JF8a29E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00e0437-854b-42fc-9e45-08d8b9059d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 03:28:23.8694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oK0MK8mnC4bVitGkNA4zOpNp3kNG5HKUFGZXi++KdDDfxtCgSipse6V9o9BaKm450+CiK+ylBK8BZrhl1jZV4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V6 07/10] remoteproc: imx_rproc: add i.MX specific
> parse fw hook
>=20
> On Tue, Jan 12, 2021 at 05:39:16PM +0800, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The hook is used to parse memory-regions and load resource table from
> > the address the remote processor published.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 93
> > ++++++++++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index 47fc1d06be6a..3c0075dc1787
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> > +#include <linux/of_reserved_mem.h>
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > @@ -241,10 +242,102 @@ static void *imx_rproc_da_to_va(struct rproc
> *rproc, u64 da, size_t len, bool *i
> >  	return va;
> >  }
> >
> > +static int imx_rproc_mem_alloc(struct rproc *rproc,
> > +			       struct rproc_mem_entry *mem) {
> > +	struct device *dev =3D rproc->dev.parent;
> > +	void *va;
> > +
> > +	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> > +	va =3D ioremap_wc(mem->dma, mem->len);
> > +	if (IS_ERR_OR_NULL(va)) {
> > +		dev_err(dev, "Unable to map memory region: %p+%zx\n",
> > +			&mem->dma, mem->len);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* Update memory entry va */
> > +	mem->va =3D va;
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_rproc_mem_release(struct rproc *rproc,
> > +				 struct rproc_mem_entry *mem)
> > +{
> > +	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> > +	iounmap(mem->va);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_rproc_parse_memory_regions(struct rproc *rproc) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +	struct device_node *np =3D priv->dev->of_node;
> > +	struct of_phandle_iterator it;
> > +	struct rproc_mem_entry *mem;
> > +	struct reserved_mem *rmem;
> > +	u32 da;
> > +
> > +	/* Register associated reserved memory regions */
> > +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > +	while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > +		/*
> > +		 * Ignore the first memory region which will be used vdev buffer.
> > +		 * No need to do extra handlings, rproc_add_virtio_dev will handle
> it.
> > +		 */
> > +		if (!strcmp(it.node->name, "vdevbuffer"))
>=20
> Because you are doing a V8, please use "vdev0buffer" and make the change =
in
> the .yaml file.

V7, I have not post out V7 yet.

Seems I forgot the change this to vdev0buffer, I recalled you have same com=
ments
before.

Thanks,
Peng.

>=20
> > +			continue;
> > +
> > +		rmem =3D of_reserved_mem_lookup(it.node);
> > +		if (!rmem) {
> > +			dev_err(priv->dev, "unable to acquire memory-region\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		/* No need to translate pa to da, i.MX use same map */
> > +		da =3D rmem->base;
> > +
> > +		/* Register memory region */
> > +		mem =3D rproc_mem_entry_init(priv->dev, NULL,
> (dma_addr_t)rmem->base, rmem->size, da,
> > +					   imx_rproc_mem_alloc, imx_rproc_mem_release,
> > +					   it.node->name);
> > +
> > +		if (mem)
> > +			rproc_coredump_add_segment(rproc, da, rmem->size);
> > +		else
> > +			return -ENOMEM;
> > +
> > +		rproc_add_carveout(rproc, mem);
> > +	}
> > +
> > +	return  0;
> > +}
> > +
> > +static int imx_rproc_parse_fw(struct rproc *rproc, const struct
> > +firmware *fw) {
> > +	int ret =3D imx_rproc_parse_memory_regions(rproc);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D rproc_elf_load_rsc_table(rproc, fw);
> > +	if (ret)
> > +		dev_info(&rproc->dev, "No resource table in elf\n");
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct rproc_ops imx_rproc_ops =3D {
> >  	.start		=3D imx_rproc_start,
> >  	.stop		=3D imx_rproc_stop,
> >  	.da_to_va       =3D imx_rproc_da_to_va,
> > +	.load		=3D rproc_elf_load_segments,
> > +	.parse_fw	=3D imx_rproc_parse_fw,
> > +	.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > +	.sanity_check	=3D rproc_elf_sanity_check,
> > +	.get_boot_addr	=3D rproc_elf_get_boot_addr,
> >  };
> >
> >  static int imx_rproc_addr_init(struct imx_rproc *priv,
> > --
> > 2.28.0
> >
