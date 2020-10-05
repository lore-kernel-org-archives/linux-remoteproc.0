Return-Path: <SRS0=OhS6=DM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2A7C4363A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 20:33:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 920F921527
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 20:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="Q81xVU2d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgJEUdA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Oct 2020 16:33:00 -0400
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:2624 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727262AbgJEUc7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Oct 2020 16:32:59 -0400
X-Greylist: delayed 3474 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Oct 2020 16:32:57 EDT
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
        by mx0a-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 095JWxfe007305;
        Mon, 5 Oct 2020 14:34:54 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
        by mx0a-00010702.pphosted.com with ESMTP id 33xnb0vekh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 05 Oct 2020 14:34:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY6DPmUo3I6W67+wI9/t4oHirzNhFrUbw0wll98LHcQxWDO+7+RyUAsMzvvb4gBXa6YI4cz852nnAM/JTZDVy5OXC9WPux5AUSanVBxFBS84+hEaCddOuJjCkseU0X/r3Nm+a9MOOmB3XYDKTPSjx2YXECJS5xFHRXFgDXwLRZH3FeZ9aoNvBXEJSKnHKrMTp7E/c+csdEQaDicIWQR0FaSIr22zNiHvIiHnWKyXNgShLkLMumBufPxPFwKghklnluxg6w5EO0nOyxw7udgkM9vDxQzbqgaZG7g0DSA6EQlg4Bmb88dPxI2a2wWcXd82v1AzAIA80w+8YqFM6uQ1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qidET49LlriflilLxX8wVuJp3thExSk0Ccn0gLniYIU=;
 b=ktK2C0ul8SJ/M0vxjkDzRfqW+vnZG9ASbkzDnS6/tbIgu+SlsvruB3taxRDUFwkXdUszHSRXShZIBcq5Y96VUbPVNNUOq1OQfzbKqPE+e23noua2JqjKlb6js6db6Qse3SMI+UZVueHsCJn38rKeFJryCBwdp5JxCtMIKGr16mQTmIthCmC6tRcSbgdTIV9iRj4MbAAmPqBqfKpMhJ6a5xWg3ca3EpnoYYF3eWG/N7imHngqNV5M4LupU3RTADf8TmG4rQqaoZt73bMnvx4iOgxA1NpWQvkaTi7PdgAKL9Ppn3cKbMhCt5tk9nrnA7eJAVS8SyrgBN+pIaU9LI19Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qidET49LlriflilLxX8wVuJp3thExSk0Ccn0gLniYIU=;
 b=Q81xVU2dHG/fRl87CCf93ropmdD9n4+lPrdgJ6zFSv2MQCZNXviKCKpkLNhjTDFuHpm3QsWt3dmPwiAUOMoPwTDr5MY51ItoM5qeqc+jxtH/TQl5YITeDocx8Z4HQUWO2pvsbBCfhtPzeiYYJlss3i2PFTHKrURmhmIPQ3dc7Ko=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29) by SN6PR04MB5182.namprd04.prod.outlook.com
 (2603:10b6:805:f9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 19:34:50 +0000
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84]) by SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::f4f0:f1bc:f09a:da84%7]) with mapi id 15.20.3433.043; Mon, 5 Oct 2020
 19:34:50 +0000
Date:   Mon, 5 Oct 2020 14:34:49 -0500
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     ed.mooring@xilinx.com, sunnyliangjy@gmail.com,
        punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, devicetree@vger.kernel.org,
        mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org
Message-ID: <20201005193449.GA701433@xaphan>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
 <20201005160614.3749-6-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005160614.3749-6-ben.levinsky@xilinx.com>
