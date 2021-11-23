Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFD8C43219
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 06:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbhKWGYZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 01:24:25 -0500
Received: from mail-dm6nam10on2079.outbound.protection.outlook.com ([40.107.93.79]:22657
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233838AbhKWGYV (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 01:24:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTFLQB6J8X+lZ97oc+SmqOrFmmN2zIkO0PUc6A3/XJH1uNN68vjzvtX7rOA3LAsQX+j0/yudqdRCSNdlyvNMRI6lSThWPRXkzQlWvMx5/Tf0qfGQSOAB/QWG9MA6cRQgpy1Kvc8QJ01URRQ9daHkLLDXyPCVEtENDuoNjCNi/Lus8+iN+m6/POCCGz3dcvK6SjeivhYo7sFtJEqPXmQ/wXXIlXwEQfKpr82zaPQgsicX85Z3B8W4hAaAdiLiRdRdQBjtixLEjnGYeMD+SumOyuYbzDFN9DK9MxpW3m4M4pQG2KAa73COlQ/b1XUXGgsr9dyrgm4ZiHyQsWOh4Xv6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REIex1Djjp6zXM3cMB1tK9TmK4fgUwgcCpRIy5EhstQ=;
 b=oAZLEfvQgoPb/qYwonegaVFkCFqALoe8E802/GrH89G2qubF2ObzMjVOrGZZmHw9cstUS6Tg+i25Jwu3qZyPyieqVzXGYikDovOxxFjm/jP1B/ioWeo+9zll9f61A8t1JL6pDmqIjZA4/2VEurdeo96r3TzR83gCcKqY8wmVOa2z47V5cH3DS80A71Y0K3q04z+O5aq09GHnZZ8ohyhZCrONUhkH0Rj2fQS5iclAt25lfAh1tXCbBFD9CtZpp0HCmx/FuS1EU9JKKZAB+RQYWvDA5pR0oWosLuuj3PYfGLpBTvXsvAkyph5X0WISlFTm/M9GkFOz2IwUL0VmMg9eZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REIex1Djjp6zXM3cMB1tK9TmK4fgUwgcCpRIy5EhstQ=;
 b=hoNhp406xPj2yEW2i+BSqd7eWVplqVPwWYCromQbZkw/dUsuE7hY2/19Wa4HnGK4TrinhUzKFIdpds7GO4fVJT0V3BglOQ29VH0ezWIODlpDWPy5FB93ml8ilFNp2qFdB6Fl5TzJpgx5R5VM2I/T4+kJUm6t35hucEuebvVx+hQ=
Received: from BN9PR03CA0519.namprd03.prod.outlook.com (2603:10b6:408:131::14)
 by SN1PR02MB3759.namprd02.prod.outlook.com (2603:10b6:802:2a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 06:21:11 +0000
Received: from BN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::19) by BN9PR03CA0519.outlook.office365.com
 (2603:10b6:408:131::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 06:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT046.mail.protection.outlook.com (10.13.3.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 06:21:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 22:20:54 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 22:20:54 -0800
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
        id 1mpPAj-0001Zw-Q0; Mon, 22 Nov 2021 22:20:53 -0800
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
Subject: [PATCH v2 2/6] arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
Date:   Mon, 22 Nov 2021 22:20:46 -0800
Message-ID: <20211123062050.1442712-3-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
References: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aa1a08b-1399-4b9d-9ace-08d9ae4971c5
X-MS-TrafficTypeDiagnostic: SN1PR02MB3759:
X-Microsoft-Antispam-PRVS: <SN1PR02MB3759EA23F492F45A48ED257CCA609@SN1PR02MB3759.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qobj0L11u5wudiWvXCIFDs37Uy3t83peVywx1BspLxlWyonwfChw+Q2Sh8E8AKzIkyIit0HAHDsr6lqJSbwsiEnNGFcScxKK6HrxPXi/wWgIZiqWr6/pAXtdBYF+5aCqKkcYFp56iWrEjfj9Ejity2TIbfYmqCWnwWhq4YPnT1objC1LKwjXUTOiR0NXVRh/atp0F9WZpQFrCwbaDt/mZiMfEOO6qD3Su3tnI/+3x4NaC6tvso7drG9YOOvdMFL4dlnY/kY6iQRAUp1XwWM9eCZXRS4ivnNyCBr2CgoWtF5ojHwhj5rUTEEtLiipHoj+hxaZ7ioAQKWgFTf1RX0iiCWMCfAzEd855eC0ur6hMGMflwdAmamk3+nsc7SSOkGzNbVQZpKUuvL9DovoNdDXR+PkJM6C8vsqj4pe2AhQrytpxMeAmdtTsdNJgNzhuAuCkXZ1MH3ymHv4OBwbkiYz3+F3ZfVVlNequE+roQYC0wj0etTTunblXYbhgNPRfFjsP+cR821Dk2D9HVZQczMOXYl6zgza5c7RaIVnk7e1prrUyf5liFBEvDqLvXg4Mji0S/c/eJfrRZZwbjR5q5bS4DSMR7xIfz7SB0i5LjZMJze7qn713kNO0E7+ztrByJmjq74gn3CtMatgZO2rtpWfyQ0AbjSpYYsEpo/1Ly6O/XQd2ogMoEqtXtb8PieDo7CrRsJbakARzBaEMg64f92o4plqaRv3nFUmAeJjTHTTZSs=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(26005)(8676002)(110136005)(54906003)(2906002)(5660300002)(1076003)(9786002)(36906005)(8936002)(7696005)(316002)(36756003)(83380400001)(508600001)(6666004)(4326008)(82310400004)(7636003)(2616005)(6636002)(36860700001)(336012)(70586007)(426003)(44832011)(70206006)(47076005)(186003)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 06:21:11.2767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa1a08b-1399-4b9d-9ace-08d9ae4971c5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3759
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

RPU subsystem can be configured in cluster-mode or split mode.
Also each r5 core has separate power domains.

Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 28dccb891a53..f4fb98ccb1b5 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -654,6 +654,23 @@ qspi: spi@ff0f0000 {
 			power-domains = <&zynqmp_firmware PD_QSPI>;
 		};
 
+		r5fss: r5fss@ff9a0000 {
+			compatible = "xlnx,zynqmp-r5fss";
+			xlnx,cluster-mode = <1>;
+
+                        reg = <0x0 0Xff9a0000 0x0 0x228>;
+
+			r5f_core0: r5f-0 {
+				compatible = "xlnx,zynqmp-r5f";
+				power-domains = <&zynqmp_firmware PD_RPU_0>;
+			};
+
+			r5f_core1: r5f-1 {
+				compatible = "xlnx,zynqmp-r5f";
+				power-domains = <&zynqmp_firmware PD_RPU_1>;
+			};
+		};
+
 		psgtr: phy@fd400000 {
 			compatible = "xlnx,zynqmp-psgtr-v1.1";
 			status = "disabled";
-- 
2.25.1

