Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42694C4361B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 02:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECBD522C9E
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 02:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgLGCIu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 6 Dec 2020 21:08:50 -0500
Received: from mail-eopbgr140040.outbound.protection.outlook.com ([40.107.14.40]:35906
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726400AbgLGCIu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 6 Dec 2020 21:08:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCkAv/nZItMP2ONUTdP3gSPBEFBZol1INYUae7s3jEyxsryt68SvwEQ272zvh0Fx4ySiSjxXfmIWdCFWY/PNyFuF+p/6aT+VZxqoECyDhJL/ivXzxDjmQBJzDnAo0H/3LFTvGAIbuFoWgUE5lx5q9nwEG+teieTt6YeTFn6uVhNuggd9PAmQAOBuYgCnVTpC5EhVMRng5Alh6Jy5ZvtYcR9Mi/ojKT9EFoqc8k7qCXr4M1Iafq14RRrA59SOKaf+YdlWEsW/1Fs/sBmtQWfmTLDMtMNbEUnB8VIcRqXqhY1Qw2dt21kaV3dzF6uL1s9gFy6/rKsr3ILusNzeckaIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yXibgIwLbBPA59C4z0TrpwALwK18Tt/m/ZDD33jPOU=;
 b=G9wLyuoT7uDvZmM9DIzyOoQGVS29ds/A4v6dpnuh7Tbvhr4xQpbuHiBdCJ9SE3xhXhfc5mf+tCl4pwX2HE++0kmc0iqVryRwi0iO4s/XJDFaPDP8MoZlyzxRgOVcpmmvbovOGJEYpTAO5wczfSrFZr2VvCxNJnZFmpqMl/DeDj9wIL/OFiBuhwsF+W67MAZ1Ji5lFH77FhtOghoRXPfILLwQ/0iWLQs4oObnP/NFaeTQ2v4k0nroXPb/WB9yAVlYdrT9zOYOQSRU4s67flO+vG9hmyNqilnxwbN6g/5o3fJeAek8wl5lf3tBJHfEiVNElPUQnwi5tMxmhf8EebH5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yXibgIwLbBPA59C4z0TrpwALwK18Tt/m/ZDD33jPOU=;
 b=I+IdQ26U/kNTWEHJxNBx6Q4glZ3QJA6WLELjcoLz4F/7DTKyYADRPCc01Py/fL6PeDPxjuE5y8gCu2+H+jI2xwYJjAEMRepe5YyxhQnv3gAvCpZSICSLVhiSUqsmmyRlJn5rbXBtbOoF9+TV+VJCUXOf9wRqhVWWJRcUoV02B3s=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 7 Dec
 2020 02:07:57 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Mon, 7 Dec 2020
 02:07:57 +0000
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
Thread-Index: AQHWygzgCpXjE6CrJEiplG2nzloV+anno8iAgANDaRA=
Date:   Mon, 7 Dec 2020 02:07:57 +0000
Message-ID: <DB6PR0402MB276056A300BD72EA59FC429488CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
 <20201204074036.23870-2-peng.fan@oss.nxp.com> <X8rRedNHet9gm5lJ@builder.lan>
In-Reply-To: <X8rRedNHet9gm5lJ@builder.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 67590e74-89b4-4a30-19bd-08d89a54ea91
x-ms-traffictypediagnostic: DB7PR04MB4633:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB46332C836F621A984EB4A8D788CE0@DB7PR04MB4633.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f7Cdh9yVm00Te+eXAUV0n8bV6GD9d6ZC2CxltU3O40z9XDGU0Tci6XOetR+Ld7XLYYQtS5kbeTcwk8wCMP84LHlUHxxqepv4+KkB1wbMvXtX1x8pnVhwB2BV4Q9BU0cveDcb8VKCYLO3WcVayTrEGj35apgXSB/r8mt7+A4TG/k86tf2g6YwYRqGUMDN1fT45vNTe2UNd9FlaQimWWNWyAZiWjpNhb8iEjM8+wTooavRYkb3uZG6cNYB/P/bOKeykZrPvM+hF0pu9f9hJAZuV5UwLkpNc/bwQj7AhQcvqSD+MVw5hfjaOio7GsJEabnL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(64756008)(4326008)(66556008)(71200400001)(76116006)(66946007)(86362001)(8936002)(478600001)(55016002)(26005)(66476007)(83380400001)(52536014)(9686003)(5660300002)(2906002)(6506007)(7696005)(186003)(7416002)(110136005)(54906003)(33656002)(66446008)(8676002)(316002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9CKdH9FFlh+tUF7B6mJGWBd+Oelu1w0sNAogJiJSPXFADSX+vbGoruGyt80A?=
 =?us-ascii?Q?6qgHAZcDCVZBkWqKwkaE+W9RGclI61czczyF6Kn0zbKiL/dhIQlMPZBKR98P?=
 =?us-ascii?Q?CPEZNyBdVOiIsnujULvfVTqaYIUSzJUKNm6ksdKT0RfECA9JTRzL6MxNj0Rd?=
 =?us-ascii?Q?jy9+KpYCZ/Zq8WqcnhgBR6Rwrg9mUFOhhVxPWklmFeuK/TRcvWWwBtlYHI/M?=
 =?us-ascii?Q?Luu5UlnNvPqvkiNs+4rLlv2FC98SILxEegbqmj95Nj6/jQlVQHmTtBy0XpeE?=
 =?us-ascii?Q?6vbdFdfupME89UlgzKDN6RFnFm+S9aaV7BZ8zxqH7CDyCfMCoOA5qm7A+PLM?=
 =?us-ascii?Q?aAmV5CutOodfC10w+jQGUUV3mFyJduJo4E6iTKi/mDghYj3lQJ/9lCCUftQn?=
 =?us-ascii?Q?PUQn/D5UKz92AH/u/wotkbQbvN5XmdUDZ4Z6VfqS2MTrn0O8G/2HUOTUU7As?=
 =?us-ascii?Q?RufALZf6Tmt3QKSSqaT9hL2LuucFFs9sPWdgrCt/5ETjc1oZ9GlkGLbLwrqY?=
 =?us-ascii?Q?kR9914pAfY1jhjINirsAUvMPTJGM7yCmeFBoimhn5RbUDM8dPoD5uDxj7TF7?=
 =?us-ascii?Q?OGyx4/y305BXYkvLt2vPNJJjOOuqZWdWm0YUjT0CRvgLaHtpzyyF+blM3O03?=
 =?us-ascii?Q?a8tCh7GVchka1q5QNzjoJXIswYUhbyaDoMaZlbBuVIlA4OTzZJKmYoq1yJkD?=
 =?us-ascii?Q?ritoE4BqjL4lcjswF9D7vE8bZePynsDDrZAyWIaSJx/E91zC42JSOoaJy1p7?=
 =?us-ascii?Q?gCRZU8zIk/cOEiKBG2g8wANl2CtlRXJ117gkuf1TdCjlEKyEwcHHzUO7qDJ9?=
 =?us-ascii?Q?UvUpiTXB67IP0iKBnasTlXQtkyF44AA+SsTVbGIE2J13A/vyTELxj7XXsXE7?=
 =?us-ascii?Q?QIKVxFY6om/dUCR+p9a/Tft9CWWtBq5WcbNiAzWtdMOneaKJg+LE4y4sU0nt?=
 =?us-ascii?Q?ZILjpLr1rJtbajNwXSQNkojajcVPv1Y1kABgsS10mo8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67590e74-89b4-4a30-19bd-08d89a54ea91
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 02:07:57.5353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NBl2HdlS2UQDGRNXR3XqmMXBNtG0502gP9nmI0VMaGQoaGsmTYzDlfHzybnIJQrNM0HY+lLumuYyjcbNdPXcLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

> Subject: Re: [PATCH V3 1/7] remoteproc: elf: support platform specific
> memory hook
>=20
> On Fri 04 Dec 01:40 CST 2020, Peng Fan (OSS) wrote:
>=20
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > To arm64, "dc      zva, dst" is used in memset.
> > Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> >
> > "If the memory region being zeroed is any type of Device memory, this
> > instruction can give an alignment fault which is prioritized in the
> > same way as other alignment faults that are determined by the memory
> > type."
> >
> > On i.MX platforms, when elf is loaded to onchip TCM area, the region
> > is ioremapped, so "dc zva, dst" will trigger abort. And ioremap_wc()
> > on i.MX not able to write correct data to TCM area.
> >
> > So we need to use io helpers, and extend the elf loader to support
> > platform specific memory functions.
> >
> > Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_elf_loader.c | 20
> ++++++++++++++++++--
> >  include/linux/remoteproc.h                 |  4 ++++
> >  2 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > b/drivers/remoteproc/remoteproc_elf_loader.c
> > index df68d87752e4..6cb71fe47261 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -129,6 +129,22 @@ u64 rproc_elf_get_boot_addr(struct rproc *rproc,
> > const struct firmware *fw)  }
> EXPORT_SYMBOL(rproc_elf_get_boot_addr);
> >
> > +static void rproc_elf_memcpy(struct rproc *rproc, void *dest, const
> > +void *src, size_t count) {
> > +	if (!rproc->ops->elf_memcpy)
> > +		memcpy(dest, src, count);
> > +
> > +	rproc->ops->elf_memcpy(rproc, dest, src, count);
>=20
> Looking at the current set of remoteproc drivers I get a feeling that we'=
ll end
> up with a while bunch of functions that all just wraps memcpy_toio(). And=
 the
> reason for this is that we are we're "abusing" the carveout to carry the
> __iomem pointer without keeping track of it.
>=20
> And this is not the only time we're supposed to use an io-accessor, anoth=
er
> example is rproc_copy_segment() in rproc_coredump.c
>=20
> It also means that if a platform driver for some reason where to support =
both
> ioremap and normal carveouts the elf_memcpy op would be quite quirky.
>=20
>=20
> So I would prefer if we track the knowledge about void *va being a __iome=
m
> or not in the struct rproc_mem_entry and make rproc_da_to_va() return thi=
s
> information as well.
>=20
> Then instead of extending the ops we can make this simply call memcpy or
> memcpy_toio() depending on this.

A draft proposal as below, are you ok with the approach?

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remo=
teproc_core.c
index 46c2937ebea9..bbb6e0613c1b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -189,13 +189,13 @@ EXPORT_SYMBOL(rproc_va_to_pa);
  * here the output of the DMA API for the carveouts, which should be more
  * correct.
  */
-void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
+void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *iomem)
 {
        struct rproc_mem_entry *carveout;
        void *ptr =3D NULL;

        if (rproc->ops->da_to_va) {
-               ptr =3D rproc->ops->da_to_va(rproc, da, len);
+               ptr =3D rproc->ops->da_to_va(rproc, da, len, iomem);
                if (ptr)
                        goto out;
        }
@@ -217,6 +217,9 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_=
t len)

                ptr =3D carveout->va + offset;

+               if (iomem)
+                       iomem =3D carveout->iomem;
+
                break;
        }

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/=
remoteproc_coredump.c
index 34530dc20cb4..5ff9389e6319 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -153,18 +153,22 @@ static void rproc_copy_segment(struct rproc *rproc, v=
oid *dest,
                               size_t offset, size_t size)
 {
        void *ptr;
+       bool iomem;

        if (segment->dump) {
                segment->dump(rproc, segment, dest, offset, size);
        } else {
-               ptr =3D rproc_da_to_va(rproc, segment->da + offset, size);
+               ptr =3D rproc_da_to_va(rproc, segment->da + offset, size, &=
iomem);
                if (!ptr) {
                        dev_err(&rproc->dev,
                                "invalid copy request for segment %pad with=
 offset %zu and size %zu)\n",
                                &segment->da, offset, size);
                        memset(dest, 0xff, size);
                } else {
-                       memcpy(dest, ptr, size);
+                       if (iomem)
+                               memcpy_fromio(dest, ptr, size);
+                       else
+                               memcpy(dest, ptr, size);
                }
        }
 }
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remotepro=
c/remoteproc_elf_loader.c
index df68d87752e4..20538143249e 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -175,6 +175,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const =
struct firmware *fw)
                u64 offset =3D elf_phdr_get_p_offset(class, phdr);
                u32 type =3D elf_phdr_get_p_type(class, phdr);
                void *ptr;
