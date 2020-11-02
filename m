Return-Path: <SRS0=xJOp=EI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B92C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 21:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B630A21D40
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 21:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="XH5Qszr7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgKBVqp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 16:46:45 -0500
Received: from mail-mw2nam10on2053.outbound.protection.outlook.com ([40.107.94.53]:7490
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725883AbgKBVqo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 16:46:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfhK3xvFkAurELt3uVVLyvSND1SAhvZTuoQn/ETx5juMg0mK8WztbFqsQQ/MQEcyPS88erJ+DaCbPkILSA2bAPNFtlEZFXOUO3Wgz8xFVQ15LomJrEpy7rptNHzSaBUSz3m7xVkZEtIOEinOGhU6pTKXdhy4zzGCLECVbFUucapXshoBEZPuKyBqVRqYeDC+d3dQZLEsFGzHNq4fRmUVoSoKVVtU0ELqsSEh0DsiGu/PGpbovGMWej4N3uxx+ashTZMBxAVqafKA1wRk2jxrV8hQgV2iMRj8btRHoPKxqALVFD/a8O933d8AUVWAtg8QZDgvo5I5bp7ZJLgM6i3mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw/g6v6GDYfxyI/avg2HBRwIm4x69U3WVPGkGr/ZoM4=;
 b=EEPY+jsCsBq9/oazY0jiuM3eNxotXe7F7wXiRKaMYPwLWm9VYeEC3KC8K4luy9w7897vpW6hcop3cbDKilafLVzgP6cj0xKqJrYG7Ri9/FsI3jVOaqMnTQpF/J9drehRzKRvl1V7YJu9r7xqK4ZAVpGyDo1yJvUT5jnKdpqIcL51qqti282beRN4gbsE7MeZrfyyMzzsu3PYQnM7hLpOU+9lSa96wzAeDIeLbcK5oZNsHJLJKVpi9VS6H+OcB6D0spY1EDL/vLWtcYtKLnLm4eZ0N3RRQcV92m1rhqUuV2WXhxl8wXJtP/W3DlD47adp/A/t8as0wmagEx59li4cQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw/g6v6GDYfxyI/avg2HBRwIm4x69U3WVPGkGr/ZoM4=;
 b=XH5Qszr7MsRY7tRCK67I+1casl9F8icIPS4lT2m4nTQBXAqdXNZdcOCtNlFizBgpkeOIv/XrbgbZ5m2PtCjmWDeI1APmcfbxU9xGIXPaTWkNwgO4GewT+1cPX7/gaWeaLJ+GgLZq5HmAAtg5dYbluTXq29ee1/YiMj/u+aRTGMY=
Received: from SN6PR02MB4416.namprd02.prod.outlook.com (2603:10b6:805:a4::28)
 by SN6PR02MB5357.namprd02.prod.outlook.com (2603:10b6:805:75::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 21:46:28 +0000
Received: from SN6PR02MB4416.namprd02.prod.outlook.com
 ([fe80::400a:d351:b909:dab6]) by SN6PR02MB4416.namprd02.prod.outlook.com
 ([fe80::400a:d351:b909:dab6%5]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 21:46:28 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>
CC:     Stefano Stabellini <stefanos@xilinx.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v21 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v21 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWsU/eMnYr/NoJsEaOY6K9Kj9e16m1V2qAgAAFdJA=
Date:   Mon, 2 Nov 2020 21:46:28 +0000
Message-ID: <SN6PR02MB44160323EF1F88692AF337BAB5100@SN6PR02MB4416.namprd02.prod.outlook.com>
References: <20201102193859.31090-1-ben.levinsky@xilinx.com>
 <20201102193859.31090-6-ben.levinsky@xilinx.com>
 <20201102211333.GC6782@xaphan>
In-Reply-To: <20201102211333.GC6782@xaphan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 984a0299-ac87-45bf-a675-08d87f78c104
x-ms-traffictypediagnostic: SN6PR02MB5357:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB5357F874BCC220512FC49287B5100@SN6PR02MB5357.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FXyuDo503GvVtkqS3ZOFeGnKH2xlcG10WFZzMSQOlQsFCsEKArolftO8ZIDI6dceawZfTVnFnuglYPl5j/U0uJy5jR181ZcsOJHl+udcua+vT2myTh6+CWoTvRaAPDT2ntZhRpQV9rDFCm2RThaiDel0bNJz/XmAGFwSCoRix3F0KEBvaQuGlg3AENIEZ/8TAWCIl9jqBRZQOr0elYHcMBjQms6WLi2WLTbPl7Y/jTZfq/WwD0eNgg0gwSiPTJtA90PJpiuWWMfdNQgXStAbbuBjzmvv+Gf7TOkiwvxMb62Bll9LTw6yZITKlXj666cw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4416.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(478600001)(316002)(5660300002)(54906003)(30864003)(83380400001)(71200400001)(186003)(6506007)(26005)(7696005)(53546011)(6916009)(66556008)(64756008)(66446008)(66476007)(52536014)(66946007)(76116006)(33656002)(55016002)(8936002)(8676002)(2906002)(4326008)(86362001)(9686003)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xlbat1f1Zy+lO0vxvgHOKop7siw9G1f7JBQepHUgJC9W/QSU7nDfc/ds09I1SMOA7zsu3cBOA6EdW088Mrdnw1kFA8sVkMhOImugfDGhGI9tj1QWUP3zG6tuJ2pV3C7zCFKZjx64BuOVndh7W50f1s6j4qjZfS094lnfalosCPnmCsEtJQgP/s7WLOjrPJwxv5EEKZZCs910kd2hN9JgkkySP58Y66FTt9Y0rPuerFxYcl9wC7ih3ZWCPcPJkmOY3kkWCuB43DcC5UvjZjTGT1YlOC0zLmbrZcspgq3qC+/abKkzC2VFDXiZhxRetI2fS4jFVh+/5kHkwzn8HhFEn7t1yIJva9VaWVWrzphFJnQKg0FHZVs/mrbQMbYl8VToawPAlM/5uAhbVKmwS3QW7l3RXFZoliVdQ6MxGsY5oOpASFVx1/L6V4E9XP14COQlGXE/z9okBPlA+N7yhwaZYTa+qZr0rBHQSnB3LOD2fbcCsngPcFuPbsBR8odcC6ghZCvBcVAKOzRK1eYqdpoy0bSBU820KIc/16QXkRVAEa42mv9kwVpRZJlG99EqWGgwiBt4sddvgHB+PaDXIGsiYOOQQ3seZeq/+xBgAogUMt3WrSLcMrz2Fs4jC/FXOZTbuwFsaiVXqmZOCqtDG3U3nA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4416.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984a0299-ac87-45bf-a675-08d87f78c104
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 21:46:28.2556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJNEQWNGjv1fgphOysedA1lyOD/x9bt5DHK1UajoOGr7uDrDZcSQYQ8yP3PUkK02HS2PGtoicB/lUrcjRTMrXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5357
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Michael,

> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Monday, November 2, 2020 1:14 PM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: Stefano Stabellini <stefanos@xilinx.com>; mathieu.poirier@linaro.org;
> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v21 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> On Mon, Nov 02, 2020 at 11:38:59AM -0800, Ben Levinsky wrote:
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
> > Update Xilinx R5 Remoteproc Driver as follows:
> > - update documentation for zynqmp_r5_probe
> > - restructure so that cluster initialization code is all in one place
> > - add memory allocation check for cluster
> > - add error handling in case of second core fails at probe but first co=
re
> succeeded.
> >   to clean up the first core
> > - remove unneeded lines in zynqmp_r5_remoteproc_remove
> > ---
> >
> >  drivers/remoteproc/Kconfig                |   8 +
> >  drivers/remoteproc/Makefile               |   1 +
> >  drivers/remoteproc/zynqmp_r5_remoteproc.c | 784
> ++++++++++++++++++++++
> >  3 files changed, 793 insertions(+)
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
> > index 000000000000..993bd72e5664
> > --- /dev/null
> > +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > @@ -0,0 +1,784 @@
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
> > +	skb_len =3D (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> > +	skb =3D alloc_skb(skb_len, GFP_ATOMIC);
> > +	if (!skb)
> > +		return;
> > +
> > +	mb_msg =3D (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
> > +	mb_msg->len =3D sizeof(vqid);
> > +	memcpy(mb_msg->data, &vqid, sizeof(vqid));
> > +	skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
> > +	ret =3D mbox_send_message(z_rproc->tx_chan, mb_msg);
> > +	if (ret < 0) {
> > +		dev_warn(dev, "Failed to kick remote.\n");
> > +		skb_dequeue_tail(&z_rproc->tx_mc_skbs);
> > +		kfree_skb(skb);
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
> > + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> > + * @pdev: domain platform device for current R5 core
> > + * @node: pointer of the device node for current R5 core
> > + * @rpu_mode: mode to configure RPU, split or lockstep
> > + * @core: Xilinx specific remoteproc structure used later to link
> > + *           in to cluster of cores
>=20
> This still does not match the param list (there's no z_rproc)
>=20
Isn't core in this context the z_rproc? I can change the argument name if t=
hat is what you mean
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
> > +	/* dev here is parent device of the allocated rproc's dev field */
> > +	rproc_ptr =3D rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
> > +				NULL, sizeof(struct zynqmp_r5_rproc));
> > +	if (!rproc_ptr)
> > +		return -ENOMEM;
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
> > +		return ret;
>=20
> goto error?
>=20
Ok will change
> > +
> > +	if (of_property_read_bool(node, "mboxes")) {
> > +		ret =3D zynqmp_r5_setup_mbox(z_rproc, node);
> > +		if (ret)
> > +			goto error;
> > +	}
> > +	/* Add R5 remoteproc */
> > +	ret =3D rproc_add(rproc_ptr);
> > +	if (ret)
> > +		goto error;
> > +	*core =3D z_rproc;
> > +
> > +	return 0;
> > +error:
> > +	if (z_rproc->rproc)
>=20
> How would this ever be NULL?
Ok will change
>=20
> > +		rproc_free(z_rproc->rproc);
> > +	z_rproc->rproc =3D NULL;
>=20
> This looks like another use-after-free, but it also seems unnecessary.
Ok will change
>=20
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
> > +		list_add_tail(&z_rproc->elem, cluster);
> > +		i++;
> > +	}
> > +	/* wire in so each core can be cleaned up at drive remove */
> > +	platform_set_drvdata(pdev, cluster);
> > +	ret =3D 0;
>=20
> Just return 0 here instead of resetting ret.
Ok will change
>=20
> > +out:
> > +	/* undo core0 upon any failures on core1 in split-mode */
> > +	if (rpu_mode =3D=3D PM_RPU_MODE_SPLIT && i =3D=3D 1 && ret !=3D 0) {
> > +		z_rproc =3D container_of(cluster, struct zynqmp_r5_rproc,
> elem);
>=20
> This looks very wrong to me; cluster isn't a pointer to member of
> zynqmp_r5_rproc. Was this path tested?
>=20
It was tested and ran, but Ok will change
> > +		if (z_rproc->rproc) {
>=20
> How would z_rproc->rproc be NULL here?

Good point, will remove this check
>=20
> > +			rproc_del(z_rproc->rproc);
> > +			rproc_free(z_rproc->rproc);
> > +		}
> > +
> > +		if (z_rproc->tx_chan)
> > +			mbox_free_channel(z_rproc->tx_chan);
> > +		if (z_rproc->rx_chan)
> > +			mbox_free_channel(z_rproc->rx_chan);
>=20
> Again, this looks like a use-after-free.
>=20
Ok will change
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
> > +	struct rproc *rproc =3D NULL;
> > +
> > +	list_for_each(pos, cluster) {
> > +		z_rproc =3D list_entry(pos, struct zynqmp_r5_rproc, elem);
> > +		rproc =3D z_rproc->rproc;
> > +		if (rproc) {
> > +			rproc_del(rproc);
> > +			rproc_free(rproc);
> > +		}
> > +
> > +		if (z_rproc->tx_chan)
> > +			mbox_free_channel(z_rproc->tx_chan);
> > +		if (z_rproc->rx_chan)
> > +			mbox_free_channel(z_rproc->rx_chan);
>=20
> The use-after-free issue I pointed out on v20 is still present here (and
> has now been replicated in probe() as well).
>=20
So for this and the other mbox_free_channel call, is it alright to check if=
 the mbox property is in the z_rproc pointer's dev->of_node? If so then the=
 setup_mbox was called and ran ok if the driver got this far.
E.g.	 if (of_property_read_bool(z_rproc->dev->of_node, "mboxes")) {

[...]

Thanks
Ben
