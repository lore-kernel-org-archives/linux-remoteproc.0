Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59CBC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 06:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbhKWGYF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 01:24:05 -0500
Received: from mail-co1nam11on2086.outbound.protection.outlook.com ([40.107.220.86]:58627
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229722AbhKWGYE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 01:24:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5QLq4W7itR5QcaUwZmaNmp9PHlibpdKRUR8XRnivKLRFYZ6M7v6S+h7Dx4d3oI3gqWYs8w4A7gaELfypHc59XakpqJcKhEQ0sNn9buJZRH5lHg2vNDkU6+ThmtXkrW5KNMgImi/33spw0NZSTse1tqwH9oioTXvtZjBKmaC4PS2afrWIr4ggAtkniWRIYEXY76ceAo+nzWOLazEAbuCaxQXDIUXg45cJgaA7k8VplP5AL+C4jWFX8vAAKkzEDTKxYpoKQ7TD58RtRw6OBheJWN6R8pZMvA1o8zqZylWloe1yP41cxWESt+UwuW9lMWGsaxMMOWlWib2b2dEqiOjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YglcUabop8sqz9Sj7V0rXE8IT9kuwCbhOayQZQNaUfk=;
 b=N/cuMh3tiAK+qquFsOGIi4m7yDf1djrE/kZdLgQsvMMN1/5EgXvQygSSP5RCpG5q0nduJuL37Cd+fDMGpecp12CXkf2yQgXR0OOqaU6QwI1qB5uNMuDioq7nMoCr9nbBFkSldt70b0LfK//dh2OyUrtwCxP0VjXQjHtzm0NUK05z5np/gITeiRsUbkclCbD3dKcXZyVyiF8B8tAtodpMmi2gqc0CKT+nRp6lGbEiYQP0UkxfYab/EHYEQ5Lqm/k2OgrGB1B0JEDxt/FMknWNzAFKg1cu2YIC6ZpsS4n0egsiygcMMjpTy3axOD2d5QhuzKahr7a3Mf37ZucatiGhnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YglcUabop8sqz9Sj7V0rXE8IT9kuwCbhOayQZQNaUfk=;
 b=AyB9CfgUp8sR4Y3aH3ckwkS/C6cVQ6G8EmouiDi0TyqsJ7FmhYU/ekUV937PWYvmS+KrvaJ7rf4j914GZvziPgoqy9ztinDmfBUxL2oDMCdmg1sHLG38v1pJTQA+6N/VIaXXEyAl1YsR9XYmJyXMdogDNNeSqx6GPyK1kvcYTOA=
Received: from BN6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:405:2::26)
 by SA2PR02MB7852.namprd02.prod.outlook.com (2603:10b6:806:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 06:20:54 +0000
Received: from BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::54) by BN6PR11CA0016.outlook.office365.com
 (2603:10b6:405:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Tue, 23 Nov 2021 06:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT020.mail.protection.outlook.com (10.13.2.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 06:20:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 22:20:53 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 22:20:53 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=33042 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mpPAj-0001Zw-MN; Mon, 22 Nov 2021 22:20:53 -0800
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
Subject: [PATCH v2 0/6] Add Xilinx RPU subsystem support
Date:   Mon, 22 Nov 2021 22:20:44 -0800
Message-ID: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d774547d-a5cf-4eff-7aac-08d9ae4967bd
X-MS-TrafficTypeDiagnostic: SA2PR02MB7852:
X-Microsoft-Antispam-PRVS: <SA2PR02MB7852F402829D97445C32F8CCCA609@SA2PR02MB7852.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTCttXeKMSur5sihpFEc+Arco0nfDboorhJkIfoYG5uPdQmwLUUIxHs7/AvNixq4nru8DDCO3fN58njb+R3AKHmBi7BucT7wJAm0O547FsRzVixLobj0bpU/UWDa2lkWRH+WByiC3GsOhR5YI6w90P9XY4N/v5oNA4p5Yi+oH08ggG1dty2SNz0ta21JN3MDyWYgsFuwLpcZ7ypAHFlE1sJmCjArEnzEy+26QX+VYb8RQr2vpk9uD0O+wiG1KJGLfmxezMdBTG1rAI1C+d4l4GcBerx16kG4kyU6apRTqVeZCMPhi5aEarZ936uQaf++ElcqT+pFoBSvL++xcStMU9rE3HUSB+n/UEJ/nzmhNJfESPmRZl/79deY/zJUhE0eWjTi8e1aTbz+eQI+O5PjiCHo3EA0Fd00EAY2AyrwYgnhNkuoj/1VVv/pSqcfH8HhffaBecNiPbv2aIVPWkuUfsevVHTqlnrzyfLlSEzAufTQM3wLKziFPt5hgKFjJy0h52b2EBtZfASORO4jgzQRmGrW+O3yOoxjbry6I2nEhpxNBlc8MkKHqhWTSPtkbo8fk4jcFnS/SFyBDno7QKf1ucp52rfumRbI6NAOx5rv9HRNYv1+n04jaiALMko5iSgMXdrXDAuc7hU5mVuFleIQ8Nj1r/HET7R6i93pFZcNU4z56hUE55l7eKb0p13E2NP7vRoROyhKz+7bMSwKwlWjyXcjLPn68T9zaIOEslCXQQo=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(2906002)(36860700001)(9786002)(8676002)(70206006)(336012)(7636003)(82310400004)(8936002)(44832011)(426003)(83380400001)(508600001)(47076005)(4326008)(5660300002)(36756003)(356005)(26005)(110136005)(316002)(36906005)(186003)(1076003)(6636002)(54906003)(2616005)(7696005)(70586007)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 06:20:54.4363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d774547d-a5cf-4eff-7aac-08d9ae4967bd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7852
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


This patch series adds bindings document for RPU subsystem found on Xilinx
ZynqMP platforms. It also adds device nodes and driver to enable RPU subsytem
in split mode and lockstep mode.

Xilinx ZynqMP platform contains Remote Processing Unit(RPU). RPU subsystem
contains two arm cortex r5f cores. RPU subsystem can be configured in
split mode, locsktep mode and single-cpu mode.

RPU subsystem also contains 4 Tightly Coupled Memory(TCM) banks. In lockstep
mode, all 4 banks are combined and total of 256KB memory is made available to
r5 core0. In split mode, both cores can access two TCM banks i.e. 128 KB.

RPU can also fetch data and execute instructions from DDR memory along with
TCM memory.

Changes in v2:
 - Remove proprietary copyright footer from cover letter


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
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
 create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c


base-commit: c1fe10d238c0256a77dbc4bf6493b9782b2a218d
-- 
2.25.1

