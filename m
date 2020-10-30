Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16A1C00A89
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 21:28:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B6FF221FA
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 21:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="niphpXze"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgJ3V2j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 17:28:39 -0400
Received: from mail-dm6nam11on2067.outbound.protection.outlook.com ([40.107.223.67]:42753
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726163AbgJ3V2i (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 17:28:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOWNK5BL/26KLV1525vcu45CIZiOJhAK/TR4Ky0sRJf9MH6rH3cXerj8smqi6y+OoKwdd9y5Hmp2n0gY1/07wdh+8tawxD6Ny64ZVIahb6OwtozGj19UhQDc1FiOO/ggh6nHjbUEQCF86szTmGqKZ0qwwkGVgfs9QPMXQDcOAG6Y+ET3+wfw6YiQIlhJadchCvWSbrrzLK/YJcuPm2Jq/vT3iHj3KakT7SFJ2gSB93S2KcQ0d318ZrwlCwcGdpHJG846jRYtdCNmIbAl5So29sESvnKzb0gZyhar8iJc8lsIST5S+mZpMhsqIEjX30OU4tqlvWeqUq11Ui0kinZiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a/z321J4dCS+Kgc3upj5Y5XKcWcnWBA81iQTbn4WwI=;
 b=jrQPkSH8Xss8wskVlT4BRcLtBbpbDQt0HCaJh0bAZ4ryCzJVsGxSfro/j1PlCAoznvkdeBnBI9iiihXBnpVNYQs8vNnEAmiDZOR/ptJmgFsQfUok6hAdefg1Ud7pqpvs0RjruP6OmBpnTBEBJVedBsterBPb/3ubriGe05A4Rf9mCKoFj32nziOrL80Wwot81OscN9g2d2SFLx2iIHd4hJkB94g75toXhJ44hjgu7JKefi3DPN/weJ/jXfSKwU+W21318RCsRh3LawQ80yiKyMpBKFnOGqC4ACe8iOYb6uLSmeprMcGTsVXGS4ZHA0eSPLMk2l5TfrMw/yr3UdZjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a/z321J4dCS+Kgc3upj5Y5XKcWcnWBA81iQTbn4WwI=;
 b=niphpXzeJHNke0DEv1EGA1jiCR+U9+mOfilpm+KbZfxEuSSUupwqH5V70sX8kh9wYEqoGazLGYleFLBcHhdrhTEXKcRXR1SUNp/6wDwO+593J56Om3yu43Ut3M71+R6dUsM9FTy9njhvZSDXJrniPdjs5na9y0QaA3Tu5LSlaBo=
Received: from SN4PR0701CA0028.namprd07.prod.outlook.com
 (2603:10b6:803:2d::29) by BYAPR02MB4742.namprd02.prod.outlook.com
 (2603:10b6:a03:4d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 21:28:36 +0000
Received: from SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2d:cafe::cc) by SN4PR0701CA0028.outlook.office365.com
 (2603:10b6:803:2d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 21:28:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT064.mail.protection.outlook.com (10.152.72.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3499.20 via Frontend Transport; Fri, 30 Oct 2020 21:28:35 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 30 Oct 2020 14:28:34 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 30 Oct 2020 14:28:34 -0700
Envelope-to: stefanos@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=56470 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kYbwo-0003JM-Cs; Fri, 30 Oct 2020 14:28:34 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <stefanos@xilinx.com>, <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v20 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Fri, 30 Oct 2020 14:28:29 -0700
Message-ID: <20201030212834.18270-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c07826d0-bec9-4f06-706f-08d87d1ac2a1
X-MS-TrafficTypeDiagnostic: BYAPR02MB4742:
X-Microsoft-Antispam-PRVS: <BYAPR02MB474206C0E45271BEDFA8F76CB5150@BYAPR02MB4742.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ii3fXZFjk9OxgPMO7PxPxcj9ovEQZYRnBPdeGnHJv6iEpwx5PFHv4gAgAqeg8p2C9hqpae9Eydg+qReVggd06SMw+SYlH6xrRt6aLIZZ8QiSXWsSXvd0P5RJHgmDs8YFnhxdbEnGNRgJXYV3cRvsPdYd4Oj7vzKpNYv38A6DgGVrJ19BabH8V/5crbXQe7nKKpVMLtW82TmJVn03NiLosM/xubGUDf3zktg2Yj+JiOPnN4BPTeJ9tGQh1kAnUN56REEkAMNz8RvrvNZqHkmySd8X7INZ7/zns9RcjWi3lA/8lmdiJjzcexajRfN2AYt1b+R/1v9Q/A4m1X4wSkrma4pHTgLsHiSIEV8QHhKU4duWB/wUySpSJ3qAB6pleHxZCrXfTH9reLlnrSN0E6jisnbPhbgPrDIe78gbXtYiQZjURLk1hjuNOK6v6ozdR8LVeUWN+a8LTlayurtCk+IBNhLaoPeifKlR0Bj/lT44CD+upUvP8+ycRLyzLjCWiAIv
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(356005)(336012)(36756003)(82310400003)(47076004)(186003)(2906002)(83380400001)(316002)(8676002)(2616005)(1076003)(426003)(4326008)(8936002)(5660300002)(44832011)(9786002)(82740400003)(26005)(36906005)(110136005)(54906003)(7636003)(478600001)(70206006)(6666004)(7696005)(70586007)(966005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 21:28:35.9897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c07826d0-bec9-4f06-706f-08d87d1ac2a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4742
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update as follows:

Xilinx R5 Device Tree Bindings
- update typos and style
- add compat string for singular r5 core to accomodate
  devm_of_platform_populate


Remoteproc Driver:
- remove zynqmp_r5_rproc::dt_node and replace usage with
  zynqmp_r5_rproc->dev->of_node throughout file
- emulate TI K3 R5 probe use of devm_of_platform_populate to set devices for
  each R5 core's corresponding remoteproc device
- replace zynqmp_r5_rproc var name 'core' to 'z_rproc' throughout file for
  consistency
- update indentation
- remove unused var in zynqmp_r5_remoteproc_probe
- update typo in Kconfig


Previous version https://patchwork.kernel.org/project/linux-remoteproc/list/?series=367125

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
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 771 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  60 ++
 6 files changed, 1079 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

