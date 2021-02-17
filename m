Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3C3C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 19:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3448364E6C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 19:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhBQTRU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 14:17:20 -0500
Received: from mail-mw2nam10on2086.outbound.protection.outlook.com ([40.107.94.86]:53024
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229804AbhBQTRL (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 14:17:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JY1iFttVZLkj2dIo3GgwOCBzUuZWClHh0w3xg/IhtFSMUxokmBjB6+sIbJiE3XL9iMJj23tc1/OS28BXI9MoZp0NWGB1NIB2eJS9qt3WvPCPJ1wSLFuq/s6a/ISDq0vymMPVMepGLalnnLyELk+hgzdcBkw22QzVe4EpY0Z2ykBhikGjF0HKVkiL/2dX+a4T3hh+8B9mhsnlxuyWryCwJ8wIExP85OFqBhH58kxGoAInHXzhBwfFqGx/zVqmx2AEaWDznJCDxjSbwqkxgDqavAqAuthyVoimMAhcSN8kyXqoXcWWtuLQZ4lALRFGtsGsX6uhNIJT2IRztvijCqHGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ejuVGoISGgdz9+/RfW+VMs/Sj2BJq5ygGnrwc21qvA=;
 b=nMCvaCq33STTxJkwWc9MHhQgeeohdMqCmZcve55AO08IgzYkHJggTlEqSpT5KHW8DinZGuT27bXGU+JDhiumL5rqZPq97X/iffERztNEewHCb8FeDSa+UzrjJ7xHrnoaf/3XWpWzx/o7RJLH30BTKDGNXOZnz4+yPF0rkwP/BRhlBfMYTsslXMFGdekg/UuHyY7M0u1P0W6rH+4Sih2tToIrpbSDv3XXFTV43xBc6QaeWpXrwKo+9/3TFsThWMWHYWTXSc5mpxiqH07mx22fVHSEdgjy0O4t1lLUo8lFO8YgtSPVF6c1JODjNP3948zR0XNbeUKoeMUUB5oYeEWHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ejuVGoISGgdz9+/RfW+VMs/Sj2BJq5ygGnrwc21qvA=;
 b=VqNRBC0FZ2762vQweYkFmy6cAW2m3eyMLBXmQ+1lootoWlhfbYFpPUnAOrszqLDTY/Kn7AW9MmgTW/dvozj1j0tFiBtWACCeL5uRcCZiEn4eWgv9aMN3ey3ZcksXPSoz2763/1g2Mixfku80gb3vp/tMdOtenc8XlgIUp8FdeOM=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BYAPR02MB5989.namprd02.prod.outlook.com (2603:10b6:a03:121::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 19:11:37 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::2cf3:79d2:d169:7fdb]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::2cf3:79d2:d169:7fdb%3]) with mapi id 15.20.3846.039; Wed, 17 Feb 2021
 19:11:37 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH v25 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v25 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHW58BGoxDuFOl9FEONE+IE0NnO4KpbWQeAgAFudsCAACGlsA==
Date:   Wed, 17 Feb 2021 19:11:37 +0000
Message-ID: <BYAPR02MB44070DE0C6A8014D5442C566B5869@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20210111020250.6846-1-ben.levinsky@xilinx.com>
 <20210111020250.6846-6-ben.levinsky@xilinx.com>
 <20210216184807.GB2771622@xps15>
 <BYAPR02MB44076ACC6C565155018FA3E8B5869@BYAPR02MB4407.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB44076ACC6C565155018FA3E8B5869@BYAPR02MB4407.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [24.5.142.107]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 23bd21c3-bd8f-4039-6bc4-08d8d377d99d
