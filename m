Return-Path: <SRS0=A3Cg=DI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AE1C47427
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 21:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD34A20759
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 21:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="WgO6TdZf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733093AbgJAVGN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Oct 2020 17:06:13 -0400
Received: from mail-eopbgr770058.outbound.protection.outlook.com ([40.107.77.58]:27204
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727124AbgJAVGA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Oct 2020 17:06:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czI9bmnQ3c8ZJCwqURIB4P2bsqBWavoZ/mY4cfzfPdMacf5clNVsN0HbmUkrOElDgdv5RuBQWoHO9htajMw9gqHTLJzmT0wQciMZyIWr7+aae6gkQB09Qvo2MgQagSk5EERSMFoCAnpW81Sfo6y16IHcy8oGyJv1iTZQYxS4C8Wr2AfhYIkB7WIqFhu92mfq06BkcHKZHulOIN1KwGGHZ2zA+fzNaYcstJppp5TqH/sU1xmperGXsb2DBxTq5+2IW3h15r6XAM809odypG+MsNdi6HTq9v0Y3zeiR+AAyChbWHk898E8SbIKcU8/CP7ttvUKZP4OgYr9/TASnR4wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMTFdXofYigsgSy6bCeE+VEjaAnsEuOcDN8krMm78+w=;
 b=doarDTBsc8jenz7O6q6HkACeBnVQpg1LqV4LWZsi/gc/8xQTK1u09f7FLkABe9nYJywPONlo7MFpS+rqjvTOy9D52gijt9gWxhdplAI4AFFQBsdXqfvkOD0uA4/6+jfGI8RCFLJrhr1f2cgd3Pm3jvr8y2a6lJ5+kNKJN2fI/bygMXYGF2WKb/sHmOQJ2BeZGwsU2DLoQD9UbcSHBebiCmfgExIqLs6CcBzrF4Yc3EcH5lq9IM7pMwVGqlIj9IUOuDT2gss6aQLCY/C9IE5CS4j2Gd4LkW3a4lFkAzFtUx5/DCE/EFOikmxXjx9JZfRLlToXaIg0sc2u9mKQc4oJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=none action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMTFdXofYigsgSy6bCeE+VEjaAnsEuOcDN8krMm78+w=;
 b=WgO6TdZfl0P0WtL9rvEKwDP3+/8Rbt2lg8MKKzyqGMw6IexFu9JrknJguUZt2Q3mI2D5U3/Wpl9TCXR0vI2oE3kpk2nKwPhHBFm1iq4Nnoe15FgxqZVJi56HgHd9gqYRm3Pc6vTfEA5Dtne44LdLLKbE9JFQ65+jKvAdLOHCpdc=
Received: from DM6PR12CA0004.namprd12.prod.outlook.com (2603:10b6:5:1c0::17)
 by DM6PR02MB4699.namprd02.prod.outlook.com (2603:10b6:5:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 21:05:55 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::6) by DM6PR12CA0004.outlook.office365.com
 (2603:10b6:5:1c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 21:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 149.199.60.83) smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none
 (message not signed) header.d=none;lists.infradead.org; dmarc=none
 action=none header.from=xilinx.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of xilinx.com: DNS Timeout)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server id 15.20.3412.21 via Frontend Transport; Thu, 1 Oct 2020 21:05:54
 +0000
Received: from [149.199.38.66] (port=60915 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5lW-0005ZC-DQ; Thu, 01 Oct 2020 14:05:26 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5ly-0000KR-6D; Thu, 01 Oct 2020 14:05:54 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 091L5fXq030066;
        Thu, 1 Oct 2020 14:05:41 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5ll-0000Id-5s; Thu, 01 Oct 2020 14:05:41 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v17 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Thu,  1 Oct 2020 14:05:36 -0700
Message-Id: <20201001210541.32042-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 790a0608-8fb2-4558-d9fc-08d8664dc915
X-MS-TrafficTypeDiagnostic: DM6PR02MB4699:
X-Microsoft-Antispam-PRVS: <DM6PR02MB46994C7604B0B4782206C1C9B5300@DM6PR02MB4699.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYoxJ1qNxDHYpm1fCRsIvGVJ7Uy4Q8SsJakoJpfO+qHIZ1buBxe28l8O4b8tXQ0A/iC00K0xXvmTvsN0N288+WNF+ssOSaO/kidIGr6KIXbrepfhdFSHk0V36zxSsu4/WrqsXvC9T1pFWMTxqyJlvQ8haTs5Vm9I0rKOZ9ht/pW8mnIRQ4koDDiQWSDVe6h7BLWfCke4+0cBQWsU1xul6ixk+XGH3pwQVcNQgeelH2g8SE4X/fEr39QPVFncohZGu9oJbLUfX6f4OgW/vInM7sXl3wcvK9CsIMLE0uc8o935+ObTyp8fQ0qY2py+0L+m5x0Ga5ZJ1O1OSNPmMjiZ+qBe5kKhnvLfKHKJph54g4f21dVT2U+MJ8LRpH7MCDKlGvojkZU0HMwG0sopTha5dA==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(136003)(396003)(39860400002)(346002)(376002)(46966005)(44832011)(5660300002)(70206006)(70586007)(82740400003)(47076004)(4326008)(336012)(83380400001)(6666004)(186003)(9786002)(8676002)(2616005)(26005)(1076003)(356005)(478600001)(8936002)(36756003)(7696005)(82310400003)(2906002)(426003)(63350400001)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 21:05:54.4932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 790a0608-8fb2-4558-d9fc-08d8664dc915
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4699
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
v15:
- change lockstep mode device tree property from acting as
  boolean, to instead being used as, if it is present, then r5 is in lockstep mode. otherwise in split.
- add safeguard for if 2 rpu remoteproc instances are provided then err out
v16:
- replace of_get_property(dev->of_node, "lockstep-mode" with
  of_property_read_bool
- propagate rpu mode specified in device tree through functions instead
  of holding a global, static var
- check child remoteproc nodes via of_get_available_child_count before
  looping through children
- replace check of "pdata->pnode_id == 0" instead by checking rpu's
  zynqmp_r5_pdata* if NULL
- remove old, obsolete checks for dma_pools in zynqmp_r5_remoteproc_remove
- change rpus from zynqmp_r5_pdata[] to zynqmp_r5_pdata*[] so that
  check for pdata->pnode_id == 0 is not needed
v17:
- remove compatible string from tcm bank nodes
- fix style for bindings
- add boolean type to lockstep mode in binding
- add/update descriptions memory-region, meta-memory-regions,
  pnode-id, mbox* properties
- update driver as per kernel-test-robot

Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 142 ++++
 drivers/firmware/xilinx/zynqmp.c              |  96 +++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 778 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  60 ++
 6 files changed, 1085 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

