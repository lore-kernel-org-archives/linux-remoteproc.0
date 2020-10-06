Return-Path: <SRS0=oRpn=DN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36575C41604
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 19:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3939206B5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 19:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="kkOhrTA3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgJFTP4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Oct 2020 15:15:56 -0400
Received: from mail-dm6nam11on2053.outbound.protection.outlook.com ([40.107.223.53]:20577
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727033AbgJFTP4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Oct 2020 15:15:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnnaEmYRjJUffyzlFmWZRfbWDkMPxg2nF2TaBEkY2w9Mf+M6p9p+yvjl+HEoDBLVB2C7LbGjIqx0p54J899hhY/2gDSRotGsxozh2Rc/K2y7e/y8KBf1SS1yYrQw+Ti523X4Olqn5o1ZXW7JmeQIpDX1ynnotlF6H9DRPFQnCDvz1q15XXioQrGWxNy52rD8qjpax9wOi8dvAIFQTgZ/3yIQdDXR9n4gIo7c9LjRLnzfgko7QNjBrFM1vmPb2dRHxUpg04NYDb4dvVGJ1HxN6edVRdcsfqQi6KCObkf6ISZ8z2BuoUrvLbKe9o7n+xNPGFMUyEUuuNl9RdWEydRSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvmtNj9dym0M7VlB3noKKFQ0MIlAac2G5fNEoXDC43E=;
 b=Tk7B/j67/PF/SxTNbJee6zZo8wZx1VI0JGPkviT/raRwicn6QPBflwCFr8gvEBGFYs4AACVGEsGmM5DnVTWhVgVqJtTPSxwpa3SK/pVz+N3O62J/BKKCZIWs4DE+CmCxp3ubdhMMKFtOjqfxyhXlhJ4KUSq9brU6bnZGfEytW7n7dk3etLQwRslWTgr+rsE/p7S4aORwLd2b3T+vEe5g83KVLgrDszKlJyRD2dBwfiRvzu3fzk5LiACRUFewue8/IC1MCdewd9TRFeVnRDS13bljYT/fOstdCfkaNxDWHdyfyLEIz6wFaiB+jfcgCLSFiWv5Vld0zerqINZxtIIKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvmtNj9dym0M7VlB3noKKFQ0MIlAac2G5fNEoXDC43E=;
 b=kkOhrTA35gYXv4eZmuLenO7ztAQ5V6cUV0vq1WB+R3ZhZrIK6DSvcEPHsINvSp0TQ+maEa7S66RZQAeKAS5Cbos4ZOSG8rwnPpWFQOduZvP6h6mpkbe+Doa3N69tmQLX72XLLgZ2VxerKtZ98C1D0o9SmfCcLoSnAShj+ni2LPk=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BY5PR02MB6536.namprd02.prod.outlook.com (2603:10b6:a03:1d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Tue, 6 Oct
 2020 19:15:49 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e%6]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 19:15:49 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>
CC:     "Ed T. Mooring" <emooring@xilinx.com>,
        "sunnyliangjy@gmail.com" <sunnyliangjy@gmail.com>,
        "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWmzGLZdXOwIwjxE6bV2X+UlYToKmJZsqAgAGMKFA=
Date:   Tue, 6 Oct 2020 19:15:49 +0000
Message-ID: <BYAPR02MB4407B7F06962DB30ED90761FB50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
 <20201005160614.3749-6-ben.levinsky@xilinx.com>
 <20201005193449.GA701433@xaphan>
In-Reply-To: <20201005193449.GA701433@xaphan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [24.5.142.107]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2b083c3d-0aca-4206-c623-08d86a2c3c87
x-ms-traffictypediagnostic: BY5PR02MB6536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB65367A14BF674663184585E5B50D0@BY5PR02MB6536.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: urPVilnotB+1GAkjVQerZN+iN0ZWQpaGLW8bLr4G5yYM/rjllgwhbiBLT9FYxdWt90Oc2GdagVS/MrcDrM7CEZ6S5/St1zQhKLFjNk3x4zq6OdN6CLrj3VxXm7jaoZzL+14ChUo+X+lkBbnEqOTWHuFr5RmknuClx5iSc4BUXg1bUjvwDleiY7+bsECDZobkyQgdMtm8SYBdvE5/aDkqXGVCLxSXwjc3vYScejAtGEQH56HD0YyD70wWYgwC+xninqsl9XJ0Z+++up8VlKz3kymKfyieWk80pEKvg4/r7BB9i1p7ODaEakppy/P2bPZU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(346002)(366004)(376002)(71200400001)(5660300002)(64756008)(53546011)(6506007)(66446008)(186003)(76116006)(66946007)(66556008)(8676002)(6916009)(8936002)(66476007)(30864003)(52536014)(55016002)(83380400001)(9686003)(26005)(7696005)(86362001)(478600001)(33656002)(4326008)(54906003)(316002)(2906002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ln2kIPnHXt8wb69C+85gVtIUTUrPHokbyKZOjxQIr+kqmiksBrVfikEWnze1deKnjQAgckzi8ltIJBI4FCu8LEJAgWQeXG2ASMHOJapxXV/alVMaraKQ8Fr3evHjvDxyMKt2SauKdZSdkI0YrVLHuX47eVltdiNSDXMw3sMJlMiHwaMPVHoIaeBLOe5Rdk3a2nBa1hdTbx7tJERTx5GDEucYPH59T57amI+7uEQSVkXOXj+vbZxWgj3ZW/+AchQk4e3H01EOr2mJFBdhniMiZ4nNmc61mwYeByQoam4UC9+Btlmk1RpTG83hX/v1AuZ02zSou7mV4THGPm3H7Rmth8r0bY5zO2gP/d3nEuwB58NhmD9UrhzSUC71bf80pk+YfFh1r0lJS4diYczpj+OAAb2cVtXB1U8IfHpff8L4+UQpC9X8Cmc0bdHn0KlLMkaXnMLOQ1Vzao/qeUEODjRZJnN75TAVk324SDlnbc040/zmZZMIXnP2r2/0NC7sOYDIXeplHCxfXB+d23WjDBW/dCGgWhfdPheZnB4gA6llVybbsI6Y/2aUTW+CuS9Zg47AA0rUdglXt0GjeLrYA9ONdugbKadPnxuAWrogbP9fuuRz1aUhXJWfNDyXX1as+8NDrnAT3qU65agmoSYHAZdRIw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b083c3d-0aca-4206-c623-08d86a2c3c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 19:15:49.7612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6r7DlebaA99cuyh0KPJO98D6a3LDYPjt/eQL/rA1BMPeF/grY7SQGZBOJik5E20KBg/scmghQfRLxSLc0SUGgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6536
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


Hi Michael,

Thanks for the review

> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Monday, October 5, 2020 12:35 PM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: Ed T. Mooring <emooring@xilinx.com>; sunnyliangjy@gmail.com;
> punit1.agrawal@toshiba.co.jp; Stefano Stabellini <stefanos@xilinx.com>;
> Michal Simek <michals@xilinx.com>; devicetree@vger.kernel.org;
> mathieu.poirier@linaro.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; robh+dt@kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> Hey Ben,
>=20
> On Mon, Oct 05, 2020 at 09:06:14AM -0700, Ben Levinsky wrote:
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
> > v2:
> >  - remove domain struct as per review from Mathieu
> > v3:
> >  - add xilinx-related platform mgmt fn's instead of wrapping around
> >    function pointer in xilinx eemi ops struct
> > v4:
> >  - add default values for enums
> >  - fix formatting as per checkpatch.pl --strict. Note that 1 warning an=
d 1
> check
> >    are still raised as each is due to fixing the warning results in tha=
t
> >  particular line going over 80 characters.
> > v5:
> >  - parse_fw change from use of rproc_of_resm_mem_entry_init to
> >  rproc_mem_entry_init and use of alloc/release
> >  - var's of type zynqmp_r5_pdata all have same local variable name
> >  - use dev_dbg instead of dev_info
> > v6:
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
> > v7:
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
> > v18:
> > - to more closely mimic other remoteproc drivers, change zynqmp r5 rpro=
c
> >   data from zynqmp_r5_pdata to zynqmp_r5_rproc and pdata local var to
> >   zproc
> > - remove global vars rpus and rpu_mode
> > - instantiate device for zynqmp r5 rproc from device set by rproc_alloc
> > - fix typos
> > - update to call zynqmp_r5_release from the rproc_alloc-related device =
and
> >   remove the instantiated device from zynqmp_r5_probe
> > - remove unneeded call to platform_set_drvdata
> > - remove driver remove function, as the clean up is handled in release
> > - remove while (!skb_queue_empty loop and mbox_free_channel calls in
> >   zynqmp_r5_release, and mbox_free_channel
> > - remove device_unregister call in zynqmp_r5_release
> > - remove kzalloc for pdata (what is now called z_rproc)
> > - update conditional in loop to calls of zynqmp_r5_probe
> >
> > ---
> >  drivers/remoteproc/Kconfig                |   8 +
> >  drivers/remoteproc/Makefile               |   1 +
> >  drivers/remoteproc/zynqmp_r5_remoteproc.c | 707
> ++++++++++++++++++++++
> >  3 files changed, 716 insertions(+)
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
> > index 000000000000..37bd76252ff2
> > --- /dev/null
> > +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > @@ -0,0 +1,707 @@
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
> > + * struct zynqmp_r5_rproc - zynqmp rpu remote processor state
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
> > +struct zynqmp_r5_rproc {
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
> > +/*
> > + * r5_set_mode - set RPU operation mode
> > + * @z_rproc: Remote processor private data
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
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	enum rpu_boot_mem bootmem;
> > +
> > +	bootmem =3D (rproc->bootaddr & 0xF0000000) =3D=3D 0xF0000000 ?
> > +		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> > +
> > +	dev_dbg(dev, "RPU boot from %s.",
> > +		bootmem =3D=3D PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> > +
> > +	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
> > +				     bootmem,
> ZYNQMP_PM_REQUEST_ACK_NO);
> > +}
> > +
> > +static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> > +{
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	struct sk_buff *skb;
> > +
> > +	if (z_rproc->tx_chan)
> > +		mbox_free_channel(z_rproc->tx_chan);
> > +	if (z_rproc->rx_chan)
> > +		mbox_free_channel(z_rproc->rx_chan);
>=20
> This looks incorrect: these are requested during probe, so I would
> expect these to be free'd during remove.
>=20
> It's legal to call stop, then start again, then stop again, etc.
> Consider what would happen here in that case.
>=20
> > +	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
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
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	struct device *dev =3D  &z_rproc->dev;
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
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	struct device *dev =3D &z_rproc->dev;
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
> > +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmwa=
re
> *fw)
> > +{
> > +	int ret;
> > +	struct zynqmp_r5_rproc *z_rproc =3D rproc->priv;
> > +	struct device *dev =3D &z_rproc->dev;
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
> > + * zynqmp_r5_release() - ZynqMP R5 device release function
> > + * @dev: pointer to the device struct of ZynqMP R5
> > + *
> > + * Function to release ZynqMP R5 device.
> > + */
> > +static void zynqmp_r5_release(struct device *dev)
> > +{
> > +	struct zynqmp_r5_rproc *z_rproc;
> > +	struct rproc *rproc;
> > +
> > +	z_rproc =3D dev_get_drvdata(dev);
> > +	rproc =3D z_rproc->rproc;
> > +	if (rproc) {
> > +		rproc_del(rproc);
> > +		rproc_free(rproc);
> > +	}
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
> > +	struct device *dev =3D &z_rproc->dev;
> > +	struct mbox_client *mclient;
> > +
> > +	dev->of_node =3D node;
> > +
> > +	/* Setup TX mailbox channel client */
> > +	mclient =3D &z_rproc->tx_mc;
> > +	mclient->dev =3D dev;
> > +	mclient->rx_callback =3D NULL;
> > +	mclient->tx_block =3D false;
> > +	mclient->knows_txdone =3D false;
> > +	mclient->tx_done =3D zynqmp_r5_mb_tx_done;
> > +
> > +	/* Setup TX mailbox channel client */
> > +	mclient =3D &z_rproc->rx_mc;
> > +	mclient->dev =3D dev;
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
> > +		dev_err(dev, "failed to request mbox tx channel.\n");
> > +		z_rproc->tx_chan =3D NULL;
> > +		return -EINVAL;
> > +	}
> > +	z_rproc->rx_chan =3D mbox_request_channel_byname(&z_rproc-
> >rx_mc, "rx");
> > +	if (IS_ERR(z_rproc->rx_chan)) {
> > +		dev_err(dev, "failed to request mbox rx channel.\n");
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
> > + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> > + * @pdev: parent RPU domain platform device
> > + * @node: pointer of the device node
> > + * @rpu_mode: rpu config set by DT
> > + *
> > + * Function to retrieve the information of the ZynqMP R5 device node.
> > + *
> > + * Return: 0 for success, negative value for failure.
> > + */
> > +static int zynqmp_r5_probe(struct platform_device *pdev,
> > +			   struct device_node *node,
> > +			   enum rpu_oper_mode rpu_mode)
> > +{
> > +	struct rproc *rproc;
> > +	int ret;
> > +	struct zynqmp_r5_rproc *z_rproc;
> > +	struct device *dev =3D &pdev->dev;
> > +
> > +	/* Allocate remoteproc instance */
> > +	rproc =3D rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
> NULL, sizeof(*z_rproc));
> > +	if (!rproc) {
> > +		ret =3D -ENOMEM;
> > +		goto error;
> > +	}
>=20
> Should be just:
>=20
> 	if (!rproc)
> 		return -ENOMEM;
>=20
> As this is, if the allocation fails, z_rproc is uninitialized and the
> z_rproc->rproc deref below the error label is going to be problematic.
>=20
> > +	z_rproc =3D rproc->priv;
> > +	z_rproc->dev.release =3D zynqmp_r5_release;
>=20
> This is the only field of z_rproc->dev that's actually initialized, and
> this device is not registered with the core at all, so zynqmp_r5_release
> will never be called.
>=20
> Since it doesn't look like there's a need to create this additional
> device, I'd suggest:
> 	- Dropping the struct device from struct zynqmp_r5_rproc
> 	- Performing the necessary cleanup in the driver remove
> 	  callback instead of trying to tie it to device release

For the most part I agree. I believe the device is still needed for the mai=
lbox client setup.

As the call to mbox_request_channel_byname() requires its own device that h=
as the corresponding child node with the corresponding mbox-related propert=
ies.

With that in mind, is it still ok to keep the device node?

Thanks
Ben

> > +
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
> > +
> > +	if (of_property_read_bool(node, "mboxes")) {
> > +		ret =3D zynqmp_r5_setup_mbox(z_rproc, node);
> > +		if (ret)
> > +			goto error;
> > +	}
> > +	/* Add R5 remoteproc */
> > +	ret =3D rproc_add(rproc);
> > +	if (ret)
> > +		goto error;
> > +
> > +	return 0;
> > +error:
> > +	if (z_rproc->rproc)
> > +		rproc_free(z_rproc->rproc);
> > +	z_rproc->rproc =3D NULL;
> > +	return ret;
> > +}
> > +
> > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > +{
> > +	int ret, i;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *nc;
> > +	enum rpu_oper_mode rpu_mode;
> > +
> > +	rpu_mode =3D of_property_read_bool(dev->of_node, "lockstep-mode")
> ?
> > +		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
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
> > +	i =3D 0;
> > +	for_each_available_child_of_node(dev->of_node, nc) {
> > +		/* only call zynqmp_r5_probe if proper # of rpu's */
> > +		ret =3D zynqmp_r5_probe(pdev, nc, rpu_mode);
> > +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> > +			ret ? "Failed" : "Able",
> > +			nc);
> > +		if (ret)
> > +			return ret;
> > +		i++;
> > +	}
> > +
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