+               bool iomem;

                if (type !=3D PT_LOAD)
                        continue;
@@ -204,7 +205,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const =
struct firmware *fw)
                }

                /* grab the kernel address for this device address */
-               ptr =3D rproc_da_to_va(rproc, da, memsz);
+               ptr =3D rproc_da_to_va(rproc, da, memsz, &iomem);
                if (!ptr) {
                        dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
                                memsz);
@@ -213,8 +214,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const=
 struct firmware *fw)
                }

                /* put the segment where the remote processor expects it */
-               if (filesz)
-                       memcpy(ptr, elf_data + offset, filesz);
+               if (filesz) {
+                       if (iomem)
+                               memcpy_fromio(ptr, elf_data + offset, files=
z);
+                       else
+                               memcpy(ptr, elf_data + offset, filesz);
+               }

                /*
                 * Zero out remaining memory for this segment.
@@ -223,8 +228,12 @@ int rproc_elf_load_segments(struct rproc *rproc, const=
 struct firmware *fw)
                 * did this for us. albeit harmless, we may consider removi=
ng
                 * this.
                 */
-               if (memsz > filesz)
-                       memset(ptr + filesz, 0, memsz - filesz);
+               if (memsz > filesz) {
+                       if (iomem)
+                               memset_toio(ptr + filesz, 0, memsz - filesz=
);
+                       else
+                               memset(ptr + filesz, 0, memsz - filesz);
+               }
        }

        return ret;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e8ac041c64d9..01bb9fa12784 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -329,6 +329,7 @@ struct rproc;
  */
 struct rproc_mem_entry {
        void *va;
+       bool iomem;
        dma_addr_t dma;
        size_t len;
        u32 da;
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index d6473a72a336..dfa0bd7812a5 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -194,7 +194,7 @@ copy_from_user(void *to, const void __user *from, unsig=
ned long n)
 }

 static __always_inline unsigned long __must_check