x-ms-traffictypediagnostic: BYAPR02MB5989:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5989DC191436D79E969F801AB5869@BYAPR02MB5989.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OCC981mDbK9L2zeHyknD64jnTmLPtWs82bjXSAAUesIyKwXWaWalsU+itbaW5bNRONOKmqsOlHRUtMn7rEpw5FJ3FEakXHcnHFmz2ZZZm7y+MNAHb+gvY8veid8gsWCQfoGncVBShXXfIvG1k1aMCyS6P7QcE71s/Pa1YtCh7236f/gezOjKPEIPr2a055NoZc8d22CXKgHQM+qbrlvhNZ/2UHCtkV0ZpkM8cOvTzq8tlKp3veyEalT97d6OsrC9MxPTpyu0oRKsSvJydCWcmwfK3xMppmPY5EdgnUQbpyiF0yQVlKnp0LXDIjbobfLt74PPGL2Hz6bNUAwpa+GSdwbCbTWiiqEEtAGZTdZtLTBP9a4MFyhS6JLk/UaUkI8pJmfP2bc9r3Td+hGdz4iQin0v9DevEIuBYyDsE8G2qP5o1JrG0Wpir+mJfkPS9vkAIYfIBiO6e6LrB0x62T42eVVzGe0Q1YO2s27FGt0+pGLQRIG6mirJ6y2bCQ4cTMojOL8Yhl5jMWbfuAhLyXOXGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(316002)(9686003)(83380400001)(186003)(54906003)(8936002)(86362001)(478600001)(71200400001)(4326008)(107886003)(5660300002)(6916009)(2940100002)(30864003)(2906002)(66476007)(66556008)(33656002)(6506007)(26005)(53546011)(76116006)(66446008)(66946007)(7696005)(64756008)(55016002)(8676002)(52536014)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ntUDrxUMhfxhnG/QKOvGFuf6BkAOzHnRGVHROulJ7EFDy9s1you9WOMxz7BL?=
 =?us-ascii?Q?AcOPBL4c6pYUjobyagRz1cXb+d9nI36NpfRhRB1OXjQsKKa/SZ0yaiWaU5oe?=
 =?us-ascii?Q?vL9HGLSXYuiPg4xPBkMC/9jcD/q45b5ex5YV5Q1eE+IucTML6e0xsumZ/CTf?=
 =?us-ascii?Q?jOEMz515lgZ7AbbKivkAIMA3ZAKiNGq8iFhRMoa+KgKPr74n4wHrpe6XhdFr?=
 =?us-ascii?Q?jQPksB/Xl8qfmAJI0yDs1/uRJT7TOAxNXedGm1lqgnxrXPalr7bh1hPvNyLQ?=
 =?us-ascii?Q?NvvSCVlwzSBUM/evgOG5RA6ZMxd9y3wiVJ1ypdUT6oZOkH9elJnm8uhAmAEt?=
 =?us-ascii?Q?iF4BQq+m0kdEUZWvFZWk0KC01rZj5jAKbzDyxnNDho4+iRHYTWsls1uInsvW?=
 =?us-ascii?Q?hTATxOsrop06aqkmR7odAUaD8OFalJfFe2Z+cG8KTl/3XSG5VW3ZESTZSUI4?=
 =?us-ascii?Q?vt58/tPDqMKAbrSidsuXgepY3tvQ80e+Ry+ymr/P/SkQJ6UnkpSiT1xf8F5y?=
 =?us-ascii?Q?3Kr/B6y5UOu/0UX4Q8JK+mStp8r0dVpwgGcwUVuugMZ1tQSB0b8nnKYRAox2?=
 =?us-ascii?Q?tx4AKlbD7BuSJjgLtrfdwx7ucEKnKECh8k3E+yfDPdDsmZP+hANRJr/akgIK?=
 =?us-ascii?Q?jT+jR9WAZku41vCPTyB7WEAnCRXKJLhms+uBz5ffoGcTMinNpLv+AHomyqs4?=
 =?us-ascii?Q?cA76I+KEsX8SD1HDZdvfJFDG8U1YPJFXRcZQBWQwzT3/qNp7J4I/C/GJYOQ/?=
 =?us-ascii?Q?8IBFZytqzfg/vGzFSHEHA6RW/uOo+EozmJ1NPrMMrjDsU8IsBgA4DkMP7skQ?=
 =?us-ascii?Q?KhDxC01OrPPbCBzWR05sYrgaf7osv2/f/HlJuSdjdnx8t+dafm41nYvi6qSK?=
 =?us-ascii?Q?t1Kd+hLzVa/BabhfJzA65F9pZvmwLO/4AWNEtto5sU000+tZRXSuYr/FVerj?=
 =?us-ascii?Q?C42PGvpsmbDXet7cv7uyjvRl/QGW3GMYOOzw3+G9ta++TlHkFX/S79cJV9fw?=
 =?us-ascii?Q?9qdOjhK2o/h6HuuRMtZc+apiqLsjWkDs+vFNNgyQnqQbITXIQHzWy2qLIDiT?=
 =?us-ascii?Q?nki5BmefrpcUQNbWkEKCsZmHvw/1sxbGWmjod1HX5pjUKTdJI5QIp8eCmZPS?=
 =?us-ascii?Q?OWahu4Ppjmy8BKump7H1HO5iiDsz5RuiFT/zCLwElZ/xM8HebjKJleSe5n25?=
 =?us-ascii?Q?9IJfxxwSKu+YqVvMllusLyGwQYlYGPPzwtOqDm/+6WXTIpHFM/MYew605nFb?=
 =?us-ascii?Q?AiJbmZMbmiwc8wGL8GQxBZD7SB1uxdyYWwVyCIOQ5xPRFNpkHX7Ex5OMLxBz?=
 =?us-ascii?Q?TLY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bd21c3-bd8f-4039-6bc4-08d8d377d99d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2021 19:11:37.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKx41gJ8TsYX8dsJgKgRbGps3vNf7zzFmQup5e+AN8l/6y8qSxuqivEHmZ5dAS8yL8RNhhCmdC788cIg+YlPWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5989
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

I worked on this further and had 1 more comment on the prepare/unprepare fo=
r TCM banks below

