Return-Path: <SRS0=nrb/=DJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D0FC4363D
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Oct 2020 19:07:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0887A20795
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Oct 2020 19:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="bnw9q30B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgJBTH6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Oct 2020 15:07:58 -0400
Received: from mail-eopbgr750074.outbound.protection.outlook.com ([40.107.75.74]:32131
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725991AbgJBTH6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Oct 2020 15:07:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1py0wT9YCHfEEJtOWM6Qj/u8ts+02FP4+W0jhcnoFe9vXsO3ENF3Hg3iez7Hvljj6PSmaglzIcP9XZAYcm7XIysWpS8KpVm7X5bYi4BVpUTfk9RVQEslLEZ+GtVS3kAksw3v8tTc6qAKQYhxiDGydnab3rOc7AQXXU3XIRIGUFRkCV9qyRynWvfvBCvY7RZnnPbV2BJm86eVMQhDvW1iiEBrLhEAAU4rPiRghG0IW5ohvIEQTaX8XV3+fGv6VDpOW8YOJtr3hnRmRgvje3Tj4ECjPjzQ9hh98YMCC4wTqnGzibuJGpd3Vky2dH35tqhHdofYEGSR1MwzEFao+JIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aPzaZ16KgB/0OGYZeTjTpAN0dD5KID4cWpumsOZi6c=;
 b=eW8ZxXU/4JO/qfCb+d7Rd/wnEPOiGF+/p+x2anXLho0GGe/WoSDrhoIkwqBqZyc80wJDaBbsD1YTm3N/bBMB7ZZtkiyFJNFB8A8RtOkszkj8U/lD91+2wkZr9geZMbvyvCnsLg22D1f5or2zvRD8Ht+od7Fu7Tf99S6+t9LVQaohMk+S9XafdtGsIZ/AAFaHuKicAn2ZF1Lpo+lF7Qy7eOCN++guos8Zm64wX/5SmR61yJz1QBOwR4AjCVrfVW8S+0J7yDrNu3kBuNBcXcRxtTgiB6SFr2kn2V3dO4LztyZuPnBDzKbzMBA6hKicqvZueKR+vX8aT4S0/Exvd/hLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aPzaZ16KgB/0OGYZeTjTpAN0dD5KID4cWpumsOZi6c=;
 b=bnw9q30Bb2QOglM9HvFs2PGC1qK2I4oOP0ziGQn8KgswWE6piItpwPUCeUTiodU5gK1NYzDdhbCuuVXo1o0mDGp0oOzKFSUC9CWTcTUAIFOxW16DFCvytc0i/NutenwukHxhszAen8wYPOxrbEnu/LD2ptj8jrAXBl9QUcm/fiI=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BYAPR02MB5991.namprd02.prod.outlook.com (2603:10b6:a03:118::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 19:07:50 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e%6]) with mapi id 15.20.3433.038; Fri, 2 Oct 2020
 19:07:50 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v17 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v17 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWmDbDpqn2QjgPZEiEnqxkV3l5xKmEq9iAgAABhEA=
Date:   Fri, 2 Oct 2020 19:07:49 +0000
Message-ID: <BYAPR02MB4407F1C2E54353F74E1FD952B5310@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20201001210541.32042-1-ben.levinsky@xilinx.com>
 <20201001210541.32042-6-ben.levinsky@xilinx.com>
 <20201002185921.GA489187@xaphan>
