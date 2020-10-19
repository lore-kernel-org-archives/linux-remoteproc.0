Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852E8C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:43:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBD56223FB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="R5naIYaT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732113AbgJSUnv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:43:51 -0400
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com ([40.107.93.64]:50529
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732112AbgJSUnv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:43:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHFNZi7d4Uh+cdilxmMVedn49/23uZj95ZwH3nXmmHCn8vVn4JqZLFRGe+BZ1QIs+93/vXI6qgVo7KfVPPRRlk63PMGsbp7TTwxvcTT8lBjyFIxa+s/mXl7tFQXlyhiwxxt4VFa+UnBlMdYxJezNu9FDlbahcZLiWzG4xxEoK1dMYHu/V2V/x/iU6Rmbz38hlF9/g6uPAgNOu5utkuQTy40T5JH3Xyp0fM4lY3BDVZt9kiFC2dz0SrbAaHf9ZKRohBICadlOnOWlkoVe3S7H0jh3wO3or4NMsuwDNIZf9gEIRdisWcD1otXMrT33aE67qJmwCjB5gg9wBTQJ1cSOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXRiz0r0YPSAbCs59rCUv9MJ/vfMlxgPD5orjpNu1d4=;
 b=LhHepyCfggx9POcmgXHpPLa1GL9KNysSBBwHQtLl90Sz8zgAWKCjqxZNZdgh7d5XOjrBO+BMSXJgOLQS6pKSYKNa4oxpCqOpZN6ckwNn09nvafsn1r1nQ4nhBl/sXsoFo7vhYSuLKTgHselL9HE22ACTazvrbwtP9w4Zw/0hWNIm9dU7qE8FKHpACVY34C65BRsJ/O3k/F+SABcZ8qYkqaNJnkAtTdRze9KvWYt45Tx9YyZnWCaOtrJcQS01/0V2msmadLqyjtmApcq6hSz4/WuTNiM3+sEAMgxANFMZHEvCeRxLNtjXOa2GpJsyL3xxRbjijVrlIPXxXWd9GXlUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXRiz0r0YPSAbCs59rCUv9MJ/vfMlxgPD5orjpNu1d4=;
 b=R5naIYaTD5EWPp1IiZvRqBZohpjjX+L4pxj3A7U9y4hAO3b+lahsuGuCF+5PfsHdoB8XB3qPTRrvZ4e4rjkjKOzja8j9lmDfJecEfWz/4c+mpL/4f/heGcVfpD3uTTPKmvl+v6ZZ04Hg5xLXA+Rbkal5IiT+lhoEBSmG/8Rbhbs=
Received: from CY4PR19CA0034.namprd19.prod.outlook.com (2603:10b6:903:103::20)
 by DM5PR02MB2666.namprd02.prod.outlook.com (2603:10b6:3:106::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 19 Oct
 2020 20:43:44 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:103:cafe::af) by CY4PR19CA0034.outlook.office365.com
 (2603:10b6:903:103::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Mon, 19 Oct 2020 20:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with Microsoft SMTP
 Server id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 20:43:44
 +0000
Received: from [149.199.38.66] (port=47352 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <stefano.stabellini@xilinx.com>)
        id 1kUbzV-00036n-1J; Mon, 19 Oct 2020 13:42:49 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <stefano.stabellini@xilinx.com>)
        id 1kUc0N-0001GI-9D; Mon, 19 Oct 2020 13:43:43 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 09JKhanp004840;
        Mon, 19 Oct 2020 13:43:36 -0700
Received: from [10.23.120.202] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <stefanos@xilinx.com>)
        id 1kUc0G-0001Fq-4Q; Mon, 19 Oct 2020 13:43:36 -0700
Date:   Mon, 19 Oct 2020 13:43:35 -0700 (PDT)
From:   Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To:     Ben Levinsky <ben.levinsky@xilinx.com>
cc:     ed.mooring@xilinx.com, sunnyliangjy@gmail.com,
        punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
