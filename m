Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0E9C4361B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 15:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F407823A5A
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 15:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733259AbgLIPAz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Dec 2020 10:00:55 -0500
Received: from mail-eopbgr50082.outbound.protection.outlook.com ([40.107.5.82]:25513
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733258AbgLIPAz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Dec 2020 10:00:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNuVSD63J4veIpLaTzfuRQzHgcaP0Hy1D2cC3W1mr+hqaTbMjNnCXPHhcKryE39vsN/G4/hEXGmYou/r0+ARJTG1k9TZ3Vnv6bqJwG7MjgNu4EgrqGeJD9U1vt9oOz84UQ2lez9naxCbk/xgGgNhbQXJTlvu8UYVz+vBpBtyXv1Q54fysa0+zBCruuKO+rpOrIW0/aqD0eqvj+KhIhVyDiQf+YSxdZmjh2/xtBSIrJOMRCGi6MiQ2vtABsxiu9jaApAHfJzNTGbZlQb/dp9/7KprTfEXUmtYn1uw/oigeqSWQ6tZQLkN/X2+AxWg2RN0D+yNk8tuUsb6FUcJ8/STsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yFx9Q/4ATpAz0A7RzwKlG6CjkETLgR95tG0zOs3kFg=;
 b=IgKtb1yKx7294kz+Z4zbL6RxNIQK9R4L9bhKwXO/Q5gePWMiMrtBnCaw0o4es+tqo1qn7bI3fCUCFHqooojaCiI2SqODp5+TQ9N2jfLEjl+bdpEjyu2Eic86ec+9CfzTuJfcJUJoihLv7Pgq0yc0hcn55+6y/UoTD+1e0ymw31859AUzwzTWN5IRMSLj8MQv17FZw6Q07Y25XnI1sklfKzYSLlarElbHqF/UCsjXq65W/nhUEqD0WN9lOKzxRkzjuhwIBDpPE2HYVPJCmVKBX9zG30dyGNGhTVP2IZcCfuvuSzq5ZzqZRJNXr+Y1AGfoXIjh8orn0Nr/le0ygww/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yFx9Q/4ATpAz0A7RzwKlG6CjkETLgR95tG0zOs3kFg=;
 b=TOcEfQBGD3dG2UvMiN+kN6/M9K4MmxT9VZjMcKlQ3szTIs/5yeJcz3vA+EMQlLUCdYXDv9cuI8rKiJPjJSgKCz+aGg3VAMfQ4Nk2K9dJXsl4XAFmjoD7lhBn9rlXSdleXbhY0RVDu8W+oRTO/+2aQt3PIxsiTlRNjhzUsiRJ4+w=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Wed, 9 Dec
 2020 15:00:02 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.024; Wed, 9 Dec 2020
 15:00:02 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH V3 1/7] remoteproc: elf: support platform specific memory
 hook
Thread-Topic: [PATCH V3 1/7] remoteproc: elf: support platform specific memory
 hook
Thread-Index: AQHWygzgCpXjE6CrJEiplG2nzloV+anno8iAgANDaRCAA/w2oA==
Date:   Wed, 9 Dec 2020 15:00:02 +0000
Message-ID: <DB6PR0402MB27602A953194DBE2CE96D54388CC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
 <20201204074036.23870-2-peng.fan@oss.nxp.com> <X8rRedNHet9gm5lJ@builder.lan>
 <DB6PR0402MB276056A300BD72EA59FC429488CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB276056A300BD72EA59FC429488CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d19feef8-b321-42c0-6940-08d89c531b43
