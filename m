Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF192FC01B;
	Wed, 22 Apr 2026 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776889596; cv=fail; b=hDpAstFvP1onmlYEFf/oQ6rSNwj7tOzYbTGtntkpnh8Yr4v/XJh/i6GEOXvf3yIzlcHek43oAk79pc9bH4x1tm+kHwtCLnoA0ZRyPI4aey3Y2RYTV6ai5l1LuL/GGXEvXMIrx2XxEhcsg7zdP/wpXyM/LeGOr3uWBRq5eRflBwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776889596; c=relaxed/simple;
	bh=mqHyOKV+8uEuvBzUm7D0nSWMVJeb2sKO+qOLORDYJ0Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJnFBakqLb7nNOOoZaUbp1tBv0VXakVrUl111OEFn8rRJUSOIuqVppn6ZJiOvwO4F0ypukP/VC3xbwMj8r/Q1A82qd8NErKfDR3KXr2EgonaQg51ELnX3oIn4s+VN1o9g/i1saoajuCVn+g2kn7KFPcV4MJLRWeu69K00Oomtlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iinbwvFQ; arc=fail smtp.client-ip=40.93.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iinbwvFQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5/6R7RnSTXGp5lGszw30U5u38HDba05BejnD0Ouynz4j09qodse/BDtKGESQSDG1WL14NE1uwQSPF0mE97m8V8W3Qi+JXNUHGZo6O1Yn068Kr2nK4UYKsozVEPvD8zvYbmuuxaUpc8HQ5IAbmsiqESDfe2k2oPC5fglkrzAgw08yVeDQcn5em+haXfVdqGBBR4MtVynxU6EjBZH9veBkN+lnRASyO4d8AcS5MbEiyNiJVspITQdHIUblPQ1k1hQ0B1fnwDz7VsUydkROicKhBdkEemj90CmyagMw3lGSpt0TtG/6mv5HbIQJwamflxwwpB/uSXWwtA2fKggnieTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNmqoevTMA7TZOfLTXuBEUda8+Q04h0r5OP6u0QNP6M=;
 b=n7R7hc7TUS6b2mlBOE0YSeXio1uPmTDjFlea0Oe0XtAgneNDrLvawnwVBwoMgYkDDWtwayVec/NVu/++wRZ7kpGgEGApmKA3U4YlaYSQ6VJs3XIDdJKc5W1uSpN2O8LBb99Lp2FRXFCkMgjBepHSzrLXl/mfaJemgNE6rXpmPj/ePQb1dMfCNuCEfiKKM3Pcqb1Sc4UrZE1KcLt8jp6bR2j+S1gh1WTWPiQarj+ISBkOTMo/BgSnvyNgrB8yYgoSGyZZwiud2UPX7L3BAVbolTgptzK3k6ySdpMYhlnSew6a9XkskCz3//rrVm1vfFEq+LQksohajoEdusmeWP10JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNmqoevTMA7TZOfLTXuBEUda8+Q04h0r5OP6u0QNP6M=;
 b=iinbwvFQ3oTPOepVC8L35poXfa1LYXwbEjvNFSyxtRS+yy/Hxu6DF/m3HFcVpnXi5cBfoPUxYrS8VXzOMF+8hcIucUL7HxQ7O8YS3Rrp7ERhp61eHL91/98o8ZTLymIXfRVG1Rf9udR0AbTjrqRUiqypuvtM6P1HNkPODEoY6Wc=
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 20:26:29 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::b2) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 20:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 20:26:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 15:26:26 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 15:26:26 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
Date: Wed, 22 Apr 2026 13:25:57 -0700
Message-ID: <20260422202558.2362971-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422202558.2362971-1-tanmay.shah@amd.com>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6f0573-82c0-4120-5d68-08dea0ad6f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KsyUV9oaqKSClj/K7mZNcXUyi6jR87nBMl7KBKakaZyvcSw1E4on6MZpkO63V++wdC7vkXzY8hPJeiOT1R3ki7rqpPoIj4V8yApDDnGumBE5dUYoP2716/Oa1v+vQnDyn1MtDRNLDCbvZDzpaPzMtodxacfHAtgAlqhXbgRMrTrsCxacVdJlqMXxaklxZYvMlmmYUYEOXEwAynpMEsNok9yM3drTo5WWxlISPiZZkB4/VsrrffkJW4yt8cdEEiTrdVFgnbunz/ppSHnkhhy2rpUjFNF97gnFUNvUUtYzLFoFmP7ruVJhlpK3HzvPO5nWpNssZygCwYxtY4tj65csEhS4nQH+JUvmamiQ1FszkaWAMcFMkIW0IhpuJ7NmatnztkMRlajDvzhaYBGRZFiTLb8SEs3oqJSoSt4N/Tfb1fFy+Gcur2Be0LNspgdB/auYHC+4bbqrd6Kqtg5VKGaRjkjAUfMfqWogWTssjTobflqSJJpBwvOitUGckJsemvwUwM+Tljp4DvFIk1MyHxe57mizwq3wO93ltDTp8FtA5DeVk4FPRo4msI5aeEqlmbg3w3b1qAxYZYpIDkwBq5wKbRZkpTcB9f4NfEw5BFhjvNOREN0Kcr/5j9S8RUDTDHDfMt5WlyOQGnV4cS4AJg63H/yZ2TppzqMPAvk/vAEqRA2H41kY7uBJGhNJpyaFHc3rYC1ZoaUYod3vLSLUHeMq4AACc0YZEUdHhceZ1Yyx+AdUvOujrw7kRPw5aQeKtw29se26pr3cAs7WIQX36yAfIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lH5SAxAGsL+yuG9IO/ir7Hv0rEnymAFFQ8sBhzqBnsNxfp4EAJpJ65TRzSDs55RhE62W0RljxEvuW2oXRyIEIP8N0RNSWXVOZkeLSrSNADGtNpHn+krJRqtrk2r8afWWCIjkXU7wCNO5/fOMwzFxdLGivOQdB6i76hIMJ7yZmHBCO47VKL7btAwBlDQA8Fa/32FgBJ/22/5qPnGek0FsCX02paV/s5dipNdcvEHgFWIrCFevTSq98pM5a4hILzGs2LfcBKGS30/VCtNbVk2R1XxuEpsnxCy2nZeEKGmWBEdk8xlEJvNGOTazZWfo4swK3zrCu+TTHnOCfk68zrkQYFgGZGyG01Mhhu3yxsvFOc1JgTwFY+SlwzDN7ahZro34fy+DdiwUv4EWN9amweVFpMr7obD98A/TD8IT3XlyBVbUIBDXlYAe+Rvm+/rvVQXF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 20:26:29.0703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6f0573-82c0-4120-5d68-08dea0ad6f60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529

Add auto-boot property to notify that remote processor is setup and
ready to boot. Linux can attempt to boot or attach to already running
remote processor. "firmware-name" property is used to mention default
firmware to boot when linux starts the remote processor.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
index ee63c03949c9..0d27260e3baa 100644
--- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
@@ -135,6 +135,14 @@ patternProperties:
           - description: vring1
         additionalItems: true
 
+      auto-boot:
+        type: boolean
+        description: remote core is either already running or ready to boot
+
+      firmware-name:
+        maxItems: 1
+        description: default firmware to load
+
     required:
       - compatible
       - reg
-- 
2.34.1