In-Reply-To: <20201005160614.3749-6-ben.levinsky@xilinx.com>
Message-ID: <alpine.DEB.2.21.2010191317090.12247@sstabellini-ThinkPad-T480s>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com> <20201005160614.3749-6-ben.levinsky@xilinx.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8236b8c-8c5d-4e8c-91b9-08d8746faba7
X-MS-TrafficTypeDiagnostic: DM5PR02MB2666:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2666A4E3147357B5FC635752A01E0@DM5PR02MB2666.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hhmba5Lb0HX6MqcZmeeQY08Xz9ebMMopstKTV5BItvfFA172rtVsrHJ0t5yCLPO6rvxRvxciy4TySdENKuDwKRswSmTJutq5bbR6m79YTZye3G6GMwY3WryzUTBKe6tNe/OZBWA1lw5Xotn/IVKPRtWEHYRj/XIu9AwHwGEYnWMP+KmwsHexKvouwrVl0ZDL4LeopplLTf6rMJrtr2PRRsSuvb+l4fDdmJ03x5ULnaQQbntgLJRxt+lZMaN8o/ev9VBLZ6HcvB6OsaoO8a0alqHqF9TPB2kOCRPN2gIWnE8Eqv7S1hNvFN9mCJMzIKw5NPPxCWsndcMptU5aFsQOG1PIrKK9DVNeyzXIT5mrAyA2RIbx7Ya/iXQVji6TSMCf/PDgPbbiSI5QJWIHXyJgvJ6GCNnSiiAMTbVw8sqwmhE=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(7916004)(376002)(396003)(346002)(39860400002)(136003)(46966005)(82310400003)(4326008)(2906002)(426003)(70206006)(33716001)(5660300002)(70586007)(336012)(44832011)(6862004)(30864003)(83380400001)(47076004)(186003)(9786002)(508600001)(26005)(9686003)(81166007)(8936002)(356005)(8676002)(82740400003)(316002)(6636002)(42866002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 20:43:44.2892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8236b8c-8c5d-4e8c-91b9-08d8746faba7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2666
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 5 Oct 2020, Ben Levinsky wrote:
> R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> remotproc driver, we can boot the R5 sub-system in different 2
> configurations -
> 	* split
> 	* lock-step
> 
> The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
> Platform Management Unit that handles the R5 configuration, memory access
> and R5 lifecycle management. The interface to this manager is done in this
> driver via zynqmp_pm_* function calls.

Mostly minor comments left


> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
> v2:
>  - remove domain struct as per review from Mathieu
> v3:
>  - add xilinx-related platform mgmt fn's instead of wrapping around
>    function pointer in xilinx eemi ops struct
> v4:
>  - add default values for enums
>  - fix formatting as per checkpatch.pl --strict. Note that 1 warning and 1 check
>    are still raised as each is due to fixing the warning results in that
>  particular line going over 80 characters.
> v5:
>  - parse_fw change from use of rproc_of_resm_mem_entry_init to
>  rproc_mem_entry_init and use of alloc/release
>  - var's of type zynqmp_r5_pdata all have same local variable name
>  - use dev_dbg instead of dev_info
> v6:
>  - adding memory carveouts is handled much more similarly. All mem
>  carveouts are
>    now described in reserved memory as needed. That is, TCM nodes are not
>    coupled to remoteproc anymore. This is reflected in the remoteproc R5
>  driver
>    and the device tree binding.
>  - remove mailbox from device tree binding as it is not necessary for elf
>    loading
>  - use lockstep-mode property for configuring RPU
> v7:
>  - remove unused headers
>  - change  u32 *lockstep_mode ->  u32 lockstep_mode;
>  - change device-tree binding "lockstep-mode"  to xlnx,cluster-mode
>  - remove zynqmp_r5_mem_probe and loop to Probe R5 memory devices at
>    remoteproc-probe time
>  - remove is_r5_mode_set from  zynqmp rpu remote processor private data
>  - do not error out if no mailbox is provided
>  - remove zynqmp_r5_remoteproc_probe call of platform_set_drvdata as
>  pdata is
>    handled in zynqmp_r5_remoteproc_remove
> v8:
>  - remove old acks, reviewed-by's in commit message
> v9:
> - as mboxes are now optional, if pdata->tx_mc_skbs not initialized then
>   do not call skb_queue_empty
> - update usage for zynqmp_pm_set_rpu_mode, zynqmp_pm_set_tcm_config and
>   zynqmp_pm_get_rpu_mode
> - update 5/5 patch commit message to document supported configurations
>   and how they are booted by the driver.
> - remove copyrights other than SPDX from zynqmp_r5_remoteproc.c
> - compilation warnings no longer raised
> - remove unused includes from zynqmp_r5_remoteproc.c
> - remove unused  var autoboot from zynqmp_r5_remoteproc.c
> - reorder zynqmp_r5_pdata fpr small mem savings due to alignment
> - use of zynqmp_pm_set_tcm_config now does not have
>   output arg
> - in tcm handling, unconditionally use &= 0x000fffff mask since all nodes
>   in this fn are for tcm
> - update comments for translating dma field in tcm handling to device
>   address
> - update calls to rproc_mem_entry_init in parse_mem_regions so that there
>   are only 2 cases for types of carveouts instead of 3
> - in parse_mem_regions, check if device tree node is null before using it
> - add example device tree nodes used in parse_mem_regions and tcm parsing
> - add comment for vring id node length
> - add check for string length so that vring id is at least min length
> - move tcm nodes from reserved mem to instead own device tree nodes
>    and only use them if enabled in device tree
> - add comment for explaining handling of rproc_elf_load_rsc_table
> - remove obsolete check for "if (vqid < 0)" in zynqmp_r5_rproc_kick
> - remove unused field mems in struct zynqmp_r5_pdata
> - remove call to zynqmp_r5_mem_probe and the fn itself as tcm handling
>   is done by zyqmp_r5_pm_request_tcm
> - remove obsolete setting of dma_ops and parent device dma_mask
> - remove obsolete use of of_dma_configure
> - add comment for call to r5_set_mode fn
> - make mbox usage optional and gracefully inform user via dev_dbg if not
>   present
> - change var lockstep_mode from u32* to u32
> v11:
> - use enums instead of u32 where possible in zynqmp_r5_remoteproc
> - update usage of zynqmp_pm_set/get_rpu_mode and zynqmp_pm_set_tcm_config
> - update prints to not use carriage return, just newline
> - look up tcm banks via property in r5 node instead of string name
> - print device tree nodes with %pOF instead of %s with node name field
> - update tcm release to unmap VA
> - handle r5-1 use case
> v12:
> - update signed off by so that latest developer name is last
> - do not cast enums to u32s for zynqmp_pm* functions
> v14:
> - change zynqmp_r5_remoteproc::rpus and rpu_mode to static
> - fix typo
> - zynqmp_r5_remoteproc::r5_set_mode set rpu mode from
>   property specified in device tree
> - use u32 instead of u32* to store in remoteproc memory entry private data
>   for pnode_id information
> - always call r5_set_mode on probe
> - remove alloc of zynqmp_r5_pdata in
>   zynqmp_r5_remoteproc::zynqmp_r5_remoteproc_probe as there is static
>   allocation already
> - error at probe time if lockstep-mode property not present in device tree
> - update commit message as per review
> - remove dependency on MAILBOX in makefile as ZYNQMP_IPI_MBOX is present
> - remove unused macros
> - update comment ordering of zynqmp_r5_pdata to match struct definition
> - zynqmp_r5_remoteproc::tcm_mem_release error if pnode id is invalid
> - remove obsolete TODOs
> - only call zynqmp_r5_remoteproc::zynqmp_r5_probe if the index is valid
> - remove uneven dev_dbg/dev_err fn calls
> v15:
> - if lockstep mode prop is present, then RPU cluster is in lockstep mode.
>   if not present, cluster is in split mode.
> - if 2 RPUs provided but one is lockstep then error out as this is invalid
>   configuration
> v16:
> - replace of_get_property(dev->of_node, "lockstep-mode" with
>   of_property_read_bool
> - propagate rpu mode specified in device tree through functions instead
>   of holding a global, static var
> - check child remoteproc nodes via of_get_available_child_count before
>   looping through children
> - replace check of "pdata->pnode_id == 0" instead by checking rpu's
>   zynqmp_r5_pdata* if NULL
> - remove old, obsolete checks for dma_pools in zynqmp_r5_remoteproc_remove
> - change rpus from zynqmp_r5_pdata[] to zynqmp_r5_pdata*[] so that
>   check for pdata->pnode_id == 0 is not needed
> v17:
> - fix style as per kernel test bot
> v18:
> - to more closely mimic other remoteproc drivers, change zynqmp r5 rproc
>   data from zynqmp_r5_pdata to zynqmp_r5_rproc and pdata local var to
>   zproc
> - remove global vars rpus and rpu_mode
> - instantiate device for zynqmp r5 rproc from device set by rproc_alloc
> - fix typos
> - update to call zynqmp_r5_release from the rproc_alloc-related device and
>   remove the instantiated device from zynqmp_r5_probe
> - remove unneeded call to platform_set_drvdata
> - remove driver remove function, as the clean up is handled in release
> - remove while (!skb_queue_empty loop and mbox_free_channel calls in 
>   zynqmp_r5_release, and mbox_free_channel
> - remove device_unregister call in zynqmp_r5_release
> - remove kzalloc for pdata (what is now called z_rproc)
> - update conditional in loop to calls of zynqmp_r5_probe
> 
> ---
>  drivers/remoteproc/Kconfig                |   8 +
>  drivers/remoteproc/Makefile               |   1 +
>  drivers/remoteproc/zynqmp_r5_remoteproc.c | 707 ++++++++++++++++++++++
>  3 files changed, 716 insertions(+)
>  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c6659dfea7c7..68e567c5375c 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
>  	  It's safe to say N here if you're not interested in utilizing
>  	  the DSP slave processors.
>  
> +config ZYNQMP_R5_REMOTEPROC
> +	tristate "ZynqMP_R5 remoteproc support"
> +	depends on PM && ARCH_ZYNQMP
> +	select RPMSG_VIRTIO
> +	select ZYNQMP_IPI_MBOX
> +	help
> +	  Say y or m here to support ZynqMP R5 remote processors via the remote
> +	  processor framework.
>  endif # REMOTEPROC
>  
>  endmenu
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 3dfa28e6c701..ef1abff654c2 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -33,3 +33,4 @@ obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
> +obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+= zynqmp_r5_remoteproc.o
> diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> new file mode 100644
> index 000000000000..37bd76252ff2
> --- /dev/null
> +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> @@ -0,0 +1,707 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Zynq R5 Remote Processor driver
> + *
> + * Based on origin OMAP and Zynq Remote Processor driver
> + *
> + */
> +
> +#include <linux/firmware/xlnx-zynqmp.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/zynqmp-ipi-message.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/skbuff.h>
> +#include <linux/sysfs.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define MAX_RPROCS	2 /* Support up to 2 RPU */
> +#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU memory instance */
> +
> +#define BANK_LIST_PROP "meta-memory-regions"
> +
> +/* IPI buffer MAX length */
> +#define IPI_BUF_LEN_MAX	32U
> +/* RX mailbox client buffer max length */
> +#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
> +				 sizeof(struct zynqmp_ipi_message))
> +
> +/**
> + * struct zynqmp_r5_mem - zynqmp rpu memory data
> + * @pnode_id: TCM power domain ids
> + * @res: memory resource
> + * @node: list node
> + */
> +struct zynqmp_r5_mem {
> +	u32 pnode_id[MAX_MEM_PNODES];
> +	struct resource res;
> +	struct list_head node;
> +};
> +
> +/**
> + * struct zynqmp_r5_rproc - zynqmp rpu remote processor state
> + * @rx_mc_buf: rx mailbox client buffer to save the rx message
> + * @tx_mc: tx mailbox client
> + * @rx_mc: rx mailbox client * @dev: device of RPU instance
> + * @mbox_work: mbox_work for the RPU remoteproc
> + * @tx_mc_skbs: socket buffers for tx mailbox client
> + * @dev: device of RPU instance
> + * @rproc: rproc handle
> + * @tx_chan: tx mailbox channel
> + * @rx_chan: rx mailbox channel
> + * @pnode_id: RPU CPU power domain id
> + */
> +struct zynqmp_r5_rproc {
> +	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
> +	struct mbox_client tx_mc;
> +	struct mbox_client rx_mc;
> +	struct work_struct mbox_work;
> +	struct sk_buff_head tx_mc_skbs;
> +	struct device dev;
> +	struct rproc *rproc;
> +	struct mbox_chan *tx_chan;
> +	struct mbox_chan *rx_chan;
> +	u32 pnode_id;
> +};
> +
> +/*
> + * r5_set_mode - set RPU operation mode
> + * @z_rproc: Remote processor private data
> + *
> + * set RPU operation mode
> + *
> + * Return: 0 for success, negative value for failure
> + */
> +static int r5_set_mode(struct zynqmp_r5_rproc *z_rproc,
> +		       enum rpu_oper_mode rpu_mode)
> +{
> +	enum rpu_tcm_comb tcm_mode;
> +	enum rpu_oper_mode cur_rpu_mode;
> +	int ret;
> +
> +	ret = zynqmp_pm_get_rpu_mode(z_rproc->pnode_id, &cur_rpu_mode);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (rpu_mode != cur_rpu_mode) {
> +		ret = zynqmp_pm_set_rpu_mode(z_rproc->pnode_id,
> +					     rpu_mode);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	tcm_mode = (rpu_mode == PM_RPU_MODE_LOCKSTEP) ?
> +		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
> +	return zynqmp_pm_set_tcm_config(z_rproc->pnode_id, tcm_mode);
> +}
> +
> +/*
> + * ZynqMP R5 remoteproc memory release function
> + */
> +static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem)
> +{
> +	u32 pnode_id = (u64)mem->priv;
> +
> +	if (pnode_id <= 0)

pnode_id is a u32, so checks for it to be negative don't make a lot of
sense


> +		return -EINVAL;
> +
> +	iounmap(mem->va);
> +	return zynqmp_pm_release_node(pnode_id);
> +}
> +
> +/*
> + * ZynqMP R5 remoteproc operations
> + */
> +static int zynqmp_r5_rproc_start(struct rproc *rproc)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	enum rpu_boot_mem bootmem;
> +
> +	bootmem = (rproc->bootaddr & 0xF0000000) == 0xF0000000 ?
> +		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> +
> +	dev_dbg(dev, "RPU boot from %s.",
> +		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> +
> +	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
> +				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> +}
> +
> +static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	struct sk_buff *skb;
> +
> +	if (z_rproc->tx_chan)
> +		mbox_free_channel(z_rproc->tx_chan);
> +	if (z_rproc->rx_chan)
> +		mbox_free_channel(z_rproc->rx_chan);
> +
> +	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
> +				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +}
> +
> +static int zynqmp_r5_rproc_mem_alloc(struct rproc *rproc,
> +				     struct rproc_mem_entry *mem)
> +{
> +	void *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va))
> +		return -ENOMEM;
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
> +				       struct rproc_mem_entry *mem)
> +{
> +	iounmap(mem->va);
> +	return 0;
> +}
> +
> +static int parse_mem_regions(struct rproc *rproc)
> +{
> +	int num_mems, i;
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	struct device *dev =  &z_rproc->dev;
> +	struct device_node *np = dev->of_node;
> +	struct rproc_mem_entry *mem;
> +
> +	num_mems = of_count_phandle_with_args(np, "memory-region", NULL);
> +	if (num_mems <= 0)
> +		return 0;
> +
> +	for (i = 0; i < num_mems; i++) {
> +		struct device_node *node;
> +		struct reserved_mem *rmem;
> +
> +		node = of_parse_phandle(np, "memory-region", i);
> +		if (!node)
> +			return -EINVAL;
> +
> +		rmem = of_reserved_mem_lookup(node);
> +		if (!rmem)
> +			return -EINVAL;
> +
> +		if (strstr(node->name, "vdev0vring")) {
> +			int vring_id;
> +			char name[16];
> +
> +			/*
> +			 * expecting form of "rpuXvdev0vringX as documented
> +			 * in xilinx remoteproc device tree binding
> +			 */
> +			if (strlen(node->name) < 14) {
> +				dev_err(dev, "%pOF is less than 14 chars",
> +					node);
> +				return -EINVAL;
> +			}
> +
> +			/*
> +			 * can be 1 of multiple vring IDs per IPC channel
> +			 * e.g. 'vdev0vring0' and 'vdev0vring1'
> +			 */
> +			vring_id = node->name[14] - '0';

If you are going to use a direct access to node->name[14], then the
strlen check above should cover it, which means we should check for at
least strlen(node->name) < 15.


> +			snprintf(name, sizeof(name), "vdev0vring%d", vring_id);
> +			/* Register vring */
> +			mem = rproc_mem_entry_init(dev, NULL,
> +						   (dma_addr_t)rmem->base,
> +						   rmem->size, rmem->base,
> +						   zynqmp_r5_rproc_mem_alloc,
> +						   zynqmp_r5_rproc_mem_release,
> +						   name);
> +		} else {
> +			/* Register DMA region */
> +			int (*alloc)(struct rproc *r,
> +				     struct rproc_mem_entry *rme);
> +			int (*release)(struct rproc *r,
> +				       struct rproc_mem_entry *rme);
> +			char name[20];
> +
> +			if (strstr(node->name, "vdev0buffer")) {
> +				alloc = NULL;
> +				release = NULL;
> +				strcpy(name, "vdev0buffer");
> +			} else {
> +				alloc = zynqmp_r5_rproc_mem_alloc;
> +				release = zynqmp_r5_rproc_mem_release;
> +				strcpy(name, node->name);
> +			}
> +
> +			mem = rproc_mem_entry_init(dev, NULL,
> +						   (dma_addr_t)rmem->base,
> +						   rmem->size, rmem->base,
> +						   alloc, release, name);
> +		}
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +	}
> +
> +	return 0;
> +}
> +
> +/* call Xilinx Platform manager to request access to TCM bank */
> +static int zynqmp_r5_pm_request_tcm(struct device_node *tcm_node,
> +				    struct device *dev, u32 *pnode_id)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32(tcm_node, "pnode-id", pnode_id);
> +	if (ret)
> +		return ret;
> +
> +	return zynqmp_pm_request_node(*pnode_id, ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +}
> +
> +/* Given tcm bank entry,

I think checkpatch.pl would complain for this comment format


> + * this callback will set device address for R5 running on TCM
> + * and also setup virtual address for tcm bank remoteproc carveout
> + */
> +static int tcm_mem_alloc(struct rproc *rproc,
> +			 struct rproc_mem_entry *mem)
> +{
> +	void *va;
> +	struct device *dev = rproc->dev.parent;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va))
> +		return -ENOMEM;
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	va = devm_ioremap_wc(dev, mem->da, mem->len);
> +	if (!va)
> +		return -ENOMEM;
> +	/* As R5 is 32 bit, wipe out extra high bits */
> +	mem->da &= 0x000fffff;
> +	/*
> +	 * handle tcm banks 1 a and b (0xffe90000 and oxffeb0000)
> +	 * As both of these the only common bit found not in tcm bank0 a or b
> +	 * is at 0x80000 use this mask to suss it out
> +	 */
> +	if (mem->da & 0x80000)
> +		/*
> +		 * need to do more to further translate
> +		 * tcm banks 1a and 1b at 0xffe90000 and oxffeb0000
                                                 ^typo


> +		 * respectively to 0x0 and 0x20000
> +		 */
> +		mem->da -= 0x90000;

I understand now why we do "mem->da -= 0x90000" and the in-code comment
explains it. However, why the "if (mem->da & 0x80000)" check?

If we want to make sure to do this "translation" only for 0xffe90000 and
0xffeb0000, wouldn't it be better to call them out explicitly, like:

  if (mem->da == 0x90000 || mem->da == 0xB0000)


Also if this if check fails, should we print an error? Or is it a
possible handled condition?
