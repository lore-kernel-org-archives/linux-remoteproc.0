Return-Path: <SRS0=hTqE=EK=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12A6C388F7
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 21:59:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43E9420795
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 21:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="A29yHOek"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbgKDV7G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 16:59:06 -0500
Received: from mail-eopbgr770055.outbound.protection.outlook.com ([40.107.77.55]:11362
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729275AbgKDV5u (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 16:57:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xemt2oaGnACSlTiwffnrU8hETeqtPuI6Xi7OQQsWKpOnrfNR1lfVWRJvikJqF+D+sSFlc8YFDcFwL/b80yKy6XQ6nnH6YuN8xli8gAhmfdhFqpYZHC3qIwsDNWv+/6/cRwu9OfbWdEYKvpivUmAAdgG5eRWU7GWup8w0s2Kg/9b/QmXv4UW7EgJeM6+qyyLSOO1RW45NrooL03NK6RQRzkx1uPxQMJFeL/1PK1JuhP4ZZT0AYh6KTY+V4e+3X5D5ySz4yFlFz4ORKfJH7hXbfei58ugTG9SZ2ruxAlXiT5jyBrmfGJqkKWDa4E/NbmRuO0IHd1fiopkx/9SFndTu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD4j302tvfBK7LEJEV2rOvpsWso5UJdcEu+a4kNuh78=;
 b=VzU8L7eC53pMNg90GfUfGC8BIfl1GsKJHpVrZiZCsNlnnHk3iz2J4vlC/2hR7Oqor12+vk8LrlpXV9/9WhU+jPN39vM24FcSqvDb09hS0WPgnCt2KiAYAruG0uQYDdVSd/cE+ThiCTiJX3yj92+9OpOm8VBIKwjfR8c3cgyEYQjCwTo94Q4anMH5bgOvShmPOZTIT7MghLDUFQSGsysgdO9HAh5iJGT2rID57A/BDDCbiw8c8GvlHYQaIn/MqyrAs/fw+J45kZuX6uJ5P6deQCITxkSHrs4pQRMyRCRAIbHHN26R5YtowHhESlQooJRzgej+CDFbc148FL+qgGb51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD4j302tvfBK7LEJEV2rOvpsWso5UJdcEu+a4kNuh78=;
 b=A29yHOek1IbxZfgWOcNz9Q41zNmTe2C8FPCsMWURA1SE79EGCprlRYl/TNY69QrmbbmnHW28RD8QAJ6CVuk1LIC4o472rHWbCy1Wg3EWj9E4lRxM2zfnM2zWssY7+hGAfNikgNbTrwz6K+e3LZx2ynMA3vW3FaoUI61A6c+eJ6A=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BY5PR02MB6550.namprd02.prod.outlook.com (2603:10b6:a03:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Wed, 4 Nov
 2020 21:57:40 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e%6]) with mapi id 15.20.3499.031; Wed, 4 Nov 2020
 21:57:40 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v22 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v22 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWsg6D5+s0awqSkEGT9bU8+SMjT6m4fxUAgAACfJA=
Date:   Wed, 4 Nov 2020 21:57:40 +0000
Message-ID: <BYAPR02MB4407B09EA377A5DB4DC7330EB5EF0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20201103182339.14286-1-ben.levinsky@xilinx.com>
 <20201103182339.14286-6-ben.levinsky@xilinx.com>
 <20201104212938.GE2893396@xps15>
In-Reply-To: <20201104212938.GE2893396@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.90.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41448ff1-f8f9-4f74-5713-08d8810ca65c
x-ms-traffictypediagnostic: BY5PR02MB6550:
x-microsoft-antispam-prvs: <BY5PR02MB65501982FAF7165A3F0780E0B5EF0@BY5PR02MB6550.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XlvUzgFI7bVIYHNBDIQUbkCffM/vLgFjNF4j0SGO6qmewB/5bNlM0sVWVGlwKp6WF6Wg94AS1d+aho8J2eJAxyfDHGtlaukKLyUl/AevpVmuVg0ALmopmLP5RFu846+lxMQd60C+DY6qCly00+FSe1Rjjt33jByWNmFb4jJYGivJAxqqlWm8Gi8oOd664/S5VwGY3cpQXNxDqvz7+WuFXQGtvgLsLMyeezrONIASuqAGZpOIOdOFNMM0O5EiQbgqgfX9Dfmc7Z68h2zoYA1UDtod+2XtcSoLcPv/83Dkd9d1a+UPnjA7IsW+e50FSDaY0tXqehcVQRffV8hAv/TIZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(83380400001)(5660300002)(4326008)(76116006)(26005)(52536014)(478600001)(66446008)(66476007)(66946007)(316002)(30864003)(54906003)(64756008)(6506007)(7696005)(53546011)(66556008)(186003)(9686003)(2906002)(6916009)(55016002)(33656002)(8676002)(8936002)(86362001)(71200400001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Hv/Qz7eRBVUgvI01+Z4ZVy4rBJOCwmGJFOqmvbYuMnxFYwCXOv7qR7tKy3Uv7PmY8saVTJYCHb5IVKXXj48JNmM10zq2yRHR3MwGH0JmVGmiVGQbIFWKtJeTD3SSL25YgjC/32gaxyKAloEZgS3loxgMiR79bvT63TiCH2Q1OwAa6wkK7JDugEePwXeSUU5Otaj210Iq4dufBp3LwW1wsFt3gXjp19yykQqJOK6zqbZBMg6GHAqfEtGO6c06Q7SgdRK0Vs73U1ur0SLS6jVB6BhNA5dA58xNdRFi6UQ85562Eu1giz0+RpvbhjZfIio/8rHULXlWL3f8tRH0FUzgYvKXwFFBxrjiTQYcbu7dzo8yp7F8RItBT3V/jGs3+J3DYCHtN+9jaIsik4LGV2TAqogLw07lSH2QclQELsnKE9qlzqea2g2xaPfNRDjnUFxYOYnfZ0fWnPVSQmm9c8vCsBvqDtm4Ts1UZtm68HHo7ZtIL0+uwRZMETgsspxZIbGfMlEsQ2aLJAwoXJySJSjwwej7mb958Qflg9N+aGDU5Kpz7R/czKKPK0KPK7HYL6l7dyaDWbida5oJpwJYFTLAgJr7bltFQDsS3FJsXdofnPn52K91sdiH7tHeYCeqJHDtphMsnC9YQ4EwTMO6poDJ6Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41448ff1-f8f9-4f74-5713-08d8810ca65c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 21:57:40.2336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ZZ595V/T+eAo13Y6cr+6GnmrzwgK2o1vKb/BuTbJJAELxqUzG+bhvSGLGft/WSw4KAFZU90EdvT2OY4wmeiTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6550
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Wednesday, November 4, 2020 1:30 PM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: michael.auchter@ni.com; Stefano Stabellini <stefanos@xilinx.com>;
> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v22 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> On Tue, Nov 03, 2020 at 10:23:39AM -0800, Ben Levinsky wrote:
> > R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> > remotproc driver, we can boot the R5 sub-system in different 2
> > configurations -
> > 	* split
> > 	* lock-step
> >
> > The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
> > Platform Management Unit that handles the R5 configuration, memory
> access
> > and R5 lifecycle management. The interface to this manager is done in t=
his
> > driver via zynqmp_pm_* function calls.
> >
> > Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
> > Signed-off-by: Jason Wu <j.wu@xilinx.com>
> > Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> > ---
> > - update documented param list for zynqmp_r5_probe
> > - remove use-after-free lines in zynqmp_r5_probe,
> >   zynqmp_r5_remoteproc_probe, and zynqmp_r5_remoteproc_remove
> > - update path for error handling in zynqmp_r5_probe and
> >   zynqmp_r5_remoteproc_probe
> > - as the mbox properties are optional, update zynqmp_r5_rproc_kick
> >   so that the mailbox functionality only occurs if these
> >   properties are provided
> > ---
> >  drivers/remoteproc/Kconfig                |   8 +
> >  drivers/remoteproc/Makefile               |   1 +
> >  drivers/remoteproc/zynqmp_r5_remoteproc.c | 778
> ++++++++++++++++++++++
>=20
> Many of my comments from V19 have not been addressed and as such I will
> not move
> foward with this set.  Moreover I will not consider a new revision before
> November 18th.
>=20

Thank you for the advance notice.=20

As for V19 comments that are unresolved, can you expand on which ones?
From the v19 review here is a list of the comments with your comments surro=
unded by quotes
and how I had thought these were addressed.=20

"
As far as I can see zynqmp_r5_rproc::dt_node is not needed
"=20

	I removed the field zynqmp_r5_rproc::dt_node and its no longer used in the=
 file

"
> +	z_rproc->dev =3D &rproc_ptr->dev;
> +	z_rproc->dev->of_node =3D node;

This is quite hackish to me.  The problem is that @pdev is the rpu'a DT nod=
e
rather than the r5_X's DT node.  I suggest to have a look at k3_r5_probe()[=
1],
especially at how devm_of_platform_populate() is called on @dev and from th=
ere
how the platform device for each r5 is retreived using the same
for_each_available_child_of_node() loop you also have.
"
	As I understand it this is resolved as now @pdev is the r5_X's DT node sim=
ilar to the k3_r5_probe()
	Also the 2 lines in question are now removed in the v22 patch
=09

"> +	struct zynqmp_r5_rproc *core;

Please call variables of type zynqmp_r5_rproc the same name throughout the =
file.
"
	So in zynqmp_r5_probe there is an instance of a zynqmp_r5_rproc** with the=
 name core, this is because
	there is already arg with name z_rproc and z_rproc_ptr or something like t=
his may be confusing.

	With that being said, instead the zynqmp_r5_rproc** can be renamed to z_rp=
roc if this is what you=20
	mean?

"
> +	rpu_mode =3D of_property_read_bool(dev->of_node, "lockstep-mode") ?
> +		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;

Indentation problem.  Note that is it now permitted to go beyond 80 charact=
ers
per line.
"

	In v22 patch this is now:
		rpu_mode =3D of_property_read_bool(dev->of_node, "lockstep-mode") ?
		PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;

	Is this indentation alright?

"
> +	i =3D 0;

What is the above for?  As fas as I can tell 'i' is not used in the loop be=
low.
"
	In v19 this var was deprecated, but as per feedback from Michael A. in lat=
er revisions there was unhandled=20
	case of R5_0 successfully initializating but R5_1 failing. To accommodate =
this case the var i was
	re-introduced. If the name is unclear then it can be refactored if this is=
 the intention

"
> +	struct list_head *pos, *cluster =3D (struct list_head *)
> +					 platform_get_drvdata(pdev);

Either align the 'p' with the '(' or simply do the assignement on another l=
ine
below.
"

	This may be formatting on my terminal vs. the patch format itself but in v=
22 I think this is resolved.

=09

If still 1 or more of these comments or another is not addressed then my ap=
ologies and will address in the next revision. Again, thank you for the rev=
iew!

Best,
Ben



> >  3 files changed, 787 insertions(+)
> >  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> >
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index c6659dfea7c7..c2fe54b1d94f 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
> >  	  It's safe to say N here if you're not interested in utilizing
> >  	  the DSP slave processors.
> >
> > +config ZYNQMP_R5_REMOTEPROC
> > +	tristate "ZynqMP R5 remoteproc support"
> > +	depends on PM && ARCH_ZYNQMP
> > +	select RPMSG_VIRTIO
> > +	select ZYNQMP_IPI_MBOX
> > +	help
> > +	  Say y or m here to support ZynqMP R5 remote processors via the
> remote
> > +	  processor framework.
> >  endif # REMOTEPROC
> >
> >  endmenu
> > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> > index 3dfa28e6c701..ef1abff654c2 100644
> > --- a/drivers/remoteproc/Makefile
> > +++ b/drivers/remoteproc/Makefile
> > @@ -33,3 +33,4 @@ obj-$(CONFIG_ST_REMOTEPROC)		+=3D
> st_remoteproc.o
> >  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+=3D st_slim_rproc.o
> >  obj-$(CONFIG_STM32_RPROC)		+=3D stm32_rproc.o
> >  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+=3D ti_k3_dsp_remoteproc.o
> > +obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+=3D zynqmp_r5_remoteproc.o
> > diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c
> b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > new file mode 100644
> > index 000000000000..48bffa91bc00
> > --- /dev/null
> > +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > @@ -0,0 +1,779 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Zynq R5 Remote Processor driver
> > + *
> > + * Based on origin OMAP and Zynq Remote Processor driver
> > + *
> > + */
> > +
> > +#include <linux/firmware/xlnx-zynqmp.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/list.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/mailbox/zynqmp-ipi-message.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/remoteproc.h>
> > +#include <linux/skbuff.h>
> > +#include <linux/sysfs.h>
> > +
> > +#include "remoteproc_internal.h"
> > +
> > +#define MAX_RPROCS	2 /* Support up to 2 RPU */
> > +#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU memory
> instance */
> > +
> > +#define BANK_LIST_PROP	"meta-memory-regions"
> > +#define DDR_LIST_PROP	"memory-regions"
> > +
> > +/* IPI buffer MAX length */
> > +#define IPI_BUF_LEN_MAX	32U
> > +/* RX mailbox client buffer max length */
> > +#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
> > +				 sizeof(struct zynqmp_ipi_message))
> > +
> > +/**
> > + * struct zynqmp_r5_mem - zynqmp rpu memory data
> > + * @pnode_id: TCM power domain ids
> > + * @res: memory resource
> > + * @node: list node
> > + */
> > +struct zynqmp_r5_mem {
> > +	u32 pnode_id[MAX_MEM_PNODES];
> > +	struct resource res;
> > +	struct list_head node;
> > +};
> > +
> > +/**
> > + * struct zynqmp_r5_rproc - zynqmp rpu remote processor state
> > + *			    this is for each individual R5 core's state
> > + *
> > + * @rx_mc_buf: rx mailbox client buffer to save the rx message
> > + * @tx_mc: tx mailbox client
> > + * @rx_mc: rx mailbox client * @dev: device of RPU instance
> > + * @mbox_work: mbox_work for the RPU remoteproc
> > + * @tx_mc_skbs: socket buffers for tx mailbox client
> > + * @dev: device of RPU instance
> > + * @rproc: rproc handle
> > + * @tx_chan: tx mailbox channel
> > + * @rx_chan: rx mailbox channel
> > + * @pnode_id: RPU CPU power domain id
> > + * @elem: linked list item
> > + * @dt_node: device tree node that holds information for 1 R5 core.
> > + */
> > +struct zynqmp_r5_rproc {
> > +	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
> > +	struct mbox_client tx_mc;
> > +	struct mbox_client rx_mc;
> > +	struct work_struct mbox_work;
> > +	struct sk_buff_head tx_mc_skbs;
> > +	struct device *dev;
> > +	struct rproc *rproc;
> > +	struct mbox_chan *tx_chan;
> > +	struct mbox_chan *rx_chan;
> > +	u32 pnode_id;
> > +	struct list_head elem;
> > +};
> > +
> > +/*
> > + * r5_set_mode - set RPU operation mode
> > + * @z_rproc: Remote processor private data
> > + * @rpu_mode: mode specified by device tree to configure the RPU to
> > + *
> > + * set RPU operation mode
> > + *
> > + * Return: 0 for success, negative value for failure
> > + */
> > +static int r5_set_mode(struct zynqmp_r5_rproc *z_rproc,
> > +		       enum rpu_oper_mode rpu_mode)
> > +{
> > +	enum rpu_tcm_comb tcm_mode;
> > +	enum rpu_oper_mode cur_rpu_mode;
> > +	int ret;
> > +
> > +	ret =3D zynqmp_pm_get_rpu_mode(z_rproc->pnode_id,
> &cur_rpu_mode);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (rpu_mode !=3D cur_rpu_mode) {
> > +		ret =3D zynqmp_pm_set_rpu_mode(z_rproc->pnode_id,
> > +					     rpu_mode);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	tcm_mode =3D (rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP) ?
> > +		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
> > +	return zynqmp_pm_set_tcm_config(z_rproc->pnode_id, tcm_mode);
> > +}
> > +
> > +/*
> > + * release TCM banks when powering down R5 core
> > + */
> > +static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry
> *mem)
> > +{
> > +	u32 pnode_id =3D (u64)mem->priv;
> > +
> > +	iounmap(mem->va);
> > +	return zynqmp_pm_release_node(pnode_id);
> > +}
> > +
> > +/*
> > + * given ID corresponding to R5 core in Xilinx Platform management (xp=
m)
> API,
> > + * try to use xpm wake call to wake R5 core
> > + */
> > +static int zynqmp_r5_rproc_start(struct rproc *rproc)
> > +{
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	enum rpu_boot_mem bootmem;
> > +
> > +	bootmem =3D (rproc->bootaddr & 0xF0000000) =3D=3D 0xF0000000 ?
> > +		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> > +
> > +	dev_dbg(rproc->dev.parent, "RPU boot from %s.",
> > +		bootmem =3D=3D PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> > +
> > +	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
> > +				     bootmem,
> ZYNQMP_PM_REQUEST_ACK_NO);
> > +}
> > +
> > +/*
> > + * given ID corresponding to R5 core in Xilinx Platform management (xp=
m)
> API,
> > + * try to use xpm power down call to power off R5 core
> > + */
> > +static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> > +{
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +
> > +	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
> > +				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > +}
> > +
> > +/*
> > + * map in physical addr for  DDR mem carveout in rproc
> > + */
> > +static int zynqmp_r5_rproc_mem_alloc(struct rproc *rproc,
> > +				     struct rproc_mem_entry *mem)
> > +{
> > +	void *va;
> > +
> > +	va =3D ioremap_wc(mem->dma, mem->len);
> > +	if (IS_ERR_OR_NULL(va))
> > +		return -ENOMEM;
> > +
> > +	/* Update memory entry va */
> > +	mem->va =3D va;
> > +
> > +	return 0;
> > +}
> > +
> > +/* unmap rproc_mem_entry virtual addr */
> > +static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
> > +				       struct rproc_mem_entry *mem)
> > +{
> > +	iounmap(mem->va);
> > +	return 0;
> > +}
> > +
> > +/* construct rproc mem carveouts for DDR regions specified in device t=
ree
> */
> > +static int parse_mem_regions(struct rproc *rproc)
> > +{
> > +	int num_mems, i;
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	struct device *dev =3D &rproc->dev;
> > +	struct device_node *np =3D z_rproc->dev->of_node;
> > +	struct rproc_mem_entry *mem;
> > +
> > +	num_mems =3D of_count_phandle_with_args(np, DDR_LIST_PROP,
> NULL);
> > +	if (num_mems <=3D 0)
> > +		return 0;
> > +
> > +	for (i =3D 0; i < num_mems; i++) {
> > +		struct device_node *node;
> > +		struct reserved_mem *rmem;
> > +
> > +		node =3D of_parse_phandle(np, DDR_LIST_PROP, i);
> > +		if (!node)
> > +			return -EINVAL;
> > +
> > +		rmem =3D of_reserved_mem_lookup(node);
> > +		if (!rmem)
> > +			return -EINVAL;
> > +
> > +		if (strstr(node->name, "vdev0vring")) {
> > +			int vring_id;
> > +			char name[16];
> > +
> > +			/*
> > +			 * expecting form of "rpuXvdev0vringX as documented
> > +			 * in xilinx remoteproc device tree binding
> > +			 */
> > +			if (strlen(node->name) < 15) {
> > +				dev_err(dev, "%pOF is less than 14 chars",
> > +					node);
> > +				return -EINVAL;
> > +			}
> > +
> > +			/*
> > +			 * can be 1 of multiple vring IDs per IPC channel
> > +			 * e.g. 'vdev0vring0' and 'vdev0vring1'
> > +			 */
> > +			vring_id =3D node->name[14] - '0';
> > +			snprintf(name, sizeof(name), "vdev0vring%d",
> vring_id);
> > +			/* Register vring */
> > +			mem =3D rproc_mem_entry_init(dev, NULL,
> > +						   (dma_addr_t)rmem->base,
> > +						   rmem->size, rmem->base,
> > +
> zynqmp_r5_rproc_mem_alloc,
> > +
> zynqmp_r5_rproc_mem_release,
> > +						   name);
> > +		} else {
> > +			/* Register DMA region */
> > +			int (*alloc)(struct rproc *r,
> > +				     struct rproc_mem_entry *rme);
> > +			int (*release)(struct rproc *r,
> > +				       struct rproc_mem_entry *rme);
> > +			char name[20];
> > +
> > +			if (strstr(node->name, "vdev0buffer")) {
> > +				alloc =3D NULL;
> > +				release =3D NULL;
> > +				strcpy(name, "vdev0buffer");
> > +			} else {
> > +				alloc =3D zynqmp_r5_rproc_mem_alloc;
> > +				release =3D zynqmp_r5_rproc_mem_release;
> > +				strcpy(name, node->name);
> > +			}
> > +
> > +			mem =3D rproc_mem_entry_init(dev, NULL,
> > +						   (dma_addr_t)rmem->base,
> > +						   rmem->size, rmem->base,
> > +						   alloc, release, name);
> > +		}
> > +		if (!mem)
> > +			return -ENOMEM;
> > +
> > +		rproc_add_carveout(rproc, mem);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/* call Xilinx Platform manager to request access to TCM bank */
> > +static int zynqmp_r5_pm_request_tcm(struct device_node *tcm_node,
> > +				    struct device *dev, u32 *pnode_id)
> > +{
> > +	int ret;
> > +
> > +	ret =3D of_property_read_u32(tcm_node, "pnode-id", pnode_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return zynqmp_pm_request_node(*pnode_id,
> ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > +				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > +}
> > +
> > +/*
> > + * Given TCM bank entry,
> > + * this callback will set device address for R5 running on TCM
> > + * and also setup virtual address for TCM bank remoteproc carveout
> > + */
> > +static int tcm_mem_alloc(struct rproc *rproc,
> > +			 struct rproc_mem_entry *mem)
> > +{
> > +	void *va;
> > +	struct device *dev =3D rproc->dev.parent;
> > +
> > +	va =3D ioremap_wc(mem->dma, mem->len);
> > +	if (IS_ERR_OR_NULL(va))
> > +		return -ENOMEM;
> > +
> > +	/* Update memory entry va */
> > +	mem->va =3D va;
> > +
> > +	va =3D devm_ioremap_wc(dev, mem->da, mem->len);
> > +	if (!va)
> > +		return -ENOMEM;
> > +	/* As R5 is 32 bit, wipe out extra high bits */
> > +	mem->da &=3D 0x000fffff;
> > +	/*
> > +	 * TCM Banks 0A and 0B (0xffe00000 and 0xffe20000)
> > +	 * are handled with the above line of code so do nothing
> > +	 * for this 2 banks
> > +	 */
> > +
> > +	/*
> > +	 * TCM Banks 1A and 1B (0xffe90000 and 0xffeb0000) still
> > +	 * need to be translated to 0x0 and 0x20000
> > +	 */
> > +	if (mem->da =3D=3D 0x90000 || mem->da =3D=3D 0xB0000)
> > +		mem->da -=3D 0x90000;
> > +
> > +	/* if translated TCM bank address is not valid report error */
> > +	if (mem->da !=3D 0x0 && mem->da !=3D 0x20000) {
> > +		dev_err(dev, "invalid TCM bank address: %x\n", mem->da);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Given R5 node in remoteproc instance
> > + * allocate remoteproc carveout for TCM memory
> > + * needed for firmware to be loaded
> > + */
> > +static int parse_tcm_banks(struct rproc *rproc)
> > +{
> > +	int i, num_banks;
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	struct device *dev =3D &rproc->dev;
> > +	struct device_node *r5_node =3D z_rproc->dev->of_node;
> > +
> > +	/* go through TCM banks for r5 node */
> > +	num_banks =3D of_count_phandle_with_args(r5_node,
> BANK_LIST_PROP, NULL);
> > +	if (num_banks <=3D 0) {
> > +		dev_err(dev, "need to specify TCM banks\n");
> > +		return -EINVAL;
> > +	}
> > +	for (i =3D 0; i < num_banks; i++) {
> > +		struct resource rsc;
> > +		resource_size_t size;
> > +		struct device_node *dt_node;
> > +		struct rproc_mem_entry *mem;
> > +		int ret;
> > +		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
> > +
> > +		dt_node =3D of_parse_phandle(r5_node, BANK_LIST_PROP, i);
> > +		if (!dt_node)
> > +			return -EINVAL;
> > +
> > +		if (of_device_is_available(dt_node)) {
> > +			ret =3D of_address_to_resource(dt_node, 0, &rsc);
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			ret =3D zynqmp_r5_pm_request_tcm(dt_node, dev,
> &pnode_id);
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +			/* add carveout */
> > +			size =3D resource_size(&rsc);
> > +			mem =3D rproc_mem_entry_init(dev, NULL, rsc.start,
> > +						   (int)size, rsc.start,
> > +						   tcm_mem_alloc,
> > +						   tcm_mem_release,
> > +						   rsc.name);
> > +			if (!mem)
> > +				return -ENOMEM;
> > +
> > +			mem->priv =3D (void *)(u64)pnode_id;
> > +			rproc_add_carveout(rproc, mem);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * when loading firmware, load in needed DDR, TCM memory regions and
> wire
> > + * these into remoteproc core's carveouts
> > + */
> > +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmwa=
re
> *fw)
> > +{
> > +	int ret;
> > +
> > +	ret =3D parse_tcm_banks(rproc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D parse_mem_regions(rproc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D rproc_elf_load_rsc_table(rproc, fw);
> > +	if (ret =3D=3D -EINVAL) {
> > +		/*
> > +		 * resource table only required for IPC.
> > +		 * if not present, this is not necessarily an error;
> > +		 * for example, loading r5 hello world application
> > +		 * so simply inform user and keep going.
> > +		 */
> > +		dev_info(&rproc->dev, "no resource table found.\n");
> > +		ret =3D 0;
> > +	}
> > +	return ret;
> > +}
> > +
> > +/* kick a firmware */
> > +static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
> > +{
> > +	struct sk_buff *skb;
> > +	unsigned int skb_len;
> > +	struct zynqmp_ipi_message *mb_msg;
> > +	int ret;
> > +
> > +	struct device *dev =3D rproc->dev.parent;
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +
> > +	if (of_property_read_bool(dev->of_node, "mboxes")) {
> > +		skb_len =3D (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> > +		skb =3D alloc_skb(skb_len, GFP_ATOMIC);
> > +		if (!skb)
> > +			return;
> > +
> > +		mb_msg =3D (struct zynqmp_ipi_message *)skb_put(skb,
> skb_len);
> > +		mb_msg->len =3D sizeof(vqid);
> > +		memcpy(mb_msg->data, &vqid, sizeof(vqid));
> > +
> > +		skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
> > +		ret =3D mbox_send_message(z_rproc->tx_chan, mb_msg);
> > +		if (ret < 0) {
> > +			dev_warn(dev, "Failed to kick remote.\n");
> > +			skb_dequeue_tail(&z_rproc->tx_mc_skbs);
> > +			kfree_skb(skb);
> > +		}
> > +	} else {
> > +		(void)skb;
> > +		(void)skb_len;
> > +		(void)mb_msg;
> > +		(void)ret;
> > +		(void)vqid;
> > +	}
> > +}
> > +
> > +static struct rproc_ops zynqmp_r5_rproc_ops =3D {
> > +	.start		=3D zynqmp_r5_rproc_start,
> > +	.stop		=3D zynqmp_r5_rproc_stop,
> > +	.load		=3D rproc_elf_load_segments,
> > +	.parse_fw	=3D zynqmp_r5_parse_fw,
> > +	.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > +	.sanity_check	=3D rproc_elf_sanity_check,
> > +	.get_boot_addr	=3D rproc_elf_get_boot_addr,
> > +	.kick		=3D zynqmp_r5_rproc_kick,
> > +};
> > +
> > +/**
> > + * event_notified_idr_cb() - event notified idr callback
> > + * @id: idr id
> > + * @ptr: pointer to idr private data
> > + * @data: data passed to idr_for_each callback
> > + *
> > + * Pass notification to remoteproc virtio
> > + *
> > + * Return: 0. having return is to satisfy the idr_for_each() function
> > + *          pointer input argument requirement.
> > + **/
> > +static int event_notified_idr_cb(int id, void *ptr, void *data)
> > +{
> > +	struct rproc *rproc =3D data;
> > +
> > +	(void)rproc_vq_interrupt(rproc, id);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * handle_event_notified() - remoteproc notification work funciton
> > + * @work: pointer to the work structure
> > + *
> > + * It checks each registered remoteproc notify IDs.
> > + */
> > +static void handle_event_notified(struct work_struct *work)
> > +{
> > +	struct rproc *rproc;
> > +	struct zynqmp_r5_rproc *z_rproc;
> > +
> > +	z_rproc =3D container_of(work, struct zynqmp_r5_rproc, mbox_work);
> > +
> > +	(void)mbox_send_message(z_rproc->rx_chan, NULL);
> > +	rproc =3D z_rproc->rproc;
> > +	/*
> > +	 * We only use IPI for interrupt. The firmware side may or may
> > +	 * not write the notifyid when it trigger IPI.
> > +	 * And thus, we scan through all the registered notifyids.
> > +	 */
> > +	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
> > +}
> > +
> > +/**
> > + * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
> > + * @cl: mailbox client
> > + * @mssg: message pointer
> > + *
> > + * It will schedule the R5 notification work.
> > + */
> > +static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *mssg)
> > +{
> > +	struct zynqmp_r5_rproc *z_rproc;
> > +
> > +	z_rproc =3D container_of(cl, struct zynqmp_r5_rproc, rx_mc);
> > +	if (mssg) {
> > +		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> > +		size_t len;
> > +
> > +		ipi_msg =3D (struct zynqmp_ipi_message *)mssg;
> > +		buf_msg =3D (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
> > +		len =3D (ipi_msg->len >=3D IPI_BUF_LEN_MAX) ?
> > +		      IPI_BUF_LEN_MAX : ipi_msg->len;
> > +		buf_msg->len =3D len;
> > +		memcpy(buf_msg->data, ipi_msg->data, len);
> > +	}
> > +	schedule_work(&z_rproc->mbox_work);
> > +}
> > +
> > +/**
> > + * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
> > + * @cl: mailbox client
> > + * @mssg: pointer to the message which has been sent
> > + * @r: status of last TX - OK or error
> > + *
> > + * It will be called by the mailbox framework when the last TX has don=
e.
> > + */
> > +static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *mssg, i=
nt
> r)
> > +{
> > +	struct zynqmp_r5_rproc *z_rproc;
> > +	struct sk_buff *skb;
> > +
> > +	if (!mssg)
> > +		return;
> > +	z_rproc =3D container_of(cl, struct zynqmp_r5_rproc, tx_mc);
> > +	skb =3D skb_dequeue(&z_rproc->tx_mc_skbs);
> > +	kfree_skb(skb);
> > +}
> > +
> > +/**
> > + * zynqmp_r5_setup_mbox() - Setup mailboxes
> > + *			    this is used for each individual R5 core
> > + *
> > + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> > + * @node: pointer of the device node
> > + *
> > + * Function to setup mailboxes to talk to RPU.
> > + *
> > + * Return: 0 for success, negative value for failure.
> > + */
> > +static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
> > +				struct device_node *node)
> > +{
> > +	struct mbox_client *mclient;
> > +
> > +	/* Setup TX mailbox channel client */
> > +	mclient =3D &z_rproc->tx_mc;
> > +	mclient->rx_callback =3D NULL;
> > +	mclient->tx_block =3D false;
> > +	mclient->knows_txdone =3D false;
> > +	mclient->tx_done =3D zynqmp_r5_mb_tx_done;
> > +	mclient->dev =3D z_rproc->dev;
> > +
> > +	/* Setup TX mailbox channel client */
> > +	mclient =3D &z_rproc->rx_mc;
> > +	mclient->dev =3D z_rproc->dev;
> > +	mclient->rx_callback =3D zynqmp_r5_mb_rx_cb;
> > +	mclient->tx_block =3D false;
> > +	mclient->knows_txdone =3D false;
> > +
> > +	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
> > +
> > +	/* Request TX and RX channels */
> > +	z_rproc->tx_chan =3D mbox_request_channel_byname(&z_rproc-
> >tx_mc, "tx");
> > +	if (IS_ERR(z_rproc->tx_chan)) {
> > +		dev_err(z_rproc->dev, "failed to request mbox tx channel.\n");
> > +		z_rproc->tx_chan =3D NULL;
> > +		return -EINVAL;
> > +	}
> > +
> > +	z_rproc->rx_chan =3D mbox_request_channel_byname(&z_rproc-
> >rx_mc, "rx");
> > +	if (IS_ERR(z_rproc->rx_chan)) {
> > +		dev_err(z_rproc->dev, "failed to request mbox rx channel.\n");
> > +		z_rproc->rx_chan =3D NULL;
> > +		return -EINVAL;
> > +	}
> > +	skb_queue_head_init(&z_rproc->tx_mc_skbs);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
> > + *		       this is called for each individual R5 core to
> > + *		       set up mailbox, Xilinx platform manager unique ID,
> > + *		       add to rproc core
> > + *
> > + * @pdev: domain platform device for current R5 core
> > + * @node: pointer of the device node for current R5 core
> > + * @rpu_mode: mode to configure RPU, split or lockstep
> > + * @core: Xilinx specific remoteproc structure used later to link
> > + *           in to cluster of cores
> > + *
> > + * Function to retrieve the information of the ZynqMP R5 device node.
> > + *
> > + * Return: 0 for success, negative value for failure.
> > + */
> > +static int zynqmp_r5_probe(struct platform_device *pdev,
> > +			   struct device_node *node,
> > +			   enum rpu_oper_mode rpu_mode,
> > +			   struct zynqmp_r5_rproc **core)
> > +{
> > +	int ret;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct rproc *rproc_ptr;
> > +	struct zynqmp_r5_rproc *z_rproc;
> > +
> > +	/* Allocate remoteproc instance */
> > +	rproc_ptr =3D devm_rproc_alloc(dev, dev_name(dev),
> &zynqmp_r5_rproc_ops,
> > +				     NULL, sizeof(struct zynqmp_r5_rproc));
> > +	if (!rproc_ptr)
> > +		return -ENOMEM;
> > +	rproc_ptr->auto_boot =3D false;
> > +	z_rproc =3D rproc_ptr->priv;
> > +	z_rproc->rproc =3D rproc_ptr;
> > +	z_rproc->dev =3D dev;
> > +	/* Set up DMA mask */
> > +	ret =3D dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> > +	if (ret)
> > +		goto error;
> > +	/* Get R5 power domain node */
> > +	ret =3D of_property_read_u32(node, "pnode-id", &z_rproc->pnode_id);
> > +	if (ret)
> > +		goto error;
> > +
> > +	ret =3D r5_set_mode(z_rproc, rpu_mode);
> > +	if (ret)
> > +		goto error;
> > +
> > +	if (of_property_read_bool(node, "mboxes")) {
> > +		ret =3D zynqmp_r5_setup_mbox(z_rproc, node);
> > +		if (ret)
> > +			goto error;
> > +	}
> > +	/* Add R5 remoteproc */
> > +	ret =3D devm_rproc_add(dev, rproc_ptr);
> > +	if (ret)
> > +		goto error;
> > +	*core =3D z_rproc;
> > +
> > +error:
> > +	return ret;
> > +}
> > +
> > +/*
> > + * called when driver is probed, for each R5 core specified in DT,
> > + * setup as needed to do remoteproc-related operations
> > + */
> > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > +{
> > +	int ret, i;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *nc;
> > +	enum rpu_oper_mode rpu_mode;
> > +	struct list_head *cluster; /* list to track each core's rproc */
> > +	struct zynqmp_r5_rproc *z_rproc;
> > +	struct platform_device *child_pdev;
> > +	struct list_head *pos;
> > +
> > +	rpu_mode =3D of_property_read_bool(dev->of_node, "lockstep-mode")
> ?
> > +		   PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
> > +	dev_dbg(dev, "RPU configuration: %s\n",
> > +		rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP ? "lockstep" :
> "split");
> > +
> > +	/*
> > +	 * if 2 RPUs provided but one is lockstep, then we have an
> > +	 * invalid configuration.
> > +	 */
> > +	i =3D of_get_available_child_count(dev->of_node);
> > +	if ((rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP && i !=3D 1) || i >
> MAX_RPROCS)
> > +		return -EINVAL;
> > +
> > +	cluster =3D devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
> > +	if (!cluster)
> > +		return -ENOMEM;
> > +	INIT_LIST_HEAD(cluster);
> > +
> > +	ret =3D devm_of_platform_populate(dev);
> > +	if (ret) {
> > +		dev_err(dev, "devm_of_platform_populate failed, ret =3D
> %d\n",
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	/* probe each individual r5 core's remoteproc-related info */
> > +	i =3D 0;
> > +	for_each_available_child_of_node(dev->of_node, nc) {
> > +		child_pdev =3D of_find_device_by_node(nc);
> > +		if (!child_pdev) {
> > +			dev_err(dev, "could not get R5 core platform
> device\n");
> > +			ret =3D -ENODEV;
> > +			goto out;
> > +		}
> > +		ret =3D zynqmp_r5_probe(child_pdev, nc, rpu_mode, &z_rproc);
> > +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> > +			ret ? "Failed" : "Able",
> > +			nc);
> > +		if (!z_rproc)
> > +			ret =3D -EINVAL;
> > +		if (ret)
> > +			goto out;
> > +
> > +		put_device(&child_pdev->dev);
> > +		list_add_tail(&z_rproc->elem, cluster);
> > +		i++;
> > +	}
> > +	/* wire in so each core can be cleaned up at drive remove */
> > +	platform_set_drvdata(pdev, cluster);
> > +	return 0;
> > +out:
> > +	/* undo core0 upon any failures on core1 in split-mode */
> > +	if (rpu_mode =3D=3D PM_RPU_MODE_SPLIT && i =3D=3D 1 && ret !=3D 0) {
> > +		list_for_each(pos, cluster) {
> > +			z_rproc =3D list_entry(pos, struct zynqmp_r5_rproc,
> elem);
> > +			if (of_property_read_bool(z_rproc->dev->of_node,
> "mboxes")) {
> > +				mbox_free_channel(z_rproc->tx_chan);
> > +				mbox_free_channel(z_rproc->rx_chan);
> > +			}
> > +		}
> > +	}
> > +	return ret;
> > +}
> > +
> > +/*
> > + * for each core, clean up the following:
> > + *	single rproc entry
> > + *	mailbox tx, rx
> > + */
> > +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> > +{
> > +	struct list_head *pos, *cluster =3D (struct list_head *)
> > +					  platform_get_drvdata(pdev);
> > +	struct zynqmp_r5_rproc *z_rproc =3D NULL;
> > +
> > +	list_for_each(pos, cluster) {
> > +		z_rproc =3D list_entry(pos, struct zynqmp_r5_rproc, elem);
> > +
> > +		mbox_free_channel(z_rproc->tx_chan);
> > +		mbox_free_channel(z_rproc->rx_chan);
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* Match table for OF platform binding */
> > +static const struct of_device_id zynqmp_r5_remoteproc_match[] =3D {
> > +	{ .compatible =3D "xlnx,zynqmp-r5-remoteproc", },
> > +	{ /* end of list */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> > +
> > +static struct platform_driver zynqmp_r5_remoteproc_driver =3D {
> > +	.probe =3D zynqmp_r5_remoteproc_probe,
> > +	.remove =3D zynqmp_r5_remoteproc_remove,
> > +	.driver =3D {
> > +		.name =3D "zynqmp_r5_remoteproc",
> > +		.of_match_table =3D zynqmp_r5_remoteproc_match,
> > +	},
> > +};
> > +module_platform_driver(zynqmp_r5_remoteproc_driver);
> > +
> > +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.17.1
> >