In-Reply-To: <20201002185921.GA489187@xaphan>
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
x-ms-office365-filtering-correlation-id: 30d9dae0-d15c-42f1-19f5-08d8670674d0
x-ms-traffictypediagnostic: BYAPR02MB5991:
x-microsoft-antispam-prvs: <BYAPR02MB5991827E04756B1F128A064BB5310@BYAPR02MB5991.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NSHGevdve7ewMmMhmiVcYie01XaAdEWOV9d8Tawce24ZHSel5LKfzw2DwbSVI/qoYhPSCY1nqjmSvHiLsTHcQ5eu4DwgOUmYVaKasHrHmQtog0zs1qdUKFxgPMmwcd2BMES/HoHtPwwAj3iSlbd43IfugeHpFJaU2O1OxIksr6Nql++evkhx/TsPFGyfc8xvwRYSR9wadbuyqxCbZQbm8WpS84FLo2QIfbljukt15X6MlKuh8LnxU5P33j9ppG7xkONChM7rYkAP7amz9DBvzztzqbKmEb/aUiX+EXf9L0toztO4ZcILD3VPXIE/MiOD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(396003)(346002)(136003)(54906003)(316002)(6506007)(6916009)(83380400001)(8936002)(8676002)(186003)(7696005)(5660300002)(26005)(478600001)(4326008)(66446008)(86362001)(55016002)(9686003)(76116006)(33656002)(71200400001)(52536014)(66556008)(2906002)(30864003)(66946007)(53546011)(66476007)(64756008)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: TXzUFlaHQT3+iiH3xSHhXcEH+XGVo8KfRfDhgajHyv5LbpAyKvOOJ7XU6GcJLiKlHq3UW/FOIbVhNZ4vkkgfOvLTE9jZ0CWWAZbabWzeij9suM9+e3CCMt0MbDtQ0tzeHaWZ5BUp/zmHlmexm4rk2Xf3y0eEJ5aRiNA6thmq3ILX926ky0EXK1vrxI166vvZhbnDppzgG1wR2m+ryvUnxb+/QAS08lpzHBPbEbok4lUkjNRTrKmPOIiaR8d+LAfuFXog7fVvtDQgx9OaFEGkcQKc5288eQ1Arefh5XIXS4pts7pKJQipK7P9T6f11VirACb2ea7hmUoYarBZ6Dw7W8B8Bc2OJHaPnu0I5d3fkafkIdx5IjuApgskofBZj/kpdQA1kEWaTNJ58cPzw5XZV6imKffbngIPGAurqcVDIBXPqmv8HNjEbotN35/mGlkUfg545ypk/uaSO8I/ktgOqo1iGKG1CgOAzTmdBIvVDWEzL/Ztt65gI2jvS7K3rOZY5eiLMhfbfZ3btlqTbOtVkN6XftQCAk+BCsvGTez1SLS7u611RgT4+Is0j9mGtklFoMnkwXzRN09m1eZ/EtjQ3lyoiFCWHq6Yr6Y21h/W1LKKBLwoXC362KdPQR5G2Ca0xn6ClJD224WM/2rHKig+Ew==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d9dae0-d15c-42f1-19f5-08d8670674d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 19:07:49.7556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeY45tID+l9E4zPoNiJlefMKV4nUILJ7ZhZVOztARWiGxG6sVbH2I9gKQn/0Na2umUBb/ZZrDjZKzjMYK6cLGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5991
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Michael,=20

Thanks for the review. With the numerous sets of review, I think a few thin=
gs got lost along the way that I will make sure to get encompassed in the n=
ext revision

- in bindings example, remove the '-1.0'
- remove the global rpu_mode var
	^ the above I had thought was in v16 so sorry about that...

Otherwise I will fix up the memory management that is occurring in the driv=
er as you describe.

Again thank you!
Ben

> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Friday, October 2, 2020 11:59 AM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: sunnyliangjy@gmail.com; punit1.agrawal@toshiba.co.jp; Stefano Stabell=
ini
> <stefanos@xilinx.com>; Michal Simek <michals@xilinx.com>;
> devicetree@vger.kernel.org; mathieu.poirier@linaro.org; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
> robh+dt@kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v17 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> Hey Ben,
>=20
> On Thu, Oct 01, 2020 at 02:05:41PM -0700, Ben Levinsky wrote:
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
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> > v2:
> >  - remove domain struct as per review from Mathieu
> >  v3:
> >  - add xilinx-related platform mgmt fn's instead of wrapping around
> >    function pointer in xilinx eemi ops struct
> >  v4:
> >  - add default values for enums
> >  - fix formatting as per checkpatch.pl --strict. Note that 1 warning an=
d 1
> check
> >    are still raised as each is due to fixing the warning results in tha=
t
> >  particular line going over 80 characters.
> >  v5:
> >  - parse_fw change from use of rproc_of_resm_mem_entry_init to
> >  rproc_mem_entry_init and use of alloc/release
> >  - var's of type zynqmp_r5_pdata all have same local variable name
> >  - use dev_dbg instead of dev_info
> >  v6:
> >  - adding memory carveouts is handled much more similarly. All mem
> >  carveouts are
> >    now described in reserved memory as needed. That is, TCM nodes are n=
ot
> >    coupled to remoteproc anymore. This is reflected in the remoteproc R=
5
> >  driver
> >    and the device tree binding.
> >  - remove mailbox from device tree binding as it is not necessary for e=
lf
> >    loading
> >  - use lockstep-mode property for configuring RPU
> >  v7:
> >  - remove unused headers
> >  - change  u32 *lockstep_mode ->  u32 lockstep_mode;
> >  - change device-tree binding "lockstep-mode"  to xlnx,cluster-mode
> >  - remove zynqmp_r5_mem_probe and loop to Probe R5 memory devices at
> >    remoteproc-probe time
> >  - remove is_r5_mode_set from  zynqmp rpu remote processor private data
> >  - do not error out if no mailbox is provided
> >  - remove zynqmp_r5_remoteproc_probe call of platform_set_drvdata as
> >  pdata is
> >    handled in zynqmp_r5_remoteproc_remove
> > v8:
> >  - remove old acks, reviewed-by's in commit message
> > v9:
> > - as mboxes are now optional, if pdata->tx_mc_skbs not initialized then
> >   do not call skb_queue_empty
> > - update usage for zynqmp_pm_set_rpu_mode,
> zynqmp_pm_set_tcm_config and
> >   zynqmp_pm_get_rpu_mode
> > - update 5/5 patch commit message to document supported configurations
> >   and how they are booted by the driver.
> > - remove copyrights other than SPDX from zynqmp_r5_remoteproc.c
> > - compilation warnings no longer raised
> > - remove unused includes from zynqmp_r5_remoteproc.c
> > - remove unused  var autoboot from zynqmp_r5_remoteproc.c
> > - reorder zynqmp_r5_pdata fpr small mem savings due to alignment
> > - use of zynqmp_pm_set_tcm_config now does not have
> >   output arg
> > - in tcm handling, unconditionally use &=3D 0x000fffff mask since all n=
odes
> >   in this fn are for tcm
> > - update comments for translating dma field in tcm handling to device
> >   address
> > - update calls to rproc_mem_entry_init in parse_mem_regions so that the=
re
> >   are only 2 cases for types of carveouts instead of 3
> > - in parse_mem_regions, check if device tree node is null before using =
it
> > - add example device tree nodes used in parse_mem_regions and tcm
> parsing
> > - add comment for vring id node length
> > - add check for string length so that vring id is at least min length
> > - move tcm nodes from reserved mem to instead own device tree nodes
> >    and only use them if enabled in device tree
> > - add comment for explaining handling of rproc_elf_load_rsc_table
> > - remove obsolete check for "if (vqid < 0)" in zynqmp_r5_rproc_kick
> > - remove unused field mems in struct zynqmp_r5_pdata
> > - remove call to zynqmp_r5_mem_probe and the fn itself as tcm handling
> >   is done by zyqmp_r5_pm_request_tcm
> > - remove obsolete setting of dma_ops and parent device dma_mask
> > - remove obsolete use of of_dma_configure
> > - add comment for call to r5_set_mode fn
> > - make mbox usage optional and gracefully inform user via dev_dbg if no=
t
> >   present
> > - change var lockstep_mode from u32* to u32
> > v11:
> > - use enums instead of u32 where possible in zynqmp_r5_remoteproc
> > - update usage of zynqmp_pm_set/get_rpu_mode and
> zynqmp_pm_set_tcm_config
> > - update prints to not use carriage return, just newline
> > - look up tcm banks via property in r5 node instead of string name
> > - print device tree nodes with %pOF instead of %s with node name field
> > - update tcm release to unmap VA
> > - handle r5-1 use case
> > v12:
> > - update signed off by so that latest developer name is last
> > - do not cast enums to u32s for zynqmp_pm* functions
> > v14:
> > - change zynqmp_r5_remoteproc::rpus and rpu_mode to static
> > - fix typo
> > - zynqmp_r5_remoteproc::r5_set_mode set rpu mode from
> >   property specified in device tree
> > - use u32 instead of u32* to store in remoteproc memory entry private d=
ata
> >   for pnode_id information
> > - always call r5_set_mode on probe
> > - remove alloc of zynqmp_r5_pdata in
> >   zynqmp_r5_remoteproc::zynqmp_r5_remoteproc_probe as there is static
> >   allocation already
> > - error at probe time if lockstep-mode property not present in device t=
ree
> > - update commit message as per review
> > - remove dependency on MAILBOX in makefile as ZYNQMP_IPI_MBOX is
> present
> > - remove unused macros
> > - update comment ordering of zynqmp_r5_pdata to match struct definition
> > - zynqmp_r5_remoteproc::tcm_mem_release error if pnode id is invalid
> > - remove obsolete TODOs
> > - only call zynqmp_r5_remoteproc::zynqmp_r5_probe if the index is valid
> > - remove uneven dev_dbg/dev_err fn calls
> > v15:
> > - if lockstep mode prop is present, then RPU cluster is in lockstep mod=
e.
> >   if not present, cluster is in split mode.
> > - if 2 RPUs provided but one is lockstep then error out as this is inva=
lid
> >   configuration
> > v16:
> > - replace of_get_property(dev->of_node, "lockstep-mode" with
> >   of_property_read_bool
> > - propagate rpu mode specified in device tree through functions instead
> >   of holding a global, static var
> > - check child remoteproc nodes via of_get_available_child_count before
> >   looping through children
> > - replace check of "pdata->pnode_id =3D=3D 0" instead by checking rpu's
> >   zynqmp_r5_pdata* if NULL
> > - remove old, obsolete checks for dma_pools in
> zynqmp_r5_remoteproc_remove
> > - change rpus from zynqmp_r5_pdata[] to zynqmp_r5_pdata*[] so that
> >   check for pdata->pnode_id =3D=3D 0 is not needed
> > v17:
> > - fix style as per kernel test bot
> > ---
> >  drivers/remoteproc/Kconfig                |   8 +
> >  drivers/remoteproc/Makefile               |   1 +
> >  drivers/remoteproc/zynqmp_r5_remoteproc.c | 778
> ++++++++++++++++++++++
> >  3 files changed, 787 insertions(+)
> >  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> >
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index c6659dfea7c7..68e567c5375c 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
> >  	  It's safe to say N here if you're not interested in utilizing
> >  	  the DSP slave processors.
> >
> > +config ZYNQMP_R5_REMOTEPROC
> > +	tristate "ZynqMP_R5 remoteproc support"
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
> > index 000000000000..eacda5b3bbe7
> > --- /dev/null
> > +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > @@ -0,0 +1,778 @@
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
> > +#define BANK_LIST_PROP "meta-memory-regions"
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
> > + * struct zynqmp_r5_pdata - zynqmp rpu remote processor private data
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
> > + */
> > +struct zynqmp_r5_pdata {
> > +	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
> > +	struct mbox_client tx_mc;
> > +	struct mbox_client rx_mc;
> > +	struct work_struct mbox_work;
> > +	struct sk_buff_head tx_mc_skbs;
> > +	struct device dev;
> > +	struct rproc *rproc;
> > +	struct mbox_chan *tx_chan;
> > +	struct mbox_chan *rx_chan;
> > +	u32 pnode_id;
> > +};
> > +
> > +/**
> > + * table of RPUs
> > + */
> > +static struct zynqmp_r5_pdata *rpus[MAX_RPROCS];
> > +/**
> > + * RPU core configuration
> > + */
> > +static enum rpu_oper_mode rpu_mode;
>=20
> Hm, the changelog says: "propagate rpu mode specified in device tree
> through functions instead of holding a global, static var" but it looks
> like that wasn't done.
>=20
> > +
> > +/*
> > + * r5_set_mode - set RPU operation mode
> > + * @pdata: Remote processor private data
> > + *
> > + * set RPU operation mode
> > + *
> > + * Return: 0 for success, negative value for failure
> > + */
> > +static int r5_set_mode(struct zynqmp_r5_pdata *pdata)
> > +{
> > +	enum rpu_tcm_comb tcm_mode;
> > +	enum rpu_oper_mode cur_rpu_mode;
> > +	int ret;
> > +
> > +	ret =3D zynqmp_pm_get_rpu_mode(pdata->pnode_id, &cur_rpu_mode);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (rpu_mode !=3D cur_rpu_mode) {
> > +		ret =3D zynqmp_pm_set_rpu_mode(pdata->pnode_id,
> > +					     rpu_mode);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	tcm_mode =3D (rpu_mode =3D=3D PM_RPU_MODE_LOCKSTEP) ?
> > +		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
> > +	return zynqmp_pm_set_tcm_config(pdata->pnode_id, tcm_mode);
> > +}
> > +
> > +/*
> > + * ZynqMP R5 remoteproc memory release function
> > + */
> > +static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry
> *mem)
> > +{
> > +	u32 pnode_id =3D (u64)mem->priv;
> > +
> > +	if (pnode_id <=3D 0)
> > +		return -EINVAL;
> > +
> > +	iounmap(mem->va);
> > +	return zynqmp_pm_release_node(pnode_id);
> > +}
> > +
> > +/*
> > + * ZynqMP R5 remoteproc operations
> > + */
> > +static int zynqmp_r5_rproc_start(struct rproc *rproc)
> > +{
> > +	struct device *dev =3D rproc->dev.parent;
> > +	struct zynqmp_r5_pdata *pdata =3D rproc->priv;
> > +	enum rpu_boot_mem bootmem;
> > +
> > +	bootmem =3D (rproc->bootaddr & 0xF0000000) =3D=3D 0xF0000000 ?
> > +		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> > +
> > +	dev_dbg(dev, "RPU boot from %s.",
> > +		bootmem =3D=3D PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> > +
> > +	return zynqmp_pm_request_wake(pdata->pnode_id, 1,
> > +				     bootmem,
> ZYNQMP_PM_REQUEST_ACK_NO);
> > +}
> > +
> > +static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> > +{
> > +	struct zynqmp_r5_pdata *pdata =3D rproc->priv;
> > +
> > +	return zynqmp_pm_force_pwrdwn(pdata->pnode_id,
> > +				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > +}
> > +
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
> > +static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
> > +				       struct rproc_mem_entry *mem)
> > +{
> > +	iounmap(mem->va);
> > +	return 0;
> > +}
> > +
> > +static int parse_mem_regions(struct rproc *rproc)
> > +{
> > +	int num_mems, i;
> > +	struct zynqmp_r5_pdata *pdata =3D rproc->priv;
> > +	struct device *dev =3D  &pdata->dev;
> > +	struct device_node *np =3D dev->of_node;
> > +	struct rproc_mem_entry *mem;
> > +
> > +	num_mems =3D of_count_phandle_with_args(np, "memory-region",
> NULL);
> > +	if (num_mems <=3D 0)
> > +		return 0;
> > +
> > +	for (i =3D 0; i < num_mems; i++) {
> > +		struct device_node *node;
> > +		struct reserved_mem *rmem;
> > +
> > +		node =3D of_parse_phandle(np, "memory-region", i);
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
> > +			if (strlen(node->name) < 14) {
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
> > +/* call Xilix Platform manager to request access to TCM bank */
>=20
> Xilinx
>=20
> > +static int zyqmp_r5_pm_request_tcm(struct device_node *tcm_node,
>=20
> zynqmp_r5_pm_request_tcm
>=20
> > +				   struct device *dev,
> > +				   u32 *pnode_id)
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
> > +/* Given tcm bank entry,
> > + * this callback will set device address for R5 running on TCM
> > + * and also setup virtual address for tcm bank remoteproc carveout
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
> > +	 * handle tcm banks 1 a and b (0xffe90000 and oxffeb0000)
> > +	 * As both of these the only common bit found not in tcm bank0 a or
> b
> > +	 * is at 0x80000 use this mask to suss it out
> > +	 */
> > +	if (mem->da & 0x80000)
> > +		/*
> > +		 * need to do more to further translate
> > +		 * tcm banks 1a and 1b at 0xffe90000 and oxffeb0000
> > +		 * respectively to 0x0 and 0x20000
> > +		 */
> > +		mem->da -=3D 0x90000;
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Given R5 node in remoteproc instance,
> > + * allocate remoteproc carveout for TCM memory
> > + * needed for firmware to be loaded
> > + */
> > +static int parse_tcm_banks(struct rproc *rproc)
> > +{
> > +	int i, num_banks;
> > +	struct zynqmp_r5_pdata *pdata =3D rproc->priv;
> > +	struct device *dev =3D &pdata->dev;
> > +	struct device_node *r5_node =3D dev->of_node;
> > +
> > +	/* go through tcm banks for r5 node */
> > +	num_banks =3D of_count_phandle_with_args(r5_node,
> BANK_LIST_PROP, NULL);
> > +	if (num_banks <=3D 0) {
> > +		dev_err(dev, "need to specify TCM banks\n");
> > +		return -EINVAL;
> > +	}
> > +
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
> > +			ret =3D zyqmp_r5_pm_request_tcm(dt_node, dev,
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
> > +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmwa=
re
> *fw)
> > +{
> > +	int ret;
> > +	struct zynqmp_r5_pdata *pdata =3D rproc->priv;
> > +	struct device *dev =3D &pdata->dev;
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
> > +		dev_info(dev, "no resource table found.\n");
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
> > +	struct zynqmp_r5_pdata *pdata =3D rproc->priv;
> > +
> > +	skb_len =3D (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> > +	skb =3D alloc_skb(skb_len, GFP_ATOMIC);
> > +	if (!skb)
> > +		return;
> > +
> > +	mb_msg =3D (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
> > +	mb_msg->len =3D sizeof(vqid);
> > +	memcpy(mb_msg->data, &vqid, sizeof(vqid));
> > +	skb_queue_tail(&pdata->tx_mc_skbs, skb);
> > +	ret =3D mbox_send_message(pdata->tx_chan, mb_msg);
> > +	if (ret < 0) {
> > +		dev_warn(dev, "Failed to kick remote.\n");
> > +		skb_dequeue_tail(&pdata->tx_mc_skbs);
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
> > + * zynqmp_r5_release() - ZynqMP R5 device release function
> > + * @dev: pointer to the device struct of ZynqMP R5
> > + *
> > + * Function to release ZynqMP R5 device.
> > + */
> > +static void zynqmp_r5_release(struct device *dev)
> > +{
> > +	struct zynqmp_r5_pdata *pdata;
> > +	struct rproc *rproc;
> > +	struct sk_buff *skb;
> > +
> > +	pdata =3D dev_get_drvdata(dev);
> > +	rproc =3D pdata->rproc;
> > +	if (rproc) {
> > +		rproc_del(rproc);
> > +		rproc_free(rproc);
> > +	}
> > +	if (pdata->tx_chan)
> > +		mbox_free_channel(pdata->tx_chan);
> > +	if (pdata->rx_chan)
> > +		mbox_free_channel(pdata->rx_chan);
> > +
> > +	/* Discard all SKBs if tx_mc_skbs is initialized */
> > +	if (&pdata->tx_mc_skbs.prev) {
>=20
> This will always be true: it's taking the address of the prev member of
> tx_mc_skbs...
>=20
> > +		while (!skb_queue_empty(&pdata->tx_mc_skbs)) {
> > +			skb =3D skb_dequeue(&pdata->tx_mc_skbs);
> > +			kfree_skb(skb);
> > +		}
> > +	}
> > +
> > +	device_unregister(dev);
>=20
> If zynqmp_r5_release is called, the refcount for dev has already dropped
> to 0... so this looks pretty suspicious.
>=20
> > +}
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
> > +	struct zynqmp_r5_pdata *pdata;
> > +
> > +	pdata =3D container_of(work, struct zynqmp_r5_pdata, mbox_work);
> > +
> > +	(void)mbox_send_message(pdata->rx_chan, NULL);
> > +	rproc =3D pdata->rproc;
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
> > +	struct zynqmp_r5_pdata *pdata;
> > +
> > +	pdata =3D container_of(cl, struct zynqmp_r5_pdata, rx_mc);
> > +	if (mssg) {
> > +		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> > +		size_t len;
> > +
> > +		ipi_msg =3D (struct zynqmp_ipi_message *)mssg;
> > +		buf_msg =3D (struct zynqmp_ipi_message *)pdata->rx_mc_buf;
> > +		len =3D (ipi_msg->len >=3D IPI_BUF_LEN_MAX) ?
> > +		      IPI_BUF_LEN_MAX : ipi_msg->len;
> > +		buf_msg->len =3D len;
> > +		memcpy(buf_msg->data, ipi_msg->data, len);
> > +	}
> > +	schedule_work(&pdata->mbox_work);
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
> > +	struct zynqmp_r5_pdata *pdata;
> > +	struct sk_buff *skb;
> > +
> > +	if (!mssg)
> > +		return;
> > +	pdata =3D container_of(cl, struct zynqmp_r5_pdata, tx_mc);
> > +	skb =3D skb_dequeue(&pdata->tx_mc_skbs);
> > +	kfree_skb(skb);
> > +}
> > +
> > +/**
> > + * zynqmp_r5_setup_mbox() - Setup mailboxes
> > + *
> > + * @pdata: pointer to the ZynqMP R5 processor platform data
> > + * @node: pointer of the device node
> > + *
> > + * Function to setup mailboxes to talk to RPU.
> > + *
> > + * Return: 0 for success, negative value for failure.
> > + */
> > +static int zynqmp_r5_setup_mbox(struct zynqmp_r5_pdata *pdata,
> > +				struct device_node *node)
> > +{
> > +	struct device *dev =3D &pdata->dev;
> > +	struct mbox_client *mclient;
> > +
> > +	/* Setup TX mailbox channel client */
> > +	mclient =3D &pdata->tx_mc;
> > +	mclient->dev =3D dev;
> > +	mclient->rx_callback =3D NULL;
> > +	mclient->tx_block =3D false;
> > +	mclient->knows_txdone =3D false;
> > +	mclient->tx_done =3D zynqmp_r5_mb_tx_done;
> > +
> > +	/* Setup TX mailbox channel client */
> > +	mclient =3D &pdata->rx_mc;
> > +	mclient->dev =3D dev;
> > +	mclient->rx_callback =3D zynqmp_r5_mb_rx_cb;
> > +	mclient->tx_block =3D false;
> > +	mclient->knows_txdone =3D false;
> > +
> > +	INIT_WORK(&pdata->mbox_work, handle_event_notified);
> > +
> > +	/* Request TX and RX channels */
> > +	pdata->tx_chan =3D mbox_request_channel_byname(&pdata->tx_mc,
> "tx");
> > +	if (IS_ERR(pdata->tx_chan)) {
> > +		dev_err(dev, "failed to request mbox tx channel.\n");
> > +		pdata->tx_chan =3D NULL;
> > +		return -EINVAL;
> > +	}
> > +	pdata->rx_chan =3D mbox_request_channel_byname(&pdata->rx_mc,
> "rx");
> > +	if (IS_ERR(pdata->rx_chan)) {
> > +		dev_err(dev, "failed to request mbox rx channel.\n");
> > +		pdata->rx_chan =3D NULL;
> > +		return -EINVAL;
> > +	}
> > +	skb_queue_head_init(&pdata->tx_mc_skbs);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
> > + * @pdata: pointer to the ZynqMP R5 processor platform data
> > + * @pdev: parent RPU domain platform device
> > + * @node: pointer of the device node
> > + *
> > + * Function to retrieve the information of the ZynqMP R5 device node.
> > + *
> > + * Return: 0 for success, negative value for failure.
> > + */
> > +static int zynqmp_r5_probe(struct zynqmp_r5_pdata *pdata,
> > +			   struct platform_device *pdev,
> > +			   struct device_node *node)
> > +{
> > +	struct rproc *rproc;
> > +	int ret;
> > +	struct device *dev =3D NULL;
> > +
> > +	pdata =3D kzalloc(sizeof(*pdata), GFP_KERNEL);
>=20
> It doesn't look like this is freed anywhere. But, see the comments
> below around rproc_alloc.
>=20
> > +	if (!pdata) {
> > +		ret =3D -ENOMEM;
> > +		goto error;
> > +	}
> > +	dev =3D &pdata->dev;
> > +
> > +	/* Create device for ZynqMP R5 device */
> > +	dev->parent =3D &pdev->dev;
> > +	dev->release =3D zynqmp_r5_release;
> > +	dev->of_node =3D node;
> > +	dev_set_name(dev, "%pOF", node);
> > +	dev_set_drvdata(dev, pdata);
> > +	ret =3D device_register(dev);
> > +	if (ret)
> > +		goto error;
>=20
> Somehow I missed this in previous reviews: why is a new device being
> created?
>=20
> > +
> > +	/* Allocate remoteproc instance */
> > +	rproc =3D rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
> NULL, sizeof(*pdata));
>=20
> Passing sizeof(*pdata) will cause rproc_alloc to allocate that much
> additional space and set the rproc->priv pointer to the start of this
> additional space, but you're not using this: below, you assign pdata to
> rproc->priv.
>=20
> I'd suggest using the space allocated by rproc_alloc, and dropping the
> kzalloc above.
>=20
> > +	if (!rproc) {
> > +		ret =3D -ENOMEM;
> > +		goto error;
> > +	}
> > +	pdata->rproc =3D rproc;
> > +	rproc->priv =3D pdata;
> > +
> > +	/* Set up DMA mask */
> > +	ret =3D dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> > +	if (ret)
> > +		goto error;
> > +
> > +	/* Get R5 power domain node */
> > +	ret =3D of_property_read_u32(node, "pnode-id", &pdata->pnode_id);
> > +	if (ret)
> > +		goto error;
> > +
> > +	ret =3D r5_set_mode(pdata);
> > +	if (ret)
> > +		goto error;
> > +
> > +	if (of_property_read_bool(node, "mboxes")) {
> > +		ret =3D zynqmp_r5_setup_mbox(pdata, node);
> > +		if (ret)
> > +			goto error;
> > +	}
> > +
> > +	/* Add R5 remoteproc */
> > +	ret =3D rproc_add(rproc);
> > +	if (ret)
> > +		goto error;
> > +
> > +	platform_set_drvdata(pdev, rproc);
>=20
> This isn't used anywhere (and doesn't seem to make sense, since it will
> either point at the only rproc (for lockstep) or the second rproc
> (split)).
>=20
> > +	return 0;
> > +error:
> > +	if (pdata->rproc)
> > +		rproc_free(pdata->rproc);
> > +	pdata->rproc =3D NULL;
> > +	if (dev)
> > +		device_unregister(dev);
> > +	return ret;
> > +}
> > +
> > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > +{
> > +	int ret, i;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *nc;
> > +
> > +	rpu_mode =3D of_property_read_bool(dev->of_node, "lockstep-mode")
> ?
> > +		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
> > +
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
> > +	i =3D 0;
> > +	for_each_available_child_of_node(dev->of_node, nc) {
> > +		/* only call zynqmp_r5_probe if proper # of rpu's */
> > +		ret =3D (i < MAX_RPROCS) ? zynqmp_r5_probe(rpus[i], pdev, nc)
> :
> > +					 -EINVAL;
>=20
> It looks like you want to store the allocated zynqmp_r5_pdata instance
> in rpus[i], but that's not happening here... So, rpus[i] will _always_
> be NULL, and the cleanup in zynqmp_r5_remoteproc_remove will never
> happen.
>=20
> The conditional here isn't necessary either, as you've already checked
> the number of child nodes above.
>=20
> > +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> > +			ret ? "Failed" : "Able",
> > +			nc);
> > +
> > +		if (ret)
> > +			return ret;
> > +
> > +		i++;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < MAX_RPROCS; i++) {
> > +		struct rproc *rproc;
> > +		struct zynqmp_r5_pdata *pdata =3D rpus[i];
> > +
> > +		if (!pdata)
> > +			continue;
> > +
> > +		rproc =3D pdata->rproc;
> > +		if (rproc) {
> > +			rproc_del(rproc);
> > +			rproc_free(rproc);
> > +			pdata->rproc =3D NULL;
> > +		}
> > +		if (pdata->tx_chan) {
> > +			mbox_free_channel(pdata->tx_chan);
> > +			pdata->tx_chan =3D NULL;
> > +		}
> > +		if (pdata->rx_chan) {
> > +			mbox_free_channel(pdata->rx_chan);
> > +			pdata->rx_chan =3D NULL;
> > +		}
> > +
> > +		device_unregister(&pdev->dev);
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> zynqmp_r5_remoteproc_remove looks like it performs many of the same
> operations as zynqmp_r5_release. This duplication look incorrect: the
> appropriate cleanup should really be done in only one place.
>=20
> > +
> > +/* Match table for OF platform binding */
> > +static const struct of_device_id zynqmp_r5_remoteproc_match[] =3D {
> > +	{ .compatible =3D "xlnx,zynqmp-r5-remoteproc", },
>=20
> This used to be "xlnx,zynqmp-r5-remoteproc-1.0"; in the binding patch,
> the example still shows "xlnx,zynqmp-r5-remoteproc-1.0", but the
> documentation for "compatible" shows "xlnx,zynqmp-r5-remoteproc".
>=20
> Which one should it be?
>=20
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
>=20
> Thanks,
>  Michael
