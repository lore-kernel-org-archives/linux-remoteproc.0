Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5612423ABBE;
	Fri,  1 May 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646253; cv=fail; b=DtK5/uCQtsm3cyWxF+p2VLeM46e6HyYMzBTgnpiWVz4SV/PhIHB7hcn0WArwJMKnFj+1VJ2DEP1FdI7Sr/P5YNKIupWLE3sFAegrPDM8RdGi6zlyzIK8MGtOjWC9mKvUzdx3lmbuknFJiEUQplzcfxOh7oGarbOZAs5yU1kZqkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646253; c=relaxed/simple;
	bh=xngFXvaPkqdwCdV+94/GqwdONwvgtR0lt/ub+bxbIsw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bigSB1pAHpQaWpNCp8oK5qCg70jVaayLBa5GcU5FdzSH7DkF/gRv3QrxSbFRgl/IDk66yRbPxUhUjxdL8rrctAvjiqpHfmDyfUFAzS+7asf3V9hHj73y7nS0tLfxfwqfy5UIjeWdMUGmug3sBaZwFImucmYw96VTru1iCGv2kgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DhHvdpji; arc=fail smtp.client-ip=40.93.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DhHvdpji"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXK7gwLXESc1gWy0Mk8yfvmd7EOhT/+O6kt0bipd6tO4TSBWIxSIuWmlmNGJ8tzCaIg+gb0rapynqQX0B5uo8aNF0PbcHJ7Kj5upvgBIZkLdO6rFFfzrREWKjxdDj6yceho/kgpqrIOCqFUPJL0ZOqoK7L8B4m8gwVI7JOBiQDxGe6893wRXOtNkF3t3xuy/yXRlwyhboGoE7FzBKf7AcJFAXM/pQi0aivkHBrve6jSNFTXYOsmbNQwnSvbU9iMQHGxrDyO2U3UmXItYC9fLpWftFTb4jtENF1d0WGyPulx/K5SkGAo9yzxRIZdvGns9ecuy1eRxGvA9yTRIEcG+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmfLCFFAgYXtK7z5ADZe+LJsDWsLhgNMzA/50TlZ8nU=;
 b=UiqHWlwwfIBERXkBj2SZoVJj69EZY5aZWYY9rEcrcFqeQB4hicSe+NjGnVHDwLKRHGndrgojuEXPqYRlVMm1lrmWFKve0yOhb+iFX47OQ5WboMJYreviI4p2C21JwkkWTCUM824LjsOXdtpM44ScmkgjH+1fkHnjpC7s+NRPID+1GxVWY5CF0hvpVR/xL6BErK038B4rKPRGsZiNkXTF3vsLpLi7JiVVbpnUo+BAhJwPVYYup+99HfSmoqiKqTouBh+H2KSiVUZVjFbubTI2xtBRUQ1uRz1AKWyWoF0NdZ5YAbmMbc2Xagx1W/Wr8Dshob/AVGcwiFTgf5YDlcrXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmfLCFFAgYXtK7z5ADZe+LJsDWsLhgNMzA/50TlZ8nU=;
 b=DhHvdpjizj+vzRvR5tt5lAQwiBF8J6mnCb+Y6SIbO2sMm17qKt5akfO/iEbW2GFzzmn1dNQtPXmNeTqUfTdUfigJNbwlI3lKiNtFDXNpQhbuggkFKIwdPzQlD7GpzMLZAWC5I6PIcfDXeyYPFFyjyfdRErF7iVOh7UQFgcsoYEQ=
Received: from BL1PR13CA0428.namprd13.prod.outlook.com (2603:10b6:208:2c3::13)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 1 May
 2026 14:37:28 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::8c) by BL1PR13CA0428.outlook.office365.com
 (2603:10b6:208:2c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Fri,
 1 May 2026 14:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 14:37:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 1 May
 2026 09:37:25 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 1 May 2026 09:37:25 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: xlnx: add firmware-name property
Date: Fri, 1 May 2026 07:37:06 -0700
Message-ID: <20260501143707.1591110-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501143707.1591110-1-tanmay.shah@amd.com>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ea2111-1586-42a0-55e7-08dea78f2b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4z5ljEPRvt3XSn3PjPlh/CCDlMD4xlug5lZlC/vxJxW2rsMR3PhcGjMoTlmIriA7d0k5i+VVFKTZY/PkLFjCfEBqa1mPaibQBf2xT9s+rvbCsEMBJVPd/oBnle4TeddAtOy/RdOqtzBgGv9sbbjYivRUlPjmiSobHu3ncDdmXaT+7k46RM3ZON9yc7Re7lNJh8jkYyaIkEGbZcXpUN73Dg9xveP1hWD2yU+Uvtq5H1Bad6y6PhqSTp4sWkqcBjDKr4BDHCzQl3KX7e827Vd6zQcOAzI74mf+x3uI6Y0k37JNRl+K9FR3uBU6vkmJpTzCVz6SKbpFvo1qiiXFvVtwXSw9q45ECoamPk5if2GHjN4UnZps96maIWCrWM4buAOrYOAr9C+nwsONnGaNj0Z+XRkcv763bw96LWxsnVWsgBm/g8JxZrG4PkmAUiVEaVcLQBiS+D5x9JnSeqAnNIZdHnCrNBXmD4s7p1U6qCrwH8ejz2cuXpjacaJDa6MykIq5iRcKtSv0iLjqp4lklEoBJzcvR7i1sjLCzfPw1JYKoRWBKnKsjg1OjtQJMbNXjHQrUvTs+1pvmEoFT9V0VE7WVxNTZYxLtRH466BPgt0+dUpGovhnV3EJqc3Vqo2/RFbOmxBNV2PJXuE2s4aLE4X9uoxDp/xtBMW7d5Aov/pUj+dkaR/0c4VPRKezdGMGFe0KafXgrODlZHtDAV/sG8Wcz3UC60nl60KWUBfuWorFIBU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ygUYhPyxZ5h92aErB5Hwb2H3v6HmLrp0KJQCOpZq2vPilYPg5w/Sb08r6RiJxIR02VpdeCUpLuYJQbBQMcR7QLpI5V6y6UyApV00RX+5wc5NiVrO1bQr/UrnOXKddcii3fhMrsclXn9IhNMV37KqPdtHKixQVV+eE1AjH85xNn6VncgAmsKqAzoAWRk++cL8HaDvPsLkFNmVd6ai+U/1jYO5cwmssjbAHE5j8rNoKBE86EP0o9QJDYtiPAU1nozsaYRROvkuC6Vi7SbmUr8Y/7NcOzgku91w2n6w40ez1vUscGbL/6qS0QytCrGHZKCgBGEz7PXKrFXRsi8GD+GFCyMWzVMx/V70NILJd3Q94EQE0zLXxzcavW7Lzd0j9HRd2zTNvGgQ4gVcJKorLX6xQj6kx+a+SAJ4fb8sqdnHYRBuOdULrAFG5VxkrgJ0/2hp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 14:37:28.1306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ea2111-1586-42a0-55e7-08dea78f2b4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

The firmware-name property indicates which firmware to load on RPU
during the Linux boot time. It is possible to stop the RPU after boot
and load different firmware and start RPU.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
index ee63c03949c9..ae63c3e39ced 100644
--- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
@@ -135,6 +135,10 @@ patternProperties:
           - description: vring1
         additionalItems: true
 
+      firmware-name:
+        maxItems: 1
+        description: default firmware to load
+
     required:
       - compatible
       - reg
-- 
2.34.1

