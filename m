Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6ABE732E7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Sep 2023 16:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjI1QAB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Sep 2023 12:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbjI1QAA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Sep 2023 12:00:00 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7B7B7;
        Thu, 28 Sep 2023 08:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqzgqIjY2y7QPpiFTo0rAgQjweS3YK3Rl0/JfZV1rySVknFyijNVXEL322ls3KoGHH8B8Do8MNMYlhdQqTP8KF3ROx/gr1mP4f7q0m0vmNksCkKtYcFhuyvICcFbL/lXJBAQcMok65qyN+nj5C/SSM9jnxPvmM3Vt2uE9Km9mXnkJi68PHvIxHYTlLq/Yj/w8WYPtL7Rpu9pQixaUXhI7dhF5Uun0LkEmSU+PxnrMQvwmGWQIoEzWItWjbigO7X5c1nNx7ovMfBho9erTXTjC3IIjIdiMPDgvynyWSCyKS/9UC98pyjEddXV1ruIBCVfQLjcWIwo8aFVtj/JBBgFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pF8+IWYeriw0LQnx0jGuiPItXyw8p32Ljtb8liy00V8=;
 b=hquYgIWnOmntO74mFPo5F63r/TUZC877sR+yNOXx0YFH5ginZXuFVDaIk0MqVGSVz3D3ToIC1DwpewxssQ3pD5xWflgYjxYPZ2tp3uXd7q1SeOSF3dk2MakUdbFOxWeRcmzzTNVfFyFH+HJJMRRvRzg9xcE0g2FXDPXt/HRa1ISjsVIrIArDPxmJiQw5d3kVRAQv/wGy2t1f/1FVM9n1R5x1/MKWQEhw16vxiABjhB3Z2TlAKOGNjO6/qDAywzDimydF0Byf5JbdG7JGMhZ+fdFGVKMWCFfR4+reHImgmKjULpxHtORHXCnBXUkTz/C8EnW01unc0t6IfLJXWoGtpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pF8+IWYeriw0LQnx0jGuiPItXyw8p32Ljtb8liy00V8=;
 b=bPKtWf/j5BDK/nMD7LS3hf1r3FQFPIZJ8kk4FG60tWV1ii88jo/MHfKmycH8b2aTaQXo4xRFaMpHvzs0Px7jFkcnYFhSGs0FBRgY5nUEhPvA7zu3/TOTK6Y+GXUx0kKVQeKNTYjfPxk+3R5BdmFn/TFIXqh+N6B9x8SOuqznnY8=
Received: from DM6PR02CA0080.namprd02.prod.outlook.com (2603:10b6:5:1f4::21)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Thu, 28 Sep
 2023 15:59:56 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::4c) by DM6PR02CA0080.outlook.office365.com
 (2603:10b6:5:1f4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Thu, 28 Sep 2023 15:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 15:59:56 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 10:59:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 08:59:22 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 28 Sep 2023 10:59:22 -0500
From:   Tanmay Shah <tanmay.shah@amd.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@amd.com>
CC:     <radhey.shyam.pandey@amd.com>, <tanmay.shah@amd.com>,
        <ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 2/4] dts: zynqmp: add properties for TCM in remoteproc
Date:   Thu, 28 Sep 2023 08:58:58 -0700
Message-ID: <20230928155900.3987103-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928155900.3987103-1-tanmay.shah@amd.com>
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0f744d-a293-4cc9-0ca8-08dbc03bf5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPKLuo19cHKSfgOJ65h1qtGV+0tDPHbBKAK+KmNuKMGvxA07zDix1/RuA60WJMI3uzutEdLfksqPCDRorc7xOZorgYuiao01Nl/vhAgOx8mVKKsGaqu6Eg1by7hsMkfMNt3jBb2w+77PXuuGMqV3LzHqNdoywhtIKOi/K6nQt9WWwB+/zVnHa+rJBYD1qM7OW4TfbAWk3sqzGE6ye3vQniMaMJeYJzHTEL90UaWc+05Mj+oCJKS0on9nwGbEIE57AU7JkDVv8VdP8MRxa9U/z2eSUzWtDjVJaUMaHv5dWThNah5sBur2zsAOR0CPeMOwTsp9HllZSaPoFRwf9pQXCbrIUZScNffHtqqF+XkdeXFJtB4B9fbR0UL2xho4F50glJohSDyAXWgUTgBkd8FAaMG8nzTLzJdYM+u3hWtbFE4EbrE1PdYSm6l3odbbbJUi0gZhhHRgShPKDqqyU56m/8dWp+hAKmq0hKx4WB5Ma2zmR1WFwB/hps4ghykFmlbWnTyqDLbtLfT/DlbIdgLhSbR/Qg5h9maMSn6uMV9z1rwiSxTQly3Q5+JTtmFuYZX6fOr3yeyWR4wZCUzwmlNsjqLPcZQr41/0wZgMPsQg8xhiD8Tb8PyoPfZMVsv0R1frQOAvaOSHSl9oAkHG4A7rQKbgWULFtNU1RsfG8y2zPkUrJ5RfL5S3dwcaqlHq/rLNyN3mXHOjOZeEkbA5b3N9EFN+fL8ZqHKI2R7iwiaqM7XVkH4Bq/YIHSpk2uL4C+lhLwLbrd4w10XT+bpEWZO/+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(336012)(6636002)(54906003)(316002)(70206006)(1076003)(70586007)(110136005)(26005)(83380400001)(2616005)(82740400003)(426003)(36756003)(6666004)(86362001)(356005)(47076005)(40480700001)(81166007)(36860700001)(478600001)(40460700003)(2906002)(44832011)(8936002)(8676002)(4326008)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:59:56.0883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0f744d-a293-4cc9-0ca8-08dbc03bf5c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add properties as per new bindings in zynqmp remoteproc node
to represent TCM address and size. This patch configures
RPU in split mode and adds TCM information accordingly.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 28 ++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index b61fc99cd911..01e12894c88e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -247,19 +247,35 @@ fpga_full: fpga-full {
 		ranges;
 	};
 
-	remoteproc {
+	remoteproc@ffe00000 {
 		compatible = "xlnx,zynqmp-r5fss";
-		xlnx,cluster-mode = <1>;
+		xlnx,cluster-mode = <0>;
 
-		r5f-0 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
+			 <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
+			 <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
+			 <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
+
+		r5f@0 {
 			compatible = "xlnx,zynqmp-r5f";
-			power-domains = <&zynqmp_firmware PD_RPU_0>;
+			reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
+			reg-names = "atcm", "btcm";
+			power-domains = <&zynqmp_firmware PD_RPU_0>,
+					<&zynqmp_firmware PD_R5_0_ATCM>,
+					<&zynqmp_firmware PD_R5_0_BTCM>;
 			memory-region = <&rproc_0_fw_image>;
 		};
 
-		r5f-1 {
+		r5f@1 {
 			compatible = "xlnx,zynqmp-r5f";
-			power-domains = <&zynqmp_firmware PD_RPU_1>;
+			reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
+			reg-names = "atcm", "btcm";
+			power-domains = <&zynqmp_firmware PD_RPU_1>,
+					<&zynqmp_firmware PD_R5_1_ATCM>,
+					<&zynqmp_firmware PD_R5_1_BTCM>;
 			memory-region = <&rproc_1_fw_image>;
 		};
 	};
-- 
2.25.1