X-Originating-IP: [2605:a601:ab23:3c00:cdda:4935:f7a0:c63c]
X-ClientProxiedBy: SN6PR01CA0010.prod.exchangelabs.com (2603:10b6:805:b6::23)
 To SN4PR0401MB3646.namprd04.prod.outlook.com (2603:10b6:803:4b::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2605:a601:ab23:3c00:cdda:4935:f7a0:c63c) by SN6PR01CA0010.prod.exchangelabs.com (2603:10b6:805:b6::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Mon, 5 Oct 2020 19:34:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2076f7ea-3b63-46e3-8c38-08d86965b9a9
X-MS-TrafficTypeDiagnostic: SN6PR04MB5182:
X-Microsoft-Antispam-PRVS: <SN6PR04MB5182FF198C3CD6DF7E18DDA2870C0@SN6PR04MB5182.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjAsH3qaQ4LmVfxOZ2+mC6b2NN80ws2u2cktOJQFe87VYmAy8XTOT6R7UOoe1cdwLSaP0vc/rCxNNLbAET5MI6UB10y4ApEt3PkPKzK8dZu00nueI8KXsMh7MlAgPCmisQ0RKhM223Byb7t2trPZE6nSveBxSReDg6DCv1GQgaB3w6WSO50VaS5bdcya4v0H1O1UIsnYHyJGYFyr1Tg1df5h0nFyj90ADRAYNpHE9X87kehLawtZCSaJWE/Pw473m6ueI5h2yeUqOx9EiYEBVyTG01P6SdK8gnMk9UBMatwZrsyrhVMqxXk4KH7s7tg6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3646.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(136003)(346002)(366004)(396003)(376002)(39860400002)(7416002)(4326008)(6486002)(478600001)(86362001)(6916009)(33656002)(9686003)(8936002)(8676002)(2906002)(33716001)(1076003)(44832011)(30864003)(66476007)(5660300002)(66556008)(52116002)(83380400001)(6496006)(66946007)(16526019)(186003)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: MQnvXVKKs1zyKkOkVPiGsmZX5ZLDSxsKUk+8xmPROuQ0WjWIH5eqyedMkTY8qQ4u8QfcVX3yI8aybRLvSyB87VezINxx1mcU1NTYywZ7OzF8mRyB2//rym6HmJJcr90h/dQW4j7awoMzkCtv4WfH035NqtIVbFdz3WYO/WfmjMHjXbtlP6S0R9ztLFk0y1hGCQHiPkPt4Ws61m32Kp8ANZ95Ic8DoaEdA2f7lGHu23+o/79v50S93LBwE5DkmFi1NnB2N5nVwG3LJyIho2oY3DnV9f9GsWqvKUQNUW3dPh6BGx6YSZ/zfGB3fTpRsDafYQoANDv5mKo961jgB9N4GRDb3gXTVNzO5EAvVDRUgTfZiOzXtY5GdAg/loRF6jUhp+6g2gtQe4s39HpDZXuD5ba7HfLmcc8vs2oeM22fAizaSzubpNj9HRdAySVafoYUZKNzRdkAxszwKQ4NafeDaidmZ0mpJsHx4ewTUrYE6vINpRU2GINDJBbmQGwyGPUosYvNyAbLnVeRFE/kxOY+pIMhX8ghqEb8y/ONILWDevTkdtmNjZZLX0g1z/JAwyYZ6nq1QPeE/zRXS2jJ0xr0UUv3vpqPFqUWO62kkkqFck5FpW8TSjmrj2zYUlHxprcGC6kSVSPGPzYxGs7hjT19uslZwIGhg+5cnvP+iiNjDlab4rE+OA7DfHupH0NFpvmmte/Xcq1sDCYki1NsgGos/A==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2076f7ea-3b63-46e3-8c38-08d86965b9a9
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3646.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 19:34:50.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkLc4O2GiL5mrXb5UQ5MgOGgX8/ocap5Q89jh7cDMhFSsYnbCjnCAqjFGoKClu9hsB8ZYcqvBaWkXwjXSHWaDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5182
Subject: Re: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-05_15:2020-10-05,2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 suspectscore=7
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010050139
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Ben,

On Mon, Oct 05, 2020 at 09:06:14AM -0700, Ben Levinsky wrote:
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
> 
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

This looks incorrect: these are requested during probe, so I would
expect these to be free'd during remove.

It's legal to call stop, then start again, then stop again, etc.
Consider what would happen here in that case.

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
> +		 * respectively to 0x0 and 0x20000
> +		 */
> +		mem->da -= 0x90000;
> +
> +	return 0;
> +}
> +
> +/*
> + * Given R5 node in remoteproc instance,
> + * allocate remoteproc carveout for TCM memory
> + * needed for firmware to be loaded
> + */
> +static int parse_tcm_banks(struct rproc *rproc)
> +{
> +	int i, num_banks;
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	struct device *dev = &z_rproc->dev;
> +	struct device_node *r5_node = dev->of_node;
> +
> +	/* go through tcm banks for r5 node */
> +	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
> +	if (num_banks <= 0) {
> +		dev_err(dev, "need to specify TCM banks\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < num_banks; i++) {
> +		struct resource rsc;
> +		resource_size_t size;
> +		struct device_node *dt_node;
> +		struct rproc_mem_entry *mem;
> +		int ret;
> +		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
> +
> +		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
> +		if (!dt_node)
> +			return -EINVAL;
> +
> +		if (of_device_is_available(dt_node)) {
> +			ret = of_address_to_resource(dt_node, 0, &rsc);
> +			if (ret < 0)
> +				return ret;
> +
> +			ret = zynqmp_r5_pm_request_tcm(dt_node, dev, &pnode_id);
> +			if (ret < 0)
> +				return ret;
> +
> +			/* add carveout */
> +			size = resource_size(&rsc);
> +			mem = rproc_mem_entry_init(dev, NULL, rsc.start,
> +						   (int)size, rsc.start,
> +						   tcm_mem_alloc,
> +						   tcm_mem_release,
> +						   rsc.name);
> +			if (!mem)
> +				return -ENOMEM;
> +
> +			mem->priv = (void *)(u64)pnode_id;
> +			rproc_add_carveout(rproc, mem);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	struct device *dev = &z_rproc->dev;
> +
> +	ret = parse_tcm_banks(rproc);
> +	if (ret)
> +		return ret;
> +
> +	ret = parse_mem_regions(rproc);
> +	if (ret)
> +		return ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret == -EINVAL) {
> +		/*
> +		 * resource table only required for IPC.
> +		 * if not present, this is not necessarily an error;
> +		 * for example, loading r5 hello world application
> +		 * so simply inform user and keep going.
> +		 */
> +		dev_info(dev, "no resource table found.\n");
> +		ret = 0;
> +	}
> +	return ret;
> +}
> +
> +/* kick a firmware */
> +static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct sk_buff *skb;
> +	unsigned int skb_len;
> +	struct zynqmp_ipi_message *mb_msg;
> +	int ret;
> +
> +	struct device *dev = rproc->dev.parent;
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +
> +	skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> +	skb = alloc_skb(skb_len, GFP_ATOMIC);
> +	if (!skb)
> +		return;
> +
> +	mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
> +	mb_msg->len = sizeof(vqid);
> +	memcpy(mb_msg->data, &vqid, sizeof(vqid));
> +	skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
> +	ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
> +	if (ret < 0) {
> +		dev_warn(dev, "Failed to kick remote.\n");
> +		skb_dequeue_tail(&z_rproc->tx_mc_skbs);
> +		kfree_skb(skb);
> +	}
> +}
> +
> +static struct rproc_ops zynqmp_r5_rproc_ops = {
> +	.start		= zynqmp_r5_rproc_start,
> +	.stop		= zynqmp_r5_rproc_stop,
> +	.load		= rproc_elf_load_segments,
> +	.parse_fw	= zynqmp_r5_parse_fw,
> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.sanity_check	= rproc_elf_sanity_check,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.kick		= zynqmp_r5_rproc_kick,
> +};
> +
> +/**
> + * zynqmp_r5_release() - ZynqMP R5 device release function
> + * @dev: pointer to the device struct of ZynqMP R5
> + *
> + * Function to release ZynqMP R5 device.
> + */
> +static void zynqmp_r5_release(struct device *dev)
> +{
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct rproc *rproc;
> +
> +	z_rproc = dev_get_drvdata(dev);
> +	rproc = z_rproc->rproc;
> +	if (rproc) {
> +		rproc_del(rproc);
> +		rproc_free(rproc);
> +	}
> +}
> +
> +/**
> + * event_notified_idr_cb() - event notified idr callback
> + * @id: idr id
> + * @ptr: pointer to idr private data
> + * @data: data passed to idr_for_each callback
> + *
> + * Pass notification to remoteproc virtio
> + *
> + * Return: 0. having return is to satisfy the idr_for_each() function
> + *          pointer input argument requirement.
> + **/
> +static int event_notified_idr_cb(int id, void *ptr, void *data)
> +{
> +	struct rproc *rproc = data;
> +
> +	(void)rproc_vq_interrupt(rproc, id);
> +	return 0;
> +}
> +
> +/**
> + * handle_event_notified() - remoteproc notification work funciton
> + * @work: pointer to the work structure
> + *
> + * It checks each registered remoteproc notify IDs.
> + */
> +static void handle_event_notified(struct work_struct *work)
> +{
> +	struct rproc *rproc;
> +	struct zynqmp_r5_rproc *z_rproc;
> +
> +	z_rproc = container_of(work, struct zynqmp_r5_rproc, mbox_work);
> +
> +	(void)mbox_send_message(z_rproc->rx_chan, NULL);
> +	rproc = z_rproc->rproc;
> +	/*
> +	 * We only use IPI for interrupt. The firmware side may or may
> +	 * not write the notifyid when it trigger IPI.
> +	 * And thus, we scan through all the registered notifyids.
> +	 */
> +	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
> +}
> +
> +/**
> + * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
> + * @cl: mailbox client
> + * @mssg: message pointer
> + *
> + * It will schedule the R5 notification work.
> + */
> +static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *mssg)
> +{
> +	struct zynqmp_r5_rproc *z_rproc;
> +
> +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
> +	if (mssg) {
> +		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> +		size_t len;
> +
> +		ipi_msg = (struct zynqmp_ipi_message *)mssg;
> +		buf_msg = (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
> +		len = (ipi_msg->len >= IPI_BUF_LEN_MAX) ?
> +		      IPI_BUF_LEN_MAX : ipi_msg->len;
> +		buf_msg->len = len;
> +		memcpy(buf_msg->data, ipi_msg->data, len);
> +	}
> +	schedule_work(&z_rproc->mbox_work);
> +}
> +
> +/**
> + * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
> + * @cl: mailbox client
> + * @mssg: pointer to the message which has been sent
> + * @r: status of last TX - OK or error
> + *
> + * It will be called by the mailbox framework when the last TX has done.
> + */
> +static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *mssg, int r)
> +{
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct sk_buff *skb;
> +
> +	if (!mssg)
> +		return;
> +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, tx_mc);
> +	skb = skb_dequeue(&z_rproc->tx_mc_skbs);
> +	kfree_skb(skb);
> +}
> +
> +/**
> + * zynqmp_r5_setup_mbox() - Setup mailboxes
> + *
> + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> + * @node: pointer of the device node
> + *
> + * Function to setup mailboxes to talk to RPU.
> + *
> + * Return: 0 for success, negative value for failure.
> + */
> +static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
> +				struct device_node *node)
> +{
> +	struct device *dev = &z_rproc->dev;
> +	struct mbox_client *mclient;
> +
> +	dev->of_node = node;
> +
> +	/* Setup TX mailbox channel client */
> +	mclient = &z_rproc->tx_mc;
> +	mclient->dev = dev;
> +	mclient->rx_callback = NULL;
> +	mclient->tx_block = false;
> +	mclient->knows_txdone = false;
> +	mclient->tx_done = zynqmp_r5_mb_tx_done;
> +
> +	/* Setup TX mailbox channel client */
> +	mclient = &z_rproc->rx_mc;
> +	mclient->dev = dev;
> +	mclient->rx_callback = zynqmp_r5_mb_rx_cb;
> +	mclient->tx_block = false;
> +	mclient->knows_txdone = false;
> +
> +	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
> +
> +	/* Request TX and RX channels */
> +	z_rproc->tx_chan = mbox_request_channel_byname(&z_rproc->tx_mc, "tx");
> +	if (IS_ERR(z_rproc->tx_chan)) {
> +		dev_err(dev, "failed to request mbox tx channel.\n");
> +		z_rproc->tx_chan = NULL;
> +		return -EINVAL;
> +	}
> +	z_rproc->rx_chan = mbox_request_channel_byname(&z_rproc->rx_mc, "rx");
> +	if (IS_ERR(z_rproc->rx_chan)) {
> +		dev_err(dev, "failed to request mbox rx channel.\n");
> +		z_rproc->rx_chan = NULL;
> +		return -EINVAL;
> +	}
> +	skb_queue_head_init(&z_rproc->tx_mc_skbs);
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
> + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> + * @pdev: parent RPU domain platform device
> + * @node: pointer of the device node
> + * @rpu_mode: rpu config set by DT
> + *
> + * Function to retrieve the information of the ZynqMP R5 device node.
> + *
> + * Return: 0 for success, negative value for failure.
> + */
> +static int zynqmp_r5_probe(struct platform_device *pdev,
> +			   struct device_node *node,
> +			   enum rpu_oper_mode rpu_mode)
> +{
> +	struct rproc *rproc;
> +	int ret;
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct device *dev = &pdev->dev;
> +
> +	/* Allocate remoteproc instance */
> +	rproc = rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops, NULL, sizeof(*z_rproc));
> +	if (!rproc) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}