-copy_to_user(void __user *to, const void *from, unsigned long n)
+copy_to_user(void __user *to, const void *_toiofrom, unsigned long n)
 {
        if (likely(check_copy_size(from, n, true)))
                n =3D _copy_to_user(to, from, n);

Thanks,
Peng.

>=20
> Regards,
> Bjorn
>=20
> > +}
> > +
> > +static void rproc_elf_memset(struct rproc *rproc, void *s, int c,
> > +size_t count) {
> > +	if (!rproc->ops->elf_memset)
> > +		memset(s, c, count);
> > +
> > +	rproc->ops->elf_memset(rproc, s, c, count); }
> > +
> >  /**
> >   * rproc_elf_load_segments() - load firmware segments to memory
> >   * @rproc: remote processor which will be booted using these fw
> > segments @@ -214,7 +230,7 @@ int rproc_elf_load_segments(struct rproc
> > *rproc, const struct firmware *fw)
> >
> >  		/* put the segment where the remote processor expects it */
> >  		if (filesz)
> > -			memcpy(ptr, elf_data + offset, filesz);
> > +			rproc_elf_memcpy(rproc, ptr, elf_data + offset, filesz);
> >
> >  		/*
> >  		 * Zero out remaining memory for this segment.
> > @@ -224,7 +240,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
> >  		 * this.
> >  		 */
> >  		if (memsz > filesz)
> > -			memset(ptr + filesz, 0, memsz - filesz);
> > +			rproc_elf_memset(rproc, ptr + filesz, 0, memsz - filesz);
> >  	}
> >
> >  	return ret;
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index e8ac041c64d9..06c52f88a3fd 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -373,6 +373,8 @@ enum rsc_handling_status {
> >   *			expects to find it
> >   * @sanity_check:	sanity check the fw image
> >   * @get_boot_addr:	get boot address to entry point specified in
> firmware
> > + * @elf_memcpy:		platform specific elf loader memcpy
> > + * @elf_memset:		platform specific elf loader memset
> >   * @panic:	optional callback to react to system panic, core will delay
> >   *		panic at least the returned number of milliseconds
> >   */
> > @@ -392,6 +394,8 @@ struct rproc_ops {
> >  	int (*load)(struct rproc *rproc, const struct firmware *fw);
> >  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> >  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware
> > *fw);
> > +	void (*elf_memcpy)(struct rproc *rproc, void *dest, const void *src,
> size_t count);
> > +	void (*elf_memset)(struct rproc *rproc, void *s, int c, size_t
> > +count);
> >  	unsigned long (*panic)(struct rproc *rproc);  };
> >
> > --
> > 2.28.0
> >