x-ms-traffictypediagnostic: DB8PR04MB6857:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB68570402483639F2B0EE88E788CC0@DB8PR04MB6857.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOEcbvLnBXxcXXu7N/C8CduIuy30BEk34EJiM9ws+k+J76Uq3QfIAxa8+W/18FEf4BdpkubUGPWPnMxyaWt1ROIGywEoF3ZWUYQCOy1ysmbGsd+0q0eXLFtIAD704T7u3zpXltl1KLq+EmlAsyQK66O5uaXaoIXpHPizW0Z/yiKekdVhbAZR3MR9CxkckLZDUPhrANA9TKCIkF4xnmnBkuGhNz4CA3uSPZ608w/g2cKQlrlXNJysHLjNFppEls73FNEEfkbF03b/K0LeV4YmreIuA4H6W9Cuo7ZZ1YUCn4+sPiJcB+8GrmZ4fWioMZfV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(44832011)(66946007)(8936002)(71200400001)(83380400001)(33656002)(6506007)(508600001)(2906002)(76116006)(186003)(110136005)(66446008)(66556008)(55016002)(26005)(7696005)(66476007)(8676002)(4326008)(52536014)(54906003)(9686003)(7416002)(86362001)(5660300002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XMmo//MjAZIGCEOEm4yU6OeD4DHmYriOZEKXmS6kgloNB/Q6wGtsyUyxE/yL?=
 =?us-ascii?Q?njuTIgNmYTvvrFwnn7hEdMtWFhKBCAVVRsYdVdEp85OBMs8Bytbt4OChYbl1?=
 =?us-ascii?Q?/1bcwQQU4MBRSeRtaa9h+uRaABOwC72LEFbqo3eOaMgYCKHzEL5edZb3WXpK?=
 =?us-ascii?Q?O9Kqud7A0HaYCW1sU6mLih6MIvnc2ByBZeMYPwwPtP+XjAIviZH2iU1XV4t5?=
 =?us-ascii?Q?cSU9gDENZ1nDgYVu5EFdSU9YPfoEdbSW39MNLZIes3MwNWOan9qywX2Ciz5e?=
 =?us-ascii?Q?4Yi9aWelsExqyMO9Ev1ahElqldDorif2jbd0ynS+lMZxYhG9v/AKYXVhwAM4?=
 =?us-ascii?Q?SXyZ0htXzmC9DpDXEFiHcNtIPajYITbXjCESdzq07vh2xSWBgAPnqKV1iFWT?=
 =?us-ascii?Q?9XGq+S6R/iV0ZJ6kFiHToAGkXFvAF4XIM9xYkDMwAiyFuKKR6JsMxGHbh4XR?=
 =?us-ascii?Q?JlCm5lfj1m289f/JMB/kZYaYQP+PVKEJrB8kDTyyICNSU+28AIVexy8vId2O?=
 =?us-ascii?Q?IkaeMsFrBY1TUxsXRUD6fT4T8gqocUgt7HpPV5ysCpKM0Ly8ShR6pjEsT0Go?=
 =?us-ascii?Q?q8Y4xTMz8OR4N/z+K+xsPldtbgcQXvu/6RPnDeyb6Rp7kWSQZ4iujbbMabwm?=
 =?us-ascii?Q?B0JLPi+TuR7TTz5ks7iz/lA2IEgMs4GHvggC6X9+vUNWZfrGV1mY3t5Vbod0?=
 =?us-ascii?Q?hrxGuC+5Voz4d/uhn/J2mS094qDNTocjSnAYf2LE9aoPebPNOPvzgu24Yera?=
 =?us-ascii?Q?8kjlMi0NtbE/FH5DwPbzTzCS7SjyC6STSXzOa40DBu3BCd+csK6icdc4nKkb?=
 =?us-ascii?Q?gNIMYinAaHvo6wHcz6V8wAZVNjqfxsATXb7VEQXPBU21kC6fd3H3UAgpISRR?=
 =?us-ascii?Q?MaMkqNiNELakJ1o21tv6+KdiDJBfz0ePE6Chod4vFd8f7UReC5pM+dUqqMQb?=
 =?us-ascii?Q?hPPdlGsrtrVDy1N90ead8sfDM/123b+YJQ6so7/6xxg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19feef8-b321-42c0-6940-08d89c531b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 15:00:02.5017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ViW1cqOxuFDeEWAXsRn+OrTq4Py7JcxZ5mJ9b4mRb8sLupAX5SSaieuQG2zEMOIu/39TEGnPc+1J9j+dU27eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: RE: [PATCH V3 1/7] remoteproc: elf: support platform specific
> memory hook
>=20
> Hi Bjorn,
>=20
> > Subject: Re: [PATCH V3 1/7] remoteproc: elf: support platform specific
> > memory hook
> >
> > On Fri 04 Dec 01:40 CST 2020, Peng Fan (OSS) wrote:
> >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > To arm64, "dc      zva, dst" is used in memset.
> > > Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> > >
> > > "If the memory region being zeroed is any type of Device memory,
> > > this instruction can give an alignment fault which is prioritized in
> > > the same way as other alignment faults that are determined by the
> > > memory type."
> > >
> > > On i.MX platforms, when elf is loaded to onchip TCM area, the region
> > > is ioremapped, so "dc zva, dst" will trigger abort. And ioremap_wc()
> > > on i.MX not able to write correct data to TCM area.
> > >
> > > So we need to use io helpers, and extend the elf loader to support
> > > platform specific memory functions.
> > >
> > > Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_elf_loader.c | 20
> > ++++++++++++++++++--
> > >  include/linux/remoteproc.h                 |  4 ++++
> > >  2 files changed, 22 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > > b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index df68d87752e4..6cb71fe47261 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -129,6 +129,22 @@ u64 rproc_elf_get_boot_addr(struct rproc
> > > *rproc, const struct firmware *fw)  }
> > EXPORT_SYMBOL(rproc_elf_get_boot_addr);
> > >
> > > +static void rproc_elf_memcpy(struct rproc *rproc, void *dest, const
> > > +void *src, size_t count) {
> > > +	if (!rproc->ops->elf_memcpy)
> > > +		memcpy(dest, src, count);
> > > +
> > > +	rproc->ops->elf_memcpy(rproc, dest, src, count);
> >
> > Looking at the current set of remoteproc drivers I get a feeling that
> > we'll end up with a while bunch of functions that all just wraps
> > memcpy_toio(). And the reason for this is that we are we're "abusing"
> > the carveout to carry the __iomem pointer without keeping track of it.
> >
> > And this is not the only time we're supposed to use an io-accessor,
> > another example is rproc_copy_segment() in rproc_coredump.c
> >
> > It also means that if a platform driver for some reason where to
> > support both ioremap and normal carveouts the elf_memcpy op would be
> quite quirky.
> >
> >
> > So I would prefer if we track the knowledge about void *va being a
> > __iomem or not in the struct rproc_mem_entry and make rproc_da_to_va()
> > return this information as well.
> >
> > Then instead of extending the ops we can make this simply call memcpy
> > or
> > memcpy_toio() depending on this.
>=20
> A draft proposal as below, are you ok with the approach?

Mathieu, do you have any comments?

Thanks,
Peng.

>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 46c2937ebea9..bbb6e0613c1b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -189,13 +189,13 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>   * here the output of the DMA API for the carveouts, which should be mor=
e
>   * correct.
>   */
> -void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
> +void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
> +*iomem)
>  {
>         struct rproc_mem_entry *carveout;
>         void *ptr =3D NULL;
>=20
>         if (rproc->ops->da_to_va) {
> -               ptr =3D rproc->ops->da_to_va(rproc, da, len);
> +               ptr =3D rproc->ops->da_to_va(rproc, da, len, iomem);
>                 if (ptr)
>                         goto out;
>         }
> @@ -217,6 +217,9 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da,
> size_t len)
>=20
>                 ptr =3D carveout->va + offset;
>=20
> +               if (iomem)
> +                       iomem =3D carveout->iomem;
> +
>                 break;
>         }
>=20
> diff --git a/drivers/remoteproc/remoteproc_coredump.c
> b/drivers/remoteproc/remoteproc_coredump.c
> index 34530dc20cb4..5ff9389e6319 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -153,18 +153,22 @@ static void rproc_copy_segment(struct rproc *rproc,
> void *dest,
>                                size_t offset, size_t size)  {
>         void *ptr;
> +       bool iomem;
>=20
>         if (segment->dump) {
>                 segment->dump(rproc, segment, dest, offset, size);
>         } else {
> -               ptr =3D rproc_da_to_va(rproc, segment->da + offset, size)=
;
> +               ptr =3D rproc_da_to_va(rproc, segment->da + offset, size,
> + &iomem);
>                 if (!ptr) {
>                         dev_err(&rproc->dev,
>                                 "invalid copy request for
> segment %pad with offset %zu and size %zu)\n",
>                                 &segment->da, offset, size);
>                         memset(dest, 0xff, size);
>                 } else {
> -                       memcpy(dest, ptr, size);
> +                       if (iomem)
> +                               memcpy_fromio(dest, ptr, size);
> +                       else
> +                               memcpy(dest, ptr, size);
>                 }
>         }
>  }
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> b/drivers/remoteproc/remoteproc_elf_loader.c
> index df68d87752e4..20538143249e 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -175,6 +175,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
>                 u64 offset =3D elf_phdr_get_p_offset(class, phdr);
>                 u32 type =3D elf_phdr_get_p_type(class, phdr);
>                 void *ptr;
> +               bool iomem;
>=20
>                 if (type !=3D PT_LOAD)
>                         continue;
> @@ -204,7 +205,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
>                 }
>=20
>                 /* grab the kernel address for this device address */
> -               ptr =3D rproc_da_to_va(rproc, da, memsz);
> +               ptr =3D rproc_da_to_va(rproc, da, memsz, &iomem);
>                 if (!ptr) {
>                         dev_err(dev, "bad phdr da 0x%llx mem
> 0x%llx\n", da,
>                                 memsz);
> @@ -213,8 +214,12 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
>                 }
>=20
>                 /* put the segment where the remote processor expects
> it */
> -               if (filesz)
> -                       memcpy(ptr, elf_data + offset, filesz);
> +               if (filesz) {
> +                       if (iomem)
> +                               memcpy_fromio(ptr, elf_data + offset,
> filesz);
> +                       else
> +                               memcpy(ptr, elf_data + offset, filesz);
> +               }
>=20
>                 /*
>                  * Zero out remaining memory for this segment.
> @@ -223,8 +228,12 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
>                  * did this for us. albeit harmless, we may consider
> removing
>                  * this.
>                  */
> -               if (memsz > filesz)
> -                       memset(ptr + filesz, 0, memsz - filesz);
> +               if (memsz > filesz) {
> +                       if (iomem)
> +                               memset_toio(ptr + filesz, 0, memsz -
> filesz);
> +                       else
> +                               memset(ptr + filesz, 0, memsz -
> filesz);
> +               }
>         }
>=20
>         return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h inde=
x
> e8ac041c64d9..01bb9fa12784 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -329,6 +329,7 @@ struct rproc;
>   */
>  struct rproc_mem_entry {
>         void *va;
> +       bool iomem;
>         dma_addr_t dma;
>         size_t len;
>         u32 da;
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h index
> d6473a72a336..dfa0bd7812a5 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -194,7 +194,7 @@ copy_from_user(void *to, const void __user *from,
> unsigned long n)  }
>=20
>  static __always_inline unsigned long __must_check -copy_to_user(void
> __user *to, const void *from, unsigned long n)
> +copy_to_user(void __user *to, const void *_toiofrom, unsigned long n)
>  {
>         if (likely(check_copy_size(from, n, true)))
>                 n =3D _copy_to_user(to, from, n);
>=20
> Thanks,
> Peng.
>=20
> >
> > Regards,
> > Bjorn
> >
> > > +}
> > > +
> > > +static void rproc_elf_memset(struct rproc *rproc, void *s, int c,
> > > +size_t count) {
> > > +	if (!rproc->ops->elf_memset)
> > > +		memset(s, c, count);
> > > +
> > > +	rproc->ops->elf_memset(rproc, s, c, count); }
> > > +
> > >  /**
> > >   * rproc_elf_load_segments() - load firmware segments to memory
> > >   * @rproc: remote processor which will be booted using these fw
> > > segments @@ -214,7 +230,7 @@ int rproc_elf_load_segments(struct
> > > rproc *rproc, const struct firmware *fw)
> > >
> > >  		/* put the segment where the remote processor expects it */
> > >  		if (filesz)
> > > -			memcpy(ptr, elf_data + offset, filesz);
> > > +			rproc_elf_memcpy(rproc, ptr, elf_data + offset, filesz);
> > >
> > >  		/*
> > >  		 * Zero out remaining memory for this segment.
> > > @@ -224,7 +240,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
> > const struct firmware *fw)
> > >  		 * this.
> > >  		 */
> > >  		if (memsz > filesz)
> > > -			memset(ptr + filesz, 0, memsz - filesz);
> > > +			rproc_elf_memset(rproc, ptr + filesz, 0, memsz - filesz);
> > >  	}
> > >
> > >  	return ret;
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index e8ac041c64d9..06c52f88a3fd 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -373,6 +373,8 @@ enum rsc_handling_status {
> > >   *			expects to find it
> > >   * @sanity_check:	sanity check the fw image
> > >   * @get_boot_addr:	get boot address to entry point specified in
> > firmware
> > > + * @elf_memcpy:		platform specific elf loader memcpy
> > > + * @elf_memset:		platform specific elf loader memset
> > >   * @panic:	optional callback to react to system panic, core will del=
ay
> > >   *		panic at least the returned number of milliseconds
> > >   */
> > > @@ -392,6 +394,8 @@ struct rproc_ops {
> > >  	int (*load)(struct rproc *rproc, const struct firmware *fw);
> > >  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw)=
;
> > >  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware
> > > *fw);
> > > +	void (*elf_memcpy)(struct rproc *rproc, void *dest, const void
> > > +*src,
> > size_t count);
> > > +	void (*elf_memset)(struct rproc *rproc, void *s, int c, size_t
> > > +count);
> > >  	unsigned long (*panic)(struct rproc *rproc);  };
> > >
> > > --
> > > 2.28.0
> > >
