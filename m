Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08F8C433E6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 15:46:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC6BA64E5C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 15:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhBWPp6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 10:45:58 -0500
Received: from mail-dm6nam12on2081.outbound.protection.outlook.com ([40.107.243.81]:20848
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233311AbhBWPpr (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 10:45:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/WUn6HRAP2y4IUAi/ZnnRIbOK2irBEdORwf1jA2d+T0A0nk4P1U38lh2rBnIfbNOH4/icWKvwm6kEzNShX+yJTRp9jlui8fp0YBb56+o+Mhwq0N901Zfv6LxBVkL0OaYoP0IIn9iXjeMDc32meE6Rvum3nx4+1ZIAGRmi/X/pvfzwDRc/ew8vv5ZL2eAJuRJ9h/gpu/x3zMbTeySj0O0ION2WhjayXwGCAG+7wjk4L4MciWXuHJlKQxcsfx+/R40ab4jjrqzEpkeESq5Ajw6Zc8MuQXFn14xrg0vKpkSXtFX0fGG1SvqObi+n67TWb2IaTDTLNx1HA7uMGtBKAvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIYdrva6H9kIaRX0b2IF5a0nO4/e+Uw1FIKrnbv4lig=;
 b=eOJA4KlIsExYA2nVWxbGPTUlS56E2X+ZYOA9b/iJszj44XPuU+hwKGI0tdvZOHPLfKyghlgawvpzaqQnLjuso8WMEZ5MPdZjZQ6geKFjdH1Dkb4m19L36fMIjZejYzC0mq2a8+3YxWzBJtZWYoBybB4+qozcqJ1jfXvCg3ma4inLeU9xeQzdyWk3rV6qUMamC6V/BaYAgCOpxdBaD8/Ybd7LO68SMb8DUFVsH5zO5I3WmTWGlPUS0dHff8GcNIwDhWrR2r/Z+9jBRKODUeHCPxTctpYLfIJsl9US5EZRuT69jhtY9GQrgB6yCvQ3MDUWQhauCPBMrxzpHVcQ0I5gdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIYdrva6H9kIaRX0b2IF5a0nO4/e+Uw1FIKrnbv4lig=;
 b=Uoil20EyaP1TA4BDb57yTgJlZ0xtlFuY0c0fc7+tLwIDh6Qt5d5HnYumG89XrqeQOQbdZrRw5ZXFX2jDcYHZWhaDTgheQs2wl6oTzvwPc5k7CiJULPR/V1zlj7YiqKiSN4p1b7ECw9M2Cg/4luQ3YZGAGtS9i+wPcdG3yRzl/ug=
Received: from MN2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:208:1a0::13)
 by BY5PR02MB6625.namprd02.prod.outlook.com (2603:10b6:a03:209::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Tue, 23 Feb
 2021 15:44:51 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:1a0:cafe::df) by MN2PR07CA0003.outlook.office365.com
 (2603:10b6:208:1a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Tue, 23 Feb 2021 15:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 15:44:51 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 23 Feb 2021 07:44:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 23 Feb 2021 07:44:47 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=40282 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1lEZrj-0006uk-7n; Tue, 23 Feb 2021 07:44:47 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v26 0/5] Add initial zynqmp R5 remoteproc driver
Date:   Tue, 23 Feb 2021 07:44:42 -0800
Message-ID: <20210223154447.13247-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b627133-d693-4ea9-0b13-08d8d811f52f
X-MS-TrafficTypeDiagnostic: BY5PR02MB6625:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6625755A0CE54CEDC0A44FABB5809@BY5PR02MB6625.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cW6qmwqe2hZDPAps0+OCFWnUH0K+29jjxmH3tWR+xADclMwtZcAY+RhGMXcDZenEJ86HarQN+VanlgGi10cpT7YB+UavuWGdfIWF9Smkh6fLqNUXDcEZDU+Ha/dZPBad+ywCY4n6P3/bW19fcml7NCqp5WLyPQru8YPtmcTNE2Pz27kfaFxqDK6siNfqPNKJ4ikPlFZhEqHeBH6pYTmcy/csOq/ZkRv6iX7QXKcGFb0osICGmBo3pEn4HODi0whFMLjG18Y0NV9l+xHVDpPkWTMxgXclLoTdVr1sLLti14ghZlCmZrhpVUuJYaDLGrOHkJ+Sn5wntjE1NlWGSh1CdfeMEJa+vN3eN25uSSFRSxHANH5hU+JW7j8ba8xntS6arhBc1w4BAGFjMLnS4crETxlU016CUo9s7a0d47bLvxEJPg078KGj1TvGcMgw1hXmg0RJX48+xvH1myjBl8RA5r5c5jMpzkkgVXZWFUAKMdnE4WTn2FAfqLDIUy4RI+9xv++6k6rs9o5OnCIzrYn+9oJjmZb4q/Kg15enZbeIu1E5uDAEXWNXFsVXkoAfu2QJXykQxHIVhSybLiI0IOsVthj+YpOIJYJFIBRZYzTVUAeFKCDuRRTJA1EPFQk+pMlxhF7jqzx/Ji2hS7OS3VO9tp456zcytNfeEqtPuoX5vkzU3x8FCHU0wLKdrDZAQhjEeLhgvjIu3Xmgwyo3os0BJ1iN1ZMr6kuG2i30mEJC/77oWl195C1IIgfAGdmEe/fmznSZDQ4wYolMQVqgz3iz7A==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(36840700001)(36756003)(1076003)(8676002)(5660300002)(44832011)(7636003)(186003)(47076005)(6666004)(966005)(356005)(36906005)(70586007)(6916009)(316002)(9786002)(7696005)(4326008)(54906003)(36860700001)(426003)(83380400001)(70206006)(26005)(336012)(2906002)(2616005)(8936002)(82310400003)(82740400003)(107886003)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:44:51.1060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b627133-d693-4ea9-0b13-08d8d811f52f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6625
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
remotproc driver, we can boot the R5 sub-system in two different
configurations -
	* Split
	* Lockstep

The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
Platform Management Unit that handles the R5 configuration, memory access
and R5 lifecycle management. The interface to this manager is done in this
driver via zynqmp_pm_* function calls.

v26:
- add prepare and unprepare to handle Xilinx platform management's
  request_node and release node using each core's list of srams
  that is constructed in each core's zynqmp_r5_probe.
- add new field sram to zynqmp_r5_rproc to store each core's srams
  being used as described in device tree. This helps to reduce unneeded looping
  of the sram prop in device tree. As now only zynqmp_r5_probe has to parse
  and validate each core's sram property. The ensuing prepare, unprepare
  and parse_fw logic are now much simpler.
- similarly add 'size' field to struct sram_addr_data to simplify
  prepare, unprepare and parse_fw.

Previous version:
https://patchwork.kernel.org/project/linux-remoteproc/list/?series=412083


Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 ++++
 drivers/firmware/xilinx/zynqmp.c              |  96 ++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 954 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  64 ++
 6 files changed, 1356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

