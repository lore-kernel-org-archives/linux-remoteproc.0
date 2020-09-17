Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F299AC43461
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 19:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A240F206DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 19:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="o1oUgzCg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIQT6A (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 15:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIQT57 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 15:57:59 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448E2C0611C1;
        Thu, 17 Sep 2020 12:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrlJHOCpbtVLzQ9V35buQEDn+691xaem+l4tgahNLN3+rL9v5RDvAeVu+X6whoAvQY0rw/bSB7OUMCe6G68tfmA3L0myALFYiqAVhM1uzT+BEWyIS8+Z7E/vi2Cr0+G7ejmIXjX3Y1f0AfrCHFrKqxacGe/R5aWdmkyd69t95MVOhB+TRJ2eQlfJo7JuU+crXXdkE3ZONoXvyFMCP0MhPDme0NsXRRXquRy4li01Axq1ULbbbncGihBf0E9lpvivsCkyuyNmH8jes1CXpZaU5u5VTSLgihmRexFHjNAa6RrXzKs6fWDU7+b57jZq0OlupSjgiippatxm4HkqQlHf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT+yTJ5jRPmXdnnD+QkP5bPpe/YrkXAeuvsyFsnomo8=;
 b=KHQTgtosp4eXGjmJC70oCL3weVmg5JAj+RVea4Tcaj0Jxl906X1M5GNYy7KebE1WWuB0fWU4e/pu3nAz29TfdofX2JlG53vezXUkuVvkmwzfp4nAgsAfq9MTnypph7EdYgDXnvs6DPRPTtDaJ4FF4mEhIb+M58UFeXMxKbNfy1eG/5m602smCzLXp3RNVW+ncyJivhALjDRSSFeFoC9xteQKS8kxRU6g4hPEy6LH0p1Hz6dOSYhFup2TGbOSFdB4WHUCcHcm8lOEEzn+IyqhXUXDom7HuB9i1hQDc8KlDCRXsddB5dmqXVHO0v0NoKQomBLdLn3nbfFMSK6UcgCedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT+yTJ5jRPmXdnnD+QkP5bPpe/YrkXAeuvsyFsnomo8=;
 b=o1oUgzCge7dqE4GWfDgY6aTyQuGTlcFGpkiaiAT6w4zhCv7y/f3+MNBnu6nxI+xJsWX0FyjDLLqlzN/ckitnCgtZoJAuRGyyQAHrhJSz0CJJluw8wYESuwbEsmUt0dpn2wT5gH8JvrNY/P9ptyDLPEeLGytjDEoIKkTkX0hhpnk=
