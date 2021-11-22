Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3401C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 05:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhKVFmM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 00:42:12 -0500
Received: from mail-mw2nam12on2045.outbound.protection.outlook.com ([40.107.244.45]:36590
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229525AbhKVFmL (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 00:42:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg29aSTnNaSpKK4v+QoNLrJ2RYQ2zci/eS+xxFvW6/WNqy7Uq/6UTmz5O7QKX1CMpT/ACJhsN2Uo+9n6W/X4xdyMkryKDABZeHg1U76Wr2PVOl+ZnMZyradE83mJuDCN81u2HtWpLVY1UFvgQAFThRuUZq3ZEor4Z5T2/A9Mz58Nn33slH8bocfF7HOryS8pQA4UasDZ/X0OFHjSa+HAOc+SEtGTaTU7N042YDLkpKguEmIZrZU/XzHYwy+Levtv/rrjYLdTQN+CGwu+RdalIvMTGX+EWkMWHeCI8Wi2xTpvNnbhaTiKWBxCKz3/3Sm0xvYeWDddD/tbbzzLoMBc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaytPxuW5V2X80pvx8Gsdvj2x378ZTJImJTC0u/dQvk=;
 b=VIYW7f7dbsf6O5fZINTzBjoOaTgZ2V+2RMmrzrS9ZBBNbCqNhHkNCJX1D02IUTN++ezVjY9wjscPQ9o4QNWNoGBuSWPgRuvizeu8H97rEpaFIwbfGCZmGl1/ZQTW8c2sx3j6K1sNUPGyAqfPdCKpuGkNsNSZEU8ywj/pYMMm4npZEcAl5bdUyeBmR+T+5t8031d/pTZPM67n1ejYtJZrQAIGq6aNnrZwMDaUlrOvfNfzMhEjMCwlMnFL1oRRz5UhWWNXFmyn/NyZ4DcqvQ3I3s1hII1HbYIcdGVO3jAmk1luAlQcAxzfIpz1Mh8no/XuR+d/m44BX+Jqcgx62mhZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaytPxuW5V2X80pvx8Gsdvj2x378ZTJImJTC0u/dQvk=;
 b=BI+E+36/tHq8/2qO9dIGCLeZ7qbcU34R5N89epqdxKzL0moX3as4kdS+IjCR2fOGvJHpnVizv650eYDcefimq1c/akwRir/5u25n9bAnY38a6kSlK/ARQktdXGaNZzj/G482iT9x8VM9aD3C3v8Fhoypfaolhm6SgMDg1lpf1TE=
Received: from SN4PR0201CA0051.namprd02.prod.outlook.com
 (2603:10b6:803:20::13) by CO1PR02MB8636.namprd02.prod.outlook.com
 (2603:10b6:303:15f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 05:39:04 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::dd) by SN4PR0201CA0051.outlook.office365.com
 (2603:10b6:803:20::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 05:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 05:39:03 +0000
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
        id 1mp22h-000BOC-7F; Sun, 21 Nov 2021 21:39:03 -0800
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
Subject: [PATCH 2/6] arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
Date:   Sun, 21 Nov 2021 21:38:52 -0800
Message-ID: <20211122053856.1342859-3-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
References: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860d5752-273d-4716-b3df-08d9ad7a64b6
X-MS-TrafficTypeDiagnostic: CO1PR02MB8636:
X-Microsoft-Antispam-PRVS: <CO1PR02MB8636273A5BFC03D09DDA928CCA9F9@CO1PR02MB8636.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrL1Eh7g+0MVt9RhqlHR8voeU7wLghTC4XxmZ4Z28jv9nIZrpdF2sWO6wK4a9FzWl48xyzS/L+qeGgcTDvVOnHU6CYtrgSMx7ezRY2j2A+tfPVCWM4X4+XQIfySx4eO2KbRlyhhywIJEufOVg0+I6N2CMwlSvdMMvuaovvhQOuNnqb8LXCDIS4r6g3v2nnrnqrTiMBWebt1qwQGa3LunkDvh8ilbxgtkOhxoz0XC8FG7lG280/vpnqtffk4x1di3n1HYjJulPz0fJ68k5+Q1+wElzjZQeH09Y3TiDn7nurJltfNhAx5By2xdZ38LuBrMwb+2VVwx7wuLw+JgBQ6NNLjTs0RTWmyzyYmKIxqeJY5DHWwPoURdbsNb14f0yJrIP8O7oUTyaQ+gZ0Xo8rwl8taw/xcSmp1wMrXU0dHbH0LQ43Zs4/l8fjjFDOkGxhNJljyAxWy9/yV/CH2koW/5Wl4bD+PMw4MiJDrz9Ncl1vajknVNQvvO43Qm1sNtomIDCmRjezxG9sLpJsYNjBPC06vSQmej7RWLHL6WqdO2+/hS+wTHXy+1CyfSwSAeqNP+1qXv8zzCIk477Q/kQo0rcSzcu+dhSZyMOmLwmKLcNEAHdO/LxTAtVFqBGmQcNNHjQoL8cRSqiMMGZa02rTQ0Zq9HDQaVCsA74rOsqRBEv3zDO2mdcSsnKS/40ulUkhq9WK9TIV14yLRTvwj+gkv4clmQENMrn0Mlq5u71db8mBc=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(36756003)(2616005)(110136005)(1076003)(8936002)(8676002)(2906002)(47076005)(70206006)(6666004)(70586007)(316002)(336012)(54906003)(426003)(356005)(82310400003)(36860700001)(36906005)(7636003)(7696005)(508600001)(83380400001)(186003)(6636002)(9786002)(44832011)(26005)(4326008)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 05:39:03.6136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860d5752-273d-4716-b3df-08d9ad7a64b6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8636
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

RPU subsystem can be configured in cluster-mode or split mode.
Also each r5 core has separate power domains.

Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/x=
ilinx/zynqmp.dtsi
index 28dccb891a53..f4fb98ccb1b5 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -654,6 +654,23 @@ qspi: spi@ff0f0000 {
                        power-domains =3D <&zynqmp_firmware PD_QSPI>;
                };

+               r5fss: r5fss@ff9a0000 {
+                       compatible =3D "xlnx,zynqmp-r5fss";
+                       xlnx,cluster-mode =3D <1>;
+
+                        reg =3D <0x0 0Xff9a0000 0x0 0x228>;
+
+                       r5f_core0: r5f-0 {
+                               compatible =3D "xlnx,zynqmp-r5f";
+                               power-domains =3D <&zynqmp_firmware PD_RPU_=
0>;
+                       };
+
+                       r5f_core1: r5f-1 {
+                               compatible =3D "xlnx,zynqmp-r5f";
+                               power-domains =3D <&zynqmp_firmware PD_RPU_=
1>;
+                       };
+               };
+
                psgtr: phy@fd400000 {
                        compatible =3D "xlnx,zynqmp-psgtr-v1.1";
                        status =3D "disabled";
--
2.25.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
