Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00ABFC5519F
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF49D20719
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="SNY91hPs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgKNQtZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 14 Nov 2020 11:49:25 -0500
Received: from mail-mw2nam12on2069.outbound.protection.outlook.com ([40.107.244.69]:43233
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726265AbgKNQtY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 14 Nov 2020 11:49:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABkpmdJ4qYNvlN5F/loOeYKWl/RrAdspf4nnlzU9fhaI1F7lMWsUoYLpHYUWUEhCo0L8u53ClNiKosrqBrKK9aRLgppUea4U8eubmk4g9gxqggOh82AjT2XReAQe2nwxVTM6nZJEAujpkHlaDmdvL9r5Cu6sDAQ10T1rrEEEeOgbuEwcDl1LAvZHgpeYEvpe832V8xbgYFUN60/CeBPGbUUppaDcynQERQSyqR/diPHjUrUamkn5yoXbrxtqhKiU7dEvMq7tt4/jZKgjKt+TotSwshXeD4RlviYQ+d0alIzQhW/gTZ6UbE7Z4ncGCNvziLQRR5+SvMajwRoaLShxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB1BET5OrzqxM/2rFMEzxNkG6MsW8cwwPBZR1R4KSRA=;
 b=NrT90o15Z3vAbnPUcarlVypAIh1PguTAYymcBKRDX1Uq6CdH50fdTSucMUgrqD/juKS6Fr8PkIr/uI0OQZJQkYT1hPVHTrV55AjsBR3LBAIOH5OwlWUcQdPAXAimTPgasmca1oam4FAedGJJQv0L67WpZ5wcGyGniTyoOq26/7ySQuqJBqgPJsQmIzyyoyqr13PYMo9otmzmh/VY/G3Dv3xLUgxLCvvATMPCM9LCpI/atRt0AU9G97JdKC4cc7sZLILyRjwdTxmf/U0FlIfFnxUPqjiOuD95u98oTU2+5tGn1GuSTvac/VlUt5eWWWtF0cXnHqGPueWHZqaTLBkszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB1BET5OrzqxM/2rFMEzxNkG6MsW8cwwPBZR1R4KSRA=;
 b=SNY91hPsPmv/4jiXWBl3wkyIWbOrWGVc33HvqgR0TAN67hMxo3qx4HFEHS+HGohadamt78d+PS2DRhlam8fQwn2Hh03HTaXnhggED0qru2VaRh7+m5JAe5TrKFf6TX36aBUoUT8vG5O7WAZ1+ovhDYQVdqxa892eKPnISc96K7g=
Received: from SA9PR10CA0018.namprd10.prod.outlook.com (2603:10b6:806:a7::23)
 by SJ0PR02MB7597.namprd02.prod.outlook.com (2603:10b6:a03:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Sat, 14 Nov
 2020 16:49:22 +0000
Received: from SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::dc) by SA9PR10CA0018.outlook.office365.com
 (2603:10b6:806:a7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Sat, 14 Nov 2020 16:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT009.mail.protection.outlook.com (10.152.73.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Sat, 14 Nov 2020 16:49:22 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sat, 14 Nov 2020 08:49:21 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sat, 14 Nov 2020 08:49:21 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=38914 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kdyjp-0007Ai-A6; Sat, 14 Nov 2020 08:49:21 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v23 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Sat, 14 Nov 2020 08:49:16 -0800
Message-ID: <20201114164921.14573-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3560a453-7b90-40bc-a3de-08d888bd3cc0
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7597:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB759757F1492C44693BA82056B5E50@SJ0PR02MB7597.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3UhK/V/M9t/yoTPXgnGEm8NCGYtLEKgK2wGLRdSCPWLSnnOb2/0duwgcCnYgQIDBxjCZGyyncQoms8v0ea1tHZ0zwRpWRGOn1imlYgH3H612krLo+ZAKx1E8pfG5QGREB4b2HLoUv3IZTREJXSH5zUtDIKIabhXPZJYAOFrebHImzDUanTBVdUT3Zh9lS+8OGQ4M+jCieNl4HeTdTk5QmQJRvMNBzDDTssxpjVQE2EA50CREAm/j9qN2mZb6Hp6nHNPXQ5wdyzkceTPGYL894zSkpZPnx6AkGOGBCAno2iSosAzzYTpWFqeW4N0zgEBeK7MKu7zF4oNL3wl6C6L7RawEs3gwqL4Is4gK8OislNSaX/fuv6H69zkWqCn2sZQ2h9ap5wYRVip/UpSJvmbV1t13iepvGbpi8YJAw3zB2vfHM/kVlYvGLnSUpWD36F/YkEhbJEbRjQYEZTAeWDZSYKcvKN+y3P1tUeB6qXKA0sKG/JgfdttuOLVbbbhJFtsM
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(46966005)(5660300002)(8936002)(54906003)(47076004)(4326008)(8676002)(6666004)(26005)(186003)(7696005)(82310400003)(7636003)(426003)(1076003)(36756003)(44832011)(6916009)(316002)(356005)(336012)(82740400003)(2906002)(70586007)(36906005)(83380400001)(966005)(478600001)(9786002)(70206006)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2020 16:49:22.1569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3560a453-7b90-40bc-a3de-08d888bd3cc0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7597
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

v23:
- add TCM Nodes to xlnx-zynqmp.h to be used in R5 Remoteproc Driver
- Update grammar and capitalization in device tree bindings and R5 remoteproc driver comments
- Update device tree bindings and driver to align with TI Remoteproc R5 driver
- fix minor comments in v22 review

Previous version:
https://patchwork.kernel.org/project/linux-remoteproc/list/?series=376801


Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 238 +++++
 drivers/firmware/xilinx/zynqmp.c              |  96 ++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 872 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  64 ++
 6 files changed, 1279 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