Received: from BL0PR0102CA0042.prod.exchangelabs.com (2603:10b6:208:25::19) by
 DM6PR02MB4731.namprd02.prod.outlook.com (2603:10b6:5:fa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.17; Thu, 17 Sep 2020 19:43:45 +0000
Received: from BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:25:cafe::ce) by BL0PR0102CA0042.outlook.office365.com
 (2603:10b6:208:25::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Thu, 17 Sep 2020 19:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT037.mail.protection.outlook.com (10.152.77.11) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 19:43:45
 +0000
Received: from [149.199.38.66] (port=43958 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzoe-0005Yy-8n; Thu, 17 Sep 2020 12:43:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzom-0005P5-Lx; Thu, 17 Sep 2020 12:43:44 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08HJhg7A028239;
        Thu, 17 Sep 2020 12:43:42 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzoj-0005OV-Uz; Thu, 17 Sep 2020 12:43:42 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jliang@xilinx.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v14 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Thu, 17 Sep 2020 12:43:36 -0700
Message-Id: <20200917194341.16272-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b2f53ee4-d5d6-44eb-7b80-08d85b41fd23
X-MS-TrafficTypeDiagnostic: DM6PR02MB4731:
X-Microsoft-Antispam-PRVS: <DM6PR02MB47315BDD5A7D5D1E175AA39EB53E0@DM6PR02MB4731.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ck4EwzRJQnujKgwe2N0vHoQz5ahUzoScEJvublJ1MJlJfXiY8TznFDhzLwgn0WbnZd8ZmQGgzplWgLApedlKAZBp0/Ppt5IPPi/5HfaEJyNmvrKrApDvOamWV35Mpglx3mE9sc7OWCWYNwqZQPE4Hi9JpoXvRHrEaPNFBXLo57jzU0e48WsRpAfga6fDF2QqwUAUU7ymqKPIXfRj1ttRtjvjw9fy9x+xPBN43ANQ/oKMrq21CT5+HZ6P+br/wFKSANL+KlvCuaKmw/eX3muz4C996hg6isLK+JYU8dzpvIXu2HRQ1zsE8zgh6NmyH5EgRii6zjWTXZ+Qv0zA7AC84tXfDyOBiLSs5CWl0wUkcBi2AvRdLKK1KaVRWZ/krVhGyx7/wUONThh+uuF0EJCGjg==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(46966005)(26005)(498600001)(336012)(6666004)(1076003)(9786002)(186003)(81166007)(356005)(2906002)(7696005)(5660300002)(4326008)(47076004)(70586007)(8676002)(8936002)(83380400001)(426003)(44832011)(82310400003)(36756003)(70206006)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 19:43:45.0778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f53ee4-d5d6-44eb-7b80-08d85b41fd23
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4731
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver was tested on Xilinx ZynqMP QEMU

For sake of ease of review, only support ZynqMP. Once accepted, then
add support for Versal platform and R5 loading onto OCM.

v2:
- remove domain struct
v3:
- add xilinx-related platform mgmt fn's instead of wrapping around
  function pointer in xilinx eemi ops struct
- update zynqmp_r5 yaml parsing to not raise warnings for extra
  information in children of R5 node. The warning "node has a unit
  name, but no reg or ranges property" will still be raised though 
  as this particular node is needed to describe the
  '#address-cells' and '#size-cells' information.
v4:
- add default values for enums
- fix formatting as per checkpatch.pl --strict. Note that 1 warning and
  1 check are still raised as each is due to fixing the warning
  results in that particular line going over 80 characters.
- remove warning '/example-0/rpu@ff9a0000/r5@0: 
  node has a unit name, but no reg or ranges property'
  by adding reg to r5 node.
v5:
- update device tree sample and yaml parsing to not raise any warnings
- description for memory-region in yaml parsing
- compatible string in yaml parsing for TCM
- parse_fw change from use of rproc_of_resm_mem_entry_init to
  rproc_mem_entry_init and use of alloc/release
- var's of type zynqmp_r5_pdata all have same local variable name
- use dev_dbg instead of dev_info
v6:
- adding memory carveouts is handled much more similarly.
  All mem carveouts are now described in reserved memory as needed.
  That is, TCM nodes are not coupled to remoteproc anymore.
  This is reflected in the remoteproc R5 driver and the device tree
  binding.
- remove mailbox from device tree binding as it is not necessary for elf
  loading 
v7:
- remove unused headers
- zynqmp_r5_remoteproc_probe:lockstep_mode from u32* to u32
- device-tree binding "lockstep-mode"  to "xlnx,cluster-mode"
- remove zynqmp_r5_mem_probe and loop to Probe R5 memory devices at
  probe()
- remove is_r5_mode_set from  zynqmp rpu remote processor private data
- do not error out if no mailbox is provided since mailboxes are optional
- remove zynqmp_r5_remoteproc_probe call of platform_set_drvdata as pdata
  is handled in zynqmp_r5_remoteproc_remove
v8:
- remove old acks, reviewed-by's in commit message
v9:
- if zynqmp_r5_remoteproc.c pdata->tx_mc_skbs not initialized, then do not
  call skb_queue_empty
- update arguments and documentation for zynqmp_pm_set_rpu_mode
- in fn zynqmp_pm_force_powerdown, change arg 'target' to 'node'
- zynqmp_pm_request_wakeup update code style
- edit 3/5 patch commit message
- document zynqmp_pm_set_tcm_config and zynqmp_pm_get_rpu_mode
  documentation to include expected return val
- remove unused fn zynqmp_pm_get_node_status
- update 5/5 patch commit message to document supported configurations
  and how they are booted by the driver.
- remove copyrights other than SPDX from zynqmp_r5_remoteproc.c
- compilation warnings no longer raised
- remove unused includes from zynqmp_r5_remoteproc.c
- remove unused  var autoboot from zynqmp_r5_remoteproc.c
- reorder zynqmp_r5_pdata fpr small mem savings due to alignment
- zynqmp_pm_set_tcm_config and zynqmp_pm_set_rpu_mode uses second arg
- zynqmp_r5_remoteproc.c use of zynqmp_pm_set_tcm_config now does not
  have output arg
- in tcm handling, unconditionally use &= 0x000fffff mask since all nodes
  in this fn are for tcm
- update comments for translating dma field in tcm handling to device
  address
- update calls to rproc_mem_entry_init in parse_mem_regions so that there
  are only 2 cases for types of carveouts instead of 3
- in parse_mem_regions, check if device tree node is null before using it
- add example device tree nodes used in parse_mem_regions and tcm parsing
- add comment for vring id node length
- add check for string length so that vring id is at least min length
- move tcm nodes from reserved mem to instead own device tree nodes
   and only use them if enabled in device tree
- add comment for explaining handling of rproc_elf_load_rsc_table
- remove obsolete check for "if (vqid < 0)" in zynqmp_r5_rproc_kick
- remove unused field mems in struct zynqmp_r5_pdata
- remove call to zynqmp_r5_mem_probe and the fn itself as tcm handling
  is done by zyqmp_r5_pm_request_tcm
- remove obsolete setting of dma_ops and parent device dma_mask
- remove obsolete use of of_dma_configure
- add comment for call to r5_set_mode fn
- make mbox usage optional and gracefully inform user via dev_dbg if not
  present
- change lockstep_mode from u32* to u32
- update zynqmp_pm_set_rpu_mode and zynqmp_pm_set_rpu_mode documentation
  and remove unused args
v10:
- add include types.h to xlnx-zynqmp.h for compilation
v11:
- update usage of zynqmp_pm_get_rpu_mode to return rpu mode in enum
- update zynqmp_pm_set_tcm_config and zynqmp_pm_set_rpu_mode arguments to
  remove unused args
- use enums instead of u32 where possible in zynqmp_r5_remoteproc
- zynqmp_r5_remoteproc: update prints to not use carriage return, just
  newline
- zynqmp_r5_remoteproc: look up tcm banks via property instead of string
  name
- print device tree nodes with %pOF instead of %s with node name field
- update tcm release to unmap VA
- handle r5-1 use case
- device tree binding r5 node to have link to TCMs via
  meta-memory-regions property
- fix device tree binding so no warnings from 'make dt_binding_check'
v12:
- update signed off by so that latest developer name is last
- in drivers/firmware/zynqmp.c, update zynqmp_pm_set_rpu_mode so rpu_mode
  is only set if no error
- update args for zynqmp_pm_set_rpu_mode, zynqmp_pm_set_tcm_config fn
  arg's to reflect what is expected in the function and the usage in
  zynqmp_r5_remoteproc accordingly
v13:
- zynqmp_pm_get_rpu_mode argument zynqmp_pm_get_rpu_mode is
  only set if no error
v14:
- rebase off v5.9-rc3 kernel
- concerns were raised about the new property meta-memory-regions.
  There is no clear direction so for the moment I kept it in the series
- in device tree binding, place IPC nodes in RAM in the reserved memory section
- change zynqmp_r5_remoteproc::rpus and rpu_mode to static
- fix typo
- zynqmp_r5_remoteproc::r5_set_mode set rpu mode from
  property specified in device tree
- use u32 instead of u32* to store in remoteproc memory entry private data
  for pnode_id information
- always call r5_set_mode on probe
- remove alloc of zynqmp_r5_pdata in
  zynqmp_r5_remoteproc::zynqmp_r5_remoteproc_probe as there is static
  allocation already
- error at probe time if lockstep-mode property not present in device tree
- update commit message as per review
- remove dependency on MAILBOX in makefile as ZYNQMP_IPI_MBOX is present
- remove unused macros
- update comment ordering of zynqmp_r5_pdata to match struct definition
- zynqmp_r5_remoteproc::tcm_mem_release error if pnode id is invalid
- remove obsolete TODOs
- only call zynqmp_r5_remoteproc::zynqmp_r5_probe if the index is valid
- remove uneven dev_dbg/dev_err fn calls

Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 119 +++
 drivers/firmware/xilinx/zynqmp.c              |  96 +++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 775 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  60 ++
 6 files changed, 1059 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

