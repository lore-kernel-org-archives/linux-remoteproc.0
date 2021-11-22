Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB54C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 05:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhKVFmU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 00:42:20 -0500
Received: from mail-dm6nam12on2053.outbound.protection.outlook.com ([40.107.243.53]:60001
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231549AbhKVFmR (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 00:42:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMn1EG1TbmWG3uqBPCtjKg9QBJF2QXVBYj70dhndDLgMkNFIjHrhczzEhLmlHe5UBNGKVDG4B+D5Kpx1j2/gfn2XE+7aBGIzS1MycRaDlBJmW+QdaS92Jus7ophvisiu0iRa6vGNh0ZEDt7kk0C/ruDy/APrNC8qH2trxLcQgLqR/yH9BC9Lrg41aB8NCRSegc2+M5t2WlDj3xVefIgm0Y7kwSM3DuqzLvMM0sXSKGZvSPkH+VBWsDWuOzyvg+t3/SqLjWdw8A7k4mTVLfpUjE4014JvVCUi8koea2xxXK0H8MwQOb08GBDG2JqBaFxM+/8+ZuGBYYMcM520tYSaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y8o5ph+T6RA2L0DeuKcbb7IvTY/wMwZ4BSoL5aY8cA=;
 b=XcU6bIc0tnzRIfZOJbd+bO5eOVxNdCY/JT1nUzjCsUlzfQxV8C+qELjbtPduIOxvOmGKwbhg3O0mG4YLy4wQW2PvvpN1IL+fDgQuy/xVnIegGvVMBAuhPW08JaHCnMKac9Zoo6oZ1wT8f1cUwb+AxvRxgZOU1ylsSlOBc2rZApFtPuBGh0Vho9pr7u7cRmF9O0f9pI8VuzduKUe1Ib+DP5slDhI4fuHJlp2aY0xJfrDsPVfZNGRJnV7HxnQguP38hvLWrKy5Joxu0O6SeE+91wZXEU5dmM7iabEWpoCLoPh7LrZSq9x8oZEhJ17pBOjxU/h9/z+rOqlCdcdQKxk0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y8o5ph+T6RA2L0DeuKcbb7IvTY/wMwZ4BSoL5aY8cA=;
 b=pWwIydIUCcECplXHEy0apJ6vI7x82pQiVDm8Ssb1m/cjMjitGYlTVY5DrdKP5lDBFQwmPkiWPilAjvC1bFOEQVJ4o3FZY6m1fRZeEbANTp2LiFLXIQnjC7RsC1e5LfijSin0nYdemMLmypcQbqgT52hyKdSXJUsJLNHX25ZE53g=
Received: from SN4PR0201CA0050.namprd02.prod.outlook.com
 (2603:10b6:803:20::12) by BY5PR02MB7075.namprd02.prod.outlook.com
 (2603:10b6:a03:231::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 05:39:07 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::a4) by SN4PR0201CA0050.outlook.office365.com
 (2603:10b6:803:20::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 05:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 05:39:07 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 21 Nov 2021 21:39:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 21 Nov 2021 21:39:03 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=59046 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mp22h-000BOC-4p; Sun, 21 Nov 2021 21:39:03 -0800
From:   Tanmay Shah <tanmay.shah@xilinx.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ben Levinsky <ben.levinsky@xilinx.com>,
        Bill Mills <bill.mills@linaro.org>,
        Sergei Korneichuk <sergei.korneichuk@xilinx.com>,
        Tanmay Shah <tanmay.shah@xilinx.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/6] Add Xilinx RPU subsystem support
Date:   Sun, 21 Nov 2021 21:38:50 -0800
Message-ID: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8c45aaa-0601-48a7-01b3-08d9ad7a672c
X-MS-TrafficTypeDiagnostic: BY5PR02MB7075:
X-Microsoft-Antispam-PRVS: <BY5PR02MB7075BA3777A8510F179590DCCA9F9@BY5PR02MB7075.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3ZoFku9yVkCU05RNsFXElCNRk2jvEx5nchEVSvLuKf5UgOr3naF48Y63geqrzozmnU2fNsSV8xD+KYOIDwnyTafKs7Te/kRl7ap1/wAUBGJYeVyNs9yWzN61xluwXoyR3IMbP+UN2qXqoolkDdj+dc922IbBWGFwe56Lcp7JiNePu8hx6FM55GGajJJjTTrKWY5sWueH3OxA809K+B4Cqoh6axGkrebbbysWq0xNALcwBAQ39mrRwgMeiCp1sxgPKJ1u/90sgllZ2d4tICx/XHm1OVAEpbZTeYDAkS3QZc6Nz4jGbTjUGryT5jxobyzA811d5LMSJvefc3xQ/kWpE2pvXl1tMx/+2S03c8Xk52gEYqkmtzH44l9OSnRfn0rHyKBV2Yu9qMY40NDUwKhE2mZUipw2CVwEptSoIe39N0wZV+pKV7fydQ7Fow+lm5IflwHLhKKH5y0B+X/SxI0Fbh5G8790tR+uSFdrK/XwzpGdlDKVbC3YPVDw23Tsf/AUsj2FeBGPs8TQ20wRrY5t+HCi3VnBTEp/wwz534TG0BLMOR55M9GUwZmuo7wdJ4Mx7xkmikAQmtZe13rdzGqSgPmlLFCdevgjXoYL4IjJGQAoZGZRz4K+deu4s7saTl9SG+9Wz1+gAUr5APG4SNcJyJHZLOYinKMiXDq7QpsEhBOuNrDianMJjnFrpPyolhg3Zg9PU3/u0jOebDvTOkSkAqvDRKWAqyK7TITBrjJ+r4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(336012)(44832011)(83380400001)(36860700001)(2616005)(426003)(9786002)(186003)(356005)(70206006)(47076005)(7636003)(8676002)(8936002)(26005)(2906002)(508600001)(1076003)(36756003)(54906003)(70586007)(110136005)(5660300002)(7696005)(4326008)(6636002)(36906005)(316002)(82310400003)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 05:39:07.7378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c45aaa-0601-48a7-01b3-08d9ad7a672c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7075
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch series adds bindings document for RPU subsystem found on Xilinx
ZynqMP platforms. It also adds device nodes and driver to enable RPU subsyt=
em
in split mode and lockstep mode.

Xilinx ZynqMP platform contains Remote Processing Unit(RPU). RPU subsystem
contains two arm cortex r5f cores. RPU subsystem can be configured in
split mode, locsktep mode and single-cpu mode.

RPU subsystem also contains 4 Tightly Coupled Memory(TCM) banks. In lockste=
p
mode, all 4 banks are combined and total of 256KB memory is made available =
to
r5 core0. In split mode, both cores can access two TCM banks i.e. 128 KB.

RPU can also fetch data and execute instructions from DDR memory along with
TCM memory.

Ben Levinsky (3):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs

Tanmay Shah (3):
  dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
  arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
  drivers: remoteproc: Add Xilinx r5 remoteproc driver

 .../bindings/remoteproc/xlnx,r5f-rproc.yaml   | 139 +++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  17 +
 drivers/firmware/xilinx/zynqmp.c              |  96 ++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/xlnx_r5_remoteproc.c       | 959 ++++++++++++++++++
 include/dt-bindings/power/xlnx-zynqmp-power.h |   6 +
 include/linux/firmware/xlnx-zynqmp.h          |  60 ++
 8 files changed, 1290 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,r5f-r=
proc.yaml
 create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c


base-commit: c1fe10d238c0256a77dbc4bf6493b9782b2a218d
--
2.25.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
