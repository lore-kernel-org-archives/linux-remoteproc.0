Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E4C405F7;
	Wed, 27 May 2026 05:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779858991; cv=fail; b=aqgKUgE7f32z2mP9Jwb05YgB5tdNmpcfMfg3yt3K41fQQKEYSSNBENhBG5LPCbnBCaTNQ698pZVnWEbJWZW0POrlf77x+gQ0gJw3gzszkggJSe1C27hgBoCrQZzcY2uZnnfW7Re6QN3cEiIGSqWG+E3X23hjJflf9ny8Wwsb49Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779858991; c=relaxed/simple;
	bh=S8EkWzQbCuayd08Krxyz043modoU0qxC8Du/t8ugwes=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U681q9iHc8JxiHn4Io4FkDFkQKTkHz/XID8gO6IKTIljwrXycUMdKfg2ixpeueNSeX9rNNCU5YAju7OkK/RQ1VCknPTxM/x+RUfKlSDIPzDWmpOJSn32o3OzMPxhrh3HZ06pZs0VSizXEz1ZQ0Mf6GkM+0yI2oL1TiX3mPGwUp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BwInhWDn; arc=fail smtp.client-ip=40.93.194.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BwInhWDn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXtrIeDNwTTSYuvryvOjF3b99yRYkaND3GB80XrXPRmXRbYmL53krDDwjxkZyxuFTd9gx0zS1Tag2f3N3sq4g6bZoxWp22+FAI2iNlycx0HcMJN2uWF0yl1WqtkrKr12zKVJlfLUh4pq7hebslfEvOZ+TDP69lZVMAmdpMU7N3VTQyBcwdVAsqnjU4UkaPmhgRltknaeBUY1aZDM0Xyyoh7abiz3IjLyAZoP4Ea89kFd3uiNuEO00UhLhYSYBlZGBjkXAwekFjGB0B191dEypPc25vp213T59/TdBhhP0o2TjduSsOa5cdQShubNTGWTY2+/fk8qUqFjYqt/Y8XS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tcX4Ju0JmFWsYM985UnhUMVbSAcWXikb/s27I8/vuk=;
 b=l2vQkPjD2T0e9P99SyRTnpTnFHmQ6tOWAc430oX5Ampu02Nkd7SBP/MA4bPitTrLLRscq1eKe+Xhlrn/suee+OhVu/KY/0/alNNrdWjWvkXMqBGgs23G6s6nsib5fWzizhnYMeDjhmOS1BGIilolQbkmKR24ZtszxbEwpgZHFDtocw/Re/fMNhQ2QT53cIiQYUuJVW51XMeCxSwlnTZr870UonJC4PTi0VWsL6OY32kHZTMHI26NbZlq+lJyvbMLZL6JG191HoCf+ize6biytR7pigpiRMiYP1/FjrfDNS0C8PSg5IFTSeHQRuDsddDBhUSNU1Je2F5SGWGuFBIQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tcX4Ju0JmFWsYM985UnhUMVbSAcWXikb/s27I8/vuk=;
 b=BwInhWDnSERsp50RQ+izE9vMG02Hu/TlfqACXHSS5eTKDmED2L6M2qhXDTPkmCICM7FGppt4EoBfDHyWQJKIm0I5HyxrzpT7rE+xb3o5cJSMN8QJ4qowCKLPgJjMO2z2ENsQSmJCWq5iR73XmPjm8EZAHEwUngJ/IPoLb6eS5v4=
Received: from MW4PR04CA0308.namprd04.prod.outlook.com (2603:10b6:303:82::13)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 05:16:25 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::45) by MW4PR04CA0308.outlook.office365.com
 (2603:10b6:303:82::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 05:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 05:16:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 00:16:24 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 00:16:24 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Conor Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: xlnx: add firmware-name property
Date: Tue, 26 May 2026 22:16:10 -0700
Message-ID: <20260527051611.194844-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527051611.194844-1-tanmay.shah@amd.com>
References: <20260527051611.194844-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3ea08e-214c-4d61-bc3b-08debbaf1961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	45OHDXju9696xjnrp8doma3llfPv50KaT5F2x+j9/XTMrb72nqBu5Hkg6XnQCiN/XdrUuqpiqHPgKkHk6gy6HfQo1WuaKMohGPnYxtHs+egIsKu2pb8VaOVXExItiS3WC8ixotOoZpLcBQtgKZdfpLPNsyHfKGWYPx9JvCvE96SMo4Al1TDPt2DxOs8VPFUbB5GtoZJajTn2k4o+mXWHDktvRR/FZzQWbKENaKRM0v8dw/qFcmzZJ6Ea0BHymHA+4LY0bIRm8VOyEMc87HPrTa6eBd7pit9kCi05NHaV2w9Iq2C15vb/QvO33bDc3RHh3kq7XVYDfPy/nXXDzAzcrMVSZCivW4TBCCNthL5Khe3fbd3/0kpE3mGlBndsgz3VwoQzzJiGFx7HLVYz6FnY3o4+gENykoRHfA0qndrBCBxwr2RVeoggW8l2S+VyGSm+qmmxoi1g7xkwY00AW6vWCNpJzTjo86XRLQCYFSdqFQaIyQobzyiD/urYuCr/a4MCNN/NwMoo3Pg+l0HjNl9cJ/K/L5KhzBF4gVvSMpuSlk24FJEXMIPzTaYFSOp+d3M0vI02cl+HZnzM7zr+d1Cf9X3R8T4x08jIiAyrqGMQlFAOoxWnR5CzaPC8wjb32SmGjNTFCwCA6AWwAxp5PH+d6YGJx5z2Khw9cJ+jq4kWArm5ondsZEBLv9bHe0GbJc0H3C0ArUG39VQxJgboQxw2CUmDB0war2ovEYDkOEkVPjU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S2uPAWwChEyveZp72hYk8cwWK/4RgK9SJ3DZQ0qVqpd8vs30d826WVr+ZFwVTVEzoHkqn24RDZo0jevkF16w0u6dutZD1oFP67TarrNKRAY77iQtUN0b4MHfTzTs+rSprAHrRXCuPm5qz6saSSSzWFgkQn0V3GftdpRRrdwAxE0ifpKL68ZZABYDef4UCrQz58gCXZ5/pU3LJIIrleUWtd3AM5PUcSKWhJHZtfbiop6/sG4EjfjvSbty9EdPZFOcyG2okSxHMlGujptT2d2BjDw12fCHtvtq5uZKUHLE5YxGsHuO0QPCRU2aldFrbAUTxcWGbtnZXXglbH/Z578LYufF2QV84YZGHP0vtM0smrRrYmW4yPMLgOZn7hwfZvZSOU4W8K+LxIzA5jcjpfZdOJ9HSbiuKm8NbqFCFpbRlCiGShPz/jtbgNj2o0vp2JuR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:16:25.1866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3ea08e-214c-4d61-bc3b-08debbaf1961
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575

The firmware-name property indicates which firmware to load on RPU
during the Linux boot time. It is possible to stop the RPU after boot
and load different firmware and start RPU.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

