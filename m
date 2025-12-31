Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D5286417;
	Wed, 31 Dec 2025 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767199890; cv=fail; b=MoDu0hBCbzINL42rsjqsjiY5ectjm710UbcsVMIW+AOUnM6Ub6oZOhOShbTGZYaIsw5fwL2+tQqFGeDaDFnL7ABrXVlFFe3SmrJzTk+TqXQ+jhldGYsBelWssh7R2dkPG+m/SVf16WpQjOXFI97ZNEUL70FHs0PET5zBThQ3s10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767199890; c=relaxed/simple;
	bh=PWMp0xfwbM6YVudR+p0ZCokDHIlIK+L1N2QgCLX5JNo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJ7znG2DhlpS3bV/ciFUy2vIoB3rR8H0kjBop6rCUYxrB8rRcqCLkuqG85nsTVwISs9fhymbe7jEJ/IboBepiOC4t9OglrXaiv1MtooYqKJjan2zd71ha0+2gG4QzoTD7iZLHImpzOF2IHnbbjJCyuaJ4994Wv4o/V5HzFNt8ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ht2Ofv6r; arc=fail smtp.client-ip=40.93.198.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ht2Ofv6r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mzh0e4QUdFYacXPUjjtMx+0jjAkTe/KwF41g4Y0o12A/YKUP7QzTXjqf9r7iTTLua5FeV2hZsP4VxEIdusS7+XPCi6npP0bpZb1+7IEeW3gPiGqZbsbZGMgcEmdvU38eQUErkHvVcdxwTX54qzWIP8YocmVVDT51KbD/oZhwk8b6xetN43e95QfBG9KrTlVcOvjK9jyPej+mSCsIrUA4qpzsXYRNwPKFg5/EdaHv3cqg1KIFJfB6w/0u9Bjvlwh57yWQMANyZBDIezsFzi80zKYnjWGIlcxrEN4U9zgL7hI0OpWjT6PoVesu4fyBRQYieAyAvMXByT+pPw8bakXecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4n7HssKtehAeKDAkquBt0FpfKT+TpA0EXv0kWbgVZo=;
 b=GqhJ2lA01elYHtIFZcBahkxgrvXNBG6p+iqaqOhbZ0TAZU+fS4umlEnbI/jJ63ZqomyacMAHIqQbrmlLblXVhzr17kwxcYFf0qa1aRkvotYekVL/hyWz2cmypLY6TLiG6yvodTlI8OHA5gOSbJhJp+JNADiEKDzn5pNDYTiCXtdUoQ+wyx4gtYVmEI4kCIHff2vjrvnffi8J/0hiu5odz8EeSEPMsT4yPzyDrQbHJGo28GaYsOcHsL7frJilP3lslc7g3SmSxQmoxDokpCJz4ubR+XYvScD9D9+Qjl6Nf0SbN58t/z3bD0EdH/YiYT55S+nGkKmyi/YA1Bvt6Q89eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4n7HssKtehAeKDAkquBt0FpfKT+TpA0EXv0kWbgVZo=;
 b=Ht2Ofv6rhRaUJFKVMQH0YmgHt73eyj6O4ezrnW54e9QlXSLed0DNLc8lLfQELr9PgAnezbBs9g0HQlSv1ohpF5UZ1DanBx/VNB/9M+u2cKh+fau9LQ6wWhvnhLYQHln1c9HSEBQuskvnTbq2rISg/ZK+EEzv9jIuiV4BBIfKMvE=