> -----Original Message-----
> From: Ben Levinsky
> Sent: Wednesday, February 17, 2021 8:47 AM
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Michal Sime=
k
> <michals@xilinx.com>
> Subject: RE: [PATCH v25 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> Hi Mathieu,
>=20
> Please see my replies to your questions inline
>=20
> Again thanks for the continued review of this set
>=20
> Cheers
> Ben
>=20
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Tuesday, February 16, 2021 10:48 AM
> > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux=
-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Michal Si=
mek
> > <michals@xilinx.com>
> > Subject: Re: [PATCH v25 5/5] remoteproc: Add initial zynqmp R5 remotepr=
oc
> > driver
> >
> > On Sun, Jan 10, 2021 at 06:02:50PM -0800, Ben Levinsky wrote:
> > > R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> > > remotproc driver, we can boot the R5 sub-system in two different
> > > configurations -
> > > 	* Split
> > > 	* Lockstep
> > >
> > > The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilin=
x
> > > Platform Management Unit that handles the R5 configuration, memory
> > access
> > > and R5 lifecycle management. The interface to this manager is done in=
 this
> > > driver via zynqmp_pm_* function calls.
> > >
> > > Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> > > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > > Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
> > > Signed-off-by: Jason Wu <j.wu@xilinx.com>
> > > Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> > > ---
> > > v25:
> > > - reword error message for rpu configuration
> > > - change char name[15] to 16 chars to have null terminated string
> > >   in parse_mem_regions()
> > > - reword comments in tcm_mem_alloc
> > > - call xilinx platform cleanup in parse_tcm_banks() case of failure
> > > - check value of mbox_send_message in all instances within this drive=
r
> > > - indentation in zynqmp_r5_remoteproc driver
> > > - update style of constructing carveouts to match convention in ST
> > >   remoteproc drivers. No longer iterate through memory-region propert=
y
> > >   using of_count_phandle_with_args. Instead use of_phandle_iterator
> > > - use rproc_of_resm_mem_entry_init for vdev0buffer carveout as per
> > feedback
> > > - rework loop in zynqmp_r5_pm_request_sram as per feedback
> > > - fix comment and linebreak in tcm_mem_alloc description
> > > - add comments and remove extraneous devm_ioremap_wc call in
> > tcm_mem_alloc
> > > - in parse_tcm_banks remove check for bank not being available
> > > - rework order of locals and remove else in zynqmp_r5_rproc_kick
> > > - document and update logic for zynqmp_r5_parse_fw
> > > - add dev_dbg output in event_notified_idr_cb if
> > >   rproc_vq_interrupt(rproc, id) =3D=3D IRQ_NONE
> > > - add comment for handle_event_notified mbox_send_message function
> > call
> > > - add comment for zynqmp_r5_mb_rx_cb
> > > - update zynqmp_r5_setup_mbox to match convention of mbox setup in
> ST
> > >   remoteproc drivers
> > > - change return in zynqmp_r5_setup_mbox to use PTR_ERR
> > > - add zynqmp_r5_cleanup_mbox
> > > - in zynqmp_r5_probe, reteurn zynqmp_r5_rproc instead of taking in as
> arg.
> > > - in zynqmp_r5_probe use return of PTR_ERR and use
> > zynqmp_r5_cleanup_mbox
> > > - in zynqmp_r5_remoteproc_probe update use return value of
> > zynqmp_r5_probe as
> > >   either zynqmp_r5_rproc* or PTR_ERR
> > > - update loop that cleans up cluster and mboxes in
> > zynqmp_r5_remoteproc_probe
> > > - update loop that cleans up cluster and mboxes in
> > zynqmp_r5_remoteproc_remove
> > > ---
> > >  drivers/remoteproc/Kconfig                |   8 +
> > >  drivers/remoteproc/Makefile               |   1 +
> > >  drivers/remoteproc/zynqmp_r5_remoteproc.c | 898
> > ++++++++++++++++++++++
> > >  3 files changed, 907 insertions(+)
> > >  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> > >
> > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > > index c6659dfea7c7..c2fe54b1d94f 100644
> > > --- a/drivers/remoteproc/Kconfig
> > > +++ b/drivers/remoteproc/Kconfig
> > > @@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
> > >  	  It's safe to say N here if you're not interested in utilizing
> > >  	  the DSP slave processors.
> > >
> > > +config ZYNQMP_R5_REMOTEPROC
> > > +	tristate "ZynqMP R5 remoteproc support"
> > > +	depends on PM && ARCH_ZYNQMP
> > > +	select RPMSG_VIRTIO
> > > +	select ZYNQMP_IPI_MBOX
> > > +	help
> > > +	  Say y or m here to support ZynqMP R5 remote processors via the
> > remote
> > > +	  processor framework.
> > >  endif # REMOTEPROC
> > >
> > >  endmenu
> > > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefil=
e
> > > index 3dfa28e6c701..ef1abff654c2 100644
> > > --- a/drivers/remoteproc/Makefile
> > > +++ b/drivers/remoteproc/Makefile
> > > @@ -33,3 +33,4 @@ obj-$(CONFIG_ST_REMOTEPROC)		+=3D
> > st_remoteproc.o
> > >  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+=3D st_slim_rproc.o
> > >  obj-$(CONFIG_STM32_RPROC)		+=3D stm32_rproc.o
> > >  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+=3D ti_k3_dsp_remoteproc.o
> > > +obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+=3D zynqmp_r5_remoteproc.o
> > > diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > > new file mode 100644
> > > index 000000000000..9e228c9ecd43
> > > --- /dev/null
> > > +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > > @@ -0,0 +1,898 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Zynq R5 Remote Processor driver
> > > + *
> > > + * Based on origin OMAP and Zynq Remote Processor driver
> > > + *
> > > + */
> > > +
> > > +#include <linux/firmware/xlnx-zynqmp.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mailbox_client.h>
> > > +#include <linux/mailbox/zynqmp-ipi-message.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/of_reserved_mem.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/remoteproc.h>
> > > +#include <linux/skbuff.h>
> > > +#include <linux/sysfs.h>
> > > +
> > > +#include "remoteproc_internal.h"
> > > +
> > > +#define MAX_RPROCS	2 /* Support up to 2 RPU */
> > > +#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU
> memory
> > instance */
> > > +
> > > +#define BANK_LIST_PROP	"sram"
> > > +#define DDR_LIST_PROP	"memory-region"
> > > +
> > > +/* IPI buffer MAX length */
> > > +#define IPI_BUF_LEN_MAX	32U
> > > +/* RX mailbox client buffer max length */
> > > +#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
> > > +				 sizeof(struct zynqmp_ipi_message))
> > > +
> > > +/*
> > > + * Map each Xilinx on-chip SRAM  Bank address to their own respectiv=
e
> > > + * pm_node_id.
> > > + */
> > > +struct sram_addr_data {
> > > +	phys_addr_t addr;
> > > +	enum pm_node_id id;
> > > +};
> > > +
> > > +#define NUM_SRAMS 4U
> > > +static const struct sram_addr_data zynqmp_banks[NUM_SRAMS] =3D {
> > > +	{0xffe00000UL, NODE_TCM_0_A},
> > > +	{0xffe20000UL, NODE_TCM_0_B},
> > > +	{0xffe90000UL, NODE_TCM_1_A},
> > > +	{0xffeb0000UL, NODE_TCM_1_B},
> > > +};
> > > +
> > > +/**
> > > + * struct zynqmp_r5_rproc - ZynqMP R5 core structure
> > > + *
> > > + * @rx_mc_buf: rx mailbox client buffer to save the rx message
> > > + * @tx_mc: tx mailbox client
> > > + * @rx_mc: rx mailbox client
> > > + * @mbox_work: mbox_work for the RPU remoteproc
> > > + * @tx_mc_skbs: socket buffers for tx mailbox client
> > > + * @dev: device of RPU instance
> > > + * @rproc: rproc handle
> > > + * @tx_chan: tx mailbox channel
> > > + * @rx_chan: rx mailbox channel
> > > + * @pnode_id: RPU CPU power domain id
> > > + * @elem: linked list item
> > > + */
> > > +struct zynqmp_r5_rproc {
> > > +	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
> > > +	struct mbox_client tx_mc;
> > > +	struct mbox_client rx_mc;
> > > +	struct work_struct mbox_work;
> > > +	struct sk_buff_head tx_mc_skbs;
> > > +	struct device *dev;
> > > +	struct rproc *rproc;
> > > +	struct mbox_chan *tx_chan;
> > > +	struct mbox_chan *rx_chan;
> > > +	u32 pnode_id;
> > > +	struct list_head elem;
> > > +};
> > > +
> > > +/*
> > > + * r5_set_mode - set RPU operation mode
> > > + * @z_rproc: Remote processor private data
> > > + * @rpu_mode: mode specified by device tree to configure the RPU to
> > > + *
> > > + * set RPU operation mode
> > > + *
> > > + * Return: 0 for success, negative value for failure
> > > + */
> > > +static int r5_set_mode(struct zynqmp_r5_rproc *z_rproc,
> > > +		       enum rpu_oper_mode rpu_mode)
> > > +{
> > > +	enum rpu_tcm_comb tcm_mode;
> > > +	enum rpu_oper_mode cur_rpu_mode;
> > > +	int ret;
> > > +
> > > +	ret =3D zynqmp_pm_get_rpu_mode(z_rproc->pnode_id,
> > &cur_rpu_mode);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (rpu_mode !=3D cur_rpu_mode) {
> > > +		ret =3D zynqmp_pm_set_rpu_mode(z_rproc->pnode_id,
> > rpu_mode);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > > +
> > > +	tcm_mode =3D (rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP) ?
> > > +		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
> > > +	return zynqmp_pm_set_tcm_config(z_rproc->pnode_id, tcm_mode);
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_rproc_mem_release
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + * @mem: mem entry to unmap
> > > + *
> > > + * Unmap TCM banks when powering down R5 core.
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_ent=
ry
> > *mem)
> > > +{
> > > +	u32 pnode_id =3D (u64)mem->priv;
> > > +
> > > +	iounmap(mem->va);
> > > +	return zynqmp_pm_release_node(pnode_id);
> >
> > Is the opposite of that call zynqmp_pm_request_node()?  If so doing the
> > power up
> > and down of the TCM banks at driver probe() and remove() is highly
> > inefficient.
> > Consider using rproc_ops::prepare() and rproc_ops::unprepare().
> >
If I understand your comment correctly this is about handling the request_n=
ode() and release_node() calls. While its true that these two functions can=
 be moved to prepare and unprepared I think these are still occurring not a=
t probe nor remove.

For request_node() of the TCM bank this is occurring in parse_fw() in remot=
eproc_core as in the zynqmp_r5 driver shows below:

	.parse_fw	=3D zynqmp_r5_parse_fw,
	...
	Zynqmp_parse_fw calls parse_tcm_banks

	static int parse_tcm_banks(struct rproc *rproc){
		...
		ret =3D zynqmp_r5_pm_request_sram(rsc.start);
		...
 		mem =3D rproc_mem_entry_init(dev, NULL, rsc.start,
					   (size_t)size, rsc.start,
					   tcm_mem_alloc,
					   tcm_mem_release,
					   rsc.name);

For release_node() this is occurring not at remove but instead is managed b=
y remoteproc_core and tied to the lifecyle of the remoteproc carveout since=
 release_node() is within the function tcm_mem_release() and therefore rpro=
c_resource_cleanup() will end up triggering=20
TCM bank cleanup.


Still it is understandable to prefer prepare/unprepared to contain the 2 li=
nes.


If you still prefer prepare/unprepared is the following implementation ok?

prepare:=20
	Just move request_node() line here=09
unprepare:=20
	similarly this is only moving the 1 line of release_node().

If this suggestion satisfies what you are saying I will do so, otherwise pl=
ease correct my understanding


Cheers
Ben=20



> > > +}
> >
> > Please move this just after tcm_mem_alloc()
> >
> > > +
> > > +/*
> > > + * zynqmp_r5_rproc_start
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + *
> > > + * Start R5 Core from designated boot address.
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int zynqmp_r5_rproc_start(struct rproc *rproc)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > > +	enum rpu_boot_mem bootmem;
> > > +
> > > +	bootmem =3D (rproc->bootaddr & 0xF0000000) =3D=3D 0xF0000000 ?
> > > +		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> > > +
> > > +	dev_dbg(rproc->dev.parent, "RPU boot from %s.",
> > > +		bootmem =3D=3D PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> > > +
> > > +	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
> > > +				      bootmem,
> > ZYNQMP_PM_REQUEST_ACK_NO);
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_rproc_stop
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + *
> > > + * Power down  R5 Core.
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > > +
> > > +	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
> > > +				      ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_rproc_mem_alloc
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + * @mem: mem entry to map
> > > + *
> > > + * Callback to map va for memory-region's carveout.
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int zynqmp_r5_rproc_mem_alloc(struct rproc *rproc,
> > > +				     struct rproc_mem_entry *mem)
> > > +{
> > > +	void *va;
> > > +
> > > +	va =3D ioremap_wc(mem->dma, mem->len);
> > > +	if (IS_ERR_OR_NULL(va))
> > > +		return -ENOMEM;
> > > +
> > > +	mem->va =3D va;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_rproc_mem_release
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + * @mem: mem entry to unmap
> > > + *
> > > + * Unmap memory-region carveout
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
> > > +				       struct rproc_mem_entry *mem)
> > > +{
> > > +	iounmap(mem->va);
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * parse_mem_regions
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + *
> > > + * Construct rproc mem carveouts from carveout provided in
> > > + * memory-region property
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int parse_mem_regions(struct rproc *rproc)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > > +	struct device_node *np =3D z_rproc->dev->of_node;
> > > +	struct device *dev =3D &rproc->dev;
> > > +	struct of_phandle_iterator it;
> > > +	struct rproc_mem_entry *mem;
> > > +	struct reserved_mem *rmem;
> > > +	int index =3D 0;
> > > +
> > > +	/* Register associated reserved memory regions */
> > > +	of_phandle_iterator_init(&it, np, DDR_LIST_PROP, NULL, 0);
> > > +	while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > > +		rmem =3D of_reserved_mem_lookup(it.node);
> > > +		if (!rmem) {
> > > +			dev_err(dev, "unable to acquire %s\n",
> > DDR_LIST_PROP);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		if (strstr(it.node->name, "vdev0buffer")) {
> > > +			mem =3D rproc_of_resm_mem_entry_init(dev, index,
> > > +							   rmem->size,
> > > +							   rmem->base,
> > > +							   "vdev0buffer");
> > > +		} else {
> > > +			/*
> > > +			 * The ensuing carveout is either for vring, which has
> > > +			 * device tree node name of length 15 characters, or
> > > +			 * firmware mem, where name is not used by
> > remoteproc
> > > +			 *  core later on. So default to vring length of 15.
> >
> > s/"*  core"/"* core"
> >
> > > +			 *
> > > +			 * Extra char for null-terminated string.
> > > +			 */
> > > +			char name[16];
> > > +
> > > +			if (strstr(it.node->name, "vdev0vring")) {
> > > +				int vring_id;
> > > +
> > > +				/*
> > > +				 * Expect "rpuXvdev0vringX" as documented
> > > +				 * in xilinx remoteproc device tree binding
> > > +				 */
> > > +				if (strlen(it.node->name) < 15) {
> > > +					dev_err(dev, "%pOF is less than 15
> > chars",
> > > +						it.node);
> > > +					return -EINVAL;
> > > +				}
> > > +
> > > +				/*
> > > +				 * can be 1 of multiple vring IDs per IPC
> > channel
> > > +				 * e.g. 'vdev0vring0' and 'vdev0vring1'
> > > +				 *
> > > +				 * Here get vring ID from 15th char
> > > +				 */
> > > +				vring_id =3D it.node->name[14] - '0';
> > > +				snprintf(name, sizeof(name), "vdev0vring%d",
> > vring_id);
> >
> > Function strstr() returns a pointer to the beginning of the string bein=
g
> > searched for.  As such you should be able to do something like:
> >
> >                         name =3D strstr(it.node->name, "vdev0vring");
> >                         if (name) {
> >                                 ...
> >
> > and simply use @name when calling rproc_mem_entry_init().
> >
> > > +			} else {
> > > +				strncpy(name, it.node->name, 16);
> > > +			}
> > > +
> > > +			mem =3D rproc_mem_entry_init(dev, NULL,
> > > +						   (dma_addr_t)rmem->base,
> > > +						   rmem->size, rmem->base,
> > > +
> > zynqmp_r5_rproc_mem_alloc,
> > > +
> > zynqmp_r5_rproc_mem_release,
> > > +						   name);
> > > +		}
> > > +
> > > +		if (!mem)
> > > +			return -ENOMEM;
> > > +
> > > +		rproc_add_carveout(rproc, mem);
> > > +		index++;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_pm_request_tcm
> > > + * @addr: base address of mem provided in R5 core's sram property.
> > > + *
> > > + * Given sram base address, determine its corresponding Xilinx
> > > + * Platform Management ID and then request access to this node
> > > + * so that it can be power up.
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int zynqmp_r5_pm_request_sram(phys_addr_t addr)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < NUM_SRAMS; i++) {
> > > +		if (zynqmp_banks[i].addr !=3D addr)
> > > +			continue;
> > > +
> > > +		return zynqmp_pm_request_node(zynqmp_banks[i].id,
> > > +					      ZYNQMP_PM_CAPABILITY_ACCESS,
> > 0,
> > > +
> > ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > > +	}
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +/*
> > > + * tcm_mem_alloc
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + * @mem: mem entry to initialize the va and da fields of
> > > + *
> > > + * Given TCM bank entry, this callback will set device address for R=
5
> > > + * running on TCM and also setup virtual address for TCM bank
> > > + * remoteproc carveout.
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int tcm_mem_alloc(struct rproc *rproc,
> > > +			 struct rproc_mem_entry *mem)
> > > +{
> > > +	void *va;
> > > +	struct device *dev =3D rproc->dev.parent;
> > > +
> > > +	va =3D ioremap_wc(mem->dma, mem->len);
> > > +	if (IS_ERR_OR_NULL(va))
> > > +		return -ENOMEM;
> > > +
> > > +	/* Update memory entry va */
> > > +	mem->va =3D va;
> > > +
> > > +	/*
> > > +	 * The R5s expect their TCM banks to be at address 0x0 and 0x2000,
> > > +	 * while on the Linux side they are at 0xffexxxxx.
> > > +	 *
> > > +	 * Zero out the high 12 bits of the address. This will give
> > > +	 * expected values for TCM Banks 0A and 0B (0x0 and 0x20000).
> > > +	 */
> > > +	mem->da &=3D 0x000fffff;
> > > +
> > > +	/*
> > > +	 * TCM Banks 1A and 1B still have to be translated.
> > > +	 *
> > > +	 * Below handle these two banks' absolute addresses (0xffe90000 and
> > > +	 * 0xffeb0000) and convert to the expected relative addresses
> > > +	 * (0x0 and 0x20000).
> > > +	 */
> > > +	if (mem->da =3D=3D 0x90000 || mem->da =3D=3D 0xB0000)
> > > +		mem->da -=3D 0x90000;
> > > +
> > > +	/* if translated TCM bank address is not valid report error */
> > > +	if (mem->da !=3D 0x0 && mem->da !=3D 0x20000) {
> > > +		dev_err(dev, "invalid TCM bank address: %x\n", mem->da);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * parse_tcm_banks()
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + *
> > > + * Given R5 node in remoteproc instance
> > > + * allocate remoteproc carveout for TCM memory
> > > + * needed for firmware to be loaded
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int parse_tcm_banks(struct rproc *rproc)
> > > +{
> > > +	int i, num_banks;
> > > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > > +	struct device *dev =3D &rproc->dev;
> > > +	struct device_node *r5_node =3D z_rproc->dev->of_node;
> > > +
> > > +	/* go through TCM banks for r5 node */
> > > +	num_banks =3D of_count_phandle_with_args(r5_node,
> > BANK_LIST_PROP, NULL);
> > > +	if (num_banks <=3D 0) {
> > > +		dev_err(dev, "need to specify TCM banks\n");
> > > +		return -EINVAL;
> > > +	}
> > > +	for (i =3D 0; i < num_banks; i++) {
> > > +		struct resource rsc;
> > > +		resource_size_t size;
> > > +		struct device_node *dt_node;
> > > +		struct rproc_mem_entry *mem;
> > > +		int ret;
> > > +		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
> > > +
> > > +		dt_node =3D of_parse_phandle(r5_node, BANK_LIST_PROP, i);
> > > +		if (!dt_node)
> > > +			return -EINVAL;
> > > +
> > > +		ret =3D of_address_to_resource(dt_node, 0, &rsc);
> > > +		if (ret < 0) {
> > > +			of_node_put(dt_node);
> > > +			return ret;
> > > +		}
> > > +		of_node_put(dt_node);
> > > +
> > > +		ret =3D zynqmp_r5_pm_request_sram(rsc.start);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		/* add carveout */
> > > +		size =3D resource_size(&rsc);
> > > +		mem =3D rproc_mem_entry_init(dev, NULL, rsc.start,
> > > +					   (size_t)size, rsc.start,
> > > +					   tcm_mem_alloc,
> > > +					   tcm_mem_release,
> > > +					   rsc.name);
> > > +		if (!mem) {
> > > +			ret =3D zynqmp_pm_release_node(pnode_id);
> >
> > Where is @pnode_id initialised?
>=20
> Good catch. Previously this was value set in an earlier iteration. I will=
 fix this
> as follows:
> - release the R5 cluster by instead passing z_rproc->pnode_id
> - release the TCM bank via call to release_sram
>=20
> This will also remove the variable pnode_id.
>=20
> >
> > > +			if (ret)
> > > +				dev_warn(dev,
> > > +					 "fail to release node: %x ret: %x\n",
> > > +					 pnode_id, ret);
> > > +			return -ENOMEM;
> > > +		}
> > > +
> > > +		mem->priv =3D (void *)(u64)pnode_id;
> >
> >
> > And here too - how does this work when you test things out on your side=
?
> >
> > Please note that I will need a reply to these questions before I review
> another
> > set.
> >
> Here I will update as follows:
> - set mem->priv to value from zynqmp_banks lookup table that contains
> power node IDs
>=20
>=20
> > > +		rproc_add_carveout(rproc, mem);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_parse_fw()
> > > + * @rproc: single R5 core's corresponding rproc instance
> > > + * @fw: ptr to firmware to be loaded onto r5 core
> > > + *
> > > + * When loading firmware, ensure the necessary carveouts are in
> > remoteproc
> > > + *
> > > + * return 0 on success, otherwise non-zero value on failure
> > > + */
> > > +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firm=
ware
> > *fw)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret =3D parse_tcm_banks(rproc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D parse_mem_regions(rproc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D rproc_elf_load_rsc_table(rproc, fw);
> > > +	if (ret =3D=3D -EINVAL) {
> > > +		/*
> > > +		 * resource table only required for IPC.
> > > +		 * if not present, this is not necessarily an error;
> > > +		 * for example, loading r5 hello world application
> > > +		 * so simply inform user and keep going.
> > > +		 */
> > > +		dev_info(&rproc->dev, "no resource table found.\n");
> > > +		ret =3D 0;
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_rproc_kick() - kick a firmware if mbox is provided
> > > + * @rproc: r5 core's corresponding rproc structure
> > > + * @vqid: virtqueue ID
> > > + */
> > > +static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > > +	struct device *dev =3D rproc->dev.parent;
> > > +	struct zynqmp_ipi_message *mb_msg =3D NULL;
> > > +	unsigned int skb_len;
> > > +	struct sk_buff *skb;
> > > +	int ret;
> > > +
> > > +	/* If vqid is negative, do not pass the vqid to
> > > +	 * mailbox as vqid is supposed to be 0 or positive.
> > > +	 * It also gives a way to just kick instead but
> > > +	 * not use the IPI buffer.
> > > +	 *
> > > +	 * For now use negative vqid to assume no message will be
> > > +	 * passed with IPI buffer, but just raise interrupt.
> > > +	 * This will be faster as it doesn't need to copy the
> > > +	 * message to the ZynqMP/Versal IPI message buffer.
> > > +	 */
> > > +	if (vqid >=3D 0) {
> > > +		skb_len =3D (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> > > +		skb =3D alloc_skb(skb_len, GFP_KERNEL);
> > > +		if (!skb)
> > > +			return;
> > > +
> > > +		mb_msg =3D (struct zynqmp_ipi_message *)skb_put(skb,
> > skb_len);
> > > +		mb_msg->len =3D sizeof(vqid);
> > > +		memcpy(mb_msg->data, &vqid, sizeof(vqid));
> > > +
> > > +		skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
> > > +	}
> > > +
> > > +	ret =3D mbox_send_message(z_rproc->tx_chan, mb_msg);
> > > +	if (ret < 0) {
> > > +		dev_warn(dev, "Failed to kick remote.\n");
> > > +		if (mb_msg) {
> > > +			skb_dequeue_tail(&z_rproc->tx_mc_skbs);
> > > +			kfree_skb(skb);
> > > +		}
> > > +	}
> > > +}
> > > +
> >
> > I am done reviewing this set.
> >
> > Thanks,
> > Mathieu
> >
> > > +static struct rproc_ops zynqmp_r5_rproc_ops =3D {
> > > +	.start		=3D zynqmp_r5_rproc_start,
> > > +	.stop		=3D zynqmp_r5_rproc_stop,
> > > +	.load		=3D rproc_elf_load_segments,
> > > +	.parse_fw	=3D zynqmp_r5_parse_fw,
> > > +	.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > > +	.sanity_check	=3D rproc_elf_sanity_check,
> > > +	.get_boot_addr	=3D rproc_elf_get_boot_addr,
> > > +	.kick		=3D zynqmp_r5_rproc_kick,
> > > +};
> > > +
> > > +/**
> > > + * event_notified_idr_cb() - event notified idr callback
> > > + * @id: idr id
> > > + * @ptr: pointer to idr private data
> > > + * @data: data passed to idr_for_each callback
> > > + *
> > > + * Pass notification to remoteproc virtio
> > > + *
> > > + * Return: 0. having return is to satisfy the idr_for_each() functio=
n
> > > + *          pointer input argument requirement.
> > > + **/
> > > +static int event_notified_idr_cb(int id, void *ptr, void *data)
> > > +{
> > > +	struct rproc *rproc =3D data;
> > > +
> > > +	if (rproc_vq_interrupt(rproc, id) =3D=3D IRQ_NONE)
> > > +		dev_dbg(&rproc->dev, "no message was found in idr with id:
> > %d\n", id);
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * handle_event_notified() - remoteproc notification work function
> > > + * @work: pointer to the work structure
> > > + *
> > > + * It checks each registered remoteproc notify IDs.
> > > + */
> > > +static void handle_event_notified(struct work_struct *work)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +	struct rproc *rproc;
> > > +
> > > +	z_rproc =3D container_of(work, struct zynqmp_r5_rproc, mbox_work);
> > > +	rproc =3D z_rproc->rproc;
> > > +
> > > +	/*
> > > +	 * This is to simply raise interrupt as ACK for remote.
> > > +	 *
> > > +	 * Xilinx mailbox, ATF and SoC specific IPI mapping will handle
> > > +	 * mapping to remote processor.
> > > +	 */
> > > +	if (mbox_send_message(z_rproc->rx_chan, NULL) < 0)
> > > +		dev_warn(rproc->dev.parent, "Failed to kick remote.\n");
> > > +
> > > +	/*
> > > +	 * We only use IPI for interrupt. The firmware side may or may
> > > +	 * not write the notifyid when it trigger IPI.
> > > +	 * And thus, we scan through all the registered notifyids.
> > > +	 */
> > > +	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
> > > + * @cl: mailbox client
> > > + * @msg: message pointer
> > > + *
> > > + * It will schedule the R5 notification work.
> > > + */
> > > +static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +
> > > +	z_rproc =3D container_of(cl, struct zynqmp_r5_rproc, rx_mc);
> > > +	/*
> > > +	 * Notification can be received with message payload.
> > > +	 * To handle this, check for message contents.
> > > +	 * If there are contents, copy to ipi message buffer payload locati=
on.
> > > +	 *
> > > +	 * If message is empty, then that means that was simple raising
> > > +	 * of interrupt. no payload to process.
> > > +	 *
> > > +	 * Note: enqueue work regardless of msg as kick may imply that
> > remote
> > > +	 * is waiting for ack.
> > > +	 */
> > > +	if (msg) {
> > > +		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> > > +		size_t len;
> > > +
> > > +		ipi_msg =3D (struct zynqmp_ipi_message *)msg;
> > > +		buf_msg =3D (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
> > > +		len =3D (ipi_msg->len >=3D IPI_BUF_LEN_MAX) ?
> > > +		      IPI_BUF_LEN_MAX : ipi_msg->len;
> > > +		buf_msg->len =3D len;
> > > +		memcpy(buf_msg->data, ipi_msg->data, len);
> > > +	}
> > > +	schedule_work(&z_rproc->mbox_work);
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
> > > + * @cl: mailbox client
> > > + * @msg: pointer to the message which has been sent
> > > + * @r: status of last TX - OK or error
> > > + *
> > > + * It will be called by the mailbox framework when the last TX has d=
one.
> > > + */
> > > +static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *msg,
> int
> > r)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +	struct sk_buff *skb;
> > > +
> > > +	if (!msg)
> > > +		return;
> > > +	z_rproc =3D container_of(cl, struct zynqmp_r5_rproc, tx_mc);
> > > +	skb =3D skb_dequeue(&z_rproc->tx_mc_skbs);
> > > +	kfree_skb(skb);
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_setup_mbox() - Setup mailboxes
> > > + *			    this is used for each individual R5 core
> > > + *
> > > + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> > > + * @node: pointer of the device node
> > > + *
> > > + * Function to setup mailboxes to talk to RPU.
> > > + *
> > > + * Return: 0 for success, negative value for failure.
> > > + */
> > > +static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
> > > +				struct device_node *node)
> > > +{
> > > +	struct mbox_client *mclient;
> > > +
> > > +	/* Setup TX mailbox channel client */
> > > +	mclient			=3D &z_rproc->tx_mc;
> > > +	mclient->dev		=3D z_rproc->dev;
> > > +	mclient->tx_done	=3D zynqmp_r5_mb_tx_done;
> > > +	mclient->tx_block	=3D false;
> > > +	mclient->knows_txdone	=3D false;
> > > +	mclient->rx_callback	=3D NULL;
> > > +
> > > +	/* Setup RX mailbox channel client */
> > > +	mclient			=3D &z_rproc->rx_mc;
> > > +	mclient->dev		=3D z_rproc->dev;
> > > +	mclient->tx_done	=3D NULL;
> > > +	mclient->tx_block	=3D false;
> > > +	mclient->knows_txdone	=3D false;
> > > +	mclient->rx_callback	=3D zynqmp_r5_mb_rx_cb;
> > > +
> > > +	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
> > > +
> > > +	/* Request TX and RX channels */
> > > +	z_rproc->tx_chan =3D mbox_request_channel_byname(&z_rproc-
> > >tx_mc, "tx");
> > > +	if (IS_ERR(z_rproc->tx_chan)) {
> > > +		dev_err(z_rproc->dev, "failed to request mbox tx channel.\n");
> > > +		return PTR_ERR(z_rproc->tx_chan);
> > > +	}
> > > +
> > > +	z_rproc->rx_chan =3D mbox_request_channel_byname(&z_rproc-
> > >rx_mc, "rx");
> > > +	if (IS_ERR(z_rproc->rx_chan)) {
> > > +		dev_err(z_rproc->dev, "failed to request mbox rx channel.\n");
> > > +		return PTR_ERR(z_rproc->rx_chan);
> > > +	}
> > > +	skb_queue_head_init(&z_rproc->tx_mc_skbs);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void zynqmp_r5_cleanup_mbox(struct zynqmp_r5_rproc *z_rproc)
> > > +{
> > > +	mbox_free_channel(z_rproc->tx_chan);
> > > +	mbox_free_channel(z_rproc->rx_chan);
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
> > > + *		       this is called for each individual R5 core to
> > > + *		       set up mailbox, Xilinx platform manager unique ID,
> > > + *		       add to rproc core
> > > + *
> > > + * @pdev: domain platform device for current R5 core
> > > + * @node: pointer of the device node for current R5 core
> > > + * @rpu_mode: mode to configure RPU, split or lockstep
> > > + *
> > > + * Return: 0 for success, negative value for failure.
> > > + */
> > > +static struct zynqmp_r5_rproc *zynqmp_r5_probe(struct platform_devic=
e
> > *pdev,
> > > +					       struct device_node *node,
> > > +					       enum rpu_oper_mode
> > rpu_mode)
> > > +{
> > > +	int ret;
> > > +	struct device *dev =3D &pdev->dev;
> > > +	struct rproc *rproc_ptr;
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +
> > > +	/* Allocate remoteproc instance */
> > > +	rproc_ptr =3D devm_rproc_alloc(dev, dev_name(dev),
> > &zynqmp_r5_rproc_ops,
> > > +				     NULL, sizeof(struct zynqmp_r5_rproc));
> > > +	if (!rproc_ptr) {
> > > +		ret =3D -ENOMEM;
> > > +		goto error;
> > > +	}
> > > +
> > > +	rproc_ptr->auto_boot =3D false;
> > > +	z_rproc =3D rproc_ptr->priv;
> > > +	z_rproc->rproc =3D rproc_ptr;
> > > +	z_rproc->dev =3D dev;
> > > +
> > > +	/* Set up DMA mask */
> > > +	ret =3D dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> > > +	if (ret)
> > > +		goto error;
> > > +
> > > +	/* Get R5 power domain node */
> > > +	ret =3D of_property_read_u32(node, "power-domain", &z_rproc-
> > >pnode_id);
> > > +	if (ret)
> > > +		goto error;
> > > +
> > > +	ret =3D r5_set_mode(z_rproc, rpu_mode);
> > > +	if (ret)
> > > +		goto error;
> > > +
> > > +	if (of_property_read_bool(node, "mboxes")) {
> > > +		ret =3D zynqmp_r5_setup_mbox(z_rproc, node);
> > > +		if (ret)
> > > +			goto error;
> > > +	}
> > > +
> > > +	/* Add R5 remoteproc */
> > > +	ret =3D devm_rproc_add(dev, rproc_ptr);
> > > +	if (ret) {
> > > +		zynqmp_r5_cleanup_mbox(z_rproc);
> > > +		goto error;
> > > +	}
> > > +
> > > +	return z_rproc;
> > > +error:
> > > +	return ERR_PTR(ret);
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_remoteproc_probe()
> > > + *
> > > + * @pdev: domain platform device for R5 cluster
> > > + *
> > > + * called when driver is probed, for each R5 core specified in DT,
> > > + * setup as needed to do remoteproc-related operations
> > > + *
> > > + * Return: 0 for success, negative value for failure.
> > > + */
> > > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > > +{
> > > +	int ret, core_count;
> > > +	struct device *dev =3D &pdev->dev;
> > > +	struct device_node *nc;
> > > +	enum rpu_oper_mode rpu_mode =3D PM_RPU_MODE_LOCKSTEP;
> > > +	struct list_head *cluster; /* list to track each core's rproc */
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +	struct platform_device *child_pdev;
> > > +	struct list_head *pos;
> > > +
> > > +	ret =3D of_property_read_u32(dev->of_node, "xlnx,cluster-mode",
> > &rpu_mode);
> > > +	if (ret < 0 || (rpu_mode !=3D PM_RPU_MODE_LOCKSTEP &&
> > > +			rpu_mode !=3D PM_RPU_MODE_SPLIT)) {
> > > +		dev_err(dev, "invalid cluster mode: ret %d mode %x\n",
> > > +			ret, rpu_mode);
> > > +		return ret;
> > > +	}
> > > +
> > > +	dev_dbg(dev, "RPU configuration: %s\n",
> > > +		rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP ? "lockstep" :
> > "split");
> > > +
> > > +	/*
> > > +	 * if 2 RPUs provided but one is lockstep, then we have an
> > > +	 * invalid configuration.
> > > +	 */
> > > +
> > > +	core_count =3D of_get_available_child_count(dev->of_node);
> > > +	if ((rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP && core_count !=3D 1) ||
> > > +	    core_count > MAX_RPROCS)
> > > +		return -EINVAL;
> > > +
> > > +	cluster =3D devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
> > > +	if (!cluster)
> > > +		return -ENOMEM;
> > > +	INIT_LIST_HEAD(cluster);
> > > +
> > > +	ret =3D devm_of_platform_populate(dev);
> > > +	if (ret) {
> > > +		dev_err(dev, "devm_of_platform_populate failed, ret =3D
> > %d\n",
> > > +			ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* probe each individual r5 core's remoteproc-related info */
> > > +	for_each_available_child_of_node(dev->of_node, nc) {
> > > +		child_pdev =3D of_find_device_by_node(nc);
> > > +		if (!child_pdev) {
> > > +			dev_err(dev, "could not get R5 core platform
> > device\n");
> > > +			ret =3D -ENODEV;
> > > +			goto out;
> > > +		}
> > > +
> > > +		z_rproc =3D zynqmp_r5_probe(child_pdev, nc, rpu_mode);
> > > +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> > > +			ret ? "Failed" : "Able",
> > > +			nc);
> > > +		if (IS_ERR(z_rproc)) {
> > > +			ret =3D PTR_ERR(z_rproc);
> > > +			goto out;
> > > +		}
> > > +		list_add_tail(&z_rproc->elem, cluster);
> > > +	}
> > > +	/* wire in so each core can be cleaned up at driver remove */
> > > +	platform_set_drvdata(pdev, cluster);
> > > +	return 0;
> > > +out:
> > > +	/*
> > > +	 * undo core0 upon any failures on core1 in split-mode
> > > +	 *
> > > +	 * in zynqmp_r5_probe z_rproc is set to null
> > > +	 * and ret to non-zero value if error
> > > +	 */
> > > +	list_for_each(pos, cluster) {
> > > +		z_rproc =3D list_entry(pos, struct zynqmp_r5_rproc, elem);
> > > +		zynqmp_r5_cleanup_mbox(z_rproc);
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > > +/*
> > > + * zynqmp_r5_remoteproc_remove()
> > > + *
> > > + * @pdev: domain platform device for R5 cluster
> > > + *
> > > + * When the driver is unloaded, clean up the mailboxes for each
> > > + * remoteproc that was initially probed.
> > > + */
> > > +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> > > +{
> > > +	struct list_head *pos, *temp, *cluster =3D (struct list_head *)
> > > +						 platform_get_drvdata(pdev);
> > > +	struct zynqmp_r5_rproc *z_rproc =3D NULL;
> > > +
> > > +	list_for_each_safe(pos, temp, cluster) {
> > > +		z_rproc =3D list_entry(pos, struct zynqmp_r5_rproc, elem);
> > > +		zynqmp_r5_cleanup_mbox(z_rproc);
> > > +		list_del(pos);
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +/* Match table for OF platform binding */
> > > +static const struct of_device_id zynqmp_r5_remoteproc_match[] =3D {
> > > +	{ .compatible =3D "xlnx,zynqmp-r5-remoteproc", },
> > > +	{ /* end of list */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> > > +
> > > +static struct platform_driver zynqmp_r5_remoteproc_driver =3D {
> > > +	.probe =3D zynqmp_r5_remoteproc_probe,
> > > +	.remove =3D zynqmp_r5_remoteproc_remove,
> > > +	.driver =3D {
> > > +		.name =3D "zynqmp_r5_remoteproc",
> > > +		.of_match_table =3D zynqmp_r5_remoteproc_match,
> > > +	},
> > > +};
> > > +module_platform_driver(zynqmp_r5_remoteproc_driver);
> > > +
> > > +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> > > +MODULE_LICENSE("GPL v2");
> > > --
> > > 2.17.1
> > >
