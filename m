Return-Path: <SRS0=eTbm=EJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEA1C55178
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 18:23:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0045E2071A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 18:23:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="ZyJZvcwx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgKCSXn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:23:43 -0500
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com ([40.107.93.75]:56545
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725997AbgKCSXn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:23:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKDFQYYvd5F90+q0RLUB6GVMJFrkH3WfO5LeAQsjvWMiJPFDxvOUrwWO2gopfkAtNAxPfegTCNyCt3KtaD3nJzsJfrPlNON1BGGbx5J2u2U+tnnmQlqVuJoq2xFQx89GHo8Chq4kCYEDJxnx/QTqbwpAyr31t68T+jJs9bDU16NfSSdmQSEIUbX8oDgAYOVIZCT8TJESVh+f4h4PAezT8eUDRn5BQS62kCxsraACuH1jvOwQKSez/1G0LlOC7tNO67UiXxMDSFUnWLPvky2gZ1QcBGvnRX82MJuq6cDZIa2iRbUjbuMm7b6e2KMoK/y1/D+npqiZ6bl80U+kjSoBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coIV3rz636JZQ2KtIv0NhA70YUTgmSeqysyWr6mNiBY=;
 b=js27T3HR/Oi7DpZ6v1UtOgQZz49kJ77Nc3vtMj9EyCicP0HMi3iVyBGhJV/C0Vmo+448T7Y5j5ppHE6QK50W/bIZD2MzoI8UOXn4epRX1SGUAldFAz0bE6Vfl50vvbNEgqQWUTMW5xZOMYp/GRt0piHsQsDg1VzZ+Kj5vp632pv10dyZMC1VpFyL+sGSVL7tXUTHPI+uQdsLBkkaBFZGjklYcwfocN85MCvE+5cwIxSCbYwnJNkJfc2rL05HgSUXAL772JmEzxA5Cq9km0Q90zqiXqzxfUHovRQlwUV2WD+g1knXW8st+UIUByuVh7W9zbSTJfU+rfwR16iCxk7DPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coIV3rz636JZQ2KtIv0NhA70YUTgmSeqysyWr6mNiBY=;
 b=ZyJZvcwxIlwpIH+WzBKqd2DrccTdK7Zm+jsJVJkepYPrRsVmDwTLrr9H4o+4L398nkIkvSVSSUCFOxS1hyZIqHkxkupAG/+hae0aKPiuQAvkjowosdhirCfuCVNUOr1m+tA5ZSgOJUKd/rRLqaodSdGEr1aKezgX5uNY4j5JWA8=
Received: from MN2PR02CA0021.namprd02.prod.outlook.com (2603:10b6:208:fc::34)
 by DM6PR02MB6377.namprd02.prod.outlook.com (2603:10b6:5:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 18:23:40 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:fc:cafe::4c) by MN2PR02CA0021.outlook.office365.com
 (2603:10b6:208:fc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 18:23:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 18:23:40 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 3 Nov 2020 10:23:40 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 3 Nov 2020 10:23:40 -0800
Envelope-to: stefanos@xilinx.com,
 michael.auchter@ni.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=58698 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1ka0y3-0002gB-Vx; Tue, 03 Nov 2020 10:23:40 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v22 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Tue, 3 Nov 2020 10:23:34 -0800
Message-ID: <20201103182339.14286-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d75122f-2544-49a7-6f8c-08d8802596e5
X-MS-TrafficTypeDiagnostic: DM6PR02MB6377:
X-Microsoft-Antispam-PRVS: <DM6PR02MB63779470BB1553E8C0925315B5110@DM6PR02MB6377.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kDBgdjrj8Q9L/Acjq1aSrjCPv6KuVzBzlzpKc3j/7E7LdHKYfWSJnTuOl6EDUqgvtYaYhtyFu6UGSz1gzcDL+0isei73kGD/nlI6L63Ii5vZy5obYiTwLnvhOQqiEHL9z2jFCrsmK+oASgwciempatAMRG5rvFNJu8jYsiyo07250RN0xH/fnp0QMmhFTuSVD00fqtmdD3GPwDywFGgIE70nR7SCLniw+wCdayeG/3UDA0XsE1bHKJnT/BMw0olfueNOFoy44iTTHg+jvVBWWgUsyD+galHFXU4Myo3eEw5zBDEgYXjdYWI8Y24/l3ZfRteaDjOlH5ygsM3KNx5HM1gQVo4PHgCjMMSVlBdlMHihHmcS64VtEIl+96SCgecub7tFfLkLOWnfqWuGKoAEkxV9WZ8xCTocDR/BZZsbNuicxW29m4ggvKApgNrJbqo7De7TnaFcuSS53NWo88mFxt3apQsShWkGyRvbFKtEjiQkXzptWgekTpInIhEjqAfd
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(966005)(44832011)(478600001)(6666004)(8936002)(5660300002)(1076003)(70586007)(70206006)(9786002)(8676002)(47076004)(82310400003)(4326008)(426003)(26005)(186003)(336012)(36906005)(54906003)(36756003)(316002)(82740400003)(83380400001)(7636003)(2616005)(7696005)(356005)(110136005)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 18:23:40.5269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d75122f-2544-49a7-6f8c-08d8802596e5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6377
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update Xilinx R5 Remoteproc Driver as follows:
- update documented param list for zynqmp_r5_probe
- remove use-after-free lines in zynqmp_r5_probe,
  zynqmp_r5_remoteproc_probe, and zynqmp_r5_remoteproc_remove
- update path for error handling in zynqmp_r5_probe and
  zynqmp_r5_remoteproc_probe
- update zynqmp_r5_rproc_kick to only use mailbox-related
  properties if the rproc pointer's corresponding of_node
  has mbox properties present, otherwise kick should and will
  do nothing

Previous version https://patchwork.kernel.org/project/linux-remoteproc/list/?series=374399

Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 143 ++++
 drivers/firmware/xilinx/zynqmp.c              |  96 +++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 779 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  60 ++
 6 files changed, 1087 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