Received: from CH0PR03CA0294.namprd03.prod.outlook.com (2603:10b6:610:e6::29)
 by IA3PR10MB8736.namprd10.prod.outlook.com (2603:10b6:208:57f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 16:51:25 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::3) by CH0PR03CA0294.outlook.office365.com
 (2603:10b6:610:e6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 16:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 16:51:24 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:21 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 31 Dec 2025 10:51:21 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BVGp3Zm2583331;
	Wed, 31 Dec 2025 10:51:17 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node
Date: Wed, 31 Dec 2025 22:21:02 +0530
Message-ID: <20251231165102.950644-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231165102.950644-1-b-padhi@ti.com>
References: <20251231165102.950644-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|IA3PR10MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 7389eb16-163e-4a2d-5f49-08de488cd59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3xneoBmukFHzbnP2lwt9Pi3IBhAAmyhOc1l3NK5AFlx/ZdwiNes025YYGbU+?=
 =?us-ascii?Q?Kpp61SEvbG7oLSIIoqKVOKA2jQbzaEtO4t9hHMh5BByPDM4+3BRo42YSAZJE?=
 =?us-ascii?Q?3Fc3PVBkA/GdZpzzlXBViV/8fdE/oBBpKbeYpiZVCEz9KGnimHVMyyt3V57l?=
 =?us-ascii?Q?j0hU7vB+sO835VdSU0j7M9WkQ7CpCfjFwMtEShG+lDJGLwDzYWtR/O1wzo0G?=
 =?us-ascii?Q?5Ur3EvcIsL7+aPvEPUV0foMZ/WMQ5bY5WmwuVPgnvxo2T9wgkpP18F38TIbk?=
 =?us-ascii?Q?oS2naRPbg08HRsDOcwAQsbA0FaLp6UNweZGNfJza4cHrctNZb6qvGJig7Npj?=
 =?us-ascii?Q?FkRBNyZW9RFKBYjXFdP264sQIBHtqXBL5uVQkbcCJtxWYOv6f8bLhQTikLaZ?=
 =?us-ascii?Q?mjoWaA+OD/9VrrEQo+G9ewok8lwNGKCmiS5s6SqKgeDQizK4GwTyjnx9VnwA?=
 =?us-ascii?Q?k3+v6mhMztkRHTl5cG5fEaFksmlNKn2eHK86Fj/MCo274ss2mvSWAFhzoWpr?=
 =?us-ascii?Q?q/C0bxmA6a/kGBWliSWnSmF0XNekFWXQ/Vh+XzFE+rh2UlrZialUZqEM3ZU8?=
 =?us-ascii?Q?6T9TiU2cSc4R7X6rB5KN3peVmJ+XPgq4Q9whuRLEf0xGCpvmWSc9ZWkapmCc?=
 =?us-ascii?Q?OtzCVu+mlbBGYRaRYC0vvvssSaTJ14oooTppRjw9XxAHx36F2YzbGRtR2t87?=
 =?us-ascii?Q?6EthPL/Iqb6+Y6WiJzg6K7nmTPczAd2+f2iEqESYxQit8tSmXNKZ1TT5Wt8h?=
 =?us-ascii?Q?85pAcJUNOVoWIDx3bbb696Zc3mNVgs9pX+/DS1S7FOAWCB1Uot1GOvB+7TVC?=
 =?us-ascii?Q?K0mvQW1FDSA2ASReTXDl7B7dStUkPu/MNEIYuwKjlzB3C+d9EDsfHnQ4jWKK?=
 =?us-ascii?Q?hnvhIffGgA6BZBCiZvMvdw3qhpaI0TbLWn+LUrWper9PH6oXjX9nF2lHNbjC?=
 =?us-ascii?Q?zITXszqyaU29OqqfKhccOwhuuW1A0QBisyCvjojr2IpDIwT3b62gNrsVg0Tk?=
 =?us-ascii?Q?ozRIORoDflqvDfKDlKCS9GfbbTTCzd9CpRnulS9Tz4p/mhVXgxlbYiCHpssK?=
 =?us-ascii?Q?qvDrtsZzRNE2VWZWfkERM/P0xaBF1x8f+q45qvHAyO33sD1LpmKkrexCAaHJ?=
 =?us-ascii?Q?cwEAWTy8pEQK64oTXlHLB9U7JJiVCrBO0VAaiSLKmmQ5ELP7sF8YKU2MxlIZ?=
 =?us-ascii?Q?CX1gIDpXNgCp4mQvwJAasEnx/sSTs4AmiRa68BSydzwo6v7w/NH16+9iPNRP?=
 =?us-ascii?Q?1aEeiLGssVQFsOeV3OEy4H+Wu+CsgEC17F01sZjTjld0sZP0/DiFKKiOpcRN?=
 =?us-ascii?Q?X5th7Ye2vh6YZf6EdTfBBc7kpF9NvgeJ0AMh2fgPX6JkuSLwVgvi6zBgYOoL?=
 =?us-ascii?Q?F2ZULYsSkUS3U0ZVhYZMivZ8NptzDSI06Ajm0Aa5Xs0rNxhghsCrGr7uf+KH?=
 =?us-ascii?Q?4YurYx0oLbE3WvQCLbCTFT8XPmTVpwpNedCTtp5kVdsWI0QYFwO/If102uyW?=
 =?us-ascii?Q?wuHXzEJyjhGOIC6YmxU2D4Wjn92dxXiVIpU+6QN3emAKa/C9T8dj+cVNNCl1?=
 =?us-ascii?Q?RkH/YD9HNOHAK3QbMuc=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 16:51:24.8965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7389eb16-163e-4a2d-5f49-08de488cd59a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8736

The TI K3 AM62P and J722S SoCs have a HSM (High Security Module) M4F
core in the MAIN Voltage Domain which could be used to run secure
services like Authentication. Add Device Tree Node definitions for the
HSM core in the respective SoC common main dtsi file.

The corresponding reg ranges of HSM node has also been added to its
parent node's (cbass_main bus) ranges property.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi   | 15 +++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi              |  1 +
 arch/arm64/boot/dts/ti/k3-j722s.dtsi              |  1 +
 3 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 3cf7c2b3ce2dd..28586cbc57613 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1117,4 +1117,19 @@ vpu: video-codec@30210000 {
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
 	};
+
+	hsm_m4fss: m4fss@43c00000 {
+		compatible = "ti,hsm-m4fss";
+		reg = <0x00 0x43c00000 0x00 0x20000>,
+		      <0x00 0x43c20000 0x00 0x10000>,
+		      <0x00 0x43c30000 0x00 0x10000>;
+		reg-names = "sram0_0", "sram0_1", "sram1";
+		resets = <&k3_reset 225 1>;
+		firmware-name = "hsm.bin";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <225>;
+		ti,sci-proc-ids = <0x80 0xff>;
+		status = "disabled";
+		bootph-pre-ram;
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index e2c01328eb298..9d6266d6ddb82 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -96,6 +96,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core window */
 			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */
 			 <0x00 0x43600000 0x00 0x43600000 0x00 0x00010000>, /* SA3 sproxy data */
+			 <0x00 0x43c00000 0x00 0x43c00000 0x00 0x00040000>, /* HSM SRAM ranges */
 			 <0x00 0x44043000 0x00 0x44043000 0x00 0x00000fe0>, /* TI SCI DEBUG */
 			 <0x00 0x44860000 0x00 0x44860000 0x00 0x00040000>, /* SA3 sproxy config */
 			 <0x00 0x48000000 0x00 0x48000000 0x00 0x06408000>, /* DMSS */
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index cdc8570e54b29..8b0523669c325 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -173,6 +173,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x31200000 0x00 0x31200000 0x00 0x00040000>, /* USB1 DWC3 Core window */
 			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */
 			 <0x00 0x43600000 0x00 0x43600000 0x00 0x00010000>, /* SA3 sproxy data */
+			 <0x00 0x43c00000 0x00 0x43c00000 0x00 0x00040000>, /* HSM SRAM ranges */
 			 <0x00 0x44043000 0x00 0x44043000 0x00 0x00000fe0>, /* TI SCI DEBUG */
 			 <0x00 0x44860000 0x00 0x44860000 0x00 0x00040000>, /* SA3 sproxy config */
 			 <0x00 0x48000000 0x00 0x48000000 0x00 0x06408000>, /* DMSS */
-- 
2.34.1