Should be just:

	if (!rproc)
		return -ENOMEM;

As this is, if the allocation fails, z_rproc is uninitialized and the
z_rproc->rproc deref below the error label is going to be problematic.

> +	z_rproc = rproc->priv;
> +	z_rproc->dev.release = zynqmp_r5_release;

This is the only field of z_rproc->dev that's actually initialized, and
this device is not registered with the core at all, so zynqmp_r5_release
will never be called.

Since it doesn't look like there's a need to create this additional
device, I'd suggest:
	- Dropping the struct device from struct zynqmp_r5_rproc
	- Performing the necessary cleanup in the driver remove
	  callback instead of trying to tie it to device release
> +
> +	/* Set up DMA mask */
> +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		goto error;
> +	/* Get R5 power domain node */
> +	ret = of_property_read_u32(node, "pnode-id", &z_rproc->pnode_id);
> +	if (ret)
> +		goto error;
> +
> +	ret = r5_set_mode(z_rproc, rpu_mode);
> +	if (ret)
> +		return ret;
> +
> +	if (of_property_read_bool(node, "mboxes")) {
> +		ret = zynqmp_r5_setup_mbox(z_rproc, node);
> +		if (ret)
> +			goto error;
> +	}
> +	/* Add R5 remoteproc */
> +	ret = rproc_add(rproc);
> +	if (ret)
> +		goto error;
> +
> +	return 0;
> +error:
> +	if (z_rproc->rproc)
> +		rproc_free(z_rproc->rproc);
> +	z_rproc->rproc = NULL;
> +	return ret;
> +}
> +
> +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> +{
> +	int ret, i;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *nc;
> +	enum rpu_oper_mode rpu_mode;
> +
> +	rpu_mode = of_property_read_bool(dev->of_node, "lockstep-mode") ?
> +		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
> +	dev_dbg(dev, "RPU configuration: %s\n",
> +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
> +
> +	/*
> +	 * if 2 RPUs provided but one is lockstep, then we have an
> +	 * invalid configuration.
> +	 */
> +	i = of_get_available_child_count(dev->of_node);
> +	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && i != 1) || i > MAX_RPROCS)
> +		return -EINVAL;
> +
> +	i = 0;
> +	for_each_available_child_of_node(dev->of_node, nc) {
> +		/* only call zynqmp_r5_probe if proper # of rpu's */
> +		ret = zynqmp_r5_probe(pdev, nc, rpu_mode);
> +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> +			ret ? "Failed" : "Able",
> +			nc);
> +		if (ret)
> +			return ret;
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Match table for OF platform binding */
> +static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
> +	{ .compatible = "xlnx,zynqmp-r5-remoteproc", },
> +	{ /* end of list */ },
> +};
> +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> +
> +static struct platform_driver zynqmp_r5_remoteproc_driver = {
> +	.probe = zynqmp_r5_remoteproc_probe,
> +	.driver = {
> +		.name = "zynqmp_r5_remoteproc",
> +		.of_match_table = zynqmp_r5_remoteproc_match,
> +	},
> +};
> +module_platform_driver(zynqmp_r5_remoteproc_driver);
> +
> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
